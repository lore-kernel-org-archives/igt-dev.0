Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61556C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 10:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E02D10EA0C;
	Thu, 13 Jun 2024 10:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxvCxwST";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C117410EA04
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718274264; x=1749810264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YwTHuLpbJXNgoCDHfT42T6x3jFC6hfKBUm21PNDpV+A=;
 b=hxvCxwSTaLxPQk+iD4JkHQTW+olx8du6DgNeZor95bkeijUvsjgO3N2s
 TWPUIERi0/8JYd543zLqdegAB9ljFo3KbFaDaFyB1Gzf+vKlaju9yMqwO
 KbDWKGec4/OA/ZiRbjCa/qsJTULOyZeH63RDnn44CLkYFFGSXytKMbzwA
 lMOLwbdU7rFGcXPB6H+n9e7b3FCz3RmjdC4L35azxNLu+XE7oNqe/jkMm
 jlpvB0WiJXLYCef+NQnr8x2KDNZU4DKa8bdW8/YAsM1cga0Qf/687Z5gk
 qc9rqTIstuxivOI2vux7/p/IXs2HvReFRKUrNF8frMbt+r7QEX6jf+MhZ g==;
X-CSE-ConnectionGUID: Jv7ij86MQWiz97xzzGeC/Q==
X-CSE-MsgGUID: 79R9DeTgRCi6p5hnhSnNPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18011147"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18011147"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:24 -0700
X-CSE-ConnectionGUID: ++p0DSjSQ829pWpJncRq9Q==
X-CSE-MsgGUID: 4toOlZqAR02rwPEzlCznwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40214985"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:22 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: [i-g-t V2 1/4] tests/kms_vrr: Skip low RR mode check for
 seamless-virtual subtest
Date: Thu, 13 Jun 2024 15:46:30 +0530
Message-ID: <20240613101633.3804434-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240613101633.3804434-1-bhanuprakash.modem@intel.com>
References: <20240613101633.3804434-1-bhanuprakash.modem@intel.com>
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

As the low RR mode is not at all using in seamless-*-virtual
subtest, don't check for it.

Cc: Manasi Navare <navaremanasi@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7f64d6806..9245305f8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -747,7 +747,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 
 	/* Search for a low refresh rate mode. */
-	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
+	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
 		return true;
 
 	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
-- 
2.43.2

