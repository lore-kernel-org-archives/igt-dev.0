Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F2A10E28F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 06:10:47 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com
Date: Tue, 27 Jun 2023 11:41:39 +0530
Message-Id: <20230627061139.1989685-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/xe/xe_spin: Add support to create
 non-preemptive spin batch
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

Add support to create non-preemptive batch during spinner creation.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 lib/xe/xe_spin.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 9f511e14..529b7684 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -131,7 +131,11 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
 	xe_vm_bind_sync(fd, spin->vm, spin->handle, 0, addr, bo_size);
 
-	xe_spin_init(xe_spin, addr, true);
+	if (!(opt->flags & IGT_SPIN_NO_PREEMPTION))
+		xe_spin_init(xe_spin, addr, true);
+	else
+		xe_spin_init(xe_spin, addr, false);
+
 	exec.engine_id = spin->engine;
 	exec.address = addr;
 	sync.handle = spin->syncobj;
-- 
2.25.1
