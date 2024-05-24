Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6657C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 03:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB1D10E046;
	Fri, 24 May 2024 03:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKjBm/J/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF39110E046
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 03:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520489; x=1748056489;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jZoYseYLwovsaLoSjk/p3L2UW3wRJdFXFvh9mV7dxxw=;
 b=KKjBm/J/fTX00CeorRcW4WzCfAkkXOJgkc+bZm1YDK1y5rVqMd0Pe3uK
 tIPUTbYVp3E8a2nVMUrI2U5fBn0Ghzedr3mjXBl2I4PcHA89uGblkTVtm
 AiEm/KQDusOfaR/FsUPSJV+w8UJsmn1hckbKDGafEer7NnVHENjYen5rh
 3HWFt88xoiEIUSw38JsyhuKFZ2dmla9z9eLyjPZtWx6ly9Tecirn0GP69
 NiijN/bvUIYSEu2rZuX0cH9r7lt5xa9b1OywmlrOJYapt/K93YAdP5dpw
 bw3MFXR5fkb98+5aOngoz7KVJ1DqOx5RE5VfgrZyCBZFdbQ4rgwkW1ZWy g==;
X-CSE-ConnectionGUID: pAidkltxQ8eaZn1R9v32UQ==
X-CSE-MsgGUID: hqd24EwsQoauV+T2a1rgIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30384620"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="30384620"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:48 -0700
X-CSE-ConnectionGUID: ZWt/hLRzRPukbgpSFzYyRg==
X-CSE-MsgGUID: LMhyfJV0QYyicBwLjuLSyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34413509"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/23] Intel Xe OA IGT's
Date: Thu, 23 May 2024 20:14:16 -0700
Message-ID: <20240524031439.106332-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

This series adds OA IGT's for Intel Xe KMD. These tests are for the kernel
series posted here:

https://patchwork.freedesktop.org/series/121084/

This series is also available at:

https://gitlab.freedesktop.org/adixit/igt-gpu-tools/-/tree/xe-oa

Gpuvis pull request "Add support for perf traces from Intel Xe driver" is
based on IGT lib changes included here:

https://github.com/mikesart/gpuvis/pull/86

Ashutosh Dixit (23):
  lib/xe/oa: Import OA metric generation files from i915
  lib/xe/oa: Add LNL metric guids
  lib/xe/oa: Add OA LNL metrics (oa_lnl.xml)
  lib/xe/oa: Add truncated legacy Xe1 metrics XML's
  lib/xe/oa: Generate LNL metrics/registers files
  lib/xe/oa: Switch generated files to Xe namespace
  drm-uapi/xe: Sync with Perf/OA changes
  lib/xe: Complete xe_oa lib functionality
  tests/intel/xe_query: Add OA units query test
  tests/intel/xe_oa: Add first tests
  tests/intel/xe_oa: Add some negative tests
  tests/intel/xe_oa: Add "oa-formats" subtest
  tests/intel/xe_oa: Add oa exponent tests
  tests/intel/xe_oa: buffer-fill, non-zero-reason, enable-disable
  tests/intel/xe_oa: blocking and polling tests
  tests/intel/xe_oa: OAR/OAC tests
  tests/intel/xe_oa: Exclusive/concurrent access, rc6 and stress open
    close
  tests/intel/xe_oa: add remove OA config tests
  tests/intel/xe_oa: OA buffer mmap tests
  tests/intel/xe_oa: Register whitelisting and MMIO trigger tests
  ib/xe/oa: Add xe_oa_data_reader to IGT lib
  tools/xe-perf: Add xe_perf_recorder
  tools/xe-perf: xe_perf_reader, xe_perf_control and xe_perf_configs

 include/drm-uapi/xe_drm.h                 |  291 ++
 lib/intel_device_info.c                   |    1 +
 lib/meson.build                           |   89 +
 lib/xe-oa.pc.in                           |   11 +
 lib/xe/oa-configs/README.md               |  115 +
 lib/xe/oa-configs/codegen.py              |  444 ++
 lib/xe/oa-configs/guids.xml               | 2763 ++++++++++++
 lib/xe/oa-configs/mdapi-xml-convert.py    | 1221 +++++
 lib/xe/oa-configs/oa-acmgt1.xml           |  710 +++
 lib/xe/oa-configs/oa-acmgt2.xml           |  828 ++++
 lib/xe/oa-configs/oa-acmgt3.xml           |  824 ++++
 lib/xe/oa-configs/oa-adl.xml              |  816 ++++
 lib/xe/oa-configs/oa-dg1.xml              |  823 ++++
 lib/xe/oa-configs/oa-equations-codegen.py |  261 ++
 lib/xe/oa-configs/oa-lnl.xml              | 2799 ++++++++++++
 lib/xe/oa-configs/oa-metricset-codegen.py |  270 ++
 lib/xe/oa-configs/oa-mtlgt2.xml           |  789 ++++
 lib/xe/oa-configs/oa-mtlgt3.xml           |  803 ++++
 lib/xe/oa-configs/oa-registers-codegen.py |  118 +
 lib/xe/oa-configs/oa-rkl.xml              |  824 ++++
 lib/xe/oa-configs/oa-tglgt1.xml           |  819 ++++
 lib/xe/oa-configs/oa-tglgt2.xml           |  818 ++++
 lib/xe/oa-configs/oa_guid_registry.py     |  131 +
 lib/xe/oa-configs/update-guids.py         |  223 +
 lib/xe/xe_oa.c                            | 1072 +++++
 lib/xe/xe_oa.h                            |  407 ++
 lib/xe/xe_oa_data.h                       |  101 +
 lib/xe/xe_oa_data_reader.c                |  369 ++
 lib/xe/xe_oa_data_reader.h                |   87 +
 lib/xe/xe_query.c                         |   38 +
 lib/xe/xe_query.h                         |    5 +
 tests/intel/xe_oa.c                       | 4902 +++++++++++++++++++++
 tests/intel/xe_query.c                    |   53 +
 tests/meson.build                         |    2 +
 tools/meson.build                         |    1 +
 tools/xe-perf/meson.build                 |   22 +
 tools/xe-perf/xe_perf_configs.c           |  247 ++
 tools/xe-perf/xe_perf_control.c           |  117 +
 tools/xe-perf/xe_perf_reader.c            |  325 ++
 tools/xe-perf/xe_perf_recorder.c          | 1227 ++++++
 tools/xe-perf/xe_perf_recorder_commands.h |   31 +
 41 files changed, 25797 insertions(+)
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
 create mode 100644 tests/intel/xe_oa.c
 create mode 100644 tools/xe-perf/meson.build
 create mode 100644 tools/xe-perf/xe_perf_configs.c
 create mode 100644 tools/xe-perf/xe_perf_control.c
 create mode 100644 tools/xe-perf/xe_perf_reader.c
 create mode 100644 tools/xe-perf/xe_perf_recorder.c
 create mode 100644 tools/xe-perf/xe_perf_recorder_commands.h

-- 
2.41.0

