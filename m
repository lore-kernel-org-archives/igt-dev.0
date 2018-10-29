Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A720589C6C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 06:50:01 +0000 (UTC)
References: <20181026141443.17173-1-daniel.vetter@ffwll.ch>
From: "C, Ramalingam" <ramalingam.c@intel.com>
Message-ID: <35def92a-f696-6311-1993-0bc187a7f83b@intel.com>
Date: Mon, 29 Oct 2018 12:19:55 +0530
MIME-Version: 1.0
In-Reply-To: <20181026141443.17173-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: restore
 for real before failing
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTAvMjYvMjAxOCA3OjQ0IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE5vdGhpbmcgaGFw
cGVucyBpZiB5b3UgZG9uJ3QgY29tbWl0IC4uLgo+Cj4gQnVnemlsbGE6IGh0dHBzOi8vYnVncy5m
cmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwODU1MAo+IEJ1Z3ppbGxhOiBodHRwczov
L2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDg1NDkKPiBDYzogUmFtYWxp
bmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQo+ICAgdGVzdHMva21zX2NvbnRl
bnRfcHJvdGVjdGlvbi5jIHwgNSArKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY29udGVudF9w
cm90ZWN0aW9uLmMgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMKPiBpbmRleCA4N2M3
YTlhYmQzOGEuLjA2MGEwMGY5NWQwNCAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfY29udGVudF9w
cm90ZWN0aW9uLmMKPiArKysgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMKPiBAQCAt
MTc0LDEyICsxNzQsMTEgQEAgdGVzdF9jcF9lbmFibGVfZGlzYWJsZShjb25zdCBlbnVtIHBpcGUg
cGlwZSwgaWd0X291dHB1dF90ICpvdXRwdXQsCj4gICAJLyogRklYTUU6IEtlcm5lbCB0b3RhbGx5
IGZhbGxzIG92ZXIgaWYgd2UgbGVhdmUgSERDUCBlbmFibGVkLiBXb3JrCj4gICAJICogYXJvdW5k
IHRoaXMgZm9yIG5vdyBieSByZXN0b3JpbmcgaXQgYmVmb3JlIGNoZWNrIHdoZXRoZXIgaXQgd29y
a2VkLiAqLwo+ICAgCWlndF9vdXRwdXRfc2V0X3Byb3BfdmFsdWUob3V0cHV0LCBJR1RfQ09OTkVD
VE9SX0NPTlRFTlRfUFJPVEVDVElPTiwgMCk7Cj4gLQo+IC0JaWd0X2Fzc2VydF9mKHJldCwgIkNv
bnRlbnQgUHJvdGVjdGlvbiBub3QgZW5hYmxlZFxuIik7Cj4gLQo+ICAgCWlndF9wbGFuZV9zZXRf
ZmIocHJpbWFyeSwgJnJlZCk7Cj4gICAJaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBzKTsK
PiAgIAo+ICsJaWd0X2Fzc2VydF9mKHJldCwgIkNvbnRlbnQgUHJvdGVjdGlvbiBub3QgZW5hYmxl
ZFxuIik7Cj4gKwoKQXNoYW1lZCBmb3Igbm90IGNhdGNoaW5nIHRoaXMgYXQgb3JpZ2luYWwgY2hh
bmdlIGl0c2VsZi4gOigKClJldmlld2VkLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0Bp
bnRlbC5jb20+Cgo+ICAgCS8qIFdhaXQgZm9yIEhEQ1AgdG8gYmUgZGlzYWJsZWQsIGJlZm9yZSBj
cnRjIG9mZiAqLwo+ICAgCXdhaXRfZm9yX3Byb3BfdmFsdWUob3V0cHV0LCAwLCAxMDAwKTsKPiAg
IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
