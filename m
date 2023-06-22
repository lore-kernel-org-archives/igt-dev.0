Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616CD10E4DB
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 07:01:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:24:20 +0530
Message-Id: <20230622065422.2235134-22-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 21/23] tests/xe/xe_debugfs: Use xe_config()
 helper to get the config
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
index c404da258..bbd821f8c 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -253,7 +253,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest("base") {
-		test_base(fd, xe_dev->config);
+		test_base(fd, xe_config(fd));
 	}
 
 
-- 
2.40.0
