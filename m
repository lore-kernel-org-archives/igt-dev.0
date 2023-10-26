Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CE110E82D
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 15:50:45 +0000 (UTC)
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 26 Oct 2023 17:50:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231026-gtt_size_fix-v1-1-882d0e0022ec@intel.com>
References: <20231026-gtt_size_fix-v1-0-882d0e0022ec@intel.com>
In-Reply-To: <20231026-gtt_size_fix-v1-0-882d0e0022ec@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [igt-dev] [PATCH 1/2] lib/igt_aux: fix roundup_power_of_two
 implementation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For arguments greater than (1<<31) 64bit value must
be shifted, otherwise the result is incorrect.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/igt_aux.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index fb76b031318..4d887045af7 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -329,7 +329,7 @@ void pipewire_pulse_stop_reserve(void);
 						64 - __builtin_clzll(x), \
 						32 - __builtin_clz(x)) : 0)
 
-#define roundup_power_of_two(x) ((x) != 0 ? 1 << igt_fls((x) - 1) : 0)
+#define roundup_power_of_two(x) ((x) != 0 ? 1ULL << igt_fls((x) - 1) : 0)
 
 #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 

-- 
2.34.1
