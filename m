Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B6910E2EF
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 15:47:44 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 21:17:10 +0530
Message-Id: <20230605154710.460104-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: fix typo in clamp16()
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

Fix typo in return type of clamp16().

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 11a5d6c0..9be312a2 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3069,7 +3069,7 @@ static uint8_t clamp8(float val)
 	return clamp((int)(val + 0.5f), 0, 255);
 }
 
-static uint8_t clamp16(float val)
+static uint16_t clamp16(float val)
 {
 	return clamp((int)(val + 0.5f), 0, 65535);
 }
-- 
2.25.1
