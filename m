Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F9C10E054
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 13:14:30 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 15:14:24 +0200
Message-Id: <20221129131424.2096289-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tools/intel_vbt_decode: print debug-ish
 messages to stderr
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The tool outputs the decoded and somewhat nicely formatted VBT to
stdout, so debug style messages to stdout aren't a great fit. For
example:

BDB blocks present:
	  1   2   9  10  12  20  27  40Generating LVDS data table pointers
  41Generating LVDS data table pointers
  42  43  44  46  51  52  53
	 56  57  58 252 253 254

Print the debug message about data table pointers to stderr instead.

Fixes: ce4d30196d3c ("tools/intel_vbt_decode: Generate LVDS data table pointes if not provided")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 94a910b5c107..8f707c1f822a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -460,7 +460,7 @@ static struct bdb_block *find_section(const struct context *context, int section
 
 	data = find_raw_section(context, section_id);
 	if (!data && section_id == BDB_LVDS_LFP_DATA_PTRS) {
-		printf("Generating LVDS data table pointers\n");
+		fprintf(stderr, "Generating LVDS data table pointers\n");
 		temp_block = generate_lvds_data_ptrs(context);
 		if (temp_block)
 			data = temp_block + 3;
-- 
2.34.1
