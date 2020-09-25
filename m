Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5EB6EB97
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2020 04:52:23 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Fri, 25 Sep 2020 09:56:11 +0530
Message-Id: <20200925042613.18301-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v11 0/2] Add test for asynchronous flips
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
Cc: michel@daenzer.net, daniel.vetter@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add test for validation of asynchronous flips.

Karthik B S (2):
  lib/igt_ioctl_wrappers: Add igt_has_drm_cap ioctl wrapper
  tests/kms_async_flips: Add test to validate asynchronous flips

 lib/ioctl_wrappers.c    |  17 ++
 lib/ioctl_wrappers.h    |   1 +
 tests/Makefile.sources  |   1 +
 tests/kms_async_flips.c | 425 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |   1 +
 5 files changed, 445 insertions(+)
 create mode 100644 tests/kms_async_flips.c

-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
