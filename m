Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A2289C80
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2019 15:27:40 +0000 (UTC)
Date: Mon, 24 Jun 2019 18:27:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190624152737.GQ5942@intel.com>
References: <20190624151422.21058-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624151422.21058-1-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_draw: Zero initalize the
 igt_bufs
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDY6MTQ6MThQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IEkgbWlzc2VkIHRoZXNlIHdoZW4gc3ByaW5rbGluZyB0aGUgbWVtc2V0cy4gVXNp
bmcgc3RhY2sgZ2FyYmFnZSBhcyB0aGUKPiBhdXggc3VyZmFjZSBzdGF0ZSBpc24ndCBhIGdvb2Qg
aWRlYS4gQ2F1c2VzIGttc19mcm9udF9idWZmZXJfdHJhY2tpbmcKPiB0byBmYWlsIG9uIHNrbCsu
Cj4gCj4gRml4ZXM6IGE0MzkzYzM5NTFlYyAoImxpYjogQWRkIGF1eCBzdXJmYWNlIHN0YXRlIHRv
IGlndF9idWYiKQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+CgpiYXNoIGhpc3RvcnkgZmFpbC4gUGxlYXNlIGlnbm9yZS4KCj4g
LS0tCj4gIGxpYi9pZ3RfZHJhdy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9kcmF3LmMgYi9s
aWIvaWd0X2RyYXcuYwo+IGluZGV4IGViYWU5MTUxMTNkYS4uYzdkNTc3MGRjYTI4IDEwMDY0NAo+
IC0tLSBhL2xpYi9pZ3RfZHJhdy5jCj4gKysrIGIvbGliL2lndF9kcmF3LmMKPiBAQCAtNTY4LDcg
KzU2OCw3IEBAIHN0YXRpYyB2b2lkIGRyYXdfcmVjdF9yZW5kZXIoaW50IGZkLCBzdHJ1Y3QgY21k
X2RhdGEgKmNtZF9kYXRhLAo+ICAJZHJtX2ludGVsX2JvICpzcmMsICpkc3Q7Cj4gIAl1aW50MzJf
dCBkZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZmQpOwo+ICAJaWd0X3JlbmRlcl9jb3B5ZnVu
Y190IHJlbmRlcmNvcHkgPSBpZ3RfZ2V0X3JlbmRlcl9jb3B5ZnVuYyhkZXZpZCk7Cj4gLQlzdHJ1
Y3QgaWd0X2J1ZiBzcmNfYnVmLCBkc3RfYnVmOwo+ICsJc3RydWN0IGlndF9idWYgc3JjX2J1ZiA9
IHt9LCBkc3RfYnVmID0ge307Cj4gIAlzdHJ1Y3QgaW50ZWxfYmF0Y2hidWZmZXIgKmJhdGNoOwo+
ICAJdWludDMyX3QgdGlsaW5nLCBzd2l6emxlOwo+ICAJc3RydWN0IGJ1Zl9kYXRhIHRtcDsKPiAt
LSAKPiAyLjE2LjQKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2
