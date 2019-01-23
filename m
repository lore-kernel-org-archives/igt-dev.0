Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94516E4E4
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 10:54:07 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id y56so1299637edd.11
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 02:54:07 -0800 (PST)
Date: Wed, 23 Jan 2019 11:54:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190123105403.GD3271@phenom.ffwll.local>
References: <20190116163903.12785-1-daniel.vetter@ffwll.ch>
 <9d141cee-22b4-e0b0-6658-8c4a2afe6608@amd.com>
 <CAKMK7uH2zuAuLG=HJ6GzTY31tFihMYXTeXY1DRbeGvuQk33fMg@mail.gmail.com>
 <96443618-83cf-1a55-7350-d8bcdf734709@amd.com>
 <87k1iv3d37.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k1iv3d37.fsf@intel.com>
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>, Petri Latvala <petri.latvala@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, DRI Development <dri-devel@lists.freedesktop.org>, IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Dave Airlie <airlied@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMTI6MDM6NDBQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVHVlLCAyMiBKYW4gMjAxOSwgIldlbnRsYW5kLCBIYXJyeSIgPEhhcnJ5LldlbnRs
YW5kQGFtZC5jb20+IHdyb3RlOgo+ID4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBhcHBlbmQgc29t
ZXRoaW5nIGxpa2UgIiwgaWYgc3VjaCBhIHRlc3QgY2FuIGJlCj4gPiByZWFzb25hYmx5IG1hZGUg
dXNpbmcgSUdUIGZvciB0aGUgdGFyZ2V0IEhXLiIgdG8gbWFrZSBpdCBjbGVhciB0bwo+ID4gY29u
dHJpYnV0b3JzIHRoYXQgaW4gY2FzZXMgbGlrZSB0aGUgb25lIGRpc2N1c3NlZCB0aGlzIGlzIGF0
IHRoZQo+ID4gcmV2aWV3ZXJzIGRpc2NyZXRpb24/Cj4gCj4gSSB0aGluayB0aGUgc2ltcGxlc3Qg
Y2hhbmdlIHdvdWxkIGJlIHRvIHNheSBBUEkgY2hhbmdlcyBTSE9VTEQgaGF2ZQo+IGRyaXZlci1h
Z25vc3RpYyB0ZXN0Y2FzZXMsIHdpdGggdGhlIFJGQyAyMTE5IG1lYW5pbmcgb2YgU0hPVUxEOgo+
IAo+ICAgIFNIT1VMRCAgIFRoaXMgd29yZCwgb3IgdGhlIGFkamVjdGl2ZSAiUkVDT01NRU5ERUQi
LCBtZWFuIHRoYXQgdGhlcmUKPiAgICBtYXkgZXhpc3QgdmFsaWQgcmVhc29ucyBpbiBwYXJ0aWN1
bGFyIGNpcmN1bXN0YW5jZXMgdG8gaWdub3JlIGEKPiAgICBwYXJ0aWN1bGFyIGl0ZW0sIGJ1dCB0
aGUgZnVsbCBpbXBsaWNhdGlvbnMgbXVzdCBiZSB1bmRlcnN0b29kIGFuZAo+ICAgIGNhcmVmdWxs
eSB3ZWlnaGVkIGJlZm9yZSBjaG9vc2luZyBhIGRpZmZlcmVudCBjb3Vyc2UuCj4gCj4gSS5lLiBz
L25lZWQvc2hvdWxkLy4gSSB0aGluayBpdCBhbHNvIGNhdGNoZXMgdGhlIHNwaXJpdCBvZiB0aGUK
PiBkaXNjdXNzaW9uIGhlcmU7IHNlZW1zIGxpa2UgZXZlcnlvbmUgYWdyZWVzIGhhdmluZyB0ZXN0
cyBpcyBhIGdvb2QgZ29hbC4KPiAKPiBZb3UnbGwgaGF2ZSB0byBhbGxvdyBmb3IgcmV2aWV3ZXIv
bWFpbnRhaW5lci9jb21tdW5pdHkgZGlzY3JldGlvbiBubwo+IG1hdHRlciB3aGF0LiBKdWRnaW5n
IGJ5IHRoZSBkaXNjdXNzaW9uLCBDUkMgYmFzZWQgdGVzdHMgZG9uJ3QgY3VycmVudGx5Cj4gbWVl
dCB0aGUgZHJpdmVyLWFnbm9zdGljIHJlcXVpcmVtZW50LiBQbGF5aW5nIGRldmlsJ3MgYWR2b2Nh
dGUsIHlvdQo+IGNvdWxkIGFyZ3VlIGFueSBuZXcgQVBJcyBjb3VsZG4ndCBiZSB0ZXN0ZWQgd2l0
aCBDUkMgZWl0aGVyLCBldmVuIGlmIGl0Cj4gd2VyZSB0aGUgbW9zdCByZWFzb25hYmxlIGFwcHJv
YWNoIGZvciBpOTE1LgoKSSB0aGluayBJJ2xsIGNvbWJpbmUgYm90aCBmb3IgdjMsIEkgd2FudGVk
IHRvIGRvIHNvbWV0aGluZyBsaWtlIHRoYXQKYW55d2F5IHRvIGFkZHJlc3MgRXJpYyBBbmhvbHQn
cyBzaW1pbGFyIGNvbmNlcm4uCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
