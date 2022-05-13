Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC46B10F43F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 May 2022 09:55:29 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 May 2022 12:53:00 +0300
Message-Id: <20220513095300.6785-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: Add missing newline in
 igt_fopen_data's logging
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

Also drive-by, change %s strerror(errno) to the equivalent %m.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 6dad3c84..ba906ab0 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2929,8 +2929,7 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
 	}
 
 	if (!fp)
-		igt_critical("Could not open data file \"%s\": %s", filename,
-			     strerror(errno));
+		igt_critical("Could not open data file \"%s\": %m\n", filename);
 
 	return fp;
 }
-- 
2.30.2
