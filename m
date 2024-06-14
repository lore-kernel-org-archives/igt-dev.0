Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C990DC27C77
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B4610EC32;
	Fri, 14 Jun 2024 05:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoGzvvzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF55B10EC32
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718343543; x=1749879543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lrg3jLUzh0VHw0ySk5YbxddGdKUfldOxneBkDRxNSYg=;
 b=UoGzvvztRVL70CD1CIPpCteA7WL80rDAeQWE1ATg0rjWEpMhl3HoLfsA
 S4gKkm1MGEs+ZEg5+hrqPaZ8HRIKDp/0kyBjEZsZ3gYm3Nrsngsfr0xZo
 UFnUoXkMoXp+aGaRbSKiySlSTjALH4LkoHnJ95jRwqYUx+QBem6AtKobD
 hX8M+7vLvfYzNxy3edJhEtUO5DYosXvsFvclNxUcOYam38j4bkQN9J2NX
 bTBs9ptcAx0OL9vuFSIVgXuc89MRswM33SnegkJDGp9nbCs1fwAKpJh4o
 VdrEEoyFV1HcJVtzrW8czPgaJcs08/ysCO/0C+U7X9kQLeBL5u5vzGa9C g==;
X-CSE-ConnectionGUID: JLO5E/WQTeG+6bO/WvuPxg==
X-CSE-MsgGUID: OpetM7S+SY+U61JUanJeFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26331590"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26331590"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:39:03 -0700
X-CSE-ConnectionGUID: J//5RqQKTPCITRF/k2kzCA==
X-CSE-MsgGUID: D/K34IyJSOW4iyaPDx2GRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77864060"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:39:01 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 5/7] tests/kms_psr2_sf: Use stored psr mode instead
 of PSR_MODE_2_SEL_FETCH
Date: Fri, 14 Jun 2024 08:38:37 +0300
Message-Id: <20240614053839.1822879-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614053839.1822879-1-jouni.hogander@intel.com>
References: <20240614053839.1822879-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We are already checking psr mode supported by system and storing it.
Use stored value instead of PSR_MODE_2_SEL_FETCH when enabling psr mode.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_psr2_sf.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 4c3e34aa0..4fd9e0444 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -195,6 +195,10 @@ static bool set_sel_fetch_mode_for_output(data_t *data)
 	} else
 		igt_info("selective fetch not supported on output %s\n", data->output->name);
 
+	if (supported)
+		supported = psr_enable(data->drm_fd, data->debugfs_fd, data->psr_mode,
+				       data->output);
+
 	return supported;
 }
 
@@ -1053,11 +1057,6 @@ igt_main
 			data.fbc_flag = true;
 		}
 
-		/* Test if PSR2 can be enabled */
-		igt_require_f(psr_enable(data.drm_fd,
-					 data.debugfs_fd, PSR_MODE_2_SEL_FETCH, NULL),
-			      "Error enabling PSR2\n");
-
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.primary_format = DRM_FORMAT_XRGB8888;
 
-- 
2.34.1

