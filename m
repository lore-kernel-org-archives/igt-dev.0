Return-Path: <dri-devel-bounces@lists.freedesktop.org>
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [igt-dev] [PATCH] drm/doc: Make igts for cross-driver stuff
 mandatory
In-Reply-To: <96443618-83cf-1a55-7350-d8bcdf734709@amd.com>
References: <20190116163903.12785-1-daniel.vetter@ffwll.ch>
 <9d141cee-22b4-e0b0-6658-8c4a2afe6608@amd.com>
 <CAKMK7uH2zuAuLG=HJ6GzTY31tFihMYXTeXY1DRbeGvuQk33fMg@mail.gmail.com>
 <96443618-83cf-1a55-7350-d8bcdf734709@amd.com>
Date: Wed, 23 Jan 2019 12:03:40 +0200
Message-ID: <87k1iv3d37.fsf@intel.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Petri Latvala <petri.latvala@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, DRI Development <dri-devel@lists.freedesktop.org>, IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMiBKYW4gMjAxOSwgIldlbnRsYW5kLCBIYXJyeSIgPEhhcnJ5LldlbnRsYW5kQGFt
ZC5jb20+IHdyb3RlOgo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gYXBwZW5kIHNvbWV0aGluZyBs
aWtlICIsIGlmIHN1Y2ggYSB0ZXN0IGNhbiBiZQo+IHJlYXNvbmFibHkgbWFkZSB1c2luZyBJR1Qg
Zm9yIHRoZSB0YXJnZXQgSFcuIiB0byBtYWtlIGl0IGNsZWFyIHRvCj4gY29udHJpYnV0b3JzIHRo
YXQgaW4gY2FzZXMgbGlrZSB0aGUgb25lIGRpc2N1c3NlZCB0aGlzIGlzIGF0IHRoZQo+IHJldmll
d2VycyBkaXNjcmV0aW9uPwoKSSB0aGluayB0aGUgc2ltcGxlc3QgY2hhbmdlIHdvdWxkIGJlIHRv
IHNheSBBUEkgY2hhbmdlcyBTSE9VTEQgaGF2ZQpkcml2ZXItYWdub3N0aWMgdGVzdGNhc2VzLCB3
aXRoIHRoZSBSRkMgMjExOSBtZWFuaW5nIG9mIFNIT1VMRDoKCiAgIFNIT1VMRCAgIFRoaXMgd29y
ZCwgb3IgdGhlIGFkamVjdGl2ZSAiUkVDT01NRU5ERUQiLCBtZWFuIHRoYXQgdGhlcmUKICAgbWF5
IGV4aXN0IHZhbGlkIHJlYXNvbnMgaW4gcGFydGljdWxhciBjaXJjdW1zdGFuY2VzIHRvIGlnbm9y
ZSBhCiAgIHBhcnRpY3VsYXIgaXRlbSwgYnV0IHRoZSBmdWxsIGltcGxpY2F0aW9ucyBtdXN0IGJl
IHVuZGVyc3Rvb2QgYW5kCiAgIGNhcmVmdWxseSB3ZWlnaGVkIGJlZm9yZSBjaG9vc2luZyBhIGRp
ZmZlcmVudCBjb3Vyc2UuCgpJLmUuIHMvbmVlZC9zaG91bGQvLiBJIHRoaW5rIGl0IGFsc28gY2F0
Y2hlcyB0aGUgc3Bpcml0IG9mIHRoZQpkaXNjdXNzaW9uIGhlcmU7IHNlZW1zIGxpa2UgZXZlcnlv
bmUgYWdyZWVzIGhhdmluZyB0ZXN0cyBpcyBhIGdvb2QgZ29hbC4KCllvdSdsbCBoYXZlIHRvIGFs
bG93IGZvciByZXZpZXdlci9tYWludGFpbmVyL2NvbW11bml0eSBkaXNjcmV0aW9uIG5vCm1hdHRl
ciB3aGF0LiBKdWRnaW5nIGJ5IHRoZSBkaXNjdXNzaW9uLCBDUkMgYmFzZWQgdGVzdHMgZG9uJ3Qg
Y3VycmVudGx5Cm1lZXQgdGhlIGRyaXZlci1hZ25vc3RpYyByZXF1aXJlbWVudC4gUGxheWluZyBk
ZXZpbCdzIGFkdm9jYXRlLCB5b3UKY291bGQgYXJndWUgYW55IG5ldyBBUElzIGNvdWxkbid0IGJl
IHRlc3RlZCB3aXRoIENSQyBlaXRoZXIsIGV2ZW4gaWYgaXQKd2VyZSB0aGUgbW9zdCByZWFzb25h
YmxlIGFwcHJvYWNoIGZvciBpOTE1LgoKCkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50
ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
