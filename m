Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303376E2D5
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jul 2018 13:32:16 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 12 Jul 2018 14:32:07 +0100
Message-Id: <20180712133207.6267-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] igt/pm_rpm: Pass NULL to require no extra
 module options
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

V2UgdXNlIG9wdGlvbnMhPU5VTEwgdG8gZGV0ZXJtaW5lIGlmIHdlIHNob3VsZCByZXF1aXJlIHRo
ZSBtb2R1bGUgdG8gYmUKcmVsb2FkZWQgYW5kIGZhaWwgaWYgd2UgZmluZCBpdCBhbHJlYWR5IGxv
YWRlZC4gSW4gcG1fcnBtLCB3ZSBhcmUgb25seQplbnN1cmluZyB0aGUgTVNSIG1vZHVsZSBpcyBs
b2FkZWQsIGFuZCBvbmx5IHdhbnQgZGVmYXVsdCBvcHRpb25zLgoKRml4ZXM6IDRkYzJjZTBlICgi
bGliL2ttb2Q6IEZhaWwgaWYgdGhlIG1vZHVsZSBpcyBhbHJlYWR5IGxvYWRlZCIpClNpZ25lZC1v
ZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3Rz
L3BtX3JwbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcG1fcnBtLmMgYi90ZXN0cy9wbV9ycG0uYwppbmRl
eCA1MWQ4ZjM2NjEuLjFmMjY0N2JlMSAxMDA2NDQKLS0tIGEvdGVzdHMvcG1fcnBtLmMKKysrIGIv
dGVzdHMvcG1fcnBtLmMKQEAgLTEyNSw3ICsxMjUsNyBAQCBzdGF0aWMgaW50OF90ICpwbV9kYXRh
ID0gTlVMTDsKIAogc3RhdGljIGludCBtb2Rwcm9iZShjb25zdCBjaGFyICpkcml2ZXIpCiB7Ci0J
cmV0dXJuIGlndF9rbW9kX2xvYWQoZHJpdmVyLCAiIik7CisJcmV0dXJuIGlndF9rbW9kX2xvYWQo
ZHJpdmVyLCBOVUxMKTsKIH0KIAogLyogSWYgdGhlIHJlYWQgZmFpbHMsIHRoZW4gdGhlIG1hY2hp
bmUgZG9lc24ndCBzdXBwb3J0IFBDOCsgcmVzaWRlbmNpZXMuICovCi0tIAoyLjE4LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
