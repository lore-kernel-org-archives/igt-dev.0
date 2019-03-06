Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34206892DC
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2019 09:05:19 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <dfd125c4a8fe023c3ce79ce3d3a6bd3cc04e3c4f.1551156196.git.ashutosh.dixit@intel.com>
 <87k1hc61q3.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87k1hc61q3.wl-ashutosh.dixit@intel.com>
Message-ID: <155186310946.27405.5413538211018188272@skylake-alporthouse-com>
Date: Wed, 06 Mar 2019 09:05:14 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_nop: Drop signal-all
 subtest from CI
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBc2h1dG9zaCBEaXhpdCAoMjAxOS0wMy0wNiAwNDo1NTozMikKPiBPbiBNb24sIDI1
IEZlYiAyMDE5IDIwOjQ1OjA5IC0wODAwLCBBc2h1dG9zaCBEaXhpdCB3cm90ZToKPiA+IAo+ID4g
aWd0QGdlbS1leGVjLW5vcEBzaWduYWwtYWxsIHJ1bnMgYSBzaW5nbGUgdW5pbnRlcnJ1cHRlZCBs
b29wIGZvciAxNTAKPiA+IHNlYy4gVGhpcyByZXN1bHRzIGluIHRoZSB0ZXN0IGJlaW5nIG9uZSBv
ZiB0aGUgbG9uZ2VzdCBleGVjdXRpb24gdGltZXMKPiA+IGluIENJIHJ1bnMuCj4gPiAKPiA+IEFj
Y29yZGluZyB0byBtYWlsaW5nIGxpc3QgZGlzY3Vzc2lvbnMgdGhlIHRlc3QgcHJvdmlkZXMgbGl0
dGxlIG9mCj4gPiB2YWx1ZS4gVGhlcmVmb3JlIGRyb3AgaXQgZnJvbSB0aGUgQ0kuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+
Cj4gPiAtLS0KPiA+ICB0ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0IHwgMiArLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dCBiL3Rlc3RzL2ludGVsLWNpL2Js
YWNrbGlzdC50eHQKPiA+IGluZGV4IGYzNDQwZjMxLi5hMjEwMWFlNyAxMDA2NDQKPiA+IC0tLSBh
L3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQKPiA+ICsrKyBiL3Rlc3RzL2ludGVsLWNpL2Js
YWNrbGlzdC50eHQKPiA+IEBAIC0zNCw3ICszNCw3IEBAIGlndEBnZW1fZXhlY19mbHVzaEAoPyEu
KmJhc2ljKS4qCj4gPiAgaWd0QGdlbV9leGVjX2d0dGZpbGxAKD8hLipiYXNpYykuKgo+ID4gIGln
dEBnZW1fZXhlY19sYXRlbmN5KEAuKik/Cj4gPiAgaWd0QGdlbV9leGVjX2x1dF9oYW5kbGUoQC4q
KT8KPiA+IC1pZ3RAZ2VtX2V4ZWNfbm9wQCg/IS4qKGJhc2ljfHNpZ25hbC1hbGwpKS4qCj4gPiAr
aWd0QGdlbV9leGVjX25vcEAoPyEuKmJhc2ljKS4qCj4gPiAgaWd0QGdlbV9leGVjX3JlbG9jQCg/
IS4qYmFzaWMpLioKPiA+ICBpZ3RAZ2VtX2V4ZWNfc3VzcGVuZEAoPyEuKmJhc2ljKS4qCj4gPiAg
aWd0QGdlbV9leGVjX3doaXNwZXJAKD8hbm9ybWFsJCkuKgo+IAo+IEkgaGFkIHN1Ym1pdHRlZCB0
aGlzIHBhdGNoIGxhc3Qgd2Vlay4gSnVzdCB3YW50ZWQgdG8gY2hlY2sgaWYgdGhlcmUgd2FzIGFu
eQo+IGludGVyZXN0IGluIHRoZSBwYXRjaCBhdCBhbGwsIHRoYXQgaXMgaW4gcmVtb3ZpbmcKPiBp
Z3RAZ2VtLWV4ZWMtbm9wQHNpZ25hbC1hbGwgZnJvbSB0aGUgQ0kuIFRoYW5rcyEKCkFuZCBwdXNo
ZWQsIHRoYW5rIHlvdS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
