Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E35CD3436
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 04:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A45A10F328;
	Fri,  8 May 2026 04:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEKMvu7x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A03810F328
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 04:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778213127; x=1809749127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a5yFzT+bsJyFWWrQnUAtfSYXzqSfumDlCOAwDnOLciw=;
 b=eEKMvu7x24VpF7J2RKkWU8FENg38vTvVY1R0ogA02lnVXALAH8Y2AjyX
 7apX688Jw7AaeSm1+32Rn/lS+STQ58n92rRNL3UWnJn3/i283UUQUfotn
 2Uj0A3R1p0tllOH8fsgKYEwSd0yoF9rC1TE3q2GRuM6xoV05CORRepUXp
 GX8xCUJsP+FAijRQvDzsDB4cYqYvPgp1wiU8J7wYdD+lVEhbtZizYJDYl
 CPDrRIQdG1X09sP8OP8IrVPAvq0kqmEJw79O8h6cc2Kyjtkj9q4F10dEy
 gMML6EJHY8OwFlWPMIbpZWB9SGO1kdu0jpGFD4CLwWFxRbaAtIxDUupXs g==;
X-CSE-ConnectionGUID: 9SSWg3XcQ/CO7WLQglgeGQ==
X-CSE-MsgGUID: LmkD90fkSkGHG7EVT3bfKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104636917"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="104636917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 21:05:27 -0700
X-CSE-ConnectionGUID: tUP5FUb0R3O/fgWrzUgKEQ==
X-CSE-MsgGUID: CA6mILc0TBWEkAq1yHzo/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="260366273"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 21:05:25 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_joiner: Fix mixed_output subtest
 skips
Date: Fri,  8 May 2026 09:29:40 +0530
Message-Id: <20260508035940.645143-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

In the mixed output case, mixed_output[1] is a non-big-joiner output,
but bigjoiner_mode_found() was unconditionally called for both outputs,
causing the subtest to skip. Only require a big joiner mode for the
first output (j=0); the second uses its default mode.

cc: Karthik B.S <karthik.b.s@intel.com>
cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 86226a3ba..20f39ceef 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -386,7 +386,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 
 			output = outputs[j];
 
-			if (!force_joiner) {
+			if (!force_joiner && (!mixed || j == 0)) {
 				igt_require_f(bigjoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode),
 							  "No big joiner mode found on output %s\n", output->name);
 				igt_output_override_mode(output, &mode);
-- 
2.34.1

