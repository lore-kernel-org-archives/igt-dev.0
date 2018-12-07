Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181207140405.15259-1-tvrtko.ursulin@linux.intel.com>
References: <20181207101453.25199-1-tvrtko.ursulin@linux.intel.com>
 <20181207140405.15259-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <154419159695.11001.8180220808512844171@skylake-alporthouse-com>
Date: Fri, 07 Dec 2018 14:06:37 +0000
Subject: Re: [igt-dev] [Intel-gfx] [RFT i-g-t 1/2] tests/gem_shrink:
 Background, direct and OOM shrinker plus userptr tests
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0xMi0wNyAxNDowNDowNSkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IC4uLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gLS0t
Cj4gIGxpYi9pZ3RfY29yZS5jICAgICAgICAgIHwgIDE4ICsrKwo+ICBsaWIvaWd0X2NvcmUuaCAg
ICAgICAgICB8ICAgMSArCj4gIHRlc3RzL2k5MTUvZ2VtX3Nocmluay5jIHwgMjk5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMTgg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2NvcmUuYyBiL2xpYi9pZ3Rf
Y29yZS5jCj4gaW5kZXggNjQ4ODNkNjQwMmFmLi5kOGZhMGM4M2UyNzkgMTAwNjQ0Cj4gLS0tIGEv
bGliL2lndF9jb3JlLmMKPiArKysgYi9saWIvaWd0X2NvcmUuYwo+IEBAIC0xNjgwLDYgKzE2ODAs
MjQgQEAgdm9pZCBpZ3Rfc3RvcF9oZWxwZXIoc3RydWN0IGlndF9oZWxwZXJfcHJvY2VzcyAqcHJv
YykKPiAgICAgICAgIGFzc2VydChoZWxwZXJfd2FzX2FsaXZlKHByb2MsIHN0YXR1cykpOwo+ICB9
Cj4gIAo+ICsvKioKPiArICogaWd0X3RyeV9zdG9wX2hlbHBlcjoKPiArICogQHByb2M6ICNpZ3Rf
aGVscGVyX3Byb2Nlc3Mgc3RydWN0dXJlCj4gKyAqCj4gKyAqIFRlcm1pbmF0ZXMgYSBoZWxwZXIg
cHJvY2VzcyBpZiBpdCBpcyBzdGlsbCBydW5uaW5nLgo+ICsgKi8KPiArdm9pZCBpZ3RfdHJ5X3N0
b3BfaGVscGVyKHN0cnVjdCBpZ3RfaGVscGVyX3Byb2Nlc3MgKnByb2MpCgpHZW5lcmFsIHRob3Vn
aHRsZXNzIGNvbW1lbnQgYWJvdXQgdHJ5X2Z1bmMgaXMgdGhhdCB1c3VhbGx5IHJlcG9ydCBhCmJv
b2wuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
