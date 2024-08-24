Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CB4C52D6F
	for <igt-dev@archiver.kernel.org>; Sat, 24 Aug 2024 21:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F93710E133;
	Sat, 24 Aug 2024 21:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hd0DWwXY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680F610E133
 for <igt-dev@lists.freedesktop.org>; Sat, 24 Aug 2024 21:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724534695; x=1756070695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ajsx7QoiV4Wbb8oPR1oKcAfY4xxe2zwMGuRJYt4jUAo=;
 b=hd0DWwXYkqbt25VQX0EgbJ+PlcOSkYor3vQifFtJK1eY7uQ7j93DTmxb
 dlFZFC4f2h+m1EGevP5FKI986K1XLpkBvizgWMZn1iniiJZ8FLxZt7sAk
 P3aWmTjNaRzFVeY+qegUJBfnL3zQwtmGcmDtGznjrzOYc6eoQYi5TOvhz
 qdydndNg9BIUmyYrg9BXLXkaSmWogos3S5Q5ddo5oAODRO4X47Qwyfbwt
 h1ZY0Wpzq/1KVBSHWMShndbueL044s8iYxmut0on46Y7fl4nBY9O7oV3n
 BdH+yySVqVrmohWKvQVLPT7byYDS3mALk1AO/0KKaic6oQXxPh4rN2gfG Q==;
X-CSE-ConnectionGUID: yPNBVlFVTLubfWJpcvMNHA==
X-CSE-MsgGUID: Q1A9X9IgTke+/Xj17/xpHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="22800126"
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; d="scan'208";a="22800126"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2024 14:24:55 -0700
X-CSE-ConnectionGUID: puBT6M67SKGrww1/9uEezg==
X-CSE-MsgGUID: 8n2M9w3BRXm3oenTEWxqWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,174,1719903600"; d="scan'208";a="99627023"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2024 14:24:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Extend mercy to the upper end
Date: Sat, 24 Aug 2024 14:24:37 -0700
Message-ID: <20240824212437.1167757-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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
	s1: read gpu time		|
	s1: read exec queues times	|		*
					|		*
	..				|		*
					|		*
	s2: read gpu time		|		*
	-> prempted					*
	...						*
	s2: read exec queues times			*

In this situation, using the line numbers:

	total_cyles == 6
	cycles == 8

In a more realistic situation, as reported in CI:

	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 1: cycles 29223333, total_cycles 5801623069
	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 2: cycles 38974256, total_cycles 5811276365
	(xe_drm_fdinfo:1072) DEBUG: rcs: percent: 101.000000

Extend the same mercy to the upper end as we did to the lower end.

Long term we may move some of these tests to just check cycles by using
a timed spinner and stop relying on the CPU sleep time and timing on the
fdinfo file read. See commit 01214d73c209 ("lib/xe_spin: fixed duration
xe_spin capability").

Also, this matches the tolerance applied on the i915 side in
tests/intel/drm_fdinfo.c:__assert_within_epsilon().

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

