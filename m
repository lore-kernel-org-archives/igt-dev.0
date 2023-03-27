Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BF810E5D0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:41:24 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.3.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id F3A9C580D74
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 06:41:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pgn68-00AC0z-2z
 for igt-dev@lists.freedesktop.org; Mon, 27 Mar 2023 15:41:20 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:41:17 +0200
Message-Id: <20230327134119.2429388-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
References: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] lib/xe/xe_compute: use registers defs
 from intel_gpu_commands.h
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

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/xe/xe_compute.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
index 7259b888eb9e..9e50eba1b87b 100644
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
