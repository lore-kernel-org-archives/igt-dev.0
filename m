Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BDA10E7DA
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 10:45:39 +0000 (UTC)
Date: Fri, 1 Dec 2023 11:45:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231201104535.gmwuhpb6bpk3spxw@kamilkon-desk.igk.intel.com>
References: <20231201100725.8646-1-mohammed.thasleem@intel.com>
 <20231201100725.8646-2-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201100725.8646-2-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH v3 1/2] lib/intel_chipset: Add
 AT_LEAST_DISPLAY for display version compare
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

Hi Mohammed,
On 2023-12-01 at 15:37:24 +0530, Mohammed Thasleem wrote:
> Added AT_LEAST_DISPLAY check for display version compare.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_chipset.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 1edc8e92c..3f2534519 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -208,6 +208,7 @@ void intel_check_pch(void);
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>  #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> +#define AT_LEAST_DISPLAY(devid, x) (intel_get_device_info(devid)->display_ver >= x)
>  
>  #define IS_GEN2(devid)		IS_GEN(devid, 2)
>  #define IS_GEN3(devid)		IS_GEN(devid, 3)
> -- 
> 2.25.1
> 
