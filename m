Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE2810E0A5
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Mar 2022 06:04:37 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Wed, 30 Mar 2022 11:35:14 +0530
Message-Id: <20220330060516.2813-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/2] tests/i915/gem_lmem_swapping: Add
 ccs subtests
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

Add subtests for compressed objects. And also batch buffers are created
from the obj pool

v5: Set blt_ctx alone as non-persistence [Ashutosh]

Ramalingam C (2):
  tests/i915/gem_lmem_swapping: create batch buffer from obj pool
  tests/i915/gem_lmem_swapping: Add ccs subtests

 tests/i915/gem_lmem_swapping.c | 246 +++++++++++++++++++++++++++++++--
 1 file changed, 232 insertions(+), 14 deletions(-)

-- 
2.20.1
