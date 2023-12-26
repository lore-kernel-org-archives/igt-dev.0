Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E4710E05B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Dec 2023 10:24:55 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] add new subtest simultaneous-modeset
Date: Tue, 26 Dec 2023 16:04:22 +0530
Message-Id: <20231226103424.46324-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Jeevan B <jeevan.b@intel.com>

add new test that tries to have as many outputs as possible,
prefernce is given to big_joiner outputs, with this we can
stress on bw

Kunal Joshi (2):
  tests/intel/kms_big_joiner: add new subtest simultaneous-modeset
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist |   2 +-
 tests/intel/kms_big_joiner.c          | 161 ++++++++++++++++++++++----
 2 files changed, 141 insertions(+), 22 deletions(-)

-- 
2.25.1
