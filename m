Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBCE10E5E9
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 10:10:16 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 15:36:04 +0530
Message-Id: <20220621100606.2037879-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Extend i915_pm_rc6_residency
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

Extend rc6-idle test on remaining engines
Modify rc6_fence to use intel_ctx_t from igt_fixture

Riana Tauro (2):
  tests/i915/pm_rc6_residency: Extend rc6-idle test on remaining engines
  tests/i915/pm_rc6_residency: Modify rc6_fence to use intel_ctx_t from
    igt_fixture

 tests/i915/i915_pm_rc6_residency.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

-- 
2.25.1
