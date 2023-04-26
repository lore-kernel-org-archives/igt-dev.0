Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF4210E965
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 11:52:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 17:16:43 +0530
Message-Id: <20230426114725.2244653-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 03/45] lib/xe_query: Remove commented out
 function prototype
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Remove unnecessary commented out code.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_query.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index f49acb1d7..cc6e7cefd 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -88,7 +88,6 @@ const char *xe_region_name(uint64_t region);
 uint32_t xe_min_page_size(int fd, uint64_t region);
 unsigned int xe_number_hw_engines(int fd);
 bool xe_has_vram(int fd);
-//uint64_t xe_vram_size(int fd);
 uint64_t xe_vram_size(int fd, int gt);
 uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
-- 
2.40.0
