Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5036FBAD
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:31:20 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 31 Jan 2020 23:01:05 +0530
Message-Id: <20200131173109.12527-6-ramalingam.c@intel.com>
In-Reply-To: <20200131173109.12527-1-ramalingam.c@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/9] tests/kms_psr: Skip tests on mmap_gtt,
 if no mappable aperture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Due to non availability of the mappable aperture on discrete GPUs,
skip the tests specific to mmap_gtt

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/kms_psr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index d9be87d927b2..13ed02f46ac4 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -270,6 +270,7 @@ static void run_test(data_t *data)
 		expected = "GREEN";
 		break;
 	case MMAP_GTT:
+		gem_require_mappable_ggtt(data->drm_fd);
 		ptr = gem_mmap__gtt(data->drm_fd, handle, data->mod_size,
 				    PROT_WRITE);
 		gem_set_domain(data->drm_fd, handle,
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
