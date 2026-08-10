Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9743EC5AD55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 13:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C92E10E864;
	Mon, 10 Aug 2026 13:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqAHLc+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9D10E860
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786368745; x=1817904745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ixQvG2IAfmc+F6AKqc0XftXV840/MTeH66lMZedypTI=;
 b=MqAHLc+YZl/qkJS+t6g0lo9NN7dnxfbNcYnWhoaGiyLaRyRyFcWkm5g4
 5tAZamEDqiFNslI/+t0zK9pl1AD3ttUP2b6hbRqd/vmAwNkYwIygkT9ai
 eTl2L+1iUyYZruCNd9hnxxltnB1+D3AODyAZVKMuqusGjJ1rfm2jHlEzN
 Ldg69xe+eKbx7pmcWkvF0MI9NSU61wUGL1abFfU9wWgQq0osj5LwG5ERo
 ajJmZeqCqCseORvYpXaesgd/GU/GKSjE06faV1c5x7hfvAXHYCNMU+t4B
 bE8AbnBeqpiull35cuPLApdCta1Sg/YMgJkdjr6BS1HtDWoDLngdT15YI A==;
X-CSE-ConnectionGUID: 62ky3hevTp+L1K6ydb9bAA==
X-CSE-MsgGUID: rVXwqBkLTE6zk2BiS/d3MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="98396769"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="98396769"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 06:32:25 -0700
X-CSE-ConnectionGUID: UnsKUgvBQWaxVq8+LZSXpg==
X-CSE-MsgGUID: yvyak6xrTWq/peVenFHlIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="266534854"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 06:32:24 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 2/3] tests/intel/kms_dp_linktrain_fallback: Reset
 traversed MST output count
Date: Mon, 10 Aug 2026 19:02:10 +0530
Message-ID: <20260810133212.829168-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810133212.829168-1-sowmiya.s@intel.com>
References: <20260810133212.829168-1-sowmiya.s@intel.com>
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
2.51.0

