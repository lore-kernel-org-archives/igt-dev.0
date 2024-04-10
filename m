Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CEECD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 14:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2992510EC7D;
	Wed, 10 Apr 2024 14:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8imaq6g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B3210EC85
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712760234; x=1744296234;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=qtmGo73tdugryxCdsbhGsSgqsDkhiuEGsYnaiPVG9VY=;
 b=D8imaq6gdVPutAXF+zV+tMOKZdfzEyDM7kdE8stPVjyQqTk5lnWTlvim
 2vVD3sjhE+XpSoJ+1gaeDASQnkTnYcCb4SajTQSoCSITsz0xj5XDev2jD
 fKjatHdF8rBIJHJX6EIbfb/RmbsrjZnDVrlnBDpHRDr6lrw4vIGt2jncI
 MC4r9+lbNgMpZjrDWYyAJVVhy3KO5K0AqWZ6MdqWsvcwVLjBUHjI+edlK
 RtxfjIqwzswmfop9Njm01RLQsZrPjX6CksAsHomiXEvdLZoZ69PbOh05Z
 2iwjFRRrYB52qk8sI3IH/D96WUae74VPLDREEhgsUZwUZkl7aWCF0uIBU g==;
X-CSE-ConnectionGUID: 0EuzU+WDSLSnIYEM3D3Mcw==
X-CSE-MsgGUID: yVuB+n6sRyyrwezRED3EVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8301094"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8301094"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
X-CSE-ConnectionGUID: IP8SrLP+QSyxvm4oS3P5Aw==
X-CSE-MsgGUID: hYi0ZnTRRfat+SSd4/O/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="21009419"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
Received: from linux.intel.com (unknown [10.245.244.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CC97020B8D40
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 07:43:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1ruZAa-00000000Bf8-3ZgL for igt-dev@lists.freedesktop.org;
 Wed, 10 Apr 2024 16:43:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/4] benchmarks: fix calloc calls with inverted
 arguments
Date: Wed, 10 Apr 2024 16:42:35 +0200
Message-ID: <20240410144321.44766-2-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
References: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
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
            for ln, line in enumerate(fp):
                if ln + 1 == line_number:
                    new_line = calloc.sub(r"\1\3, \2\4", line)
                    if new_line != line:
                        line = new_line
                    else:
                        print(f"{fname}, line {line_number}: FAILED: {line.strip()}")
                new += line
        with open(fname, 'w', encoding = 'utf8') as fp:
            fp.write(new)

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 benchmarks/gem_exec_reloc.c | 6 +++---
 benchmarks/gem_latency.c    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

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
-- 
2.44.0

