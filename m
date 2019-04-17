Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AB36E06C
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 14:49:09 +0000 (UTC)
Message-ID: <d725813c4f54ba83b26393f8af47fef2b64bec7a.camel@intel.com>
From: Caz Yokoyama <Caz.Yokoyama@intel.com>
Date: Wed, 17 Apr 2019 07:49:35 -0700
In-Reply-To: <20190417081258.GN22949@platvala-desk.ger.corp.intel.com>
References: <d7db4af933e3f86f7d589517dd4de05a7d46eb54.1555430163.git.caz.yokoyama@intel.com>
 <20190417081258.GN22949@platvala-desk.ger.corp.intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/1] lib: consolidate duplicated define of
 vfs_file_max(void)
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UGV0cmksClRvIHdoZXJlIERvY3VtZW50YXRpb24gZ29lcyB0bz8gVG8gY29tbWl0IG1lc3NhZ2U/
IFRvIG9uZSBvZiB0aGUgZmlsZXMKaW4gZG9jcyBkaXJlY3Rvcnk/IG1hbiBkaXJlY3Rvcnk/Ckl0
IG1heSBiZSBvYnZpb3VzIGZvciB5b3UsIGJ1dCBwbGVhc2UgY2xhcmlmeSBmb3IgY2xlYXIgdW5k
ZXJzdGFuZGluZwpvbiBib3RoIG9mIHVzLgpUaGFuayB5b3UuCi1jYXoKCk9uIFdlZCwgMjAxOS0w
NC0xNyBhdCAxMToxMiArMDMwMCwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiBPbiBUdWUsIEFwciAx
NiwgMjAxOSBhdCAwODo1NzozNUFNIC0wNzAwLCBDYXogWW9rb3lhbWEgd3JvdGU6Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDYXogWW9rb3lhbWEgPGNhei55b2tveWFtYUBpbnRlbC5jb20+Cj4gPiBDYzog
QXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAg
bGliL2lndF9hdXguYyAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPiA+ICBsaWIv
aWd0X2F1eC5oICAgICAgICAgICAgICAgfCAgMiArKwo+ID4gIGxpYi9pbnRlbF9vcy5jICAgICAg
ICAgICAgICB8IDE0IC0tLS0tLS0tLS0tLS0tCj4gPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19yZXVz
ZS5jIHwgMTQgKy0tLS0tLS0tLS0tLS0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDI3IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9hdXgu
YyBiL2xpYi9pZ3RfYXV4LmMKPiA+IGluZGV4IDA1NTI4MzUyLi5hYzMzODc1ZSAxMDA2NDQKPiA+
IC0tLSBhL2xpYi9pZ3RfYXV4LmMKPiA+ICsrKyBiL2xpYi9pZ3RfYXV4LmMKPiA+IEBAIC0xNjE1
LDMgKzE2MTUsMTcgQEAgYm9vbCBpZ3RfYWxsb3dfdW5saW1pdGVkX2ZpbGVzKHZvaWQpCj4gPiAg
CXJsaW0ucmxpbV9tYXggPSBub2ZpbGVfcmxpbTsKPiA+ICAJcmV0dXJuIHNldHJsaW1pdChSTElN
SVRfTk9GSUxFLCAmcmxpbSkgPT0gMDsKPiA+ICB9Cj4gPiArCj4gPiArdWludDY0X3QgdmZzX2Zp
bGVfbWF4KHZvaWQpCj4gPiArewo+ID4gKwlzdGF0aWMgbG9uZyBsb25nIHVuc2lnbmVkIG1heDsK
PiA+ICsJaWYgKG1heCA9PSAwKSB7Cj4gPiArCQlGSUxFICpmaWxlID0gZm9wZW4oIi9wcm9jL3N5
cy9mcy9maWxlLW1heCIsICJyIik7Cj4gPiArCQltYXggPSA4MDAwMDsKPiA+ICsJCWlmIChmaWxl
KSB7Cj4gPiArCQkJaWd0X2Fzc2VydChmc2NhbmYoZmlsZSwgIiVsbHUiLCAmbWF4KSA9PSAxKTsK
PiA+ICsJCQlmY2xvc2UoZmlsZSk7Cj4gPiArCQl9Cj4gPiArCX0KPiA+ICsJcmV0dXJuIG1heDsK
PiA+ICt9Cj4gCj4gCj4gRG9jdW1lbnRhdGlvbiBmb3IgZnVuY3Rpb25zIGFkZGVkIHRvIGxpYiwg
cGxlYXNlLgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
