Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B7910E35D
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:41:59 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:12 +0530
Message-Id: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/9] Add test for Plane Color pipeline UAPI's
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chaitanya.kumar.borah@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Based on discussions so far in the community, a plane color
design proposal is being created. This IGT series helps in
demonstrating the usage of the UAPI. How to parse the hardware
capabilities, extract meaningful information about the hardware
blocks, calculate and allocate blobs to be sent to the driver.

Individual patches in the series describe/illustrate a particular
UAPI usage and various typical usecases which an end user may come
up with or may need.

Note: This series doesn't cover the detailed validation of all the
plane color hardware features, the same can be added once the UAPI
design is solidified in the community.

Chaitanya Kumar Borah (9):
  drm-uapi: Add color pipeline uapi
  tests/kms_color: Add support for color pipeline properties
  tests/kms_color: Add infrastructure for plane color pipeline test
  tests/kms_color: Add helper to search for a color pipeline
  tests/kms_color: Add test setting and changing a plane color pipeline
  tests/kms_color: Add test to switch color pipeline
  tests/kms_color: Add CTM tests
  drm-uapi/i915_drm: Add uapi headers for custom color operation
  tests/kms_color: Add test to demonstrate vendor specific color
    operations

 include/drm-uapi/drm_mode.h | 184 +++++++
 include/drm-uapi/i915_drm.h |  25 +
 lib/igt_kms.c               |   2 +
 lib/igt_kms.h               |   2 +
 tests/kms_color.c           | 975 ++++++++++++++++++++++++++++++++++++
 5 files changed, 1188 insertions(+)

-- 
2.25.1
