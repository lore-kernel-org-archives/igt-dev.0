Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7222710E06C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 14:22:01 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 07:11:16 -0700
Message-Id: <20230922141118.3821111-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] intel/i915_query: Add
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

Janga Rahul Kumar (1):
  tests/i915_query.c : Add query-l3-bank-count subtest

Jonathan Cavitt (1):
  drm-uapi: Add DRM_I915_QUERY_L3BANK_COUNT query

 include/drm-uapi/i915_drm.h |  13 ++++
 tests/intel/i915_query.c    | 135 ++++++++++++++++++++++++++++++++++++
 2 files changed, 148 insertions(+)

-- 
2.25.1
