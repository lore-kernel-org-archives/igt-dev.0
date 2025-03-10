Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD76C28B30
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 09:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BC910E3D6;
	Mon, 10 Mar 2025 09:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI5Rz2Sd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9651B10E3D6
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741599584; x=1773135584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FCiLi+FylAAhUlqZPdPKSIma4lFr9ZAAnnfwfzcxTcU=;
 b=EI5Rz2SdAqXUoyTzGuOhuiCNEm6FLiJY1eLpr9G4ix9pf6TYQIPi5bhY
 BwtWPzsLj9ykRboK10H1JflGnWi4Y0BdvwU5LQgWBFchHiOR233oduock
 hyW8MrlPECTYW0xrKNwNt5cl0t7eA2FM3ZAFL+cWdjNqqVI2dF4f9FzMb
 KAzy4dYTnzD0p8hz0nbXhEnHVKLz4L3XrvGf5RXRcklhIgeTxw5yNi7mO
 sovdguhJiIGPP2R5MkX9bVcSEkNBqxmWNLdY5UQ0LqIyBvvPFPEeNG/xI
 ++GDocPG3MqJIsaWaZa5r3307LB9qNKKJtZH53vbM4hdNBmMa7UQgD1Vk g==;
X-CSE-ConnectionGUID: 2p6hIzLTTMyp2I/JxGwcMg==
X-CSE-MsgGUID: CyJ4JK8TSmq433ZJobVLnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46497595"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="46497595"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 02:39:43 -0700
X-CSE-ConnectionGUID: cPjFJa3rRNm67mymPKE2hQ==
X-CSE-MsgGUID: ucqZDhtFRX61Ph92/i0yKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="120148565"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 02:39:42 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_vrr: Fix vrr multi-display issue
Date: Mon, 10 Mar 2025 15:09:22 +0530
Message-ID: <20250310093923.1479995-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310093923.1479995-1-ramanaidu.naladala@intel.com>
References: <20250310093923.1479995-1-ramanaidu.naladala@intel.com>
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

Ensure consistent output timing by removing the conditional logic.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index e7d2ff1db..ff1dbe262 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -333,16 +333,13 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	int num_painted_fbs;
 
 	mode = *igt_output_get_mode(output);
+	data->range = get_vrr_range(data, output);
 
 	data->vtest_ns.min = igt_kms_frame_time_from_vrefresh(data->range.min);
 	data->vtest_ns.max = igt_kms_frame_time_from_vrefresh(data->range.max);
 
-	/* If unspecified on the command line, default rate to the midpoint */
-	if (data->vtest_ns.rate_ns == 0) {
-		range_t *range = &data->range;
-		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(
-						(range->min + range->max) / 2);
-	}
+	data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(
+				 (data->range.min + data->range.max) / 2);
 
 	if (data->duration_ns == 0)
 		data->duration_ns = TEST_DURATION_NS;
-- 
2.43.0

