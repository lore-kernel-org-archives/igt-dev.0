Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00DD88EA3
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2019 12:52:50 +0000 (UTC)
Date: Tue, 9 Apr 2019 15:52:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190409125247.GM3888@intel.com>
References: <20190409122930.4262-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190409122930.4262-1-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Check
 supported pixel format
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDM6Mjk6MzBQTSArMDMwMCwgTWlrYSBLYWhvbGEgd3Jv
dGU6Cj4gTGV0J3MgYWRkIGEgY2hlY2sgZm9yIHN1cHBvcnRlZCBwaXhlbCBmb3JtYXQuIE90aGVy
d2lzZSwgd2UgZmFpbCB0aGUgdGVzdCwKPiBmb3IgZXhhbXBsZSwgd2l0aCB0aGUgZm9sbG93aW5n
IGVycm9yIG1lc3NhZ2UKPiAKPiAiW2RybTppbnRlbF9mcmFtZWJ1ZmZlcl9pbml0IFtpOTE1XV0g
dW5zdXBwb3J0ZWQgcGl4ZWwgZm9ybWF0IFkyMTAgbGl0dGxlLWVuZGlhbgo+ICgweDMwMzEzMjU5
KSAvIG1vZGlmaWVyIDB4MTAwMDAwMDAwMDAwMDAzIgo+IAo+IEJ1Z3ppbGxhOiBodHRwczovL2J1
Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTAzNjkKPiBTaWduZWQtb2ZmLWJ5
OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cgo+IC0tLQo+ICB0ZXN0
cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmVf
c2NhbGluZy5jIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+IGluZGV4IGJiMTRiMmNkLi5l
ODQzYmY4NiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCj4gKysrIGIv
dGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+IEBAIC0yMzIsNyArMjMyLDggQEAgc3RhdGljIHZv
aWQgdGVzdF9zY2FsZXJfd2l0aF9waXhlbF9mb3JtYXRfcGlwZShkYXRhX3QgKmQsIGVudW0gcGlw
ZSBwaXBlLCBpZ3Rfb3UKPiAgCQkJZm9yIChpbnQgaiA9IDA7IGogPCBwbGFuZS0+ZHJtX3BsYW5l
LT5jb3VudF9mb3JtYXRzOyBqKyspIHsKPiAgCQkJCXVpbnQzMl90IGZvcm1hdCA9IHBsYW5lLT5k
cm1fcGxhbmUtPmZvcm1hdHNbal07Cj4gIAo+IC0JCQkJaWYgKGlndF9mYl9zdXBwb3J0ZWRfZm9y
bWF0KGZvcm1hdCkpCj4gKwkJCQlpZiAoaWd0X2ZiX3N1cHBvcnRlZF9mb3JtYXQoZm9ybWF0KSAm
Jgo+ICsJCQkJICAgIGlndF9wbGFuZV9oYXNfZm9ybWF0X21vZChwbGFuZSwgZm9ybWF0LCB0aWxp
bmcpKQo+ICAJCQkJCWNoZWNrX3NjYWxpbmdfcGlwZV9wbGFuZV9yb3QoZCwgcGxhbmUsCj4gIAkJ
CQkJCQkJICAgICBmb3JtYXQsIHRpbGluZywKPiAgCQkJCQkJCQkgICAgIHBpcGUsIG91dHB1dCwg
SUdUX1JPVEFUSU9OXzApOwo+IC0tIAo+IDIuMTcuMQoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
