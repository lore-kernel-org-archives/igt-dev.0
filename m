Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DBF10E2F4
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Mar 2022 14:29:55 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Mon, 21 Mar 2022 19:51:53 +0530
Message-Id: <20220321142155.273109-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] HAX add description to i915_module_load
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

Add test description to i915_module_load.

Priyanka Dandamudi (2):
  i915/i915_module_load: Add descriptions for test
  HAX: don't do full run

 tests/i915/i915_module_load.c         |   6 +
 tests/intel-ci/fast-feedback.testlist | 179 +-------------------------
 2 files changed, 7 insertions(+), 178 deletions(-)

-- 
2.25.1
