Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCDD89A76
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 09:54:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b20so7419406edw.11
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 01:54:57 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 15 Feb 2019 10:54:45 +0100
Message-Id: <20190215095448.13196-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20190215095448.13196-1-daniel.vetter@ffwll.ch>
References: <20190215095448.13196-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/6] tests: drop invalid name build checks
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhleSdyZSBjYXVzaW5nIHRyb3VibGVzIGJlY2F1c2UgdGhpcyBydW5zIGFsbCB0aGUgaWd0X2Zp
eHR1cmVzLCBhbmQKZG9pbmcgdGhhdCBvbiBhIGJ1aWxkIG1hY2hpbmUgaXMgYXQgYmVzdCBzdXJw
cmlzaW5nLgoKVGhlIG1haW4gYWltIGZvciB0aGlzIGlzIGNhdGNoaW5nIHRlc3RjYXNlcyB3aGlj
aCBmYWlsIHRvIGNhbGwKaWd0X2V4aXQuIEJ1dCBqdXN0IGVudW1lcmF0aW5nIHN1YnRlc3RzIGRv
ZXMgdGhhdCB0b28sIGFuZCB3ZSBoYXZlCmxpYnJhcnkgdW5pdCB0ZXN0cyB0byBtYWtlIHN1cmUg
dGhhdCdzIHRoZSBjYXNlICh3aXRoIGlndF9ub19leGl0IGFuZAppZ3Rfbm9fZXhpdF9saXN0X29u
bHkpLgoKQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpDYzogQXJr
YWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pZ3RfY29t
bWFuZF9saW5lLnNoIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoIGIvdGVzdHMvaWd0X2NvbW1hbmRf
bGluZS5zaAppbmRleCBlMDVlYzM0Y2UzMjEuLjkyNjQzYzRkNWUxNiAxMDA3NTUKLS0tIGEvdGVz
dHMvaWd0X2NvbW1hbmRfbGluZS5zaAorKysgYi90ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoCkBA
IC05NCwxMCArOTQsNiBAQCBjaGVja190ZXN0ICgpCiAJCQlmYWlsICR0ZXN0CiAJCWZpCiAJZmkK
LQotCSMgY2hlY2sgaW52YWxpZCBzdWJ0ZXN0IGhhbmRsaW5nCi0JZWNobyAiICBDaGVja2luZyBp
bnZhbGlkIHN1YnRlc3QgaGFuZGxpbmcuLi4iCi0JLi8kdGVzdCAtLXJ1bi1zdWJ0ZXN0IGludmFs
aWQtc3VidGVzdCA+IC9kZXYvbnVsbCAyPiYxICYmIGZhaWwgJHRlc3QKIH0KIAogVEVTVExJU1RG
SUxFPSIkdGVzdHNfZGlyL3Rlc3QtbGlzdC50eHQiCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
