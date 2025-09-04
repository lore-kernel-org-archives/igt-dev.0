Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4A0CA1017
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 14:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213AD10EA54;
	Thu,  4 Sep 2025 14:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArmVPWku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E6F10EA54
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756995233; x=1788531233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bttm+9pZsL7TJqdUm2DmvOxCRfrCCLEJB2ReHL94T3o=;
 b=ArmVPWkuVVxJb/3Iq+8kTgTnjddC1tf7aW56pfdqeVmsWI+PPjje1I2b
 2SZKtz0E+kI1wHTjtvZ0eRSfwMNsFiFsv55wWCRdmPc9NwsHC6AxRmfzl
 bpCz2Bbix3M4LpO8Els+IUjGV9mVfyscSRxBLsZesN0eLRdBpQuhEp6lx
 YFi4El5BF0TdB41knuTXaRrx6CRJ98rtH+vvzXJ8Du4YeRrPXXtdl69PG
 MCIYGcbduoKbUtlpoAnwS4n05SfJ15+fw1WQ6oy93trkVPJMowu2xDXfy
 L/XdE6gFZA2a+c+DDmm472v1kE4OR5oYLRppHrWiFGu9x15poYzmXhK8Q g==;
X-CSE-ConnectionGUID: B90bPdo0QsO34utO+ZsnZQ==
X-CSE-MsgGUID: Y0vvygklQOSExjz0NqoKVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59286201"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59286201"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:13:53 -0700
X-CSE-ConnectionGUID: gbj++DrsS1W51WhQhQNC4A==
X-CSE-MsgGUID: eyBG+cNWRD68/BwWlPALdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171452682"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.106])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 07:13:52 -0700
From: Pawel Sikora <pawel.sikora@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5 4/4] gitlab-ci: Add MkDocs documentation support
Date: Thu,  4 Sep 2025 16:13:12 +0200
Message-ID: <20250904141314.113258-5-pawel.sikora@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904141314.113258-1-pawel.sikora@intel.com>
References: <20250904141314.113258-1-pawel.sikora@intel.com>
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

