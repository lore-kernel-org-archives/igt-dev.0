Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729C910E286
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 16:50:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Sep 2023 22:12:27 +0530
Message-Id: <20230905164230.1679263-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230905164230.1679263-1-bhanuprakash.modem@intel.com>
References: <20230905164230.1679263-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 2/5] tests/kms_vblank: Allow hang tests to run
 on XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As hang tests supports both i915 & XE, update the intel specific
checks to allow them to run on XE.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_vblank.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 0cc21bb5f..6753dc918 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -289,7 +289,10 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 		 igt_output_name(output));
 
 	if (!(data->flags & NOHANG)) {
-		ahnd = get_reloc_ahnd(fd, 0);
+		ahnd = is_i915_device(fd) ?
+			get_reloc_ahnd(fd, 0) :
+			intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
 		hang = igt_hang_ring_with_ahnd(fd, I915_EXEC_DEFAULT, ahnd);
 	}
 
-- 
2.40.0
