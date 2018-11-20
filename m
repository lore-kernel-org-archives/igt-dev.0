Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <154273781365.11623.18047213113245098824@skylake-alporthouse-com>
References: <20181120180757.25494-1-tvrtko.ursulin@linux.intel.com>
 <154273781365.11623.18047213113245098824@skylake-alporthouse-com>
Message-ID: <154273801086.11623.10308414098642711444@skylake-alporthouse-com>
Date: Tue, 20 Nov 2018 18:20:11 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/drv_selftest: Allow
 passing in module options from the command line
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMTEtMjAgMTg6MTY6NTMpCj4gUXVvdGluZyBUdnJ0
a28gVXJzdWxpbiAoMjAxOC0xMS0yMCAxODowNzo1NykKPiA+IEZyb206IFR2cnRrbyBVcnN1bGlu
IDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gPiAKPiA+IEEgbmV3IG9wdGlvbiAnLS1rbW9k
LW9wdGlvbnMnIGlzIGFkZGVkIHdoaWNoIHRha2VzIGEgc3RyaW5nIHdoaWNoIHdpbGwgYmUKPiA+
IHBhc3NlZCB0byBtb2Rwcm9iZSB3aGVuIGxvYWRpbmcgdGhlIG1vZHVsZS4KPiA+IAo+ID4gVGhp
cyBmb3IgaW5zdGFuY2UgYWxsb3dzIGVhc3kgb3ZlcnJpZGUgb2YgdGhpbmdzIGxpa2UgdGhlIHJh
bmRvbSBzZWVkIHdoZW4KPiA+IHRyeWluZyB0byByZXByb2R1Y2UgZmFpbHVyZXMuCj4gIAo+IEFu
eXdheSB3ZSBjYW4gc2ltcGx5IGV4dGVuZCB0aGUgb3B0aW9uIHBhcnNpbmcgbG9jYWxseT8gKEp1
c3QgZmluZCBpdAo+IHVuc2lnaHRseSB0byBoYXZlIHRlc3Qgc3BlY2lmaWMgb3B0aW9ucyBpbiBs
aWJpZ3QuKQo+IAo+IFN0YXNoaW5nIGFyZ2MvYXJndiBpbiBpZ3Rfc3VidGVzdF9pbml0X3BhcnNl
X29wdHMoKSBhbmQgdGhlbiBiZWluZyBhYmxlCj4gdG8gcnVuIGdldG9wdHMgaW5zaWRlIGlndF9t
YWluIHt9PwoKT3IgcGVyaGFwcywKCiNkZWZpbmUgaWd0X21haW5fYXJndiBcCiAgICAgICAgc3Rh
dGljIHZvaWQgaWd0X3Rva2VuY2F0KF9fcmVhbF9tYWluLCBfX0xJTkVfXykoaW50IGFyZ2MsIGNo
YXIgKiphcmd2KTsgXAogICAgICAgIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikgeyBc
CiAgICAgICAgICAgICAgICBpZ3Rfc3VidGVzdF9pbml0X3BhcnNlX29wdHMoJmFyZ2MsIGFyZ3Ys
IE5VTEwsIE5VTEwsIE5VTEwsIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBOVUxMLCBOVUxMKTsgXAogICAgICAgICAgICAgICAgaWd0X3Rva2VuY2F0KF9fcmVh
bF9tYWluLCBfX0xJTkVfXykoYXJnYywgY2hhciAqKmFyZ3YpOyBcCiAgICAgICAgICAgICAgICBp
Z3RfZXhpdCgpOyBcCiAgICAgICAgfSBcCiAgICAgICAgc3RhdGljIHZvaWQgaWd0X3Rva2VuY2F0
KF9fcmVhbF9tYWluLCBfX0xJTkVfXykoaW50IGFyZ2MsIGNoYXIgKiphcmd2KSBcCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
