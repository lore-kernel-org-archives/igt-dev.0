Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119BC12B0B6
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 09:45:08 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 28 Jun 2022 11:44:35 +0200
Message-Id: <20220628094435.854519-8-ryszard.knop@intel.com>
In-Reply-To: <20220628094435.854519-1-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/7] runner: Add help for the --environment
 flag
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

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/settings.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 1926e197..383e641e 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -286,6 +286,10 @@ static const char *usage_str =
 	"  -b, --blacklist FILENAME\n"
 	"                        Exclude all test matching to regexes from FILENAME\n"
 	"                        (can be used more than once)\n"
+	"  -e, --environment <KEY or KEY=VALUE>\n"
+	"                        Set an environment variable for the test process.\n"
+	"                        If only the key is provided, the current value is read\n"
+	"                        from the runner's environment (and saved for resumes).\n"
 	"  -L, --list-all        List all matching subtests instead of running\n"
 	"  --collect-code-cov    Enables gcov-based collect of code coverage for tests.\n"
 	"                        Requires --collect-script FILENAME\n"
-- 
2.36.1
