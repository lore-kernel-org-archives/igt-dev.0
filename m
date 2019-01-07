Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 7 Jan 2019 13:01:25 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190107110125.GW17124@platvala-desk.ger.corp.intel.com>
References: <20190104153709.19350-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190104153709.19350-1-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_shrink: Exercise OOM and
 other routes to shrinking in reasonable time
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBKYW4gMDQsIDIwMTkgYXQgMDM6Mzc6MDlQTSArMDAwMCwgVHZydGtvIFVyc3VsaW4g
d3JvdGU6Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQgYi90ZXN0
cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0Cj4gaW5kZXggNzNkMTI3NjAzZDI4Li5kNzZhNGIzYjFj
NzEgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dAo+ICsrKyBiL3Rl
c3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQKPiBAQCAtNjAsNiArNjAsNyBAQCBpZ3RAZ2VtX3Jp
bmdfc3luY19jb3B5KEAuKik/Cj4gIGlndEBnZW1fcmluZ19zeW5jX2xvb3AoQC4qKT8KPiAgaWd0
QGdlbV9zZXFub193cmFwKEAuKik/Cj4gIGlndEBnZW1fc2hyaW5rQCg/IXJlY2xhaW0kKS4qCj4g
K2lndEBnZW1fc2hyaW5rQCg/IXJlY2xhaW1zLWFuZC1vb20pLioKPiAgaWd0QGdlbV9zb2Z0cGlu
QC4qKGhhbmd8UzQpLioKPiAgaWd0QGdlbV9zcGluX2JhdGNoKEAuKik/Cj4gIGlndEBnZW1fc3Rv
bGVuQC4qaGliZXJuYXRlLioKCgpJbiBjYXNlIHlvdSBkaWRuJ3Qgbm90aWNlOiBUaGUgZmlyc3Qg
Z2VtX3NocmluayBsaW5lIHJlbW92ZXMgdGhlCnJlY2xhaW1zLWFuZC1vb20qIHN1YnRlc3RzLCBh
bmQgdGhlIHNlY29uZCBsaW5lICh0aGUgb25lIHlvdSBhZGRlZCkKdGhlbiByZW1vdmVzIHRoZSAn
cmVjbGFpbScgc3VidGVzdCwgcmVzdWx0aW5nIGluIGFsbCBnZW1fc2hyaW5rCnN1YnRlc3RzIGJs
YWNrbGlzdGVkLgoKCi0tIApQZXRyaSBMYXR2YWxhCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
