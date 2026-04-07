Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2F4FEEF34
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 13:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E84310E41B;
	Tue,  7 Apr 2026 13:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMAkn5HH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C62710E097
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775568390; x=1807104390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xeHWoYM2qAF1qoupgW0v+D/NHdB2fQGOzbe6nqvEKcw=;
 b=lMAkn5HHAR0V/xEzyXI0zhDJZCEkq+DxSk8hCI47hgIYVcmiNoz42CjX
 tzEda1z8C29TP+A1pE1WrguTq91j29xzyVGqMXMy3TaXgDPcc+REmKfnx
 aYLcIzGTqHLByH+29vs+L0n7WjnMmjQOp74jJa5YTI830vR1Httq7avFe
 LoeJPG+8nDL/xQzVpPHSswAC31QtEeSTmMkBhrRZs7XxSY+OPbVFd6yJs
 /3I78nRWinplsn0rZ0143az1i2DxVNGcxrsctfTvgxTWxe9Oi7nF4NuH0
 TNP/LjwdelVc1p6c90ZTsRyi7eIn1o2LCWGQj62IfXmGiSeVumRRfyAnn w==;
X-CSE-ConnectionGUID: mXXlS9peTkSLPSG4psjuUw==
X-CSE-MsgGUID: ecEvxdohQSKF9OPSr5WcjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76425607"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76425607"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 06:26:29 -0700
X-CSE-ConnectionGUID: W2MQqgxmQ1Gi6yJKds/jmg==
X-CSE-MsgGUID: Fae1ldDnRs6NrJ9STp0zDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="224983878"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 06:26:29 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/3] lib/genxml: Introduce Mesa genxml infrastructure to IGT
Date: Tue,  7 Apr 2026 15:26:17 +0200
Message-Id: <20260407132620.1397340-1-jan.maslak@intel.com>
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

This series brings Mesa's hardware XML command/state definitions and
gen_pack_header.py code generator into IGT, adds a new IGT-written
batch buffer decoder (gen_decode_header.py), and converts rendercopy_gen9
to use the generated pack headers.

Patch 1 imports the XML definitions and generators. gen_pack_header.py
is taken from Mesa with C90 compliance fixes and a new baseline
deduplication mechanism - when a platform's command layout matches any
older generation exactly, the item is omitted entirely.
gen_decode_header.py is a new IGT-only file that generates per-platform
decoders for instructions, structs, and registers.

Patch 2 converts rendercopy_gen9.c to use the generated pack headers,
replacing hand-written struct assignments and intel_bb_out() calls with
igt_genxml_emit and igt_genxml_pack_state.

Patch 3 adds an opt-in annotated batch dump to intel_bb_dump(): when
IGT_BB_ANNOTATE=1 is set a companion .annotated file is written alongside
the raw hex dump, decoding each command's field names and values.

Tested on LNL and DG2 (xe_render_copy render-square, render-full;
xe_intel_bb render) and TGL (gem_render_copy_redux; api_intel_bb).

Signed-off-by: Jan Maslak <jan.maslak@intel.com>

Jan Maslak (3):
  lib/genxml: Import genxml definitions and generators from Mesa
  lib/rendercopy: Convert rendercopy_gen9 to use genxml pack headers
  lib: Add genxml annotated batch buffer decode

 lib/genxml/gen110.xml           | 3358 +++++++++++++++++++++++++
 lib/genxml/gen120.xml           | 2432 ++++++++++++++++++
 lib/genxml/gen125.xml           | 2628 +++++++++++++++++++
 lib/genxml/gen40.xml            | 1012 ++++++++
 lib/genxml/gen45.xml            |  507 ++++
 lib/genxml/gen50.xml            |  648 +++++
 lib/genxml/gen60.xml            | 2606 +++++++++++++++++++
 lib/genxml/gen70.xml            | 3067 ++++++++++++++++++++++
 lib/genxml/gen75.xml            | 2424 ++++++++++++++++++
 lib/genxml/gen80.xml            | 2993 ++++++++++++++++++++++
 lib/genxml/gen90.xml            | 4192 +++++++++++++++++++++++++++++++
 lib/genxml/gen_decode_header.py |  487 ++++
 lib/genxml/gen_pack_header.py   |  799 ++++++
 lib/genxml/igt_genxml.h         |  112 +
 lib/genxml/igt_genxml_decode.h  |   60 +
 lib/genxml/igt_genxml_defs.h    |  335 +++
 lib/genxml/intel_genxml.py      |  553 ++++
 lib/genxml/util.py              |   39 +
 lib/genxml/xe2.xml              | 1969 +++++++++++++++
 lib/genxml/xe3.xml              |  816 ++++++
 lib/genxml/xe3p.xml             |    4 +
 lib/intel_batchbuffer.c         |   32 +-
 lib/meson.build                 |   65 +-
 lib/rendercopy_gen9.c           | 1117 ++++----
 24 files changed, 31687 insertions(+), 568 deletions(-)
 create mode 100644 lib/genxml/gen110.xml
 create mode 100644 lib/genxml/gen120.xml
 create mode 100644 lib/genxml/gen125.xml
 create mode 100644 lib/genxml/gen40.xml
 create mode 100644 lib/genxml/gen45.xml
 create mode 100644 lib/genxml/gen50.xml
 create mode 100644 lib/genxml/gen60.xml
 create mode 100644 lib/genxml/gen70.xml
 create mode 100644 lib/genxml/gen75.xml
 create mode 100644 lib/genxml/gen80.xml
 create mode 100644 lib/genxml/gen90.xml
 create mode 100644 lib/genxml/gen_decode_header.py
 create mode 100644 lib/genxml/gen_pack_header.py
 create mode 100644 lib/genxml/igt_genxml.h
 create mode 100644 lib/genxml/igt_genxml_decode.h
 create mode 100644 lib/genxml/igt_genxml_defs.h
 create mode 100644 lib/genxml/intel_genxml.py
 create mode 100644 lib/genxml/util.py
 create mode 100644 lib/genxml/xe2.xml
 create mode 100644 lib/genxml/xe3.xml
 create mode 100644 lib/genxml/xe3p.xml

-- 
2.34.1

