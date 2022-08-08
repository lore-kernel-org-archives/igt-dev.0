Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A6310E973
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 16:20:19 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Mon,  8 Aug 2022 18:18:25 +0200
Message-Id: <20220808161825.1942387-7-ryszard.knop@intel.com>
In-Reply-To: <20220808161825.1942387-1-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
 <20220808161825.1942387-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 6/7] runner: Add help for the
 --environment flag
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
index b57ab080..cd40208b 100644
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
2.37.1
