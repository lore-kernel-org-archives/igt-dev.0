Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71DA892E7
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 16:25:42 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g19so11394316edp.2
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 08:25:42 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 20 Feb 2019 17:25:25 +0100
Message-Id: <20190220162530.31643-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20190220162530.31643-1-daniel.vetter@ffwll.ch>
References: <20190220162530.31643-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH i-g-t 4/9] tests/kms_release: invalid checks for
 revoke-lease ioctl
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Keith Packard <keithp@keithp.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Rm91bmQgYSBmZXcgY29ybmVyIGNhc2VzIHRvIHZhbGlkYXRlLiBQdXQgdGhlbSBpbnRvIHRoZSBl
eGlzdGluZwp0ZXN0Y2FzZS4KCkNjOiBLZWl0aCBQYWNrYXJkIDxrZWl0aHBAa2VpdGhwLmNvbT4K
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0t
LQogdGVzdHMva21zX2xlYXNlLmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2xlYXNlLmMgYi90ZXN0cy9r
bXNfbGVhc2UuYwppbmRleCA0MDYyYTBiMzY1YzkuLjI5OGQ4MWM3MWJhOSAxMDA2NDQKLS0tIGEv
dGVzdHMva21zX2xlYXNlLmMKKysrIGIvdGVzdHMva21zX2xlYXNlLmMKQEAgLTUxMSw2ICs1MTEs
MTQgQEAgc3RhdGljIHZvaWQgbGVhc2VfcmV2b2tlKGRhdGFfdCAqZGF0YSkKIAogCWlndF9kaXNw
bGF5X3JlcXVpcmUoJmxlYXNlLmRpc3BsYXksIGxlYXNlLmZkKTsKIAorCS8qIHRyeSB0byByZXZv
a2UgYW4gaW52YWxpZCBsZWFzZSAqLworCW1ybC5sZXNzZWVfaWQgPSAwOworCWlndF9hc3NlcnRf
ZXEocmV2b2tlX2xlYXNlKGRhdGEtPm1hc3Rlci5mZCwgJm1ybCksIC1FTk9FTlQpOworCisJLyog
dHJ5IHRvIHJldm9rZSB3aXRoIHRoZSB3cm9uZyBmZCAqLworCW1ybC5sZXNzZWVfaWQgPSBsZWFz
ZS5sZXNzZWVfaWQ7CisJaWd0X2Fzc2VydF9lcShyZXZva2VfbGVhc2UobGVhc2UuZmQsICZtcmwp
LCAtRUFDQ0VTKTsKKwogCS8qIFJldm9rZSB0aGUgbGVhc2UgdXNpbmcgdGhlIG1hc3RlciBmZCAq
LwogCW1ybC5sZXNzZWVfaWQgPSBsZWFzZS5sZXNzZWVfaWQ7CiAJaWd0X2Fzc2VydF9lcShyZXZv
a2VfbGVhc2UoZGF0YS0+bWFzdGVyLmZkLCAmbXJsKSwgMCk7CkBAIC01MjIsNiArNTMwLDEwIEBA
IHN0YXRpYyB2b2lkIGxlYXNlX3Jldm9rZShkYXRhX3QgKmRhdGEpCiAJaWd0X2Fzc2VydF9lcShy
ZXQsIC1FTk9FTlQpOwogCiAJdGVybWluYXRlX2xlYXNlKCZsZWFzZSk7CisKKwkvKiBtYWtlIHN1
cmUgdGhlIGxlYXNlIGlzIGdvbmUgKi8KKwltcmwubGVzc2VlX2lkID0gbGVhc2UubGVzc2VlX2lk
OworCWlndF9hc3NlcnRfZXEocmV2b2tlX2xlYXNlKGRhdGEtPm1hc3Rlci5mZCwgJm1ybCksIC1F
Tk9FTlQpOwogfQogCiAvKiBUZXN0IGxlYXNpbmcgb2JqZWN0cyBtb3JlIHRoYW4gb25jZSAqLwot
LSAKMi4xNC40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
