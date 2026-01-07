Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C825DCF6C1E
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 09:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEE310E57F;
	Wed,  7 Jan 2026 09:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKe26fHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215DA10E584
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 09:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767778046; x=1799314046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rbdmcxs1MY4hEzNQhBR+KoCnNe0Hk8RgjHjwR/aGjLs=;
 b=PKe26fHMl1nxXFtABTm2ZvWL7Pqu9oeQWwYW12edihACnOdE9vou/O40
 FnjvPXkJKZ37ejcFyYHhywNGyY4Aahz3/Hxb/1UgZ++WDLYCj2ab8STPR
 CAESisiBzRCLcsl7ZWdYLBztdb7nso1VnYHm23gfSTlvlKxRTNtaMrbcP
 k2YTLZ0b/CyfniqkJ2gL0lKSV3zmu0M6dLOxmgVPm7IaOJm1UOlyZzNLS
 UcPaiEpbdM1WktQVT5vcobQazPkvYp8WI+4dcphnRbfiQsPBmfSk3ao2Q
 E3yL7CVrO5DCupDcir/7348weR8b8tlYd73rdy7W8AhL1TbV2LYM811L3 w==;
X-CSE-ConnectionGUID: wzOp5mAlTvSva6BDlMTZwA==
X-CSE-MsgGUID: CSWHxSIGRYiTCaFhwNw01w==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68337815"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68337815"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:27:26 -0800
X-CSE-ConnectionGUID: HuPVdQQkStOdgFgmmM+ywg==
X-CSE-MsgGUID: 2jbe6eK2SyWnChbvMR5Pag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207412588"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:27:24 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t,
 v2 7/7] tests/intel/kms_test_config: Add NVL display blocklist entry
Date: Wed,  7 Jan 2026 15:05:35 +0530
Message-Id: <20260107093535.70116-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260107093535.70116-1-swati2.sharma@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
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

Add the NVL-specific display blocklist to kms_test_config.json.

v2: add NVL to xe.blocklist.txt (Karthik)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_test_config.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 5645de181..61a70a9bb 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -61,7 +61,8 @@
 			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
 			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
 			{ "PTL": "../intel-ci/xe.ptl.display.blocklist.txt" },
-			{ "LNL, BMG, PTL": "../intel-ci/xe.blocklist.txt" },
+			{ "NVL": "../intel-ci/xe.nvl.display.blocklist.txt" },
+			{ "LNL, BMG, PTL, NVL": "../intel-ci/xe.blocklist.txt" },
 			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/i915.blocklist.txt" }
 		    ]
 		}
-- 
2.25.1

