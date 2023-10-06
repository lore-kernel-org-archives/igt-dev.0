Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4A710E4C0
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 08:07:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:28:15 +0530
Message-Id: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/4] KMS: Minor cleanups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Minor cleanups.

Bhanuprakash Modem (4):
  lib/igt_fb: Use small case for modifier name
  lib/igt_kms: Expose helper to convert rotation to string
  tests/intel/kms_ccs: Rename subtests
  tests/kms_rotation_crc: Use helpers from lib

 lib/igt_fb.c             | 22 +++++------
 lib/igt_kms.c            | 20 ++++++----
 lib/igt_kms.h            |  1 +
 tests/intel/kms_ccs.c    | 82 ++++++++++++++++++++--------------------
 tests/kms_rotation_crc.c | 40 ++------------------
 5 files changed, 70 insertions(+), 95 deletions(-)

--
2.40.0
