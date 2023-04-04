Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5743E10E5D5
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 06:27:15 +0000 (UTC)
Date: Mon, 3 Apr 2023 23:27:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230404062647.jhxel4t4c35ivb7c@ldmartin-desk2.lan>
References: <20230328083908.2476581-1-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230328083908.2476581-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] xe/xe_huc_copy: use IS_TIGERLAKE macro
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 10:39:08AM +0200, Mauro Carvalho Chehab wrote:
>From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>Instead of hardcoding the PCI IDs at the test, use a macro
>to check if the platform is compatible with the test.
>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

neither this or the previous solution scale well. Can we get this info
from huc_info in debugfs?

We are already loading HuC in platforms other than TGL

Lucas De Marchi

>---
> tests/xe/xe_huc_copy.c | 38 +-------------------------------------
> 1 file changed, 1 insertion(+), 37 deletions(-)
>
>diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
>index ee3896cef8b9..cd68dbb5ac50 100644
>--- a/tests/xe/xe_huc_copy.c
>+++ b/tests/xe/xe_huc_copy.c
>@@ -152,42 +152,6 @@ test_huc_copy(int fd)
> 	xe_vm_destroy(fd, vm);
> }
>
>-static bool
>-is_device_supported(int fd)
>-{
>-	struct drm_xe_query_config *config;
>-	struct drm_xe_device_query query = {
>-		.extensions = 0,
>-		.query = DRM_XE_DEVICE_QUERY_CONFIG,
>-		.size = 0,
>-		.data = 0,
>-	};
>-	uint16_t devid;
>-
>-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>-
>-	config = malloc(query.size);
>-	igt_assert(config);
>-
>-	query.data = to_user_pointer(config);
>-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>-
>-	devid = config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
>-	return (
>-			devid == 0x9A60 ||
>-			devid == 0x9A68 ||
>-			devid == 0x9A70 ||
>-			devid == 0x9A40 ||
>-			devid == 0x9A49 ||
>-			devid == 0x9A59 ||
>-			devid == 0x9A78 ||
>-			devid == 0x9AC0 ||
>-			devid == 0x9AC9 ||
>-			devid == 0x9AD9 ||
>-			devid == 0x9AF8
>-		);
>-}
>-
> igt_main
> {
> 	int xe;
>@@ -198,7 +162,7 @@ igt_main
> 	}
>
> 	igt_subtest("huc_copy") {
>-		igt_skip_on(!is_device_supported(xe));
>+		igt_skip_on(!IS_TIGERLAKE(intel_get_drm_devid(xe)));
> 		test_huc_copy(xe);
> 	}
>
>-- 
>2.39.2
>

