Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3742410E02C
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 15:47:10 +0000 (UTC)
Date: Fri, 1 Dec 2023 16:46:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231201154602.23nhmop2tpqvklqu@kamilkon-desk.igk.intel.com>
References: <20231130124841.16248-1-lukasz.laguna@intel.com>
 <20231130124841.16248-5-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231130124841.16248-5-lukasz.laguna@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/8] lib/igt_sriov_device: add helpers
 for operations in different VFs scenarios
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

Hi Lukasz,
On 2023-11-30 at 13:48:37 +0100, Lukasz Laguna wrote:
> Added helpers:
> - for_each_vf and for_each_num_vfs
> - for_random_vf and for_random_num_vfs
> - for_last_vf and for_max_num_vfs
> 
> v2:
>  - document helpers (Michal)
> 
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  lib/igt_sriov_device.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index 84f033f52..3ab984720 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -28,4 +28,45 @@ void igt_sriov_disable_driver_autoprobe(int pf);
>  int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
>  bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
>  
> +/**
> + * for_each_vf - Helper for running code on each VF
> + * @__pf_fd: PF device file descriptor
> + * @__vf_num: VFs iterator
> + *
> + * For loop that iterates over all VFs associated with given PF @__pf_fd.
> + */
> +#define for_each_vf(__pf_fd, __vf_num) \
> +	for (unsigned int __vf_num = 1, __total_vfs = igt_sriov_get_total_vfs(__pf_fd); \
> +	     __vf_num <= __total_vfs; \
> +	     ++__vf_num)
> +#define for_each_num_vfs for_each_vf
> +
> +/**
> + * for_random_vf - Helper for running code on random VF
> + * @__pf_fd: PF device file descriptor
> + * @__vf_num: stores random VF
> + *
> + * Helper allows to run code using random VF number (stored in @__vf_num)
> + * picked from the range of all VFs associated with given PF @__pf_fd.
> + */
> +#define for_random_vf(__pf_fd, __vf_num) \
> +	for (unsigned int __vf_num = 1 + random() % igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
> +	     __tmp < 1; \
> +	     ++__tmp)
> +#define for_random_num_vfs for_random_vf
> +
> +/**
> + * for_last_vf - Helper for running code on last VF
> + * @__pf_fd: PF device file descriptor
> + * @__vf_num: stores last VF number
> + *
> + * Helper allows to run code using last VF number (stored in @__vf_num)
> + * associated with given PF @__pf_fd.
> + */
> +#define for_last_vf(__pf_fd, __vf_num) \
> +	for (unsigned int __vf_num = igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
> +	     __tmp < 1; \
> +	     ++__tmp)
> +#define for_max_num_vfs for_last_vf

Could these macros have _sriov_ in its name? For example:

#define for_random_sriov for_random_sriov_vf

Depending on number of heavy useage _vf may be dropped, imho this
is also good, like all usage will be mainly in VF:

    for_last_sriov
    for_random_sriov
    for_each_sriov

One final note, maybe in one of previous patch but please also
add descriptions for PF and VF shortcuts (like that for SR-IOV).

Regards,
Kamil

> +
>  #endif /* __IGT_SRIOV_DEVICE_H__ */
> -- 
> 2.40.0
> 
