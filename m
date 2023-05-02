Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B668A10E1D0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 05:18:21 +0000 (UTC)
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 May 2023 22:19:20 -0700
Message-Id: <20230502051921.2183579-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 0/1] test/gem_create: exercise
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

Fei Yang (1):
  test/gem_create: exercise gem_create_ext_set_pat

 include/drm-uapi/i915_drm.h | 33 ++++++++++++++++++++++++++++
 tests/i915/gem_create.c     | 44 +++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

-- 
2.25.1
