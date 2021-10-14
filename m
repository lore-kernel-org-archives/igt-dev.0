Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137D66E175
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 08:19:47 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 14 Oct 2021 10:19:15 +0200
Message-Id: <20211014081917.15977-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211014081917.15977-1-zbigniew.kempczynski@intel.com>
References: <20211014081917.15977-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/7] tests/i915_pm_rpm: Fix invalid alignment
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

In theory kernel requires vma to be power of two aligned, but in
practice inserting vma requires alignment to be at least GTT min
alignment - which is page size atm. Change this alignment from 64->0
to allow test to run on gens where alignment must be zero in execbuf
as it will be page size aligned anyway.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 732aea6eb..648b0cffb 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1234,7 +1234,7 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
 	relocs[0].write_domain = I915_GEM_DOMAIN_RENDER;
 
 	objs[0].handle = dst_handle;
-	objs[0].alignment = 64;
+	objs[0].alignment = 0;
 
 	objs[1].handle = batch_handle;
 	objs[1].relocation_count = !ahnd ? 1 : 0;
-- 
2.26.0
