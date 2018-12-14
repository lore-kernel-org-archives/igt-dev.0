Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC7C6F4CE
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 13:30:54 +0000 (UTC)
References: <20181211180647.23186-1-lionel.g.landwerlin@intel.com>
 <20181211180647.23186-2-lionel.g.landwerlin@intel.com>
 <CAM0jSHOG4jcZkgWLhs=b6K+a8sas1x+PD0LxXwjnomjGZ2-HYg@mail.gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <9f00684f-33ec-174f-c90a-4192803b5fc8@intel.com>
Date: Fri, 14 Dec 2018 13:30:52 +0000
MIME-Version: 1.0
In-Reply-To: <CAM0jSHOG4jcZkgWLhs=b6K+a8sas1x+PD0LxXwjnomjGZ2-HYg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/perf: polling: fix
 uninitialized start_times
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTQvMTIvMjAxOCAxMTo1OCwgTWF0dGhldyBBdWxkIHdyb3RlOgo+IE9uIFR1ZSwgMTEgRGVj
IDIwMTggYXQgMTg6MDYsIExpb25lbCBMYW5kd2VybGluCj4gPGxpb25lbC5nLmxhbmR3ZXJsaW5A
aW50ZWwuY29tPiB3cm90ZToKPj4gTm90IHF1aXRlIHN1cmUgaG93IHRoYXQgZmVsbCB0aHJvdWdo
IHRoZSBjcmFja3MgZm9yIHNvIGxvbmcuLi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTGlvbmVsIExh
bmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgo+PiBCdWd6aWxsYTogaHR0
cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTAyMjUyCj4gSXQgbG9v
a3MgbGlrZSB3ZSBpbml0aWFsaXplIGl0IGVhcmxpZXIgOikKCgpJIGNhbid0IHNlZSB3aGVyZSA6
fAoKVW5sZXNzIGl0J3MgaW4gdGhlIHRlc3RfYmxvY2tpbmcoKSB3aGljaCBpcyBhIGRpZmZlcmVu
dCB0ZXN0LgoKCj4KPj4gLS0tCj4+ICAgdGVzdHMvcGVyZi5jIHwgMSArCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0cy9wZXJmLmMgYi90
ZXN0cy9wZXJmLmMKPj4gaW5kZXggMjIwYzUyZWYuLjU0ZTdmNGY0IDEwMDY0NAo+PiAtLS0gYS90
ZXN0cy9wZXJmLmMKPj4gKysrIGIvdGVzdHMvcGVyZi5jCj4+IEBAIC0yMjMwLDYgKzIyMzAsNyBA
QCB0ZXN0X3BvbGxpbmcodm9pZCkKPj4gICAgICAgICAgICogdGhlIGVycm9yIGRlbHRhLgo+PiAg
ICAgICAgICAgKi8KPj4gICAgICAgICAgc3RhcnQgPSBnZXRfdGltZSgpOwo+PiArICAgICAgIHRp
bWVzKCZzdGFydF90aW1lcyk7Cj4+ICAgICAgICAgIGRvX2lvY3RsKHN0cmVhbV9mZCwgSTkxNV9Q
RVJGX0lPQ1RMX0VOQUJMRSwgMCk7Cj4+ICAgICAgICAgIGZvciAoLyogbm9wICovOyAoKGVuZCA9
IGdldF90aW1lKCkpIC0gc3RhcnQpIDwgdGVzdF9kdXJhdGlvbl9uczsgLyogbm9wICovKSB7Cj4+
ICAgICAgICAgICAgICAgICAgc3RydWN0IHBvbGxmZCBwb2xsZmQgPSB7IC5mZCA9IHN0cmVhbV9m
ZCwgLmV2ZW50cyA9IFBPTExJTiB9Owo+PiAtLQo+PiAyLjIwLjAucmMyCj4+Cj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGlndC1kZXYgbWFpbGlu
ZyBsaXN0Cj4+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
