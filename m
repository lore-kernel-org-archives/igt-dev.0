Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D71610E535
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 12:27:28 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  2 May 2023 17:56:36 +0530
Message-Id: <20230502122638.115471-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] Enable VDSC output formats validation
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
 tests/i915/kms_dsc.c        | 118 +++++++++++++++++++++++++++++-------
 tests/i915/kms_dsc_helper.c |  36 +++++++++++
 tests/i915/kms_dsc_helper.h |   4 ++
 7 files changed, 214 insertions(+), 23 deletions(-)

-- 
2.25.1
