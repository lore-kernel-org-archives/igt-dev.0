Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  6 Jul 2020 13:15:18 +0100
Message-Id: <20200706121520.967972-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/3] lib/i915: Report unknown device as
 the future
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Since we likely know all the old devices, an unknown device is most
likely a future device, so use -1u instead of 0 for its generation.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/intel_device_info.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 21f7a9570..dfa43f490 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -447,11 +447,11 @@ out:
  * Computes the Intel GFX generation for the given device id.
  *
  * Returns:
- * The GFX generation on successful lookup, 0 on failure.
+ * The GFX generation on successful lookup, -1u on failure.
  */
 unsigned intel_gen(uint16_t devid)
 {
-	return ffs(intel_get_device_info(devid)->gen);
+	return ffs(intel_get_device_info(devid)->gen) ?: -1u;
 }
 
 /**
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
