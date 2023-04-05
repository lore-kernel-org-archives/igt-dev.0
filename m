Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F9910E2CB
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 00:09:31 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Apr 2023 00:09:07 +0000
Message-Id: <20230405000909.51175-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/drm_fdinfo: Drop tests with
 TEST_BUSY for GuC
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

From: root <root@DUT5130ATSM.fm.intel.com>

With GuC scheduling backends, the context busyness for a active context is
obtained from the GUC FW. The support for this is WIP, so disable tests that
check TEST_BUSY until the feature is implemented.

v2: Drop fixture

Bug Id: https://gitlab.freedesktop.org/drm/intel/-/issues/8303
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  lib/drm_fdinfo: Check for compute engines when parsing
  tests/drm_fdinfo: Drop active busyness tests for GuC backend

 lib/igt_drm_fdinfo.c    |  1 +
 tests/i915/drm_fdinfo.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.34.1
