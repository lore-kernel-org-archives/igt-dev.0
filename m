Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9C110E33C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jan 2023 10:52:47 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Jan 2023 11:52:41 +0100
Message-Id: <cover.1674469729.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] lib/i915_blt: Minor blt_create_object
 refactoring
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

The series consists of two patches. The first one removes
"create_mapping" param  in blt_create_object() param that seems
to not be used by the tests. The second one attempts to slightly
split up the creation of copy objects for fast and block copy.
Fast copy doesn't provide compression-backed copy, so we shouldn't
have to pass compression information when creating an object.

Karolina Stolarek (2):
  lib/i915_blt: Remove create_mapping flag from blt_create_object
  lib/i915_blt: Split up blt_copy_object functions

 lib/i915/i915_blt.c            | 94 ++++++++++++++++++++++++----------
 lib/i915/i915_blt.h            | 30 ++++++-----
 tests/i915/gem_ccs.c           | 39 +++++++-------
 tests/i915/gem_exercise_blt.c  | 18 +++----
 tests/i915/gem_lmem_swapping.c | 13 ++---
 5 files changed, 117 insertions(+), 77 deletions(-)

-- 
2.25.1
