Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0014D10E02F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 05:23:59 +0000 (UTC)
Message-ID: <93d643c7-038c-5fa8-bc22-3eaa5231b89c@intel.com>
Date: Mon, 12 Jun 2023 10:53:40 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230609101205.2803975-1-kunal1.joshi@intel.com>
 <20230609101205.2803975-2-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230609101205.2803975-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] RFC
 tests/i915/kms_frontbuffer_tracking: Add xe support
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


On Fri-09-06-2023 03:42 pm, Kunal Joshi wrote:
> Add support for DRIVER_XE
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/i915/kms_frontbuffer_tracking.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index 650e14a7..c2b99670 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -1338,7 +1338,7 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
>   
>   static void setup_drm(void)
>   {
> -	drm.fd = drm_open_driver_master(DRIVER_INTEL);
> +	drm.fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);

LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

>   	drm.debugfs = igt_debugfs_dir(drm.fd);
>   
>   	kmstest_set_vt_graphics_mode();
