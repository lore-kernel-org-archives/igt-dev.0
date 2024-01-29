Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC02C47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 07:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47FC10E21C;
	Mon, 29 Jan 2024 07:01:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8327810E21C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706511715; x=1738047715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DEFkd/KrP5dR0ZdZmZCIe09DssLlLYefmFyRC3Hv3hM=;
 b=Tc8w2r217RHlwPHLGxAfZIBQylGEZAVRFRjf4blHQVwPeHmB7qXPyg0h
 FZ78uuyBF2Y/lpt5+S9M7O+ZGKtg+UCywR0RWO2vh63Feg1S4JQxJ5Uii
 sR3MGashny1wsV3oMCa0O7j4shni5q/Sx3GmL7AfYZ0KA6NiDUwsP2gvs
 P7gRFZ9fNtYdTdpdJcgSxbp17XH+fQxCCW8EBeoa+WmqvJeyA4BSP5s1a
 FZmm8nXR+LgkgnF/7ZPM5QFqMf+ih19FGTahrZYzJJ0I8fHLQZb84Ykl6
 hBaM4Nrar86tVE0uC4n5Sv7XJBQEJOhgo6iLCPU8AzGiWPkgdE4MSO88A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1801856"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="1801856"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 23:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="906993805"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="906993805"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 23:01:48 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_exec_atomic: Skip on unsupported config
Date: Mon, 29 Jan 2024 07:48:23 +0100
Message-ID: <20240129064823.8358-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Atomics on system memory for dGPU is not functional
at this moment hence skip on such configuration.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_atomic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 7ee80816c..081fae761 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -112,9 +112,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 static bool has_atomics(int fd, uint32_t region)
 {
-	/* System memory atomics on PVC doesn't work */
-	if (region == system_memory(fd) &&
-	    IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
+	/* System memory atomics on dGPU is not functional as of now */
+	if (region == system_memory(fd) && xe_has_vram(fd))
 		return false;
 
 	return true;
-- 
2.42.0

