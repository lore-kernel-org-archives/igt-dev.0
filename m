Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2FDC30659
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 20:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6626410E269;
	Wed, 26 Jun 2024 20:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViJYqVmV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543D910E15D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719435290; x=1750971290;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QTcEEddMC3WNJ4j/DtyFGgPvrxXMTdTVHdEUpv1R7ec=;
 b=ViJYqVmV/4Va0XCQrf3e7cQFHTtx+jTnEVUJY0j+VoFrRgLXimn5U/i6
 F94WCZ6ioajdN/5HFyengCORmUdn3Fj8lHNsUNL2IiSkhIuHZu+GwR92v
 6YXFHc87gC1iBtOJ+bw941zHEeo7pPoeEti2KI/zRnpyDSLo+MuMVxlfK
 otUKr6u2xUeS4ixlVPDS0OaFEuH4f5r6hSETtbs1fTtWX6FxTrnYbdyb+
 q3RtkJjVGWOujPRZILUvQdYDecwX9kpzcKcCnH+Qwri4Fg9jQOTGt9mmS
 3vR7tZbbJGWpwlj4fTmiyQrzqRMpQvD/Vf4KkD1XVVDzfCgOlB1RMRtSZ g==;
X-CSE-ConnectionGUID: mjSC2Cg4Tvir8OiTjWSGwg==
X-CSE-MsgGUID: cEjNIY5nSguhVjpeumL9SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27670984"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="27670984"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:54:49 -0700
X-CSE-ConnectionGUID: oh6dLsqcQty5Tgm9OPPrlw==
X-CSE-MsgGUID: FFcFvWawTgObGntiazgV5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="44018908"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:54:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/16] Intel Xe OA IGT lib and tools
Date: Wed, 26 Jun 2024 13:54:27 -0700
Message-ID: <20240626205443.1560171-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Originally posted as part of
https://patchwork.freedesktop.org/series/130033/, separate out the IGT lib
and tools and try to merge these first, before merging the OA IGT's so that
we have some more time to review the tests before merging.

Gpuvis support for perf traces from Intel Xe driver is based on tools and
IGT lib changes included here.

All patches here have R-b without any outstanding issues.

Ashutosh Dixit (12):
  lib/xe/oa: Import OA metric generation files from i915
  lib/xe/oa: Add LNL metric guids
  lib/xe/oa: Add OA LNL metrics (oa_lnl.xml)
  lib/xe/oa: Add truncated legacy Xe1 metrics XML's
  lib/xe/oa: Generate LNL metrics/registers files
  lib/xe/oa: Switch generated files to Xe namespace
  drm-uapi/xe: Sync with Perf/OA changes
  lib/xe: Complete xe_oa lib functionality
  tests/intel/xe_query: Add OA units query test
  lib/xe/oa: Add xe_oa_data_reader to IGT lib
  tools/xe-perf: Add xe_perf_recorder
  tools/xe-perf: xe_perf_reader, xe_perf_control and xe_perf_configs

José Roberto de Souza (4):
  xe/oa: Fix invalid escape warnings
  xe/oa/mdapi-xml-convert: Add support for 576B_PEC64LL format
  xe/oa: Regenerate oa-lnl.xml now parsing all counters
  xe/oa/oa-metricset-codegen: Fix XE_OA_FORMAT_PEC64u64 offsets

 include/drm-uapi/xe_drm.h                 |  308 +
 lib/intel_device_info.c                   |    1 +
 lib/meson.build                           |   89 +
 lib/xe-oa.pc.in                           |   11 +
 lib/xe/oa-configs/README.md               |  115 +
 lib/xe/oa-configs/codegen.py              |  449 ++
 lib/xe/oa-configs/guids.xml               | 2763 ++++++++
 lib/xe/oa-configs/mdapi-xml-convert.py    | 1267 ++++
 lib/xe/oa-configs/oa-acmgt1.xml           |  710 +++
 lib/xe/oa-configs/oa-acmgt2.xml           |  828 +++
 lib/xe/oa-configs/oa-acmgt3.xml           |  824 +++
 lib/xe/oa-configs/oa-adl.xml              |  816 +++
 lib/xe/oa-configs/oa-dg1.xml              |  823 +++
 lib/xe/oa-configs/oa-equations-codegen.py |  261 +
 lib/xe/oa-configs/oa-lnl.xml              | 6984 +++++++++++++++++++++
 lib/xe/oa-configs/oa-metricset-codegen.py |  266 +
 lib/xe/oa-configs/oa-mtlgt2.xml           |  789 +++
 lib/xe/oa-configs/oa-mtlgt3.xml           |  803 +++
 lib/xe/oa-configs/oa-registers-codegen.py |  118 +
 lib/xe/oa-configs/oa-rkl.xml              |  824 +++
 lib/xe/oa-configs/oa-tglgt1.xml           |  819 +++
 lib/xe/oa-configs/oa-tglgt2.xml           |  818 +++
 lib/xe/oa-configs/oa_guid_registry.py     |  119 +
 lib/xe/oa-configs/update-guids.py         |  223 +
 lib/xe/xe_oa.c                            | 1074 ++++
 lib/xe/xe_oa.h                            |  408 ++
 lib/xe/xe_oa_data.h                       |  101 +
 lib/xe/xe_oa_data_reader.c                |  369 ++
 lib/xe/xe_oa_data_reader.h                |   87 +
 lib/xe/xe_query.c                         |   38 +
 lib/xe/xe_query.h                         |    5 +
 tests/intel/xe_query.c                    |   53 +
 tools/meson.build                         |    1 +
 tools/xe-perf/meson.build                 |   22 +
 tools/xe-perf/xe_perf_configs.c           |  247 +
 tools/xe-perf/xe_perf_control.c           |  117 +
 tools/xe-perf/xe_perf_reader.c            |  325 +
 tools/xe-perf/xe_perf_recorder.c          | 1227 ++++
 tools/xe-perf/xe_perf_recorder_commands.h |   31 +
 39 files changed, 25133 insertions(+)
 create mode 100644 lib/xe-oa.pc.in
 create mode 100644 lib/xe/oa-configs/README.md
 create mode 100644 lib/xe/oa-configs/codegen.py
 create mode 100644 lib/xe/oa-configs/guids.xml
 create mode 100755 lib/xe/oa-configs/mdapi-xml-convert.py
 create mode 100644 lib/xe/oa-configs/oa-acmgt1.xml
 create mode 100644 lib/xe/oa-configs/oa-acmgt2.xml
 create mode 100644 lib/xe/oa-configs/oa-acmgt3.xml
 create mode 100644 lib/xe/oa-configs/oa-adl.xml
 create mode 100644 lib/xe/oa-configs/oa-dg1.xml
 create mode 100644 lib/xe/oa-configs/oa-equations-codegen.py
 create mode 100644 lib/xe/oa-configs/oa-lnl.xml
 create mode 100644 lib/xe/oa-configs/oa-metricset-codegen.py
 create mode 100644 lib/xe/oa-configs/oa-mtlgt2.xml
 create mode 100644 lib/xe/oa-configs/oa-mtlgt3.xml
 create mode 100644 lib/xe/oa-configs/oa-registers-codegen.py
 create mode 100644 lib/xe/oa-configs/oa-rkl.xml
 create mode 100644 lib/xe/oa-configs/oa-tglgt1.xml
 create mode 100644 lib/xe/oa-configs/oa-tglgt2.xml
 create mode 100644 lib/xe/oa-configs/oa_guid_registry.py
 create mode 100755 lib/xe/oa-configs/update-guids.py
 create mode 100644 lib/xe/xe_oa.c
 create mode 100644 lib/xe/xe_oa.h
 create mode 100644 lib/xe/xe_oa_data.h
 create mode 100644 lib/xe/xe_oa_data_reader.c
 create mode 100644 lib/xe/xe_oa_data_reader.h
 create mode 100644 tools/xe-perf/meson.build
 create mode 100644 tools/xe-perf/xe_perf_configs.c
 create mode 100644 tools/xe-perf/xe_perf_control.c
 create mode 100644 tools/xe-perf/xe_perf_reader.c
 create mode 100644 tools/xe-perf/xe_perf_recorder.c
 create mode 100644 tools/xe-perf/xe_perf_recorder_commands.h

-- 
2.41.0

