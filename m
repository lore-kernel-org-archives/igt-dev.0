Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608776E565
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Feb 2019 18:02:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b17so9703741eds.2
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Feb 2019 10:02:17 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 11 Feb 2019 19:02:01 +0100
Message-Id: <20190211180208.29406-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20190211180208.29406-1-daniel.vetter@ffwll.ch>
References: <20190211180208.29406-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/9] lib/tests: make sure igt_skip in
 igt_fork is forbidden
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

QW5vdGhlciBjb3JuZXIgY2FzZSB0byBjaGVjay4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGxpYi90ZXN0cy9pZ3RfZm9yay5jIHwg
MTQgKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvbGliL3Rlc3RzL2lndF9mb3JrLmMgYi9saWIvdGVzdHMvaWd0X2ZvcmsuYwppbmRl
eCBkNDk1Yzc4MTVlMDYuLjVmZjI5NTZkZDBhYiAxMDA2NDQKLS0tIGEvbGliL3Rlc3RzL2lndF9m
b3JrLmMKKysrIGIvbGliL3Rlc3RzL2lndF9mb3JrLmMKQEAgLTQzLDYgKzQzLDE1IEBACiBjaGFy
IHRlc3RbXSA9ICJ0ZXN0IjsKIGNoYXIgKmFyZ3ZfcnVuW10gPSB7IHRlc3QgfTsKIAorc3RhdGlj
IHZvaWQgaWd0X2ZvcmtfdnNfc2tpcCh2b2lkKQoreworCWlndF9mb3JrKGksIDEpIHsKKwkJaWd0
X3NraXAoInNraXBwaW5nIik7CisJfQorCisJaWd0X3dhaXRjaGlsZHJlbigpOworfQorCiBzdGF0
aWMgdm9pZCBpZ3RfZm9ya192c19hc3NlcnQodm9pZCkKIHsKIAlpZ3RfZm9yayhpLCAxKSB7CkBA
IC04Miw2ICs5MSwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiB7CiAJaW50
IHJldDsKIAorCS8qIGNoZWNrIHRoYXQgaWd0X2Fzc2VydCBpcyBmb3J3YXJkZWQgKi8KIAlyZXQg
PSBkb19mb3JrKGlndF9mb3JrX3ZzX2Fzc2VydCk7CiAJaW50ZXJuYWxfYXNzZXJ0KHJldCA9PSBJ
R1RfRVhJVF9GQUlMVVJFKTsKKworCS8qIGNoZWNrIHRoYXQgaWd0X3NraXAgd2l0aGluIGEgZm9y
ayBibG93cyB1cCAqLworCXJldCA9IGRvX2ZvcmsoaWd0X2ZvcmtfdnNfc2tpcCk7CisJaW50ZXJu
YWxfYXNzZXJ0KHJldCA9PSBTSUdBQlJUICsgMTI4KTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
