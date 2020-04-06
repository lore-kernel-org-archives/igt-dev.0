Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEEA6E3B7
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 13:15:45 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon,  6 Apr 2020 16:15:40 +0300
Message-Id: <20200406131540.14404-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] igt_core: Add --version
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

To help verify correct deployment, add a --version flag that just
prints the IGT-Version text.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 77862498..3f7b9f68 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -320,6 +320,7 @@ enum {
 	OPT_SKIP_CRC,
 	OPT_TRACE_OOPS,
 	OPT_DEVICE,
+	OPT_VERSION,
 	OPT_HELP = 'h'
 };
 
@@ -685,6 +686,7 @@ static void print_usage(const char *help_str, bool output_on_stderr)
 		   "  --help-description\n"
 		   "  --describe\n"
 		   "  --device filter\n"
+		   "  --version\n"
 		   "  --help|-h\n");
 	if (help_str)
 		fprintf(f, "%s\n", help_str);
@@ -859,6 +861,7 @@ static int common_init(int *argc, char **argv,
 		{"skip-crc-compare",  no_argument,       NULL, OPT_SKIP_CRC},
 		{"trace-on-oops",     no_argument,       NULL, OPT_TRACE_OOPS},
 		{"device",            required_argument, NULL, OPT_DEVICE},
+		{"version",           no_argument,       NULL, OPT_VERSION},
 		{"help",              no_argument,       NULL, OPT_HELP},
 		{0, 0, 0, 0}
 	};
@@ -998,6 +1001,10 @@ static int common_init(int *argc, char **argv,
 			}
 			igt_device_filter_set(optarg);
 			break;
+		case OPT_VERSION:
+			print_version();
+			ret = -1;
+			goto out;
 		case OPT_HELP:
 			print_usage(help_str, false);
 			ret = -1;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
