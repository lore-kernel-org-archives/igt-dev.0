Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8D16ED02
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 14:03:00 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190115134449.15320-3-lukasz.kalamarz@intel.com>
References: <20190115134449.15320-1-lukasz.kalamarz@intel.com>
 <20190115134449.15320-3-lukasz.kalamarz@intel.com>
Message-ID: <154756095972.30063.5258563619065683030@skylake-alporthouse-com>
Date: Tue, 15 Jan 2019 14:02:45 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/3] lib/ioctl_wrapper: Implement
 __gem_mmap
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
To: Lukasz Kalamarz <lukasz.kalamarz@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMdWthc3ogS2FsYW1hcnogKDIwMTktMDEtMTUgMTM6NDQ6NDkpCj4gUHJldmlvdXMg
aW1wbGVtZW50YXRpb24gb2YgX19nZW1fbW1hcF9fY3B1IGFuZCBfX2dlbV9tbWFwX3djIG9ubHkK
PiBkaWZmZXIgd2l0aCBzZXR0aW5nIHByb3BlciBmbGFnIGZvciBjYWNoaW5nLiBUaGlzIHBhdGNo
IGltcGxlbWVudAo+IF9fZ2VtX21tYXAsIHdoaWNoIG1lcmdlIHRob3NlIHR3byBmdW5jdGlvbnMg
aW50byBvbmUKPiB2MjogUmVvcmRlcmVkIGFuZCBzcGxpdGVkIHRoaXMgcGF0Y2ggaW50byB0d28g
c2VwYXJldGUgcGF0Y2hlcwo+IHYzOiBEcm9wcGVkIHVubmVjZXNzYXJ5IGNoZWNrCj4gdjQ6IFJl
bWVyZ2UgcGF0Y2hlcyBhZ2FpbiBhbmQgZml4ZWQgX19nZW1fbW1hcCBkZXNjcmlwdGlvbgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6LmthbGFtYXJ6QGludGVsLmNv
bT4KPiBDYzogTWljaGFsIFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+Cj4g
Q2M6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgo+IENjOiBEYW5pZWxl
IENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgo+IENjOiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogTWljaGFsIFdhamRl
Y3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+Cj4gLS0tCj4gK3N0YXRpYyB2b2lkCj4g
KypfX2dlbV9tbWFwKGludCBmZCwgdWludDMyX3QgaGFuZGxlLCB1aW50NjRfdCBvZmZzZXQsIHVp
bnQ2NF90IHNpemUsIHVuc2lnbmVkIGludCBwcm90LCB1aW50NjRfdCBmbGFncykKPiArewo+ICsg
ICAgICAgc3RydWN0IGRybV9pOTE1X2dlbV9tbWFwIGFyZzsKCkkgd291bGQgaGF2ZSB0YWtlbiB0
aGUgb3Bwb3J0dW5pdHkgdG8gdXNlIGFyZyA9IHsKCS5oYW5kbGUgPSBoYW5kbGUsCgkuZXRhbAp9
LgoKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgot
Q2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
