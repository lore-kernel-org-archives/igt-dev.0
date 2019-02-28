Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D656E1F1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 14:49:29 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p27so17205799edc.6
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Feb 2019 06:49:29 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 28 Feb 2019 15:49:10 +0100
Message-Id: <20190228144910.26488-8-daniel.vetter@ffwll.ch>
In-Reply-To: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
References: <20190228144910.26488-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH 7/7] drm/atomic: -EACCESS for lease-denied crtc
 lookup
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
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2l0aCB0aGUgcHJldmlvdXMgcGF0Y2ggZHJtX2NydGNfZmluZCB3aWxsIHJldHVybiBOVUxMIHdo
ZW4gdGhlIGNydGMKaXNuJ3QgaW4gb3VyIGxlYXNlLCB3aGljaCB3aWxsIHRoZW4gZGlzYWJsZSB0
aGUgcGxhbmUvY29ubmVjdG9yLiBObwpsb25nZXIgYW4gaXNzdWUgc2luY2UgdGhlIGxlc3NvciBj
YW4ndCBlc2NhcGUgdGhlaXIgbGVhc2UgdGVybXMKYW55bW9yZSwgYnV0IG5vdCBxdWl0ZSBncmVh
dCBzZW1hbnRpY3MgeWV0IGVpdGhlci4KCkNhdGNoIHRoaXMgYW5kIHJldHVybiAtRUFDQ0VTLCBz
byB0aGF0IGF0IGxlYXN0IGV2aWwgdGVzdCBjYXNlcyBoYXZlIGEKYmV0dGVyIGNoYW5jZSBvZiBt
YWtpbmcgc3VyZSB0aGUga2VybmVsIHdvcmtzIGNvcnJlY3RseS4KClNpZ25lZC1vZmYtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fYXRvbWljX3VhcGkuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYwppbmRleCBmMGRiZmViMDA5MjYuLjY2ODcy
MTVjYzE4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYwpAQCAtNTM5LDYgKzUzOSw4IEBA
IHN0YXRpYyBpbnQgZHJtX2F0b21pY19wbGFuZV9zZXRfcHJvcGVydHkoc3RydWN0IGRybV9wbGFu
ZSAqcGxhbmUsCiAKIAl9IGVsc2UgaWYgKHByb3BlcnR5ID09IGNvbmZpZy0+cHJvcF9jcnRjX2lk
KSB7CiAJCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IGRybV9jcnRjX2ZpbmQoZGV2LCBmaWxlX3By
aXYsIHZhbCk7CisJCWlmICh2YWwgJiYgIWNydGMpCisJCQlyZXR1cm4gLUVBQ0NFUzsKIAkJcmV0
dXJuIGRybV9hdG9taWNfc2V0X2NydGNfZm9yX3BsYW5lKHN0YXRlLCBjcnRjKTsKIAl9IGVsc2Ug
aWYgKHByb3BlcnR5ID09IGNvbmZpZy0+cHJvcF9jcnRjX3gpIHsKIAkJc3RhdGUtPmNydGNfeCA9
IFU2NDJJNjQodmFsKTsKQEAgLTY5MCw2ICs2OTIsOCBAQCBzdGF0aWMgaW50IGRybV9hdG9taWNf
Y29ubmVjdG9yX3NldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAog
CiAJaWYgKHByb3BlcnR5ID09IGNvbmZpZy0+cHJvcF9jcnRjX2lkKSB7CiAJCXN0cnVjdCBkcm1f
Y3J0YyAqY3J0YyA9IGRybV9jcnRjX2ZpbmQoZGV2LCBmaWxlX3ByaXYsIHZhbCk7CisJCWlmICh2
YWwgJiYgIWNydGMpCisJCQlyZXR1cm4gLUVBQ0NFUzsKIAkJcmV0dXJuIGRybV9hdG9taWNfc2V0
X2NydGNfZm9yX2Nvbm5lY3RvcihzdGF0ZSwgY3J0Yyk7CiAJfSBlbHNlIGlmIChwcm9wZXJ0eSA9
PSBjb25maWctPmRwbXNfcHJvcGVydHkpIHsKIAkJLyogc2V0dGluZyBEUE1TIHByb3BlcnR5IHJl
cXVpcmVzIHNwZWNpYWwgaGFuZGxpbmcsIHdoaWNoCi0tIAoyLjE0LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
