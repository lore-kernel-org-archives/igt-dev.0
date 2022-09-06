Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A7C10E64E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:29:50 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:28 +0300
Message-Id: <20220906122944.8838-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 01/17] tools/intel_vbt_decode: Fix mipi
 sequence block size
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

The v3+ MIPI sequence block version number and new size
field are considered part of the BDB block header, and thus
not included in the reported size. Bump up the size appropariately
so that we copy the whole block.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index bad6825cfbab..98edeb385635 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -476,6 +476,13 @@ static struct bdb_block *find_section(const struct context *context, int section
 
 	size = get_blocksize(data);
 
+	/*
+	 * Version number and new block size are considered
+	 * part of the header for MIPI sequenece block v3+.
+	 */
+	if (section_id == BDB_MIPI_SEQUENCE && *(const u8*)data >= 3)
+		size += 5;
+
 	/* expect to have the full definition for each block with modern VBTs */
 	if (min_size && size > min_size &&
 	    section_id != BDB_CHILD_DEVICE_TABLE &&
-- 
2.35.1
