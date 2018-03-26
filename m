Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6DD89736
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Mar 2018 13:22:59 +0000 (UTC)
References: <20180326062907.15181-1-marta.lofstedt@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <0bbda7f6-5b44-a14d-6ace-ca3b506756e5@linux.intel.com>
Date: Mon, 26 Mar 2018 15:22:56 +0200
MIME-Version: 1.0
In-Reply-To: <20180326062907.15181-1-marta.lofstedt@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] blacklist: Don't run DRRS test on Intel
 CI system
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Marta Lofstedt <marta.lofstedt@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjYtMDMtMTggb20gMDg6Mjkgc2NocmVlZiBNYXJ0YSBMb2ZzdGVkdDoKPiBTa2lwcGluZyB0
YWtlcyB0aW1lLCBzcGVjaWZpY2FsbHkgZm9yIHRoZSBiaWcgYW1vdW50IG9mIGRycnMKPiByZWxh
dGVkIGttc19mcm9udGJ1ZmZlcl90cmFja2luZyB0ZXN0cy4gU2luY2Ugd2UgY3VycmVudGx5Cj4g
ZG9uJ3QgaGF2ZSBhbnkgc3lzdGVtIHNldCB1cCB3aXRoIERSUlMgcGFuZWxzLCBibGFja2xpc3Rp
bmcKPiBhbGwgdGhvc2UgdGVzdCB3aWxsIHNhdmUgdGltZSwgYW5kIHdlIGNhbiBhdm9pZCB0aGUg
bmVlZCB0bwo+IGluY3JlYXNlIHRoZSBKZW5raW5zIHRpbWVvdXQgaW4gb3JkZXIgdG8gc29sdmUg
dGhlIEJ1Z3ppbGxhCj4gYmVsb3cuCj4KPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNr
dG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NjE3Cj4gU2lnbmVkLW9mZi1ieTogTWFydGEgTG9m
c3RlZHQgPG1hcnRhLmxvZnN0ZWR0QGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvaW50ZWwtY2kv
YmxhY2tsaXN0LnR4dCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+
IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0IGIvdGVzdHMvaW50ZWwt
Y2kvYmxhY2tsaXN0LnR4dAo+IGluZGV4IDdjYTMxM2FjLi4wYTg1MDZjYSAxMDA2NDQKPiAtLS0g
YS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0Cj4gKysrIGIvdGVzdHMvaW50ZWwtY2kvYmxh
Y2tsaXN0LnR4dAo+IEBAIC01Nyw2ICs1Nyw3IEBAIGlndEBnZW1fdGlsZWRfc3dhcHBpbmdAKD8h
bm9uLXRocmVhZGVkKS4qCj4gIGlndEBnZW1fdXNlcnB0cl9ibGl0c0AobWFqb3J8bWlub3J8Zm9y
a2VkfG1sb2NrZWR8c3dhcHBpbmcpLioKPiAgaWd0QGdlbV93YWl0QC4qaGFuZy4qCj4gIGlndEBn
ZW1fd3JpdGVfcmVhZF9yaW5nX3N3aXRjaChALiopPwo+ICtpZ3RAa21zX2Zyb250YnVmZmVyX3Ry
YWNraW5nQC4qZHJycyoKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiAgIyBCcm9hZGNvbQo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwpIbSBhIHNpbmdsZSBza2lwcGVkIHRlc3Qgc2hvdWxkIHRha2UgYWJv
dXQgMTAwIG1zLCBidXQgSSBkbyBub3RpY2Ugd2UgcHJvYmUgYWxsIG91dHB1dHMgaW4gaWd0X2Rp
c3BsYXlfaW5pdCwgc28gY291bGQgdGhpcyBhbHNvIGJlIGZpeGVkIGJ5IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8yMTI5ODMvID8KVGhpcyBzaG91bGQgcmVkdWNlIHBy
b2JpbmcgdG8gdGhlIG1pbmltdW0uCgp+TWFhcnRlbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
