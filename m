Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EBA6E497
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2020 11:17:02 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 28 Aug 2020 14:16:26 +0300
Message-Id: <20200828111634.147354-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/8] lib/i915/perf: Add new platform metrics
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

Hi all,

We have a couple of new platforms and those need new perf metrics.
This series also adds a few updates to the existing ones.

This isn't great to look at over email so head over here [1] to look at it.

Cheers,

[1] : https://gitlab.freedesktop.org/llandwerlin/igt-gpu-tools/-/commits/review/i915-perf-gen12-update

Lionel Landwerlin (8):
  lib/i915_perf: drop dependency on libigt
  lib/i915/perf: fixup converter script
  lib/i915/perf: small ICL equation refactor
  pciids/i915: break TGL into GT1/2
  lib/i915/perf: break TGL metrics in 2
  lib/i915/perf: add AsyncCompute metrics
  lib/i915/perf: Add Rocketlake metrics
  lib/i915/perf: Add DG1 metrics

 lib/Makefile.am                               |    22 +-
 lib/i915/perf-configs/guids.xml               |   133 +-
 lib/i915/perf-configs/mdapi-xml-convert.py    |     9 +-
 lib/i915/perf-configs/oa-bxt.xml              |   312 +-
 lib/i915/perf-configs/oa-cflgt2.xml           |   312 +-
 lib/i915/perf-configs/oa-cflgt3.xml           |   312 +-
 lib/i915/perf-configs/oa-dg1.xml              | 10755 ++++++++++++++++
 lib/i915/perf-configs/oa-icl.xml              |   348 +-
 lib/i915/perf-configs/oa-kblgt2.xml           |   312 +-
 lib/i915/perf-configs/oa-kblgt3.xml           |   312 +-
 lib/i915/perf-configs/oa-rkl.xml              |  8520 ++++++++++++
 lib/i915/perf-configs/oa-sklgt2.xml           |   312 +-
 lib/i915/perf-configs/oa-sklgt3.xml           |   312 +-
 lib/i915/perf-configs/oa-sklgt4.xml           |   312 +-
 lib/i915/perf-configs/oa-tglgt1.xml           |  8560 ++++++++++++
 .../{oa-tgl.xml => oa-tglgt2.xml}             |   252 +-
 lib/i915/perf-configs/oa_guid_registry.py     |    10 +
 lib/i915/perf-configs/update-guids.py         |     2 +-
 lib/i915/perf.c                               |    20 +-
 lib/i915_pciids.h                             |    14 +-
 lib/intel_device_info.c                       |    15 +-
 lib/meson.build                               |     4 +-
 22 files changed, 30986 insertions(+), 174 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-dg1.xml
 create mode 100644 lib/i915/perf-configs/oa-rkl.xml
 create mode 100644 lib/i915/perf-configs/oa-tglgt1.xml
 rename lib/i915/perf-configs/{oa-tgl.xml => oa-tglgt2.xml} (98%)

--
2.28.0
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
