Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A1E10E145
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Apr 2023 05:44:06 +0000 (UTC)
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Apr 2023 22:45:15 -0700
Message-Id: <20230422054516.3383009-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/1] test/gem_create: exercise
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

Fei Yang (1):
  test/gem_create: exercise gem_create_ext_set_pat

 include/drm-uapi/i915_drm.h | 33 +++++++++++++++++++++++++++++++++
 tests/i915/gem_create.c     | 28 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

-- 
2.25.1
