Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4ACCD98F6
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 03:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758A410E43D;
	Mon, 22 Jun 2026 03:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1UdpjTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC8F10E43D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 03:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782100284; x=1813636284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HRiJNGgZC6gvf6m2AcgE3KyHo0CjexVjgem/f9w8Iis=;
 b=b1UdpjTLp1UXu1RmmEUXSe9+tmxI2R0hH/QKvkuJ6P20gklcosOh9C3C
 Xl3qKI22QWihkQkwi1Zr/X2qBbfoRSHP3++udCAP69Oi/CWxplGU7eow8
 rxO4dk6rXlxCL3KO1fnFh7ysohdMSeyX9tVHDBGWz71QODn28cAnOZwmL
 otdR/vUqyJWlsSAz6p97PkAarKY6A4vOi5kV5LBU9ImVty1ojdxRE1APU
 GZqAWvUMQTyQCGQkodat5sE8Yjxo7qz6K7ZWRvC01jtVv/V+nTp4TCqMF
 yjdIH1AIzx5npGLyopJxblhnIlhPykcfLmsCjNnnrGSU2IDU6FvuZvqrp g==;
X-CSE-ConnectionGUID: 55KdHyz/QsSUE2AW0A6KKg==
X-CSE-MsgGUID: tZ2Mxu1ERFOgMGgwbPqemQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82596512"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="82596512"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 20:51:23 -0700
X-CSE-ConnectionGUID: 2kbouv/pS6WFJXifeeefWg==
X-CSE-MsgGUID: 5zTv5Mi/TMK8mUyGcREYIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248964512"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 20:51:20 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 00/11] lib/genxml: Introduce Mesa genxml infrastructure to IGT
Date: Mon, 22 Jun 2026 05:50:55 +0200
Message-ID: <20260622035106.3023047-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently IGT uses raw intel_bb_out() calls for setting up the render /
compute pipelines. Fields are set by shifting and OR-ing hand-computed
constants, with field names and bit positions hardcoded and sometimes
explained in comments. A lot of code has branching based on generations,
making pipeline setup more complex as the new generations come in.

Meanwhile Mesa uses a system called genxml in which XML files describe GPU
commands, state objects, enums, and registers - specifying the field layout
down to individual bits. A Python generator then produces C headers with
typed structs, pack functions, and named constants for each command/state.

By bringing genxml to IGT, we can achieve a more maintainable and less
error-prone codebase. Instead of manually calculating bit positions and
creating complex branching logic, we can fill out the structs generated
from XML descriptions, and the packing functions will handle the bit
manipulation automatically.

This series brings Mesa's hardware XML command/state definitions and
gen_pack_header.py code generator into IGT, adds a new IGT-written
batch buffer decoder (gen_decode_header.py), and converts rendercopy_gen9
to use the generated pack headers.

Patches 1-4 import the generators, headers, and XML definitions.
gen_pack_header.py is taken from Mesa with C90 compliance fixes and a
new baseline deduplication mechanism - when a platform's command layout
matches any older generation exactly, the item is omitted entirely.
gen_decode_header.py is a new IGT-only file that generates per-platform
decoders for instructions, structs, and registers. The XML files are
imported from Mesa split by generation: gen4-gen8, gen9-gen12.5, and
Xe2/Xe3/Xe3p.

Patch 5 adds intel_buf_mocs() for packing an intel_buf's MOCS index and
PXP state into the 7-bit encoding expected by genxml MOCS fields.
Patch 6 adds intel_get_wb_mocs() and intel_get_uc_mocs() helpers for
callers that need packed write-back or uncached MOCS values directly.

Patches 7-10 convert rendercopy_gen9.c to use the generated pack headers,
replacing hand-written intel_bb_out() calls with igt_genxml_emit and
igt_genxml_pack_state, split by functional section.

Patch 11 adds an opt-in annotated batch dump to intel_bb_dump(): when
IGT_BB_ANNOTATE=1 is set a companion .annotated file is written alongside
the raw hex dump, decoding each command's field names and values.

Tested on LNL and DG2 (xe_render_copy render-square, render-full;
xe_intel_bb render) and TGL (gem_render_copy_redux; api_intel_bb).

v2:
 - Move genxml files to lib/intel/genxml/ (was lib/genxml/ in v1)
 - Split the single "import genxml" commit into infrastructure (patch 1)
   plus three XML import commits split by generation (patches 2-4)
 - Split the single rendercopy conversion into four commits by functional
   section (patches 6-9)
 - Fix MOCS bug: genxml packs a 7-bit field (index << 1 | pxp) but v1
   was passing the raw 6-bit index; add intel_get_wb_mocs() and
   intel_buf_mocs() helpers that return the correct 7-bit value (patch 5)
 - Add "why?" motivation text to patch 1 and this cover letter

v3:
 - Refresh local IGT-owned genxml files to 2026 and switch the small
   IGT-owned/Mesa-derived helper scripts to cleaner SPDX-style headers
 - Add igt_genxml_decode_batch_lines() helper so callers can route decoded
   output line-by-line to igt_info(), igt_warn(), igt_critical(), etc.
 - Remove redundant XML name checks in the generator scripts
 - Drop the NDEBUG guards from assertion-based validation in
   igt_genxml_defs.h, since IGT builds do not define NDEBUG
 - Make __gen_combine_address() merge low address bits with | instead of +
 - Add the complementary intel_get_uc_mocs() helper alongside
   intel_get_wb_mocs() in patch 5
 - Clarify in patch 5 that helper _mocs() functions are only for packed MOCS
   values
 - Move the new genxml decode include in intel_batchbuffer.c to the proper
   alphabetical position
 - Generate full per-generation genxml decode headers instead of using
   baseline-pruned delta tables, fixing mislabeled packets in decoded dumps
 - Genxml batch decoder falls back across compatible older packet
   definitions and expands variable-length payload groups, reducing UNKNOWN
   commands and improving annotation coverage on newer platforms

v4:
 - Relax the nonzero constraint on Xe2 RENDER_SURFACE_STATE.MOCS, since
   Defer-to-PAT uses MOCS index 0. This fixes the xe_pat render regression on
   BMG and LNL.

v5:
 - Split the old patch 5 into separate lib/intel_bufops and lib/mocs patches
 - Fix rendercopy conversion patches so that they build independently by 
   retaining gen9_render.h and xe2_render.h until no longer needed

Jan Maslak (11):
  lib/intel/genxml: Add genxml generators, headers, and build
    integration
  lib/intel/genxml: Import gen4-gen8 XML hardware definitions from Mesa
  lib/intel/genxml: Import gen9-gen12.5 XML hardware definitions from
    Mesa
  lib/intel/genxml: Import Xe2/Xe3/Xe3p XML hardware definitions from
    Mesa
  lib/intel_bufops: Add intel_buf_mocs() helper
  lib/mocs: Add packed MOCS helpers
  lib/rendercopy: Convert surface state and sampler setup to genxml
  lib/rendercopy: Convert vertex data and CC state to genxml
  lib/rendercopy: Convert pipeline emit commands to genxml
  lib/rendercopy: Convert render op and entry points to genxml
  lib: Add genxml annotated batch buffer decode

 lib/intel/genxml/gen110.xml           | 3358 ++++++++++++++++++++
 lib/intel/genxml/gen120.xml           | 2432 ++++++++++++++
 lib/intel/genxml/gen125.xml           | 2628 ++++++++++++++++
 lib/intel/genxml/gen40.xml            | 1012 ++++++
 lib/intel/genxml/gen45.xml            |  507 +++
 lib/intel/genxml/gen50.xml            |  648 ++++
 lib/intel/genxml/gen60.xml            | 2606 +++++++++++++++
 lib/intel/genxml/gen70.xml            | 3067 ++++++++++++++++++
 lib/intel/genxml/gen75.xml            | 2424 ++++++++++++++
 lib/intel/genxml/gen80.xml            | 2993 ++++++++++++++++++
 lib/intel/genxml/gen90.xml            | 4192 +++++++++++++++++++++++++
 lib/intel/genxml/gen_decode_header.py |  582 ++++
 lib/intel/genxml/gen_pack_header.py   |  795 +++++
 lib/intel/genxml/igt_genxml.h         |  112 +
 lib/intel/genxml/igt_genxml_decode.h  |  177 ++
 lib/intel/genxml/igt_genxml_defs.h    |  317 ++
 lib/intel/genxml/intel_genxml.py      |  553 ++++
 lib/intel/genxml/util.py              |   19 +
 lib/intel/genxml/xe2.xml              | 1969 ++++++++++++
 lib/intel/genxml/xe3.xml              |  816 +++++
 lib/intel/genxml/xe3p.xml             |    4 +
 lib/intel_batchbuffer.c               |   32 +-
 lib/intel_bufops.h                    |   13 +
 lib/intel_mocs.c                      |   28 +
 lib/intel_mocs.h                      |    2 +
 lib/meson.build                       |   62 +-
 lib/rendercopy_gen9.c                 | 1115 ++++---
 27 files changed, 31894 insertions(+), 569 deletions(-)
 create mode 100644 lib/intel/genxml/gen110.xml
 create mode 100644 lib/intel/genxml/gen120.xml
 create mode 100644 lib/intel/genxml/gen125.xml
 create mode 100644 lib/intel/genxml/gen40.xml
 create mode 100644 lib/intel/genxml/gen45.xml
 create mode 100644 lib/intel/genxml/gen50.xml
 create mode 100644 lib/intel/genxml/gen60.xml
 create mode 100644 lib/intel/genxml/gen70.xml
 create mode 100644 lib/intel/genxml/gen75.xml
 create mode 100644 lib/intel/genxml/gen80.xml
 create mode 100644 lib/intel/genxml/gen90.xml
 create mode 100644 lib/intel/genxml/gen_decode_header.py
 create mode 100644 lib/intel/genxml/gen_pack_header.py
 create mode 100644 lib/intel/genxml/igt_genxml.h
 create mode 100644 lib/intel/genxml/igt_genxml_decode.h
 create mode 100644 lib/intel/genxml/igt_genxml_defs.h
 create mode 100644 lib/intel/genxml/intel_genxml.py
 create mode 100644 lib/intel/genxml/util.py
 create mode 100644 lib/intel/genxml/xe2.xml
 create mode 100644 lib/intel/genxml/xe3.xml
 create mode 100644 lib/intel/genxml/xe3p.xml

-- 
2.43.0

