Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C4C10E730
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 17:28:35 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 22:53:16 +0530
Message-Id: <20230404172318.150403-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v7 0/2] tests/i915/i915_pm_dc: Add DC6 test for mtl
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

The flow for DC6 validation has changed for MTL.
DC6 state achieved based on PKGC10 entry.
This test validates PKGC10 entry and confirm DC6 achieved.

Mohammed Thasleem (2):
  tests/i915/i915_pm_dc: Add DC6 DPMS test for mtl
  tests/i915/i915_pm_dc: Add DC6 PSR test for mtl

 tests/i915/i915_pm_dc.c | 77 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 2 deletions(-)

-- 
2.25.1
