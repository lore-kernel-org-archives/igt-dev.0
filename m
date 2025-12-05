Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0063D37492
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A435E10EBA3;
	Fri,  5 Dec 2025 19:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWuxM7KR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FB010EBA9
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963988; x=1796499988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S6mfoP47hz9Ginc06aMVITmkEzvmTjWvcnpdZT1JlUg=;
 b=QWuxM7KRn2Qr34CTfyXroKIC7tVdmfS1XtGfMDrV+PSi8Jq9jXSMCvF2
 hHqqf3w4YUr7iaefsokMN0C6geuK4bu5QcNrmlA1LtY5msfm9XyhzvCOK
 ctEgdgHztrkXI9kDbVakej8AJR0lpK3XFYn8+ec9NflEsuV/jGwQVd0SK
 v9Mz1ln+Zrp5FMVdeCvePRImby8Fy8xthbYRhuRL9HKDtShWYUg9Z1p7N
 2kCkw+V67ATsXumu+yMgiZyRyJfk1hi/jLqRgCuBN8P7Xca/NAPwVPQMy
 3SA9+hpJg3hwi6FvER5P6GS0CEzmB6vgUvSSvAmfPRC0ytFtz/e4o7/aj w==;
X-CSE-ConnectionGUID: YgF+Gj57R2aLCoSDXUTY8w==
X-CSE-MsgGUID: uu6aUdFTTeyLrrfZXw5Lzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606663"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606663"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:28 -0800
X-CSE-ConnectionGUID: REX8RBuHQtOKBNWO9WbwIQ==
X-CSE-MsgGUID: 5g7/wDQXTy23Om8zFLkX3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624891"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:26 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 07/13] tests/kms_color: Add helper to check if pipeline contains
 only CTM colorop
Date: Sat,  6 Dec 2025 01:23:06 +0530
Message-Id: <20251205195312.1234330-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251205195312.1234330-1-swati2.sharma@intel.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
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
of type KMS_COLOROP_CTM_3X4.

__maybe_unused prevents compiler warnings when the helper
is not referenced, while keeping it available for future use in
color pipeline validation.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index f8d74a92c..7c113de85 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -773,6 +773,17 @@ static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
 	}
 }
 
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
-- 
2.25.1

