Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CEF10E50F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 09:10:16 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Oct 2022 11:10:01 +0200
Message-Id: <20221018091001.18552-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221018091001.18552-1-kamil.konieczny@linux.intel.com>
References: <20221018091001.18552-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_device_scan: add card=all
 filter selector
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

Allow to select all discrete cards on system with the help of
card=all or card=* filter, for example:

pci:vendor=intel,device=discrete,card=all

or

pci:vendor=intel,device=discrete,card=*

This will add max of 16 cards filters with card=0..15

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 6f5b90e6..55840b4f 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -120,6 +120,13 @@
  *
  *   It selects the second one.
  *
+ *   |[<!-- language="plain" -->
+ *   pci:vendor=8086,device=1234,card=all
+ *   pci:vendor=8086,device=1234,card=*
+ *   ]|
+ *
+ *   This will add 0..15 card selectors.
+ *
  *   We may use device codename or pseudo-codename (integrated/discrete)
  *   instead of pci device id:
  *
@@ -1753,6 +1760,8 @@ static bool is_filter_valid(const char *fstr)
 	return true;
 }
 
+#define MAX_PCI_CARDS 16
+
 /**
  * igt_device_filter_add
  * @filters: filter(s) to be stored in filter array
@@ -1776,14 +1785,35 @@ int igt_device_filter_add(const char *filters)
 	while ((filter = strsep(&dup, ";"))) {
 		bool is_valid = is_filter_valid(filter);
 		struct device_filter *df;
+		char *multi;
+
 		igt_warn_on(!is_valid);
 		if (!is_valid)
 			continue;
 
 		df = malloc(sizeof(*df));
-		strncpy(df->filter, filter, sizeof(df->filter)-1);
-		igt_list_add_tail(&df->link, &device_filters);
-		count++;
+		if (!strncmp(filter, "sriov:", 6)) {
+			multi = NULL;
+		} else {
+			multi = strstr(filter, "card=all");
+			if (!multi)
+				multi = strstr(filter, "card=*");
+		}
+
+		if (!multi) {
+			strncpy(df->filter, filter, sizeof(df->filter)-1);
+			igt_list_add_tail(&df->link, &device_filters);
+			count++;
+		} else {
+			multi[5] = 0;
+			for (int i = 0; i < MAX_PCI_CARDS; ++i) {
+				if (i)
+					df = malloc(sizeof(*df));
+				snprintf(df->filter, sizeof(df->filter)-1, "%s%d", filter, i);
+				igt_list_add_tail(&df->link, &device_filters);
+				count++;
+			}
+		}
 	}
 
 	free(dup_orig);
-- 
2.34.1
