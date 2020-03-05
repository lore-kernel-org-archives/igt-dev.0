Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B2F891EC
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 10:31:49 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu,  5 Mar 2020 09:03:36 +0530
Message-Id: <1583379218-30115-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Test platform supported pixel
 formats through chamelium.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added capability in kms_chamelium to test both rgb and yuv
pixel formats supported per platform through chamelium.
Earlier, only hard coded pixel formats used to be tested which were
not generic across platforms resulting is SKIPS; to overcome these SKIPS
now only platform supported pixel formats will be tested.

Kunal Joshi (2):
  lib/igt_fb: Added macro to retrieve char code of format
  tests/kms_chamelium: Add support to validate RGB/YUV pixel formats

 lib/igt_fb.h          |   2 +
 tests/kms_chamelium.c | 140 +++++++++++++++++++-------------------------------
 2 files changed, 56 insertions(+), 86 deletions(-)

-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
