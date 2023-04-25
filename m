Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Tue, 25 Apr 2023 13:19:25 -0700
Message-Id: <20230425201926.99086-2-John.C.Harrison@Intel.com>
In-Reply-To: <20230425201926.99086-1-John.C.Harrison@Intel.com>
References: <20230425201926.99086-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t 1/2] lib/intel_decode: Decode Gen12
 ring/batch instructions correctly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Some MI_ instructions have changed (or are just new) for Gen12. So
update the decoder code to match.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 lib/i915/intel_decode.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/i915/intel_decode.c b/lib/i915/intel_decode.c
index 80b92d90c61c..1b6de5edafad 100644
--- a/lib/i915/intel_decode.c
+++ b/lib/i915/intel_decode.c
@@ -236,7 +236,7 @@ decode_mi(struct intel_decode *ctx)
 		{ 0x08, 0, 1, 1, "MI_ARB_ON_OFF" },
 		{ 0x0a, 0, 1, 1, "MI_BATCH_BUFFER_END" },
 		{ 0x30, 0x3f, 3, 3, "MI_BATCH_BUFFER" },
-		{ 0x31, 0x3f, 2, 2, "MI_BATCH_BUFFER_START" },
+		{ 0x31, 0x3f, 2, 3, "MI_BATCH_BUFFER_START" },
 		{ 0x14, 0x3f, 3, 3, "MI_DISPLAY_BUFFER_INFO" },
 		{ 0x04, 0, 1, 1, "MI_FLUSH" },
 		{ 0x22, 0x1f, 3, 3, "MI_LOAD_REGISTER_IMM" },
@@ -256,6 +256,7 @@ decode_mi(struct intel_decode *ctx)
 		{ 0x28, 0x3f, 3, 3, "MI_REPORT_PERF_COUNT" },
 		{ 0x29, 0xff, 3, 3, "MI_LOAD_REGISTER_MEM" },
 		{ 0x0b, 0, 1, 1, "MI_SUSPEND_FLUSH"},
+		{ 0x05, 0, 1, 1, "MI_ARB_CHECK"},
 	}, *opcode_mi = NULL;
 
 	/* check instruction length */
@@ -3623,7 +3624,17 @@ decode_3d_965(struct intel_decode *ctx)
 		return len;
 
 	case 0x7a00:
-		if (IS_GEN6(devid) || IS_GEN7(devid)) {
+		if (IS_GEN12(devid)) {
+			if (len != 6)
+				fprintf(out, "Bad count in PIPE_CONTROL\n");
+			instr_out(ctx, 0, "PIPE_CONTROL\n");
+			instr_out(ctx, 1, "flags\n");
+			instr_out(ctx, 2, "write address low\n");
+			instr_out(ctx, 3, "write address high\n");
+			instr_out(ctx, 4, "write data low\n");
+			instr_out(ctx, 5, "write data high\n");
+			return len;
+		} else if (IS_GEN6(devid) || IS_GEN7(devid)) {
 			if (len != 4 && len != 5)
 				fprintf(out, "Bad count in PIPE_CONTROL\n");
 
-- 
2.39.1


