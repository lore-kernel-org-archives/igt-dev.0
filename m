Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8D56E0A1
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 14:29:05 +0000 (UTC)
From: Anson Jacob <Anson.Jacob@amd.com>
Date: Fri, 18 Jun 2021 10:28:51 -0400
Message-ID: <20210618142855.5750-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] IGT Patches Jun 18, 2021
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
Cc: Anson Jacob <Anson.Jacob@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Attaching patches for fixes on amdgpu.

Bindu Ramamurthy (1):
  tests/kms_content_protection: Enable Primary plane for CRTC.

Victor Lu (3):
  lib/igt_kms: Fix test_init() crash when <6 pipes
  tests/kms_plane_multiple: Start continuous CRC capture after commit
  tests/kms_plane_multiple: Disable CRTC if no planes

 lib/igt_kms.c                  |  4 ++--
 tests/kms_content_protection.c |  5 ++++-
 tests/kms_plane_multiple.c     | 11 +++++++++--
 3 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
