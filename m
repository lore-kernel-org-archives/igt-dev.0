Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50788F433CF
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 22:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DFC10E1FA;
	Wed, 15 Apr 2026 22:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1jc05um";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7DD10E1FA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 22:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776290852; x=1807826852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PdIb9NILjM58SGoW4W1Cd/IRqwirgS8GBia5aiwsV9Y=;
 b=U1jc05umll+iR8GoTMUzPSZqAoJusF4Y8H4L004udkV22tFKRuXY6AyD
 ayb3HMyP2F0kpzt8/wBltUlc9EH/RPJhxoSvxzrcwtZSd5omu+mXeBG8B
 /92MhLrw1IKqu5Cit5wkM/U11vNGYFyCOT+yTHCLUGUlOmj5G+vgYCCk6
 Xu9qMAoZKs+BWa70LlKQdBuLz7KOAkgCRzJW2MODfv3l13MNO4HGbnJRU
 20uNCRrBl2mC7QaI8RTi4M4pRP/u6/eRhOQKveZ/X/Wrebzqz4yz1mqmY
 ec/bykTJzyOF32+PKyOv/HF1k7wNann57QQKfeg836EAd0Rmt0sdkQ/y1 w==;
X-CSE-ConnectionGUID: LN4T5XgAS/u/3fyXkRuqkQ==
X-CSE-MsgGUID: wxiQlITkR1mSNlqfw0Lyxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77397162"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77397162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:31 -0700
X-CSE-ConnectionGUID: ILnaQD8JTT+MkMV10ev0DA==
X-CSE-MsgGUID: 6ligQS6vQI+823WmCYhEEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234926078"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 15:07:30 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 00/10] lib/genxml: Introduce Mesa genxml infrastructure to IGT
Date: Thu, 16 Apr 2026 00:07:10 +0200
Message-Id: <20260415220720.1594414-1-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Patch 5 adds intel_get_wb_mocs() and intel_buf_mocs() helpers that
return the correct 7-bit genxml MOCS field value.

Patches 6-9 convert rendercopy_gen9.c to use the generated pack headers,
replacing hand-written intel_bb_out() calls with igt_genxml_emit and
igt_genxml_pack_state, split by functional section.

Patch 10 adds an opt-in annotated batch dump to intel_bb_dump(): when
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

Jan Maslak (10):
  lib/intel/genxml: Add genxml generators, headers, and build
    integration
  lib/intel/genxml: Import gen4-gen8 XML hardware definitions from Mesa
  lib/intel/genxml: Import gen9-gen12.5 XML hardware definitions from
    Mesa
  lib/intel/genxml: Import Xe2/Xe3/Xe3p XML hardware definitions from
    Mesa
  lib/mocs: Add intel_get_wb_mocs() and intel_buf_mocs() for genxml MOCS
    fields
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
 lib/intel/genxml/gen_decode_header.py |  487 +++
 lib/intel/genxml/gen_pack_header.py   |  799 +++++
 lib/intel/genxml/igt_genxml.h         |  112 +
 lib/intel/genxml/igt_genxml_decode.h  |   60 +
 lib/intel/genxml/igt_genxml_defs.h    |  335 ++
 lib/intel/genxml/intel_genxml.py      |  553 ++++
 lib/intel/genxml/util.py              |   39 +
 lib/intel/genxml/xe2.xml              | 1969 ++++++++++++
 lib/intel/genxml/xe3.xml              |  816 +++++
 lib/intel/genxml/xe3p.xml             |    4 +
 lib/intel_batchbuffer.c               |   32 +-
 lib/intel_bufops.h                    |   13 +
 lib/intel_mocs.c                      |   14 +
 lib/intel_mocs.h                      |    1 +
 lib/meson.build                       |   65 +-
 lib/rendercopy_gen9.c                 | 1114 ++++---
 27 files changed, 31712 insertions(+), 568 deletions(-)
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
2.34.1

