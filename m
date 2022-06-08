Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A049C10E341
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 04:59:25 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Jun 2022 10:24:04 +0530
Message-Id: <20220608045405.1445705-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] Extend rc6-idle
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

Run bg_load on a single instance of every engine.

Riana Tauro (1):
  tests/i915/pm_rc6_residency: Extend rc6-idle test on remaining engines

 tests/i915/i915_pm_rc6_residency.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
2.25.1
