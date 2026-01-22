Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336CFC44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 11:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DE910E06D;
	Thu, 22 Jan 2026 11:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjB+Jku0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DAE10E06D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769080421; x=1800616421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x329pho36dyKko36/H2gQpcQJU/PEWon+a+iyoQYaqA=;
 b=fjB+Jku0308s/e1fku/HFBgjHEahg0v+z7+gEwSFJN7ZpuJ6RJGFWxt8
 qdrdPE/nNp2mbqVoMFZ3UJndK4bDHZHsYOpWjvRzqZ/5YZdkpMArBiPNA
 chLNShygBxAL8kzEpGQAFwg7zDlHjWmRUhwjbW5uz4qW6fgLaTDnWJBUc
 8IE+HD3tGYFtc168qyBuaiAF84Ql1N/b/Hcc6oRWcD1kaGlqVa7kf+p2O
 VplpK8Rd8hQPBfMQP4+SBlKuq5ccLjZHsykKvKEbxGXkzcg4PszXZrAKl
 GX1UcLvZ62DiOKQEUQGdN/tHkjbB7gUTXNoBM7g1a6J2z2BlhLZ9SqiFQ g==;
X-CSE-ConnectionGUID: ThvNqVqWRge3Nps4ce6qZQ==
X-CSE-MsgGUID: voK/uLT6RoyWEGww6vtBVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70485884"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70485884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:13:40 -0800
X-CSE-ConnectionGUID: qf/Eow6mTUqziCRuxkRyPg==
X-CSE-MsgGUID: 0YrpdN+sTNeeNyXs4UXCtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="210854066"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.70])
 by orviesa003.jf.intel.com with ESMTP; 22 Jan 2026 03:13:40 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix CRTC conflicts in output
 selection
Date: Thu, 22 Jan 2026 16:38:46 +0530
Message-Id: <20260122110846.1312-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260114123426.14804-1-mohammed.thasleem@intel.com>
References: <20260114123426.14804-1-mohammed.thasleem@intel.com>
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

v2: Remove extra line. (Jeevan)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index d7d0989b9..1dd958e23 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1639,6 +1639,7 @@ static void set_prefered_mode(void)
 			mode_found = true;
 			break;
 		}
+		igt_output_set_crtc(output, NULL);
 	}
 
 	igt_require_f(mode_found, "Not found any 8K@60Hz or 4k@144hz mode on any connected output\n");
-- 
2.25.1

