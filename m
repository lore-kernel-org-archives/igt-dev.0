Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B771910E3AD
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 09:59:16 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t] lib/intel_cmds_info: Add MEM_COPY/SET support for
 Lunarlake
Date: Tue,  9 Jan 2024 15:26:02 +0530
Message-Id: <20240109095602.9620-1-sai.gowtham.ch@intel.com>
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

Enable MEM_COPY/SET instructions support for Lunarlake, which
allows to validate MEM_COPY/SET tests.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/intel_cmds_info.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index 56073bd6d..669d3e500 100644
--- a/lib/intel_cmds_info.c
+++ b/lib/intel_cmds_info.c
@@ -182,6 +182,8 @@ const struct intel_cmds_info xe2_cmds_info  = {
 	.blt_cmds = {
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
 		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
+		[MEM_COPY] = &pvc_mem_copy,
+		[MEM_SET] = &pvc_mem_set,
 	}
 };
 
-- 
2.39.1
