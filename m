Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471CD6E8F0
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2018 10:11:38 +0000 (UTC)
Received: by mail-wm0-x243.google.com with SMTP id f3so39227208wmc.1
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2018 02:11:38 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Tue, 30 Jan 2018 10:11:15 +0000
Message-Id: <20180130101119.15758-10-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180130101119.15758-1-tvrtko.ursulin@linux.intel.com>
References: <20180130101119.15758-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 08/11] trace.pl: Fix engine busy accounting
 in split mode
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkluIHNwbGl0
IG1vZGUgYWxsIHJlcXVlc3RzIGhhdmUgdG8gYmUgYWRkZWQgdXAgc2luY2UgdGhleSB3ZXJlIHBy
ZXZpb3VzbHkKcmUtYXJyYW5nZWQgc28gdGhlcmUgaXMgbm8gb3ZlcmxhcC4KClNpZ25lZC1vZmYt
Ynk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CkNjOiBKb2huIEhh
cnJpc29uIDxKb2huLkMuSGFycmlzb25AaW50ZWwuY29tPgotLS0KIHNjcmlwdHMvdHJhY2UucGwg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3NjcmlwdHMvdHJhY2UucGwgYi9zY3JpcHRzL3RyYWNlLnBsCmluZGV4IDE2
YTE2NzVjNmMyMS4uZTM5ZDU2Yzk2MmU3IDEwMDc1NQotLS0gYS9zY3JpcHRzL3RyYWNlLnBsCisr
KyBiL3NjcmlwdHMvdHJhY2UucGwKQEAgLTU3OCw3ICs1NzgsOCBAQCBmb3JlYWNoIG15ICRrZXkg
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
