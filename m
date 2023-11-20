Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB89B10E045
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Nov 2023 09:54:03 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Nov 2023 15:31:49 +0530
Message-Id: <20231120100151.1792953-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] added new subtest simultaneous-modeset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

newly added test tries to have as many outputs as possible,
prefernce is given to big_joiner outputs, with this we can
stress on bw

Kunal Joshi (2):
  tests/intel/kms_big_joiner: added new subtest simultaneous-modeset
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist |   2 +-
 tests/intel/kms_big_joiner.c          | 118 +++++++++++++++++++++++---
 2 files changed, 109 insertions(+), 11 deletions(-)

-- 
2.25.1
