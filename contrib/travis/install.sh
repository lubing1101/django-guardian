#!/bin/bash
pip install -U pip six

# Array of packages
PACKAGES=('mock==1.0.1' 'pytest' 'pytest-django' 'pytest-cov' 'django-environ' 'setuptools_scm')
# Install django master or version
if [[ "$DJANGO_VERSION" == 'master' ]]; then 
    PACKAGES+=('https://github.com/django/django/archive/master.tar.gz');
else
    PACKAGES+=("Django==$DJANGO_VERSION");
fi;

# Install database drivers
if [[ $DATABASE_URL = postgres* ]]; then 
    PACKAGES+=('psycopg2==2.7.1');
fi;

if [[ $DATABASE_URL = mysql* ]]; then
    PACKAGES+=('mysqlclient==1.3.10');
fi;
echo "Install " ${PACKAGES[*]};
pip install ${PACKAGES[*]};
