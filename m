Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77DE8934B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2019 12:23:51 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue,  9 Jul 2019 15:23:43 +0300
Message-Id: <20190709122345.29180-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] runner: Make sure we don't close
 watchdogs twice
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2V0dGluZyB0aGUgd2F0Y2hkb2cgZmQgbGlzdHMgdG8gTlVMTCBmb3IgZXh0cmEgZmlyZXdvcmtz
IGlmIGFjY2Vzc2VkCnVuaW50ZW50aW9uYWxseS4KCkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5s
YXR2YWxhQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1
c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIHJ1bm5lci9leGVjdXRvci5jIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9y
LmMgYi9ydW5uZXIvZXhlY3V0b3IuYwppbmRleCA3YTdlMjlkOS4uYWYwMmM1YTggMTAwNjQ0Ci0t
LSBhL3J1bm5lci9leGVjdXRvci5jCisrKyBiL3J1bm5lci9leGVjdXRvci5jCkBAIC00Niw2ICs0
NiwxMCBAQCBzdGF0aWMgdm9pZCBjbG9zZV93YXRjaGRvZ3Moc3RydWN0IHNldHRpbmdzICpzZXR0
aW5ncykKIAlmb3IgKGkgPSAwOyBpIDwgd2F0Y2hkb2dzLm51bV9kb2dzOyBpKyspIHsKIAkJX19j
bG9zZV93YXRjaGRvZyh3YXRjaGRvZ3MuZmRzW2ldKTsKIAl9CisKKwlmcmVlKHdhdGNoZG9ncy5m
ZHMpOworCXdhdGNoZG9ncy5udW1fZG9ncyA9IDA7CisJd2F0Y2hkb2dzLmZkcyA9IE5VTEw7CiB9
CiAKIHN0YXRpYyB2b2lkIGNsb3NlX3dhdGNoZG9nc19hdGV4aXQodm9pZCkKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
