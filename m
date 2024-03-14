Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46871C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E179810FBB2;
	Thu, 14 Mar 2024 14:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xuoa6KFj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC8E10FBB2
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710426999; x=1741962999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDLkrsvBc2WkHytGiSUeboi0ZzSyfc1z1X2kVIV+v/E=;
 b=Xuoa6KFjOWeRl9HU+7b0rHEA3NT3tIj8aedwsbdFq4fh2O49Mzc44mGc
 kYWXf+5qdUlzUZfghWme7CU+0XK9PIvUrgSLO60mAQMpKu5TimrJgMUy5
 d6RH7lnWphhPcBs1+A/TmXfvVwlOMvIPmE1KvE5VEszdw7BjU1KfNcA2M
 VSGCbnhsihZTT9NU6a/gIIj+43BKZq0GRQltmQhkvskX7OCDseqYXmmKx
 sRm+8dZDOd1Es4h+vvTSpShrtLCxk1ZQ79BVkubcSytZgFRoR4gmFgtsN
 cxamJ4lztfWl/QDMh0oIDY+Ed4N469P8H8OmqG+g/U3RWjpSLWh9Uef4u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16697700"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16697700"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12234081"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:36:37 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v4 09/25] tests/intel: Introduce FDinfo subcategory
Date: Thu, 14 Mar 2024 14:34:39 +0000
Message-Id: <20240314143455.1436688-10-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

Let's introduce FDinfo subcategory.

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/drm_fdinfo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index 3ced658f2..aac2fdb6a 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -36,7 +36,10 @@
 /**
  * TEST: drm fdinfo
  * Description: Test the i915 drm fdinfo data
- * Feature: client_busyness
+ * Feature: client busyness
+ * Functionality: client_busyness
+ * Sub-category: FDinfo
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: all-busy-check-all
-- 
2.34.1

