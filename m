Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A018610E68D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 15:55:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 21:26:02 +0530
Message-Id: <20230928155604.546419-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 0/2] tests/kms_universal_plane: Dynamic conversion
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

Convert subtests to dynamic subtests and update documentation
accordingly.

Swati Sharma (2):
  tests/kms_universal_plane: convert subtests to dynamic subtests
  tests/kms_universal_plane: update testplan doc

 tests/kms_universal_plane.c | 150 ++++++++----------------------------
 1 file changed, 34 insertions(+), 116 deletions(-)

-- 
2.25.1
