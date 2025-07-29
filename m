Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD00DC83F26
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 11:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6EF10E611;
	Tue, 29 Jul 2025 11:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioENqvQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B80810E1F3
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jul 2025 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753788341; x=1785324341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eANkvA0fYa62scUtnBT+kYRKSyjcXKuxiI8sdxRC8w4=;
 b=ioENqvQV24x9zUdNrebJ8kgsjqCZ8GiX2qftbhXU9EuEPmbEWucTlnrd
 B4/GSLMMB7VOS74RTEeQ+JPsHhvs52xOvc3HRl1nqYqZCLqFbhaXk79QH
 ytLh3WR6WHZHnDrloB3B6IQjqCjgpKl4kVkim2ptdyBBa9ZxLOx+N5pr0
 7+Ek0Z1ROsREM+OsCwFjuRlYmiHW6zvipk9iPRazBJk1zpgDPdruT1nF/
 Ozuc3aigaj4az6CYc0kogAC3T+VWIKMoPXlTikCwUtREChBU77zUDXEd+
 JbGpFSgHsZUEJ3DUkogVJXV2I44VWblT65bK4MVyPqTtp9mbpIOCFHbIG Q==;
X-CSE-ConnectionGUID: NvQyZMMDS8mDGoUToF/dDw==
X-CSE-MsgGUID: nd2DD/NNQeKdxGZEPza4+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55260925"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="55260925"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:25:41 -0700
X-CSE-ConnectionGUID: PQn5ek/mThSUATP6pXs/AA==
X-CSE-MsgGUID: oQhd2UG8SLi8X4HvpfSx9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162246523"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 04:25:40 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: soham.purkait@intel.com, riana.tauro@intel.com, lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2] tools/gputop/xe_gputop: Keep engine activity
 percentage between 0 and 100
Date: Tue, 29 Jul 2025 16:48:43 +0530
Message-Id: <20250729111843.3209315-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

Engine activity percentage within the valid range of 0 to 100 prevents
out-of-bound values that could lead to undefined behavior during runtime.
One typical scenario could be during a GT reset, where the engine activity
percentage might spike to a very high value, potentially leading to a
segmentation fault while setting the progress bar.

v1:
 - Use clamp for clearer and shorter percentage bounding (Lucas)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tools/gputop/xe_gputop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index 9757369a8..bb2caa6ea 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -281,7 +281,8 @@ static double pmu_active_percentage(struct xe_engine *engine)
 	double percentage;
 
 	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
-	return percentage;
+
+	return clamp(percentage, 0., 100.);
 }
 
 static int
-- 
2.34.1

