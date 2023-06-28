Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88CB10E0ED
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 11:18:33 +0000 (UTC)
Message-ID: <8dea5f19-66c1-39d1-3e51-a95852ce7ef3@intel.com>
Date: Wed, 28 Jun 2023 16:47:51 +0530
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230627112244.3847791-1-anshuman.gupta@intel.com>
 <20230627112244.3847791-2-anshuman.gupta@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230627112244.3847791-2-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/xe_pm : Add support to
 disable all crtc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


Hi Anshuman

On 6/27/2023 4:52 PM, Anshuman Gupta wrote:
> xe_pm d3 test requires to disable all crtc in order to enter
> to d3 state therefore, adding the support to disable all crtc.
> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/xe/xe_pm.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 23b8246ed..c71fce892 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -34,6 +34,7 @@ typedef struct {
>   	int fd_xe;
>   	struct pci_device *pci_xe;
>   	struct pci_device *pci_root;
> +	igt_display_t display;
>   } device_t;
>   
>   /* runtime_usage is only available if kernel build CONFIG_PM_ADVANCED_DEBUG */
> @@ -150,6 +151,23 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
>   	return true;
>   }
>   
> +static void disable_all_crtc(device_t *device)
> +{
> +	if (!drmModeGetResources(device->fd_xe))
> +		return;
> +
> +	igt_display_require(&device->display, device->fd_xe);
> +	igt_modeset_disable_all_outputs(&device->display);
> +}
> +
> +static void display_fini(device_t *device)
> +{
> +	if (!drmModeGetResources(device->fd_xe))
> +		return;
> +
> +	igt_display_fini(&device->display);
> +}
> +
>   /**
>    * SUBTEST: %s-basic
>    * Description: set GPU state to %arg[1] and test suspend/autoresume
> @@ -378,6 +396,7 @@ igt_main
>   
>   		get_d3cold_allowed(device.pci_xe, d3cold_allowed);
>   		igt_assert(igt_setup_runtime_pm(device.fd_xe));
> +		disable_all_crtc(&device);
Should this be added in setup_d3 instead of fixture? The suspend tests 
will also be executed with crtc disabled otherwise

Thanks
Riana


>   	}
>   
>   	for (const struct s_state *s = s_states; s->name; s++) {
> @@ -438,6 +457,7 @@ igt_main
>   	}
>   
>   	igt_fixture {
> +		display_fini(&device);
>   		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
>   		igt_restore_runtime_pm();
>   		xe_device_put(device.fd_xe);
