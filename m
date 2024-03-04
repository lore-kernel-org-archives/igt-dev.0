Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB802C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8673D11200C;
	Mon,  4 Mar 2024 11:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azqKIkwQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14C511200D
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551088; x=1741087088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L1LSguUw+czNWMXB46PZNxhFRzLsTPJGYY06GanBQq8=;
 b=azqKIkwQbp7B90n4i+580e/w56Uaewp4EUhDKTSWpsPXt6vNIFXAwIlx
 /V3Zc5VlE8NFuKgdfe9A1YhM/fLPV7O/VUy0W2TPh/HhrbORnGLGDK6B7
 NTzEIv8mMvufnC4rrUtExkhNvHJxCoo6xKT0bRQGK2Vzrnq8omoNchaLB
 5PtuqXIv+YV5LPHQhk5DzqtLuIpeRXvx4mM5GTKFFOamtBC+KWvdc5nNp
 PuP35bUN/Um/u4GyjvBxGvJ7MhBZHfsj2eOLMjavGctspSnH+czrfx/SH
 xFo07ZotkCgp8g2CXdZ0VF06G6N6g5cZlcmrLI+3s5z/3iO+3sF1x4oly w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14745788"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14745788"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="46480027"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:18:06 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t 09/24] tests/intel: Introduce FDinfo subcategory
Date: Mon,  4 Mar 2024 11:16:02 +0000
Message-Id: <20240304111617.849785-10-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
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

