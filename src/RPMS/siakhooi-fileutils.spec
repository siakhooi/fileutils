Name:           siakhooi-fileutils
Version:        0.6.0
Release:        1%{?dist}
Summary:        common file utils

License:        MIT
URL:            https://github.com/siakhooi/fileutils
Source0:        https://github.com/siakhooi/%{name}/archive/refs/tags/${version}.tar.gz
BuildArch:      noarch

Requires:       bash, coreutils

%description
common file utils

%install
%{__mkdir}   -v -p %{buildroot}%{_bindir}
%{__mkdir}   -v -p %{buildroot}/usr/share/licenses/siakhooi-fileutils
%{__install} -v -m 0755 %{_topdir}/BUILD/usr/bin/* %{buildroot}%{_bindir}
%{__install} -v -m 644  %{_topdir}/BUILD/LICENSE                 %{buildroot}/usr/share/licenses/siakhooi-fileutils

%files
%license LICENSE
%{_bindir}/assert-files
%{_bindir}/delete-directory-if-empty
%{_bindir}/find-files
%{_bindir}/is-not-empty
%{_bindir}/nested-files-list

%changelog
* Sun Apr 12 2026 Siak Hooi <siakhooi@gmail.com> - 0.6.0
- assert-files add -s silent mode

* Wed Dec 17 2025 Siak Hooi <siakhooi@gmail.com> - 0.5.0
- add assert-files

* Mon Nov 24 2025 Siak Hooi <siakhooi@gmail.com> - 0.4.0
- add find-files

* Thu Nov 13 2025 Siak Hooi <siakhooi@gmail.com> - 0.3.0
- add is-not-empty

* Wed Oct 15 2025 Siak Hooi <siakhooi@gmail.com> - 0.2.0
- add delete-directory-if-empty

* Sun Sep 28 2025 Siak Hooi <siakhooi@gmail.com> - 0.1.0
- initial version
