Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1D2CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 09:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E8810E67A;
	Thu, 18 Sep 2025 09:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqEPYpJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7177E10E67A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758186076; x=1789722076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ixIG9GiaRDMPhpf0OmmzlmbzBaSZ6gewdwso5jMaoao=;
 b=cqEPYpJd7e2LJ6Dnpcfew/dLdD71QN7kIA7Mh4f4js6hBdopNugEA5Me
 Qnn9Yp5xGzFTTq0eOO974AY2TsY/onWBRkqSkruIQgNG51FV+qmVdQBY8
 pdYTwoCOjNs9VNJPnmI6FbVhQ7fEOFBM1apkYGVRjdKzFo9npsJnFgqPo
 cCzDC8ft3Q8N1SbQBzIjpQOWiFCCiUme5NVl0RzQftb8zNgetmbRfwvYD
 +27CBiRuSpOH3HJ0vHRcM7A5GGfVie45r/ggjnJIRexg1w83I8jCtQnO8
 YZiaYxtlCmASyJ+dxJQsPT4JZ96tCmK5JVjWu653smx61ytL+fLEwmQ2l A==;
X-CSE-ConnectionGUID: r7jocb3YRGCrtF71JBQIEQ==
X-CSE-MsgGUID: WC6b7u6xTFu2VKiKIiji0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64313257"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64313257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:01:16 -0700
X-CSE-ConnectionGUID: NpVOCyPHRpKR+tLyRfisbw==
X-CSE-MsgGUID: +zvONLJ/TI2Esljl63ZbTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206281482"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 02:01:15 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_vrr: remove check for PR support in sink
Date: Thu, 18 Sep 2025 14:47:02 +0530
Message-Id: <20250918091702.2339227-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918091702.2339227-1-kunal1.joshi@intel.com>
References: <20250918091702.2339227-1-kunal1.joshi@intel.com>
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

LOBF can be enabled on sinks that do not support PR
as well.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_vrr.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 820a982d0..ce75c7123 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -966,11 +966,6 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 				 igt_output_name(output));
 			return false;
 		}
-		if (!psr_sink_support(data->drm_fd,
-				      data->debugfs_fd, PR_MODE, NULL)) {
-			igt_info("LOBF not supported\n");
-			return false;
-		}
 
 		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
 		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
-- 
2.25.1

