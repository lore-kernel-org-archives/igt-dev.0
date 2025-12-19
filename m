Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0906BD767CB
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 11:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0CF10EF0C;
	Fri, 19 Dec 2025 11:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMl/Fpfo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8586A10EF0C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766143146; x=1797679146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=weamx0XQ8R+Jod9kqlb1vGTr6FZGRz3hZGG6nV1HGQ8=;
 b=hMl/FpfoE0uhBQs6paIOYofBYk4YcI97peRu1W8m6EBGk4RFJ/whbjST
 O2cu3w74FdFIb+05nlI2OV1jK7BCmTHtxrhud4KbmjhzqKOZJoXzOLzG1
 ORu5Eety7gKzxt3fVYCIQEzTMzRydK96A389LzMayI/h5KV8hp+YUjfaI
 5GgbnHhMidJMBHaKaN3+b3J3tZ+fb2HE5QnKUlpfX6Ndkfh6YTeLz+8uU
 SIFv2yG95OqmLLAbOPQPoGnZPBLkWswafAv13GhxycQ4WaDWMWuDpmqTt
 rAp+b/+PIyNQcY8cL0RzqhQqiGpDamb+jtlP3Sf6Od5vghxV6D8lbg6fZ w==;
X-CSE-ConnectionGUID: S+CQvZR6QbiW1kmXixb6WA==
X-CSE-MsgGUID: SrYegQZvQVGlYjbH1j4N7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78816167"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78816167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:19:06 -0800
X-CSE-ConnectionGUID: WRA1AjsNStCX/2MStchfVg==
X-CSE-MsgGUID: lPPS21/3QiGPOqbKP9LiZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203235483"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:19:05 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v7 3/8] tests/kms_color: Add helper to check if pipeline contains CTM
 colorop
Date: Fri, 19 Dec 2025 16:56:01 +0530
Message-Id: <20251219112606.1330425-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219112606.1330425-1-swati2.sharma@intel.com>
References: <20251219112606.1330425-1-swati2.sharma@intel.com>
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
index 74ead943a..edc31026b 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -709,6 +709,17 @@ static void test_pipe_limited_range_ctm(data_t *data,
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
index fb9c3b3aa..0be312342 100644
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

