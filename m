Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B128D5AE7C
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 09:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33AF10E7DC;
	Thu,  7 Nov 2024 09:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOpb/KVw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606D410E7DC
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730973176; x=1762509176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/7GYdCHt1VoyTNWylGYPOxrqN3h6QjT3X9HLEM1PMDI=;
 b=FOpb/KVwxVpx3SRZ4dhEGGxk4qbi193o+e4qShAd/5nciliGdx1Hww+Q
 wtGXhKWGzfMYpgf3PKHZR4WOmHv3oPjznajeqWLa5nG7eBb8IWapis2pK
 8CcbZFfYHCUpXwatH285bKvUdHpjMOqoAnKS82sN78r9JBPFEK3u4KxQi
 BRqByRfGJVU9sz6cXdQT4g1qwUJzA92mafNOQF9js2p0sRVr7YLGNm23u
 P0VcBo5g7MqeHLFMDmMETRh1XecM1PzBPsn24H42yz5niSjagLoVxM3ub
 5hUivBpkyKBYzteviMLmFOa0YfhhLWbUfNubBFciF5YnlrOrcg3WuEhSB w==;
X-CSE-ConnectionGUID: xJdK9VtlQaKFquHxcZZ8Lw==
X-CSE-MsgGUID: SuYPeTLrQkW2PRFsJp1w0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30229370"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="30229370"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 01:52:56 -0800
X-CSE-ConnectionGUID: aWVN4gLySdSDNtHtAiKg2g==
X-CSE-MsgGUID: tobAozjeT6ya+zi8Ijzdnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="89844719"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa005.jf.intel.com with ESMTP; 07 Nov 2024 01:52:53 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, Mark Yacoub <markyacoub@google.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH i-g-t v8 1/3] tests/chamelium/kms_chamelium_edid: Use extended
 flag to reduce the number of edid
Date: Thu,  7 Nov 2024 15:23:24 +0530
Message-Id: <20241107095326.1842621-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107095326.1842621-1-pranay.samala@intel.com>
References: <20241107095326.1842621-1-pranay.samala@intel.com>
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

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 8438f5f15..ca1f82227 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -38,6 +38,7 @@
 #include <string.h>
 #include <stdatomic.h>
 #include <xf86drmMode.h>
+#include "drmtest.h"
 
 #include "config.h"
 #include "igt.h"
@@ -121,7 +122,9 @@
  * @suspend:      suspend
  */
 
+#define CI_LIMIT 25
 #define MODE_CLOCK_ACCURACY 0.05 /* 5% */
+static bool extended;
 
 static void get_connectors_link_status_failed(chamelium_data_t *data,
 					      bool *link_status_failed)
@@ -269,9 +272,18 @@ static void edid_stress_resolution(chamelium_data_t *data,
 	int i;
 	struct chamelium *chamelium = data->chamelium;
 	struct udev_monitor *mon = igt_watch_uevents();
+	enum intel_driver driver = get_intel_driver(data->drm_fd);
+
 	chamelium_reset_state(&data->display, data->chamelium, port,
 			      data->ports, data->port_count);
 
+	if (!extended && (driver == INTEL_DRIVER_XE || driver == INTEL_DRIVER_I915) &&
+	    is_intel_device(data->drm_fd))
+		edids_list_len = CI_LIMIT;
+
+	/* TODO: Make changes to check if we can get rid of extended flag and explore
+	 * if there is environment variable in CI when executing with igt_runner
+	 */
 
 	for (i = 0; i < edids_list_len; ++i) {
 		struct chamelium_edid *chamelium_edid;
@@ -504,8 +516,22 @@ static void test_mode_timings(chamelium_data_t *data,
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

