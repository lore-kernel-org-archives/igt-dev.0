Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Tue,  1 Feb 2022 15:19:46 +0000
Message-Id: <20220201151946.258360-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel_gpu_top: Improve error message when
 insufficient privilege
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Print out end user friendly help text when the running user has
insufficient privilege for accessing system wide performance counters.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Issue: https://gitlab.freedesktop.org/drm/intel/-/issues/5018
---
 tools/intel_gpu_top.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 81c724d1fe1c..0404a5881b40 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1761,6 +1761,15 @@ int main(int argc, char **argv)
 	if (ret) {
 		fprintf(stderr,
 			"Failed to initialize PMU! (%s)\n", strerror(errno));
+		if (errno == EACCES && geteuid())
+			fprintf(stderr,
+"\n"
+"When running as a normal user CAP_PERFMON is required to access performance\n"
+"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
+"distribution vendor for assistance.\n"
+"\n"
+"More information can be found at 'Perf events and tool security' document:\n"
+"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
 		ret = EXIT_FAILURE;
 		goto err;
 	}
-- 
2.32.0
