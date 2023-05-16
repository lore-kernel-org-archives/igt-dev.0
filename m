Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F6310E295
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 16:56:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 janga.rahul.kumar@intel.com
Date: Tue, 16 May 2023 22:20:56 +0530
Message-Id: <20230516165058.4047595-19-bhanuprakash.modem@intel.com>
In-Reply-To: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 18/20] tests/xe/xe_debugfs: Use xe_config() helper
 to get the config
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

Use xe_config() helper to get the config.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/xe/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 4006981c6..10dd05740 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -252,7 +252,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest("base") {
-		test_base(fd, xe_dev->config);
+		test_base(fd, xe_config(fd));
 	}
 
 
-- 
2.40.0
