Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4C1C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 14:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF0D10E213;
	Mon,  5 Aug 2024 14:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9dv8Kdi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A35710E213
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 14:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722868650; x=1754404650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TrGCq86yFkTyeFOvj+uRCSZSMNnGobEQDBZv0cj1kgo=;
 b=R9dv8KdiGqnfwI9lEZu2VOyw6zG861xgTnkzCwdXNUi7jYemJVtA+Rrt
 byk1e3AhdO4M0dgTBHZ6LHUuCKwxRqgpYoNNc6ji16ygHsXhdFi9gMUp0
 TvEvsFLWBrLXX1xopsk+0xoMXF9VnmXrueZ3hv+gA7HBh5D5I68Xn8n2G
 8KmkdlAJqik2ID2tgev3bhGIzapTRqTsV4wmO9AZqsNXkWqBnnZ4HJMLk
 XWwDDckinYBieKFM7a4slmBGKvac4D9cN+Pi0whp0QmZ6cXaYGue8CDO7
 H2vVTWsbD+uSbKehLYBK3bQ1+VOlsDCtPG5NJEMjl0t7/vOdyrcH+B+K7 w==;
X-CSE-ConnectionGUID: ifP/dXXGR4iBbBXYlFL1jA==
X-CSE-MsgGUID: J259n5HKRuqv4NWzIo3ymA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24702273"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24702273"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:30 -0700
X-CSE-ConnectionGUID: 3nuD8MUwTkGUgnsmEBT/VA==
X-CSE-MsgGUID: MyBBUvuZRYeB0Up5ZkdyeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56754928"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:29 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t v2 2/8] tests/core_hotunplug: set known chipset before
 tests
Date: Mon,  5 Aug 2024 16:37:05 +0200
Message-ID: <20240805143713.76034-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
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

Set chipset for all known drivers, not only for i915.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/core_hotunplug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 145fe141e..617332b0f 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -685,9 +685,9 @@ igt_main
 		fd_drm = __drm_open_driver(DRIVER_ANY);
 		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
 
-		if (is_i915_device(fd_drm)) {
-			priv.chipset = DRIVER_INTEL;
+		priv.chipset = drm_get_chipset(fd_drm);
 
+		if (is_i915_device(fd_drm)) {
 			gem_quiescent_gpu(fd_drm);
 			igt_require_gem(fd_drm);
 
-- 
2.43.0

