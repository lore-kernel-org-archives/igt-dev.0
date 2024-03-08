Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1EAC54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1B710E71F;
	Fri,  8 Mar 2024 08:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaNGFCs3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3364C10E71F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887126; x=1741423126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L1LSguUw+czNWMXB46PZNxhFRzLsTPJGYY06GanBQq8=;
 b=AaNGFCs3sTLll0FSGEm7QfbRxN3tg2Kgd9M7/hHcPOZ4tX6B2Jg+JpWl
 A7qfuWlISmOP4PFrK1zG6FzI9Nms1m/48cI1oYx14dU0P4+fe6qgfXRv0
 4iThan6M7xVltyL68xYpgHKEgSxM2bt7PnT0il4DSK+Lm+RgA+jpzF7+a
 n2X5/PlUug6Lk8ExCTtBivkH8Z4ZFynNIfUrfdtpCnHCU05uV26FyB2Bu
 Ggkxr4pWcf8htI0bYl8ZfuPwTHMASklCRlzpjYPJgVRh48xLoUg+QE3eg
 WkYnTBWfsqaxufMx/GEqOOFMYn3QyIdE2Xlol6JNrz3rJ0sC+a7r22/Ii w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22122250"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="22122250"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14956855"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:38:44 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 09/25] tests/intel: Introduce FDinfo subcategory
Date: Fri,  8 Mar 2024 08:36:41 +0000
Message-Id: <20240308083657.1092049-10-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/drm_fdinfo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index 3ced658f2..65d942330 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -37,6 +37,9 @@
  * TEST: drm fdinfo
  * Description: Test the i915 drm fdinfo data
  * Feature: client_busyness
+ * Functionality: client_busyness
+ * Sub-category: FDinfo
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: all-busy-check-all
-- 
2.34.1

