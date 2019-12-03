Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EE56E84B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2019 16:24:29 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191203153555.12948-1-ville.syrjala@linux.intel.com>
 <20191203153555.12948-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20191203153555.12948-2-ville.syrjala@linux.intel.com>
Message-ID: <157539026467.9581.7951525962875593096@skylake-alporthouse-com>
Date: Tue, 03 Dec 2019 16:24:24 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/igt_kms: Don't leak fds when
 forcing connector multiple times
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTEyLTAzIDE1OjM1OjUzKQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gQ2xvc2UgdGhl
IG5ldyBzeXNmcyBkaXJlY3RvcnkgZmQgd2hlbiB3ZSd2ZSBhbHJlYWR5IGZvcmNlZAo+IHRoZSBz
YW1lIGNvbm5lY3RvciBwcmV2aW91c2x5LiBDdXJyZW50bHkgd2UncmUgbGVha2luZyB0aGUgZmQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9rbXMuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGli
L2lndF9rbXMuYwo+IGluZGV4IDc0YWU5OGQ3NzRmMS4uYmExNjU3ZDA2ZDQ1IDEwMDY0NAo+IC0t
LSBhL2xpYi9pZ3Rfa21zLmMKPiArKysgYi9saWIvaWd0X2ttcy5jCj4gQEAgLTEwNzUsNiArMTA3
NSw4IEBAIGJvb2wga21zdGVzdF9mb3JjZV9jb25uZWN0b3IoaW50IGRybV9mZCwgZHJtTW9kZUNv
bm5lY3RvciAqY29ubmVjdG9yLAo+ICAgICAgICAgaWYgKGxlbiAhPSAtMSAmJiBsZW4gPCBNQVhf
Q09OTkVDVE9SUykgewo+ICAgICAgICAgICAgICAgICBmb3JjZWRfY29ubmVjdG9yc1tsZW5dID0g
cGF0aDsKPiAgICAgICAgICAgICAgICAgZm9yY2VkX2Nvbm5lY3RvcnNfZGV2aWNlW2xlbl0gPSBk
aXI7Cj4gKyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBjbG9zZShkaXIpOwo+ICAg
ICAgICAgfQoKT24gaWd0X2RldmljZV9nZXRfY2FyZF9pbmRleCgpIGZhaWwgdGhlcmUncyBhbHNv
IGEgbGVhay4KClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
