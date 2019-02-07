Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BC56EC93
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 16:51:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b17so457562eds.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Feb 2019 08:51:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu,  7 Feb 2019 17:50:57 +0100
Message-Id: <20190207165100.20407-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20190207165100.20407-1-daniel.vetter@ffwll.ch>
References: <20190207165100.20407-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] lib/tests: make sure we catch igt_fork
 leaks
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

VGVzdHMgaGF2ZSB0byBjYWxsIGlndF93YWl0Y2hpbGRyZW4oX3RpbWVvdXQpIGJlZm9yZSB0aGV5
IGZpbmlzaAooZWl0aGVyIHdpdGggc3VjY2VzcyBvciBhbiBpZ3RfZmFpbC9hc3NlcnQvc2tpcC93
aGF0ZXZlcikuCgpNYWtlIHN1cmUgd2UgY2F0Y2ggdGhpcy4KCnYyOiBBbm90aGVyIHRlc3RjYXNl
IHRvIG1ha2Ugc3VyZSBpZ3Rfd2FpdGNoaWxkcmVuX3RpbWVvdXQgY2xlYW5zIHVwLgoKdjM6IEFj
dHVhbGx5IHRlc3QgdGhhdCBpZ3Rfd2FpdGNoaWxkcmVuX3RpbWVvdXQga2lsbHMgY2hpbGRyZW4g
LSB3ZQp3YW50IGEgcHJvcGVyIElHVF9FWElUX0ZBSUxVUkUsIG5vdCBzb21lIGFzc2VydC4KClNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0K
IGxpYi90ZXN0cy9pZ3RfZm9yay5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi90ZXN0cy9pZ3Rf
Zm9yay5jIGIvbGliL3Rlc3RzL2lndF9mb3JrLmMKaW5kZXggNWZmMjk1NmRkMGFiLi5lNWIwYWIw
MTZiMjMgMTAwNjQ0Ci0tLSBhL2xpYi90ZXN0cy9pZ3RfZm9yay5jCisrKyBiL2xpYi90ZXN0cy9p
Z3RfZm9yay5jCkBAIC02MSw2ICs2MSwyMiBAQCBzdGF0aWMgdm9pZCBpZ3RfZm9ya192c19hc3Nl
cnQodm9pZCkKIAlpZ3Rfd2FpdGNoaWxkcmVuKCk7CiB9CiAKK3N0YXRpYyB2b2lkIGlndF9mb3Jr
X2xlYWsodm9pZCkKK3sKKwlpZ3RfZm9yayhpLCAxKSB7CisJCXNsZWVwKDEwKTsKKwl9Cit9CisK
K3N0YXRpYyB2b2lkIGlndF9mb3JrX3RpbWVvdXRfbGVhayh2b2lkKQoreworCWlndF9mb3JrKGks
IDEpIHsKKwkJc2xlZXAoMTApOworCX0KKworCWlndF93YWl0Y2hpbGRyZW5fdGltZW91dCgxLCAi
bGlicmFyeSB0ZXN0Iik7Cit9CisKIHN0YXRpYyBpbnQgZG9fZm9yayh2b2lkICgqdGVzdF90b19y
dW4pKHZvaWQpKQogewogCWludCBwaWQsIHN0YXR1czsKQEAgLTk4LDQgKzExNCwxMiBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJLyogY2hlY2sgdGhhdCBpZ3Rfc2tpcCB3aXRo
aW4gYSBmb3JrIGJsb3dzIHVwICovCiAJcmV0ID0gZG9fZm9yayhpZ3RfZm9ya192c19za2lwKTsK
IAlpbnRlcm5hbF9hc3NlcnQocmV0ID09IFNJR0FCUlQgKyAxMjgpOworCisJLyogY2hlY2sgdGhh
dCBmYWlsdXJlIHRvIGNsZWFuIHVwIGZhaWxzICovCisJcmV0ID0gZG9fZm9yayhpZ3RfZm9ya19s
ZWFrKTsKKwlpbnRlcm5hbF9hc3NlcnQocmV0ID09IFNJR0FCUlQgKyAxMjgpOworCisJLyogY2hl
Y2sgdGhhdCBpZ3Rfd2FpdGNoaWxkcmVuX3RpbWVvdXQgY2xlYW5zIHVwKi8KKwlyZXQgPSBkb19m
b3JrKGlndF9mb3JrX3RpbWVvdXRfbGVhayk7CisJaW50ZXJuYWxfYXNzZXJ0KHJldCA9PSBJR1Rf
RVhJVF9GQUlMVVJFKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
