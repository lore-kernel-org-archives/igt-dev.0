Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3446310E1C9
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 10:07:44 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 12:07:31 +0200
Message-Id: <20221108100733.2378106-4-petri.latvala@intel.com>
In-Reply-To: <20221108100733.2378106-1-petri.latvala@intel.com>
References: <20221108100733.2378106-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] igt_core: Make sure test result gets to
 runner when test has no subtests
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

One more raw printf, converted to the wrapper that sends to runner if
connected.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index cab5f860..de20898e 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2264,8 +2264,8 @@ void igt_exit(void)
 				result = "FAIL";
 		}
 
-		printf("%s (%.3fs)\n",
-		       result, igt_time_elapsed(&subtest_time, &now));
+		_log_line_fprintf(stdout, "%s (%.3fs)\n",
+				  result, igt_time_elapsed(&subtest_time, &now));
 	}
 
 	exit(igt_exitcode);
-- 
2.30.2
