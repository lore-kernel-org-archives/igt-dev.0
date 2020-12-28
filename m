Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A38B890F4
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Dec 2020 03:20:16 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon, 28 Dec 2020 05:19:39 +0200
Message-Id: <20201228031940.178954-3-lionel.g.landwerlin@intel.com>
In-Reply-To: <20201228031940.178954-1-lionel.g.landwerlin@intel.com>
References: <20201228031940.178954-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/i915/perf: fill up reader devinfo
 default field
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

A bunch of fields were left to 0...

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: 43116ee368585d ("lib/i915-perf: add i915 perf data reader")
---
 lib/i915/perf_data_reader.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/i915/perf_data_reader.c b/lib/i915/perf_data_reader.c
index 3b05a2e54..4b68fb502 100644
--- a/lib/i915/perf_data_reader.c
+++ b/lib/i915/perf_data_reader.c
@@ -119,12 +119,13 @@ find_metric_set(struct intel_perf *perf, const char *symbol_name)
 
 static void
 init_devinfo(struct intel_perf_devinfo *perf_devinfo,
+	     struct intel_perf *perf,
 	     const struct intel_device_info *devinfo,
 	     uint32_t devid,
 	     uint64_t timestamp_frequency)
 {
+	*perf_devinfo = perf->devinfo;
 	perf_devinfo->devid = devid;
-	perf_devinfo->gen = devinfo->gen;
 	perf_devinfo->timestamp_frequency = timestamp_frequency;
 }
 
@@ -203,15 +204,15 @@ parse_data(struct intel_perf_data_reader *reader)
 		return false;
 	}
 
-	init_devinfo(&reader->devinfo, devinfo,
-		     record_info->device_id,
-		     record_info->timestamp_frequency);
 	reader->perf = intel_perf_for_devinfo(record_info->device_id,
 					      record_info->device_revision,
 					      record_info->timestamp_frequency,
 					      record_info->gt_min_frequency,
 					      record_info->gt_max_frequency,
 					      &record_topology->topology);
+	init_devinfo(&reader->devinfo, reader->perf, devinfo,
+		     record_info->device_id,
+		     record_info->timestamp_frequency);
 
 	reader->metric_set_name = record_info->metric_set_name;
 	reader->metric_set_uuid = record_info->metric_set_uuid;
-- 
2.30.0.rc2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
