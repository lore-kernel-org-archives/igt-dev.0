Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0707510EE19
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 15:27:48 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 25 May 2022 17:27:17 +0200
Message-Id: <20220525152719.1022426-2-ryszard.knop@intel.com>
In-Reply-To: <20220525152719.1022426-1-ryszard.knop@intel.com>
References: <20220525152719.1022426-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/i915_module_load: Add the
 "load" test
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

This series adds the i915_module_load@load test (which modprobes the i915
driver if not yet available, then runs basic sanity tests), then adds it
to the CI test list.

Ryszard Knop (2):
  tests/i915_module_load: Add the "load" test
  tests/intel-ci/fast-feedback: add i915_module_load@load

 tests/i915/i915_module_load.c         | 52 ++++++++++++++++++++++-----
 tests/intel-ci/fast-feedback.testlist |  4 ++-
 2 files changed, 46 insertions(+), 10 deletions(-)

-- 
2.36.1
