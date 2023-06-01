Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F98B10E21A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 08:10:38 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 ramadevi.gandi@intel.com, janga.rahul.kumar@intel.com
Date: Thu,  1 Jun 2023 13:40:56 +0530
Message-Id: <20230601081056.643382-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe_evict: Update Run Type
 documentation
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Change Run Type to BAT for subtests which are part of BAT testlist.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_evict.c | 47 +++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 7fef4efc..37933820 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -466,35 +466,20 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  *
  * arg[1]:
  *
- * @small:			small
- * @small-external:		small external
- * @small-multi-vm:		small multi VM
  * @large:			large
  * @large-external:		large external
  * @large-multi-vm:		large multi VM
- * @beng-small:			small bind engine
- * @beng-small-external:	small external bind engine
- * @beng-small-multi-vm:	small multi VM bind ending
  * @beng-large:			large bind engine
  * @beng-large-external:	large external bind engine
  * @beng-large-multi-vm:	large multi VM bind engine
  *
- * @small-cm:			small compute machine
- * @small-external-cm:		small external compute machine
- * @small-multi-vm-cm:		small multi VM compute machine
  * @large-cm:			large compute machine
  * @large-external-cm:		large external compute machine
  * @large-multi-vm-cm:		large multi VM compute machine
- * @beng-small-cm:		small bind engine compute machine
- * @beng-small-external-cm:	small external bind engine compute machine
- * @beng-small-multi-vm-cm:	small multi VM bind ending compute machine
  * @beng-large-cm:		large bind engine compute machine
  * @beng-large-external-cm:	large external bind engine compute machine
  * @beng-large-multi-vm-cm:	large multi VM bind engine compute machine
  *
- * @threads-small:		threads small
- * @cm-threads-small:		compute mode threads small
- * @mixed-threads-small:	mixed threads small
  * @mixed-many-threads-small:	mixed many threads small
  * @threads-large:		threads large
  * @cm-threads-large:		compute mode threads large
@@ -506,8 +491,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * 				mixed threads small multi vm
  * @threads-large-multi-vm:	threads large multi vm
  * @cm-threads-large-multi-vm:	compute mode threads large multi vm
- * @mixed-threads-large-multi-vm:
- *				mixed threads large multi vm
  * @beng-threads-small:		bind engine threads small
  * @beng-cm-threads-small:	bind engine compute mode threads small
  * @beng-mixed-threads-small:	bind engine mixed threads small
@@ -522,14 +505,40 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  *				bind engine threads small multi vm
  * @beng-cm-threads-small-multi-vm:
  *				bind engine compute mode threads small multi vm
- * @beng-mixed-threads-small-multi-vm:
- *				bind engine mixed threads small multi vm
  * @beng-threads-large-multi-vm:
  *				bind engine threads large multi vm
  * @beng-cm-threads-large-multi-vm:
  *				bind engine compute mode threads large multi vm
  * @beng-mixed-threads-large-multi-vm:
  *				bind engine mixed threads large multi vm
+ *
+ * SUBTEST: evict-%s
+ * Description:  %arg[1] evict test.
+ * Run type: BAT
+ *
+ * arg[1]:
+ *
+ * @small:			small
+ * @small-external:		small external
+ * @small-multi-vm:		small multi VM
+ * @beng-small:			small bind engine
+ * @beng-small-external:	small external bind engine
+ * @beng-small-multi-vm:	small multi VM bind ending
+ *
+ * @small-cm:			small compute machine
+ * @small-external-cm:		small external compute machine
+ * @small-multi-vm-cm:		small multi VM compute machine
+ * @beng-small-cm:		small bind engine compute machine
+ * @beng-small-external-cm:	small external bind engine compute machine
+ * @beng-small-multi-vm-cm:	small multi VM bind ending compute machine
+ *
+ * @threads-small:		threads small
+ * @cm-threads-small:		compute mode threads small
+ * @mixed-threads-small:	mixed threads small
+ * @mixed-threads-large-multi-vm:
+ * 				mixed threads large multi vm
+ * @beng-mixed-threads-small-multi-vm:
+ * 				bind engine mixed threads small multi vm
  */
 
 /*
-- 
2.25.1
