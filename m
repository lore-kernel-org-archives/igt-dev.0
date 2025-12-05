Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B566CD37497
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687F910EBA8;
	Fri,  5 Dec 2025 19:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VM8iCgXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5162210EBA8
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963986; x=1796499986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M2dQxra8NfEwuiNIlvdCK84IqTBDP5W6T346tBe4x2E=;
 b=VM8iCgXjVH1kAdYLDZ5Gz7jWf0tJeqHlxcWZXH7eJl3j2QhjjcUz4ii1
 oIvQNnr1WSHeeSy/LJh6Hw5f8BHKprKylIJU0PUnT4ChyU6HZsPGFc5VP
 aeG0caIWlaA4F4NvdedUXLkTJyhUrIYhoGgE9aOj7IG0puiesxpklNEa9
 WhIhmh4sTyPxgsCPQ3yavJXJrixoneDAGgxDD5CNHumPZPsP+HUvQxrbe
 CnAsQnqsTjRCAf1iWMmfT2NCQPGUv463ctq2kS5O20nABu1W8Cvmx5Ql8
 wABa1NuADmT4sl6PnsDzCmXuRukUlSG8ZvZFoYeYB6/PV4y7r6qUFaZad w==;
X-CSE-ConnectionGUID: DrPRyPp7SqW5DA2/PFo/1A==
X-CSE-MsgGUID: KmGvczW6QjS3Jeh79rc5fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606661"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606661"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:26 -0800
X-CSE-ConnectionGUID: HV5Cvvp6RV2QnknRQfKVzg==
X-CSE-MsgGUID: PdaNOKjDTP2lO7h+PvuJ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624886"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:24 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 06/13] tests/kms_color: Add helper to clear LUT data from colorops
Date: Sat,  6 Dec 2025 01:23:05 +0530
Message-Id: <20251205195312.1234330-7-swati2.sharma@intel.com>
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

Introduce clear_lut_data() to release memory allocated for LUT data
in KMS_COLOROP_CUSTOM_LUT1D colorops.

Marked __maybe_unused until integrated with LUT preparation workflow.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 56d2b282b..f8d74a92c 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -724,6 +724,17 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+__maybe_unused
+static void clear_lut_data(kms_colorop_t *colorops[])
+{
+	int i;
+
+	for (i = 0; colorops[i]; i++) {
+		if (colorops[i]->type == KMS_COLOROP_CUSTOM_LUT1D)
+				memset(&colorops[i]->lut1d->lut, 0, sizeof(colorops[i]->lut1d->lut));
+	}
+}
+
 __maybe_unused
 static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
 {
-- 
2.25.1

