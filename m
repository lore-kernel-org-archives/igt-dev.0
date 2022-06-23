Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD5311A05E
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jun 2022 09:33:23 +0000 (UTC)
From: sinjan.kumar@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com, priyanka.dandamudi@intel.com,
 sinjan.kumar@intel.com
Date: Thu, 23 Jun 2022 15:02:09 +0530
Message-Id: <20220623093210.1345241-1-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/1] tests/i915/gem_busy : Added subtests
 description
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

From: Sinjan Kumar <sinjan.kumar@intel.com>

Added subtest description to following test:-

1. busy
2. close-race
3. extended
4. parallel
5. semaphore
6. hang
7. hang-extended

Sinjan Kumar (1):
  tests/i915/gem_busy : Added subtests description

 tests/i915/gem_busy.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
2.25.1
