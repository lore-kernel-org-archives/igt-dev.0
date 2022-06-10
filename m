Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2BF113DF6
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 05:49:08 +0000 (UTC)
From: sinjan.kumar@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com, priyanka.dandamudi@intel.com,
 sinjan.kumar@intel.com
Date: Fri, 10 Jun 2022 11:18:32 +0530
Message-Id: <20220610054834.469387-1-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] Add subtests description
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

Add subtests description for the following subtest
1. wide-all
2. wide-exec

Sinjan Kumar (2):
  i915/gem_exec_await: Add subtests description
  HAX: don't do full run

 tests/i915/gem_exec_await.c           |   4 +
 tests/intel-ci/fast-feedback.testlist | 186 +-------------------------
 2 files changed, 5 insertions(+), 185 deletions(-)

-- 
2.25.1
