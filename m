Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29389113647
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:32:35 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:31:00 +0300
Message-Id: <20220614233100.13834-24-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 23/23] tools/intel_vbt_decode: Warn if we
 lack the full definiton of the BDB block
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Warn in case out BDB block definition is smaller than what
the VBT has. That is an indication that we are potentially
forgetting to decode some useful new data.

We exclude blocks 2,11,22 from this since we don't have
a sensible min size for them.

We also limit this to modernish VBTs (155+) since some
old stuff doesn't really conform (eg. my cst with version
134 has a 9 byte block 1 even though our min size for it
is 7 bytes, and all the other oldish machines have block
1 only made up of of 4 or 5 bytes).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index e45bab4a3e01..5494a34bdca3 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -476,6 +476,15 @@ static struct bdb_block *find_section(const struct context *context, int section
 
 	size = get_blocksize(data);
 
+	/* expect to have the full definition for each block with modern VBTs */
+	if (min_size && size > min_size &&
+	    section_id != BDB_CHILD_DEVICE_TABLE &&
+	    section_id != BDB_SDVO_LVDS_OPTIONS &&
+	    section_id != BDB_GENERAL_DEFINITIONS &&
+	    context->bdb->version >= 155)
+		fprintf(stderr, "Block %d min size %zu less than block size %zu\n",
+			section_id, min_size, size);
+
 	block = calloc(1, sizeof(*block) + 3 + max(size, min_size));
 	if (!block) {
 		free(temp_block);
-- 
2.35.1
