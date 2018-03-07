Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A910B6E030
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Mar 2018 15:17:44 +0000 (UTC)
Date: Wed, 7 Mar 2018 17:17:37 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20180307151737.GB3313@ahiler-desk1.ger.corp.intel.com>
References: <20180227085232.54025-1-maarten.lankhorst@linux.intel.com>
 <20180227085232.54025-4-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180227085232.54025-4-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/4] tests/kms_frontbuffer_tracking:
 Convert test to use igt_display, v3.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDk6NTI6MzFBTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gU3RyYWlnaHQgY29udmVyc2lvbiwgbm8gYmVoYXZpb3JhbCBjaGFuZ2VzIHll
dC4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gSGFuZGxlIDJ4IG91dHB1dHMgY29ycmVjdGx5
Lgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBTZXQgY29ycmVjdCBwYXJhbWV0ZXJzIGluIHNldF9t
b2RlX2Zvcl9wYXJhbXMsIHNvIGF0b21pYyBjb21taXQgZm9yCj4gICAyeCBvdXRwdXRzIGRvZXNu
J3Qgc2NhbGUuCj4gLSBGaXggYWNjaWRlbnRhbCBzY2FsaW5nIGluIHNldF9wcmltX3BsYW5lX2Zv
cl9wYXJhbXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KCkdlbmVyYWxseSB0aGUgY29udmVyc2lvbiBsb29r
cyBnb29kIHRvIG1lLCBidXQgSSBjYW4ndCBzbGFwIHItYgp5ZXQgYmVjYXVzZSB0aGVyZSBhcmUg
dGhvc2UgbmV3IGZhaWxzOgoKClRlc3Qga21zX2Zyb250YnVmZmVyX3RyYWNraW5nOgogICAgICAg
IFN1Ymdyb3VwIGZiYy0ycC1wcmltc2Nybi1wcmktc2hyZmItZHJhdy1yZW5kZXI6CiAgICAgICAg
ICAgICAgICBwYXNzICAgICAgIC0+IEZBSUwgICAgICAgKHNoYXJkLWhzdykKICAgICAgICBTdWJn
cm91cCBmYmMtMnAtc2NuZHNjcm4tcHJpLXNocmZiLWRyYXctbW1hcC1ndHQ6CiAgICAgICAgICAg
ICAgICBwYXNzICAgICAgIC0+IEZBSUwgICAgICAgKHNoYXJkLWhzdykKICAgICAgICBTdWJncm91
cCBmYmMtMnAtc2NuZHNjcm4tc2hyZmItcGxmbGlwLWJsdDoKICAgICAgICAgICAgICAgIHBhc3Mg
ICAgICAgLT4gRkFJTCAgICAgICAoc2hhcmQtaHN3KQoKClRoZXJlJ3MgZXZlbiBhIGJ1ZyBmb3Ig
dGhhdCAoZmRvIzEwMTYyMyksIGJ1dCB3ZSBuZXZlciBoYWQgaGl0IHRoZSBpc3N1ZQp3aXRoIHRo
b3NlIHBhcnRpY3VsYXIgMyB0ZXN0cyBiZWZvcmUsIHNvIHRoZXkgYXJlIG5vdCBzdXBwcmVzc2Vk
IGJ5IHRoZQpjaWJ1Z2xvZy4KCkkndmUgZG9uZSBhIENJIHJlcnVuIHRvIG1ha2Ugc3VyZSBpdCdz
IGNvbnNpc3RlbnQgKGFuZCBpdCBpcywgMi8yIDotKSkKYW5kIEkndmUgdHJpZWQgdG8gZmlndXJl
IG91dCB3aHkgd2UgaGl0IHRoZSBpc3N1ZSB3aXRoIHlvdXIgY2hhbmdlcwp3aGlsZSBJIHdhcyBk
b2luZyB0aGUgcmV2aWV3LCBidXQgSSBoYXZlbid0IHNwb3R0ZWQgYW55dGhpbmcgc3VzcGljaW91
cy4KCi0tIApDaGVlcnMsCkFyZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
