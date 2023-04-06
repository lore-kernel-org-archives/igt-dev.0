Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA3A10EAFE
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Apr 2023 07:52:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Thu,  6 Apr 2023 13:18:09 +0530
Message-Id: <20230406074815.463965-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 0/6] Enable ADDFB tests for XE
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

Add IGT support to enable ADDFB tests to XE BAT.

Bhanuprakash Modem (6):
  lib/xe/xe_ioctl: Add a helper to map the buffer
  lib/igt_fb: Add support for allocating buffers for XE
  tests/kms_addfb_basic: Code cleanup
  tests/kms_addfb_basic: Add XE support
  tests/kms_force_connector_basic: Set the param only if driver supports
  xe-fast-feedback: Add basic kms tests to XE BAT

 lib/igt_fb.c                             | 14 +++-
 lib/xe/xe_ioctl.c                        | 14 +++-
 lib/xe/xe_ioctl.h                        |  1 +
 tests/intel-ci/xe-fast-feedback.testlist | 30 ++++++++
 tests/kms_addfb_basic.c                  | 91 ++++++++++++++----------
 tests/kms_force_connector_basic.c        |  7 +-
 6 files changed, 113 insertions(+), 44 deletions(-)

--
2.40.0
