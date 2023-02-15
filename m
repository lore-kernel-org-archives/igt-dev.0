Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3827210E144
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Feb 2023 15:19:08 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Feb 2023 20:51:22 +0530
Message-Id: <20230215152123.12883-3-swati2.sharma@intel.com>
In-Reply-To: <20230215152123.12883-1-swati2.sharma@intel.com>
References: <20230215152123.12883-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_plane_scaling: Remove extra
 newline
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

Remove extra newline.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 382d199e0..9737d8645 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -872,7 +872,6 @@ static void invalid_parameter_tests(data_t *d)
 							paramtests[i].planesize[0],
 							paramtests[i].planesize[1]);
 
-
 				for (uint32_t j = 0; paramtests[i].params[j].prop != ~0; j++)
 					igt_plane_set_prop_value(plane,
 									paramtests[i].params[j].prop,
-- 
2.25.1
