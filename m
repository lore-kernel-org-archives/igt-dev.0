Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7428CCD1292
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 10:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C4610E2D5;
	Thu,  4 Apr 2024 10:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHP5pfTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD33510E2D5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 10:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712227380; x=1743763380;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tATQsDWy4OqwP1rbGZwov94pAPeMPN04edbuV83Ksng=;
 b=EHP5pfTCww4B7gfvTd5GvxDziwC3Vr5ElQTa86trFPO1hwf2arq1pq6l
 GfRqRn7aWSbLHnZW7vK5nq5tgMs0O2FCCGRUyvfHiJrDt7OHdekt1jOth
 p9C+PU98VL4vbvhlUa1EY6rcs07ojReFzLjE7h8qRftoXn6LzbyUrp33B
 IljqtGU6bMkpIIjcsCF5ci+TucG5pHEwA7/0R2M4LKDPZrOzthXpBa7M2
 YQvmtWmXaVXtFUPKr7l6UmFfD+LAd9C+ZZNcS25zgtSJ+rMcQ86g9CCeX
 BQ0EkfLRF3XkW8EMDHCKcImvOz/jvwx+ots4XrepHXuF9CZqM+21oerZe w==;
X-CSE-ConnectionGUID: jzteB//ETsyD6lHptDXYJw==
X-CSE-MsgGUID: vrJYCvcJS9Kgr5MMGoDJ6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7361128"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7361128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 03:42:57 -0700
X-CSE-ConnectionGUID: iHdhm2SNSXe2AHCRmjHxlA==
X-CSE-MsgGUID: exPB8yi4QfmuCxs5PIjQqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18718364"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 03:42:56 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_compute_preempt: Run it on only CCS
 engine
Date: Thu,  4 Apr 2024 12:29:01 +0200
Message-ID: <20240404102901.18803-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Expectation is that mid thread preemption works on CCS and
RCS is optional. In future we should check with engine capability
when that such uAPI is supported by the KMD.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_compute_preempt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index b8448ef91..78b19158d 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -49,8 +49,7 @@ igt_main
 
 	igt_subtest_with_dynamic("compute-preempt") {
 		xe_for_each_engine(xe, hwe) {
-			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &&
-			    hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER)
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
@@ -60,7 +59,6 @@ igt_main
 
 	igt_subtest_with_dynamic("compute-preempt-many") {
 		xe_for_each_engine(xe, hwe) {
-			/* TODO: This subtest fails on RCS engine */
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
 
@@ -74,8 +72,7 @@ igt_main
 
 	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
 		xe_for_each_engine(xe, hwe) {
-			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &&
-			    hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER)
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
-- 
2.42.0

