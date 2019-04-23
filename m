Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C603B89270
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2019 12:00:46 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <b5a664cf2ff3571da4b7950df53f8460415772f1.camel@intel.com>
References: <20190423075243.19754-1-simon.ser@intel.com>
 <20190423080946.19771-1-chris@chris-wilson.co.uk>
 <b5a664cf2ff3571da4b7950df53f8460415772f1.camel@intel.com>
Message-ID: <155602083231.9039.17048491065121188664@skylake-alporthouse-com>
Date: Tue, 23 Apr 2019 13:00:32 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] audio: Avoid test_integrity failing if
 there's no HW support
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
To: "Ser, Simon" <simon.ser@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "paul.kocialkowski@linux.intel.com" <paul.kocialkowski@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBTZXIsIFNpbW9uICgyMDE5LTA0LTIzIDEyOjQ1OjA1KQo+IE9uIFR1ZSwgMjAxOS0w
NC0yMyBhdCAwOTowOSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gQmVmb3JlIGFzc2Vy
dGluZyB0aGF0IHRoZSBIRE1JIGF1ZGlvIGxvb3BiYWNrIHdvcmtzIGFmdGVyIHJlc3VtZSwgZmly
c3QKPiA+IHJlcXVpcmUgaXQgdG8gYmUgcHJlc2VudCBiZWZvcmUgc3VzcGVuZCAtLSBhcyBub3Qg
YWxsIG1hY2hpbmVzIGFyZSBzZXR1cAo+ID4gd2l0aCB0aGUgcmlnaHQgSERNSSBhdWRpbyBjYXB0
dXJlLgo+ID4gCj4gPiBNb3JlIHN0cmljdGx5LCBvbmUgd291bGQgZXhwZWN0IHRoYXQgYW4gYXVk
aW8gY2FwdHVyZSBkZXZpY2Ugc2V0dXAKPiA+IGJlZm9yZSBzdXNwZW5kIHdpbGwgcmVtYWluIGZ1
bmN0aW9uYWwgYWZ0ZXIgcmVzdW1lLiBBbiBleGVyY2lzZSBsZWZ0IGZvcgo+ID4gdGhlIHJlYWRl
ci4KPiAKPiBXaGF0IGlmIGF1ZGlvIHdvcmtzIHdpdGhvdXQgc3VzcGVuZCwgYnV0IGJyZWFrcyB3
aXRoIHN1c3BlbmQ/IFRoYXQgbmV3Cj4gdGVzdCBtYWtlcyBpdCBsZXNzIGVhc3kgdG8gdW5kZXJz
dGFuZCB3aGV0aGVyIGF1ZGlvIHdvcmtzIGF0IGFsbCBvciBpZgo+IGl0IGJyZWFrcyBiZWNhdXNl
IG9mIHN1c3BlbmQuCgpUaGF0J3MgdGhlIHRlc3Q7IHdoZXRoZXIgYXVkaW8gY29udGludWVzIHRv
IHdvcmsgYWNyb3NzIHN1c3BlbmQuIEl0J3MKdGhlIG9yaWdpbmFsIHRlc3QsIG5vdCBhIG5ldyBv
bmUuCgpXaGF0IHRoZSBpZ3QgZGlkbid0IChhbmQgc3RpbGwgZG9lc24ndCkgZG8gY29ycmVjdGx5
IGlzIHZlcmlmeSBpdCBoYXMgYQp3b3JraW5nIHNldHVwOyBmb3Igbm93IHdlIGp1c3QgYXNzdW1l
IHRoYXQgdGhlIGRyaXZlciBpcyBmaW5lIGlmIGlndF9hbHNhCmZhaWxzLiBUdXJucyBhIGJyb2tl
biB0ZXN0IGZyb20gIkRSSVZFUiBGQUlMIiB0byBza2lwLgotQ2hyaXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
