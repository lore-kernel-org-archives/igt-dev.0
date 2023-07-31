Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCFD10E149
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 08:14:39 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Jul 2023 13:48:39 +0530
Message-Id: <20230731081841.1139659-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] enable tiled framebuffers on xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch series add supports for tiled framebuffers on xe
driver by adding blitter support

Juha-Pekka Heikkila (2):
  lib/igt_fb: add intel_blt for blitter path on xe
  lib/igt_fb: on xe driver switch from rendercopy to blitcopy

 lib/igt_fb.c | 84 ++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 12 deletions(-)

-- 
2.25.1
