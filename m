Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C601210E8F1
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:55:12 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:43 +0000
Message-Id: <20231109155410.7-31-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 30/57] lib: Fix 'otherwise' typos
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Found while trying to replace s/hwe/eci.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/drmtest.c         | 2 +-
 lib/intel_allocator.c | 2 +-
 lib/xe/xe_spin.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1da66c87..be44d65b9 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -407,7 +407,7 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
  *
  * Returns:
  * True if card according to the added filter was found,
- * false othwerwise.
+ * false otherwise.
  */
 static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
 {
diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index f0a9b7fb5..3d42388b8 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -1406,7 +1406,7 @@ bool intel_allocator_unreserve(uint64_t allocator_handle, uint32_t handle,
  * Note. @size and @offset have to match those used in reservation,
  * i.e. check with the same offset but even smaller size will fail.
  *
- * Returns: true if space is reserved, othwerise false.
+ * Returns: true if space is reserved, otherwise false.
  */
 bool intel_allocator_is_reserved(uint64_t allocator_handle,
 				 uint64_t size, uint64_t offset)
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 91bc6664d..f7fcb5a48 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -150,7 +150,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
  * xe_spin_started:
  * @spin: pointer to spinner mapped bo
  *
- * Returns: true if spinner is running, othwerwise false.
+ * Returns: true if spinner is running, otherwise false.
  */
 bool xe_spin_started(struct xe_spin *spin)
 {
-- 
2.34.1
