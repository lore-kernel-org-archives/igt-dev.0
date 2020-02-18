Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711B86E41D
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 22:56:26 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed, 19 Feb 2020 00:56:14 +0200
Message-Id: <20200218225620.668212-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/6] New performance recording/replay
 tools for i915-perf
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

A v2 with only minor changes suggested by Chris.

Cheers,

Lionel Landwerlin (6):
  lib/intel_chipset: identify Elkhart Lake
  lib: Add i915_perf library
  lib/i915-perf: Add support for loading perf configurations
  tools: add i915 perf recorder tool
  lib/i915-perf: add i915 perf data reader
  tools: add i915-perf-reader

 lib/i915-perf.pc.in                           |    11 +
 lib/i915/perf-configs/README.md               |   115 +
 lib/i915/perf-configs/codegen.py              |    33 +
 lib/i915/perf-configs/guids.xml               |   319 +
 lib/i915/perf-configs/mdapi-xml-convert.py    |  1006 +
 lib/i915/perf-configs/oa-bdw.xml              | 15653 ++++++++++++++++
 lib/i915/perf-configs/oa-bxt.xml              |  9595 ++++++++++
 lib/i915/perf-configs/oa-cflgt2.xml           | 10866 +++++++++++
 lib/i915/perf-configs/oa-cflgt3.xml           | 10933 +++++++++++
 lib/i915/perf-configs/oa-chv.xml              |  9757 ++++++++++
 lib/i915/perf-configs/oa-cnl.xml              | 10411 ++++++++++
 lib/i915/perf-configs/oa-glk.xml              |  9346 +++++++++
 lib/i915/perf-configs/oa-hsw.xml              |  4615 +++++
 lib/i915/perf-configs/oa-icl.xml              | 11869 ++++++++++++
 lib/i915/perf-configs/oa-kblgt2.xml           | 10866 +++++++++++
 lib/i915/perf-configs/oa-kblgt3.xml           | 10933 +++++++++++
 lib/i915/perf-configs/oa-lkf.xml              | 11803 ++++++++++++
 lib/i915/perf-configs/oa-sklgt2.xml           | 11895 ++++++++++++
 lib/i915/perf-configs/oa-sklgt3.xml           | 10933 +++++++++++
 lib/i915/perf-configs/oa-sklgt4.xml           | 10956 +++++++++++
 lib/i915/perf-configs/oa-tgl.xml              |  8491 +++++++++
 lib/i915/perf-configs/oa_guid_registry.py     |    73 +
 lib/i915/perf-configs/perf-codegen.py         |   850 +
 lib/i915/perf-configs/update-guids.py         |   231 +
 lib/i915/perf.c                               |   584 +
 lib/i915/perf.h                               |   240 +
 lib/i915/perf_data.h                          |   118 +
 lib/i915/perf_data_reader.c                   |   383 +
 lib/i915/perf_data_reader.h                   |   105 +
 lib/intel_chipset.h                           |     1 +
 lib/intel_device_info.c                       |     8 +-
 lib/meson.build                               |    68 +
 lib/tests/i915_perf_data_alignment.c          |    40 +
 lib/tests/meson.build                         |     1 +
 tools/i915-perf/i915_perf_configs.c           |   277 +
 tools/i915-perf/i915_perf_control.c           |   133 +
 tools/i915-perf/i915_perf_reader.c            |   279 +
 tools/i915-perf/i915_perf_recorder.c          |  1052 ++
 tools/i915-perf/i915_perf_recorder_commands.h |    39 +
 tools/i915-perf/meson.build                   |    22 +
 tools/meson.build                             |     1 +
 41 files changed, 174910 insertions(+), 1 deletion(-)
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
 create mode 100644 lib/i915/perf-configs/oa-lkf.xml
 create mode 100644 lib/i915/perf-configs/oa-sklgt2.xml
 create mode 100644 lib/i915/perf-configs/oa-sklgt3.xml
 create mode 100644 lib/i915/perf-configs/oa-sklgt4.xml
 create mode 100644 lib/i915/perf-configs/oa-tgl.xml
 create mode 100644 lib/i915/perf-configs/oa_guid_registry.py
 create mode 100755 lib/i915/perf-configs/perf-codegen.py
 create mode 100755 lib/i915/perf-configs/update-guids.py
 create mode 100644 lib/i915/perf.c
 create mode 100644 lib/i915/perf.h
 create mode 100644 lib/i915/perf_data.h
 create mode 100644 lib/i915/perf_data_reader.c
 create mode 100644 lib/i915/perf_data_reader.h
 create mode 100644 lib/tests/i915_perf_data_alignment.c
 create mode 100644 tools/i915-perf/i915_perf_configs.c
 create mode 100644 tools/i915-perf/i915_perf_control.c
 create mode 100644 tools/i915-perf/i915_perf_reader.c
 create mode 100644 tools/i915-perf/i915_perf_recorder.c
 create mode 100644 tools/i915-perf/i915_perf_recorder_commands.h
 create mode 100644 tools/i915-perf/meson.build

--
2.25.0
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
