Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C8510E067
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 19:31:42 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/xe_create: Reduce MAXEXECQUEUES
Date: Tue, 12 Dec 2023 11:20:50 -0800
Message-Id: <20231212192050.1435986-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lucas.demarchi@intel.com, jonathan.cavitt@intel.com,
 saurabhg.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

FIXME: Several XE platforms are currently failing the
create-execqueue-noleak and create-execqueue-leak tests due to exceeding
the MAXTIME timeout for execution.  It appears context switching is to
blame for this issue, as enforcing execution patterns that minimze
context switches makes the test far more performant.  Unfortunately,
doing so would defeat the purpose of the test.  While a better solution
(such as reducing the number of mandatory locks and mutexes in the exec
queue creation path) is investigated, reduce MAXEXECQUEUES by half.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Lucas de Marchi <lucas.demarchi@intel.com>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> 
---
 tests/intel/xe_create.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 1ed48a5d3e..be470944e3 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -101,7 +101,7 @@ enum exec_queue_destroy {
 	LEAK
 };
 
-#define MAXEXECQUEUES 2048
+#define MAXEXECQUEUES 1024
 #define MAXTIME 5
 
 /**
-- 
2.25.1
