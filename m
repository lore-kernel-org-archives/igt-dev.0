Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81316E8B4
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jul 2021 15:17:24 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 22 Jul 2021 20:36:58 +0530
Message-Id: <20210722150700.18435-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Revert the wrong fix for
 coverage-premultiplied-constant
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Subtest coverage-premultiplied-constant was failing due to
buffer alignment issue. It was not due to 6bpc.
Hence, we need to revert this patch which was wrongly submitted.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>


Vidya Srinivas (2):
  Revert "tests/kms_plane_alpha_blend: Fix a check in is_6bpc function"
  Revert "tests/kms_plane_alpha_blend: Skip coverage-vs-premult-vs-none
    for 6bpc panels"

 tests/kms_plane_alpha_blend.c | 36 -----------------------------------
 1 file changed, 36 deletions(-)

-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
