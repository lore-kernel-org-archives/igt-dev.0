Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D1A10E42E
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 14:46:37 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Sep 2022 20:16:07 +0530
Message-Id: <20220908144609.2878575-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Disable d3cold_allowed for
 basic-s2idle-without-i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When module is unloaded and s2idle is triggered,
PCI core leaves the endpoint in D0 and the bridge in D3 state causing
PCIE spec violation. The config space is read as 0xFF

Keep the bridge in D0 before module unload to prevent
this issue

Riana Tauro (2):
  lib/igt_pm : Add pm functions for d3cold_allowed
  tests/i915/i915_suspend: Disable d3cold_allowed for
    basic-s2idle-without-i915

 lib/igt_pm.c              | 46 +++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h              |  4 ++++
 tests/i915/i915_suspend.c | 28 ++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

-- 
2.25.1
