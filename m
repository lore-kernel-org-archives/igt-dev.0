Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  6 Apr 2020 16:35:18 +0100
Message-Id: <20200406153518.1642031-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_hangman: Drop last reference to
 bygone 'i915_error_state'
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

The test is looking at sysfs/error so dumping the old
debugfs/i915_error_state looks quite silly. The only dilemma is whether
it is worth replacing with a line-by-line dump. I propose we make that a
future problem -- and leave it to whoever has to debug it next time.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_aux.c             | 1 -
 tests/i915/i915_hangman.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 1a5648444..ecab5d998 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -484,7 +484,6 @@ hang_detector_process(int fd, pid_t pid, dev_t rdev)
 
 			str = udev_device_get_property_value(dev, "ERROR");
 			if (str && atoi(str) == 1) {
-				igt_debugfs_dump(fd, "i915_error_state");
 				show_kernel_stack(pid);
 				kill(pid, SIGIO);
 			}
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 08b06217e..13cd62087 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -140,8 +140,6 @@ static void check_error_state(const char *expected_ring_name,
 	size_t line_size = 0;
 	bool found = false;
 
-	igt_debugfs_dump(device, "i915_error_state");
-
 	igt_assert(getline(&line, &line_size, file) != -1);
 	igt_require(strcasecmp(line, "No error state collected"));
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
