Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6616210FBEE
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 09:05:06 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Thu, 14 Apr 2022 14:35:53 +0530
Message-Id: <20220414090555.9344-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 0/2] tests/i915/gem_lmem_swapping: Add
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

v9:
  Fix a memory leak.
  mocs setting from lib

Ramalingam C (2):
  tests/i915/gem_lmem_swapping: create batch buffer from obj pool
  tests/i915/gem_lmem_swapping: Add ccs subtests

 tests/i915/gem_lmem_swapping.c | 252 +++++++++++++++++++++++++++++++--
 1 file changed, 237 insertions(+), 15 deletions(-)

-- 
2.20.1
