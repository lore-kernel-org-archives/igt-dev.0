Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BECD6E027
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 12:57:37 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, 21 Jun 2021 14:57:17 +0200
Message-Id: <20210621125724.1592104-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 0/7] tests/panfrost: Misc fixes/improvements
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
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hello,

This is a collection of fixes for the panfrost testsuite:
 * submit tests are now passing on Bifrost
 * the prime test is fixed to handle the case where the KMS device is
   assigned card1

There's also an extra test to make sure we don't crash the kernel
when closing the DRM FD while jobs are still in-flight.

Regards,

Boris

Boris Brezillon (7):
  tests/panfrost: Make sure we open a DUMB capable node for prime tests
  lib/panfrost: Handle the NULL case in igt_panfrost_free_bo()
  lib/panfrost: Add a helper to create a job loop
  lib/panfrost: Add a helper to create a NULL job
  tests/panfrost: Simplify submit tests
  lib/panfrost: Get rid of igt_panfrost_trivial_job()
  tests/panfrost: Test FD-close while jobs are still in-flight

 lib/igt_panfrost.c      | 159 +++++++++++++---------------------------
 lib/igt_panfrost.h      |   3 +-
 tests/panfrost_prime.c  |  26 ++++++-
 tests/panfrost_submit.c | 101 ++++++++++++-------------
 4 files changed, 126 insertions(+), 163 deletions(-)

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
