Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F4C89105
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 20:20:52 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 24 Apr 2019 16:20:31 -0400
Message-Id: <20190424202033.7601-8-lyude@redhat.com>
In-Reply-To: <20190424202033.7601-1-lyude@redhat.com>
References: <20190424202033.7601-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 7/9] lib/igt_core: Just use
 igt_can_fail() in __igt_run_subtest()
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
Cc: Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClRoYXQncyB3aGF0IGl0J3MgdGhl
cmUgZm9yLgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+ClJldmlld2VkLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4K
U2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBsaWIvaWd0
X2NvcmUuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY29yZS5jIGIvbGliL2lndF9jb3JlLmMKaW5k
ZXggNDNmYTE5N2YuLmQ1ZDRmY2UyIDEwMDY0NAotLS0gYS9saWIvaWd0X2NvcmUuYworKysgYi9s
aWIvaWd0X2NvcmUuYwpAQCAtOTAzLDkgKzkwMyw3IEBAIGJvb2wgX19pZ3RfcnVuX3N1YnRlc3Qo
Y29uc3QgY2hhciAqc3VidGVzdF9uYW1lKQogewogCWludCBpOwogCi0JYXNzZXJ0KCFpbl9zdWJ0
ZXN0KTsKLQlhc3NlcnQoIWluX2ZpeHR1cmUpOwotCWFzc2VydCh0ZXN0X3dpdGhfc3VidGVzdHMp
OworCWFzc2VydCghaWd0X2Nhbl9mYWlsKCkpOwogCiAJLyogY2hlY2sgdGhlIHN1YnRlc3QgbmFt
ZSBvbmx5IGNvbnRhaW5zIGEteiwgQS1aLCAwLTksICctJyBhbmQgJ18nICovCiAJZm9yIChpID0g
MDsgc3VidGVzdF9uYW1lW2ldICE9ICdcMCc7IGkrKykKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
