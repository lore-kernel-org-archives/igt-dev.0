Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0096B10E152
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 12:38:12 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Nov 2022 13:38:03 +0100
Message-Id: <20221110123804.18486-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221110123804.18486-1-kamil.konieczny@linux.intel.com>
References: <20221110123804.18486-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/2] lib/igt_device_scan: refactor filter
 adding
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

Refactor filter adding loop.

v2: fix misspelled word (Zbigniew)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_device_scan.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 15be3844..6f5b90e6 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1775,13 +1775,15 @@ int igt_device_filter_add(const char *filters)
 
 	while ((filter = strsep(&dup, ";"))) {
 		bool is_valid = is_filter_valid(filter);
+		struct device_filter *df;
 		igt_warn_on(!is_valid);
-		if (is_valid) {
-			struct device_filter *df = malloc(sizeof(*df));
-			strncpy(df->filter, filter, sizeof(df->filter)-1);
-			igt_list_add_tail(&df->link, &device_filters);
-			count++;
-		}
+		if (!is_valid)
+			continue;
+
+		df = malloc(sizeof(*df));
+		strncpy(df->filter, filter, sizeof(df->filter)-1);
+		igt_list_add_tail(&df->link, &device_filters);
+		count++;
 	}
 
 	free(dup_orig);
-- 
2.34.1
