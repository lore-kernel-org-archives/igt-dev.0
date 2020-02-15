Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68756E89E
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2020 01:11:15 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Fri, 14 Feb 2020 17:11:11 -0800
Message-Id: <20200215011115.5838-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] Add perf OA tools for GPUvis
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Joonas Lahtinen <joonas.lahtinen@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The tools provided here enable capturing performance metrics from the i915
driver and are used in conjunction with the GPUvis software here - 

https://github.com/mikesart/gpuvis

The changes required in GPUvis are wip and will be posted following the merge of
these tools.

For more information, view tools/i915-perf/README in this patch series

Lionel Landwerlin (4):
  lib/i915/perf: Add i915_perf library
  lib/i915/perf: Add support for loading perf configurations
  tools/i915/perf: Add i915 perf recorder tool
  lib/i915/perf: Add i915 perf data reader

 lib/i915-perf.pc.in                           |    10 +
 lib/i915/perf-configs/README.md               |   115 +
 lib/i915/perf-configs/codegen.py              |    33 +
 lib/i915/perf-configs/guids.xml               |   282 +
 lib/i915/perf-configs/mdapi-xml-convert.py    |  1000 +
 lib/i915/perf-configs/oa-bdw.xml              | 15653 ++++++++++++++++
 lib/i915/perf-configs/oa-bxt.xml              |  9595 ++++++++++
 lib/i915/perf-configs/oa-cflgt2.xml           | 10866 +++++++++++
 lib/i915/perf-configs/oa-cflgt3.xml           | 10933 +++++++++++
 lib/i915/perf-configs/oa-chv.xml              |  9757 ++++++++++
 lib/i915/perf-configs/oa-cnl.xml              | 10411 ++++++++++
 lib/i915/perf-configs/oa-glk.xml              |  9346 +++++++++
 lib/i915/perf-configs/oa-hsw.xml              |  4615 +++++
 lib/i915/perf-configs/oa-icl.xml              | 11899 ++++++++++++
 lib/i915/perf-configs/oa-kblgt2.xml           | 10866 +++++++++++
 lib/i915/perf-configs/oa-kblgt3.xml           | 10933 +++++++++++
 lib/i915/perf-configs/oa-sklgt2.xml           | 11895 ++++++++++++
 lib/i915/perf-configs/oa-sklgt3.xml           | 10933 +++++++++++
 lib/i915/perf-configs/oa-sklgt4.xml           | 10956 +++++++++++
 lib/i915/perf-configs/perf-codegen.py         |   854 +
 lib/i915/perf-configs/update-guids.py         |   230 +
 lib/i915/perf.c                               |   332 +
 lib/i915/perf.h                               |   240 +
 lib/i915/perf_data.h                          |    88 +
 lib/i915/perf_data_reader.c                   |   330 +
 lib/i915/perf_data_reader.h                   |   103 +
 lib/meson.build                               |    67 +
 tools/i915-perf/README                        |    70 +
 tools/i915-perf/i915_perf_configs.c           |   277 +
 tools/i915-perf/i915_perf_control.c           |   133 +
 tools/i915-perf/i915_perf_recorder.c          |   931 +
 tools/i915-perf/i915_perf_recorder_commands.h |    39 +
 tools/i915-perf/meson.build                   |    17 +
 tools/meson.build                             |     1 +
 34 files changed, 153810 insertions(+)
 create mode 100644 lib/i915-perf.pc.in
 create mode 100644 lib/i915/perf-configs/README.md
 create mode 100644 lib/i915/perf-configs/codegen.py
 create mode 100644 lib/i915/perf-configs/guids.xml
 create mode 100755 lib/i915/perf-configs/mdapi-xml-convert.py
 create mode 100644 lib/i915/perf-configs/oa-bdw.xml
 create mode 100644 lib/i915/perf-configs/oa-bxt.xml
 create mode 100644 lib/i915/perf-configs/oa-cflgt2.xml
 create mode 100644 lib/i915/perf-configs/oa-cflgt3.xml
 create mode 100644 lib/i915/perf-configs/oa-chv.xml
 create mode 100644 lib/i915/perf-configs/oa-cnl.xml
 create mode 100644 lib/i915/perf-configs/oa-glk.xml
 create mode 100644 lib/i915/perf-configs/oa-hsw.xml
 create mode 100644 lib/i915/perf-configs/oa-icl.xml
 create mode 100644 lib/i915/perf-configs/oa-kblgt2.xml
 create mode 100644 lib/i915/perf-configs/oa-kblgt3.xml
 create mode 100644 lib/i915/perf-configs/oa-sklgt2.xml
 create mode 100644 lib/i915/perf-configs/oa-sklgt3.xml
 create mode 100644 lib/i915/perf-configs/oa-sklgt4.xml
 create mode 100755 lib/i915/perf-configs/perf-codegen.py
 create mode 100755 lib/i915/perf-configs/update-guids.py
 create mode 100644 lib/i915/perf.c
 create mode 100644 lib/i915/perf.h
 create mode 100644 lib/i915/perf_data.h
 create mode 100644 lib/i915/perf_data_reader.c
 create mode 100644 lib/i915/perf_data_reader.h
 create mode 100644 tools/i915-perf/README
 create mode 100644 tools/i915-perf/i915_perf_configs.c
 create mode 100644 tools/i915-perf/i915_perf_control.c
 create mode 100644 tools/i915-perf/i915_perf_recorder.c
 create mode 100644 tools/i915-perf/i915_perf_recorder_commands.h
 create mode 100644 tools/i915-perf/meson.build

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
