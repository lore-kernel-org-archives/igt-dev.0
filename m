Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFA36E0BE
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2020 10:40:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  6 Aug 2020 00:05:04 +0530
Message-Id: <20200805183506.22591-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20200511062647.9514-1-bhanuprakash.modem@intel.com>
References: <20200511062647.9514-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 0/2] New subtest for VRR Flipline mode
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
To: bhanuprakash.modem@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

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

 tests/kms_vrr.c | 142 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 91 insertions(+), 51 deletions(-)

-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
