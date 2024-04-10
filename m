Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1014DCD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 13:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F8D113370;
	Wed, 10 Apr 2024 13:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixQR4zPi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B12113363
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712754433; x=1744290433;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=kzEyfVp/+vbmLe7bVroBoutEqHpHJpLyxtF1QsFTJrU=;
 b=ixQR4zPigZrDJbfvZ35hM7xCyUGGr50/l6TJmFY0sqV2088QysXBCIZ+
 4jlKIw9iUaM7gDm5qPQAAH4W2pia3zoYTt1vUBYvD/wY7HnVU5EBdrIhC
 ra+UEikW9jzm533EpRw7SkwenD3bXTSHJBfhiSgh9MMb4QxGmC4s/7ao8
 Zc11q7fQ9/QvXgorzp1uUjos315h4TY5pOehAZ6SvHx9M9f/gMj8X7d3i
 W6gcFwn7HEqugOWBPoB8tcD3GNRk5fJluMRsNeNPf7rEgIJIQLNRdTLam
 ObwwagKgkK6nnCezPDdBKMVxeDOdCNlUxrWY91edAdvIOJNKFFUq0Tbyl w==;
X-CSE-ConnectionGUID: lj1D1utEQT6FOpe1dfk+IA==
X-CSE-MsgGUID: rYmirRZaSxW1xVqj8j2Cng==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8215771"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8215771"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 06:07:12 -0700
X-CSE-ConnectionGUID: 4quAe3UZR0WPA9u59rvrqw==
X-CSE-MsgGUID: v8HGYo+ET7iSZrQNJGHmkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="43789920"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 06:07:11 -0700
Received: from linux.intel.com (unknown [10.245.244.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8F3E920B573A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:07:10 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1ruXfQ-000000007Gf-2XY3 for igt-dev@lists.freedesktop.org;
 Wed, 10 Apr 2024 15:07:08 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] C files: fix calloc calls with inverted arguments
Date: Wed, 10 Apr 2024 15:07:06 +0200
Message-ID: <20240410130706.27905-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The new gcc version 14 now complains when calloc is called
with inverted arguments:

	../benchmarks/gem_exec_reloc.c:85:31: warning: ‘calloc’ sizes specified with ‘sizeof’ in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
	   85 |         target = calloc(sizeof(*target), num_relocs);
	      |                               ^
	../benchmarks/gem_exec_reloc.c:85:31: note: earlier argument should specify number of elements, later size of each element

Replace all occurrences of calloc that were warned on gcc 14 by
placing the arguments at the right order.

Logic fixed using this small python script, written specifically
to catch gcc calloc warnings:

    #!/usr/bin/env python3
    import re
    warnings = [
    	"lib/igt_kms.c:2781",
    	"lib/igt_kms.c:2809",
    	"lib/igt_kms.c:2858",
    	"lib/igt_chamelium.c:156",
    	"lib/igt_chamelium.c:1519",
    	"tests/kms_atomic_transition.c:483",
    	"tests/kms_atomic_transition.c:485",
    	"tests/kms_atomic_transition.c:487",
    	"tests/kms_flip.c:426",
    	"tests/kms_flip.c:427",
    	"tests/intel/gem_exec_alignment.c:204",
    	"tests/intel/gem_exec_alignment.c:409",
    	"tests/intel/gem_exec_fair.c:1121",
    	"tests/intel/gem_exec_fair.c:1122",
    	"tests/intel/gem_fence_thrash.c:153",
    	"tests/intel/gem_fence_thrash.c:234",
    	"tests/intel/gem_ppgtt.c:432",
    	"tests/intel/gem_ppgtt.c:459",
    	"tests/intel/gem_render_tiled_blits.c:152",
    	"tests/intel/gem_userptr_blits.c:1433",
    	"tests/chamelium/kms_chamelium_frames.c:943",
    	"tests/amdgpu/amd_multidisplay_modeset.c:242",
    	"benchmarks/gem_exec_reloc.c:83",
    	"benchmarks/gem_exec_reloc.c:84",
    	"benchmarks/gem_exec_reloc.c:85",
    	"benchmarks/gem_latency.c:196",
    	"assembler/main.c:400",
    	"assembler/gram.y:219",
    	"assembler/gram.y:231",
    	"assembler/gram.y:242",
    ]
    split_file = re.compile(r"([^\:]+):(\d+)")
    calloc = re.compile(r"(calloc\s*\()(.*)\,\s*([\w\d\ \+\*\-\>]+)(\))")
    for f in warnings:
        match = split_file.match(f)
        if not match:
            continue
        fname = match.group(1)
        line_number = int(match.group(2))
        new = ""
        with open(fname, 'r', encoding = 'utf8') as fp:
            for i, line in enumerate(fp):
                ln = i + 1
                if ln == line_number:
                    new_line = calloc.sub(r"\1\3, \2\4", line)
                    if new_line != line:
                        line = new_line
                    else:
                        print(f"{ln}: FAILED: {line}")
                new += line
        with open(fname, 'w', encoding = 'utf8') as fp:
            fp.write(new)

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 assembler/gram.y                        | 6 +++---
 assembler/main.c                        | 2 +-
 benchmarks/gem_exec_reloc.c             | 6 +++---
 benchmarks/gem_latency.c                | 2 +-
 lib/igt_chamelium.c                     | 4 ++--
 lib/igt_kms.c                           | 6 +++---
 tests/amdgpu/amd_multidisplay_modeset.c | 2 +-
 tests/chamelium/kms_chamelium_frames.c  | 2 +-
 tests/intel/gem_exec_alignment.c        | 4 ++--
 tests/intel/gem_exec_fair.c             | 4 ++--
 tests/intel/gem_fence_thrash.c          | 4 ++--
 tests/intel/gem_ppgtt.c                 | 4 ++--
 tests/intel/gem_render_tiled_blits.c    | 2 +-
 tests/intel/gem_userptr_blits.c         | 2 +-
 tests/kms_atomic_transition.c           | 6 +++---
 tests/kms_flip.c                        | 4 ++--
 16 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/assembler/gram.y b/assembler/gram.y
index 77975e072896..79873b222253 100644
--- a/assembler/gram.y
+++ b/assembler/gram.y
@@ -216,7 +216,7 @@ brw_program_add_instruction(struct brw_program *p,
 {
     struct brw_program_instruction *list_entry;
 
-    list_entry = calloc(sizeof(struct brw_program_instruction), 1);
+    list_entry = calloc(1, sizeof(struct brw_program_instruction));
     list_entry->type = GEN4ASM_INSTRUCTION_GEN;
     list_entry->insn.gen = instruction->insn.gen;
     brw_program_append_entry(p, list_entry);
@@ -228,7 +228,7 @@ brw_program_add_relocatable(struct brw_program *p,
 {
     struct brw_program_instruction *list_entry;
 
-    list_entry = calloc(sizeof(struct brw_program_instruction), 1);
+    list_entry = calloc(1, sizeof(struct brw_program_instruction));
     list_entry->type = GEN4ASM_INSTRUCTION_GEN_RELOCATABLE;
     list_entry->insn.gen = instruction->insn.gen;
     list_entry->reloc = instruction->reloc;
@@ -239,7 +239,7 @@ static void brw_program_add_label(struct brw_program *p, const char *label)
 {
     struct brw_program_instruction *list_entry;
 
-    list_entry = calloc(sizeof(struct brw_program_instruction), 1);
+    list_entry = calloc(1, sizeof(struct brw_program_instruction));
     list_entry->type = GEN4ASM_INSTRUCTION_LABEL;
     list_entry->insn.label.name = strdup(label);
     brw_program_append_entry(p, list_entry);
diff --git a/assembler/main.c b/assembler/main.c
index 2d39d4536a7f..77cc98b80d21 100644
--- a/assembler/main.c
+++ b/assembler/main.c
@@ -397,7 +397,7 @@ int main(int argc, char **argv)
 	    if (entry1 && is_label(entry1) && is_entry_point(entry1)) {
 		// insert NOP instructions until (inst_offset+1) % 4 == 0
 		while (((inst_offset+1) % 4) != 0) {
-		    tmp_entry = calloc(sizeof(*tmp_entry), 1);
+		    tmp_entry = calloc(1, sizeof(*tmp_entry));
 		    tmp_entry->insn.gen.header.opcode = BRW_OPCODE_NOP;
 		    entry->next = tmp_entry;
 		    tmp_entry->next = entry1;
diff --git a/benchmarks/gem_exec_reloc.c b/benchmarks/gem_exec_reloc.c
index dadc064f0ca4..0610308669f2 100644
--- a/benchmarks/gem_exec_reloc.c
+++ b/benchmarks/gem_exec_reloc.c
@@ -80,9 +80,9 @@ static int run(unsigned batch_size,
 	struct drm_i915_gem_relocation_entry *mem_reloc = NULL;
 	int *target;
 
-	gem_exec = calloc(sizeof(*gem_exec), num_objects + 1);
-	mem_reloc = calloc(sizeof(*mem_reloc), num_relocs);
-	target = calloc(sizeof(*target), num_relocs);
+	gem_exec = calloc(num_objects + 1, sizeof(*gem_exec));
+	mem_reloc = calloc(num_relocs, sizeof(*mem_reloc));
+	target = calloc(num_relocs, sizeof(*target));
 
 	fd = drm_open_driver(DRIVER_INTEL);
 
diff --git a/benchmarks/gem_latency.c b/benchmarks/gem_latency.c
index cc8b3de55df3..6abf366f9285 100644
--- a/benchmarks/gem_latency.c
+++ b/benchmarks/gem_latency.c
@@ -193,7 +193,7 @@ static void setup_workload(struct producer *p, int gen,
 	struct drm_i915_gem_relocation_entry *reloc;
 	int offset;
 
-	reloc = calloc(sizeof(*reloc), 2*factor);
+	reloc = calloc(2*factor, sizeof(*reloc));
 
 	p->workload_dispatch.exec[0].handle = scratch;
 	p->workload_dispatch.exec[1].relocation_count = 2*factor;
diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 881e1892cf87..016d5356630c 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -153,7 +153,7 @@ struct chamelium_port **chamelium_get_ports(struct chamelium *chamelium,
 {
 	int i;
 	struct chamelium_port **ret =
-		calloc(sizeof(void*), chamelium->port_count);
+		calloc(chamelium->port_count, sizeof(void*));
 
 	*count = chamelium->port_count;
 	for (i = 0; i < chamelium->port_count; i++)
@@ -1516,7 +1516,7 @@ igt_crc_t *chamelium_read_captured_crcs(struct chamelium *chamelium,
 	res = chamelium_rpc(chamelium, NULL, "GetCapturedChecksums", "(in)", 0);
 
 	*frame_count = xmlrpc_array_size(&chamelium->env, res);
-	ret = calloc(sizeof(igt_crc_t), *frame_count);
+	ret = calloc(*frame_count, sizeof(igt_crc_t));
 
 	for (i = 0; i < *frame_count; i++) {
 		xmlrpc_array_read_item(&chamelium->env, res, i, &elem);
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2a518eb8d936..60339565a192 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2778,7 +2778,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		     resources->count_crtcs, IGT_MAX_PIPES);
 
 	display->n_pipes = IGT_MAX_PIPES;
-	display->pipes = calloc(sizeof(igt_pipe_t), display->n_pipes);
+	display->pipes = calloc(display->n_pipes, sizeof(igt_pipe_t));
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
 
 	for (i = 0; i < resources->count_crtcs; i++) {
@@ -2806,7 +2806,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	igt_assert(plane_resources);
 
 	display->n_planes = plane_resources->count_planes;
-	display->planes = calloc(sizeof(igt_plane_t), display->n_planes);
+	display->planes = calloc(display->n_planes, sizeof(igt_plane_t));
 	igt_assert_f(display->planes, "Failed to allocate memory for %d planes\n", display->n_planes);
 
 	for (i = 0; i < plane_resources->count_planes; ++i) {
@@ -2855,7 +2855,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		}
 
 		igt_assert_lt(0, n_planes);
-		pipe->planes = calloc(sizeof(igt_plane_t), n_planes);
+		pipe->planes = calloc(n_planes, sizeof(igt_plane_t));
 		igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n", n_planes);
 		last_plane = n_planes - 1;
 
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 4a54f92e0a40..f940973525b0 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -239,7 +239,7 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 			      num_disps > data->display.n_outputs,
 		      "ASIC does not have %d outputs/pipes\n", num_disps);
 
-	buf = calloc(sizeof(struct igt_fb), num_disps);
+	buf = calloc(num_disps, sizeof(struct igt_fb));
 	igt_assert_f(buf, "Failed to allocate memory\n");
 
 	/* For mode test, it is max number of modes for
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 05eeca593f87..a585e7e01d87 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -940,7 +940,7 @@ static void test_display_planes_random(chamelium_data_t *data,
 	overlay_planes_count = (rand() % overlay_planes_max) + 1;
 	igt_debug("Using %d overlay planes\n", overlay_planes_count);
 
-	overlay_fbs = calloc(sizeof(struct igt_fb), overlay_planes_count);
+	overlay_fbs = calloc(overlay_planes_count, sizeof(struct igt_fb));
 
 	for (i = 0; i < overlay_planes_count; i++) {
 		struct igt_fb *overlay_fb = &overlay_fbs[i];
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
index 0e9f78362401..6e5496166af3 100644
--- a/tests/intel/gem_exec_alignment.c
+++ b/tests/intel/gem_exec_alignment.c
@@ -201,7 +201,7 @@ naughty_child(int i915, int link, uint32_t shared, unsigned int flags)
 		flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	/* Fill the low-priority address space */
-	obj = calloc(sizeof(*obj), count);
+	obj = calloc(count, sizeof(*obj));
 	igt_assert(obj);
 
 	memset(&execbuf, 0, sizeof(execbuf));
@@ -406,7 +406,7 @@ setup_many(int i915, unsigned long *out)
 		count = file_max();
 	igt_require_memory(count, 4096, CHECK_RAM);
 
-	obj = calloc(sizeof(*obj), count);
+	obj = calloc(count, sizeof(*obj));
 	igt_assert(obj);
 
 	flags = 0;
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index c903b6eddb3c..e71fa2f0d6e8 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -1118,8 +1118,8 @@ static void deadline(int i915, const intel_ctx_cfg_t *cfg,
 		(frame_ns / 1000 / 1000 + 2) * switch_ns + parent_ns;
 	struct intel_execution_engine2 pe = pick_default(i915, cfg);
 	struct intel_execution_engine2 ve = pick_engine(i915, cfg, "vcs0");
-	struct drm_i915_gem_exec_fence *fences = calloc(sizeof(*fences), 32);
-	struct drm_i915_gem_exec_object2 *obj = calloc(sizeof(*obj), 32);
+	struct drm_i915_gem_exec_fence *fences = calloc(32, sizeof(*fences));
+	struct drm_i915_gem_exec_object2 *obj = calloc(32, sizeof(*obj));
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(obj),
 		.cliprects_ptr = to_user_pointer(fences),
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index 0df7319fced7..e01e5a8a7e31 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -150,7 +150,7 @@ _bo_write_verify(struct test *t)
 	igt_assert(t->tiling >= 0 && t->tiling <= I915_TILING_Y);
 	igt_assert_lt(0, t->num_surfaces);
 
-	s = calloc(sizeof(*s), t->num_surfaces);
+	s = calloc(t->num_surfaces, sizeof(*s));
 	igt_assert(s);
 
 	for (k = 0; k < t->num_surfaces; k++)
@@ -231,7 +231,7 @@ static int run_test(int threads_per_fence, void *f, int tiling,
 		 num_fences, tiling, surfaces_per_thread);
 
 	if (threads_per_fence) {
-		threads = calloc(sizeof(*threads), num_threads);
+		threads = calloc(num_threads, sizeof(*threads));
 		igt_assert(threads != NULL);
 
 		for (n = 0; n < num_threads; n++)
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index 9eb995f20230..e6a4651da88c 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -429,7 +429,7 @@ igt_main
 		mem_per_test = SIZE;
 		igt_require_memory(nchild + 1, mem_per_test, CHECK_RAM);
 
-		rcs = calloc(sizeof(*rcs), nchild);
+		rcs = calloc(nchild, sizeof(*rcs));
 		igt_assert(rcs);
 
 		fork_bcs_copy(30, 0x4000, bcs, 1);
@@ -456,7 +456,7 @@ igt_main
 		mem_per_test = SIZE + mem_per_ctx;
 		igt_require_memory(1 + nchild, mem_per_test, CHECK_RAM);
 
-		rcs = calloc(sizeof(*rcs), nchild);
+		rcs = calloc(nchild, sizeof(*rcs));
 		igt_assert(rcs);
 
 		fork_rcs_copy(30, 0x8000 / nchild, rcs, nchild, CREATE_CONTEXT);
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index 3c4b062b016d..4b49c2a3658c 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -149,7 +149,7 @@ static void run_test (int fd, int count)
 		igt_info("Using a snoop linear buffer for comparisons\n");
 	}
 
-	bufs = calloc(sizeof(*bufs), count);
+	bufs = calloc(count, sizeof(*bufs));
 	start_val = malloc(sizeof(*start_val)*count);
 
 	for (i = 0; i < count; i++) {
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index 51948db0c90e..66f2a9416c97 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -1430,7 +1430,7 @@ static void store_dword_rand(int i915, const intel_ctx_t *ctx,
 	batchsz = count * 16 + 4;
 	batchsz = ALIGN(batchsz, 4096);
 
-	reloc = calloc(sizeof(*reloc), count);
+	reloc = calloc(count, sizeof(*reloc));
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = target;
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index e8992790d31e..29dd8ac4e4e8 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -480,11 +480,11 @@ static void prepare_fencing(data_t *data, enum pipe pipe)
 	igt_require_sw_sync();
 
 	n_planes = data->display.pipes[pipe].n_planes;
-	timeline = calloc(sizeof(*timeline), n_planes);
+	timeline = calloc(n_planes, sizeof(*timeline));
 	igt_assert_f(timeline != NULL, "Failed to allocate memory for timelines\n");
-	thread = calloc(sizeof(*thread), n_planes);
+	thread = calloc(n_planes, sizeof(*thread));
 	igt_assert_f(thread != NULL, "Failed to allocate memory for thread\n");
-	seqno = calloc(sizeof(*seqno), n_planes);
+	seqno = calloc(n_planes, sizeof(*seqno));
 	igt_assert_f(seqno != NULL, "Failed to allocate memory for seqno\n");
 
 	for_each_plane_on_pipe(&data->display, pipe, plane)
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 3973ec862436..15c3b5ba275d 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -423,8 +423,8 @@ static void emit_fence_stress(struct test_output *o)
 	igt_require(bops);
 
 	igt_assert(num_fences);
-	bo = calloc(sizeof(*bo), num_fences);
-	exec = calloc(sizeof(*exec), num_fences+1);
+	bo = calloc(num_fences, sizeof(*bo));
+	exec = calloc(num_fences+1, sizeof(*exec));
 	for (i = 0; i < num_fences - 1; i++) {
 		uint32_t tiling = I915_TILING_X;
 		bo[i] = intel_buf_create(bops, 1024, 1024, 32, 0, tiling,
-- 
2.44.0

