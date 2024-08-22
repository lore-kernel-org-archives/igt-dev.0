Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9878C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 12:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9431110E093;
	Thu, 22 Aug 2024 12:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgMrSsBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E43310E090
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724330892; x=1755866892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLgAGKhsHD4nVPC0e2u7I7sBr8R6UZrbgXQqeNNSY9U=;
 b=WgMrSsBszWex9RhO1ARvJKwmWhhF4UbdEXNDIt1xHDNtX+XchoXviChx
 zcZuf2MuDdrgtfSanpk1snlrg7EvxWzuqeI8gdaxx+bTE8vLU8PHf+eB2
 z6eYkFyA2Q7WAgLsnJEhtCR+vvNwmhj5/dGZFqy3eA/DYnBPwVIPPoH3p
 pYRbKxlbpSsRyhPUh5PlxLk1EC7fDu9SIYK57fJBE3mquLYRUCd5pElfD
 UjRoLFVM6VV/Bq+UcGuK3viqwma+fpXQgRy7u4a/upBrlGt0D373ByvD6
 NcVS6pemI93uEwu9QpgDyOzwEu85DqbdNdzi9EhGoLyg+2tHiiG7p8ndA Q==;
X-CSE-ConnectionGUID: Ug4juo55SlqEL/ZpWZqE1Q==
X-CSE-MsgGUID: iEIgqaSYTtKMYm09BpLL+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25636512"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="25636512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:48:11 -0700
X-CSE-ConnectionGUID: y0UnCL9NQl6ciVB7pL43NA==
X-CSE-MsgGUID: anDo6jjVQcm0l6U19CZj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="92231852"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.123])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:48:07 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Jann Horn <jannh@google.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v3 2/3] tests/intel/gem_mmap_offset: Introduce
 mmap-boundaries test
Date: Thu, 22 Aug 2024 14:47:43 +0200
Message-ID: <20240822124744.13054-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822124744.13054-1-krzysztof.niemiec@intel.com>
References: <20240822124744.13054-1-krzysztof.niemiec@intel.com>
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

Introduce the mmap-boundaries test, which checks if mmap() correctly
calculates memory boundaries during the mapping.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_mmap_offset.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index 80ac8dc01..e95c26e7f 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -55,6 +55,7 @@
  * SUBTEST: clear
  * SUBTEST: close-race
  * SUBTEST: isolation
+ * SUBTEST: mmap-boundaries
  * SUBTEST: oob-read
  * SUBTEST: open-flood
  * SUBTEST: partial-mmap
@@ -989,6 +990,32 @@ static void partial_remap(int i915, struct gem_memory_region *r)
 	gem_close(i915, handle);
 }
 
+/* This test's failure is detected by checking the dmesg. */
+static void test_mmap_boundaries(int i915, struct gem_memory_region *r)
+{
+	const uint64_t map_size = SZ_128M - SZ_512K;
+	uint32_t handle;
+
+	handle = gem_create_in_memory_region_list(i915, SZ_2G, 0, &r->ci, 1);
+	make_resident(i915, 0, handle);
+
+	for_each_mmap_offset_type(i915, t) {
+		uint8_t *map;
+
+		map = __mmap_offset(i915, handle, 0, map_size,
+				    PROT_READ | PROT_WRITE, t->type);
+		if (!map)
+			continue;
+
+		memset(map + map_size - SZ_1K, 0xab, SZ_1K);
+		for (uint64_t i = 0; i < SZ_1K; i++)
+			igt_assert_eq(map[map_size - SZ_1K + i], 0xab);
+
+		munmap(map, map_size);
+	}
+	gem_close(i915, handle);
+}
+
 static int mmap_gtt_version(int i915)
 {
 	int gtt_version = -1;
@@ -1082,6 +1109,14 @@ igt_main
 	igt_subtest_f("blt-coherency")
 		blt_coherency(i915);
 
+	igt_describe("Check for proper boundary calculation during mmap");
+	igt_subtest_with_dynamic("mmap-boundaries") {
+		for_each_memory_region(r, i915) {
+			igt_dynamic_f("%s", r->name)
+				test_mmap_boundaries(i915, r);
+		}
+	}
+
 	igt_fixture {
 		drm_close_driver(i915);
 	}
-- 
2.45.2

