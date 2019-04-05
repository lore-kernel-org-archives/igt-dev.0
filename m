Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 9.mo5.mail-out.ovh.net (9.mo5.mail-out.ovh.net [178.32.96.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A178A6E02D
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 09:47:04 +0000 (UTC)
Received: from player693.ha.ovh.net (unknown [10.109.160.244])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id B27F7228E99
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 11:09:35 +0200 (CEST)
Date: Fri, 5 Apr 2019 12:09:28 +0300
From: Andi Shyti <andi@smida.it>
Message-ID: <20190405090928.GF18786@jack.zhora.eu>
References: <20190405010737.19111-1-andi@etezian.org>
 <20190405010737.19111-8-andi@etezian.org>
 <0649f1fc-bb78-9c42-d17a-7ecb6b2c821d@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0649f1fc-bb78-9c42-d17a-7ecb6b2c821d@linux.intel.com>
Subject: Re: [igt-dev] [PATCH v17 7/7] test: perf_pmu: use the
 gem_engine_topology library
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

PiA+IEBAIC0xNzcsNyArMTcyLDcgQEAgc3RhdGljIGlndF9zcGluX3QgKiBfX3NwaW5fcG9sbChp
bnQgZmQsIHVpbnQzMl90IGN0eCwgdW5zaWduZWQgbG9uZyBmbGFncykKPiA+ICAgCQkuZW5naW5l
ID0gZmxhZ3MsCj4gPiAgIAl9Owo+ID4gLQlpZiAoZ2VtX2Nhbl9zdG9yZV9kd29yZChmZCwgZmxh
Z3MpKQo+ID4gKwlpZiAoZ2VtX2NsYXNzX2Nhbl9zdG9yZV9kd29yZChmZCwgZmxhZ3MpKQo+IAo+
IGZsYWdzIGlzIG5vdCBhIGNsYXNzIGhlcmUgYnV0IGVpdGhlciBsZWdhY3kgZWIgZmxhZ3Mgb3Ig
ZW5naW5lIG1hcCBpbmRleC4KPiAKPiBJIHRoaW5rIHlvdSBjYW4gcmVmYWN0b3Igc28gdGhpcyBm
dW5jdGlvbiAoYW5kIHRoZSBjaGFpbiBvZiBjYWxsZXJzKSB0YWtlcyBhCj4gcG9pbnRlciB0byBp
bnRlbF9leGVjdXRpb25fZW5naW5lMiBhbmQgdGhlbiB1c2UgY2xhc3MgYW5kIGZsYWdzIGFzIG5l
ZWRlZC4KCkl0IGxvb2tzIG1vcmUgbG9naWNhbCwgaW5kZWVkIHRvIGhhdmUgdGhlIGVuZ2luZSBp
biBpdCwgYnV0IGF0CnNvbWUgcG9pbnQgeW91IGNhbGwKCglzcGluID0gc3Bpbl9zeW5jKGdlbV9m
ZCwgMCwgSTkxNV9FWEVDX1JFTkRFUik7CgpJbiB0aGUgcHJldmlvdXMgcGF0Y2hzZXQgSSBoYWQg
Y3JlYXRlZCB0d28gYnJhbmNoZXMgb2Ygc3Bpbl9zeW5jLApvbmUgdGhhdCB0b29rIGZsYWdzIGFu
ZCBvbmUgdGhhdCB0b29rIGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyLApidXQgaXQgbG9va2VkIHRv
IG11Y2ggb2YgdXNlbGVzcyBjb2RlLgoKSW4gdGhpcyBjYXNlIEkgY291bGQgZWl0aGVyIGNyZWF0
ZSBhIGR1bW15IGVuZ2luZSB0byBtYWtlIHRoaW5ncwp3b3JrIHdpdGggaW50ZWxfZXhlY3V0aW9u
X2VuZ2luZTIgb3IganVzdCB1c2UgZmxhZ3MgYW5kIG1pbmltaXNlCnRoZSBjaGFuZ2VzLgoKSW4g
dGhpcyBwYXRjaCB0aGVyZSBpcyBzdGlsbCB0aGUgcHJvYmxlbSBvZiA0LzUgc3VidGVzdHMgZmFp
bGluZywKYnV0IHdlIGNhbiBkaXNjdXNzIHRoYXQgb2ZmbGluZSBhbmQsIGFzIHlvdSBub3RpY2Vk
LCB0aGUKaWd0X2R1bW15bG9hZCBjb21taXQgbG9zdCBpbiB0aGUgbWVhbmRlcnMgb2YgcmViYXNp
bmcuCgpUaGFua3MsCkFuZGkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
