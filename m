Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859E5890F4
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Dec 2020 03:20:15 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 28 Dec 2020 05:19:38 +0200
Message-Id: <20201228031940.178954-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20201228031940.178954-1-lionel.g.landwerlin@intel.com>
References: <20201228031940.178954-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/i915/perf: fill up device name
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

Forgot to initialize this field.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 lib/i915/perf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index ef0f0b437..f30833787 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -174,6 +174,11 @@ intel_perf_for_devinfo(uint32_t device_id,
 	perf->devinfo.gt_min_freq = gt_min_freq;
 	perf->devinfo.gt_max_freq = gt_max_freq;
 
+	if (devinfo->codename) {
+		snprintf(perf->devinfo.devname, sizeof(perf->devinfo.devname),
+			 "%s", devinfo->codename);
+	}
+
 	/* On Gen11+ the equations from the xml files expect an 8bits
 	 * mask per subslice, versus only 3bits on prior Gens.
 	 */
-- 
2.30.0.rc2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
