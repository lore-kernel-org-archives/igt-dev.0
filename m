Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F1F6EAAD
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 06:53:52 +0000 (UTC)
From: bhanuprakash.modem@intel.com
Date: Thu, 24 Sep 2020 20:18:00 +0530
Message-Id: <20200924144802.30147-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v4 0/2] New subtest for VRR Flipline mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

To validate Adaptive-Sync's Flipline mode, make sure that flips happen at
flipline decision boundary.

Example: if monitor vrr range is 40 - 60Hz and

* flip at refresh_rate > 60Hz:
        Flip should happen at the flipline boundary & returned refresh rate
        would be 60Hz.
* flip at refresh_rate == 50Hz:
        Flip should happen right away so returned refresh rate is 50Hz.
* flip at refresh_rate < 40Hz:
        Flip should happen at the vmax so the returned refresh rate
        would be 40Hz.

Bhanuprakash Modem (2):
  tests/kms_vrr: Use atomic API for page flip
  tests/kms_vrr: Add new subtest to validate Flipline mode

 tests/kms_vrr.c | 181 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 117 insertions(+), 64 deletions(-)

--
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
