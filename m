Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961F910E0E3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 07:50:29 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 13:20:58 +0530
Message-Id: <20230918075101.246845-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Test cleanup and dynamic conversion
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
Review coomments addressed from
https://patchwork.freedesktop.org/series/109170/

Swati Sharma (3):
  tests/kms_vblank: cosmetic changes
  tests/kms_vblank: convert test to dynamic
  tests/kms_vblank: update testplan doc

 tests/kms_vblank.c | 268 +++++++++++++++------------------------------
 1 file changed, 87 insertions(+), 181 deletions(-)

-- 
2.25.1
