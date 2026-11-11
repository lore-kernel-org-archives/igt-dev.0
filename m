Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C4606A321
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VunU7XJp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45B710FB77;
	Wed, 11 Nov 2026 12:20:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432A010FBA4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794399538; x=1825935538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J+SyQV9RBYJ7BceVMIDWrTFt5BtRmVw9wYrTOnrzGow=;
 b=VunU7XJp8XEbILQ6bwF+O5/l2qDkg2ku3iPl9K2qDnSmFV1WY+02jffs
 JpbQo9EU1KA3QVo7fOeh8X6m4mqJFNuktSx3NNjfgbLxLj81ywnDCmU9u
 m/CQYJWeWfjHtuNxnqUWacWGrpfyRrYckgGl98MlFl9ypZNLPyIDiULtP
 zpV67qMFtQuuPS9ACc4E0D4mwxir4RJR7WYkGnei4C1R0RtjC4OOljCjg
 eUUss4U5OsFBVtU3rjEz5J6Rq2OmSrNKwbmHosRprfJNYydLW4s0HC6MV
 pdAtuxMDSHi52og1XCZUIHFU3kKC0dORgOeubyfC8shzdTKQeu9J6fOFr g==;
X-CSE-ConnectionGUID: 781QSAmeSLeH99kPddKCzg==
X-CSE-MsgGUID: eVi/r36nTXO/eaIEUsd0VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3070104"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3070104"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 04:18:58 -0800
X-CSE-ConnectionGUID: Tp7BHp7eQi+O+zaNR2kVoA==
X-CSE-MsgGUID: b/Z9QRfITMWMyqrgXpgn9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8746847"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2026 04:18:56 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_eld: Log module load state when no eld#
 nodes are found
Date: Wed, 11 Nov 2026 17:25:51 +0530
Message-ID: <20261111115551.4106029-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

eld_is_supported() silently fails when ELD procfs node polling times out.
Log module load state to identify whether audio drivers are loaded when
IGT attempts to read the ELD nodes.

v2:
- Use igt_warn() instead of igt_debug(): igt_skip() doesn't dump the
  debug buffer, so the message would be lost on the skip path (Pranay)

Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Pranay Samala <pranay.samala@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_eld.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/igt_eld.c b/lib/igt_eld.c
index 0d3c6689b..d0698f6ad 100644
--- a/lib/igt_eld.c
+++ b/lib/igt_eld.c
@@ -36,6 +36,7 @@
 #include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_eld.h"
+#include "igt_kmod.h"
 
 #define ELD_PREFIX "eld#"
 #define ELD_DELIM " \t"
@@ -318,8 +319,15 @@ static bool eld_has_nodes(void)
  * for a bounded amount of time before giving up to avoid spurious skips. */
 bool eld_is_supported(void)
 {
-	return igt_wait(eld_has_nodes(), ELD_SUPPORTED_TIMEOUT_MS,
-			ELD_SUPPORTED_INTERVAL_MS);
+	bool supported = igt_wait(eld_has_nodes(), ELD_SUPPORTED_TIMEOUT_MS,
+				   ELD_SUPPORTED_INTERVAL_MS);
+
+	if (!supported)
+		igt_warn("No eld# nodes found; snd_hda_intel loaded: %s, snd_hda_core loaded: %s\n",
+			 igt_kmod_is_loaded("snd_hda_intel") ? "yes" : "no",
+			 igt_kmod_is_loaded("snd_hda_core") ? "yes" : "no");
+
+	return supported;
 }
 
 #define ELD_MAX_SIZE 256
-- 
2.50.1

