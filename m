Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285226E20A
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Apr 2018 17:13:20 +0000 (UTC)
References: <20180330154939.20647-1-daniels@collabora.com>
 <95cd7da4-fbba-9ac3-404c-3a0eb69c3a35@intel.com>
 <CAPj87rNAHOJNvhyO=BAUCvVYV5XrHJrU7v3Wv45FXNfu4qQX9Q@mail.gmail.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <e5ed19e2-829e-ad2d-3968-ba0f19c8d059@intel.com>
Date: Mon, 2 Apr 2018 10:13:19 -0700
MIME-Version: 1.0
In-Reply-To: <CAPj87rNAHOJNvhyO=BAUCvVYV5XrHJrU7v3Wv45FXNfu4qQX9Q@mail.gmail.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_getfb: Use fixtures and
 subtest groups
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
To: Daniel Stone <daniel@fooishbar.org>
Cc: igt-dev@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwMi8wNC8xOCAwNjowMiwgRGFuaWVsIFN0b25lIHdyb3RlOgo+IEhpIEFudG9uaW8sCj4g
Cj4gT24gMzAgTWFyY2ggMjAxOCBhdCAyMjowMSwgQW50b25pbyBBcmdlbnppYW5vCj4gPGFudG9u
aW8uYXJnZW56aWFub0BpbnRlbC5jb20+IHdyb3RlOgo+PiBTaW5jZSBib3RoIHRlc3RfaGFuZGxl
X2lucHV0IGFuZCB0ZXN0X2R1cGxpY2F0ZV9oYW5kbGVzIGRlZmluZSBzb21lCj4+IHN1Yi10ZXN0
cyBhbmQgc29tZSBmaXh0dXJlcywgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdW53cmFw
IHRob3NlCj4+IGZ1bmN0aW9ucyBhbmQgZG8gYWxsIGZpeHR1cmVzIGFuZCBzdWJ0ZXN0IGRlZmlu
aXRpb24gaW4gaWd0X21haW4gdG8gbWFrZSBpdAo+PiBtb3JlIHJlYWRhYmxlLiBJdCBzZWVtcyBs
aWtlIHlvdSB3b3VsZCBhbHNvIGJlIGFibGUgdG8gcmV1c2UgdGhlIHNhbWUKPj4gZml4dHVyZSBh
Y3Jvc3MgdGhlIHR3byBzdWJ0ZXN0X2dyb3Vwcy4KPiAKPiBUbyBiZSBjbGVhciwgZG9lcyB0aGlz
IG1lYW4gdGhhdCBlYWNoIHBpZWNlIG9mIGZpeHR1cmUgYW5kIGlndF9zdWJ0ZXN0Cj4gZGVmaW5p
dGlvbiBzaG91bGQgbGl2ZSBpbnNpZGUgbWFpbj8KCkkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYSBy
dWxlIGZvciB0aGF0LCBpdCBsb29rcyBiZXR0ZXIgdGhhdCB3YXkgCihmaXh0dXJlcy9pZ3Rfc3Vi
dGVzdC9zdWJ0ZXN0X2dyb3VwIGFsbCBpbiB0aGUgbWFpbikgSU1PIDopLiBBbHNvIGl0IGlzIAp3
aGF0IEkndmUgZm91bmQgaW4gbW9zdCBpZiBub3QgYWxsIHRlc3RzIEkndmUgbG9va2VkIGF0LgoK
U3RpbGwgdGhlIHBhdGNoIG1ha2VzIHNlbnNlIHdpdGggb3Igd2l0aG91dCBteSBzdWdnZXN0aW9u
LgpBY2tlZC1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwu
Y29tPgoKVGhhbmtzLApBbnRvbmlvCgo+IAo+IENoZWVycywKPiBEYW5pZWwKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
