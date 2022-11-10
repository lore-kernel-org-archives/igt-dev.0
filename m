Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A230910E765
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 12:38:16 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Nov 2022 13:38:04 +0100
Message-Id: <20221110123804.18486-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221110123804.18486-1-kamil.konieczny@linux.intel.com>
References: <20221110123804.18486-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/2] lib/igt_device_scan: add card=all
 filter selector
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Allow to select all discrete cards on system with the help of
card=all or card=* filter, for example:

pci:vendor=intel,device=discrete,card=all

or

pci:vendor=intel,device=discrete,card=*

This will add max of 64 cards filters with card=0..63 but will
stop adding at card index not present on system. If no card will
match only one filter for card=0 will be added.

v2: increase number of filters from 16 to 64, add stopper for
  non-matching card to avoid filter splat (Petri)
v3: improve documentation
v4: corrected filter used in matching, rearrange loop code

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 6f5b90e6..ed128d24 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -120,6 +120,15 @@
  *
  *   It selects the second one.
  *
+ *   |[<!-- language="plain" -->
+ *   pci:vendor=8086,device=1234,card=all
+ *   pci:vendor=8086,device=1234,card=*
+ *   ]|
+ *
+ *   This will add 0..N card selectors, where 0 <= N <= 63. At least one
+ *   filter will be added with card=0 and all incrementally matched ones
+ *   up to max numbered 63 (max total 64).
+ *
  *   We may use device codename or pseudo-codename (integrated/discrete)
  *   instead of pci device id:
  *
@@ -1753,6 +1762,8 @@ static bool is_filter_valid(const char *fstr)
 	return true;
 }
 
+#define MAX_PCI_CARDS 64
+
 /**
  * igt_device_filter_add
  * @filters: filter(s) to be stored in filter array
@@ -1776,14 +1787,43 @@ int igt_device_filter_add(const char *filters)
 	while ((filter = strsep(&dup, ";"))) {
 		bool is_valid = is_filter_valid(filter);
 		struct device_filter *df;
+		char *multi;
+
 		igt_warn_on(!is_valid);
 		if (!is_valid)
 			continue;
 
-		df = malloc(sizeof(*df));
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
+			df = malloc(sizeof(*df));
+			strncpy(df->filter, filter, sizeof(df->filter)-1);
+			igt_list_add_tail(&df->link, &device_filters);
+			count++;
+		} else {
+			multi[5] = 0;
+			for (int i = 0; i < MAX_PCI_CARDS; ++i) {
+				df = malloc(sizeof(*df));
+				snprintf(df->filter, sizeof(df->filter)-1, "%s%d", filter, i);
+				if (i) { /* add at least card=0 */
+					struct igt_device_card card;
+
+					if (!igt_device_card_match(df->filter, &card)) {
+						free(df);
+						break;
+					}
+				}
+
+				igt_list_add_tail(&df->link, &device_filters);
+				count++;
+			}
+		}
 	}
 
 	free(dup_orig);
-- 
2.34.1
