Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE5FCA0FE1
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 07:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9613510E0C7;
	Fri, 22 Aug 2025 07:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtyKpA67";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C4C10E0C7
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 07:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755848939; x=1787384939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bttm+9pZsL7TJqdUm2DmvOxCRfrCCLEJB2ReHL94T3o=;
 b=MtyKpA67e0awgrxfE20b+D9kdb0pzSgapcp89Qj9G2ZzbLh3TGbdEw/Y
 otSQMqrO3RCGGxPlDbooxq3M574rphqTn0df+jhVMezBqvx1cEwAd1UKW
 WWOqHyQ++gLEDliEjtKUWFT0V2+l8ofndpHlndlPg+p0d1f1+gOx4T5eU
 wPyxjEDMZs4y/AXj3NLxaC2KO+DAl2bD1PqmRYO2l2ohgxzPsK+durZet
 ewVlSnh4XKTD33pENH9d1skNghbtrL83aEqjbi4rYhC887ugqNkpdIIWB
 5Ku7eEB+ZM7FBxbdt/YpPOKPSJMG6/toxvb1aNAaI9nX9oy6SU6NtTYv6 Q==;
X-CSE-ConnectionGUID: CDZX+5KVSIeEycf5Xv5ILw==
X-CSE-MsgGUID: B+5g7RGTTR+jscQ3oS809Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61965808"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61965808"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 00:48:59 -0700
X-CSE-ConnectionGUID: QHvHBbdgS0uFNaOTaHa7aw==
X-CSE-MsgGUID: 8W5eYEqoTWWkDwtw18SW/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="168551304"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.99])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 00:48:57 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 4/4] gitlab-ci: Add MkDocs documentation support
Date: Fri, 22 Aug 2025 09:48:18 +0200
Message-ID: <20250822074820.203501-5-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822074820.203501-1-pawel.sikora@intel.com>
References: <20250822074820.203501-1-pawel.sikora@intel.com>
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

