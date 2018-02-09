Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F676E8E5
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2018 15:25:34 +0000 (UTC)
References: <20180209002157.6375-1-antonio.argenziano@intel.com>
 <151816938507.28809.7532935648440423669@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <b253e9b8-5e0d-c687-df09-db618acd6c21@intel.com>
Date: Fri, 9 Feb 2018 07:25:33 -0800
MIME-Version: 1.0
In-Reply-To: <151816938507.28809.7532935648440423669@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] igt: Use lib gem_execbuf where possible
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwOS8wMi8xOCAwMTo0MywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTAyLTA5IDAwOjIxOjU3KQo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMv
Z2VtX2J1c3kuYyBiL3Rlc3RzL2dlbV9idXN5LmMKPj4gaW5kZXggYzM0OWMyOTEuLjQ0NGMxZGQx
IDEwMDY0NAo+PiAtLS0gYS90ZXN0cy9nZW1fYnVzeS5jCj4+ICsrKyBiL3Rlc3RzL2dlbV9idXN5
LmMKPj4gQEAgLTMzMiwxMSArMzMyLDYgQEAgc3RhdGljIHZvaWQgYWxhcm1faGFuZGxlcihpbnQg
c2lnKQo+PiAgIHsKPj4gICB9Cj4+ICAgCj4+IC1zdGF0aWMgaW50IF9fZXhlY2J1ZihpbnQgZmQs
IHN0cnVjdCBkcm1faTkxNV9nZW1fZXhlY2J1ZmZlcjIgKmV4ZWNidWYpCj4+IC17Cj4+IC0gICAg
ICAgcmV0dXJuIGlvY3RsKGZkLCBEUk1fSU9DVExfSTkxNV9HRU1fRVhFQ0JVRkZFUjIsIGV4ZWNi
dWYpOwo+PiAtfQo+IAo+IFdyb25nLiBUaGVyZSdzIGFuIGltcG9ydGFudCBkaWZmZXJlbmNlIGhl
cmUsIGNhbiB5b3Ugc2VlIGl0PyBJdCdzIGFsbCB0bwo+IGRvIHdpdGggc2lnbmFsIGhhbmRsaW5n
Li4uCgpJIGd1ZXNzIHdlIGRvIG5vdCB3YW50IHRvIGtlZXAgdHJ5aW5nIGRvaW5nIHRoZSBzYW1l
IGlvY3RsIG9uY2UgdGhlIApyaW5nYnVmZmVyIGlzIGZ1bGwuLi4KClRoYW5rcyBmb3IgZmluZGlu
ZyB0aGlzLCBpdCB3b3VsZCBoYXZlIGJlZW4gYSBuYXN0eSBvbmUuCgpBbnRvbmlvCgo+IC1DaHJp
cwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
