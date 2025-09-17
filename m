Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C445CA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 08:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5197310E43A;
	Wed, 17 Sep 2025 08:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lt/+rHk9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A07010E183
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758099441; x=1789635441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oNyozQbw/x0L18ISDFJxdgn02VmaxPASM/3Jv4k4zHY=;
 b=lt/+rHk91Ah1QdU9GmapOfJMEzaONfoEreXiOuHqusKIzxvDeUTwN2G/
 i0JOdPgy6JRVa1L7kksT7d74liCdcAPQijwC/lTna0uJX2sQeQebVZv0J
 74MkIsQVPFvWTs3JFJtgqDFFe3UDmVFL9cx0IPPiyCaItqvyz6uvT1R6o
 9nIS895TYAj+q+iGlLEEAfOh6Yp0mJA99gJtt613qmPiUcCaq3/9UFGwG
 4Q/LhQjykPT34+AwPqE7+NCiRLjffXEYLPdpFvb+ecVmQhs9QExDapNoD
 6D59iCz9YPU8iFiDSS4LYwLkIaU2Q+Nutr52nTpslXGkgpLaaHtFMGy2O w==;
X-CSE-ConnectionGUID: SdRZU6ksQBKiDDTmrWskrA==
X-CSE-MsgGUID: ipDLc5S8RjGQVk7AKxUcRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64216089"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="64216089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:57:20 -0700
X-CSE-ConnectionGUID: 0CgEM5GET7KRTfVlo9k6fA==
X-CSE-MsgGUID: dQy/XYQFReu+U7uGo7hJGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="179471255"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 01:57:19 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/kms_pipe_stress: lower minimum iterations in simulation
Date: Wed, 17 Sep 2025 14:34:11 +0530
Message-Id: <20250917090411.376984-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

v2: embed conditional logic directly into macro def (Ramanaidu)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_pipe_stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 7551a5e9c..193f59d8d 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -610,7 +610,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 }
 
 #define MIN_DURATION_SEC 5.0
-#define MIN_ITERATIONS 20
+#define MIN_ITERATIONS (igt_run_in_simulation() ? 5 : 20)
 
 static void stress(struct data *data)
 {
-- 
2.25.1

