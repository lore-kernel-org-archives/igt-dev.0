Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D6D10E6B2
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 22:53:00 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 16:52:34 -0600
Message-ID: <20230915225237.116176-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 0/3][i-g-t][V3] kms_writeback: support
 DRM_FORMAT_XRGB2101010 in kms_writeback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: brian.starkey@arm.com, maxime@cerno.tech
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

kms_writeback only checked and supported DRM_FORMAT_XRGB8888. This
patchset enables 10 bit supports in lib and add new subtests for
DRM_FORMAT_XRGB2101010 in kms_writeback.

V2 - allow kms_writeback to run subtests for multiple DRM_FORMAT_XRGB*
V3 - 1. move uint32_t fourcc[] to check_writeback_config() and
        use DRM_FORMAT_XRGB* directly in igt_main_args()
     2. remove incorrect comments

Alex Hung (3):
  lib/igt_fb: use the entire 32 bit for fnv1a_crc
  lib/igt_fb: add 10 bits (XRGB2101010) supports in fnv1a_crc
  tests/kms_writeback: support DRM_FORMAT_XRGB2101010 for writeback

 lib/igt_fb.c          |  15 +++--
 tests/kms_writeback.c | 136 +++++++++++++++++++++++++++++++++---------
 2 files changed, 116 insertions(+), 35 deletions(-)

-- 
2.42.0
