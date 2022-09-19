Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8021F10E58A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 10:00:32 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Sep 2022 15:24:40 +0530
Message-Id: <20220919095442.666253-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/2] IGT clean-up tasks
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
	- Cleanup the test
	- Convert test to dynamic

Ananya Sharma (2):
  tests/kms_universal_plane: Convert test to dynamic
  tests/kms_universal_plane: Test Cleanup

 tests/kms_universal_plane.c | 96 +++++++++++++++----------------------
 1 file changed, 39 insertions(+), 57 deletions(-)

-- 
2.25.1
