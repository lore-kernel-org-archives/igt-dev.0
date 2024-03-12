Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CCAC54E68
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16A2112E62;
	Tue, 12 Mar 2024 14:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7MQGtxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F29A112E5F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252992; x=1741788992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tsgsdFrIeuNfetfqXDhhb5djgx3ha41vsuhMg5xTepw=;
 b=G7MQGtxaICwDi5unanoaNDet9wKFtTFMLhiplNJQC5ZLDDgsD/h4hhny
 WUSFAGYJo1Y31fwtpvjixc5HYtjklNyABWJucGmIX57t756vdNlCtk98d
 JpjjroCckhvSYOOCFnfD3Lj1yv7NxcvrTiwZQw/0pmThtwgRFQRIUfk6F
 Rb1ZHF+g/M0oJkR+X4JtlBJVXGIYlkayc2MgZjD+lPQDrbizsXMmYjtuk
 +n1ZiEo0JjJKeu7IJI85UlH6RbMO3mhox5VkoLxLW6viRsSCkxVfCi7DK
 kdoBA11Vo7X6WRuvHlWwnVp6eZ9wmBd/gwx2omYvC0/4FmMrlA0Bec0QI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5133508"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5133508"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11522152"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:16:29 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 13/25] tests/intel: Introduce Render copy subcategory
Date: Tue, 12 Mar 2024 14:14:07 +0000
Message-Id: <20240312141419.1277931-14-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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

v2: Change functionality to render_copy to not break automation tools

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/gem_render_copy.c       | 3 +++
 tests/intel/gem_render_copy_redux.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 57ca2c9ec..91979ba07 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -52,6 +52,9 @@
  * TEST: gem render copy
  * Description: Basic test for the render_copy() function.
  * Feature: mapping
+ * Sub-category: Render copy
+ * Category: Desktop client
+ * Functionality: render_copy
  * Run type: FULL
  *
  * SUBTEST: linear
diff --git a/tests/intel/gem_render_copy_redux.c b/tests/intel/gem_render_copy_redux.c
index 06777dd7f..681cb5cca 100644
--- a/tests/intel/gem_render_copy_redux.c
+++ b/tests/intel/gem_render_copy_redux.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gem render copy redux
  * Description: Advanced test for the render_copy() function.
+ * Sub-category: Render copy
+ * Category: Desktop client
+ * Functionality: render_copy
  * Run type: FULL
  *
  * SUBTEST: flink
-- 
2.34.1

