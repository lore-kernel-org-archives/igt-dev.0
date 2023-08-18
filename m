Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DF610E55E
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 19:22:18 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Aug 2023 21:22:03 +0200
Message-Id: <20230818192203.75155-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230818192203.75155-1-kamil.konieczny@linux.intel.com>
References: <20230818192203.75155-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] runner/resultgen: compress dmesg if
 size limit hit
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

If dmesg log size is exceeding its limit do compressing of it
with the help of external program, given in option --compress.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 0dc26b335..95b9eadca 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1204,6 +1204,13 @@ static bool fill_from_dmesg(int fd, char *dirname,
 	g_regex_unref(re);
 	fclose(f);
 
+	if (limit && settings->compressor) {
+		char comp[2*PATH_MAX + 256];
+
+		snprintf(comp, sizeof(comp), "%s %s/%s/%s", settings->compressor, settings->results_path, dirname, "dmesg.txt");
+		system(comp);
+	}
+
 	return true;
 }
 
-- 
2.39.2
