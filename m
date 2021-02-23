Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4FB6EA0F
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 17:56:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id i7so2024599wmb.0
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 09:56:52 -0800 (PST)
References: <20210223134924.10045-1-ville.syrjala@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <f7f12a98-d396-fb77-0838-909a37db9b74@gmail.com>
Date: Tue, 23 Feb 2021 19:56:43 +0200
MIME-Version: 1.0
In-Reply-To: <20210223134924.10045-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rmfb: Use
 COMMIT_UNIVERSAL for overlay/cursor planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VG9vayBhIHdoaWxlIHRvIGNvbXByZWhlbmQgdGhvc2UgY29kZSBwYXRocyBidXQgbG9vayBvayB0
byBtZS4KClJldmlld2VkLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tp
bGFAZ21haWwuY29tPgoKT24gMjMuMi4yMDIxIDE1LjQ5LCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+
IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4g
Cj4gVXNpbmcgQ09NTUlUX0xFR0FDWSBmb3IgdGhlIGN1cnNvciBwbGFuZSBtYWtlcyB0aGUgdGVz
dCBmYWlsCj4gYmVjYXVzZSB0aGUgY3Vyc29yIGZyYW1lYnVmZmVyIGlzIG5ldmVyIGhhbmRlZCBv
dmVyIHRvIHRoZQo+IGtlcm5lbCwgYW5kIGluc3RlYWQgb25seSB0aGUgQk8gZ2V0cyBwYXNzZWQg
aW4gdmlhIHRoZQo+IGxlZ2FjeSBjdXJzb3IgaW9jdGwuIFRodXMgdGhlIHJtZmIgaW9jdGwgd2ls
bCBub3QgdHVybiBvZmYKPiB0aGUgY3Vyc29yIHBsYW5lIHNpbmNlIHRoZSBrZXJuZWwgaXMgdXNp
bmcgYW4gaW50ZXJuYWwgZmIKPiBmb3IgdGhlIGN1cnNvci4gTGV0J3MgYXZvaWQgdGhhdCBieSB0
cmVhdGluZyB0aGUgY3Vyc29yIGFzCj4ganVzdCBhbm90aGVyIHVuaXZlcnNhbCBwbGFuZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgo+IC0tLQo+ICAgdGVzdHMva21zX3JtZmIuYyB8IDYgKysrKy0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS90ZXN0cy9rbXNfcm1mYi5jIGIvdGVzdHMva21zX3JtZmIuYwo+IGluZGV4IDgxOTMyZTBkODMw
Yy4uMmQ0OWJlOGVhMzk5IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19ybWZiLmMKPiArKysgYi90
ZXN0cy9rbXNfcm1mYi5jCj4gQEAgLTg3LDggKzg3LDEwIEBAIHRlc3Rfcm1mYihzdHJ1Y3Qgcm1m
Yl9kYXRhICpkYXRhLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgZW51bSBwaXBlIHBpcGUsIGJvb2wg
cmVvCj4gICAJCQlpZ3RfcGxhbmVfc2V0X2ZiKHBsYW5lLCAmZmIpOwo+ICAgCQl9Cj4gICAKPiAt
CQlpZiAoaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIGRhdGEtPmRpc3Bs
YXkuaXNfYXRvbWljID8KPiAtCQkJCQkgICAgQ09NTUlUX0FUT01JQyA6IENPTU1JVF9MRUdBQ1kp
KSB7Cj4gKwkJaWYgKGlndF9kaXNwbGF5X3RyeV9jb21taXQyKCZkYXRhLT5kaXNwbGF5LAo+ICsJ
CQkJCSAgICBkYXRhLT5kaXNwbGF5LmlzX2F0b21pYyA/IENPTU1JVF9BVE9NSUMgOgo+ICsJCQkJ
CSAgICBwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9QUklNQVJZID8KPiArCQkJCQkgICAg
Q09NTUlUX0xFR0FDWSA6IENPTU1JVF9VTklWRVJTQUwpKSB7Cj4gICAJCQkvKgo+ICAgCQkJICog
RGlzYWJsZSBhbnkgcGxhbmUgdGhhdCBmYWlscyAocHJlc3VtYWJseQo+ICAgCQkJICogZHVlIHRv
IGV4Y2VlZGluZyBzb21lIGhhcmR3YXJlIGxpbWl0KS4KPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
