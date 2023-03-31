Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEFD10E569
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 19:59:32 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 31 Mar 2023 19:59:13 +0000
Message-Id: <20230331195915.5839-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/drm_fdinfo: Drop tests with
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

Bug Id: https://gitlab.freedesktop.org/drm/intel/-/issues/8303
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  lib/drm_fdinfo: Check for compute engines when parsing
  tests/drm_fdinfo: Drop active busyness tests for GuC backend

 lib/igt_drm_fdinfo.c    |   1 +
 tests/i915/drm_fdinfo.c | 148 +++++++++++++++++++++-------------------
 2 files changed, 80 insertions(+), 69 deletions(-)

-- 
2.34.1
