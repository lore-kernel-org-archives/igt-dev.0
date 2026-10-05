Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957B0CA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 11:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B89B10E25E;
	Mon,  5 Oct 2026 11:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="caHG2gWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5650510E249
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791198895; x=1822734895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w1NRczbn62zCD/cIYiyD2r0jX3ps7VaeFkZql/y8ZbI=;
 b=caHG2gWBq54RZq5G0z7GbSxjuvET+LtcMOl6Zr3nN4aI85KA03+WdTKx
 +p0fGoNzEdyM0evLOfnrxPjSd6mqAN0QeMyyDwzrFqIXekr73iRWDqlXg
 xCGsNlqfoL7YsyJeokuYdNQXfglCWmMaMDwandrXuZmnOQI2uzdDCFcl4
 o+cu0wqSRC/ZRcG8vaojtwCt6+Gd3+uPiHXA8QAjF+QABWqNxEfjNhoW1
 wwDA1t1605nTktSzR7q9cl4io2XQuBlgbDpGeg++CRu9C4asmoyw4GR3n
 reaPTmXn/EpUIdz83t0m3dViGABwpaWU+AzxvmT9ekkQu9LsY5Ldj1Nvj A==;
X-CSE-ConnectionGUID: 94zPJb5GRieTi33mczAmqA==
X-CSE-MsgGUID: vrh4/oC0TluG71Zeqf4bDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91074687"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="91074687"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:14:55 -0700
X-CSE-ConnectionGUID: a8lQxmAESx2SB0NAdi3cPw==
X-CSE-MsgGUID: aS8dNlB1Ra+YKnswBmGI1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="9484"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 04:14:54 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 2/2] igt/runner: Add the rate limit feature for dmesg
 logs for runner
Date: Mon,  5 Oct 2026 11:14:42 +0000
Message-ID: <20261005111442.2755785-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005111442.2755785-1-sobin.thomas@intel.com>
References: <20261005111442.2755785-1-sobin.thomas@intel.com>
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

Introduce --rate-limit N option to igt_runner to control the number
of duplicate identical dmesg records are kept in the results before
the remaining repeats are summarized. The default of 0 disables the
rate limiting.
This is introduced to limit the logs to prevent log truncation due to
size limit and test abort ocurring due to large dmesg logs.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 runner/settings.c | 2 +-
 runner/settings.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index e6f8af358..62a4a17b3 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -279,7 +279,7 @@ static const char *usage_str =
 	"  --use-watchdog        Use hardware watchdog for lethal enforcement of the\n"
 	"                        above timeout. Killing the test process is still\n"
 	"                        attempted at timeout trigger.\n"
-	"  --rate-limit N        Keep the first N consecutive identical dmesg records,\n"
+	"  --rate-limit N        Print the first N consecutive identical dmesg records,\n"
 	"                        then summarize repeats. 0 disables limiting (default).\n"
 	"  --dmesg-warn-level <level>\n"
 	"                        Messages with log level equal or lower (more serious)\n"
diff --git a/runner/settings.h b/runner/settings.h
index 5d2bbf3e4..4bc00e824 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -77,7 +77,7 @@ struct settings {
 	char *results_path;
 	bool piglit_style_dmesg;
 	int dmesg_warn_level;
-	int dmesg_rate_limit; /* 0 disables duplicate suppression */
+	int dmesg_rate_limit;
 	int prune_mode;
 	bool list_all;
 	char *code_coverage_script;
-- 
2.43.0

