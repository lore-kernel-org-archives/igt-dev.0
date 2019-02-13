Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016976E708
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 10:36:00 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a2so1510514edi.0
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 02:36:00 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 13 Feb 2019 11:35:45 +0100
Message-Id: <20190213103551.5438-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20190213103551.5438-1-daniel.vetter@ffwll.ch>
References: <20190213103551.5438-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/9] lib/tests: make sure igt_skip in
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

QW5vdGhlciBjb3JuZXIgY2FzZSB0byBjaGVjay4KCnYyOiBSZWJhc2UuIE5vdGUgdGhhdCB3ZSBz
dGlsbCBoYXZlIHRoZSBTSUcgKyAxMjggZXhpdCBjb2RlLCB0aGF0J3MKaG93IGlndF93YWl0Y2hp
bGRyZW4gZm9yd2FyZHMgY2hpbGQgZGVhdGggdG8gdGhlIHBhcmVudCdzIGV4aXQgY29kZS4KClNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0K
IGxpYi90ZXN0cy9pZ3RfZm9yay5jIHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL3Rlc3RzL2lndF9mb3JrLmMgYi9s
aWIvdGVzdHMvaWd0X2ZvcmsuYwppbmRleCA4ZDNjMWJkMDIyODguLjY3NjllODRhNjk4OSAxMDA2
NDQKLS0tIGEvbGliL3Rlc3RzL2lndF9mb3JrLmMKKysrIGIvbGliL3Rlc3RzL2lndF9mb3JrLmMK
QEAgLTQzLDYgKzQzLDE1IEBACiBjaGFyIHRlc3RbXSA9ICJ0ZXN0IjsKIGNoYXIgKmFyZ3ZfcnVu
W10gPSB7IHRlc3QgfTsKIAorc3RhdGljIHZvaWQgaWd0X2ZvcmtfdnNfc2tpcCh2b2lkKQorewor
CWlndF9mb3JrKGksIDEpIHsKKwkJaWd0X3NraXAoInNraXBwaW5nIik7CisJfQorCisJaWd0X3dh
aXRjaGlsZHJlbigpOworfQorCiBzdGF0aWMgdm9pZCBpZ3RfZm9ya192c19hc3NlcnQodm9pZCkK
IHsKIAlpZ3RfZm9yayhpLCAxKSB7CkBAIC03OSw2ICs4OCwxMSBAQCBpbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqKmFyZ3YpCiB7CiAJaW50IHJldDsKIAorCS8qIGNoZWNrIHRoYXQgaWd0X2Fzc2Vy
dCBpcyBmb3J3YXJkZWQgKi8KIAlyZXQgPSBkb19mb3JrKGlndF9mb3JrX3ZzX2Fzc2VydCk7CiAJ
aW50ZXJuYWxfYXNzZXJ0KFdFWElUU1RBVFVTKHJldCkgPT0gSUdUX0VYSVRfRkFJTFVSRSk7CisK
KwkvKiBjaGVjayB0aGF0IGlndF9za2lwIHdpdGhpbiBhIGZvcmsgYmxvd3MgdXAgKi8KKwlyZXQg
PSBkb19mb3JrKGlndF9mb3JrX3ZzX3NraXApOworCWludGVybmFsX2Fzc2VydChXRVhJVFNUQVRV
UyhyZXQpID09IFNJR0FCUlQgKyAxMjgpOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
