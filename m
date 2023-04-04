Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3455A10E144
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 07:38:41 +0000 (UTC)
Received: from linux.intel.com (daanders-mobl1.ger.corp.intel.com
 [10.252.28.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DCB38580D77
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 00:38:38 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pjbFU-000rTQ-2L
 for igt-dev@lists.freedesktop.org; Tue, 04 Apr 2023 09:38:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 09:38:34 +0200
Message-Id: <20230404073835.205323-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230404073835.205323-1-mauro.chehab@linux.intel.com>
References: <20230404073835.205323-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/4] lib/xe/xe_compute: use registers
 defs from intel_gpu_commands.h
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

There are some register definitions that are already defined inside
intel_gpu_commands.h with a different concept.

Change the code to re-use the definitions there.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/xe/xe_compute.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
index fb11b8bc7770..2a3686a1bee6 100644
--- a/lib/xe/xe_compute.c
+++ b/lib/xe/xe_compute.c
@@ -33,15 +33,6 @@
 #define OFFSET_INDIRECT_DATA_START	0xFFFDF000
 #define OFFSET_KERNEL			0xFFFEF000
 
-#undef MEDIA_VFE_STATE
-#define MEDIA_VFE_STATE			0x70000007
-#undef STATE_BASE_ADDRESS
-#define STATE_BASE_ADDRESS		0x61010014
-#undef MEDIA_INTERFACE_DESCRIPTOR_LOAD
-#define MEDIA_INTERFACE_DESCRIPTOR_LOAD	0x70020002
-#undef GPGPU_WALKER
-#define GPGPU_WALKER			0x7105000d
-
 struct bo_dict_entry {
 	uint64_t addr;
 	uint32_t size;
@@ -301,7 +292,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = MEDIA_VFE_STATE;
+	addr_bo_buffer_batch[b++] = MEDIA_VFE_STATE | (9 - 2);
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00A70100;
@@ -316,7 +307,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS;
+	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | (16 - 2);
 	addr_bo_buffer_batch[b++] = 0x00000001;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00040000;
@@ -352,11 +343,11 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = MEDIA_STATE_FLUSH;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = MEDIA_INTERFACE_DESCRIPTOR_LOAD;
+	addr_bo_buffer_batch[b++] = MEDIA_INTERFACE_DESCRIPTOR_LOAD | (4 - 2);
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000020;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = GPGPU_WALKER;
+	addr_bo_buffer_batch[b++] = GPGPU_WALKER | 13;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000c80;
 	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
-- 
2.39.2
