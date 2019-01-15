Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C056EE89
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 21:54:57 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q1so2501376qkf.13
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 13:54:57 -0800 (PST)
Message-ID: <dafbdb5547c73b93446a6ba4c3fe1dc6e4a754b1.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Tue, 15 Jan 2019 16:54:54 -0500
In-Reply-To: <20190111090532.19235-13-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-13-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 12/21] lib/igt_vc4: Add helper for
 checking SAND tiling support on plane
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
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTAxLTExIGF0IDEwOjA1ICswMTAwLCBQYXVsIEtvY2lhbGtvd3NraSB3cm90
ZToKPiBUaGlzIGludHJvZHVjZXMgYSBjb252ZW5pZW5jZSBoZWxwZXIgZm9yIGNoZWNraW5nIHdo
ZXRoZXIgYSBwbGFuZQo+IHN1cHBvcnRzIFNBTkQgdGlsaW5nIGZvciBhIGdpdmVuIGZvcm1hdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lA
Ym9vdGxpbi5jb20+Cj4gLS0tCj4gIGxpYi9pZ3RfdmM0LmggfCAyNCArKysrKysrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvbGliL2lndF92YzQuaCBiL2xpYi9pZ3RfdmM0LmgKPiBpbmRleCA5MTE4YWUxOTNmNjAu
LmNiOTgwNTQxYTYxZiAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X3ZjNC5oCj4gKysrIGIvbGliL2ln
dF92YzQuaAo+IEBAIC0zMyw2ICszMywzMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wKPiBpZ3RfdmM0
X3BsYW5lX3N1cHBvcnRzX3RfdGlsaW5nKGlndF9wbGFuZV90ICpwbGFuZSwKPiAgCQkJCQlEUk1f
Rk9STUFUX01PRF9CUk9BRENPTV9WQzRfVF9USUxFRCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbmxp
bmUgYm9vbCBpZ3RfdmM0X3BsYW5lX3N1cHBvcnRzX3NhbmRfdGlsaW5nKGlndF9wbGFuZV90ICpw
bGFuZSwKPiArCQkJCQkJICAgICAgdWludDMyX3QgZm9ybWF0LAo+ICsJCQkJCQkgICAgICBzaXpl
X3QKPiBjb2x1bW5fd2lkdGhfYnl0ZXMpCj4gK3sKPiArCXVpbnQ2NF90IG1vZGlmaWVyOwo+ICsK
PiArCXN3aXRjaCAoY29sdW1uX3dpZHRoX2J5dGVzKSB7Cj4gKwljYXNlIDMyOgo+ICsJCW1vZGlm
aWVyID0gRFJNX0ZPUk1BVF9NT0RfQlJPQURDT01fU0FORDMyOwo+ICsJCWJyZWFrOwo+ICsJY2Fz
ZSA2NDoKPiArCQltb2RpZmllciA9IERSTV9GT1JNQVRfTU9EX0JST0FEQ09NX1NBTkQ2NDsKPiAr
CQlicmVhazsKPiArCWNhc2UgMTI4Ogo+ICsJCW1vZGlmaWVyID0gRFJNX0ZPUk1BVF9NT0RfQlJP
QURDT01fU0FORDEyODsKPiArCQlicmVhazsKPiArCWNhc2UgMjU2Ogo+ICsJCW1vZGlmaWVyID0g
RFJNX0ZPUk1BVF9NT0RfQlJPQURDT01fU0FORDI1NjsKPiArCQlicmVhazsKT3B0aW9uYWwgYmlr
ZXNoZWQ6IE1heWJlIGFkZCBhIGRlZmF1bHQ6IGNhc2Ugd2l0aCBhbiBpZ3RfYXNzZXJ0KCk/CgpF
aXRoZXIgd2F5OgoKUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4g
Kwl9Cj4gKwo+ICsJcmV0dXJuIGlndF9wbGFuZV9oYXNfZm9ybWF0X21vZChwbGFuZSwgZm9ybWF0
LCBtb2RpZmllcik7Cj4gK30KPiArCj4gIHVpbnQzMl90IGlndF92YzRfZ2V0X2NsZWFyZWRfYm8o
aW50IGZkLCBzaXplX3Qgc2l6ZSwgdWludDMyX3QgY2xlYXJ2YWwpOwo+ICBpbnQgaWd0X3ZjNF9j
cmVhdGVfYm8oaW50IGZkLCBzaXplX3Qgc2l6ZSk7Cj4gIHZvaWQgKmlndF92YzRfbW1hcF9ibyhp
bnQgZmQsIHVpbnQzMl90IGhhbmRsZSwgdWludDMyX3Qgc2l6ZSwgdW5zaWduZWQKPiBwcm90KTsK
LS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
