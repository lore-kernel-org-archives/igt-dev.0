Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5461010E45B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 13:33:20 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Wed, 14 Jun 2023 15:33:01 +0200
Message-Id: <20230614133301.4888-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230614133301.4888-1-dominik.karol.piatkowski@intel.com>
References: <20230614133301.4888-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] lib/igt_core.h: Typo fix
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

Fixed IGT_EXIT_ABORT description typo in lib/igt_core.h

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 lib/igt_core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index ef6bed6a5..26bb0cb68 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -136,8 +136,8 @@ struct _GKeyFile *igt_load_igtrc(void);
 /**
  * IGT_EXIT_ABORT
  *
- * Exit status indicating a severe test/enviroment failure, any continued
- * testing past this point can yeild unexpected reasults and is not recommended
+ * Exit status indicating a severe test/environment failure, any continued
+ * testing past this point can yield unexpected results and is not recommended
  */
 #define IGT_EXIT_ABORT 112
 
-- 
2.34.1


