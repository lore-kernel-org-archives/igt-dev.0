Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD006E542
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 09:08:01 +0000 (UTC)
References: <20210614164135.1519746-1-markyacoub@chromium.org>
 <20210615131254.5x5u2fjyy7p3uctf@outlook.office365.com>
 <e89fb09e-40c2-3b55-ae27-ed13c234bad7@amd.com>
 <CAJUqKUrDjKFf_yx9w=1TQViJr8C6QfPrYCsEqQO-1Nxou5eH9A@mail.gmail.com>
 <8f717975-4852-fb81-028a-e4c709b50014@amd.com>
 <CAJUqKUqVZb-GatjkGXChFYPXrYLCqwCe9Uu0epEASn8SMrzEfw@mail.gmail.com>
 <ae4be25c-c50d-56bb-6699-5ab6210f80bf@amd.com>
 <YMmpbOtT+CMFxbzI@platvala-desk.ger.corp.intel.com>
 <8077ffe8-8ee5-1d58-1797-69848d11d27a@amd.com>
 <YMm6UQr4qHp/knOD@platvala-desk.ger.corp.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3bc3c4ce-1798-5d80-82d1-9facc8b1ce20@amd.com>
Date: Wed, 16 Jun 2021 11:07:53 +0200
In-Reply-To: <YMm6UQr4qHp/knOD@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_prime: Filter out devices that
 can't import buffers.
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: Anson Jacob <Anson.Jacob@amd.com>, igt-dev@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

QW0gMTYuMDYuMjEgdW0gMTA6NDYgc2NocmllYiBQZXRyaSBMYXR2YWxhOgo+IE9uIFdlZCwgSnVu
IDE2LCAyMDIxIGF0IDEwOjA3OjE4QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
Cj4+IEFtIDE2LjA2LjIxIHVtIDA5OjM0IHNjaHJpZWIgUGV0cmkgTGF0dmFsYToKPj4+IE9uIFR1
ZSwgSnVuIDE1LCAyMDIxIGF0IDA2OjIwOjIzUE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4+Pj4gVGhlIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIHRyeSB0byBjcmVhdGUgYSBmcmFt
ZWJ1ZmZlciwgYnV0IGRvbid0IHRha2UgaXQKPj4+PiBhcyBhIGZhaWx1cmUgd2hlbiB0aGF0IGZh
aWxzIHdpdGggdGhlIGNvcnJlY3QgcmV0dXJuIGNvZGUuCj4+PiBUaGlzLgo+Pj4KPj4+IElmIHRo
ZSBpbXBvcnRpbmcgY2FuIGZhaWwgZm9yIGRvY3VtZW50ZWQgcmVhc29ucywgd2Ugc2hvdWxkIGp1
c3QgYWRkCj4+PiBjb2RlIHRoYXQgY2hlY2tzIHRoYXQgdGhlIGVycm9yIGlzIHRoZSBkb2N1bWVu
dGVkIG9uZSBhbmQgdGhlbgo+Pj4gaWd0X3NraXAoKSwgZmFpbCB0aGUgdGVzdCBpZiBpdCdzIHNv
bWV0aGluZyBpdCBzaG91bGRuJ3QuCj4+IEdvb2QgcG9pbnQsIGJ1dCBJIGRvbid0IHRoaW5rIHRo
YXQgdGhpcyBiZWhhdmlvciBpcyB3ZWxsIGRvY3VtZW50ZWQKPj4gYW55d2hlcmUuCj4+Cj4+IEkn
bSBhbHNvIHByZXR0eSBzdXJlIHRoYXQgbW9zdCBkcml2ZXJzIGRvbid0IGNvcnJlY3RseSByZWpl
Y3QgYW4gaW1wb3J0ZWQKPj4gRE1BLWJ1ZiBmb3Igc2Nhbm91dCB3aGVuIHRoZSBoYXJkd2FyZSBj
YW4ndCBkbyB0aGlzLiBSZXN1bHRpbmcgaW4gZWl0aGVyCj4+IGp1c3QgZ2FyYmFnZSBvbiB0aGUg
c2NyZWVuIG9yIGEgbG9ja3VwLgo+Pgo+PiBFeGVyY2lzaW5nIHRoaXMgaW4gYW4gdW5pdCB0ZXN0
cyBpcyBwcm9iYWJseSBhIGdvb2QgaWRlYSwgYnV0IG9ubHkgYWZ0ZXIKPj4gYXVkaXRpbmcgYWxs
IGRyaXZlcnMgZm9yIGNvcnJlY3QgYmVoYXZpb3IuCj4gVGhlIHRoaW5nIGlzLCBoYXZpbmcgYSB0
ZXN0IGZvciBpdCBpcyB0aGUgYmVzdCBtZXRob2Qgb2YgYXVkaXRpbmcgYW5kCj4gYmVpbmcgX3N1
cmVfLgoKT2ssIHllYWggdGhhdCBpcyBhIHJlYWxseSBnb29kIGFyZ3VtZW50IGFzIHdlbGwuCgo+
IEJlaW5nIGFibGUgdG8gbG9ja3VwIGRldmljZXMgd2l0aCBhbiBvcGVyYXRpb24gdGhhdCBkb2Vz
bid0IGV2ZW4KPiByZXF1aXJlIHJvb3QgKD8pIHNvdW5kcy4uLiBzbGlnaHRseSBiYWQuCgpXZWxs
IGEgYml0IG1vcmUgdGhhbiBzbGlnaHRseSBiYWQgSSB3b3VsZCBzYXkgOikKCkZpcnN0IHdlIGFk
ZGVkIHRoZSBleHRyYSBjaGVjayB0byBhbWRncHUgYmVjYXVzZSB3ZSBmb3VuZCBzY3JlZW4gZ2Fy
YmFnZSAKb24gZEdQVXMuIFdoZW4gd2UgdGhlbiBsYXRlciBpbXBsZW1lbnRlZCBzY2Fub3V0IGZy
b20gaW1wb3J0ZWQgRE1BLWJ1ZnMgCmZvciBBUFVzIHdlIGZvdW5kIHRoYXQgYSBjZXJ0YWluIGNv
bWJpbmF0aW9uIG9mIElPTU1VIGVuYWJsZWQsIApyZXNvbHV0aW9uIGFuZCByZWZyZXNoIHJhdGUg
Y291bGQgaGFyZCBsb2NrIHRoZSBQQ0llIHJvb3QgY29tcGxleC4KCkl0J3MgYWJzb2x1dGVseSBu
b3QgbmljZSBpZiBldmVuIHNlcmlhbCBjb25zb2xlcyBvciBuZXR3b3JrIGNvbnNvbGVzIApkb24n
dCBnaXZlIHlvdSBhbnkgaGludCBvbiB3aGF0J3MgZ29pbmcgd3JvbmcuCgpJIGFsc28gdGhpbmsg
d2Ugc2hvdWxkIGtlZXAgdGhpcyB0ZXN0IGNhc2UgYXJvdW5kLCBqdXN0IGRvbid0IGJlIApzdXJw
cmlzZWQgaWYgcGVvcGxlIHN0YXJ0IHRvIHNjcmVhbSBiZWNhdXNlIGl0IGhhcmQgbG9jayB0aGVp
ciBzeXN0ZW1zLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
