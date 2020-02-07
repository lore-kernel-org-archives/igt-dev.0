Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DCF6EAB5
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 13:07:23 +0000 (UTC)
Date: Fri, 7 Feb 2020 15:07:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200207130719.GW13686@intel.com>
References: <20200207032725.10731-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207032725.10731-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_vec: assertion fortification
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
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMDQ6Mjc6MjVBTSArMDEwMCwgWmJpZ25pZXcgS2VtcGN6
ecWEc2tpIHdyb3RlOgo+IEVuc3VyZSBubyBvbmUgd2lsbCBwYXNzIG5lZ2F0aXZlIGluZGV4IG9u
IGlndF92ZWMgYmVjYXVzZSBpdCBjb3VsZAo+IGxlYWQgdG8gbWVtb3J5IGNvcnJ1cHRpb25zIGFu
ZCB3ZWlyZCBwcm9ncmFtIGJlaGF2aW9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtl
bXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgo+IENjOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cgo+IC0tLQo+ICBs
aWIvaWd0X3ZlYy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfdmVjLmMgYi9saWIvaWd0
X3ZlYy5jCj4gaW5kZXggNTkxZTU2ZmEuLmM2YmExNjRiIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3Rf
dmVjLmMKPiArKysgYi9saWIvaWd0X3ZlYy5jCj4gQEAgLTQxLDcgKzQxLDcgQEAgdm9pZCBpZ3Rf
dmVjX2Zpbmkoc3RydWN0IGlndF92ZWMgKnZlYykKPiAgCj4gIHZvaWQgKmlndF92ZWNfZWxlbShj
b25zdCBzdHJ1Y3QgaWd0X3ZlYyAqdmVjLCBpbnQgaWR4KQo+ICB7Cj4gLQlpZ3RfYXNzZXJ0KGlk
eCA8IHZlYy0+bGVuKTsKPiArCWlndF9hc3NlcnQoaWR4ID49IDAgJiYgaWR4IDwgdmVjLT5sZW4p
Owo+ICAKPiAgCXJldHVybiB2ZWMtPmVsZW1zICsgaWR4ICogdmVjLT5lbGVtX3NpemU7Cj4gIH0K
PiBAQCAtNzksNyArNzksNyBAQCBpbnQgaWd0X3ZlY19pbmRleChjb25zdCBzdHJ1Y3QgaWd0X3Zl
YyAqdmVjLCB2b2lkICplbGVtKQo+ICAKPiAgdm9pZCBpZ3RfdmVjX3JlbW92ZShzdHJ1Y3QgaWd0
X3ZlYyAqdmVjLCBpbnQgaWR4KQo+ICB7Cj4gLQlpZ3RfYXNzZXJ0KGlkeCA8IHZlYy0+bGVuKTsK
PiArCWlndF9hc3NlcnQoaWR4ID49IDAgJiYgaWR4IDwgdmVjLT5sZW4pOwo+ICAKPiAgCW1lbW1v
dmUoaWd0X3ZlY19lbGVtKHZlYywgaWR4KSwKPiAgCQlpZ3RfdmVjX2VsZW0odmVjLCBpZHggKyAx
KSwKPiAtLSAKPiAyLjIzLjAKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
