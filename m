Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4E0CA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0A410E6B4;
	Tue,  2 Sep 2025 12:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtqNGJeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83BA10E6AE
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 12:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816350; x=1788352350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4mCnt3YewJc2nCZaCWtHpLeyYZ293IlCgSeX1e4PJ7w=;
 b=FtqNGJeTJuY+XKTJ4OmOP9cFr1oZtk7BNShN3eKIZ++8lmUGmWW98Z6p
 dL5HX4n+hg+hGuIhX8cTA/RRRUS8a6uvGuy7mAthU15lORl20lm0q7A1C
 MLQXZzW55s1OreaROJFSGVd3NvssA9evznbyAnibsqMrY0U6i+jt/xks0
 xgPEuQExV5LV+9j47LaLCPDz59kEEk9TGwx01nfVyCfxFgwxW0PUWSuHE
 yXLK6QEeIPqlNFgmcUG6tKdqn1JK70IWa+an1Lekip22ELsAYxkvVNDNU
 2FYHKe2S/gWYfw1iAkwU/7TTrimYuJSwK3+iBYcp08NhptvyvTH6bv9iP g==;
X-CSE-ConnectionGUID: xbzIvfm2QFSWTvb3smnH8w==
X-CSE-MsgGUID: xyJ4iTIOSUKehnFK4cKrEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70517407"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70517407"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:30 -0700
X-CSE-ConnectionGUID: kgx3YNN0TNCZS3lw/LSUhQ==
X-CSE-MsgGUID: mgrAGqslRIGqMqsdQuxJOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171153274"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:29 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/7] lib/intel_allocator_simple: Introduce alloc_debug
 and alloc_info
Date: Tue,  2 Sep 2025 14:31:57 +0200
Message-Id: <20250902123203.4907-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
References: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce alloc_debug and alloc_info from intel_allocator.c and use it
in intel_allocator_simple_is_empty. This allows for deadlock avoidance
in xe_eudebug_online@set-breakpoint-sigint-debugger caused by sporadic
timing of SIGINT during igt_vlog.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/intel_allocator_simple.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/lib/intel_allocator_simple.c b/lib/intel_allocator_simple.c
index 25b92db11..820ce042a 100644
--- a/lib/intel_allocator_simple.c
+++ b/lib/intel_allocator_simple.c
@@ -11,6 +11,13 @@
 #include "intel_bufops.h"
 #include "igt_map.h"
 
+#ifdef ALLOCDBG
+#define alloc_info igt_info
+#define alloc_debug igt_debug
+#else
+#define alloc_info(...) {}
+#define alloc_debug(...) {}
+#endif
 
 /* Avoid compilation warning */
 struct intel_allocator *
@@ -610,10 +617,10 @@ static bool intel_allocator_simple_is_empty(struct intel_allocator *ial)
 {
 	struct intel_allocator_simple *ials = ial->priv;
 
-	igt_debug("<ial: %p, fd: %d> objects: %" PRId64
-		  ", reserved_areas: %" PRId64 "\n",
-		  ial, ial->fd,
-		  ials->allocated_objects, ials->reserved_areas);
+	alloc_debug("<ial: %p, fd: %d> objects: %" PRId64
+		    ", reserved_areas: %" PRId64 "\n",
+		    ial, ial->fd,
+		    ials->allocated_objects, ials->reserved_areas);
 
 	return !ials->allocated_objects && !ials->reserved_areas;
 }
-- 
2.34.1

