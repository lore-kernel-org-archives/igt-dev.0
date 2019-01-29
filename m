Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE4C898D9
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jan 2019 19:17:00 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l11so23603308qtp.0
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jan 2019 11:17:00 -0800 (PST)
Message-ID: <cfd5abaddb8cf55fbcb9f3058aa188eb2505d978.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Tue, 29 Jan 2019 14:16:58 -0500
In-Reply-To: <20190125142009.w3fcwdhjfmqbzx7p@flea>
References: <20190125140623.10801-1-paul.kocialkowski@bootlin.com>
 <20190125140623.10801-12-paul.kocialkowski@bootlin.com>
 <20190125142009.w3fcwdhjfmqbzx7p@flea>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 11/21] lib/igt_fb: Pass the modifier
 to igt_fb_convert helpers
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBGcmksIDIwMTkt
MDEtMjUgYXQgMTU6MjAgKzAxMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gT24gRnJpLCBKYW4g
MjUsIDIwMTkgYXQgMDM6MDY6MTNQTSArMDEwMCwgUGF1bCBLb2NpYWxrb3dza2kgd3JvdGU6Cj4g
PiBUaGUgbW9kaWZpZXIgaXMgcGFydCBvZiBob3cgYSBmcmFtZSBpcyByZXByZXNlbnRlZCwgc28g
YWRkIGl0IGFzIGFuCj4gPiBleHRyYSBhcmd1bWVudCBzbyB0aGF0IGl0IGNhbiBiZSBzcGVjaWZp
ZWQgd2hlbiBjb252ZXJ0aW5nIGZyYW1lYnVmZmVycy4KPiA+IAo+ID4gRm9yIG5vdywgb25seSBh
IGxpbmVhciBtb2RpZmllciBpcyBzdXBwb3J0ZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiAKPiBSZXZp
ZXdlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiAKPiBN
YXhpbWUKPiAKLS0gCkNoZWVycywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
