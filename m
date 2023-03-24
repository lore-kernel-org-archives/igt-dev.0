Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD5C10E12C
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 13:53:55 +0000 (UTC)
Date: Fri, 24 Mar 2023 14:53:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230324135350.a7ryp2hpt23glt64@kamilkon-desk1>
References: <20230324011107.3877669-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230324011107.3877669-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_sysfs: Make i915_for_each_gt an
 alias for for_each_sysfs_gt_dirfd
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

On 2023-03-23 at 18:11:07 -0700, Ashutosh Dixit wrote:
> i915_for_each_gt was the same as for_each_sysfs_gt_dirfd except that the
> last two arguments (gtid and dir) were switched with respect to
> for_each_sysfs_gt_dirfd. Make i915_for_each_gt an alias
> for_each_sysfs_gt_dirfd to resolve the order of these arguments so that we
> only have a single order of arguments to deal with.
> 
> Fixes: cd9b68563e6 ("lib/igt_sysfs: Add i915_for_each_gt() macro")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_sysfs.h         | 5 +----
>  tests/i915/i915_power.c | 2 +-
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index c0fcf6b5739..978b6906e23 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -38,10 +38,7 @@
>  	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
>  	     close(dirfd__), gt__++)
>  
> -#define i915_for_each_gt(i915, gtid, dir) \
> -	for ((gtid) = 0; \
> -	     ((dir) = igt_sysfs_gt_open((i915), (gtid))) != -1; \
> -	     close(dir), (gtid)++)
> +#define i915_for_each_gt for_each_sysfs_gt_dirfd
>  
>  #define igt_sysfs_rps_write(dir, id, data, len) \
>  	igt_sysfs_write(dir, igt_sysfs_dir_id_to_name(dir, id), data, len)
> diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
> index b3757bbe322..333ea002b22 100644
> --- a/tests/i915/i915_power.c
> +++ b/tests/i915/i915_power.c
> @@ -47,7 +47,7 @@ static void sanity(int i915)
>  	/* Wait till at least one spinner starts */
>  	igt_spin_busywait_until_started(spin);
>  	busy = measure_power(&pwr, DURATION_SEC);
> -	i915_for_each_gt(i915, gt, dir) {
> +	i915_for_each_gt(i915, dir, gt) {
>  		req = igt_sysfs_get_u32(dir, "rps_cur_freq_mhz");
>  		act = igt_sysfs_get_u32(dir, "rps_act_freq_mhz");
>  		igt_info("gt %d: req MHz: %d, act MHz: %d\n", gt, req, act);
> -- 
> 2.38.0
> 
