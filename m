Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827710E1E1
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 22:38:45 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 6 Sep 2023 16:37:27 -0600
Message-ID: <20230906223730.3979103-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 0/3][i-g-t][V2] kms_writeback: support
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

Alex Hung (3):
  lib/igt_fb: use the entire 32 bit for fnv1a_crc
  lib/igt_fb: add 10 bits (XRGB2101010) supports in fnv1a_crc
  tests/kms_writeback: support DRM_FORMAT_XRGB2101010 for writeback

 lib/igt_fb.c          |  15 +++--
 tests/kms_writeback.c | 140 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 120 insertions(+), 35 deletions(-)

-- 
2.42.0
