Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B60C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC6E10E224;
	Mon,  4 Mar 2024 11:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGrcwssy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159C210E224
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551127; x=1741087127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=phO6H/RIDF9rZYl2X0CH9ASgO/5BhFD9pXlM3NoHo20=;
 b=KGrcwssyDLVxLUodrwk6TYLfUsXyqY1X1COh+ZCgju227LTb08tm+0dI
 VOExQv4R0FJ45XP1LBgrb2W79d+ByqFtbsnj7hzWXYelnD9UH5sehdeHg
 LaScHEc3Uv9n9iGzdi8cIaVXg6+gGtPVbQQgV3bcvT8o+NoIM5iCkEezD
 Bk2ogdriiROwORdOsQXMPmx1KMHYcIaP6kT+P2SpjbfbZfSV6P3UFDrkj
 t+EPjXQT9jIFJ529xLgKu+Y8svUj05qCaNTpPWMS4P/943JoDEEMZ/9vO
 08ZRDkUpo6m6aRIqHMgwunWW5qZ+QPMZZd60pqwLMZa/pejIvhK5F+0U9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15445071"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15445071"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9105144"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:45 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 13/24] tests/intel: Introduce Render copy subcategory
Date: Mon,  4 Mar 2024 11:16:06 +0000
Message-Id: <20240304111617.849785-14-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Let's put render tests under Render copy subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/gem_render_copy.c       | 3 +++
 tests/intel/gem_render_copy_redux.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 57ca2c9ec..f97a3f3f9 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -52,6 +52,9 @@
  * TEST: gem render copy
  * Description: Basic test for the render_copy() function.
  * Feature: mapping
+ * Sub-category: Render copy
+ * Category: Desktop client
+ * Functionality: render copy
  * Run type: FULL
  *
  * SUBTEST: linear
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index 06777dd7f..b8e796109 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gem render copy redux
  * Description: Advanced test for the render_copy() function.
+ * Sub-category: Render copy
+ * Category: Desktop client
+ * Functionality: render copy
  * Run type: FULL
  *
  * SUBTEST: flink
-- 
2.34.1

