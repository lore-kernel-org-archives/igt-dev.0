Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38053D29FFF
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 12:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C762C10E128;
	Wed, 14 Jan 2026 12:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8lJ5aWd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF2810E128
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768394354; x=1799930354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MqXQbNlqn59wIv4f4nseAVCRg2qpHNwifuV1HPK1s6w=;
 b=V8lJ5aWduYeOLw6QQk+ldTL2F+5J1LGBW52okIdnkLcmV2CqXJhK41Kl
 nJOMyb0TUvNaTNMbmENIuz3UJOV4WtNpv3OJNY0riVwgsDdN4iLyvngIa
 jvyzCDsnXE4qhkYywBUP0XKXPqTU8giAkGVdzvdl69NUFJxoNCTGzmQth
 nRDoJXORgCjAqlcXriKJR+qsaiCzuT8uilingcp4rIGxvWMpQhSIWL1my
 gTEa8zx/avhqn7iyiCgV5qy5Wwregy7ePnqU2vpMo/Ia0GGrgap+vr5Kp
 8wgF7mD11V5eytYTwMTxPCjctE35zRoqXKW5ou4RgfdEKN7j2F2WBI9/5 A==;
X-CSE-ConnectionGUID: zJNEZVexQ/qmHY9TjSFp5w==
X-CSE-MsgGUID: x4WEm1DWT4qzn9T8Ahdh6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69774978"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69774978"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 04:39:14 -0800
X-CSE-ConnectionGUID: TNR3B4YdSgm3gKHoGnYqvA==
X-CSE-MsgGUID: 86Zaj5zfRx2IbXLI+6hOEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="203893462"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.70])
 by orviesa010.jf.intel.com with ESMTP; 14 Jan 2026 04:39:13 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix CRTC conflicts in output
 selection
Date: Wed, 14 Jan 2026 18:04:26 +0530
Message-Id: <20260114123426.14804-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Reset CRTC state for unselected outputs to prevent assignment conflicts.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index d7d0989b9..20c81ca3c 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1639,6 +1639,8 @@ static void set_prefered_mode(void)
 			mode_found = true;
 			break;
 		}
+
+		igt_output_set_crtc(output, NULL);
 	}
 
 	igt_require_f(mode_found, "Not found any 8K@60Hz or 4k@144hz mode on any connected output\n");
-- 
2.25.1

