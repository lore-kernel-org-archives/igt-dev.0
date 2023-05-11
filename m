Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AB510E5D8
 for <igt-dev@lists.freedesktop.org>; Thu, 11 May 2023 19:36:33 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 11 May 2023 21:36:17 +0200
Message-Id: <20230511193617.86458-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230511193617.86458-1-zbigniew.kempczynski@intel.com>
References: <20230511193617.86458-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/intel_batchbuffer: Limit intel-bb
 to 48-bit va
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On PVC Xe returns 57-bit va bit size. Unfortunately MI_* commands are
limited to 48-bit, so we should provide offsets which are within this
range and won't produce page faults like:

<4> [781.114047] xe 0000:8c:00.0: [drm]
	ASID: 1196
	VFID: 0
	PDATA: 0x00a3
	Faulted Address: 0x0000ffffffff0000
	FaultType: 0
	AccessType: 0
	FaultLevel: 4
	EngineClass: 3
	EngineInstance: 0
<4> [781.144174] xe 0000:8c:00.0: [drm] Fault response: Unsuccessful -22

Lets alter intel-bb with default (SIMPLE allocator, HIGH_TO_LOW strategy)
to omit 48-57 bit addressing by setting end of va range to 48-bit max.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 14ed8057e8..58ba28498a 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -937,7 +937,10 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 		ibb->alignment = xe_get_default_alignment(fd);
 		size = ALIGN(size, ibb->alignment);
 		ibb->handle = xe_bo_create_flags(fd, 0, size, vram_if_possible(fd, 0));
-		ibb->gtt_size = 1ull << xe_va_bits(fd);
+
+		/* Limit to 48-bit due to MI_* address limitation */
+		ibb->gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
+		end = ibb->gtt_size;
 
 		if (!ctx)
 			ctx = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
-- 
2.34.1
