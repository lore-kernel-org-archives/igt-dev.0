Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AFC10E052
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 05:05:00 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 10:44:36 +0530
Message-Id: <20231103051438.19342-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Extend the test to validate FBC for
 each plane
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

Extend the test to enable FBC for each plane

Nidhi Gupta (2):
  tests/kms_frontbuffer_tracking: Extend the test to enable FBC for each
    plane
  HAX PATCH DO NOT MERGE

 tests/intel-ci/fast-feedback.testlist  |   3 +-
 tests/intel/kms_frontbuffer_tracking.c | 106 +++++++++++++++++++++++++
 2 files changed, 108 insertions(+), 1 deletion(-)

-- 
2.39.0
