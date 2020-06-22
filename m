Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 22 Jun 2020 17:18:44 +0200
Message-Id: <20200622151845.4520-8-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
References: <20200622151845.4520-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t 7/8] tests/core_hotunplug: Add 'PRIME
 handle' variant
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Even if all device file descriptors are closed on device hotunplug,
PRIME exported objects may still exists, referenced by still open
dma-buf file handles.  Add a subtest that keeps such handle open on
device hotunplug.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 309d4efef..35a4fb13c 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -378,6 +378,35 @@ static void gem_hotunplug_lateclose(void)
 	healthcheck();
 }
 
+static void prime_hotunplug_lateclose(void)
+{
+	struct hotunplug priv;
+	uint32_t handle;
+	int dmabuf;
+
+	prepare_for_rescan(&priv);
+
+	igt_require_gem(priv.fd.drm);
+
+	local_debug("creating and PRIME-exporting a GEM object");
+	handle = gem_create(priv.fd.drm, 4096);
+	dmabuf = prime_handle_to_fd(priv.fd.drm, handle);
+
+	local_debug("closing the device");
+	close(priv.fd.drm);
+
+	local_debug("hot unplugging the device");
+	device_unplug(priv.fd.sysfs_dev);
+
+	local_debug("late closing the PRIME file handle");
+	close(dmabuf);
+
+	local_debug("recovering the device");
+	bus_rescan(priv.fd.sysfs_bus);
+
+	healthcheck();
+}
+
 /* Main */
 
 igt_main
@@ -464,4 +493,11 @@ igt_main
 
 	igt_fixture
 		igt_abort_on_f(failure, "%s\n", failure);
+
+	igt_describe("Check if a device with a still open PRIME-exported object can be cleanly unplugged, then released and recovered");
+	igt_subtest("prime-hotunplug-lateclose")
+		prime_hotunplug_lateclose();
+
+	igt_fixture
+		igt_abort_on_f(failure, "%s\n", failure);
 }
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
