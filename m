Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D39C55174
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 08:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A9410ED87;
	Wed,  5 Aug 2026 08:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvZiwUvz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DC710ED8E
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 08:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785919482; x=1817455482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NmP076ZPKN2WDRL6bOZSJB3roiF0o72Xqh9fzJqLVPY=;
 b=DvZiwUvzUWtrNC45JxQjUUqWT2QYMYZUaL6gkApeIYlcjq/40vP3walD
 MC4ul0eWI+uf8PfYvWqUh/Lw9Woz2OuOf41KG7J5Rg/x+OEUL95mE8nf9
 20E+MOAjufFImE6L4ql0vUqBNBqs3yea3PNSOkTUp2bYfo31c8h1KcYT5
 Xj3iDF3q2zrCvoRf7kOojU6OMHM3qOhbHbmGUyVgUZHIeYj7tOfx+R5QE
 TapKomZTW9tlMExLCRnyyYfpH++C1rVEkonroJS0g9DlnkqsFMYIcR/NA
 vkEacqtDCVNhajic704WQVq64EvIceqrbt4Ef5aU0jt+TDAUfBmMANrHJ Q==;
X-CSE-ConnectionGUID: yF6R1nRXTva5G7LuBpftvg==
X-CSE-MsgGUID: FP5JD/ZJQvyw5E8f98b/jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97647248"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="97647248"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:44:42 -0700
X-CSE-ConnectionGUID: Wuop/NbGSc+2lrBgnktH3w==
X-CSE-MsgGUID: FOeBtjjoQJCzS4H4VsBhtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="261186780"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 01:44:40 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 2/3] tests/intel/kms_dp_linktrain_fallback: fix MST
 traversal state leak between subtests
Date: Wed,  5 Aug 2026 14:14:26 +0530
Message-ID: <20260805084428.708501-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805084428.708501-1-sowmiya.s@intel.com>
References: <20260805084428.708501-1-sowmiya.s@intel.com>
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

traversed_mst_output_count is file-static and was never reset between
subtests. In a full-binary run the count from dp-fallback causes
setup_mst_outputs() to skip all MST outputs in subsequent subtests.

Reset it at the top of run_lt_fallback_test(). The DSC path never
reaches setup_mst_outputs() so run_dsc_sst_fallaback_test() does not
need the reset.

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

