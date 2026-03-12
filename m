Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3319FFED2E7
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 08:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEEC10E9D9;
	Thu, 12 Mar 2026 08:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksISG2Y2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC50E10E9D9
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302945; x=1804838945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zPYJuDF7ST/VdfW8rw7iC79bL+zBVxpR8QBIAZGl/5c=;
 b=ksISG2Y2jfd/30UvFH16CL79MN6wUxn61tszBUGJdbsgoOth+LamCwMO
 d7Q4lGkIEoq97muL5d/4cgJ2qLGXU52BXtPCOGDzEfB8xDHtwwJq3ACfK
 B0zdO6Hi/kw/Vld7Ugv6aqWlT+/SmAS97bZFPKuFwTu6GxzcjsH1pMIIZ
 aV02YCxNPoY+V0lUJtxCxhHnAkww8JoO9mHV1rDhkFHk9vXG4y0OPYUe2
 FYEZPubnaheDfPiy49lg7zD/2Igy4bocle4FWamnqEGHDL6HMoYCgxcfk
 Qdz4snlUWKBnZpy5f5f4xCU8qfVHjpHuqiyfWoyNW1SxCW+Pm2glMtvT2 Q==;
X-CSE-ConnectionGUID: 306c0tZwStSG6R3fQ9rauA==
X-CSE-MsgGUID: bORRTTvzT2OXhTgFHO4fJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74501735"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74501735"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:09:04 -0700
X-CSE-ConnectionGUID: +vCUf3yrSk2XK5Sr3vHBZg==
X-CSE-MsgGUID: lwyLTOs4To6KQ6VKto/lgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="220007442"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.69])
 by orviesa010.jf.intel.com with ESMTP; 12 Mar 2026 01:09:03 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Avoid PIPE_B conflict on
 dual-eDP systems
Date: Thu, 12 Mar 2026 13:33:05 +0530
Message-Id: <20260312080305.43449-1-mohammed.thasleem@intel.com>
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

Select the first available eDP output and assign it to PIPE_B to avoid pipe
conflicts on dual-eDP systems.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index d1c4a5019..2e5ffe842 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -149,7 +149,10 @@ static void set_output_on_pipe_b(data_t *data)
 
 		data->output = output;
 		data->mode = igt_output_get_mode(output);
+
+		break;
 	}
+	igt_require_f(data->output, "No valid eDP found for PIPE_B\n");
 }
 
 static void setup_output(data_t *data)
-- 
2.25.1

