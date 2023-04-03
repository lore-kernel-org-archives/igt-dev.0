Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2C410E00A
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 17:48:04 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Apr 2023 20:47:57 +0300
Message-Id: <20230403174800.19621-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] lib/i915/perf: Speed up the build
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The perf xml stuff generates terrible C code that is giving
gcc a big headache and leading to disgustingly long build 
times. Try to generate a bit more sensible code to speed
up the build.

Total build time change for the series:
$ ninja -Cbuild  clean
$ time ninja -Cbuild 
 ADL (4+8 cores):
  - real        1m18,244s
  + real        0m36,695s
 VLV (2 cores):
  - real        17m29.100s
  + real        9m44.268s

For comparison this is what I get if I skip all the perf xml
files apart from hsw:
 ADL:
  real  0m20,080s
 VLV
  real  7m3.045s

Thinking of further ways to reduce this... There are about a
thousand "Ext" metric sets. Are those *actually* useful or
could we just skip them? That would give us a total build 
time of:
 ADL:
  real  0m24,593s
 VLV:
  real  8m15.977s

Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Ville Syrjälä (3):
  lib/i915/perf: Stop generating silly C code
  lib/i915/perf: Stop making copies of the registers
  lib/i915/perf: Convert the metric counters to an array as well

 .../perf-configs/perf-metricset-codegen.py    | 81 ++++++++++++++-----
 .../perf-configs/perf-registers-codegen.py    | 30 +++----
 lib/i915/perf.h                               |  8 +-
 3 files changed, 78 insertions(+), 41 deletions(-)

-- 
2.39.2
