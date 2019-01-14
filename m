Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61C1F892DB
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 14:57:37 +0000 (UTC)
Message-ID: <f05b1ef79bc155b911c8773f333fe8bd4f335d5a.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 14 Jan 2019 15:57:24 +0100
In-Reply-To: <20190111152505.wjwkirqcij455lvn@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-10-paul.kocialkowski@bootlin.com>
 <20190111152505.wjwkirqcij455lvn@flea>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 09/21] lib/igt_vc4: Add helpers for
 converting linear to T-tiled RGB buffers
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
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgpPbiBGcmksIDIwMTktMDEtMTEgYXQgMTY6MjUgKzAxMDAsIE1heGltZSBSaXBhcmQgd3Jv
dGU6Cj4gT24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMTA6MDU6MjBBTSArMDEwMCwgUGF1bCBLb2Np
YWxrb3dza2kgd3JvdGU6Cj4gPiBJbiBvcmRlciB0byBpbnRlZ3JhdGUgdGVzdGluZyBvZiBULXRp
bGVkIGJ1ZmZlcnMsIHRoZSBlYXNpZXN0IHBhdGggaXMgdG8KPiA+IGdlbmVyYXRlIHBhdHRlcm5z
ICh3aXRoIHRoZSBhbHJlYWR5LWV4aXN0aW5nIGZ1bmN0aW9ucykgaW4gbGluZWFyCj4gPiBidWZm
ZXJzIGFuZCBjb252ZXJ0IHRoZW0gdG8gVC10aWxlZCBzdWJzZXF1ZW50bHkuCj4gPiAKPiA+IEFk
ZCBoZWxwZXJzIHRvIGRvIHRoYXQgY29udmVyc2lvbiwgd2l0aCBhIGZpcnN0IGhlbHBlciB0aGF0
IHJldHVybnMgdGhlCj4gPiBtZW1vcnkgb2Zmc2V0IGZvciBhIGdpdmVuIHBvc2l0aW9uIGluIGEg
VC10aWxlZCBidWZmZXIgYW5kIGEgc2Vjb25kCj4gPiBoZWxwZXIgdGhhdCB1c2VzIGl0IGZvciBj
b252ZXJ0aW5nIGJldHdlZW4gZnJhbWVidWZmZXJzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Cj4gCj4gSSdk
IHJlYWxseSBsaWtlIHRvIHBsdWcgdGhhdCBpbiBpZ3RfY29udmVydC4gVGhlIG1vZGlmaWVycyBh
cmUgcGFydCBvZgo+IG9mIGhvdyBhbiBpbWFnZSBpcyByZXByZXNlbnRlZCwgc28gaXQgc2hvdWxk
IHJlYWxseSBiZSBwbHVnZ2VkIGluCj4gaWd0X2ZiX2NvbnZlcnQsIGFzIGEgc2Vjb25kIHN0ZXAg
YWZ0ZXIgdGhlIGZvcm1hdCBjb252ZXJzaW9uLgo+IAo+IFRoaXMgYWxzbyBhcHBsaWVzIHRvIHlv
dXIgcGF0Y2ggMTEuCgpTb3VuZHMgbGlrZSBhIHZlcnkgZ29vZCB0aGluZyB0byBkbyBpbmRlZWQh
CgpJIHRoaW5rIGhhdmluZyB0aWxpbmctc3BlY2lmaWMgZnVuY3Rpb25zIGZvciBjb252ZXJ0aW5n
IGEgcGxhbmUgd291bGQKYmUgYSBnb29kIGZpdCwgc2luY2UgZXZlcnl0aGluZyBhYm92ZSB0aGF0
IGNhbiBjZXJ0YWlubHkgYmUgbWFkZQpnZW5lcmljLgoKSSdsbCBpbmNsdWRlIGFuIGltcGxlbWVu
dGF0aW9uIG9mIHRoYXQgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0aGUKc2VyaWVzLgoKQ2hlZXJz
LAoKUGF1bAoKLS0gClBhdWwgS29jaWFsa293c2tpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
