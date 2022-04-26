Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F11A10E549
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 08:33:32 +0000 (UTC)
Date: Tue, 26 Apr 2022 10:33:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmeuWDU0jQvxVCUc@kamilkon-DESK1>
References: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
 <20220421145211.464313-4-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220421145211.464313-4-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] lib/sysfs: helper for number of gts
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

Hi Priyanka,

On 2022-04-21 at 20:22:08 +0530, priyanka.dandamudi@intel.com wrote:
> From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> 
> Added convenience function returning number of gts.
> It is calculated as number of gt sysfs entries,
> if no entries are found it returns 1 as number of gts.
> 
Please change gts in subject and commit message to GTs
s/gts/GTs/

> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/igt_sysfs.c | 21 +++++++++++++++++++++
>  lib/igt_sysfs.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index b167c050..aebc6eb7 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -175,6 +175,27 @@ int igt_sysfs_gt_open(int device, int gt)
>  	return open(path, O_RDONLY);
>  }
>  
> +/**
> + * igt_sysfs_get_num_gts:
------------------------- ^
imho this function name should be igt_sysfs_get_num_gt

> + * @device: fd of the device
> + *
> + * Reads number of gt sysfs entries.
> + * If no gt sysfs entries are found returns 1

Why not zero for no entries ? This '1' do not match with previous
description one line above. Maybe there should be additional
function

igt_get_num_gt

and that one will return >= 1 if i915 driver (or other GPU
driver) is loaded ?

> + * (see igt_sysfs_gt_path).
> + *
> + * Returns: Number of gts (at least one).

s/gts/GTs/

> + */
> +int igt_sysfs_get_num_gts(int device)

s/gts/gt/

> +{
> +	int num_gts = 0;
> +	char path[96];
> +
> +	while (igt_sysfs_gt_path(device, num_gts, path, sizeof(path)))
> +		++num_gts;

If while fails at start then num_gts will be 0.
imho here should be igt_assert(num_gts > 0);

> +
> +	return num_gts;
> +}
> +
>  /**
>   * igt_sysfs_write:
>   * @dir: directory for the device from igt_sysfs_open()
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 33317a96..6c8b92a7 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -42,6 +42,7 @@ char *igt_sysfs_path(int device, char *path, int pathlen);
>  int igt_sysfs_open(int device);
>  char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
>  int igt_sysfs_gt_open(int device, int gt);
> +int igt_sysfs_get_num_gts(int device);

s/gts/gt/

>  bool igt_sysfs_has_attr(int dir, const char *attr);
>  
>  int igt_sysfs_read(int dir, const char *attr, void *data, int len);
> -- 
> 2.25.1
>
Regards,
Kamil
 
