Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3988CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 08:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC5310E662;
	Tue,  9 Sep 2025 08:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l9wUJJTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6A010E65F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 08:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757407389; x=1788943389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YiWu7eHH2FziPtUThXW5vNHz5KnSO/5WSsBD3sGI0TY=;
 b=l9wUJJToQGsx7MPwH3lZtose+bnT7v0yiEw8cNi6mq9uhA8IU2TefozM
 s9lwlwvBYlhaV2IdOswqgeCppdOaYiOb1ZqAeH7w0ga6zod7JyM3M+fGi
 +jMSz/2v8fXB0FumIgIRtSEd90KbCWtu/tmaB7CjhtqMc1QM7z+RlyYkP
 /unPQ2qQ32sjfeSepMrb0zCD0pHPZ9NH/SUaHmnq2EfFf8mXiDFx96qd1
 lGsJ2K7ox6TGecs9uP8dS6nhaOOe9XMypWq/Vo2VpwqATvtbvyLwekavW
 PTpwDrKH1UeE7Vel5mLnFTwkfjj3GoIpjYSn+gn6Dxrqsvssfl4ug7ENT w==;
X-CSE-ConnectionGUID: 1Po3qf+XQwiYwwtx/wsK5A==
X-CSE-MsgGUID: 1I9WfsCHSTu9D8a5C+4cJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59377683"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59377683"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:43:09 -0700
X-CSE-ConnectionGUID: MeCEWbu8Q4yOHUXnezx8FQ==
X-CSE-MsgGUID: wqcOP1/VQ9SEMrOA5BZJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172900292"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:43:07 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v9 5/5] gitlab-ci: Add MkDocs documentation support
Date: Tue,  9 Sep 2025 10:42:31 +0200
Message-ID: <20250909084233.183885-6-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909084233.183885-1-pawel.sikora@intel.com>
References: <20250909084233.183885-1-pawel.sikora@intel.com>
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

