Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FAE10E0BE
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Dec 2023 12:23:12 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 1/2] include/intel_gpu_commands: Add persistent batch
 buffer instruction
Date: Wed, 27 Dec 2023 17:50:37 +0530
Message-Id: <20231227122038.11595-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20231227122038.11595-1-sai.gowtham.ch@intel.com>
References: <20231227122038.11595-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add persistent batct buffer instruction.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 include/intel_gpu_commands.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
index e10507fa7..5a98fb63f 100644
--- a/include/intel_gpu_commands.h
+++ b/include/intel_gpu_commands.h
@@ -134,6 +134,7 @@
 #define MI_STORE_DWORD_IMM	MI_INSTR(0x20, 1)
 #define MI_STORE_DWORD_IMM_GEN4	MI_INSTR(0x20, 2)
 #define MI_STORE_QWORD_IMM_GEN8 (MI_INSTR(0x20, 3) | REG_BIT(21))
+#define MI_PRT_BATCH_BUFFER_START (0x39 << 23)
 #define   MI_MEM_VIRTUAL	(1 << 22) /* 945,g33,965 */
 #define   MI_USE_GGTT		(1 << 22) /* g4x+ */
 #define MI_STORE_DWORD_INDEX	MI_INSTR(0x21, 1)
-- 
2.39.1
