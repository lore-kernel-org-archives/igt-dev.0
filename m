Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf0-x22a.google.com (mail-lf0-x22a.google.com
 [IPv6:2a00:1450:4010:c07::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9676E5E8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Mar 2018 14:55:35 +0000 (UTC)
Received: by mail-lf0-x22a.google.com with SMTP id x205-v6so18736143lfa.0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Mar 2018 07:55:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180323145331.GZ5453@intel.com>
References: <CAPj87rNifw841eX2tyNr3uWYRPd3=91gqcBSqNbPADycryFh2Q@mail.gmail.com>
 <20180323134616.16058-1-daniels@collabora.com>
 <20180323145331.GZ5453@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 23 Mar 2018 14:55:32 +0000
Message-ID: <CAPj87rMzYfCd-88Cs5b+7__ZRbL6EeRcc5RRaFw3Mh+YY3i8iQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/kms_getfb: Split property-ID
 get into helper
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
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjMgTWFyY2ggMjAxOCBhdCAxNDo1MywgVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCBNYXIgMjMsIDIwMTggYXQgMDE6NDY6
MTRQTSArMDAwMCwgRGFuaWVsIFN0b25lIHdyb3RlOgo+PiArLyoqCj4+ICsgKiBGaW5kIGFuZCBy
ZXR1cm4gYW4gYXJiaXRyYXJ5IHZhbGlkIHByb3BlcnR5IElELgo+PiArICovCj4+ICtzdGF0aWMg
dWludDMyX3QgZ2V0X3Byb3BfaWQoaW50IGZkKQo+Cj4gZ2V0X2FueV9wcm9wX2lkKCkgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdCBtYXliZT8KClllYWgsIGEgZ29vZCBjaG9pY2Ugb2YgY29sb3VyLiA6
KQoKQ2hlZXJzLApEYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
