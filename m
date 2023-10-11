Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6436E10E817
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 13:30:28 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 19:01:11 +0530
Message-Id: <20231011133114.68627-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] tests/kms_vblank: Test cleanup and
 dynamic conversion
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

Subtests are converted to dynamic subtests. Also, testplan
documentation is updated.
Review comments addressed from
https://patchwork.freedesktop.org/series/109170/

Swati Sharma (3):
  tests/kms_vblank: cosmetic changes
  tests/kms_vblank: convert test to dynamic
  tests/kms_vblank: restrict to 2 pipes and add capability to run on all
    pipes

 tests/kms_vblank.c | 301 ++++++++++++++++++---------------------------
 1 file changed, 122 insertions(+), 179 deletions(-)

-- 
2.25.1
