Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C3C10FF3A
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 15:19:02 +0000 (UTC)
Date: Thu, 14 Apr 2022 17:18:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Ylg7YRF+9M6oQDk9@kamilkon-DESK1>
References: <deb07be64c3930945a0e7bd17989fda4ed2e5ece.1649870633.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deb07be64c3930945a0e7bd17989fda4ed2e5ece.1649870633.git.ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_sysfs: Add helpers to
 iterate over gts
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh,

may you change last word in subject from "gts" into "GTs" ?

Dnia 2022-04-13 at 10:27:46 -0700, Ashutosh Dixit napisał(a):
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Provide iterators to:
> - construct the subdirectory string for a gt
> - obtain fd for the subdirectory of the interface
> 
> Cc: Andi Shyti <andi.shyti@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  lib/igt_sysfs.c | 137 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  67 +++++++++++++++++++++++
>  2 files changed, 204 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index f8ef23e2c8e2..1ba26c0b3fc2 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -44,6 +44,87 @@
>  #include "igt_device.h"
>  #include "igt_io.h"
>  
> +enum {
> +	GT,
> +	RPS,
> +
> +	SYSFS_NUM_TYPES,
> +};
> +
> +static const char *i915_attr_name[SYSFS_NUM_TYPES][SYSFS_NUM_ATTR] = {
> +	{
> +		"gt_act_freq_mhz",
> +		"gt_cur_freq_mhz",
> +		"gt_min_freq_mhz",
> +		"gt_max_freq_mhz",
> +		"gt_RP0_freq_mhz",
> +		"gt_RP1_freq_mhz",
> +		"gt_RPn_freq_mhz",
------------------- ^ ------ ^
I suppose it is too late now, but mixing capitals with small
letters is bad, it should either be all small or proper names,
so either rpn and mhz or RPn and MHz (MHz for Mega Hertz).

> +		"gt_idle_freq_mhz",
> +		"gt_boost_freq_mhz",
> +		"power/rc6_enable",
> +		"power/rc6_residency_ms",
> +		"power/rc6p_residency_ms",
> +		"power/rc6pp_residency_ms",
> +		"power/media_rc6_residency_ms",
> +	},
> +	{
> +		"rps_act_freq_mhz",
> +		"rps_cur_freq_mhz",
> +		"rps_min_freq_mhz",
> +		"rps_max_freq_mhz",
> +		"rps_RP0_freq_mhz",
> +		"rps_RP1_freq_mhz",
> +		"rps_RPn_freq_mhz",
> +		"rps_idle_freq_mhz",
> +		"rps_boost_freq_mhz",
> +		"rc6_enable",
> +		"rc6_residency_ms",
> +		"rc6p_residency_ms",
> +		"rc6pp_residency_ms",
> +		"media_rc6_residency_ms",
> +	},
> +};
> +
> +/**
> + * igt_sysfs_has_attr:
> + * @dir: sysfs directory fd
> + * @attr: attr inside sysfs dir that needs to be checked for existence
> + *
> + * This checks if specified attr exists in device sysfs directory.
> + *
> + * Returns:
> + * true if attr exists in sysfs, false otherwise.
> + */
> +bool igt_sysfs_has_attr(int dir, const char *attr)
> +{
> +	return !faccessat(dir, attr, F_OK, 0);
> +}
> +
> +const char *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id)
> +{
> +	igt_assert(id < SYSFS_NUM_ATTR);
> +
> +	return igt_sysfs_has_attr(dir, i915_attr_name[GT][id]) ?
> +		i915_attr_name[GT][id] :
> +		i915_attr_name[RPS][id];
> +}
> +
> +const char *igt_sysfs_path_id_to_name(const char *path, enum i915_attr_id id)
> +{
> +	int dir;
> +	const char *name;
> +
> +	dir = open(path, O_RDONLY);
> +	if (dir < 0)
> +		return NULL;
> +
> +	name = igt_sysfs_dir_id_to_name(dir, id);
> +	close(dir);
> +
> +	return name;
> +}
> +
>  /**
>   * SECTION:igt_sysfs
>   * @short_description: Support code for sysfs features
> @@ -104,6 +185,62 @@ int igt_sysfs_open(int device)
>  	return open(path, O_RDONLY);
>  }
>  
> +/**
> + * igt_sysfs_gt_path:
> + * @device: fd of the device
> + * @gt: gt number
> + * @path: buffer to fill with the sysfs gt path to the device
> + * @pathlen: length of @path buffer
> + *
> + * This finds the sysfs directory corresponding to @device and @gt. If the gt
> + * specific directory is not available and gt is 0, path is filled with sysfs
> + * base directory.
> + *
> + * Returns:
> + * The directory path, or NULL on failure.
> + */
> +char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen)
> +{
> +	struct stat st;
> +
> +	if (device < 0)
> +		return NULL;
> +
> +	if (igt_debug_on(fstat(device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
> +		return NULL;
> +
> +	snprintf(path, pathlen, "/sys/dev/char/%d:%d/gt/gt%d",
> +		 major(st.st_rdev), minor(st.st_rdev), gt);
> +
> +	if (!igt_debug_on(access(path, F_OK)))
> +		return path;
> +	else if (!igt_debug_on(gt != 0))
> +		return igt_sysfs_path(device, path, pathlen);
> +
> +	return NULL;
> +}
> +
> +/**
> + * igt_sysfs_gt_open:
> + * @device: fd of the device
> + * @gt: gt number
> + *
> + * This opens the sysfs gt directory corresponding to device and gt for use
> + * with igt_sysfs_set() and igt_sysfs_get().
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_sysfs_gt_open(int device, int gt)
> +{
> +	char path[96];
> +
> +	if (igt_debug_on(!igt_sysfs_gt_path(device, gt, path, sizeof(path))))
> +		return -1;
> +
> +	return open(path, O_RDONLY);
> +}
> +
>  /**
>   * igt_sysfs_write:
>   * @dir: directory for the device from igt_sysfs_open()
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 56741a0a37e3..8e39b8fa9890 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -28,8 +28,75 @@
>  #include <stdbool.h>
>  #include <stdarg.h>
>  
> +#define for_each_sysfs_gt_path(i915__, path__, pathlen__) \
> +	for (int gt__ = 0; \
> +	     igt_sysfs_gt_path(i915__, gt__, path__, pathlen__) != NULL; \
> +	     gt__++)
> +
> +#define for_each_sysfs_gt_dirfd(i915__, dirfd__, gt__) \
> +	for (gt__ = 0; \
> +	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
> +	     close(dirfd__), gt__++)
> +
> +#define igt_sysfs_rps_write(dir, id, data, len) \
> +	igt_sysfs_write(dir, igt_sysfs_dir_id_to_name(dir, id), data, len)
> +
> +#define igt_sysfs_rps_read(dir, id, data, len) \
> +	igt_sysfs_read(dir, igt_sysfs_dir_id_to_name(dir, id), data, len)
> +
> +#define igt_sysfs_rps_set(dir, id, value) \
> +	igt_sysfs_set(dir, igt_sysfs_dir_id_to_name(dir, id), value)
> +
> +#define igt_sysfs_rps_get(dir, id) \
> +	igt_sysfs_get(dir, igt_sysfs_dir_id_to_name(dir, id))
> +
> +#define igt_sysfs_rps_scanf(dir, id, fmt, ...) \
> +	igt_sysfs_scanf(dir, igt_sysfs_dir_id_to_name(dir, id), fmt, ##__VA_ARGS__)
> +
> +#define igt_sysfs_rps_vprintf(dir, id, fmt, ap) \
> +	igt_sysfs_vprintf(dir, igt_sysfs_dir_id_to_name(id), fmt, ap)
> +
> +#define igt_sysfs_rps_printf(dir, id, fmt, ...) \
> +	igt_sysfs_printf(dir, igt_sysfs_dir_id_to_name(dir, id), fmt, ##__VA_ARGS__)
> +
> +#define igt_sysfs_rps_get_u32(dir, id) \
> +	igt_sysfs_get_u32(dir, igt_sysfs_dir_id_to_name(dir, id))
> +
> +#define igt_sysfs_rps_set_u32(dir, id, value) \
> +	igt_sysfs_set_u32(dir, igt_sysfs_dir_id_to_name(dir, id), value)
> +
> +#define igt_sysfs_rps_get_boolean(dir, id) \
> +	igt_sysfs_get_boolean(dir, igt_sysfs_dir_id_to_name(dir, id))
> +
> +#define igt_sysfs_rps_set_boolean(dir, id, value) \
> +	igt_sysfs_set_boolean(dir, igt_sysfs_dir_id_to_name(dir, id), value)
> +
> +enum i915_attr_id {
> +	RPS_ACT_FREQ_MHZ,
> +	RPS_CUR_FREQ_MHZ,
> +	RPS_MIN_FREQ_MHZ,
> +	RPS_MAX_FREQ_MHZ,
> +	RPS_RP0_FREQ_MHZ,
> +	RPS_RP1_FREQ_MHZ,
> +	RPS_RPn_FREQ_MHZ,
> +	RPS_IDLE_FREQ_MHZ,
> +	RPS_BOOST_FREQ_MHZ,
> +	RC6_ENABLE,
> +	RC6_RESIDENCY_MS,
> +	RC6P_RESIDENCY_MS,
> +	RC6PP_RESIDENCY_MS,
> +	MEDIA_RC6_RESIDENCY_MS,
> +
> +	SYSFS_NUM_ATTR,
> +};
> +
>  char *igt_sysfs_path(int device, char *path, int pathlen);
>  int igt_sysfs_open(int device);
> +char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
> +int igt_sysfs_gt_open(int device, int gt);
> +bool igt_sysfs_has_attr(int dir, const char *attr);

These two functions below have no descriptions in c file.

> +const char *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id);
> +const char *igt_sysfs_path_id_to_name(const char *path, enum i915_attr_id id);
>  
>  int igt_sysfs_read(int dir, const char *attr, void *data, int len);
>  int igt_sysfs_write(int dir, const char *attr, const void *data, int len);
> -- 
> 2.34.1
> 
Regards,
Kamil
