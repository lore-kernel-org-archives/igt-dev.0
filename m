Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13EB10E16A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 14:43:03 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 25 Sep 2023 07:31:52 -0700
Message-Id: <20230925143154.4055120-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/2] intel/i915_query: Add
 query-l3-bank-count subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com
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

Janga Rahul Kumar (1):
  tests/i915_query.c: Add query-l3-bank-count subtest

Jonathan Cavitt (1):
  lib/i915: Add DRM_I915_QUERY_L3BANK_COUNT query

 lib/i915/i915_drm_local.h |  13 ++++
 tests/intel/i915_query.c  | 135 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 148 insertions(+)

-- 
2.25.1
