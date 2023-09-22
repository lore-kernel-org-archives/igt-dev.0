Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1C910E1CD
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 05:26:02 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 10:46:58 +0530
Message-Id: <20230922051701.25179-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 0/3] Terminate lease fd before subtests
 execution
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

Terminate the lease fd when any assert happen with out termination
of lease fd and on any drmModeSetCrtc or drmModeGetCrtc exit.
Terminate lease fd on every display dependent subtests execution.

Mohammed Thasleem (3):
  tests/kms_lease: Terminate lease fd before subtests execution
  tests/kms_lease: Removed lease_t from all sub-tests
  tests/kms_lease: Add wrapper to create lease

 tests/kms_lease.c | 261 +++++++++++++++++++++++-----------------------
 1 file changed, 130 insertions(+), 131 deletions(-)

-- 
2.25.1
