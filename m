Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38076C021A6
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 19:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8A610E10D;
	Fri, 14 Feb 2025 19:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4htRnMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7709210E10D
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739559879; x=1771095879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c79FCL6ueluZgRGDgPikS5e1xOFDfV/X6Y6QxoRCmlA=;
 b=H4htRnMlscyBL0M18+ZRzzjdgDWwits4IhD2KbR5viJjXHB4U6iDM2uU
 Kau2hQR28uU3SCNWOZYit//cLD+vLr0te4XVUbncg1Yio7yzSUlEDZZjN
 TQ7q3QMFWiWw1BCy0hSSRDI0SM3/4zJDjclxk3w21ofeAyjJn4y+oydR2
 Mefx1XayxjzinU1jgZCo9cAlhJALKvAGZprlKz0SD7eO2ilitFNhvGh5w
 JPeHFNTEivCNm3SrdF+/9i3gSpSy7jrTNoYuHSnFYW0nLbUFxx/m6FIeA
 uvzr1/RKhy0qDciQYpDZg6SrfVcv6uHFMAt1orSpyYo+K+dneyWz0hDMs g==;
X-CSE-ConnectionGUID: HMVSAiARQzyz2zBCdJnHug==
X-CSE-MsgGUID: fWLw+eaNSHeDX9LXAL76mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="43970389"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="43970389"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 11:04:39 -0800
X-CSE-ConnectionGUID: J8EPVFA+SaaBH2C/eWK1KA==
X-CSE-MsgGUID: BGs+lalJTY+e1XAgKL0adQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="114167017"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.197])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 11:04:36 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Mateusz Grabski <mateusz.grabski@intel.com>,
 Konrad Brodzik <konrad.b.brodzik@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: [PATCH i-g-t 1/1] runner: Bump network ping deadline to 40 seconds
Date: Fri, 14 Feb 2025 20:04:12 +0100
Message-ID: <20250214190416.145374-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214190416.145374-1-kamil.konieczny@linux.intel.com>
References: <20250214190416.145374-1-kamil.konieczny@linux.intel.com>
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

From: Peter Senna Tschudin <peter.senna@linux.intel.com>

Commit ddfde25f16ba ("runner: Add support for aborting on
network failure") introduced a 20 second deadline for the DUTs
network to recover after a suspend/resume cycle. If the network
isn't back up within that time, igt_runner aborts the test run
to save logs and prevent potential log loss from an imminent
power cycle.

External monitoring machine checks DUTs health and if it cannot
reach it over network for 60 seconds it will reboot DUT.

Although our CI system can be configured with a longer wait
time, extending it further would unnecessarily prolong tests in
cases of DUT hangs.

Bump the deadline to 40 seconds to prevent a premature igt_runner
abort.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Mateusz Grabski <mateusz.grabski@intel.com>
Cc: Konrad Brodzik <konrad.b.brodzik@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Acked-by: Ryszard Knop <ryszard.knop@intel.com>
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
2.48.1

