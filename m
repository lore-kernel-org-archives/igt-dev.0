Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 10 Aug 2018 10:02:46 +0100
Message-Id: <20180810090246.9726-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Skip module reloads
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmVsb2FkaW5nIHRoZSBtb2R1bGUgbWF5IGltcGFjdCBzdWJzZXF1ZW50IHRlc3RzIGJ5IGRlc3Rh
YmlsaXNpbmcgdGhlCnN5c3RlbS4gQXMgd2UgZG8gZm9yIEJBVCwgaWYgd2Ugd2FudCB0byB0ZXN0
IHJlbG9hZHMsIGl0IHNob3VsZCBiZQpoYW5kbGVkIGV4cGxpY2l0bHkgYXQgdGhlIGVuZCBvZiB0
aGUgcnVuLCByYXRoZXIgdGhhbiBwbGFjZWQgYXQgcmFuZG9tCmluIHRoZSBtaWRkbGUgb2YgdGhl
IHRlc3QgbGlzdC4KClJlZmVyZW5jZXM6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hv
d19idWcuY2dpP2lkPTEwNjUzOQpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNo
cmlzLXdpbHNvbi5jby51az4KQ2M6IFRvbWkgU2FydmVsYSA8dG9taS5wLnNhcnZlbGFAaW50ZWwu
Y29tPgotLS0KIHRlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlz
dC50eHQgYi90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0CmluZGV4IDFkMTY1Mjk2NC4uMDY2
YTVjMDE0IDEwMDY0NAotLS0gYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0CisrKyBiL3Rl
c3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQKQEAgLTIsNiArMiw3IEBAIGlndEBtZXRhX3Rlc3Qo
QC4qKT8KICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAj
IEdFTQogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKK2ln
dEBkcnZfbW9kdWxlX3JlbG9hZChALiopPwogaWd0QGRydl9zZWxmdGVzdChALiopPwogaWd0QGRy
bV9tbShALiopPwogaWd0QGdlbV9idXN5QCg/IS4qYmFzaWMpLipoYW5nLioKLS0gCjIuMTguMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
