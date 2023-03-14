Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6A010E776
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 10:58:28 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Date: Tue, 14 Mar 2023 16:24:47 +0530
Message-Id: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/5] Add basic helpers to support display in XE
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

Add basic helpers to enbale the display in XE.

This series includes:
- XE device detection
- s/igt_require_intel/igt_require_i915/
- Cache dev_id

Bhanuprakash Modem (5):
  lib/drmtest: Add helpers to check and require the XE driver
  i915: s/igt_require_intel/igt_require_i915
  lib/xe/xe_query: Add dev_id() interface
  lib/intel_chipset: Add support to XE driver to get devid
  lib/igt_kms: Cache xe_device info for kms tests

 lib/drmtest.c       | 20 ++++++++++++++++++++
 lib/drmtest.h       |  4 ++++
 lib/i915/gem.c      |  2 +-
 lib/igt_fb.c        |  6 +++---
 lib/igt_kms.c       | 10 +++++++++-
 lib/intel_chipset.c | 30 ++++++++++++++++++++----------
 lib/xe/xe_query.c   |  9 +++++++++
 lib/xe/xe_query.h   |  4 ++++
 tests/i915/perf.c   |  2 +-
 9 files changed, 71 insertions(+), 16 deletions(-)

--
2.39.1
