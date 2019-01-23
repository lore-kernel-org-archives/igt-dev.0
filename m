Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA14E6E4B3
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 10:03:40 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id f5so1094691lfc.13
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 02:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20190116163903.12785-1-daniel.vetter@ffwll.ch>
 <9d141cee-22b4-e0b0-6658-8c4a2afe6608@amd.com>
 <CAKMK7uH2zuAuLG=HJ6GzTY31tFihMYXTeXY1DRbeGvuQk33fMg@mail.gmail.com>
 <96443618-83cf-1a55-7350-d8bcdf734709@amd.com>
In-Reply-To: <96443618-83cf-1a55-7350-d8bcdf734709@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 23 Jan 2019 10:03:27 +0000
Message-ID: <CAPj87rNr2TM7mJv3xN2bLLsh+A0KZ-23rFt-EMtHmWHuBf2DMQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] drm/doc: Make igts for cross-driver stuff
 mandatory
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
To: "Wentland, Harry" <Harry.Wentland@amd.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, DRI Development <dri-devel@lists.freedesktop.org>, IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgpPbiBUdWUsIDIyIEphbiAyMDE5IGF0IDE5OjQyLCBXZW50bGFuZCwgSGFycnkgPEhhcnJ5
LldlbnRsYW5kQGFtZC5jb20+IHdyb3RlOgo+IE9uIDIwMTktMDEtMjIgMjoxOSBwLm0uLCBEYW5p
ZWwgVmV0dGVyIHdyb3RlOgo+ID4gSSdkIHNheSB3ZSdsbCBzaHJ1ZyB0aGVzZSBjYXNlcyBvZmYg
YXMgImNhbid0IGJlIHJlYXNvbmFibGUgdGVzdGVkLAo+ID4gd29uJ3QgaGF2ZSBhbiBpZ3QiLiBG
aXJzdCBkcml2ZXIgdGVhbSB3aXRoIGh3IHRoYXQgY2FuIGJlIHZhbGlkYXRlZAo+ID4gZ2V0cyB0
byBmaWxsIHRoZSBnYXBzIDotKSBJbiBwcmFjdGljZSBzdGlsbCBnb2luZyB0byBiZSBhIGxvdCBi
ZXR0ZXIKPiA+IHRoYW4gbm8gdGVzdHMgYXQgYWxsLCBqdXN0IGV4ZXJjaXNpbmcgdGhlIGZlYXR1
cmUgd2lsbCBiZSB1c2VmdWwsIGFuZAo+ID4gd2lsbCBtYWtlIGl0IGEgbG90IGVhc2llciBmb3Ig
dGhlIG5leHQgdGVhbSB0byBhZGQgdGhlIGNyYyBiYXNlZCB0ZXN0cwo+ID4gb24gdG9wLgo+Cj4g
SSB0aGluayB0aGF0J3MgcmVhc29uYWJsZS4gQWZ0ZXIgYWxsLCB3ZSB3YW50IHRvIHN0YXJ0IHNv
bWV3aGVyZS4KPgo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gYXBwZW5kIHNvbWV0aGluZyBsaWtl
ICIsIGlmIHN1Y2ggYSB0ZXN0IGNhbiBiZSByZWFzb25hYmx5IG1hZGUgdXNpbmcgSUdUIGZvciB0
aGUgdGFyZ2V0IEhXLiIgdG8gbWFrZSBpdCBjbGVhciB0byBjb250cmlidXRvcnMgdGhhdCBpbiBj
YXNlcyBsaWtlIHRoZSBvbmUgZGlzY3Vzc2VkIHRoaXMgaXMgYXQgdGhlIHJldmlld2VycyBkaXNj
cmV0aW9uPwo+Cj4gV2l0aCB0aGF0IGNoYW5nZSAob3IgYW55dGhpbmcgZWxzZSB0aGF0IGNsYXJp
ZmllcyB5b3VyIGludGVudGlvbnMgYXMgZGVzY3JpYmVkIGFib3ZlKSBJJ2QgYmUgaGFwcHkgdG8g
Z2l2ZSBteSBBQi4KCkkgY291bGQgZGVmaW5pdGVseSBnZXQgYmVoaW5kIHRoYXQgYXMgd2VsbC4g
Rm9yIHdoYXQgaXQncyB3b3J0aCwgd2UncmUKKGFmdGVyIGEgY291cGxlIG9mIHN0YWxscyBkdWUg
dG8gdXBzdHJlYW0gcmV3cml0ZXMpIHB1c2hpbmcgZm9yd2FyZApleGVjdXRpb24gb2YgaWd0IHdp
dGhpbiBLZXJuZWxDSS4gVGhlIHJlc3VsdHMgYXJlIG5vdCB5ZXQgdmlzaWJsZQp3aXRoaW4ga2Vy
bmVsY2kub3JnLCBidXQgdGhlIHRlc3RzIGFyZSBhdCBsZWFzdCBleGVjdXRpbmcgYW5kIHdlJ3Jl
CmhvcGluZyB0aGV5J2xsIGJlIHRyYWNrZWQgYW5kIHZpc2libGUgc29vbi4KCklmIGl0IGhlbHBz
LCBtYXliZSB3ZSBjb3VsZCBkcmF3IHVwIGEgbGlzdCBzb21ld2hlcmUgKFJFQURNRSBpbiBpZ3Q/
Cndpa2k/KSBvZiB3aGljaCB0ZXN0cyBzZWVtIHRvIHBhc3MgZ2VuZXJpY2FsbHkgYWNyb3NzIGEg
ZmV3IGRyaXZlcnMsCndoaWNoIG9uZXMgYXJlIGV4cGVjdGVkIHRvIHBhc3MsIHdoaWNoIG9uZXMg
ZG9uJ3QgYnV0IHJlYWxseSBzaG91bGQsCmV0Yy4gSSdtIGN1cnJlbnRseSBydW5uaW5nIG9uIGlt
eC1kcm0gKGNvbXBsaWNhdGVkIGJ5IGhpdHRpbmcgYQpwYWdlLWNhY2hlIEJVRyEpLCBhbmQgYSBj
b3VwbGUgb2Ygb3RoZXJzIGFyZSBnZXR0aW5nIHJlc3VsdHMgZnJvbQpyb2NrY2hpcCwgdmM0LCBh
bmQgbXNtLiBUaG9zZSBhcmUgcHJldHR5IHdlbGwgc3VwcG9ydGVkIGFuZCBhY3RpdmVseQptYWlu
dGFpbmVkLCBzbyBzaG91bGQgZ2l2ZSB1cyBhIGRlY2VudCBmaXJzdCBjdXQgYXQgc3VjaCBhIGxp
c3QuCgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
