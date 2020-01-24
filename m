Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633F572AD5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 14:36:15 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Fri, 24 Jan 2020 19:54:28 +0530
Message-Id: <20200124142435.14506-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/7] Add tests for HDR metadata interfaces
 and bpc switch
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
Cc: petri.latvala@intel.com, maarten.lankhorst@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This series contains tests to validate HDR metadata interfaces
and bpc switch test cases (8bpc<->10bpc).
Minor changes are made in the original patch series 
https://patchwork.freedesktop.org/patch/255755/

Changes made to the original series:

*Current version is made compatible for both amd and intel driver,
earlier it could be used by amd driver only.
*No assumption is made regarding output. Tests will execute on
all availabe outputs, since there is no ROI to execute
tests on all the pipes; tests will execute on single pipe.
*To make tests generic, moved tests from tests/amdgpu/amd_hdr.c to
tests/kms_hdr.c.
*Also, splitted the hdr igt into multiple patches so that subtests
can be easily reviewed.
*Renaming of functions, addition of new flags, igt_describe(), etc
*Added function to detect whether panel connected is HDR or not,
if non-HDR then tests will be skipped.
*Dropped test case using luminance sensor

Also, amd exposes max_bpc as a debugfs entry..so it's asserted for their
driver. i915 drives misses that.
TODO: Expose max_bpc as debugfs entry in i915 driver too, if required.

Nicholas Kazlauskas (6):
  headers: Bump drm uapi headers
  lib/igt_kms: Add max bpc connector property
  lib/igt_kms: Add HDR_OUTPUT_METADATA connector property
  tests/kms_hdr: Add bpc switch subtests
  tests/kms_hdr: Add static toggle SDR->HDR mode subtests
  tests/kms_hdr: Add subtest to swap static HDR metadata

Swati Sharma (1):
  tests/kms_hdr: Add function to check HDR panel

 include/drm-uapi/drm_mode.h | 121 ++++++-
 lib/igt_kms.c               |   7 +
 lib/igt_kms.h               |   2 +
 tests/Makefile.sources      |   1 +
 tests/kms_hdr.c             | 655 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 6 files changed, 785 insertions(+), 2 deletions(-)
 create mode 100644 tests/kms_hdr.c

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
