Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455466F0B7
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2018 11:11:08 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 23 Feb 2018 13:10:58 +0200
Message-Id: <20180223111058.30973-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/1] meson: Don't build docs when
 cross-compiling
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

QnVpbGRpbmcgZG9jdW1lbnRhdGlvbiByZXF1aXJlcyBleGVjdXRpbmcgYWxsIHRlc3QgYmluYXJp
ZXMgdG8gcHJvZHVjZQp0aGVpciByZXNwZWN0aXZlIGRlc2NyaXB0aW9uIHRleHRzLiBUaGlzIGNh
biBiZSBhIHZlcnkgdGltZS1jb25zdW1pbmcKcHJvY2VzcywgaWYgdmlhYmxlIGF0IGFsbCwgd2hl
biB0aGUgdGFyZ2V0IGFyY2ggZGlmZmVycyBmcm9tIHRoZQpob3N0LgoKRG9uJ3QgcHJvY2VzcyB0
aGUgZG9jIGRpcmVjdG9yeSBhdCBhbGwgd2hlbiBhbiBleGUgd3JhcHBlciBpcwpzZXR1cC4gVGhp
cyBhdm9pZHMgdGhlIHJ1bnRpbWUgcGVuYWx0eSB3aGVuIHRoZSB0YXJnZXQgYmluYXJpZXMgYXJl
CmV4ZWN1dGVkIHRocm91Z2ggcWVtdSwgYnV0IGxlYXZlcyBldmVyeXRoaW5nIGFzLWlzIHdoZW4g
dGhlIHRhcmdldApiaW5hcmllcyBjYW4gYmUgZGlyZWN0bHkgZXhlY3V0ZWQsIGxpa2Ugd2hlbiBj
cm9zcy1jb21waWxpbmcgdG8geDg2CmZyb20geDg2XzY0IGhvc3QuCgpTaWduZWQtb2ZmLWJ5OiBQ
ZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEVyaWMgQW5ob2x0IDxl
cmljQGFuaG9sdC5uZXQ+Ci0tLQogbWVzb24uYnVpbGQgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWVzb24uYnVp
bGQgYi9tZXNvbi5idWlsZAppbmRleCA1MDlhZTVkZS4uMGQ0OTY3MTggMTAwNjQ0Ci0tLSBhL21l
c29uLmJ1aWxkCisrKyBiL21lc29uLmJ1aWxkCkBAIC0xNDcsNCArMTQ3LDcgQEAgaWYgbGliZHJt
X2ludGVsLmZvdW5kKCkKIAllbmRpZgogZW5kaWYKIHN1YmRpcignbWFuJykKLXN1YmRpcignZG9j
cycpCisjIGhhc19leGVfd3JhcHBlcigpIGlzIHVuZGVmaW5lZCBpZiBidWlsZGluZyBuYXRpdmVs
eQoraWYgbm90IG1lc29uLmlzX2Nyb3NzX2J1aWxkKCkgb3Igbm90IG1lc29uLmhhc19leGVfd3Jh
cHBlcigpCisJc3ViZGlyKCdkb2NzJykKK2VuZGlmCi0tIAoyLjE0LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
