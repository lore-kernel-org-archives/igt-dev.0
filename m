Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061D10E57D
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 10:14:54 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 12:11:20 +0200
Message-Id: <20230104101120.36303-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: Also consider TAINT_MACHINE_CHECK as
 abortable taint
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v2: Rebase

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/37
---


Old patch from 2019. Discussion on v1 can be found at
https://patchwork.freedesktop.org/patch/308726/?series=61651&rev=1

Sending for up-to-date CI results.

 lib/igt_taints.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_taints.c b/lib/igt_taints.c
index 6f5b827c..6b36d11c 100644
--- a/lib/igt_taints.c
+++ b/lib/igt_taints.c
@@ -13,6 +13,7 @@ static const struct {
 	int bad;
 	const char *explanation;
 } abort_taints[] = {
+  { 4, 1, "TAINT_MACHINE_CHECK: Processor reported a Machine Check Exception."},
   { 5, 1, "TAINT_BAD_PAGE: Bad page reference or an unexpected page flags." },
   { 7, 1, "TAINT_DIE: Kernel has died - BUG/OOPS." },
   { 9, 1, "TAINT_WARN: WARN_ON has happened." },
-- 
2.30.2
