Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A908CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 08:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DDE10E8A5;
	Wed, 10 Sep 2025 08:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iur4YKV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC5510E36D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757494466; x=1789030466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IAEkBa7yH7rrLY4CvoF+yg4+FBpXNocO0j6rlbkbSQc=;
 b=iur4YKV54+17skMRK0GnaxBzDpEYwBCS2RohA1nz9SdJfUJZvzK0MXUZ
 YlZanJyta0hvFMUZnZ28epqjB8dwv694iqvpFe1GE18f4gd4HbEcKQDHP
 GihI27LKY0dNojAimDs3ac4hDtfoex786KPBhWGpmmhNiMtJUQ0gEA1Ju
 nAvQ9yMNa7OeOHQzvFVGE/ZEZ9lbGEH3aXK+Ubqc0t0Zir3i1EGob4JT8
 4KLk+r1Uyrv54FoSRIo9Q+G0KxgNhdr1V+paYW1n+4A0kXHl1TETT013R
 AcfrIpXFJW1jde8BWtP466kTrs2bDDfqkOkfe+a67Lx5JbdDBaFy/bwV3 Q==;
X-CSE-ConnectionGUID: 8WbJ3fhNQGOHrAQ9Pt3dHA==
X-CSE-MsgGUID: KV6sDe3wReaxuvrNHF5HAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77252090"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="77252090"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:54:19 -0700
X-CSE-ConnectionGUID: EJi9zQDjS8mmfmRJFi1d2w==
X-CSE-MsgGUID: 2H22LGFpQgakd92gXokt/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="178536695"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:54:18 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/4] tests/kms_pipe_stress: lower minimum iterations in
 simulation
Date: Wed, 10 Sep 2025 14:30:59 +0530
Message-Id: <20250910090059.351698-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910090059.351698-1-swati2.sharma@intel.com>
References: <20250910090059.351698-1-swati2.sharma@intel.com>
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

Reduce minimum iterations from 20 to 5 in simulation to
shorten runtime while retaining meaningful stress coverage.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_pipe_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 7551a5e9c..a9992cfff 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -610,13 +610,13 @@ static void stress_pipes(struct data *data, struct timespec *start,
 }
 
 #define MIN_DURATION_SEC 5.0
-#define MIN_ITERATIONS 20
 
 static void stress(struct data *data)
 {
 	struct timespec start, end;
 	int iterations = 0;
 	bool need_continue;
+	int min_iterations = igt_run_in_simulation() ? 5 : 20;
 
 	igt_gettime(&start);
 
@@ -626,7 +626,7 @@ static void stress(struct data *data)
 		iterations++;
 		need_continue =
 			igt_time_elapsed(&start, &end) < MIN_DURATION_SEC;
-	} while ((need_continue || iterations < MIN_ITERATIONS));
+	} while ((need_continue || iterations < min_iterations));
 }
 
 static void start_gpu_threads(struct data *data)
-- 
2.25.1

