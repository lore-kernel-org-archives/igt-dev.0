Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3D7C5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 08:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0DA10E6CD;
	Mon, 17 Aug 2026 08:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfPxpe3V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EF110E3E3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786955188; x=1818491188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kcCOnTXAn5NdJbjbnuRCP0VZ0IVq4XkkPR/vp5M7S0=;
 b=RfPxpe3VDOJOe+lYw1dJ4/w+NbhC/pC3FTUhhDhJfUJiqRnEpd58p+mx
 ncz0CRzC2eHzQ+hSbuimNp12m2TApEHVXd7KktlfUHcn6/DYaV5P8NEPl
 up2PXwXf7hkPTlUwVVlq5CsPnrWYTyoX46HHRwschEYNzFF9hYKCokw6i
 iWQutnIxW4e4KCOc7Igq0+5slzN9clmxtqXi+n7Wj6LKS8Bgl9UWQbc7l
 sGMtzJDvuZo1jCVjbup0Lu3xtJEh/JOSyVEoU5NYfWn6Zq7pGUY+Ox1HZ
 OgY/wh0EapSWnv/+dWmRiaIDXIM+Y/g0yHprDe+hYoUtRRiVnEcyT9K/R w==;
X-CSE-ConnectionGUID: UUPUm9C2RSWldIcR05M0RA==
X-CSE-MsgGUID: 8c06YUHDQ2uRpsgxw6PpXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104959196"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="104959196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 01:26:27 -0700
X-CSE-ConnectionGUID: MqAbCTR5SwSZn+bKOgdG3w==
X-CSE-MsgGUID: cWKKhdefQheNRlHz/ic4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="265463965"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 01:26:26 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 2/4] tests/intel/kms_dp_linktrain_fallback: Reset
 traversed MST output count
Date: Mon, 17 Aug 2026 13:56:10 +0530
Message-ID: <20260817082612.1101382-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817082612.1101382-1-sowmiya.s@intel.com>
References: <20260817082612.1101382-1-sowmiya.s@intel.com>
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

run_lt_fallback_test() tracks which MST outputs it has already
traversed in a file-static counter that is never cleared. Today it
has a single caller so the counter is implicitly zero, but a second
caller would silently inherit the first run's state and skip every
MST sibling as "already visited".

Reset the counter on entry so the function is safe to call more than
once per binary. The DSC path never reaches setup_mst_outputs(), so
run_dsc_sst_fallaback_test() does not need the same treatment.

v4: reworded commit message to explain this is a no-op prep patch
    until run_lt_fallback_test() gains a second caller (Kunal)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 115183d2d..44b875ab9 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -431,6 +431,13 @@ static bool run_lt_fallback_test(data_t *data)
 	bool ran = false;
 	igt_output_t *output;
 
+	/*
+	 * Reset per invocation so MST traversal state from a previous subtest
+	 * (e.g. dp-fallback followed by dsc-fallback) doesn't leak and cause
+	 * MST siblings to be silently skipped as "already visited".
+	 */
+	traversed_mst_output_count = 0;
+
 	for_each_connected_output(&data->display, output) {
 		data->output = output;
 
-- 
2.43.0

