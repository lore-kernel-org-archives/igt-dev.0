Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05CE10E341
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jul 2023 12:10:31 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Jul 2023 17:44:41 +0530
Message-Id: <20230718121443.445343-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
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

Juha-Pekka Heikkila (1):
  lib/igt_fb: add intel_blt for blitter path on xe
  lib/igt_fb: on xe driver switch from rendercopy to blitcopy

 lib/igt_fb.c | 79 ++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 11 deletions(-)

-- 
2.25.1
