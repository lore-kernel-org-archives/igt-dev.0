Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE1510E665
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 00:47:23 +0000 (UTC)
From: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	John.C.Harrison@Intel.com
Date: Tue, 14 Jun 2022 00:47:20 +0000
Message-Id: <20220614004720.45666-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/drm_fdinfo: Parse compute as well
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

Parse compute engines as well if available.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/igt_drm_fdinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 250d9e89..5beb30b0 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -60,6 +60,7 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
 		"copy",
 		"video",
 		"video-enhance",
+		"compute",
 	};
 	ssize_t name_len;
 	char *name, *p;
-- 
2.25.1
