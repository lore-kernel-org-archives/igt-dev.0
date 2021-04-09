Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C4A6E49A
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Apr 2021 11:39:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Sat, 10 Apr 2021 01:00:45 +0530
Message-Id: <20210409193048.6857-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20210409193048.6857-1-bhanuprakash.modem@intel.com>
References: <20210409193048.6857-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/5] lib/igt_kms: Identify outputs that
 shares link bandwidth
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

We have to read the PATH property and parse it to identify the
connector that shares the BW of the same link. Parsing the PATH
property consists of finding all connectors with the same X prefix
in the X-Y[-Z...] path property format and assigning a unique
non-zero link_group_id to all such connectors.

Connectors without a PATH property are not an MST output, so their
link_group_id can be left at 0.

v2:
Update the link_group_id in igt_output_refresh(). (Ankit)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 29 +++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f1a989368..1ba938982 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1684,6 +1684,32 @@ static void igt_display_log_shift(igt_display_t *display, int shift)
 	igt_assert(display->log_shift >= 0);
 }
 
+static
+void igt_update_output_link_group_id(int drmfd, igt_output_t *output)
+{
+	uint64_t blob_id;
+	drmModePropertyBlobPtr blob;
+	char *temp;
+
+	if(!igt_output_has_prop(output, IGT_CONNECTOR_PATH)) {
+		output->link_group_id = 0;
+		return;
+	}
+
+	blob_id = igt_output_get_prop(output, IGT_CONNECTOR_PATH);
+	blob = drmModeGetPropertyBlob(drmfd, blob_id);
+	igt_assert(blob);
+
+	temp = strtok((char *)blob->data, ":");
+	if (strcmp(temp, "mst") == 0)
+		output->link_group_id = atoi(strtok(NULL, "-"));
+	else
+		output->link_group_id = 0;
+
+	drmModeFreePropertyBlob(blob);
+	return;
+}
+
 void igt_output_refresh(igt_output_t *output)
 {
 	igt_display_t *display = output->display;
@@ -1709,6 +1735,9 @@ void igt_output_refresh(igt_output_t *output)
 		igt_atomic_fill_connector_props(display, output,
 			IGT_NUM_CONNECTOR_PROPS, igt_connector_prop_names);
 
+	/* Identify all connectors that share the BW of the same link */
+	igt_update_output_link_group_id(display->drm_fd, output);
+
 	LOG(display, "%s: Selecting pipe %s\n", output->name,
 	    kmstest_pipe_name(output->pending_pipe));
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 39a1ea570..c828e78b5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -386,6 +386,7 @@ typedef struct {
 	drmModeModeInfo override_mode;
 
 	int32_t writeback_out_fence_fd;
+	int link_group_id;
 
 	/* bitmask of changed properties */
 	uint64_t changed;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
