Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470D310E3DE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 13:28:21 +0000 (UTC)
Date: Thu, 23 Mar 2023 14:28:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <20230323132816.zjgkndyub7gny37b@kamilkon-desk1>
References: <20230322230402.3342787-1-ashutosh.dixit@intel.com>
 <20230322230402.3342787-2-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230322230402.3342787-2-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_sysfs: Add
 i915_for_each_gt() macro
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

On 2023-03-22 at 16:04:01 -0700, Ashutosh Dixit wrote:
> From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> Add a macro to iterate over all the gts
> 
> v2: s/for_each_gt/i915_for_each_gt/ because of introduction of
>     xe_for_each_gt
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_sysfs.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 2e3c4813adc..c0fcf6b5739 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -38,6 +38,11 @@
>  	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
>  	     close(dirfd__), gt__++)
>  
> +#define i915_for_each_gt(i915, gtid, dir) \
> +	for ((gtid) = 0; \
> +	     ((dir) = igt_sysfs_gt_open((i915), (gtid))) != -1; \
> +	     close(dir), (gtid)++)
> +
>  #define igt_sysfs_rps_write(dir, id, data, len) \
>  	igt_sysfs_write(dir, igt_sysfs_dir_id_to_name(dir, id), data, len)
>  
> -- 
> 2.38.0
> 
