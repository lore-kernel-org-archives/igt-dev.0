Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5C210E5C5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Nov 2022 13:50:29 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Nov 2022 14:50:15 +0100
Message-Id: <20221109135016.28889-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20221109135016.28889-1-kamil.konieczny@linux.intel.com>
References: <20221109135016.28889-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/2] lib/igt_device_scan: refactor filter
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
