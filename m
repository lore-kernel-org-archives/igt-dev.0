Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE94910FF6E
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 07:44:46 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Fri,  1 Apr 2022 13:15:25 +0530
Message-Id: <20220401074527.15709-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 0/2] tests/i915/gem_lmem_swapping: Add
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

v6: fix for Dg1 regression

Ramalingam C (2):
  tests/i915/gem_lmem_swapping: create batch buffer from obj pool
  tests/i915/gem_lmem_swapping: Add ccs subtests

 tests/i915/gem_lmem_swapping.c | 245 +++++++++++++++++++++++++++++++--
 1 file changed, 231 insertions(+), 14 deletions(-)

-- 
2.20.1
