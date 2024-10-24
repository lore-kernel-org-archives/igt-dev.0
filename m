Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B01AD0BB70
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 08:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A34B10E8CE;
	Thu, 24 Oct 2024 08:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eyb6Ov3Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B4910E8CE
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 08:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729758397; x=1761294397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s+yOi1fI4TpJJsevQ4S9CLB9OCeptlUJIdug1yZ3Db0=;
 b=Eyb6Ov3Zwo+f2FU32GtnG+sUmJE0n9B0EkXmQIBvzcmPKv7LFaQbzRgL
 izBo3xM/XuyQQvN06FD5R85TeBx+0TeRNvgJgcUlzMUfT2hS4SDTzHFsr
 s5NPVzdcFvJlae6sEYTukN2N9zgsZwrnpiT6j5ifp8mdQjFF2DnjGWwYm
 Aupgs6m/3sF+/y0nmdmNOeYhaWn9xHxOCeeEzm3raarijDx70QiwJYeXw
 DZyb5Zib1AugHQ8F2vxdEavA7bYZT9aTrCuUiEU2e8hutvJWl08J2zjBQ
 bN+IWoPEWCSuTzX374oy/9Z2RJhtMFbG2H/DGak2AHR/cPt6feRfWlpf1 Q==;
X-CSE-ConnectionGUID: o18fWyLZR/mPxAgkUOQdTw==
X-CSE-MsgGUID: OD4TT15lR+6/Mhg6dhZHdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33063169"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33063169"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 01:26:36 -0700
X-CSE-ConnectionGUID: yztNQNfPS5SDMUQsjeVYpQ==
X-CSE-MsgGUID: 6BGvov9mQQqzndB1cagfig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80828615"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 01:26:34 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/3] tests/chamelium/kms_chamelium_edid: Use extended
 flag to reduce the number of edid
Date: Thu, 24 Oct 2024 13:57:02 +0530
Message-Id: <20241024082704.1746746-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024082704.1746746-1-pranay.samala@intel.com>
References: <20241024082704.1746746-1-pranay.samala@intel.com>
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

This test iterates on all the available edids of HDMI.
Due to CI test timeut limitation, we are reducing the
number of edids to execute to avoid result as timeout.

Using extended flag to achieve this. The test will execute
only 25 edids when this flag is not used as CI doesnt uses
this flag.
In local execution to execute on all edids, we have to give
this flag at the runtime.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 8438f5f15..1bdde1768 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -122,6 +122,7 @@
  */
 
 #define MODE_CLOCK_ACCURACY 0.05 /* 5% */
+static bool extended;
 
 static void get_connectors_link_status_failed(chamelium_data_t *data,
 					      bool *link_status_failed)
@@ -273,6 +274,9 @@ static void edid_stress_resolution(chamelium_data_t *data,
 			      data->ports, data->port_count);
 
 
+	if (!extended)
+		edids_list_len = 25;
+
 	for (i = 0; i < edids_list_len; ++i) {
 		struct chamelium_edid *chamelium_edid;
 		drmModeModeInfo mode;
@@ -504,8 +508,22 @@ static void test_mode_timings(chamelium_data_t *data,
 	} while (++i < count_modes);
 }
 
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+	case 'e':
+		extended = true;
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -e \tExtended tests.\n";
+
 IGT_TEST_DESCRIPTION("Testing EDID with a Chamelium board");
-igt_main
+igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
-- 
2.34.1

