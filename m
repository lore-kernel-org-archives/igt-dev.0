Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD30C54734
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AF910E1C7;
	Tue, 27 Aug 2024 05:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KY0upRcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2724C10E03D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737374; x=1756273374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LQQSXTNeVnmCNb/Mc0XqWMaXY8/d7Fvid+kizd6bauU=;
 b=KY0upRcuc0CTlngTDPCYvSajxxOJ1PdyGrA+d2NMD4Nfhm3meXqsy0r+
 LAGXbRL0oZ0UOlDBPE/mZrCX+KkPvXbqLrUWi64jIvLUiaUFr1HI3UjH+
 5SBUriNkOVexd0sNZCSt6PFRObiNM0wV7LxswLASmXb9FwQc6G7/S4Bag
 qzRyI3ipof6E7EH/XJ9CNwA/hCvWF1Ae5z7nZ7g/ijyYEYtHpiRO7iDyU
 M1cfxIfgkJmlM3Pky7cU8vvXBXBoNQHxwjMeafei+L7N7aQO81nAHXm7B
 2H7NUwm1fnTudBptnny3Qp5Drs01kR9g+qYIcHwQiJzC7b2Vwqu9+Ze7E Q==;
X-CSE-ConnectionGUID: x0qLU1X2R9yQW+h0Ru8rKw==
X-CSE-MsgGUID: qWyG85t5QSytrnzR5UBpqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23372148"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23372148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
X-CSE-ConnectionGUID: LTrxM10kRqGP4dYxB9vBWQ==
X-CSE-MsgGUID: GGnfx5DwQVGugr9ZF4thFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67556973"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 01/10] tests/intel/xe_drm_fdinfo: Extend mercy to the
 upper end
Date: Mon, 26 Aug 2024 22:42:13 -0700
Message-ID: <20240827054223.1671414-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827054223.1671414-1-lucas.demarchi@intel.com>
References: <20240827054223.1671414-1-lucas.demarchi@intel.com>
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

When we are processing the fdinfo of each client, the gpu time is read
first, and then later all the exec queues are accumulated. It's thus
possible that the total gpu time is smaller than the time reported in
the exec queues. A preemption in the middle of second sample would
exaggerate the problem:
				  total_cycles	      cycles
	s1: read exec queues times			*
	s1: read gpu time		|		*
	.				|		*
	.				|		*
	.				|		*
	-> xe_spin_end()		|		*
	s2: read exec queues times	|
	s2: read gpu time		|

There's nothing guaranteeing and atomic read between the gpu time and
exec_queue time in either s1 or s2. Due to the call to xe_spin_end(),
in which exec_queue tick stops and gpu tick continues, it's much more
likely delta_total_cycles > cycles. However, if there was any additional
delay between the readout in s1, it could also go the other way.

In a more realistic situation, as reported in CI:

	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 1: cycles 29223333, total_cycles 5801623069
	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 2: cycles 38974256, total_cycles 5811276365
	(xe_drm_fdinfo:1072) DEBUG: rcs: percent: 101.000000

Extend the same mercy to the upper end as we did to the lower end.
This also matches the tolerance applied on the i915 side in
tests/intel/drm_fdinfo.c:__assert_within_epsilon().

v2: Fix the commit message since the problem is actually on sample1, not
    sample2

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 4696c6495..e3a99a2dc 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -484,7 +484,7 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
 
 	if (flags & TEST_BUSY)
-		igt_assert(percent >= 95 && percent <= 100);
+		igt_assert(percent >= 95 && percent <= 105);
 	else
 		igt_assert(!percent);
 }
-- 
2.43.0

