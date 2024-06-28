Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A03DC2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 20:43:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C293010E1C1;
	Fri, 28 Jun 2024 20:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNhJTh/H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C9710E0A8
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 20:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719607433; x=1751143433;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+CupIQRNkNQ6JnPkuep8tOGMHxnbMhYitvIHRU++cpI=;
 b=bNhJTh/HyoDlOjza5o+ghL7EJHg/rWQOJoLLWdeHNBdWwMpuYAzy0Rgx
 3vt8yYGki0mdqR9verfoKsu2e22z40ljE6AnYnz+7uJKnxUGns4YHiER8
 RUW+ADYbbzpUnXBbjdeyaUdlJWyGqqwmhQ8qG1Ub+bNFDw78JMy8Gv10f
 C5BzNKHwPj7hCdyiTbr4/YAowvE0JKOd1k/9IOnC2+aYL3ZocvlkBbhTa
 neJWOxHNbjCg6eVCr38sjgeSLvzIUslZzJvXp+qdLD6OnKIkw+Lxn7D+t
 9A+o0JhBJ0AZIQBoDe4d20R5Lr4LlL+O/97iYFOAOPmu6SvzluVgG/f3/ g==;
X-CSE-ConnectionGUID: I4Z7TZWYQz6oQ2rc8RddLw==
X-CSE-MsgGUID: R66OrWhbQLuWVGvTgQZbjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27427477"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27427477"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:53 -0700
X-CSE-ConnectionGUID: wL7cdaMSS22OrIuaunuNeQ==
X-CSE-MsgGUID: 10D1VXWXRaWION53J+pkOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="49465189"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:43:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 00/16] Intel Xe OA IGT lib and tools
Date: Fri, 28 Jun 2024 13:43:32 -0700
Message-ID: <20240628204348.2142940-1-ashutosh.dixit@intel.com>
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

v2: Try to fix Gitlab.Pipeline failures with v1 (using to/from_user_pointer
    in intel_xe_perf_ioctl and xe_oa_prop_to_ext

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

