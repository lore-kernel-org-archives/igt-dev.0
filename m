Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC1B10E076
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 03:56:11 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Oct 2023 09:15:52 +0530
Message-Id: <20231023034554.87875-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 0/2] kms lease
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

Mohammed Thasleem (2):
  tests/kms_lease: Terminate lease fd before subtests and remove lease_t
    from all sub-tests
  tests/kms_lease: Add wrapper to create lease and store mcl.fd

 tests/kms_lease.c | 235 ++++++++++++++++++++++------------------------
 1 file changed, 110 insertions(+), 125 deletions(-)

-- 
2.25.1
