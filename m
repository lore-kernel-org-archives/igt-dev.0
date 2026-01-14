Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B589D39013
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 21:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EFC10E695;
	Wed, 14 Jan 2026 21:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6YAVTRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BE110E695
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 21:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768425211; x=1799961211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t/Ximvuj7JynloBH1rMLauhJyJCocHHY09zeLZ2MXp4=;
 b=E6YAVTRQBaqGdeiIDnpW7By8Y2FP9FBujZUNmU5AtwgWSuaIv30QW5OC
 kAIncOniD/G6mujuxS4K6nfO6hzFbB1W66l6okqj08QD4DyGYIwwfLCkj
 wjwlGo2HVTUbZiiXG/6shE53fRUqJnijAaiOiRoLHcVXRnyCqgiwh8QBv
 ltv8ifpqA0ZjKWi7cfWG6Gm44XWXLkrggE1fjO4e4QxAWjc2dYoMzw5HH
 dKcFankyXDKhvURHGw0xr7INqfSQVpadwsSaIFg/0XrYv/ZrYyDjTcIR0
 0UmnTnfsrRyYFUmxhVmBdMqM/SfDTlJzml/CiPz0lV/BeFoZiI1yxWi9w Q==;
X-CSE-ConnectionGUID: haNIZommQUCpKbthKb3wrw==
X-CSE-MsgGUID: wYWMhvOaT3+j9inAOG+5kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69817944"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="69817944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 13:13:31 -0800
X-CSE-ConnectionGUID: Y349cQkpQYyqbx6ZAMYIzA==
X-CSE-MsgGUID: uHaAWXD6Tv+fpmhTDqPmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="208945016"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.95])
 by orviesa003.jf.intel.com with ESMTP; 14 Jan 2026 13:13:31 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] tests/intel/xe_exec_compute_mode: Fix tmpfile open mode
Date: Wed, 14 Jan 2026 21:13:27 +0000
Message-Id: <20260114211327.285279-1-shuicheng.lin@intel.com>
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

replace the bogus 0x666 mode with 0666 when creating the tmpfile.
assert the tmpfile descriptor before writing to it.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index cf68319be..438ea163f 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -270,7 +270,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 			if (flags & RACE) {
 				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
-					      0x666);
+					      0666);
+				igt_assert_neq(map_fd, -1);
 				igt_assert_eq(write(map_fd, data, bo_size),
 				              bo_size);
 				data = mmap((void *)MAP_ADDRESS, bo_size,
-- 
2.34.1

