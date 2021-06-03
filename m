Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCFB6F495
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 15:08:14 +0000 (UTC)
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Thu,  3 Jun 2021 11:07:57 -0400
Message-Id: <20210603150800.157685-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 0/3] igt tests for hot-unplug feature in amdgpu
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

Adding some code to acompany the recently added hot-unplug
feature[1]. While the code is amdgpu specific it was suggested
by Daniel to add this to IGT hot unplug test[2]. There is also
parallel RFC for this in libdrm[3].

[1] - https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.14-AMDGPU-Hot-Unplug
[2] - https://lists.freedeskt op.org/archives/amd-gfx/2021-January/058646.html
[3] - https://www.spinics.net/lists/dri-devel/msg300998.html

Andrey Grodzovsky (3):
  tests/core_hotunplug: Add command submission for amdgpu
  tests/core_hotunplug: Add hotunplug with exported dma-buf test.
  tests/core_hotunplug: Add hotunplug with exported sync obj test

 tests/Makefile.am      |   3 +
 tests/core_hotunplug.c | 364 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   2 +-
 3 files changed, 368 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
