Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749D16E220
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Oct 2018 11:36:27 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w19-v6so8151551eds.1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Oct 2018 04:36:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 25 Oct 2018 13:36:20 +0200
Message-Id: <20181025113620.768-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: Avoid dmesg
 fallout
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U3Vic2VxdWVudCB0ZXN0cyBoYXZlIGJlY29tZSByZWFsbHkgdW5oYXBweS4gUGFwZXIgb3ZlciB0
aGlzIGZvciBub3cuCgpJZiB0aGlzIGRvZXNuJ3Qgd29yaywgdGhlbiBJIHRoaW5rIHdlIG5lZWQg
dG8gcmV2ZXJ0LgoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19i
dWcuY2dpP2lkPTEwODU1MApCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTA4NTQ5CkNjOiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwu
Y29tPgotLS0KIHRlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYyB8IDUgKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90
ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0
aW9uLmMKaW5kZXggNDdhY2JlZWRhYTEyLi5hNzliMzZmOGFhMmMgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L2ttc19jb250ZW50X3Byb3RlY3Rpb24uYworKysgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0
aW9uLmMKQEAgLTE3MCw5ICsxNzAsMTIgQEAgdGVzdF9jcF9lbmFibGVfZGlzYWJsZShjb25zdCBl
bnVtIHBpcGUgcGlwZSwgaWd0X291dHB1dF90ICpvdXRwdXQsCiAJCQlpZ3RfZGVidWcoIlJldHJ5
ICglZC8yKSAuLi5cbiIsIDMgLSByZXRyeSk7CiAJfSB3aGlsZSAocmV0cnkgJiYgIXJldCk7CiAK
KwkvKiBGSVhNRTogS2VybmVsIHRvdGFsbHkgZmFsbHMgb3ZlciBpZiB3ZSBsZWF2ZSBIRENQIGVu
YWJsZWQuIFdvcmsKKwkgKiBhcm91bmQgdGhpcyBmb3Igbm93IGJ5IHJlc3RvcmluZyBpdCBiZWZv
cmUgY2hlY2sgd2hldGhlciBpdCB3b3JrZWQuICovCisJaWd0X291dHB1dF9zZXRfcHJvcF92YWx1
ZShvdXRwdXQsIElHVF9DT05ORUNUT1JfQ09OVEVOVF9QUk9URUNUSU9OLCAwKTsKKwogCWlndF9h
c3NlcnRfZihyZXQsICJDb250ZW50IFByb3RlY3Rpb24gbm90IGVuYWJsZWRcbiIpOwogCi0JaWd0
X291dHB1dF9zZXRfcHJvcF92YWx1ZShvdXRwdXQsIElHVF9DT05ORUNUT1JfQ09OVEVOVF9QUk9U
RUNUSU9OLCAwKTsKIAlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksICZyZWQpOwogCWlndF9kaXNw
bGF5X2NvbW1pdDIoZGlzcGxheSwgcyk7CiAKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
