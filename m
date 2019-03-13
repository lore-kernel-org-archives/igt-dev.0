Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121C96E0C7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 13:29:42 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id i20so1389448pfo.6
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 06:29:42 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 13 Mar 2019 15:29:30 +0200
Message-Id: <1552483770-13514-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] HAX tests/kms_atomic_transition: disable
 plane-use-after-nonblocking-unbind-fencing subtest
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VHJ5IHRvIGRpc2FibGUgc3VidGVzdCBwbGFuZS11c2UtYWZ0ZXItbm9uYmxvY2tpbmctdW5iaW5k
LWZlbmNpbmcgYXMgaXQgc2VlbXMKdG8gY3JlYXRlIHByb2JsZW1zIGZvciBvdGhlciB0ZXN0cyBy
YW4gYWZ0ZXIgaXQuIFRoaXMgaXMgdG8gc2VlIGlmIHRoZXNlCmFmdGVyIGVmZmVjdHMgYXJlIHBy
b2JsZW1hdGljLgotLS0KIHRlc3RzL2ttc19hdG9taWNfdHJhbnNpdGlvbi5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL2ttc19hdG9taWNfdHJhbnNpdGlvbi5jIGIvdGVzdHMva21zX2F0b21pY190cmFu
c2l0aW9uLmMKaW5kZXggMThmNzMzMS4uYWQ5OTc5YSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2F0
b21pY190cmFuc2l0aW9uLmMKKysrIGIvdGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uLmMKQEAg
LTkyNywxMCArOTI3LDEwIEBAIGlndF9tYWluCiAJCWZvcl9lYWNoX3BpcGVfd2l0aF92YWxpZF9v
dXRwdXQoJmRpc3BsYXksIHBpcGUsIG91dHB1dCkKIAkJCXJ1bl90cmFuc2l0aW9uX3Rlc3QoJmRp
c3BsYXksIHBpcGUsIG91dHB1dCwgVFJBTlNJVElPTl9BRlRFUl9GUkVFLCB0cnVlLCBmYWxzZSk7
CiAKLQlpZ3Rfc3VidGVzdCgicGxhbmUtdXNlLWFmdGVyLW5vbmJsb2NraW5nLXVuYmluZC1mZW5j
aW5nIikKKy8qCWlndF9zdWJ0ZXN0KCJwbGFuZS11c2UtYWZ0ZXItbm9uYmxvY2tpbmctdW5iaW5k
LWZlbmNpbmciKQogCQlmb3JfZWFjaF9waXBlX3dpdGhfdmFsaWRfb3V0cHV0KCZkaXNwbGF5LCBw
aXBlLCBvdXRwdXQpCiAJCQlydW5fdHJhbnNpdGlvbl90ZXN0KCZkaXNwbGF5LCBwaXBlLCBvdXRw
dXQsIFRSQU5TSVRJT05fQUZURVJfRlJFRSwgdHJ1ZSwgdHJ1ZSk7Ci0KKyovCiAJLyoKIAkgKiBU
ZXN0IG1vZGVzZXQgY2FzZXMgb24gaW50ZXJuYWwgcGFuZWxzIHNlcGFyYXRlbHkgd2l0aCBhIHJl
ZHVjZWQKIAkgKiBudW1iZXIgb2YgY29tYmluYXRpb25zLCB0byBhdm9pZCBsb25nIHJ1bnRpbWVz
IGR1ZSB0byBtb2Rlc2V0cyBvbgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
