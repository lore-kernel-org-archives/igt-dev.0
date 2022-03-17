Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB9610E1CD
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Mar 2022 05:11:58 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 sai.gowtham.ch@intel.com
Date: Thu, 17 Mar 2022 10:41:31 +0530
Message-Id: <20220317051133.27881-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] HAX add description to gem_exec_basic.
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

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Add test description to gem_exec_basic.

Ch Sai Gowtham (2):
  tests/i915/gem_exec_basic: Add test description to the subtest.
  HAX: don't do full run

 tests/i915/gem_exec_basic.c           |   2 +
 tests/intel-ci/fast-feedback.testlist | 181 +-------------------------
 2 files changed, 3 insertions(+), 180 deletions(-)

-- 
2.35.1
