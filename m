Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A22DC79FBB
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 20:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB51F10E30B;
	Thu, 10 Sep 2026 20:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9rADJBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EAB10E2F9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 20:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789071282; x=1820607282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UKdRM8JcvqJ2A3YxY1NdB2UfSz4mr4xLo0AUzC4Bdic=;
 b=W9rADJBRHg6c2Ao2+kyvpUSRGjn3WJtrjg0NhEO1ttH8llTUBH+kNeQj
 Rw6xd9nJsHP/3HKWB6ptP7o4J7/A+t5iYApCeQPqiJjsnNDq3VTNbFDLF
 hQDk+2jLLFcqa/R7XpF3DnEx+7UKkerdFvRMha5YTvVXJDCKifwUv1BvE
 PCzho+k+k/k9pHiyYDpKbyRrnauJGFTEhIXWZifi7IGXDnA/x21rmbpCv
 ok3O+hrLZ3aNpAJ/gSswFjRjxbTlVRRxA/aTcujlrXtStJCv9/8ocsjwm
 M/B4BPKmKVYgv6qV5tV2KCJBpZp/7lbj7VdUfs4/gqgwLe17EEK5K2RtF w==;
X-CSE-ConnectionGUID: dCtpTbPuQBCf6IuZyqvocA==
X-CSE-MsgGUID: O8nmb8aVR52wM2nZ8JnZoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89657267"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89657267"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 13:14:42 -0700
X-CSE-ConnectionGUID: y9AMSOysSo6uataFVMutmw==
X-CSE-MsgGUID: dThpk0o3Sy6Es9Qty/BRWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309978220"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 13:14:41 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 11/17] tests/kms_sharpness_filter: fix typo
Date: Thu, 10 Sep 2026 22:14:07 +0200
Message-ID: <20260910201413.2730574-12-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910201413.2730574-1-michal.grzelak@intel.com>
References: <20260910201413.2730574-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Refer to the connector instead of connecter.

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 8c60736691..f2e3fc9494 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -456,7 +456,7 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 	igt_plane_set_fb(data->plane[0], &data->fb[0]);
 
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
-		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
+		igt_require_f(has_scaling_mode(output), "No connector scaling mode found on %s\n", output->name);
 
 	if (type == TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR)
 		igt_require_f(igt_crtc_has_prop(data->crtc, IGT_CRTC_SCALING_FILTER),
-- 
2.45.2

