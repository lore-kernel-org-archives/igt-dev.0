Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4031910E38E
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 07:39:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 24 Apr 2023 09:38:59 +0200
Message-Id: <20230424073907.158701-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230424073907.158701-1-zbigniew.kempczynski@intel.com>
References: <20230424073907.158701-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 03/11] lib/xe_query: Remove commented out
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

Remove unnecessary commented out code.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_query.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index f49acb1d7b..cc6e7cefdc 100644
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
2.34.1
