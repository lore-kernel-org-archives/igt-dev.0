Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EE76E047
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 22:05:35 +0000 (UTC)
References: <20180509203629.10409-1-antonio.argenziano@intel.com>
 <152589874312.8613.1119392407572962611@mail.alporthouse.com>
 <b1065a2f-d245-66ad-3b95-34962592f686@intel.com>
 <152590079833.8613.16459791115117275636@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <1b0390cc-48c0-dccc-acda-af23a9b65e49@intel.com>
Date: Wed, 9 May 2018 15:05:34 -0700
MIME-Version: 1.0
In-Reply-To: <152590079833.8613.16459791115117275636@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_dummyload: Fix possible NULL
 pointer dereference
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

CgpPbiAwOS8wNS8xOCAxNDoxOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTA1LTA5IDIyOjE0OjQzKQo+Pgo+Pgo+PiBPbiAwOS8wNS8xOCAx
Mzo0NSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+Pj4gUXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8g
KDIwMTgtMDUtMDkgMjE6MzY6MjkpCj4+Pj4gTWFrZSBzdXJlIHRoYXQgb25lIG9mIHRoZSAnbW1h
cCcgZnVuY3Rpb25zIHJldHVybnMgYSB2YWxpZCBwb2ludGVyIHRvCj4+Pj4gYXZvaWQgZGVyZWZl
cmVuY2luZyBhIE5VTEwgcG9pbnRlciBsYXRlciBvbi4gKElzc3VlIGZvdW5kIHZpYSBjb3Zlcml0
eSkKPj4+Cj4+PiBOb3QgbXVjaCBvZiBhbiBpc3N1ZSwgaXQgZGllcyBtb21lbnRzIGxhdGVyLiA6
LXAKPj4+ICAgIAo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25p
by5hcmdlbnppYW5vQGludGVsLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBsaWIvaWd0X2R1bW15bG9h
ZC5jIHwgMiArKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9saWIvaWd0X2R1bW15bG9hZC5jIGIvbGliL2lndF9kdW1teWxvYWQu
Ywo+Pj4+IGluZGV4IGJhOTE3YmE1Li5lOTZjMDdjZiAxMDA2NDQKPj4+PiAtLS0gYS9saWIvaWd0
X2R1bW15bG9hZC5jCj4+Pj4gKysrIGIvbGliL2lndF9kdW1teWxvYWQuYwo+Pj4+IEBAIC0xMjUs
NiArMTI1LDggQEAgZW1pdF9yZWN1cnNpdmVfYmF0Y2goaWd0X3NwaW5fdCAqc3BpbiwgaW50IGZk
LCB1aW50MzJfdCBjdHgsIHVuc2lnbmVkIGVuZ2luZSwKPj4+PiAgICAgICAgICAgaWYgKCFiYXRj
aCkKPj4+PiAgICAgICAgICAgICAgICAgICBiYXRjaCA9IF9fZ2VtX21tYXBfX2d0dChmZCwgb2Jq
W0JBVENIXS5oYW5kbGUsCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQkFUQ0hfU0laRSwgUFJPVF9XUklURSk7Cj4+Pgo+Pj4gT3IgZ2VtX21tYXBfX2d0dCgp
LiBfXyB3YXMganVzdCBmb2xsb3dpbmcgdGhlIHBhdHRlcm4sIG90b2ggbGFjayBvZiBfXwo+Pj4g
aW5kaWNhdGVzIGZpbmFsIGp1c3QgYXMgd2VsbC4KPj4KPj4gT0ssIEkgY2FuIGNoYW5nZSBpdC4g
SSB3YXMgdW5kZWNpZGVkIGJldHdlZW4gdGhpcyBhbmQgYXNzZXJ0IGFueXdheSA6KS4KPiAKPiBQ
cmVlbXB0aXZlCj4gCj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgo+IAo+IG9uIGVpdGhlciBmb3JtLgoKVGhhbmtzLCBJJ3ZlIG1lcmdlZCB2Mi4g
KHRvIHdoaWNoIEkgZm9yZ290IHRvIGFkZCB5b3VyIFItQi4uLikKCkFudG9uaW8KCj4gLUNocmlz
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
