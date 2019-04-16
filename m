Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4AE089415
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 23:26:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F3F04E93D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 23:26:01 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Tue, 16 Apr 2019 19:25:45 -0400
Message-Id: <20190416232548.13755-6-lyude@redhat.com>
In-Reply-To: <20190416232548.13755-1-lyude@redhat.com>
References: <20190416232548.13755-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 5/8] lib/igt_core: Just use
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
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClRoYXQncyB3aGF0IGl0J3MgdGhl
cmUgZm9yLgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0t
CiBsaWIvaWd0X2NvcmUuYyB8IDQgKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY29yZS5jIGIvbGliL2lndF9j
b3JlLmMKaW5kZXggYTYzN2I5NGUuLjUwMzUwM2NlIDEwMDY0NAotLS0gYS9saWIvaWd0X2NvcmUu
YworKysgYi9saWIvaWd0X2NvcmUuYwpAQCAtOTAzLDkgKzkwMyw3IEBAIGJvb2wgX19pZ3RfcnVu
X3N1YnRlc3QoY29uc3QgY2hhciAqc3VidGVzdF9uYW1lKQogewogCWludCBpOwogCi0JaWd0X2lu
dGVybmFsX2Fzc2VydCghaW5fc3VidGVzdCk7Ci0JaWd0X2ludGVybmFsX2Fzc2VydCghaW5fZml4
dHVyZSk7Ci0JaWd0X2ludGVybmFsX2Fzc2VydCh0ZXN0X3dpdGhfc3VidGVzdHMpOworCWlndF9p
bnRlcm5hbF9hc3NlcnQoIWlndF9jYW5fZmFpbCgpKTsKIAogCS8qIGNoZWNrIHRoZSBzdWJ0ZXN0
IG5hbWUgb25seSBjb250YWlucyBhLXosIEEtWiwgMC05LCAnLScgYW5kICdfJyAqLwogCWZvciAo
aSA9IDA7IHN1YnRlc3RfbmFtZVtpXSAhPSAnXDAnOyBpKyspCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
