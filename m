Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B66510E0F4
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 17:47:32 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 17:13:00 +0000
Message-Id: <20230908171300.2749840-5-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230908171300.2749840-1-marcin.bernatowicz@linux.intel.com>
References: <20230908171300.2749840-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 4/4] lib/xe_spin.c: fixed code style
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

Fixed missing space and moved trailing statement to next line.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/xe/xe_spin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index d8e2c07aa..f0d77aed3 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -165,7 +165,8 @@ bool xe_spin_started(struct xe_spin *spin)
  */
 void xe_spin_wait_started(struct xe_spin *spin)
 {
-	while(!xe_spin_started(spin));
+	while (!xe_spin_started(spin))
+		;
 }
 
 void xe_spin_end(struct xe_spin *spin)
-- 
2.30.2
