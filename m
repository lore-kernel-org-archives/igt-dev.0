Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768166E9FD
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2020 17:53:57 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Wed, 17 Jun 2020 23:22:48 +0530
Message-Id: <20200617175254.17659-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200610193724.16436-2-mohammed.khajapasha@intel.com>
References: <20200610193724.16436-2-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/6] lib/igt_kms: Add support for display
 with
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
To: suresh.kumar.kurmi@intel.com, kishore.kunche@intel.com, petri.latvala@intel.com, mohammed.khajapasha@intel.com, arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add support for display with non-contiguous pipes.

Mohammed Khajapasha (6):
  lib/igt_kms: Add support for display with non-contiguous pipes
  tests/kms_cursor_legacy: Read crtc id for enable pipes
  tests/kms_lease: Get pipe from crtc for enable pipes
  tests/kms_lease: Read crtc id for a valid pipe
  lib/kms: Skip igt test cases for disabled display pipes
  tests/kms: Skip kms test cases for disabled pipes

 lib/igt_kms.c               | 62 ++++++++++++++++++++++++++++++-------
 lib/igt_kms.h               | 13 +++++---
 tests/kms_color.c           |  3 +-
 tests/kms_color_chamelium.c |  3 +-
 tests/kms_concurrent.c      |  3 +-
 tests/kms_cursor_legacy.c   | 14 ++++++---
 tests/kms_lease.c           |  8 +++--
 tests/kms_pipe_crc_basic.c  |  6 ++--
 tests/kms_plane.c           |  3 +-
 tests/kms_plane_lowres.c    |  3 +-
 tests/kms_plane_multiple.c  |  3 +-
 tests/kms_universal_plane.c | 18 +++++++----
 12 files changed, 102 insertions(+), 37 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
