Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C78E1121F6
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 07:54:51 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Apr 2022 13:22:20 +0530
Message-Id: <20220422075223.2792586-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220422075223.2792586-1-bhanuprakash.modem@intel.com>
References: <20220422075223.2792586-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/4] lib/igt_edid: Helper to read monitor range
 from EDID
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

Add a helper function to read Monitor's range capability
from EDID.

V2:
* Check for flag range limits only.
V3:
* Add documentation
* Return from single place

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_edid.c | 40 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_edid.h |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index bff13a0d..1dfadbb7 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -160,6 +160,46 @@ void detailed_timing_set_monitor_range_mode(struct detailed_timing *dt,
 	       sizeof(monitor_range_padding));
 }
 
+struct detailed_data_monitor_range
+detailed_timing_get_monitor_range(const struct edid *edid)
+{
+	uint8_t i;
+	struct detailed_data_monitor_range mr = {0, 0};
+
+	for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
+		struct detailed_non_pixel *other_data;
+		struct detailed_timing timings = edid->detailed_timings[i];
+
+		/*
+		 * From EDID Display Range Limits Descriptor specs:
+		 *
+		 * Bytes	Description
+		 *  0–1		00 00 = Display Descriptor
+		 *   2		00 = reserved
+		 *   3		FD = Display Range Limits Descriptor
+		 *   10		01 = No timing information.
+		 *
+		 */
+		if (timings.pixel_clock[0] != 0x00 ||
+		    timings.pixel_clock[1] != 0x00)
+			continue;
+
+		other_data = &timings.data.other_data;
+		if (other_data->pad1 != 0x00 ||
+		    other_data->type != EDID_DETAIL_MONITOR_RANGE)
+			continue;
+
+		/* Check for flag range limits only. */
+		if (other_data->data.range.flags != 0x01)
+			continue;
+
+		mr = other_data->data.range;
+		break;
+	}
+
+	return mr;
+}
+
 /**
  * detailed_timing_set_string: set a detailed timing to be a string
  */
diff --git a/lib/igt_edid.h b/lib/igt_edid.h
index a9251d68..1bc5d3c9 100644
--- a/lib/igt_edid.h
+++ b/lib/igt_edid.h
@@ -383,6 +383,8 @@ void detailed_timing_set_mode(struct detailed_timing *dt, drmModeModeInfo *mode,
 			      int width_mm, int height_mm);
 void detailed_timing_set_monitor_range_mode(struct detailed_timing *dt,
 					    drmModeModeInfo *mode);
+struct detailed_data_monitor_range detailed_timing_get_monitor_range(
+				const struct edid *edid);
 void detailed_timing_set_string(struct detailed_timing *dt,
 				enum detailed_non_pixel_type type,
 				const char *str);
-- 
2.35.1
