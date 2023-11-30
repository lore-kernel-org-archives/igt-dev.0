Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D4710E025
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 16:13:40 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 08:02:51 -0800
Message-Id: <20231130160253.3787505-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/2] intel/i915_query: Add
 query-l3-bank-count subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add support for the DRM_QUERY_L3BANK_COUNT query and exercise it with
subtests in i915_query.

v2:
- Separate uapi and test changes.
- s/invaild/invalid

v3:
- Move uapi changes to i915_drm_local.h.

v4:
- Reorder some i915_query.c elements.

v5:
- Remove .c from subject.
- Warn when test_l3_count is run but not exercised.
- Break l3 bank count tests from subtest group.
- Require l3 bank count support for all l3 bank count tests (except
  the one that checks if the query correctly reports a lack of support
  on unsupported platforms).

Janga Rahul Kumar (1):
  tests/i915_query: Add query-l3-bank-count subtest

Jonathan Cavitt (1):
  lib/i915: Add DRM_I915_QUERY_L3BANK_COUNT query

 lib/i915/i915_drm_local.h |  13 ++++
 tests/intel/i915_query.c  | 140 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 153 insertions(+)

-- 
2.25.1
