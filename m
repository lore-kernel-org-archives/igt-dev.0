Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B566CC3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 13:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DED110E79C;
	Wed, 10 Jul 2024 13:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aPzlGASm";
	dkim-atps=neutral
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0F710E79D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 13:25:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67B25C0005;
 Wed, 10 Jul 2024 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720617906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UNYlpmJeS5atnYU/8OEz5KxkcD/Dqhb6F9ENFRZtE5M=;
 b=aPzlGASme8bHzQ8ZV4fFOlqQcokAtUiw5nRZ6GN+T28j8oBfjn3VIzraUk0Cmo5sQMBHFG
 ggA5vVUnTp9plpBCdDSHK55hxS4bguIAebRP56j3DAi2eU2UPQKQ+9QeN5MTX9oL96r4Zm
 uAfEkD8jehzSlHqX+fqfIStznzYv821pq3LnkC+smoYUrfayyrqifZh8Sr3CQq098Q4rBW
 Y/Qnhyw2H+FyNZ5gKy//lFRezN1IiK8UTGw2RO0h+3yOQqJN4u3QlFEJqnp21yGyNWb9OI
 DSCkOTuhwqZ8Y7UgtPLzZ1TuvNRMAeMoAFM2/wPXpjMMtirGewMl1utEz+nRyg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 10 Jul 2024 15:22:12 +0200
Subject: [PATCH i-g-t] .gitlab-ci: Add explaination to run CI locally
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-gitlab-ci-local-v1-1-9c8d1dabeeeb@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAOLjmYC/x3MTQqAIBBA4avErBtQsR+6SrSwabQBqdCIILp70
 vJbvPdA5iScYageSHxJln0r0HUFtLotMMpSDEYZqzqtMMgZ3YwkGHdyEU3XaN+T9aYlKNWR2Mv
 9H0cQDHjC9L4ftmMCsWgAAAA=
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4820;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9AV77if3tQ5iR9wbTxWfr2vxXZBFyjt5CcwCeIpYebg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjoux1nWr9wZIiDR9qglqVao4z4iL7aG/1RtSe
 RtqlWfbw9eJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo6LsQAKCRAgrS7GWxAs
 4l/dEADSolsvpcWKGqzuhzTOSBBu0vCIsQqurEcmCYWM7CaWbn2UgGCUyYmFB4/+53JQvIr4HHD
 2lo7x2/VLikXrq6BF9z/JiGfx8KJuSJ7Slj7H5hDt9EQXoYsDLcSoD+4vduRf7CerF6ENIiq3pu
 Bn4xTIXKl8/8w73vh3QICQQFOE1G6Q/hkdAXNApN7lsFO9CunJOKIgb25FCLl+Hnl8INsJqr9Bt
 nFcdHAExUU50DnLPL0Ms8hrjb/h9cVFYI+YEShrXhf7hTuJNIWJNatjURRdMmKr4pM4FjyMVM3J
 rjqVOMNthgqlDr8d9QayoiinEfm2GET+UUgBAuhlC/kUqEXI/WKURBwp+g8fwVzki48JTcgwCRp
 KdmLsjBw+25R9G9zI4WPunQMA+h714X1Y9XVzR4m8Oo/2xoNqK+otlOfSRjgWHwpVRcVINNaIfx
 x+oo7aiphFjzYHk23DQVtOynVGQUKeN1tAJYdD+qr2a/aoVeRGMHcHE27QXdgXYi80hLrI7J75V
 Mf/nsD4aogzUC/mcwl1HTAxv3J3wdSfhgvgzpBJyOxtaBrTUaloFtUbT0bckM3wVzvDTC9WjT+g
 CXXnS8CCsYJJJHt8Uk4Jet5dNCY+4jcS2ICJq58UvJvq60wp7TBtx7DDBCgXo8Fa/hJpBYAv++0
 /PBmRvz5TRV9Tbg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Currently, the CI can only be run on the mailing list. To avoid flooding
because of error in certain configurations, add a new .gitlab-ci-local.yml
file and some explanation to run some part of the CI locally.

Added some instruction in CONTRIBUTING.md to explain how to use this new
pipeline locally.

---
The "normal" .gitlab-ci.yml can't be used as it uses prebuild docker
images, only available for gitlab runners.

I did not include any debian build as I was not able to rebuild the docker
images.
---
 .gitlab-ci-local.yml | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 CONTRIBUTING.md      | 16 +++++++++
 2 files changed, 115 insertions(+)

diff --git a/.gitlab-ci-local.yml b/.gitlab-ci-local.yml
new file mode 100644
index 000000000000..21d4468379c8
--- /dev/null
+++ b/.gitlab-ci-local.yml
@@ -0,0 +1,99 @@
+image: igt-build-fedora
+variables:
+  BUILDAH_FORMAT: docker
+  BUILDAH_ISOLATION: chroot
+  MESON_OPTIONS: >
+    -Dlibdrm_drivers=intel,nouveau,amdgpu
+    -Doverlay=enabled
+    -Dchamelium=enabled
+    -Dvalgrind=enabled
+    -Dman=enabled
+    -Dtests=enabled
+    -Drunner=enabled
+    -Dlibunwind=enabled
+  LANG: "C.UTF-8"
+
+stages:
+  - build
+  - test
+
+#################### BUILD #########################
+
+build:tests-fedora:
+  stage: build
+  script:
+    - meson --prefix=/opt/igt $MESON_OPTIONS build
+    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
+    - DESTDIR="$PWD/installdir" ninja -C build install
+    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
+  artifacts:
+    paths:
+      - build
+      - installdir
+
+build:tests-fedora-no-libunwind:
+  stage: build
+  script:
+    - dnf remove -y libunwind-devel
+    - meson -Dlibunwind=disabled build
+    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
+
+# documentation building is different with meson<0.47
+build:tests-fedora-oldest-meson:
+  stage: build
+  script:
+    - dnf remove -y meson
+    - pip install /usr/src/meson-*.tar.gz
+    - meson $MESON_OPTIONS build
+    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
+    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
+
+# ensure igt_nouveau stubs build when nouveau support for libdrm is disabled
+build:tests-fedora-no-libdrm-nouveau:
+  stage: build
+  script:
+    - meson -Dlibdrm_drivers= build
+    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
+
+build:tests-fedora-clang:
+  stage: build
+  variables:
+    CC: clang
+  script:
+    - meson $MESON_OPTIONS build
+    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
+  artifacts:
+    paths:
+      - build
+
+
+test:ninja-test:
+  retry: 2
+  dependencies:
+    - build:tests-fedora
+  stage: test
+  script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
+
+test:ninja-test-clang:
+  retry: 2
+  dependencies:
+    - build:tests-fedora-clang
+  variables:
+    CC: clang
+  stage: test
+  script: meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
+
+test:list-undocumented-tests:
+  dependencies:
+    - build:tests-fedora
+  stage: test
+  script: .gitlab-ci/list_undocumented_tests.py build/tests/test-list.txt > undocumented_tests.txt
+  artifacts:
+    paths:
+      - undocumented_tests.txt
+
+test:verify-blacklists:
+  dependencies:
+    - build:tests-fedora
+  stage: test
+  script: for bl in tests/intel-ci/blacklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 2ab8a48f6ae9..721fc6035b77 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -78,6 +78,22 @@ Sending Patches
 - Changes to the testcases are automatically tested. Take the results into
   account before merging.
 
+- When pushing a new series, your series will be build-tested by the CI. It is
+  useful to avoid merging broken stuff. You can run this CI locally by using the
+  project https://github.com/firecow/gitlab-ci-local. To install it, please
+  refer to its README (on debian, the package gitlab-ci-local can be used).
+
+  To run the CI, you need to build docker images:
+
+    docker build . -f Dockerfile.build-fedora -t igt-build-fedora:latest
+
+  Now you should be able to run the CI:
+
+    gitlab-ci-local --file .gitlab-ci-local.yml
+
+  If you want to run a specific stage, you can add it to the command line:
+
+    gitlab-ci-local --file .gitlab-ci-local.yml <stage>
 
 Commit Rights
 -------------

---
base-commit: f48806ee249015e967bb220eba8559c5e829d609
change-id: 20240710-gitlab-ci-local-2751f8c4f26c

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

