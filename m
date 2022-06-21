Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E95E10E279
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 13:49:42 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 19:15:24 +0530
Message-Id: <20220621134526.2040218-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Extend i915_pm_rc6_residency
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

Refactor code to move intel_ctx_create_all_physical() and
intel_ctx_destroy() to igt_fixture to be used to by tests.

Extend rc6_idle to run on single instance of every engines

Rev2: add dynamic subtests and refactor code (Anshuman)

Riana Tauro (2):
  tests/i915/pm_rc6_residency: Refactoring intel_ctx_t to igt_fixture
  tests/i915/pm_rc6_residency: Extend rc6-idle test on remaining engines

 tests/i915/i915_pm_rc6_residency.c | 32 +++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

-- 
2.25.1
