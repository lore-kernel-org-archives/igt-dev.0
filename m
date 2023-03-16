Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6502410E137
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 08:49:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Date: Thu, 16 Mar 2023 14:15:52 +0530
Message-Id: <20230316084552.2433948-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] lib/xe/xe_query: Fix the return type of xe_dev_id
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

Since we are truncating the rev_dev_id value to 16 bit, the return
type of xe_dev_id() must be uint16_t.

Fixes: cfec580a8
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/xe/xe_query.c | 2 +-
 lib/xe/xe_query.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index e27d14383..183523280 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -472,7 +472,7 @@ xe_dev_FN(xe_va_bits, va_bits, uint32_t);
  *
  * Returns Device id of xe device @fd.
  */
-xe_dev_FN(xe_dev_id, dev_id, uint32_t);
+xe_dev_FN(xe_dev_id, dev_id, uint16_t);
 
 igt_constructor
 {
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 13ac77d3d..beea9d094 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -88,7 +88,7 @@ bool xe_has_vram(int fd);
 uint64_t xe_vram_size(int fd, int gt);
 uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
-uint32_t xe_dev_id(int fd);
+uint16_t xe_dev_id(int fd);
 bool xe_supports_faults(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
 
-- 
2.39.1
