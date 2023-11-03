Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5149610EA2A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:12 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:50 +0000
Message-Id: <20231103144359.7-56-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 55/64] fixup! drm-uapi/xe: Remove unused
 QUERY_CONFIG_MEM_REGION_COUNT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

---
 tests/intel/xe_query.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index f67b2db23..b595e978b 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1,4 +1,3 @@
-
 // SPDX-License-Identifier: MIT
 /*
  * Copyright © 2022 Intel Corporation
-- 
2.34.1
