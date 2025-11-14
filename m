Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4E2CE8D64
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EA610EAE8;
	Fri, 14 Nov 2025 17:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOpw9aCN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A8C10EAE3
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140986; x=1794676986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=utSoVqNOeum/3Sl4Zq3LVq9bmrf3zRadzLrgSGhErEw=;
 b=bOpw9aCN/H5NzPNu+XTMBcnMIViWJydMQ+zBtDMnDqS/BPjZpIHgs99b
 BbUHkLutDcRpQNQ/2wJtYi402vKGyB9Z+bIldYd2dkzETfbpBFU2aiJRm
 XvUJcb+CuspMiyRzwiewFBcnqZYUPW5F7JS5R3x8UDdgy2/C5+co/2MnM
 iO8vjrZpKN8IaiPAtRfYUtXoABrBOa7Cj1qEN76PeYu7iXV7ClQBC03ui
 AYf+SeNE9JEaArb3kr8Od16WOZxGomoiCo1gE8Fs1ixq1ljvLSozJqoYY
 bM9d1/b8atWDup6f0/GwT4MgBS/PBZuptLHAN4kAew0+gS72wKPPmiXH3 Q==;
X-CSE-ConnectionGUID: PQ8xxYAAQPuUIHqONLjSaQ==
X-CSE-MsgGUID: 9EJhk8fPR0y14UkwtE2WPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871468"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871468"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:23:06 -0800
X-CSE-ConnectionGUID: Oq47ljx2SQOWSmNj5VL+QA==
X-CSE-MsgGUID: Y/mPK3igRoqrQVaAKIAJTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981695"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:23:05 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 23/23] tests/kms_color: Skip multisegment LUT1D setup when colorop
 is missing
Date: Fri, 14 Nov 2025 22:59:08 +0530
Message-Id: <20251114172908.1027816-24-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Add skip condition in prepare_lut_data() to handle cases where the
multisegment LUT1D colorop is not initialized or unsupported by KMD.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 624a10c27..de66e8be5 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -796,6 +796,9 @@ static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
 			uint64_t hwlut_caps = 0;
 			segment_data_t *segment_info;
 
+			igt_skip("Colorop object missing for multisegment LUT1D\n");
+				continue;
+
 			hwlut_caps = igt_colorop_get_prop(&data->display, colorops[i]->colorop, IGT_COLOROP_HW_CAPS);
 			segment_info = get_segment_data(data->drm_fd, hwlut_caps);
 
-- 
2.25.1

