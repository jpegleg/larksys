Name:           larksys
Version:        0
Release:        0
Summary:        template

Group:          jpegleg
License:        MIT
URL:            https://github.com/jpegleg/larksys
Source0:        larksys.tgz

%description
Template description.

%prep
%build
%install
mkdir -p $RPM_BUILD_ROOT/usr/bin/
mkdir -p $RPM_BUILD_ROOT/etc/systemd/system/
install -m 0755 SOURCES/larksys $RPM_BUILD_ROOT/usr/bin/
install -m 0755 SOURCES/larksys.service $RPM_BUILD_ROOT/etc/systemd/system/

%files
/usr/bin/larksys
/etc/systemd/system/larksys.service

%changelog
* Sun May 7 2023 0.0.1
  - starting packaging for rpm
