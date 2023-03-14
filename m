Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A9010EA94
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 16:10:33 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Date: Tue, 14 Mar 2023 21:34:58 +0530
Message-Id: <20230314160503.2237121-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 0/5] Add basic helpers to support display in XE
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

 lib/drmtest.c       | 20 +++++++++++++++++
 lib/drmtest.h       |  4 ++++
 lib/i915/gem.c      |  2 +-
 lib/igt_fb.c        |  6 ++---
 lib/igt_kms.c       | 10 ++++++++-
 lib/intel_chipset.c | 54 ++++++++++++++++++++++++++++++++++++---------
 lib/xe/xe_query.c   |  9 ++++++++
 lib/xe/xe_query.h   |  4 ++++
 tests/i915/perf.c   |  2 +-
 9 files changed, 95 insertions(+), 16 deletions(-)

--
2.39.1
