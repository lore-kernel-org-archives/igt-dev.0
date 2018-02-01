Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638D26EE82
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 17:28:44 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180131093537.9139-1-chris@chris-wilson.co.uk>
 <cb894b9a-95f5-d456-f41b-08dc1a44bc95@intel.com>
In-Reply-To: <cb894b9a-95f5-d456-f41b-08dc1a44bc95@intel.com>
Message-ID: <151750611928.28099.8344172432933894105@mail.alporthouse.com>
Date: Thu, 01 Feb 2018 17:28:39 +0000
Subject: Re: [igt-dev] [PATCH igt] lib: Avoid rcu_barrier() for
 gem_quiescent_gpu()
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDItMDEgMTc6MjM6NDUpCj4gCj4gCj4g
T24gMzEvMDEvMTggMDE6MzUsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFVzaW5nIERST1BfRlJF
RUQgaW52b2tlcyBhbiByY3VfYmFycmllcigpIHRvIGVuc3VyZSB0aGF0IGFsbCBSQ1UKPiA+IHBy
b3RlY3RlZCBvYmplY3RzIGFyZSBmcmVlZCBiZWZvcmUgaXQgcmV0dXJucy4gcmN1X2JhcnJpZXIo
KSBpcyBhIHZlcnkKPiA+IGhpZ2ggbGF0ZW5jeSBvcGVyYXRpb24gKH41MG1zIGF0IGJlc3QpIHdo
aWNoIGlzIG9ubHkgcmVxdWlyZWQgdW5kZXIKPiA+IHNwZWNpZmljIGNpcmN1bXN0YW5jZXMgc3Vj
aCBhcyB3aGVuIHdlIG5lZWQgYSBzdGFibGUgb2JqZWN0IGNvdW50LiBCeQo+IAo+IERvIHdlIGV4
cGVjdCB0aG9zZSBzcGVjaWZpYyBjaXJjdW1zdGFuY2VzIHRvIGJlIG9mIGludGVyZXN0IGluIG91
ciAKPiB0ZXN0aW5nPyBPciBiZXR0ZXIsIGRvIHdlIG5lZWQgYSBnZW1fcXVpZXNjZW50X2dwdSB0
aGF0IHdhaXRzIG9uIGFsbCBSQ1UgCj4gcHJvdGVjdGVkIG9iamVjdHM/CgpZZXMvbm8uIEl0J3Mg
cmVhbGx5IG5pY2UgdG8gYmUgYWJsZSB0byBzYXkgYXQgdGhlIHN0YXJ0IG9mIHRoZSB0ZXN0CnRo
ZXJlIGlzIG5vIGxlZnRvdmVyIHN0YXRlIHdoYXRzb2V2ZXIgZnJvbSBhbnkgcHJldmlvdXMgdGVz
dC4gVG8gYmUKaG9uZXN0LCBJIHRoaW5rIHRoYXQgaXMgd29ydGggdGhlIGNvc3QsIHNvIGp1c3Qg
cmVhZCB0aGlzIGFzIHNob2NrIHRoYXQKSSBoYWQgZm9yZ290dGVuIGhvdyBleHBlbnNpdmUgRFJP
UF9GUkVFRCB3YXMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
