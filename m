Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564ECC27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 14:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B1610EC8C;
	Fri,  7 Jun 2024 14:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaAK/JVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBF110EC8C
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717772272; x=1749308272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=38Ay/7FFW0FdadteKjCKDpNlVa9xAmr+sqSy9LclnNY=;
 b=FaAK/JVPylorE3kw8gXAdjKQDM6UeFnHwrD8omweLo5ojP+NOwcy/H2p
 vZPoD/dJJeUfvgElzpiOlHp5leOi/WDLfwWQ6MrjBxMs2nD48sCjyF1DG
 SVARSILcCcfF3qxLPaoKND5TJpDco6oGe/vaGrjMPzzTiFmBarPQIlaSi
 93AlNt88wyexMZMnVcWkHWrTQDUGzgGFzJqiCiuF9Gn6lXobek2jMrg4V
 xs+5ZjML8VWgUcIGLrA1vtbCpJl70D3o+MjkK4s0FC7XXvcsNF+tCBmiC
 weT2c99mqQ9dofMFZIYWE3a0WwwRhdQCXWohNs3QPSt4HqTnlHRMh0nFX Q==;
X-CSE-ConnectionGUID: +j6vmsMXRUS+kga3tV2Okw==
X-CSE-MsgGUID: rHBTFlrKQVSGJ1PRQ390Sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14331612"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14331612"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:57:51 -0700
X-CSE-ConnectionGUID: 9UEh36FQRpCX28tjkcgXIQ==
X-CSE-MsgGUID: 2pKXNGvFRYSRP2l1ujCf4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38926794"
Received: from unknown (HELO vgovind2-mobl3..) ([10.245.244.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:57:50 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH i-g-t 1/4] lib/i915/fbc: print current fbc status if cannot be
 enabled
Date: Fri,  7 Jun 2024 17:57:29 +0300
Message-Id: <20240607145732.285557-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607145732.285557-1-vinod.govindapillai@intel.com>
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
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

Print the current fbc status if the fbc is not enabled after
the timeout.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 3fac60087..07ed7f469 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -92,6 +92,10 @@ bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level)
 bool intel_fbc_wait_until_enabled(int device, enum pipe pipe)
 {
 	char last_fbc_buf[FBC_STATUS_BUF_LEN] = {'\0'};
+	bool enabled = igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
 
-	return igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
+	if (!enabled)
+		igt_info("FBC is not enabled: \n%s\n", last_fbc_buf);
+
+	return enabled;
 }
-- 
2.34.1

