Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA22889F0B
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 00:39:55 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e5so1167725qtr.12
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 16:39:55 -0800 (PST)
Message-ID: <b13a1e89c3cf5629bd38c39335aa4b6c2f22b631.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Mon, 14 Jan 2019 19:39:52 -0500
In-Reply-To: <20190111090532.19235-3-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-3-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 02/21] lib/igt_fb: Add checks on i915
 for i915-specific tiled buffer allocation
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmksIDIwMTkt
MDEtMTEgYXQgMTA6MDUgKzAxMDAsIFBhdWwgS29jaWFsa293c2tpIHdyb3RlOgo+IFRoZSBjb2Rl
IHBhdGggZm9yIGFsbG9jYXRpbmcgdGlsZWQgYnVmZmVycyBoYXMgYSBmZXcgaTkxNS1zcGVjaWZp
YyBiaXRzCj4gd2l0aG91dCBjaGVja3MgZm9yIHRoZSBpOTE1IGRyaXZlci4gQWRkIHRoZXNlIG1p
c3NpbmcgY2hlY2tzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVs
LmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiAtLS0KPiAgbGliL2lndF9mYi5jIHwgNiArKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKPiBpbmRleCA5Y2VlYjgy
NGZmZjQuLjllY2QxMGI4Y2RlMSAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2ZiLmMKPiArKysgYi9s
aWIvaWd0X2ZiLmMKPiBAQCAtMzY0LDYgKzM2NCw3IEBAIHN0YXRpYyB1aW50MzJfdCBjYWxjX3Bs
YW5lX3N0cmlkZShzdHJ1Y3QgaWd0X2ZiICpmYiwgaW50Cj4gcGxhbmUpCj4gIAkJKGZiLT5wbGFu
ZV9icHBbcGxhbmVdIC8gOCk7Cj4gIAo+ICAJaWYgKGZiLT50aWxpbmcgIT0gTE9DQUxfRFJNX0ZP
Uk1BVF9NT0RfTk9ORSAmJgo+ICsJICAgIGlzX2k5MTVfZGV2aWNlKGZiLT5mZCkgJiYKPiAgCSAg
ICBpbnRlbF9nZW4oaW50ZWxfZ2V0X2RybV9kZXZpZChmYi0+ZmQpKSA8PSAzKSB7Cj4gIAkJdWlu
dDMyX3Qgc3RyaWRlOwo+ICAKPiBAQCAtMzkyLDYgKzM5Myw3IEBAIHN0YXRpYyB1aW50MzJfdCBj
YWxjX3BsYW5lX3N0cmlkZShzdHJ1Y3QgaWd0X2ZiICpmYiwgaW50Cj4gcGxhbmUpCj4gIHN0YXRp
YyB1aW50NjRfdCBjYWxjX3BsYW5lX3NpemUoc3RydWN0IGlndF9mYiAqZmIsIGludCBwbGFuZSkK
PiAgewo+ICAJaWYgKGZiLT50aWxpbmcgIT0gTE9DQUxfRFJNX0ZPUk1BVF9NT0RfTk9ORSAmJgo+
ICsJICAgIGlzX2k5MTVfZGV2aWNlKGZiLT5mZCkgJiYKPiAgCSAgICBpbnRlbF9nZW4oaW50ZWxf
Z2V0X2RybV9kZXZpZChmYi0+ZmQpKSA8PSAzKSB7Cj4gIAkJdWludDY0X3QgbWluX3NpemUgPSAo
dWludDY0X3QpIGZiLT5zdHJpZGVzW3BsYW5lXSAqCj4gIAkJCWZiLT5wbGFuZV9oZWlnaHRbcGxh
bmVdOwo+IEBAIC0xNDg4LDkgKzE0OTAsMTEgQEAgc3RhdGljIHZvaWQgKm1hcF9ibyhpbnQgZmQs
IHN0cnVjdCBpZ3RfZmIgKmZiKQo+ICAJaWYgKGZiLT5pc19kdW1iKQo+ICAJCXB0ciA9IGttc3Rl
c3RfZHVtYl9tYXBfYnVmZmVyKGZkLCBmYi0+Z2VtX2hhbmRsZSwgZmItPnNpemUsCj4gIAkJCQkJ
ICAgICAgUFJPVF9SRUFEIHwgUFJPVF9XUklURSk7Cj4gLQllbHNlCj4gKwllbHNlIGlmIChpc19p
OTE1X2RldmljZShmZCkpCj4gIAkJcHRyID0gZ2VtX21tYXBfX2d0dChmZCwgZmItPmdlbV9oYW5k
bGUsIGZiLT5zaXplLAo+ICAJCQkJICAgIFBST1RfUkVBRCB8IFBST1RfV1JJVEUpOwo+ICsJZWxz
ZQo+ICsJCWlndF9hc3NlcnQoZmFsc2UpOwo+ICAKPiAgCXJldHVybiBwdHI7Cj4gIH0KLS0gCkNo
ZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
