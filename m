Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7E3AB464
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 07:11:55 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Jul 2022 09:11:37 +0200
Message-Id: <20220718071140.20058-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220718071140.20058-1-zbigniew.kempczynski@intel.com>
References: <20220718071140.20058-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 3/6] tools/lsgpu: Add codename switch (-c)
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

Add -c switch which will change default (pretty) platform name to
codename only. It may be useful for writing device selection filter.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/lsgpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 27e76f2616..da84e20505 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -73,6 +73,7 @@ enum {
 	OPT_PRINT_SIMPLE   = 's',
 	OPT_PRINT_DETAIL   = 'p',
 	OPT_NUMERIC        = 'n',
+	OPT_CODENAME       = 'c',
 	OPT_LIST_VENDORS   = 'v',
 	OPT_LIST_FILTERS   = 'l',
 	OPT_DEVICE         = 'd',
@@ -88,6 +89,7 @@ static const char *usage_str =
 	"usage: lsgpu [options]\n\n"
 	"Options:\n"
 	"  -n, --numeric               Print vendor/device as hex\n"
+	"  -c, --codename              Print codename instead pretty device name\n"
 	"  -s, --print-simple          Print simple (legacy) device details\n"
 	"  -p, --print-details         Print devices with details\n"
 	"  -v, --list-vendors          List recognized vendors\n"
@@ -163,6 +165,7 @@ int main(int argc, char *argv[])
 		{"sysfs",             no_argument,       NULL, 1},
 		{"pci",               no_argument,       NULL, 2},
 		{"numeric",           no_argument,       NULL, OPT_NUMERIC},
+		{"codename",          no_argument,       NULL, OPT_CODENAME},
 		{"print-simple",      no_argument,       NULL, OPT_PRINT_SIMPLE},
 		{"print-detail",      no_argument,       NULL, OPT_PRINT_DETAIL},
 		{"list-vendors",      no_argument,       NULL, OPT_LIST_VENDORS},
@@ -177,13 +180,16 @@ int main(int argc, char *argv[])
 			.type = IGT_PRINT_USER,
 	};
 
-	while ((c = getopt_long(argc, argv, "nspvld:h",
+	while ((c = getopt_long(argc, argv, "ncspvld:h",
 				long_options, &index)) != -1) {
 		switch(c) {
 
 		case OPT_NUMERIC:
 			fmt.numeric = true;
 			break;
+		case OPT_CODENAME:
+			fmt.codename = true;
+			break;
 		case OPT_PRINT_SIMPLE:
 			fmt.type = IGT_PRINT_SIMPLE;
 			break;
-- 
2.34.1
