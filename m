Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC18D6E061
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jun 2021 14:01:24 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, 25 Jun 2021 16:01:08 +0200
Message-Id: <20210625140118.2600731-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 00/10] tests/panfrost: Misc fixes/improvements
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello,

This is a collection of fixes for the panfrost testsuite:
 * submit tests are now passing on Bifrost
 * the prime test is fixed to handle the case where the KMS device is
   assigned card1

We also two extra tests to
* make sure we don't crash the kernel when closing the DRM FD while
  jobs are still in-flight
* make sure we recover from unhandled pagefaults on a FD-context

Regards,

Boris

Boris Brezillon (10):
  tests/panfrost: Make sure we open a DUMB capable node for prime tests
  lib/panfrost: Handle the NULL case in igt_panfrost_free_bo()
  lib/panfrost: Add a helper to create a job loop
  lib/panfrost: Add a helper to create a NULL job
  tests/panfrost: Simplify submit tests
  tests/panfrost: Extend the pan-reset test
  lib/panfrost: Get rid of igt_panfrost_trivial_job()
  tests/panfrost: Test FD-close while jobs are still in-flight
  lib/panfrost: Add a helper to create dummy write value jobs
  tests/panfrost: Add a test to validate unhandled pagefault handling

 lib/igt_panfrost.c      | 243 ++++++++++++++++++++++------------------
 lib/igt_panfrost.h      |   7 +-
 tests/panfrost_prime.c  |  25 ++++-
 tests/panfrost_submit.c | 115 +++++++++++--------
 4 files changed, 231 insertions(+), 159 deletions(-)

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
