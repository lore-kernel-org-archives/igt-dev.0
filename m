Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B52910E110
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 01:05:34 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Nov 2022 17:05:20 -0800
Message-Id: <20221129010522.994524-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add OA support for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add OA MTL metrics support and enable OA tests for MTL.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Lionel Landwerlin (1):
  lib/i915: add MTL performance metrics

Umesh Nerlige Ramappa (1):
  i915/perf: Enable MTL OA tests

 lib/i915/perf-configs/guids.xml               |   400 +
 lib/i915/perf-configs/mdapi-xml-convert.py    |     3 +-
 lib/i915/perf-configs/oa-mtlgt2.xml           | 30844 +++++++++
 lib/i915/perf-configs/oa-mtlgt3.xml           | 52917 ++++++++++++++++
 .../perf-configs/perf-metricset-codegen.py    |     2 +-
 lib/i915/perf-configs/update-guids.py         |     1 +
 lib/i915/perf.c                               |    44 +
 lib/i915_pciids.h                             |     9 +-
 lib/meson.build                               |     1 +
 tests/i915/perf.c                             |    12 +-
 10 files changed, 84223 insertions(+), 10 deletions(-)
 create mode 100644 lib/i915/perf-configs/oa-mtlgt2.xml
 create mode 100644 lib/i915/perf-configs/oa-mtlgt3.xml

-- 
2.36.1
