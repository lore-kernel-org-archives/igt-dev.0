Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E742CD5E13D
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 18:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9000810E3D2;
	Tue, 16 Dec 2025 18:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2ZKxUrJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7102210E2DD
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 18:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765910720; x=1797446720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b5IHzZhhdhtRFyrDVQEYWfx87F+DePug+VGeKL2nSkA=;
 b=U2ZKxUrJr2In5eJl3or8HbofOK61MPh8WWHMHQosKxsW+gomSDCAm+OG
 0UzUflG00KORw0/+EV0XzRojEbm0cEc9CTp9mENmYUVQc713/eS7xRnrz
 u+v6St5w8jMq9hPACos+W/8c31gg9aOasSFqJ4obFHQ5XMLgr8nyBs0oO
 P4gCepOi1dk1o9AuPDYYJaw6cfioSz3WFd47nTkcVAeCmDOgWHyLv16yp
 OHUZc6g1sBdpYgM9HsSSzsPjmJB9Lvseg7KZOwlXfoqrOKd3FfGjd69G8
 nhSm/iE2dVp7MAA/uHtxCdoIXYiWAg38Cn0/TNMLu0642PqFdU7CxIMLN g==;
X-CSE-ConnectionGUID: MHzajqQETzO5xaWmXRPViw==
X-CSE-MsgGUID: rB1L7s3qR+e+lWOV1OO4jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70416036"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70416036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:45:20 -0800
X-CSE-ConnectionGUID: GqkXjkfnSYOzG8AqnhnUDA==
X-CSE-MsgGUID: CtTO/D5sS5ixlJzxhHM/DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198148627"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:45:19 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 7/7] tests/intel/kms_test_config: Add NVL display
 blocklist entry
Date: Wed, 17 Dec 2025 00:22:15 +0530
Message-Id: <20251216185215.1281390-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251216185215.1281390-1-swati2.sharma@intel.com>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_test_config.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 5645de181..44c439e28 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -61,6 +61,7 @@
 			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
 			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
 			{ "PTL": "../intel-ci/xe.ptl.display.blocklist.txt" },
+			{ "NVL": "../intel-ci/xe.nvl.display.blocklist.txt" },
 			{ "LNL, BMG, PTL": "../intel-ci/xe.blocklist.txt" },
 			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/i915.blocklist.txt" }
 		    ]
-- 
2.25.1

