Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE4810E913
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 10:29:59 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Sep 2022 12:29:38 +0200
Message-Id: <20220921102940.15121-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC i-g-t v1 0/2] tests/i915/gem_basic: convert to
 multithreaded multi-GPUs
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

Run gem_basic on multi-GPUs hw configuration with the help of
filtered devices. See description to patch 1/2.
Use HAX to test only gem_basic.

Kamil Konieczny (2):
  tests/i915/gem_basic: convert to multithreaded multi-GPUs
  HAX test only gem_basic subtests

 tests/i915/gem_basic.c                |  71 ++++++++++-
 tests/intel-ci/fast-feedback.testlist | 170 +-------------------------
 2 files changed, 66 insertions(+), 175 deletions(-)

-- 
2.34.1
