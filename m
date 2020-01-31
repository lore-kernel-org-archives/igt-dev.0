Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1956FAEE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 11:02:02 +0000 (UTC)
Date: Fri, 31 Jan 2020 12:02:00 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200131110200.GA12972@zkempczy-mobl2>
References: <20200131065456.16467-1-ayaz.siddiqui@intel.com>
 <20200131065456.16467-2-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131065456.16467-2-ayaz.siddiqui@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] Add check for HW tiling support in
 gem_set_tiling_vs_blt test
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
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMTI6MjQ6NTZQTSArMDUzMCwgQXlheiBBIFNpZGRpcXVp
IHdyb3RlOgo+IFRoaXMgIHRlc3QgaXMgY3VycmVudGx5IGFzc3VtaW5nIHRoYXQgcGxhdGZvcm0g
YWx3YXlzIHN1cHBvcnQgSFcgdGlsaW5nLgo+IEEgY2hlY2sgaGFzIGJlZW4gYWRkZWQgdG8gc2tp
cCB0aGUgdGVzdCBpZiBIVyB0aWxpbmcgaXMgbm90IHN1cHBvcnRlZAo+IGJ5IHBsYXRmb3JtLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEF5YXogQSBTaWRkaXF1aSA8YXlhei5zaWRkaXF1aUBpbnRlbC5j
b20+Cj4gLS0tCj4gIHRlc3RzL2k5MTUvZ2VtX3NldF90aWxpbmdfdnNfYmx0LmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pOTE1L2dlbV9zZXRfdGlsaW5nX3ZzX2JsdC5jIGIvdGVzdHMvaTkxNS9n
ZW1fc2V0X3RpbGluZ192c19ibHQuYwo+IGluZGV4IGMzMTdkMWVmLi4wY2IzZmRmMSAxMDA2NDQK
PiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9zZXRfdGlsaW5nX3ZzX2JsdC5jCj4gKysrIGIvdGVzdHMv
aTkxNS9nZW1fc2V0X3RpbGluZ192c19ibHQuYwo+IEBAIC0yMzIsNyArMjMyLDcgQEAgaWd0X21h
aW4KPiAgCQlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwo+ICAJCWlndF9yZXF1
aXJlX2dlbShmZCk7Cj4gIAkJZ2VtX3JlcXVpcmVfYmxpdHRlcihmZCk7Cj4gLQo+ICsJCWlndF9y
ZXF1aXJlKGdlbV9hdmFpbGFibGVfZmVuY2VzKGZkKSA+IDApOwo+ICAJCWJ1Zm1nciA9IGRybV9p
bnRlbF9idWZtZ3JfZ2VtX2luaXQoZmQsIDQwOTYpOwo+ICAJCWRybV9pbnRlbF9idWZtZ3JfZ2Vt
X2VuYWJsZV9yZXVzZShidWZtZ3IpOwo+ICAJCWRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChm
ZCk7CgpTbWFsbCBuaXQgLSB3ZSBzdGlsbCBoYXZlIEhXIHRpbGluZywgYnV0IGZlbmNlcyBhcmUg
bm90IGF2YWlsYWJsZQpvbiBuZXdlciBnZW5zLiAKCkFueXdheSwKUmV2aWV3ZWQtYnk6IFpiaWdu
aWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
