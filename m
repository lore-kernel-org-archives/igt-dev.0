Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3FE10E141
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 16:55:03 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Jun 2023 22:24:28 +0530
Message-Id: <20230614165431.532799-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/3] check dsc hardware capability
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

Instead of assuming dsc is supported gen11+, lets use has_dsc
flag in i915_capability to check h/w support.

Swati Sharma (3):
  tests: s/igt_is_dsc_supported/igt_is_dsc_supported_by_sink
  tests: s/check_dsc_on_connector/is_dsc_supported_by_sink
  tests: add igt_is_dsc_supported_by_source()

 lib/igt_dsc.c               | 28 +++++++++++++++++++++++++---
 lib/igt_dsc.h               |  3 ++-
 tests/i915/kms_dsc.c        |  4 ++--
 tests/i915/kms_dsc_helper.c | 14 ++++++++++++--
 tests/i915/kms_dsc_helper.h |  3 ++-
 tests/i915/kms_psr2_sf.c    |  2 +-
 tests/kms_invalid_mode.c    |  5 +++--
 7 files changed, 47 insertions(+), 12 deletions(-)

-- 
2.25.1
