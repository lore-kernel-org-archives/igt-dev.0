Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB8C1135FF
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:24 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:44 +0300
Message-Id: <20220614233100.13834-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/23] tools/intel_vbt_decode: Dump the
 block size
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

Knowing the size of each block can help in figuring out what should
be in there. Let's dump that.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index e16e12d0423c..fdee0a41e071 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1847,10 +1847,10 @@ static bool dump_section(struct context *context, int section_id)
 	}
 
 	if (dumper && dumper->name)
-		printf("BDB block %d - %s:\n", block->id, dumper->name);
+		printf("BDB block %d (%d bytes) - %s:\n", block->id, block->size, dumper->name);
 	else
-		printf("BDB block %d - Unknown, no decoding available:\n",
-		       block->id);
+		printf("BDB block %d (%d bytes) - Unknown, no decoding available:\n",
+		       block->id, block->size);
 
 	if (context->hexdump)
 		hex_dump_block(block);
-- 
2.35.1
