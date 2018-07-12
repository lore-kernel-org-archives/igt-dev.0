Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54E16F101
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jul 2018 20:05:54 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 12 Jul 2018 13:05:43 -0700
Message-Id: <20180712200543.25661-1-lucas.demarchi@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests: build gem_concurrent_all
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

VGhpcyB3YXMgcmVtb3ZlZCBmcm9tIGRlZmF1bHQgYnVpbGQgaW4gYXV0b3Rvb2xzIGJlY2F1c2Ug
aXQgaGFzIGxvdHMgb2YKc3VidGVzdHM6IGE2MzNhZDAzICgidGVzdHM6IFNlcGFyYXRlIHRlc3Rz
IHdpdGggbG90cyBvZiBzdWJ0ZXN0cyIpLgpIb3dldmVyIGluIG1lc29uIHRoZXJlJ3Mgbm8gb3B0
aW9uIHRvIGFjdHVhbGx5IGJ1aWxkIGl0LgoKU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hp
IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+Ci0tLQoKT3IgZG8gd2Ugd2FudCB0byBoaWRlIGl0
IHVuZGVyIGEgZmxhZz8KCiB0ZXN0cy9tZXNvbi5idWlsZCB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQgYi90ZXN0cy9t
ZXNvbi5idWlsZAppbmRleCAwMjliODA0My4uZGQxMTFkMWMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL21l
c29uLmJ1aWxkCisrKyBiL3Rlc3RzL21lc29uLmJ1aWxkCkBAIC0yNyw2ICsyNyw3IEBAIHRlc3Rf
cHJvZ3MgPSBbCiAJJ2dlbV9jcmVhdGUnLAogCSdnZW1fY3NfcHJlZmV0Y2gnLAogCSdnZW1fY3Nf
dGxiJywKKwknZ2VtX2NvbmN1cnJlbnRfYWxsJywKIAknZ2VtX2N0eF9iYWRfZGVzdHJveScsCiAJ
J2dlbV9jdHhfYmFkX2V4ZWMnLAogCSdnZW1fY3R4X2NyZWF0ZScsCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
