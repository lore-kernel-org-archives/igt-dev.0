Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD1310E07F
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 15:07:16 +0000 (UTC)
Date: Wed, 13 Dec 2023 16:07:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v7 7/7] tests/sriov_basic: validate driver binding
 to VFs
Message-ID: <20231213150711.pxfpukg352p3pnft@kamilkon-desk.igk.intel.com>
References: <20231205081618.18143-1-lukasz.laguna@intel.com>
 <20231205081618.18143-8-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205081618.18143-8-lukasz.laguna@intel.com>
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
On 2023-12-05 at 09:16:18 +0100, Lukasz Laguna wrote:
> - bind-unbind-vf: validate driver binding and unbinding to specified VF
> - enable-vfs-bind-unbind-each: validate driver binding and unbinding to
>   VFs from specified range.
> 
> v2:
>  - remove checks that are outside the scope of the test (Michal)
> 
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/sriov_basic.c | 90 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index 582e644f2..96ee5943e 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -60,6 +60,58 @@ static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
>  	igt_assert(!err);
>  }
>  
> +/**
> + * SUBTEST: enable-vfs-bind-unbind-each
> + * Description:
> + *   Verify VFs enabling with binding and unbinding the driver one be one to each of them
> + * Run type: BAT
> + */
> +static void enable_vfs_bind_unbind_each(int pf_fd, unsigned int num_vfs)
> +{
> +	igt_debug("Testing %u VFs\n", num_vfs);
> +
> +	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	igt_sriov_enable_driver_autoprobe(pf_fd);
> +
> +	for (int i = 1; i <= num_vfs; i++) {
> +		igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, i));

Put newline here.

> +		igt_sriov_bind_vf_drm_driver(pf_fd, i);
> +		igt_assert(igt_sriov_is_vf_drm_driver_probed(pf_fd, i));

Put newline here.

> +		igt_sriov_unbind_vf_drm_driver(pf_fd, i);
> +		igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +}
> +
> +/**
> + * SUBTEST: bind-unbind-vf
> + * Description:
> + *   Verify binding and unbinding the driver to specific VF
> + * Run type: BAT
> + */
> +static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
> +{
> +	igt_debug("Testing VF%u\n", vf_num);
> +
> +	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, vf_num);
> +	igt_sriov_enable_driver_autoprobe(pf_fd);
> +
> +	igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num));

Put newline here.

> +	igt_sriov_bind_vf_drm_driver(pf_fd, vf_num);
> +	igt_assert(igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num));

Put newline here.

With that:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +	igt_sriov_unbind_vf_drm_driver(pf_fd, vf_num);
> +	igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num));
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +}
> +
>  igt_main
>  {
>  	int pf_fd;
> @@ -110,6 +162,44 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Verify VFs enabling with binding and unbinding the driver one be one to each of them");
> +	igt_subtest_with_dynamic("enable-vfs-bind-unbind-each") {
> +		for_each_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-%u", num_vfs) {
> +				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
> +			}
> +		}
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
> +			}
> +		}
> +		for_max_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-all") {
> +				enable_vfs_bind_unbind_each(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
> +	igt_describe("Test binds and unbinds the driver to specific VF");
> +	igt_subtest_with_dynamic("bind-unbind-vf") {
> +		for_each_sriov_vf(pf_fd, vf) {
> +			igt_dynamic_f("vf-%u", vf) {
> +				bind_unbind_vf(pf_fd, vf);
> +			}
> +		}
> +		for_random_sriov_vf(pf_fd, vf) {
> +			igt_dynamic_f("vf-random") {
> +				bind_unbind_vf(pf_fd, vf);
> +			}
> +		}
> +		for_last_sriov_vf(pf_fd, vf) {
> +			igt_dynamic_f("vf-last") {
> +				bind_unbind_vf(pf_fd, vf);
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		igt_sriov_disable_vfs(pf_fd);
>  		/* abort to avoid execution of next tests with enabled VFs */
> -- 
> 2.40.0
> 
