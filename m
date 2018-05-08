Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x244.google.com (mail-wr0-x244.google.com
 [IPv6:2a00:1450:400c:c0c::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10D56EB0A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 May 2018 17:31:44 +0000 (UTC)
Received: by mail-wr0-x244.google.com with SMTP id p5-v6so33098989wre.12
 for <igt-dev@lists.freedesktop.org>; Tue, 08 May 2018 10:31:44 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Tue,  8 May 2018 18:31:12 +0100
Message-Id: <20180508173115.24550-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180508173115.24550-1-tvrtko.ursulin@linux.intel.com>
References: <20180508173115.24550-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 4/7] trace.pl: Fix engine busy accounting in
 split mode
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkluIHNwbGl0
IG1vZGUgYWxsIHJlcXVlc3RzIGhhdmUgdG8gYmUgYWRkZWQgdXAgc2luY2UgdGhleSB3ZXJlIHBy
ZXZpb3VzbHkKcmUtYXJyYW5nZWQgc28gdGhlcmUgaXMgbm8gb3ZlcmxhcC4KClNpZ25lZC1vZmYt
Ynk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CkNjOiBKb2huIEhh
cnJpc29uIDxKb2huLkMuSGFycmlzb25AaW50ZWwuY29tPgotLS0KIHNjcmlwdHMvdHJhY2UucGwg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3NjcmlwdHMvdHJhY2UucGwgYi9zY3JpcHRzL3RyYWNlLnBsCmluZGV4IGZh
ZTk0ZDUwNDRlZi4uNjk2YzE4ZThiMWNmIDEwMDc1NQotLS0gYS9zY3JpcHRzL3RyYWNlLnBsCisr
KyBiL3NjcmlwdHMvdHJhY2UucGwKQEAgLTYwMSw3ICs2MDEsOCBAQCBmb3JlYWNoIG15ICRrZXkg
KEBzb3J0ZWRfa2V5cykgewogCSRkYnska2V5fS0+eydzdWJtaXQtZGVsYXknfSA9ICRkYnska2V5
fS0+eydzdWJtaXQnfSAtICRkYnska2V5fS0+eydxdWV1ZSd9OwogCSRkYnska2V5fS0+eydkdXJh
dGlvbid9ID0gJG5vdGlmeSAtICRzdGFydDsKIAotCSRydW5uaW5neyRyaW5nfSArPSAkZW5kIC0g
JHN0YXJ0IHVubGVzcyBleGlzdHMgJGRieyRrZXl9LT57J25vLWVuZCd9OworCSRydW5uaW5neyRy
aW5nfSArPSAkZW5kIC0gJHN0YXJ0IGlmICRjb3JyZWN0X2R1cmF0aW9ucyBvcgorCQkJCQkgICAg
bm90IGV4aXN0cyAkZGJ7JGtleX0tPnsnbm8tZW5kJ307CiAJJHJ1bm5hYmxleyRyaW5nfSArPSAk
ZGJ7JGtleX0tPnsnZXhlY3V0ZS1kZWxheSd9OwogCSRxdWV1ZWR7JHJpbmd9ICs9ICRzdGFydCAt
ICRkYnska2V5fS0+eydleGVjdXRlLWRlbGF5J30gLSAkZGJ7JGtleX0tPnsncXVldWUnfTsKIAot
LSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
