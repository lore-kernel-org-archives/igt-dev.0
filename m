Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8C9C4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 22:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C781211330C;
	Fri,  3 May 2024 22:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+3DKXch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83BC11330C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714776425; x=1746312425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fUKtVMKyJT8P7ghqwYdyFoPGvd9DDRtQ+jzObM1zwFs=;
 b=c+3DKXchDNrS5HJ7/pZNnx9ZEMGDBNY5XEQMJDrGlNJwtL+1JP4Uwqii
 sAbL1MpN+N3sjAr+R9XfUWPuWz2dHB4Ml3Nq0JwXa85EIuxwSJ0p404GQ
 H6/tYwFilz42qnFWBRTguvxynSW8XkzkadlNV5nkyC2zt+QVpZ+uKgBfL
 Pi0ZLa5Yk3JbG5qSbowx07mK/duJc1Drw4+18VoEfSRGiMh0dS+qTfyuI
 4uLDFi/79YXmGBfPyx5TNhHoofVRMZZJgjAf/mcTkT2fwxhcjrkvbkgx2
 5crCQmCBFqQPQiOQJOUluoGAmswuA77cUx/8AwNrl4nd8HMrGzbiXpSVo Q==;
X-CSE-ConnectionGUID: FwFAAW/eScymqmB6fG9F8A==
X-CSE-MsgGUID: qGKEA5e9TL2xKkUUqEpdPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="22010160"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; d="scan'208";a="22010160"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 15:47:02 -0700
X-CSE-ConnectionGUID: 820IQqZSSVy6rlKMV9qQnQ==
X-CSE-MsgGUID: lECOCVa6Q7SviBqf5X8V8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; d="scan'208";a="27609355"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 15:47:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_pm: Reword *-basic description
Date: Fri,  3 May 2024 15:47:43 -0700
Message-ID: <20240503224745.14890-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

It doesn't make much sense to say the CPU is going to be put in D*
state. Reword it so the CPU and GPU states are better captured.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 51442537b..5e79e80ec 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -223,7 +223,7 @@ static void close_fw_handle(int sig)
 #define MAX_VMAS 2
 /**
  * SUBTEST: %s-basic
- * Description: set GPU state to %arg[1] and test suspend/autoresume
+ * Description: test CPU/GPU in and out of s/d state from %arg[1]
  * Functionality: pm - %arg[1]
  * GPU requirements: D3 feature should be supported
  *
-- 
2.43.0

