Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4794910E0AB
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Nov 2022 14:10:42 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Nov 2022 16:10:46 +0200
Message-Id: <20221114141046.2466004-1-petri.latvala@intel.com>
In-Reply-To: <20221111080529.2427645-1-petri.latvala@intel.com>
References: <20221111080529.2427645-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] runner: Fix a memory leak in
 stderr_contains_warnings
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

The matches object's internals weren't released.

v2: Don't leak in the other branch either. (Kamil)

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 3d753828..05c4234e 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1902,17 +1902,22 @@ static bool stderr_contains_warnings(const char *beg, const char *end)
 	};
 	struct matches matches;
 	size_t i = 0;
+	bool found = false;
 
 	matches = find_matches(beg, end, needles);
 
 	while (i < matches.size) {
-		if (matches.items[i].where != beg)
-			return true;
+		if (matches.items[i].where != beg) {
+			found = true;
+			break;
+		}
 		beg = next_line(beg, end);
 		i++;
 	}
 
-	return false;
+	free_matches(&matches);
+
+	return found;
 }
 
 static bool json_field_has_data(struct json_object *obj, const char *key)
-- 
2.30.2
