Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7958A6E222
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Aug 2021 03:07:21 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Wed,  4 Aug 2021 08:26:35 +0530
Message-Id: <20210804025637.2473-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Fix rounding error in draw_squares in
 kms_plane_alpha_blend
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
Cc: juhapekkaheikkila@gmail.com, tejaskumax.surendrakumar.upadhyay@intel.com, Vidya Srinivas <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Series contains patch which fixes a rounding issue in draw_squares. Due to this,
coverage-premultiplied-constant subtest gives CRC
mismatch on panels with 1366x768 resolution.

In order to get this right fix in from Juha-Pekka, we need to revert the ALIGNMENT
fix previously submitted.

Vidya Srinivas (2):
  Revert "tests/kms_plane_alpha_blend: Align width to 256B"
  tests/kms_plane_alpha_blend: Fix rounding in draw_squares

 tests/kms_plane_alpha_blend.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.32.0
