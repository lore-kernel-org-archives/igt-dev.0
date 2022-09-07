Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927A210E3CF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 07:34:54 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 12:59:14 +0530
Message-Id: <20220907072916.405508-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 0/2] IGT clean-up tasks
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

Series includes patches to:
-Cleanup the test
-Convert test to dynamic
Ananya Sharma (2):
  tests/kms_universal_plane: Convert test to dynamic
  tests/kms_universal_plane: Test cleanup

 tests/kms_universal_plane.c | 99 +++++++++++++++----------------------
 1 file changed, 40 insertions(+), 59 deletions(-)

-- 
2.25.1
