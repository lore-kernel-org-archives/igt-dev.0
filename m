Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8015610E00D
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 17:50:16 +0000 (UTC)
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Date: Fri, 12 May 2023 10:51:07 -0700
Message-Id: <20230512175108.1171586-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 0/1] test/gem_create: exercise
 gem_create_ext_set_pat
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Fei Yang <fei.yang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

This is the first draft of a new test case exercising the set_pat
extension for GEM_CREATE.

v2: make sure {get|set}_caching ioctls are disabled.
v3: move header change to lib/i915/i915_drm_local.h, will submit a
    separate patch for include/uapi/drm/i915_drm.h after the kernel
    change lands in upstream.

Fei Yang (1):
  test/gem_create: exercise gem_create_ext_set_pat

 lib/i915/i915_drm_local.h | 34 ++++++++++++++++++++++++++++++
 tests/i915/gem_create.c   | 44 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

-- 
2.25.1
