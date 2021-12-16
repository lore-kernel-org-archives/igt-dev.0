Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E4010F32E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 11:13:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Thu, 16 Dec 2021 16:56:06 +0530
Message-Id: <20211216112608.14535-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add upscaling tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

In this series
    * Renaming of downscaling tests
    * Addition of upscaling tests

Rebased initial series sent at https://patchwork.freedesktop.org/series/93952/

Swati Sharma (2):
  tests/i915/kms_flip_scaled_crc: Rename downscaling tests
  tests/i915/kms_flip_scaled_crc: Add upscaling tests

 tests/i915/kms_flip_scaled_crc.c | 70 ++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 7 deletions(-)

-- 
2.25.1
