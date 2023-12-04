Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AA910E404
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 20:47:19 +0000 (UTC)
Message-ID: <79c11e97-7185-4aad-adc3-0dd36f8a1382@intel.com>
Date: Mon, 4 Dec 2023 21:47:13 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
References: <20231204171033.2167-1-lukasz.laguna@intel.com>
 <20231204171033.2167-8-lukasz.laguna@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231204171033.2167-8-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v6 7/8] tests/sriov_basic: validate
 driver binding to VFs
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



On 04.12.2023 18:10, Lukasz Laguna wrote:
> From: Katarzyna Dec <katarzyna.dec@intel.com>
> 
> Test enables VFs in range <1..totalvfs>, bind driver to all of them and
> then unbind driver from all of them.
> 
> v2:
>  - remove checks that are outside the scope of the test (Michal)
>  - change subtest run type (Michal)
> 
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/sriov_basic.c | 49 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index 582e644f2..c2c8e5b6b 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -60,6 +60,36 @@ static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
>  	igt_assert(!err);
>  }
>  
> +/**
> + * SUBTEST: enable-vfs-bind-all-unbind-all
> + * Description:
> + *   Verify VFs enabling, binding the driver and then unbinding it from all of them
> + * Run type: FULL
> + */
> +static void enable_vfs_bind_all_unbind_all(int pf_fd, unsigned int num_vfs)
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
> +		igt_sriov_bind_vf_drm_driver(pf_fd, i);
> +		igt_assert(igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
> +	}

what's the point in keeping all VFs drivers loaded ?
do we really want to stress the system ?
our goal should be to check that VF driver loads on each VF

IMO the enable_vfs_bind_unbind_each() from 8/8 provides sufficient
coverage, while this one will just consume machine-test-hours

also this test duplicates enable_vfs_autoprobe_on() from 5/8 (just loads
the all drivers manually instead of PCI-subsystem autoprobe)

> +
> +	for (int i = 1; i <= num_vfs; i++) {
> +		igt_sriov_unbind_vf_drm_driver(pf_fd, i);
> +		igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, i));
> +	}
> +
> +	igt_sriov_disable_vfs(pf_fd);
> +}
> +
>  igt_main
>  {
>  	int pf_fd;
> @@ -110,6 +140,25 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Verify VFs enabling, binding the driver and then unbinding it from all of them");
> +	igt_subtest_with_dynamic("enable-vfs-bind-all-unbind-all") {
> +		for_each_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-%u", num_vfs) {
> +				enable_vfs_bind_all_unbind_all(pf_fd, num_vfs);
> +			}
> +		}
> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-random") {
> +				enable_vfs_bind_all_unbind_all(pf_fd, num_vfs);
> +			}
> +		}
> +		for_max_sriov_num_vfs(pf_fd, num_vfs) {
> +			igt_dynamic_f("numvfs-all") {
> +				enable_vfs_bind_all_unbind_all(pf_fd, num_vfs);
> +			}
> +		}
> +	}
> +
>  	igt_fixture {
>  		igt_sriov_disable_vfs(pf_fd);
>  		/* abort to avoid execution of next tests with enabled VFs */
