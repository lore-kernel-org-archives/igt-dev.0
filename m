Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D01D10E2C1
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 20:07:19 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Oct 2022 20:07:06 +0000
Message-Id: <20221025200709.83314-27-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
References: <20221025200709.83314-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 26/29] lib/i915/perf: add helper function to get
 report reason
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

Useful to inspect reports.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/i915/perf.h |  3 +++
 lib/meson.build |  2 +-
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 2d309e57..fa291998 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -902,3 +902,57 @@ uint64_t intel_perf_read_record_timestamp_raw(const struct intel_perf *perf,
 
        return ts;
 }
+
+const char *intel_perf_read_report_reason(const struct intel_perf *perf,
+					  const struct drm_i915_perf_record_header *record)
+{
+	const uint32_t *report = (const uint32_t *) (record + 1);
+
+	/* Not really documented on Gfx7/7.5*/
+	if (perf->devinfo.graphics_ver < 8)
+		return "timer";
+
+	/* Gfx8-11 */
+	if (perf->devinfo.graphics_ver < 12) {
+		uint32_t reason = report[0] >> 19;
+		if (reason & (1u << 0))
+			return "timer";
+		if (reason & (1u << 1))
+			return "trigger1";
+		if (reason & (1u << 2))
+			return "trigger2";
+		if (reason & (1u << 3))
+			return "context-switch";
+		if (reason & (1u << 4))
+			return "go-transition";
+
+		if (perf->devinfo.graphics_ver >= 9 &&
+		    reason & (1u << 5))
+			return "clock-ratio-change";
+
+		return "unknown";
+	}
+
+	/* Gfx12 */
+	if (perf->devinfo.graphics_ver <= 12) {
+		uint32_t reason = report[0] >> 19;
+		if (reason & (1u << 0))
+			return "timer";
+		if (reason & (1u << 1))
+			return "trigger1";
+		if (reason & (1u << 2))
+			return "trigger2";
+		if (reason & (1u << 3))
+			return "context-switch";
+		if (reason & (1u << 4))
+			return "go-transition";
+		if (reason & (1u << 5))
+			return "clock-ratio-change";
+		if (reason & (1u << 6))
+			return "mmio-trigger";
+
+		return "unknown";
+	}
+
+	return "unknown";
+}
diff --git a/lib/i915/perf.h b/lib/i915/perf.h
index 8a2ef9e7..e6e60dc9 100644
--- a/lib/i915/perf.h
+++ b/lib/i915/perf.h
@@ -348,6 +348,9 @@ uint64_t intel_perf_read_record_timestamp_raw(const struct intel_perf *perf,
 					      const struct intel_perf_metric_set *metric_set,
 					      const struct drm_i915_perf_record_header *record);
 
+const char *intel_perf_read_report_reason(const struct intel_perf *perf,
+					  const struct drm_i915_perf_record_header *record);
+
 #ifdef __cplusplus
 };
 #endif
diff --git a/lib/meson.build b/lib/meson.build
index 6b5b9e04..4b6d2267 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -342,7 +342,7 @@ pkgconf.set('prefix', get_option('prefix'))
 pkgconf.set('exec_prefix', '${prefix}')
 pkgconf.set('libdir', '${prefix}/@0@'.format(get_option('libdir')))
 pkgconf.set('includedir', '${prefix}/@0@'.format(get_option('includedir')))
-pkgconf.set('i915_perf_version', '1.5.0')
+pkgconf.set('i915_perf_version', '1.5.1')
 
 configure_file(
   input : 'i915-perf.pc.in',
-- 
2.25.1
