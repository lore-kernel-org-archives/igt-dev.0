Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C5FD41C14
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 10:12:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A6C10E7D0;
	Thu, 11 Dec 2025 10:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OE4Bs68Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E740010E7D0
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765447961; x=1796983961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=scv4qVjWlnIBnIvABcIm5vR88VFH1F5Q+NKxJF3nYxc=;
 b=OE4Bs68QhvtZMPXdJDlnGgZQlPKQEca+LcM+NZIpC9CRo1Sil3ab8EXC
 EtwyMZT5kCOZMdj+Gr3ysja8DQ5/Uh7xeS8zsHMylhI3HdyBdEFzo596F
 YmCmESLWgZJzP2mZYs2KIKek1GXnfyFIt2rnx4hXd/tPF16/IUp3jCT6P
 cD03lR7dSN4zxBPDNxvTYO/11P7UzN6hhvoddaFEkFhAitUmuioD4YILU
 Xxrb2icLCH36P/SergTl9V099IhLn1x8P57RaGdI3NH8x/8n2fC31C0/F
 ZX0nt+Brz/sqhk0cOlhTKs4X3QviWqzp1eICBaomhECXMQsiP0SzDcahT A==;
X-CSE-ConnectionGUID: q9iGCkF3TBeJbGWWK2foIQ==
X-CSE-MsgGUID: BU7XnRavSqSjTnYsDZdx2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="70009645"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="70009645"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 02:12:40 -0800
X-CSE-ConnectionGUID: AGJXZ9tQSHSQ0nCLYHJjeQ==
X-CSE-MsgGUID: LvqMipp/TYyPSNPCKQLudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196662737"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa006.fm.intel.com with ESMTP; 11 Dec 2025 02:12:38 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t] lib/intel_allocator: Fix Tile-4 format tests crash by
 initializing maps before SysV IPC check
Date: Thu, 11 Dec 2025 15:22:33 +0530
Message-Id: <20251211095233.1172089-1-s.sebinraj@intel.com>
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

The allocator was incorrectly gating essential map initialization behind
the SysV IPC availability check. This caused crashes in tests using tiled
formats like Tile-4 on systems where sysvipc is not accessible.

Root Cause:
-----------
Tile-4 (and other tiled formats) require GPU blitter operations to convert
between tiled and linear layouts for Cairo drawing. This conversion path
needs the allocator to provide GPU virtual addresses for blitter commands.

Linear formats bypass this entirely - Cairo can write directly to CPU-mapped
memory without GPU operations, so the allocator is never accessed and the
bug remains hidden.

intel_allocator_init() checked system_supports_sysvipc() and returned
early if the check failed, leaving ctx_map and vm_map uninitialized
when Tile-4 tests triggered blitter operations, the allocator
tried to search these NULL maps causing SIGSEGV.

Call stack at crash:
  - igt_get_cairo_surface(tile4_fb)
    - blitcopy(tile4 -> linear)
      - intel_allocator_open()
       - allocator_find()
          - igt_map_search(NULL ctx_map) -> SIGSEGV

Solution:
---------
Initialize allocator maps (handles, ctx_map, vm_map, ahnd_map)
unconditionally as they are required for single-process GPU operations,
not just multi-process IPC scenarios.

Impact:
- Tile-4 and tiled format tests

Tested with kms_plane_lowres --run-subtest tiling-4 on PTL/ADL.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 lib/intel_allocator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index fddd0f3b3..55728057a 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -1703,12 +1703,6 @@ void intel_allocator_init(void)
 	__free_maps(vm_map, false);
 	__free_ahnd_map();
 
-	if (!system_supports_sysvipc()) {
-		alloc_debug("System doesn't support SysV IPC\n");
-		channel = NULL;
-		return;
-	}
-
 	atomic_init(&next_handle, 1);
 	handles = igt_map_create(hash_handles, equal_handles);
 	ctx_map = igt_map_create(hash_instance, equal_ctx);
@@ -1717,6 +1711,12 @@ void intel_allocator_init(void)
 	ahnd_map = igt_map_create(igt_map_hash_64, igt_map_equal_64);
 	igt_assert(handles && ctx_map && vm_map && ahnd_map);
 
+	if (!system_supports_sysvipc()) {
+		alloc_debug("System doesn't support SysV IPC\n");
+		channel = NULL;
+		return;
+	}
+
 	channel = intel_allocator_get_msgchannel(CHANNEL_SYSVIPC_MSGQUEUE);
 }
 
-- 
2.43.0

