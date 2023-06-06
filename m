Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C88610E244
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 17:56:50 +0000 (UTC)
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Fei Yang <fei.yang@intel.com>
Date: Tue,  6 Jun 2023 19:52:25 +0200
Message-Id: <20230606175226.502703-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 0/1] test/gem_create: limit set_pat only to
 Meteor Lake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: IGT dev <igt-dev@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

An agreement was reached to expose gem_create_ext_set_pat
extension to Meteor Lake only. For older platforms the extension
would return -ENODEV.

Thanks Kamil for the review!

v3: Fix misleading commit log.
    Use igt_assert_eq() instead of igt_assert(==).
    Check for -EINVAL first and then for MTL.
    Do not return after igt_assert_eq.
v2: Limit the test to Meteor Lake.

Fei Yang (1):
  test/gem_create: limit set_pat only to Meteor Lake

 tests/i915/gem_create.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.40.1
