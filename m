Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E38FD6E2DC
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 19:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215CB10E48C;
	Thu, 18 Dec 2025 19:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEoU1QI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BD610EAD6
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 19:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766086688; x=1797622688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ecb12DPnUtaAQ6yaszN8sMmnlk1VyAFAbqwG9Q46o8k=;
 b=JEoU1QI76hIKIkr3+Z0TG2VfRcULp9EwiEhmXIh3XwndaG4/TllvwAUx
 bwTSgQBLPi57Brbb1cR6cX4qm/Ul1G9ovg2GNF5wShJBfKzn9yqre/fdY
 7Z/s12ZhWpnqFoRAp9PHt/9QptFXMYxnLIfRfwGzGCt32ncSnJpoCGxm1
 P1DFvYRuB+DHoRQ8C4chSI+7jfkKPm1884NN2CfdYFHjNXcG3o7T11M6J
 Ac6MuuVtMaiW7YDfqOIZoxR+zNd/maigVvgZhLpt7kt+5AFNQU6wohiwi
 +O8jHgthzho3q/0zFhl6QTS9ffXt7PKAOCeIcDIxBjklpwcbdUpp0xXf3 A==;
X-CSE-ConnectionGUID: 9DFp3+r+ThWtzyWIPzF97w==
X-CSE-MsgGUID: vyT+lWLYSAypUgy4TAL6Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67244716"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67244716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:38:07 -0800
X-CSE-ConnectionGUID: A8XmHU83RzqIiD8bi+O1cA==
X-CSE-MsgGUID: OM/65mqcSZeHOIe9QgKFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198680624"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 11:38:05 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v6 3/8] tests/kms_color: Add helper to check if pipeline contains CTM
 colorop
Date: Fri, 19 Dec 2025 01:14:57 +0530
Message-Id: <20251218194502.1306975-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251218194502.1306975-1-swati2.sharma@intel.com>
References: <20251218194502.1306975-1-swati2.sharma@intel.com>
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

Add ctm_colorop_only() to determine if colorop in pipeline is
of type KMS_COLOROP_CTM_3X4. This allows CTM-only tests to use
solid rectangle patterns instead of gradients.

__maybe_unused prevents compiler warnings.

v2: -improve commit message (Chaitanya)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color.c        | 11 +++++++++++
 tests/kms_color_helper.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index b3f3a34a5..cfc71f092 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -719,6 +719,17 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+__maybe_unused
+static bool ctm_colorop_only(kms_colorop_t *colorops[])
+{
+	int i;
+
+	for (i = 0; colorops[i]; i++)
+		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
+			return false;
+	return true;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 23463b944..029998d87 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -38,6 +38,7 @@
 #include "igt.h"
 #include "igt_edid.h"
 
+#include "kms_colorop_helper.h"
 
 /* Internal */
 typedef struct {
-- 
2.25.1

