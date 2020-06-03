Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDF689DE3
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 21:05:43 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu,  4 Jun 2020 02:35:04 +0530
Message-Id: <20200603210506.17185-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] test/kms: Add support for display with
 non-contiguous pipes
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
To: igt-dev@lists.freedesktop.org, suresh.kumar.kurmi@intel.com, kishore.kunche@intel.com, petri.latvala@intel.com, mohammed.khajapasha@intel.com, arkadiusz.hiler@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

add support for display with non-contiguous pipes.

Mohammed Khajapasha (2):
  lib/igt_kms: Set pipe enum name to a pipe from drm pipe
  test/kms: In static iteration skip the testcases for disable pipes

 lib/igt_core.h              | 22 ++++++++++++++++++++++
 lib/igt_kms.c               | 13 +++++++++----
 tests/kms_color.c           |  2 +-
 tests/kms_color_chamelium.c |  2 +-
 tests/kms_concurrent.c      |  2 +-
 tests/kms_cursor_legacy.c   |  2 +-
 tests/kms_pipe_crc_basic.c  |  2 +-
 tests/kms_plane.c           |  2 +-
 tests/kms_plane_cursor.c    |  3 +++
 tests/kms_plane_lowres.c    |  2 +-
 tests/kms_plane_multiple.c  |  2 +-
 tests/kms_universal_plane.c |  2 +-
 12 files changed, 43 insertions(+), 13 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
