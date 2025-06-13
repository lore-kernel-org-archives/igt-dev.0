Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC72C71148
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 14:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF3610E2C0;
	Fri, 13 Jun 2025 14:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGWEi8WL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C464810E2C0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749825104; x=1781361104;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=95hKp8M2TL6enaw2b02+ryO+l3tBD7C4Ww1QvD7GFeQ=;
 b=UGWEi8WLT6KXSu+FOcAoiGJAsO4X869SRMSwdK4e5fGtvuncgvtgPd5O
 fEPdM4YCesS8GZLCiJXSYJNHv44igB0DL4kQhEpDWvl7Iz6o6s9xPl4pr
 TnH7x1MZJwN5Ijlq8qbbo1OGoK0RZpmU60/TxOu3NJ/Z0fcoN+OhmpUTR
 Gk5P6p892d8DVPwdu/V47aDkl5UKKV8nZe7CakXU5dz38eQfjsWxYCGOb
 L8X51bIAiEkgHgYKiN4ltBuhSR0VhVeE0ksrPR25/L1svJMf1fX58xhDH
 D8t/wwC/Ze591Hx1YKWR2GHW+jnBB7LhSV+TiagyG6T91OCwwTPzn+eWO g==;
X-CSE-ConnectionGUID: qdy+LXWOSvWJn9tk51XJ+A==
X-CSE-MsgGUID: 2HDUKRWJQVGMncLBCnvAbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62694573"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="62694573"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:31:43 -0700
X-CSE-ConnectionGUID: aAg9yXY2Q5CARczC2kkTgQ==
X-CSE-MsgGUID: +9Y2brXsQcaz3NHoNfz4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="148390001"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:31:42 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 13 Jun 2025 16:30:49 +0200
Subject: [PATCH] gitlab-ci: correct meson setup commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-meson_setup-v1-1-47a3e06c5e9d@intel.com>
X-B4-Tracking: v=1; b=H4sIABg2TGgC/x3MQQ6DIBBA0auYWZdUURvbq5iGwDDUWQiE0aaJ8
 e6lXb7F/wcIFSaBR3NAoTcLp1jRXRrAxcYXKfbVoFs9treuVytJikZo27PyE073EQP1FqEWuVD
 gz/82P6udFVKu2IjL7+GGq9vXbAL5VKzZkhk0nOcXi2zCCYQAAAA=
X-Change-ID: 20250613-meson_setup-d8c895cfe3ac
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3877;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=95hKp8M2TL6enaw2b02+ryO+l3tBD7C4Ww1QvD7GFeQ=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoTDYfYEBSmSuuirijrBc50RjWP6XmElrC1LS/o
 6xifgv46/KJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaEw2HwAKCRAjYrKT3hD9
 1zhhC/wN/6pP9e+jAUZEXkBuuHRMTNYxumeIyr5osvmwPtXh8jngKfuIjUxDFG9ZGa1oTGfEuUD
 h1qAhESp3iz1IT3QIDFea5tUtfU4mk6+aA9lDC65SR4cvf3lc+Ys55HId4R8gprzlqPr/x3QmHm
 jDKg8Uu9s8uHY8y2tI4Fvr6mtT8kgYJRqIeyU6WkxrvMwcg7tfE3oG63HlKIqHjOStv2Uxl0DoJ
 z/ndc/v2JJv41s81HL3HSQZBMCRK+E5FY+jmIsQjf/tkx+qudOm3sZiRxFdB2kcE5tPMYD8SWLS
 aym1ygqMBrYyG4SiFXByPf8vPbgIn6VNieVdEvLPi3SGdTXUQNyimx41zALDhpajXWiiloE4xTj
 R/tvjjt1Cwsph1KLXsheiqO6fdSyrVWCTPVUPSZaPz133lyPeDGiKf8Ndg0RNdKR7n4AJOhP2zg
 kWauBycBHP1HG6ANgYRsxPt0/OYO+bmDMulOrFmP7Q6p4guNyMEhvEdzAYj3FCmBxeExI=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Newer meson does not like setup phase without setup argument and complains:
WARNING: Running the setup command as `meson [options]` instead of `meson setup [options]` is ambiguous and deprecated.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 .gitlab-ci.yml | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 519edab5ff9c79eae0de71e71e3f3645431a1459..587bf884708b315b3c015fec9467f7993bd56417 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -74,7 +74,7 @@ build-containers:build-fedora:
 build:tests-fedora:
   stage: build
   script:
-    - meson --prefix=/opt/igt $MESON_OPTIONS build
+    - meson setup --prefix=/opt/igt $MESON_OPTIONS build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
     - DESTDIR="$PWD/installdir" ninja -C build install
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
@@ -87,7 +87,7 @@ build:tests-fedora-no-libunwind:
   stage: build
   script:
     - dnf remove -y libunwind-devel
-    - meson -Dlibunwind=disabled build
+    - meson setup -Dlibunwind=disabled build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
 
 # documentation building is different with meson<0.47
@@ -96,7 +96,7 @@ build:tests-fedora-oldest-meson:
   script:
     - dnf remove -y meson
     - pip install /usr/src/meson-*.tar.gz
-    - meson $MESON_OPTIONS build
+    - meson setup $MESON_OPTIONS build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
 
@@ -104,7 +104,7 @@ build:tests-fedora-oldest-meson:
 build:tests-fedora-no-libdrm-nouveau:
   stage: build
   script:
-    - meson -Dlibdrm_drivers= build
+    - meson setup -Dlibdrm_drivers= build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
 
 build:tests-fedora-clang:
@@ -112,7 +112,7 @@ build:tests-fedora-clang:
   variables:
     CC: clang
   script:
-    - meson $MESON_OPTIONS build
+    - meson setup $MESON_OPTIONS build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
   artifacts:
     paths:
@@ -122,7 +122,7 @@ build:tests-debian-meson:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian:commit-$CI_COMMIT_SHA
   stage: build
   script:
-    - meson $MESON_OPTIONS build
+    - meson setup $MESON_OPTIONS build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
     - cp build/tests/test-list.txt meson-test-list.txt
   artifacts:
@@ -133,7 +133,7 @@ build:tests-debian-minimal:
   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-minimal:commit-$CI_COMMIT_SHA
   stage: build
   script:
-    - meson -Dtests=disabled -Dlibdrm_drivers="" build
+    - meson setup -Dtests=disabled -Dlibdrm_drivers="" build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
   artifacts:
     paths:
@@ -144,7 +144,7 @@ build:tests-debian-meson-armhf:
   stage: build
   script:
     - export PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/
-    - meson --cross-file meson-cross-armhf.txt build
+    - meson setup --cross-file meson-cross-armhf.txt build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
   artifacts:
     paths:
@@ -155,7 +155,7 @@ build:tests-debian-meson-arm64:
   stage: build
   script:
     - export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig/
-    - meson --cross-file meson-cross-arm64.txt build
+    - meson setup --cross-file meson-cross-arm64.txt build
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
   artifacts:
     paths:

---
base-commit: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1
change-id: 20250613-meson_setup-d8c895cfe3ac

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

