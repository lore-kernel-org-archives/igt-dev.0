Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667C6C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 10:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98D210E0F9;
	Fri,  2 Aug 2024 10:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJMGr0gU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F0E10E0F9
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2024 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722595887; x=1754131887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J2ug4c1840JecuXoqvgdG6jJJ4xv2jR6R1NJqk3moks=;
 b=FJMGr0gU1vvOcgRgOfogFAFEDspT/MB2Vi0Kud85UTNNWe8q8+YSzhUU
 acMT7iG+aE4/e9D+tS/1QZio42GZE69t3NGKH/VFZgJmnhUak1rfLx5fz
 cQDPYwrQo/KHGe28kd1ADpzi5mpSBlwCP0Vj2tkjvITOfj5qHJmNDBs1K
 NhyZo94MsCTzZeN4WEMnWlb1BoHZZPndcQjsSPZrD5dQpAev+Xp96UiMC
 Yaa1bahcUXiqR5XBG3yZu74hKwpBbJLwZUKP6WfNxSwgQ7Lgyp9b6iNuV
 oFmvvHk25ljZ0EjEJYBznWxjSDzkM2/QRqsRm3rJ2zfcmAFZAUZfGKMyz w==;
X-CSE-ConnectionGUID: vi61SKwKTZus+cPrAMucFg==
X-CSE-MsgGUID: Xc/oN0zrShaTkXDZgnXS+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38069308"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="38069308"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 03:51:27 -0700
X-CSE-ConnectionGUID: iOd2iVu3RtaRXOwPjYAsnQ==
X-CSE-MsgGUID: LRN4J+8GRPWmc4Z1diVHHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="56132424"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 03:51:26 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/drm_fdinfo: Fix type comparison warning
Date: Fri,  2 Aug 2024 12:51:20 +0200
Message-Id: <20240802105120.586924-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Resolve a compilation warning caused by comparing distinct pointer
types without a cast in the max macro usage.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Fixes: dd461382e7fa ("tests/intel: Apply igt.cocci transforms")
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

---
../lib/igt_aux.h:229:35: warning: comparison of distinct pointer types
lacks a cast
  229 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
      |                                   ^~
../lib/igt_aux.h:246:3: note: in expansion of macro ‘__typecheck’
  246 |  (__typecheck(x, y) && __no_side_effects(x, y))
      |   ^~~~~~~~~~~
../lib/igt_aux.h:249:24: note: in expansion of macro ‘__safe_cmp’
  249 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
../lib/igt_aux.h:254:19: note: in expansion of macro ‘__careful_cmp’
  254 | #define max(x, y) __careful_cmp(x, y, >, max)
      |                   ^~~~~~~~~~~~~
../tests/intel/drm_fdinfo.c:808:9: note: in expansion of macro ‘max’
  808 |  return max(count, 0U);

 tests/intel/drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/drm_fdinfo.c b/tests/intel/drm_fdinfo.c
index 160dc3d0a..43216a64e 100644
--- a/tests/intel/drm_fdinfo.c
+++ b/tests/intel/drm_fdinfo.c
@@ -805,7 +805,7 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
 		buf[count - 1] = 0;
 	close(fd);
 
-	return max(count, 0);
+	return max_t(typeof(count), count, 0);
 }
 
 /*
-- 
2.31.1

