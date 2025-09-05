Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF30DCA101C
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 13:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C31E10EBAB;
	Fri,  5 Sep 2025 13:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOuAWL4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2E110EBAB
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 13:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757080089; x=1788616089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bttm+9pZsL7TJqdUm2DmvOxCRfrCCLEJB2ReHL94T3o=;
 b=iOuAWL4PrX0w6tzwKa6cFrmJLxkcOdtloXl1RVSEp+ZOumSy4CBxiJKg
 xoNkaxIFLU9Ze5nqrK0WQsU9R6Rt8b7tFUSp1hUTT3aIf/HopdjH42D30
 mJ342J1762ObJx4OZ9GTgILArt07R1H6BHL1FJd4Q6aD6U6VGBboBhVn/
 8C0vS3roJvmhHJTuMeeL2rVMT3Vz5JtYS9fJ58F4JNNCLA5B8HGNZ39sr
 qQXFQZJS8gU5BZeZi+YAeygY8vMI19cPoc/HFd6fBkuqOAbsvFRDGb5fX
 Jk8QaxO/7PBGSqaWNs2o/s5YzoK/JffD1kXsxOF5ktyNzqhFS4c5xaXVY A==;
X-CSE-ConnectionGUID: Z9/7Bor+QduSafNchWe8gA==
X-CSE-MsgGUID: x4SAuVWySBGMjnj1DaEw/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59129770"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59129770"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 06:48:09 -0700
X-CSE-ConnectionGUID: QNOCoc+lRY2dWhYMJcdDkA==
X-CSE-MsgGUID: oE3WXUTHRm6RGua2txei9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="202982573"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.226])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 06:48:07 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 5/5] gitlab-ci: Add MkDocs documentation support
Date: Fri,  5 Sep 2025 15:47:33 +0200
Message-ID: <20250905134735.132119-6-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905134735.132119-1-pawel.sikora@intel.com>
References: <20250905134735.132119-1-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This commit ensures two things:

 * The API reference manual is built and copied to
   the MkDocs documentation directory.

 * The MkDocs documentation (from the docs directory)
   is also built.

As a result, the existing API reference manual will still be
available via an internal link in the MkDocs documentation.
(Note: the API reference retains original theme for now)

A relative link to api_reference/index.html is included
in the MkDocs navigation. This file will be generated
by the deploy job after the API reference manual is built.

After both builds are complete, all content will be copied
into the site directory and then manually moved into
public, for hosting on freedesktop GitLab Pages.

v3:
 - Simplify mkdocs build (Pawel)

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 .gitlab-ci.yml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fb5713fba..6813d9ff1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -75,12 +75,15 @@ build:tests-fedora:
   stage: build
   script:
     - meson setup --prefix=/opt/igt $MESON_OPTIONS build
+    - pip install -r docs/requirements-docs.txt
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
+    - mkdocs build
     - DESTDIR="$PWD/installdir" ninja -C build install
   artifacts:
     paths:
       - build
+      - site
       - installdir
 
 build:tests-fedora-no-libunwind:
@@ -241,8 +244,11 @@ pages:
     - build:tests-fedora
   stage: deploy
   script:
-    - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
-    - cp -r build/docs/reference/igt-gpu-tools/html public
+    - pip install -r docs/requirements-docs.txt
+    - cp -r build/docs/reference/igt-gpu-tools/html/ docs/api_reference
+    - mkdir -p docs/api_reference
+    - mkdocs build
+    - cp -r site public
   artifacts:
     paths:
       - public
-- 
2.51.0

