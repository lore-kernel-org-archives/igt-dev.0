Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7C89119
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Dec 2020 03:20:15 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 28 Dec 2020 05:19:37 +0200
Message-Id: <20201228031940.178954-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/i915/perf: fix intel_perf_devinfo
 gen field
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
List-ID: <igt-dev@lists.freedesktop.org>

Inadvertently left this field uninitialized (or rather at the wrong 0
value).

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: 53f8f541caae20 ("lib: Add i915_perf library")
---
 lib/i915/perf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 53c0a9dcc..ef0f0b437 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -168,6 +168,7 @@ intel_perf_for_devinfo(uint32_t device_id,
 	 * 2x6 does not have 2 samplers).
 	 */
 	perf->devinfo.devid = device_id;
+	perf->devinfo.gen = devinfo->gen;
 	perf->devinfo.revision = revision;
 	perf->devinfo.timestamp_frequency = timestamp_frequency;
 	perf->devinfo.gt_min_freq = gt_min_freq;
-- 
2.30.0.rc2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
