Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A05810FD7E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 04:20:57 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Tue, 26 Apr 2022 09:42:26 +0530
Message-Id: <20220426041228.516686-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] HAX add description to
 gem_set_tiling_vs_pwrite
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test description to gem_set_tiling_vs_pwrite

Priyanka Dandamudi (1):
  HAX: don't do full run

ranjeet kumar (1):
  i915/gem_set_tiling_vs_pwrite: Added description for test case

 tests/i915/gem_set_tiling_vs_pwrite.c |   5 +-
 tests/intel-ci/fast-feedback.testlist | 180 +-------------------------
 2 files changed, 4 insertions(+), 181 deletions(-)

-- 
2.25.1
