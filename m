Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D3F10E273
 for <igt-dev@lists.freedesktop.org>; Wed,  3 May 2023 11:40:55 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  3 May 2023 17:10:12 +0530
Message-Id: <20230503114014.132968-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Enable VDSC output formats validation
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

 lib/igt_dsc.c               |  49 +++++++++++++
 lib/igt_dsc.h               |   5 ++
 lib/igt_kms.c               |  18 +++++
 lib/igt_kms.h               |   7 ++
 tests/i915/kms_dsc.c        | 136 +++++++++++++++++++++++++-----------
 tests/i915/kms_dsc_helper.c |  36 ++++++++++
 tests/i915/kms_dsc_helper.h |   4 ++
 7 files changed, 216 insertions(+), 39 deletions(-)

-- 
2.25.1
