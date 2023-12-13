Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4690510E79C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 14:34:18 +0000 (UTC)
Date: Wed, 13 Dec 2023 15:34:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t v7 4/7] lib/igt_sriov_device: add helpers for
 operations in different VFs scenarios
Message-ID: <20231213143412.l5twbu6ri4rucyue@kamilkon-desk.igk.intel.com>
References: <20231205081618.18143-1-lukasz.laguna@intel.com>
 <20231205081618.18143-5-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205081618.18143-5-lukasz.laguna@intel.com>
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

Hi Lukasz,
On 2023-12-05 at 09:16:15 +0100, Lukasz Laguna wrote:
> Added helpers:
> - for_each_vf and for_each_num_vfs
> - for_random_vf and for_random_num_vfs
> - for_last_vf and for_max_num_vfs
> 
> v2:
>  - document helpers (Michal)
> v3:
>  - add "_sriov_" in helpers name (Kamil)
> 
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_sriov_device.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index ddbda6cd6..c442c41a7 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -26,4 +26,45 @@ void igt_sriov_disable_driver_autoprobe(int pf);
>  int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
>  bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
>  
> +/**
> + * for_each_sriov_vf - Helper for running code on each VF
> + * @__pf_fd: PF device file descriptor
> + * @__vf_num: VFs iterator
> + *
> + * For loop that iterates over all VFs associated with given PF @__pf_fd.
> + */
> +#define for_each_sriov_vf(__pf_fd, __vf_num) \
> +	for (unsigned int __vf_num = 1, __total_vfs = igt_sriov_get_total_vfs(__pf_fd); \
> +	     __vf_num <= __total_vfs; \
> +	     ++__vf_num)
> +#define for_each_sriov_num_vfs for_each_sriov_vf
> +
> +/**
> + * for_random_sriov_vf - Helper for running code on random VF
> + * @__pf_fd: PF device file descriptor
> + * @__vf_num: stores random VF
> + *
> + * Helper allows to run code using random VF number (stored in @__vf_num)
> + * picked from the range of all VFs associated with given PF @__pf_fd.
> + */
> +#define for_random_sriov_vf(__pf_fd, __vf_num) \
> +	for (unsigned int __vf_num = 1 + random() % igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
> +	     __tmp < 1; \
> +	     ++__tmp)
> +#define for_random_sriov_num_vfs for_random_sriov_vf
> +
> +/**
> + * for_last_sriov_vf - Helper for running code on last VF
> + * @__pf_fd: PF device file descriptor
> + * @__vf_num: stores last VF number
> + *
> + * Helper allows to run code using last VF number (stored in @__vf_num)
> + * associated with given PF @__pf_fd.
> + */
> +#define for_last_sriov_vf(__pf_fd, __vf_num) \
> +	for (unsigned int __vf_num = igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
> +	     __tmp < 1; \
> +	     ++__tmp)
> +#define for_max_sriov_num_vfs for_last_sriov_vf
> +
>  #endif /* __IGT_SRIOV_DEVICE_H__ */
> -- 
> 2.40.0
> 
