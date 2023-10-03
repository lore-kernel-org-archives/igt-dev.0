Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 11:10:46 +0200
Message-ID: <20231003091044.407965-12-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
References: <20231003091044.407965-11-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/9] lib/kunit: Fix handling of potential
 errors from F_GETFL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Function fcntl(..., F_GETFL, ...) that returns file status flags may also
return a negative error code.  Handle that error instead of blindly using
the returned value as flags.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d98e6c5f9e..05ff178b27 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -783,8 +783,8 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
 
 	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
 
-	flags = fcntl(tst->kmsg, F_GETFL, 0) & ~O_NONBLOCK;
-	igt_skip_on_f(fcntl(tst->kmsg, F_SETFL, flags) == -1,
+	igt_skip_on((flags = fcntl(tst->kmsg, F_GETFL, 0), flags < 0));
+	igt_skip_on_f(fcntl(tst->kmsg, F_SETFL, flags & ~O_NONBLOCK) == -1,
 		      "Could not set /dev/kmsg to blocking mode\n");
 
 	igt_skip_on(lseek(tst->kmsg, 0, SEEK_END) < 0);
-- 
2.42.0
