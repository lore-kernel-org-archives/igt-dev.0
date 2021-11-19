Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri, 19 Nov 2021 12:59:43 +0000
Message-Id: <20211119125945.55056-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] igt/drm_read: Fix build warning
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
Cc: Intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In function ‘read’,
    inlined from ‘test_invalid_buffer’ at ../../home/tursulin/wc/intel-gpu-tools/tests/drm_read.c:113:2,
    inlined from ‘__igt_unique____real_main258’ at ../../home/tursulin/wc/intel-gpu-tools/tests/drm_read.c:297:3:
/usr/include/x86_64-linux-gnu/bits/unistd.h:47:10: warning: ‘__read_alias’ writing 4096 bytes into a region of size 0 overflows the destination [-Wstringop-overflow=]
   47 |   return __read_alias (__fd, __buf, __nbytes);
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/drm_read.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index 4a966a23b550..d422220d3c4a 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -289,8 +289,16 @@ igt_main
 		igt_require(kmstest_get_vblank(fd, pipe, 0));
 	}
 
+/*
+ * Has to be here and not in (or around) test_invalid_buffer() to work around
+ * a gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98512.
+ */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wstringop-overflow"
+#pragma GCC diagnostic ignored "-Wstringop-overflow="
 	igt_subtest("invalid-buffer")
 		test_invalid_buffer(fd);
+#pragma GCC diagnostic pop
 
 	igt_subtest("fault-buffer")
 		test_fault_buffer(fd, pipe);
-- 
2.32.0
