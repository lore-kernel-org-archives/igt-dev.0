Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1E010E161
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 14:44:33 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 30 May 2023 20:13:55 +0530
Message-Id: <20230530144358.355304-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] check dsc hardware capability
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

 lib/igt_dsc.c               | 29 ++++++++++++++++++++++++++---
 lib/igt_dsc.h               |  3 ++-
 tests/i915/kms_dsc.c        |  4 ++--
 tests/i915/kms_dsc_helper.c | 14 ++++++++++++--
 tests/i915/kms_dsc_helper.h |  3 ++-
 tests/i915/kms_psr2_sf.c    |  2 +-
 tests/kms_invalid_mode.c    |  5 ++---
 7 files changed, 47 insertions(+), 13 deletions(-)

-- 
2.25.1
