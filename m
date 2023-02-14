Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DB210E97F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 19:28:49 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Feb 2023 20:28:27 +0100
Message-Id: <20230214192830.51997-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Fix multi-gpu subtests and open all
 cards consecutivly
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

Function opening N-th driver card is designed to be called in
succession so refactor tests to accommodate it. This was not
discovered until a recent test on a board with more than two
discrete GPU cards, where multigpu tests failed.

Kamil Konieczny (3):
  tests/i915/gem_basic: fix multigpu subtest
  tests/i915/gem_close_race: fix multi-gpu subtests
  i915/gem_exec_gttfill: fix multigpu subtest

 tests/i915/gem_basic.c        | 18 +++++++++++++++++-
 tests/i915/gem_close_race.c   | 27 +++++++++++++++++++++++++--
 tests/i915/gem_exec_gttfill.c | 14 +++++++++++++-
 3 files changed, 55 insertions(+), 4 deletions(-)

-- 
2.37.2
