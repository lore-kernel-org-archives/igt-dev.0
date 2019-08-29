Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C496E0A0
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2019 11:03:35 +0000 (UTC)
Date: Thu, 29 Aug 2019 14:03:33 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190829110333.GD4019@platvala-desk.ger.corp.intel.com>
References: <20190829103745.28877-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829103745.28877-1-simon.ser@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_3d: fix uninitialized value
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
To: Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDE6Mzc6NDVQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IElmIHRoZSBkZXZpY2UgZG9lc24ndCBoYXZlIGFueSBIRE1JIGNvbm5lY3RvcnMsIGdhcmJh
Z2UgaXMgcmVhZCBmcm9tIHRoZSBzdGFjay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIg
PHNpbW9uLnNlckBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmku
bGF0dmFsYUBpbnRlbC5jb20+CgoKPiAtLS0KPiAgdGVzdHMva21zXzNkLmMgfCA2ICstLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ttc18zZC5jIGIvdGVzdHMva21zXzNkLmMKPiBpbmRleCBiOTcwYjNi
NTUyMWMuLjI2MjJiMmQwYTZmMyAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfM2QuYwo+ICsrKyBi
L3Rlc3RzL2ttc18zZC5jCj4gQEAgLTMwLDcgKzMwLDcgQEAgaWd0X3NpbXBsZV9tYWluCj4gIHsK
PiAgCWludCBkcm1fZmQ7Cj4gIAlkcm1Nb2RlUmVzICpyZXM7Cj4gLQlkcm1Nb2RlQ29ubmVjdG9y
ICpjb25uZWN0b3I7Cj4gKwlkcm1Nb2RlQ29ubmVjdG9yICpjb25uZWN0b3IgPSBOVUxMOwo+ICAJ
Y29uc3Qgc3RydWN0IGVkaWQgKmVkaWQ7Cj4gIAlpbnQgbW9kZV9jb3VudCwgY29ubmVjdG9yX2lk
Owo+IAo+IEBAIC00MywxNCArNDMsMTAgQEAgaWd0X3NpbXBsZV9tYWluCj4gCj4gIAkvKiBmaW5k
IGFuIGhkbWkgY29ubmVjdG9yICovCj4gIAlmb3IgKGludCBpID0gMDsgaSA8IHJlcy0+Y291bnRf
Y29ubmVjdG9yczsgaSsrKSB7Cj4gLQo+ICAJCWNvbm5lY3RvciA9IGRybU1vZGVHZXRDb25uZWN0
b3JDdXJyZW50KGRybV9mZCwgcmVzLT5jb25uZWN0b3JzW2ldKTsKPiAtCj4gIAkJaWYgKGNvbm5l
Y3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlBKQo+ICAJCQli
cmVhazsKPiAtCj4gIAkJZHJtTW9kZUZyZWVDb25uZWN0b3IoY29ubmVjdG9yKTsKPiAtCj4gIAkJ
Y29ubmVjdG9yID0gTlVMTDsKPiAgCX0KPiAgCWlndF9yZXF1aXJlKGNvbm5lY3Rvcik7Cj4gLS0K
PiAyLjIzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
