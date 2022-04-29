Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DEF10E7E2
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 09:49:16 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com
Date: Fri, 29 Apr 2022 15:18:13 +0530
Message-Id: <20220429094815.18013-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] HAX add description to
 gem_partial_pwrite_pread
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add test description to gem_partial_pwrite_pread

Sai Gowtham Ch (2):
  i915/gem_partial_pwrite_pread: Add subtests description
  HAX: don't do full run

 tests/i915/gem_partial_pwrite_pread.c |   6 +
 tests/intel-ci/fast-feedback.testlist | 183 +-------------------------
 2 files changed, 7 insertions(+), 182 deletions(-)

-- 
2.35.1
