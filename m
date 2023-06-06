Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF5C10E308
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 09:08:58 +0000 (UTC)
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue,  6 Jun 2023 11:08:00 +0200
Message-Id: <20230606090801.461782-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 0/1] test/gem_create: limit set_pat to GEN12+
 platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi.shyti@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

An agreement was reached to expose gem_create_ext_set_pat extension
for GEN12+ platforms only. For older platforms the extension would
return -ENODEV.

Fei Yang (1):
  test/gem_create: limit set_pat to GEN12+ platforms

 tests/i915/gem_create.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.25.1
