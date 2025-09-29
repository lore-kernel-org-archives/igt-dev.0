Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6932ACAC5B5
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 14:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210BF10E433;
	Mon, 29 Sep 2025 14:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcTQEBcT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E1710E435
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759155931; x=1790691931;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WAuuemBXdcta8uXDa3+ycp82jxltKp1gaTvL/qePvu0=;
 b=WcTQEBcTOgS5N0LSpmw4Sp1lBYnw/B9KCy1e5KmFLQpZIzit2GiKA1Aw
 HiRgUyu72PiIlr73PRE2QfRqxoeIHweKskqY+IYvnYYuIc14efuQ0DSrb
 tqUfaNyfJq/32R+nZmayEWaOFj4z1pziWJgk0MuvnNtXwBXRLq4cH5yVA
 jgBMZ3Ky7vdyc/j3FDgTfIMfltl3idUzHp0bOulAW0u3itK20rMVlELee
 weOtDdMB0zF1EuImlKaStwGTnPoHxtfFdF1QC+1xSI7rRHsog/tg7TSC1
 c+kpAB/KaoyIhd/VNQhTAwsmu+N74r4jhDGqp6eOpK9xprA0aUucodIa7 w==;
X-CSE-ConnectionGUID: yPxzs80JSlmA87szg+VS4A==
X-CSE-MsgGUID: 3QXoveDSQ6qQwQOwoCy7/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="64022039"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="64022039"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 07:25:31 -0700
X-CSE-ConnectionGUID: 8M+zKmEvQDi0k7BTAcNYXg==
X-CSE-MsgGUID: 9BYBwKJ4TxG6jHPtAfxPGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178300639"
Received: from unknown (HELO localhost) ([172.28.180.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 07:25:30 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_mmap: Fix truncation of visible VRAM size
Date: Mon, 29 Sep 2025 16:25:23 +0200
Message-Id: <20250929142523.525117-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

xe_visible_vram_size() returns a 64-bit value. Storing it in 32-bit
truncated sizes above 4 GiB and led to false positives.

Fixes: c93b4e6ff2f3 ("tests/xe/mmap: sanity check small-bar")
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 9b87a9534..79c611f52 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -291,7 +291,7 @@ static void trap_sigbus(uint32_t *ptr)
 static void test_small_bar(int fd)
 {
 	size_t page_size = xe_get_default_alignment(fd);
-	uint32_t visible_size = xe_visible_vram_size(fd, 0);
+	uint64_t visible_size = xe_visible_vram_size(fd, 0);
 	uint32_t bo;
 	uint64_t mmo;
 	uint32_t *map;
-- 
2.31.1

