Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC2D10E2FE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 14:07:21 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 karolina.stolarek@intel.com, sai.gowtham.ch@intel.com
Date: Tue, 17 Oct 2023 19:35:29 +0530
Message-Id: <20231017140530.547-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20231017140530.547-1-sai.gowtham.ch@intel.com>
References: <20231017140530.547-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/intel_cmds_info: Add M_MATRIX in
 mem_copy as it is supported for PVC
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

Adding M_MATRIX copy type in MEM_COPY as it is supported for PVC

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_cmds_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index 1bf13fdc1..2e51ec081 100644
--- a/lib/intel_cmds_info.c
+++ b/lib/intel_cmds_info.c
@@ -84,7 +84,8 @@ static const struct blt_cmd_info
 
 static const struct blt_cmd_info
 		pvc_mem_copy = BLT_INFO(MEM_COPY,
-					BIT(M_LINEAR));
+					BIT(M_LINEAR) |
+					BIT(M_MATRIX));
 
 static const struct blt_cmd_info
 		pvc_mem_set = BLT_INFO(MEM_SET,
-- 
2.39.1
