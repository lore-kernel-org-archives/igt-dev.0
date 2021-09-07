Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F7B894C9
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Sep 2021 15:57:54 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Tue,  7 Sep 2021 21:30:10 +0530
Message-Id: <20210907160012.21601-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/kms_prime: Sharing BO with smem
 as placement
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev <igt-dev@lists.freedesktop.org>
Cc: Chris Wilson <chris@chris-wilson.co.uk>, Chris_intel_ID <chris.p.wilson@intel.com>, Dixit Ashutosh <ashutosh.dixit@intel.com>, Michael Ruhl <michael.j.ruhl@intel.com>, Ramalingam C <ramalingam.c@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Create the sharing obj with smem as second placement option through
gem_create.

Ramalingam C (2):
  lib/ioctl_wrappers: wrapper for mmap ptr for gem obj
  tests/kms_prime: Create the exporting BO with smem placement

 lib/ioctl_wrappers.c | 69 +++++++++++++++++---------------------------
 lib/ioctl_wrappers.h |  1 +
 tests/kms_prime.c    | 22 +++++++-------
 3 files changed, 38 insertions(+), 54 deletions(-)

-- 
2.20.1
