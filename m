Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECF1CD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 11:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FFA113B08;
	Fri,  5 Apr 2024 11:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njCxrRwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69793113B04
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 11:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712315078; x=1743851078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bH9WX2uLyjPqRWXQzdBPxyiA7pUwoPcF1qA0PuvkZG0=;
 b=njCxrRwh+4uNOFc2bYe/0AH1r3gXVrRqwj3lC9WBdDMQuBs1M2Th+f2x
 WFiwM8KPuNu7i46yC6jgQC5I9MA9TmQAbDDrXpSuQvwuRmN0ydOOxhJwp
 fX1iyyvAUDM822VoVx7fkJPnoGWtwAD4buFcqEQ5PGZgWFG+8C0zmfIpY
 mU03NvTP6V+TWrqNySawAfsbxF0wjhzYcQoBfcC0xavFWjJyxi8VdiHVn
 V/5+wh9DQ4sFsRAEUQTVYD7N11/+ZZtOyCKIU65zCiS0b7TfSeFzohYH2
 Yfe4zGvojosJyBszr7iuIntCJtlk1cXzBd7Rna27DwVXyQtYLZ8/pL7TV Q==;
X-CSE-ConnectionGUID: afWaDvuxRnG3E36y7hk4OQ==
X-CSE-MsgGUID: WFym54zWR9CdXFCah4KDEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25080879"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="25080879"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 04:04:37 -0700
X-CSE-ConnectionGUID: Dmm9VOYuTsGP3fU/3dI7DQ==
X-CSE-MsgGUID: smbuVZOBRXeUymY/Xc/DtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23772123"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 04:04:34 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_big_joiner: cleanup force joiner
 debugfs state
Date: Fri,  5 Apr 2024 16:45:25 +0530
Message-Id: <20240405111525.1748544-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

cleanup force joiner debugfs state

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 078f76ac1..a507f524a 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -291,6 +291,7 @@ igt_main
 	drmModeModeInfo mode;
 	data_t data;
 
+
 	igt_fixture {
 		force_joiner_supported = false;
 		data.big_joiner_output_count = 0;
@@ -417,6 +418,7 @@ igt_main
 	}
 
 	igt_fixture {
+		toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.25.1

