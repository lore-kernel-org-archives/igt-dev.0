Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BCEC02198
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 15:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F1510E894;
	Thu,  6 Feb 2025 15:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVYuNnTY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E82510E888
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 15:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738855388; x=1770391388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JzNk9PJavj9UNy0SinRSsHkeIklcclpFgGULrCzHRjI=;
 b=PVYuNnTYKnReQHo4eHePRkxLpjTD2IxnEifcs/gbbC6jqdOQRJyg/oLX
 PRh0KVDWfa3fhnsV6MLjXaErEjxl52lfVu35R4WQPvg+hmCVU07nMPH/U
 RwWmyi7VUeq9MVB1Nga4X0GEyuVjSjV0qptCd7v1rchW1PlpEUUIdqu3h
 er28A2iwIqvdENKdE4vq5YtQXCfH2u7b5fGV8thGYzSdeeFdlDwXpNrBU
 +VsONYx9u8qeKa3rzSpV+C+jomVe960M+dG0eS9MVpzXkhstLWjQtcHkA
 n/nGXPD/N/s9Q8GXqowkiAKUdKCX77nGeJ6mvu9fP0INdqq5tP8zkjyVg Q==;
X-CSE-ConnectionGUID: pm5m/MbpSQ+sg/Oy6If/3w==
X-CSE-MsgGUID: JbNkjprnRfyZmgAGjLdnNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43386875"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="43386875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:23:07 -0800
X-CSE-ConnectionGUID: jBx6VVuMQ2mvjx81WQzMQg==
X-CSE-MsgGUID: q0BvL3XYR+28Us2+XWEJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111004945"
Received: from pnass-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.112.60])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:23:05 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 juha-pekka.heikkila@intel.com, katarzyna.piecielska@intel.com,
 ryszard.knop@intel.com, ewelina.musial@intel.com, adrinael@adrinael.net,
 mateusz.grabski@intel.com, konrad.b.brodzik@intel.com
Subject: [PATCH i-g-t] Bump aborting on network failure deadline to 40 seconds
Date: Thu,  6 Feb 2025 16:21:47 +0100
Message-Id: <20250206152147.209277-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Commit ddfde25f16ba ("runner: Add support for aborting on network
failure") introduced a 20 second deadline for the DUT’s network
to recover after a suspend/resume cycle. If the network isn’t
back up within that time, igt_runner aborts the test run to save logs
and prevent potential log loss from an imminent power cycle.

This deadline was set to accommodate our internal CI system, which
checks for DUT network connectivity every 5 seconds and retries up
to 3 times at 20 second intervals. If it fails 3 consecutive checks,
it triggers a power cycle on the DUT.

Although our internal CI system can be configured with a longer
wait time, extending it further would unnecessarily prolong tests
in cases of DUT hangs.

Bumping the deadline to 40 seconds keeps the abort mechanism safely
within our internal CI system retry window while improving chances
of preventing a premature abort. For upstream testing on Jenkins,
the deadlines vary from 16 and 25 minutes, and this change has
no impact.

CC: juha-pekka.heikkila@intel.com
CC: katarzyna.piecielska@intel.com
CC: ryszard.knop@intel.com
CC: ewelina.musial@intel.com
CC: adrinael@adrinael.net
CC: mateusz.grabski@intel.com
CC: konrad.b.brodzik@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 runner/executor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 999e7f719..2abb18732 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -218,11 +218,11 @@ static bool load_ping_config_from_env(void)
 
 /*
  * On some hosts, getting network back up after suspend takes
- * upwards of 10 seconds. 20 seconds should be enough to see
+ * upwards of 10 seconds. 40 seconds should be enough to see
  * if network comes back at all, and hopefully not too long to
  * make external monitoring freak out.
  */
-#define PING_ABORT_DEADLINE 20
+#define PING_ABORT_DEADLINE 40
 
 static bool can_ping(void)
 {
-- 
2.34.1

