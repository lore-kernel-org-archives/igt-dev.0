Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63469D3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 12:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165E510E541;
	Tue,  9 Dec 2025 12:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpsOlHkB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD6010E541
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 12:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765284708; x=1796820708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fcEMj5WXGkhLOvbq20RpuKp6IOsl5DcOfBouF47dqnQ=;
 b=YpsOlHkB1tFND+eGmoS+1WbKnGE5yNtOSyBU7oLvVhDYxgI9iDwFBQoM
 /yP5VALU5AV61yq/XLR/nwat0i3R39EFzQ/Nh84xow7pMewBEtcJnRyvs
 ZU2I7EQq9Y4X4/LKGC7dO3vC5e8JMMVS0cQceWDUpUGqBpYyAlB5PiQeL
 kV+YdpufuY7C4DAv3gmhUOiiwpvmUjdMDafxDES5rvIdg6dq+1IWF2pXP
 4MDfdz8euAJSDDiXsmZ2csPvrsbAVSuPdBcy2aRFaAd/KMCVbRgO8XUd8
 1wyEuLLvSyZko4cB73x9COtNOpkPauzD+4hpGPOM/e5ruxvytPxP8aW4U w==;
X-CSE-ConnectionGUID: KmZBM7vyRIGPO+LYf/fntQ==
X-CSE-MsgGUID: 820a+UtaT4aYYoKIjW81hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66419838"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="66419838"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 04:51:47 -0800
X-CSE-ConnectionGUID: uedCHLeTSO6V68Haho4PiQ==
X-CSE-MsgGUID: YLZ+vdBrTruF5m2oh3T1Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="195489289"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.211])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 04:51:44 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t] scripts: remove symlink
Date: Tue,  9 Dec 2025 13:51:30 +0100
Message-ID: <20251209125130.22657-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

GitLab pipeline now run without this symlink so remove it.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/verify-blacklist.sh | 1 -
 1 file changed, 1 deletion(-)
 delete mode 120000 scripts/verify-blacklist.sh

diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blacklist.sh
deleted file mode 120000
index 7f706d61b..000000000
--- a/scripts/verify-blacklist.sh
+++ /dev/null
@@ -1 +0,0 @@
-verify-blocklist.sh
\ No newline at end of file
-- 
2.52.0

