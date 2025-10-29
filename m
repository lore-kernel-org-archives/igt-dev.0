Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81753CCF9EB
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 14:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398E410E7BA;
	Wed, 29 Oct 2025 14:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jc3E4lFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E50C10E7BC
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761747622; x=1793283622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ph/IJQSzFstD5URM5ZKd/CLIwuJPlt/NzRpveYvW7ng=;
 b=Jc3E4lFNVT/Pdf7DXl4VNmfTl3z1crKVKt0I4kBJjylPA+btZn3nOplr
 RxlZeR7Gkdid/NM3pZJ2k0pQjOUHR8wlvDtxsqRFlEP2ZcfhLNsTWlgDi
 ZP9rU+bsUETyMwliofc0R5xUFhGDqHyEBzBckQ3J2Ky0imhcZPj2yAAMa
 OImpBCI7zWf4rWowSkSbXOpIJMS7Gh/Xthruxb2r6aABIMMxPukxTIA3v
 7nESbntTr67UdfP2GT/RAT+Ockg99vaEKzfkHh5A0AgAzrppGFws0JP/w
 n4VKdt7NHn3WnUqKureygVRgEIlI29rix97DB4bJb2gnDfNUxNInCnhR9 g==;
X-CSE-ConnectionGUID: c0rDWb3AR7you4HMyv5ggQ==
X-CSE-MsgGUID: PzZ4XLV0TCisysKXeT2mrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75318714"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="75318714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:20:22 -0700
X-CSE-ConnectionGUID: ZPCDiwnQTe+VVfEOp5rgeA==
X-CSE-MsgGUID: 4reqzrdTQ9K6Z5TJPTy++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185377720"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:20:21 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 6/6] gitlab-ci: Add MkDocs documentation support
Date: Wed, 29 Oct 2025 15:19:45 +0100
Message-ID: <20251029141946.1165010-7-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029141946.1165010-1-pawel.sikora@intel.com>
References: <20251029141946.1165010-1-pawel.sikora@intel.com>
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

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
---
 .gitlab-ci.yml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fb5713fba..e3a81b547 100644
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
@@ -242,7 +245,11 @@ pages:
   stage: deploy
   script:
     - ninja -C build -j${FDO_CI_CONCURRENT:-4} igt-gpu-tools-doc
-    - cp -r build/docs/reference/igt-gpu-tools/html public
+    - pip install -r docs/requirements-docs.txt
+    - mkdir -p docs/api_reference
+    - cp -r build/docs/reference/igt-gpu-tools/html/ docs/api_reference
+    - mkdocs build
+    - cp -r site public
   artifacts:
     paths:
       - public
-- 
2.51.0

