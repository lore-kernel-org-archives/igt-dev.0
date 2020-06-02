Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837038997C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2020 10:19:25 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue,  2 Jun 2020 13:19:16 +0300
Message-Id: <20200602101916.30459-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Adapt to device-based DRM logging
 changes
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
Cc: Jani Nikula <jani.nikula@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

DRM logging in the kernel has switched to device based logging,
changing the pattern of logging from

[drm:function_name] Message

to

i915 0000:00:02.0: [drm] Message

Change the pattern we use with --piglit-style-dmesg to match the new
style logging, catching all warnings that contain [drm]. We're no
longer result-wise exactly piglit compatible but then again that ship
sailed long time ago with the change of introducing dmesg-level
parameter. Piglit compatibility result-wise is not a goal regardless.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---

For the record: This won't be merged without making sure cibuglog
filtering is up to date.

 runner/resultgen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 17147a8f..add4aad5 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -808,7 +808,7 @@ static const char igt_dmesg_whitelist[] =
 #undef _
 
 static const char igt_piglit_style_dmesg_blacklist[] =
-	"(\\[drm:|drm_|intel_|i915_)";
+	"(\\[drm:|drm_|intel_|i915_|\\[drm\\])";
 
 static bool init_regex_whitelist(struct settings* settings, GRegex **re)
 {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
