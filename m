Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89686EC65
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 14:58:25 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b17so121601eds.2
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Feb 2019 06:58:25 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu,  7 Feb 2019 15:57:07 +0100
Message-Id: <20190207145707.27623-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20190207145707.27623-1-daniel.vetter@ffwll.ch>
References: <20190207145707.27623-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/tests: make sure we catch igt_fork
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
aGF0ZXZlcikuCgpNYWtlIHN1cmUgd2UgY2F0Y2ggdGhpcy4KClNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGxpYi90ZXN0cy9pZ3RfZm9y
ay5jIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvbGliL3Rlc3RzL2lndF9mb3JrLmMgYi9saWIvdGVzdHMvaWd0X2ZvcmsuYwpp
bmRleCA1ZmYyOTU2ZGQwYWIuLjk0YjkzN2QxZDBmZSAxMDA2NDQKLS0tIGEvbGliL3Rlc3RzL2ln
dF9mb3JrLmMKKysrIGIvbGliL3Rlc3RzL2lndF9mb3JrLmMKQEAgLTYxLDYgKzYxLDEzIEBAIHN0
YXRpYyB2b2lkIGlndF9mb3JrX3ZzX2Fzc2VydCh2b2lkKQogCWlndF93YWl0Y2hpbGRyZW4oKTsK
IH0KIAorc3RhdGljIHZvaWQgaWd0X2ZvcmtfbGVhayh2b2lkKQoreworCWlndF9mb3JrKGksIDEp
IHsKKwkJc2xlZXAoMTApOworCX0KK30KKwogc3RhdGljIGludCBkb19mb3JrKHZvaWQgKCp0ZXN0
X3RvX3J1bikodm9pZCkpCiB7CiAJaW50IHBpZCwgc3RhdHVzOwpAQCAtOTgsNCArMTA1LDggQEAg
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCS8qIGNoZWNrIHRoYXQgaWd0X3NraXAg
d2l0aGluIGEgZm9yayBibG93cyB1cCAqLwogCXJldCA9IGRvX2ZvcmsoaWd0X2ZvcmtfdnNfc2tp
cCk7CiAJaW50ZXJuYWxfYXNzZXJ0KHJldCA9PSBTSUdBQlJUICsgMTI4KTsKKworCS8qIGNoZWNr
IHRoYXQgZmFpbHVyZSB0byBjbGVhbiB1cCBmYWlscyAqLworCXJldCA9IGRvX2ZvcmsoaWd0X2Zv
cmtfbGVhayk7CisJaW50ZXJuYWxfYXNzZXJ0KHJldCA9PSBTSUdBQlJUICsgMTI4KTsKIH0KLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
