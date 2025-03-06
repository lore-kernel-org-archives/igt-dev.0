Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C09C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 11:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8745510E942;
	Thu,  6 Mar 2025 11:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcoTL1E8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E310E942
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741260654; x=1772796654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=963Ykdqeh2GmbF9ARN2btSyId+758yIHeZsHa7+Y+j4=;
 b=PcoTL1E8djmP2Lg42+2g+1vxsYVS2yfuFMwE+Bls8PGdpfZhW1WRljAO
 X+BWIs7ZnmTXRRFLIX1K37j6IjEi4b3aKLlfAjHpb7U2+3FWGQXRXcYFN
 LSSBRuz6J9LQbvC1py+TqXQEo7wN8OzOVoXzzHzT99FQgwYhCi2haMLD4
 BIXXQ5JG1BynGGLyr5FsFn/RV3rhe/tqtQbvNHpgZ2Mtz2gG1q58oEqVC
 09VkR9+/jajDeIKGDpeBDY7zTXGHp2gZhnDulDE6qsw5SJy64s2jkctQV
 BHpaOJHxcU7u4W1mzkepn5ehjLOy1xJ0PSJjO1TbKHbd7aIbaIk4IqHs+ A==;
X-CSE-ConnectionGUID: Q9vx4pZERYueXeTmFG1ZbA==
X-CSE-MsgGUID: p6Ge8USFTBabHAHpl3Qn+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67634291"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="67634291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 03:30:53 -0800
X-CSE-ConnectionGUID: DC/W2we5RwyDGchtdrh3Wg==
X-CSE-MsgGUID: XP/mXxbqRvePE2qNiV9SFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119494922"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 03:30:51 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Date: Thu,  6 Mar 2025 16:57:54 +0530
Message-Id: <20250306112754.1483363-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add support for runtime power management
for Xe driver.

---
 tools/intel_pm_rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 08c25ca8a..945247d2e 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -151,7 +151,7 @@ int main(int argc, char *argv[])
 			goto exit;
 		}
 	} else {
-		if (!igt_device_find_first_i915_discrete_card(&card)) {
+		if (!igt_device_find_first_i915_discrete_card(&card) && !igt_device_find_first_xe_discrete_card(&card)) {
 			igt_warn("No discrete gpu found\n");
 			ret = EXIT_FAILURE;
 			goto exit;
-- 
2.34.1

