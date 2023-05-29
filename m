Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132810E283
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 11:44:59 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2af2f4e719eso34230841fa.2
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 04:44:58 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 14:44:50 +0300
Message-Id: <20230529114450.4633-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: fix segfault on
 discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Eero Tamminen <eero.t.tamminen@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

in case no display clients ignore display client list

Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tools/intel_gpu_top.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index a89f13d4..cef1d3c7 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -837,6 +837,9 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
 	struct igt_drm_clients *aggregated;
 	int tmp, num = 0;
 
+	if (!clients)
+		return NULL;
+
 	if (!aggregate_pids)
 		goto out;
 
-- 
2.25.1
