Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 20 Jul 2020 14:19:08 +0200
Message-Id: <20200720121908.28124-16-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
References: <20200720121908.28124-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATH i-g-t 15/15] tests/core_hotunplug: Explicitly
 ignore unused return values
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
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Some return values are not useful and can be ignored.  Wrap those cases
inside igt_ignore_warn(), not only to make sure compilers are happy but
also to clearly document our decisions.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 9bca967c1..9d4543185 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -227,7 +227,7 @@ static void set_filter_from_device(int fd)
 	char path[PATH_MAX + 1];
 
 	igt_assert(igt_sysfs_path(fd, path, PATH_MAX));
-	strncat(path, "/device", PATH_MAX - strlen(path));
+	igt_ignore_warn(strncat(path, "/device", PATH_MAX - strlen(path)));
 	igt_assert(realpath(path, dst));
 
 	igt_device_filter_free_all();
@@ -367,7 +367,7 @@ igt_main
 	igt_fixture {
 		post_healthckeck(&priv);
 
-		close(priv.fd.sysfs_bus);
-		close(priv.fd.sysfs_drv);
+		igt_ignore_warn(close(priv.fd.sysfs_bus));
+		igt_ignore_warn(close(priv.fd.sysfs_drv));
 	}
 }
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
