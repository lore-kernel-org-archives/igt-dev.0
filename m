Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEE910E0B4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 06:27:23 +0000 (UTC)
Date: Tue, 28 Mar 2023 08:27:17 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230328082717.110b7984@maurocar-mobl2>
In-Reply-To: <20230328053303.26627-1-niranjana.vishwanathapura@intel.com>
References: <20230328053303.26627-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_guc_pc: Skip RC6 tests for
 PVC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 27 Mar 2023 22:33:03 -0700
Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> wrote:

> The Pontevecchio (PVC) platform doesn't have rc6 support yet.
> Skip rc6_on_idle and rc0_on_exec subtests for PVC.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  tests/xe/xe_guc_pc.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
> index 60c93288b..9fc2429d8 100644
> --- a/tests/xe/xe_guc_pc.c
> +++ b/tests/xe/xe_guc_pc.c
> @@ -375,6 +375,38 @@ static bool in_rc6(int sysfs, int gt_id)
>  	return strcmp(rc, "rc6") == 0;
>  }
>  
> +static bool is_rc6_supported(int fd)
> +{
> +	struct drm_xe_query_config *config;
> +	struct drm_xe_device_query query = {
> +		.query = DRM_XE_DEVICE_QUERY_CONFIG,
> +	};
> +	uint16_t devid;
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	config = malloc(query.size);
> +	igt_assert(config);
> +
> +	query.data = to_user_pointer(config);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	/* No rc6 support yet on Pontevecchio */
> +	devid = config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
> +	return !(
> +		devid == 0x0BD0 ||
> +		devid == 0x0BD1 ||
> +		devid == 0x0BD2 ||
> +		devid == 0x0BD5 ||
> +		devid == 0x0BD6 ||
> +		devid == 0x0BD7 ||
> +		devid == 0x0BD8 ||
> +		devid == 0x0BD9 ||
> +		devid == 0x0BDA ||
> +		devid == 0x0BDB
> +		);
> +}

Instead of hardcoding a list of devices, better to check for GPU version.
Something like this (completely untested) patch:

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index c2c8998dd955..21ddb016960e 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -203,6 +203,7 @@ void intel_check_pch(void);
 #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
+#define IS_GEN_VER(devid, x, y)	(intel_graphics_ver(devid) == IP_VER(x, y))
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
 
 #define IS_GEN2(devid)		IS_GEN(devid, 2)
@@ -217,6 +218,8 @@ void intel_check_pch(void);
 #define IS_GEN11(devid)		IS_GEN(devid, 11)
 #define IS_GEN12(devid)		IS_GEN(devid, 12)
 
+#define IS_PONTEVECCHIO(devid)	IS_GEN_VER(devid, 12, 60)
+
 #define IS_MOBILE(devid)	(intel_get_device_info(devid)->is_mobile)
 #define IS_965(devid)		AT_LEAST_GEN(devid, 4)
 
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 60c93288bfdb..819d415372ae 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -467,6 +467,7 @@ igt_main
 	}
 
 	igt_subtest("rc6_on_idle") {
+		igt_require(IS_PONTEVECCHIO(intel_get_drm_devid(fd)));
 		xe_for_each_gt(fd, gt) {
 			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
 		}

