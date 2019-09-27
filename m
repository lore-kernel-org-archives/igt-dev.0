Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289996E146
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2019 13:43:47 +0000 (UTC)
References: <1569235233-15674-1-git-send-email-juhapekka.heikkila@gmail.com>
 <1569235233-15674-2-git-send-email-juhapekka.heikkila@gmail.com>
 <20190923124337.GH1208@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <5317b00a-b266-3f18-a9be-3797d7d0a23d@gmail.com>
Date: Fri, 27 Sep 2019 16:43:43 +0300
MIME-Version: 1.0
In-Reply-To: <20190923124337.GH1208@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Add over 32k HW
 stride tests
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
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjMuOS4yMDE5IDE1LjQzLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gTW9uLCBTZXAg
MjMsIDIwMTkgYXQgMDE6NDA6MzNQTSArMDMwMCwgSnVoYS1QZWtrYSBIZWlra2lsYSB3cm90ZToK
Pj4gT24gSUNMIHdoZW4gdXNpbmcgNjRicHAgZm9ybWF0cyBzdHJpZGVzIGNhbiByZWFjaCB1cCB0
bwo+PiA2NGsuIFRoZXNlIHRlc3QgdHJ5IGV4YWN0IG1heGltdW0gSFcgc3RyaWRlcyBzbyBndHQK
Pj4gcmVtYXBwaW5nIHdpbGwgbm90IGNvbWUgaW4gcGxheS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
SnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KPj4gLS0t
Cj4+ICAgdGVzdHMva21zX2JpZ19mYi5jIHwgMTAzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEwMyBpbnNl
cnRpb25zKCspCj4gCj4gSSBiZWxpZXZlIGFsbCB5b3Ugc2hvdWxkIG5lZWQgaXMgc29tZXRoaW5n
IGxpa2U6Cj4gCj4gLS0tIGEvdGVzdHMva21zX2JpZ19mYi5jCj4gKysrIGIvdGVzdHMva21zX2Jp
Z19mYi5jCj4gQEAgLTE2MSw5ICsxNjEsNiBAQCBzdGF0aWMgdm9pZCBtYXhfZmJfc2l6ZShkYXRh
X3QgKmRhdGEsIGludCAqd2lkdGgsIGludCAqaGVpZ2h0LAo+ICAgCXVpbnQ2NF90IHNpemU7Cj4g
ICAJaW50IGkgPSAwOwo+ICAgCj4gLQkqd2lkdGggPSBkYXRhLT5tYXhfZmJfd2lkdGg7Cj4gLQkq
aGVpZ2h0ID0gZGF0YS0+bWF4X2ZiX2hlaWdodDsKPiAtCj4gICAJLyogbWF4IGZlbmNlIHN0cmlk
ZSBpcyBvbmx5IDhrIGJ5dGVzIG9uIGdlbjMgKi8KPiAgIAlpZiAoaW50ZWxfZ2VuKGRhdGEtPmRl
dmlkKSA8IDQgJiYKPiAgIAkgICAgZm9ybWF0ID09IERSTV9GT1JNQVRfWFJHQjg4ODgpCj4gQEAg
LTQxNSw4ICs0MTIsMTYgQEAgc3RhdGljIGJvb2wgdGVzdF9waXBlKGRhdGFfdCAqZGF0YSkKPiAg
IAlyZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4gLXN0YXRpYyB2b2lkIHRlc3Rfc2Nhbm91dChkYXRh
X3QgKmRhdGEpCj4gK3N0YXRpYyB2b2lkIHRlc3Rfc2Nhbm91dChkYXRhX3QgKmRhdGEsIGJvb2wg
dGVzdF9tYXhfaHdfc3RyaWRlKQo+ICAgewo+ICsJaWYgKHRlc3RfbWF4X2h3X3N0cmlkZSkgewo+
ICsJCWRhdGEtPmJpZ19mYl93aWR0aCA9IEJJRzsKPiArCQlkYXRhLT5iaWdfZmJfaGVpZ2h0ID0g
QklHOwo+ICsJfSBlbHNlIHsKPiArCQlkYXRhLT5iaWdfZmJfd2lkdGggPSBkYXRhLT5tYXhfZmJf
d2lkdGg7Cj4gKwkJZGF0YS0+YmlnX2ZiX2hlaWdodCA9IGRhdGEtPm1heF9mYl9oZWlnaHQ7Cj4g
Kwl9Cj4gKwo+ICAgCW1heF9mYl9zaXplKGRhdGEsICZkYXRhLT5iaWdfZmJfd2lkdGgsICZkYXRh
LT5iaWdfZmJfaGVpZ2h0LAo+ICAgCQkgICAgZGF0YS0+Zm9ybWF0LCBkYXRhLT5tb2RpZmllcik7
Cj4gICAKPiAKCkRvaW5nIHRlc3QgdGhpcyB3YXkgd2lsbCB0cnkgJ2J1bmNoIG9mIGNvb3JkaW5h
dGVzIHB1bGxlZCBvdXQgb2YgdGhpbiAKYWlyJyAoYXMgc3RhdGVkIGluIHRoZSBjb2RlIDopICkg
YnV0IG15IHZlcnNpb24gdHJpZXMgdGhlIGV4cGxpY2l0IAptYXhpbXVtIGxpbWl0cyB3aXRoIGlk
ZWEgaWYgdGhhdCB3b3JrcyB0aGVuIGFueSBvdGhlciBjb29yZGluYXRlIHdvdWxkIAp3b3JrIGFz
IHdlbGwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
