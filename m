Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Fri,  3 Feb 2023 11:30:05 +0000
Message-Id: <20230203113005.4138939-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230203111636.4138202-4-tvrtko.ursulin@linux.intel.com>
References: <20230203111636.4138202-4-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] intel_gpu_top: Add CSV output format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Caleb Callaway <caleb.callaway@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add CSV output mode.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Caleb Callaway <caleb.callaway@intel.com>
---
 man/intel_gpu_top.rst |  3 ++
 tools/intel_gpu_top.c | 78 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index 69834756b81e..77228277b9bf 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -31,6 +31,9 @@ OPTIONS
 -h
     Show help text.
 
+-c
+    Output CVS formatted data.
+
 -J
     Output JSON formatted data.
 
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index a980cc7043dc..2e1365959d8b 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1268,6 +1268,7 @@ usage(const char *appname)
 		"\n"
 		"\tThe following parameters are optional:\n\n"
 		"\t[-h]            Show this help text.\n"
+		"\t[-c]            Output CSV formatted data.\n"
 		"\t[-J]            Output JSON formatted data.\n"
 		"\t[-l]            List plain text data.\n"
 		"\t[-o <file|->]   Output to specified file or '-' for standard out.\n"
@@ -1283,6 +1284,7 @@ usage(const char *appname)
 static enum {
 	INTERACTIVE,
 	TEXT,
+	CSV,
 	JSON
 } output_mode;
 
@@ -1457,6 +1459,22 @@ text_add_member(const struct cnt_group *parent, struct cnt_item *item,
 	return len > 0 ? len : 0;
 }
 
+static unsigned int
+csv_add_member(const struct cnt_group *parent, struct cnt_item *item,
+	       unsigned int headers)
+{
+	int len = 0;
+
+	if (headers)
+		fprintf(out, "%s %s", parent->display_name, item->unit);
+	else
+		len = fprintf(out, "%f",
+			      pmu_calc(&item->pmu->val, item->d, item->t,
+				       item->s));
+
+	return len > 0 ? len : 0;
+}
+
 static void
 term_open_struct(const char *name)
 {
@@ -1540,6 +1558,46 @@ print_group(struct cnt_group *grp, unsigned int headers)
 	return consumed;
 }
 
+static unsigned int csv_count, prev_csv_count;
+
+static void csv_close_struct(void)
+{
+	assert(text_level > 0);
+	if (--text_level == 0) {
+		csv_count = prev_csv_count = 0;
+		text_lines++;
+		fputs("\n", out);
+		fflush(out);
+	}
+}
+
+static bool
+csv_print_group(struct cnt_group *grp, unsigned int headers)
+{
+	unsigned int consumed = 0;
+	struct cnt_item *item;
+
+	if (!present_in_group(grp))
+		return false;
+
+	text_open_struct(grp->name);
+
+	for (item = grp->items; item->name; item++) {
+		if (!item->pmu || !item->pmu->present)
+			continue;
+
+		if (csv_count != prev_csv_count)
+			fprintf(out, ",");
+		prev_csv_count = csv_count++;
+
+		consumed += csv_add_member(grp, item, headers);
+	}
+
+	csv_close_struct();
+
+	return consumed;
+}
+
 static bool
 term_print_group(struct cnt_group *grp, unsigned int headers)
 {
@@ -1570,6 +1628,13 @@ static const struct print_operations text_pops = {
 	.print_group = print_group,
 };
 
+static const struct print_operations csv_pops = {
+	.open_struct = text_open_struct,
+	.close_struct = csv_close_struct,
+	.add_member = csv_add_member,
+	.print_group = csv_print_group,
+};
+
 static const struct print_operations term_pops = {
 	.open_struct = term_open_struct,
 	.close_struct = term_close_struct,
@@ -1582,11 +1647,12 @@ static bool print_groups(struct cnt_group **groups)
 	static bool headers_printed = false;
 	bool print_data = true;
 
-	if (output_mode == TEXT &&
+	if ((output_mode == TEXT || output_mode == CSV) &&
 	    (text_header_repeat || !headers_printed)) {
+		const unsigned int header_lines = output_mode == TEXT ? 2 : 1;
 		unsigned int headers = text_lines % TEXT_HEADER_REPEAT + 1;
 
-		if (headers == 1 || headers == 2)
+		if (headers > 0 && headers <= header_lines)
 			for (struct cnt_group **grp = groups; *grp; grp++)
 				print_data = pops->print_group(*grp, headers);
 
@@ -2469,7 +2535,7 @@ int main(int argc, char **argv)
 	char *codename = NULL;
 
 	/* Parse options */
-	while ((ch = getopt(argc, argv, "o:s:d:pJLlh")) != -1) {
+	while ((ch = getopt(argc, argv, "o:s:d:pcJLlh")) != -1) {
 		switch (ch) {
 		case 'o':
 			output_path = optarg;
@@ -2483,6 +2549,9 @@ int main(int argc, char **argv)
 		case 'p':
 			physical_engines = true;
 			break;
+		case 'c':
+			output_mode = CSV;
+			break;
 		case 'J':
 			output_mode = JSON;
 			break;
@@ -2532,6 +2601,9 @@ int main(int argc, char **argv)
 	case TEXT:
 		pops = &text_pops;
 		break;
+	case CSV:
+		pops = &csv_pops;
+		break;
 	case JSON:
 		pops = &json_pops;
 		break;
-- 
2.34.1
