Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6062C10E76D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 11:43:04 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Feb 2023 17:15:13 +0530
Message-Id: <20230203114515.32002-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/2] Enable VDSC output formats validation
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

Initial, dsc generic changes are merged. Now, this series contains
only dsc o/p format validation related patches.

Swati Sharma (2):
  lib/dsc: Add helpers for VDSC output format debugfs entry
  tests/i915/kms_dsc: Enable validation for VDSC output formats

 lib/igt_dsc.c               |  49 +++++++++++++++
 lib/igt_dsc.h               |   5 ++
 lib/igt_kms.c               |  18 ++++++
 lib/igt_kms.h               |   7 +++
 tests/i915/kms_dsc.c        | 117 +++++++++++++++++++++++++++++-------
 tests/i915/kms_dsc_helper.c |  36 +++++++++++
 tests/i915/kms_dsc_helper.h |   4 ++
 7 files changed, 214 insertions(+), 22 deletions(-)

-- 
2.25.1
