Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C536E8DD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2019 12:43:31 +0000 (UTC)
Date: Tue, 10 Sep 2019 15:43:26 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190910124326.ll7etosdh7ilti22@ahiler-desk1.fi.intel.com>
References: <20190909113809.1229-1-petri.latvala@intel.com>
 <20190909113809.1229-2-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909113809.1229-2-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] runner: Add support for aborting on
 network failure
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDI6Mzg6MDdQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBJZiB0aGUgbmV0d29yayBnb2VzIGRvd24gd2hpbGUgdGVzdGluZywgQ0kgdGVuZHMg
dG8gaW50ZXJwcmV0IHRoYXQgYXMKPiB0aGUgZGV2aWNlIGJlaW5nIGRvd24sIGN1dHRpbmcgaXRz
IHBvd2VyIGFmdGVyIGEgd2hpbGUuIFRoaXMgY2F1c2VzIGFuCj4gaW5jb21wbGV0ZSB0byBhbiBp
bm5vY2VudCB0ZXN0LCBpbmNyZWFzaW5nIG5vaXNlIGluIHRoZSByZXN1bHRzLgo+IAo+IEEgbmV3
IGZsYWcgdG8gLS1hYm9ydC1vbi1tb25pdG9yZWQtZXJyb3IsICJwaW5nIiwgdXNlcyBsaWJvcGlu
ZyB0bwo+IHBpbmcgYSBob3N0IGNvbmZpZ3VyZWQgaW4gLmlndHJjIHdpdGggb25lIHBpbmcgYWZ0
ZXIgZWFjaCB0ZXN0Cj4gZXhlY3V0aW9uIGFuZCBhYm9ydHMgdGhlIHJ1biBpZiB0aGVyZSBpcyBu
byByZXBseSBpbiBhIGhhcmRjb2RlZAo+IGFtb3VudCBvZiB0aW1lLgo+IAo+IHYyOgo+ICAtIFVz
ZSBhIGhpZ2hlciB0aW1lb3V0Cj4gIC0gQWxsb3cgaG9zdG5hbWUgY29uZmlndXJhdGlvbiBmcm9t
IGVudmlyb25tZW50Cj4gdjM6Cj4gIC0gVXNlIHJ1bm5lcl9jX2FyZ3MgZm9yIGhvbGRpbmcgYyBh
cmdzIGZvciBydW5uZXIKPiAgLSBIYW5kbGUgcnVubmVyJ3MgbWVzb24gb3B0aW9ucyBpbiBydW5u
ZXIvbWVzb24uYnVpbGQKPiAgLSBJbnN0ZWFkIG9mIG9uZSBwaW5nIHdpdGggMjAgc2Vjb25kIHRp
bWVvdXQsIHBpbmcgd2l0aCAxIHNlY29uZCB0aW1lb3V0Cj4gICAgZm9yIGEgZHVyYXRpb24gb2Yg
MjAgc2Vjb25kcwo+IHY0Ogo+ICAtIFJlYmFzZQo+ICAtIFVzZSBub3ctZXhwb3J0ZWQgaWd0X2xv
YWRfaWd0cmMgaW5zdGVhZCBvZiBjb3B5cGFzdGUgY29kZQo+ICAtIFVzZSBkZWZpbmUgZm9yIHRp
bWVvdXQsIGNsZWFyZXIgdmFyIG5hbWUgZm9yIHNpbmdsZSBhdHRlbXB0IHRpbWVvdXQKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiBD
YzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+IENjOiBNYXJ0
aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFRvbWkgU2FydmVs
YSA8dG9taS5wLnNhcnZlbGFAaW50ZWwuY29tPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+ClJldmlld2VkLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBp
bnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
