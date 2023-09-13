Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D938B10E4CA
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 14:24:28 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Sep 2023 16:24:16 +0200
Message-Id: <20230913142417.584184-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230913142417.584184-1-zbigniew.kempczynski@intel.com>
References: <20230913142417.584184-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_batchbuffer: Add Meteorlake
 gpgpu fill entry
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

From: Arjun Melkaveri <arjun.melkaveri@intel.com>

Meteorlake is using XeHP pipeline for gpgpu fill so it must be
added first as it is an exception in newer platforms condition.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 lib/intel_batchbuffer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 682c0fe1d2..e7b1b755fd 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -755,7 +755,9 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
 {
 	igt_fillfunc_t fill = NULL;
 
-	if (intel_graphics_ver(devid) >= IP_VER(12, 60))
+	if (IS_METEORLAKE(devid))
+		fill = xehp_gpgpu_fillfunc;
+	else if (intel_graphics_ver(devid) >= IP_VER(12, 60))
 		fill = xehpc_gpgpu_fillfunc;
 	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
 		fill = xehp_gpgpu_fillfunc;
-- 
2.34.1
