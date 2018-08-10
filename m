Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 10 Aug 2018 10:41:44 +0100
Message-Id: <20180810094145.10182-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t 1/2] intel-ci: Comment on kernel selftest
 exclusion
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGtlcm5lbCBzZWxmdGVzdHMgYXJlIGV4Y2x1ZGVkIGZyb20gdGhlIHNoYXJkIGxpc3RzIGFz
IHRob3NlIGxpc3RzCmFyZSBjb21waWxlZCBzZXBhcmF0ZWx5LgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaW50ZWwtY2kv
YmxhY2tsaXN0LnR4dCB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0
IGIvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dAppbmRleCAxZDE2NTI5NjQuLjc3MDBhNjBi
NyAxMDA2NDQKLS0tIGEvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dAorKysgYi90ZXN0cy9p
bnRlbC1jaS9ibGFja2xpc3QudHh0CkBAIC0xLDkgKzEsMTIgQEAKIGlndEBtZXRhX3Rlc3QoQC4q
KT8KICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCi0jIEdF
TQorIyBLZXJuZWwgc2VsZnRlc3RzIChydW4gc2VwYXJhdGVseSkKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiBpZ3RAZHJ2X3NlbGZ0ZXN0KEAuKik/CiBp
Z3RAZHJtX21tKEAuKik/CisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIworIyBHRU0KKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiBpZ3RAZ2VtX2J1c3lAKD8hLipiYXNpYykuKmhhbmcuKgogaWd0QGdlbV9jbG9zZV9y
YWNlQCg/IS4qYmFzaWMpLioKIGlndEBnZW1fY29uY3VycmVudF9ibGl0KEAuKik/Ci0tIAoyLjE4
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
