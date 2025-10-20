Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50635CCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 06:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051C010E266;
	Mon, 20 Oct 2025 06:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dej6K0rQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5896910E266
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 06:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760942688; x=1792478688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PJ/25t67Ogy05Z0C3Vi9oulqKVTly+FpshJYMP0ZWik=;
 b=dej6K0rQ4KCgBekWF6iRhnslmcZ9f7Slm9SFsEckv+r5GTSZ3THlkbMC
 b/plPfCpKPQbWv3r4tWaWqSxDoEDvTTWZ1z4GREWqyLv+VQNaw8RsdBe/
 tsahiTMiyn2xEXZugnmz/2w+6TOW/CHid2o3Bcm/PzqnZKcDYmGhqzqOI
 2NWTdUCDVotGIq2W5ZVWQ84/Y6iTD44g/u1wRvvm7GYMxLRtjYiJwofa1
 mXLO6HIu3bXMnBHAJ5zWxtaphBXLm90XoXk3Ju5zftL+X18JqPza0YXiA
 OqZro5GjTXdeK7pLMQDX7UlSj+IEGQrXd/q8RYQKEiNhg7vxCQNan2KIx Q==;
X-CSE-ConnectionGUID: o8KKXNTpS4u45Y107TwpcQ==
X-CSE-MsgGUID: VW4kG/gbQDuICrS65NS/7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66889786"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66889786"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:48 -0700
X-CSE-ConnectionGUID: w29T5JTGSwaJoR23xWL6KQ==
X-CSE-MsgGUID: UKknadiARGKvxRmbx1zNuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="213877739"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:44:46 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v11 6/6] gitlab-ci: Add MkDocs documentation support
Date: Mon, 20 Oct 2025 08:40:50 +0200
Message-ID: <20251020064053.1050025-7-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020064053.1050025-1-pawel.sikora@intel.com>
References: <20251020064053.1050025-1-pawel.sikora@intel.com>
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
 .gitlab-ci.yml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fb5713fba..50fff797f 100644
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
+    - mkdir -p docs/api_reference
+    - cp -r build/docs/reference/igt-gpu-tools/html/ docs/api_reference
+    - mkdocs build
+    - cp -r site public
   artifacts:
     paths:
       - public
-- 
2.51.0

