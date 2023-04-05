Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8133810E2CB
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 00:09:31 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Apr 2023 00:09:08 +0000
Message-Id: <20230405000909.51175-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230405000909.51175-1-umesh.nerlige.ramappa@intel.com>
References: <20230405000909.51175-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib/drm_fdinfo: Check for compute
 engines when parsing
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

DG2 has compute engine support. When parsing the fdinfo for available engines,
also check for compute. This fixes drm_fdinfo@basic for platforms where compute
is present.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
2.34.1
