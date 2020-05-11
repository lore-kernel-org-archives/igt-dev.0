Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2B36E1BA
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2020 06:38:42 +0000 (UTC)
From: bhanuprakash.modem@intel.com
Date: Mon, 11 May 2020 11:56:45 +0530
Message-Id: <20200511062647.9514-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH 0/2] New subtest for VRR Flipline mode
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
To: igt-dev@lists.freedesktop.org, bhanuprakash.modem@intel.com, harry.wentland@amd.com, nicholas.kazlauskas@amd.com, manasi.d.navare@intel.com, pichika.uday.kiran@intel.com
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

 tests/kms_vrr.c | 136 ++++++++++++++++++++++++++++++------------------
 1 file changed, 84 insertions(+), 52 deletions(-)

-- 
2.24.1.1.gb6d4d82bd5

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
