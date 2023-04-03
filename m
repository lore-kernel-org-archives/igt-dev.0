Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0806E10E030
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 05:37:28 +0000 (UTC)
Date: Mon, 3 Apr 2023 07:37:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230403053724.kctv5urufyh7aono@zkempczy-mobl2>
References: <20230328124044.268766-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328124044.268766-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] xe_pm: Kill display for PM tests
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

On Tue, Mar 28, 2023 at 02:40:43PM +0200, Maarten Lankhorst wrote:
> Display keeps PM alive, do the minimal initialization to disable
> display for the PM tests entirely.

What's the reason of enforcing releasing display before starting PM
tests? Looks like introducing testing gap.

--
Zbigniew

> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  tests/xe/xe_pm.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 23b8246ed..861f6b915 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -365,6 +365,8 @@ igt_main
>  	};
>  
>  	igt_fixture {
> +		drmModeResPtr res;
> +
>  		memset(&device, 0, sizeof(device));
>  		device.fd_xe = drm_open_driver(DRIVER_XE);
>  		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
> @@ -376,6 +378,17 @@ igt_main
>  		xe_for_each_hw_engine(device.fd_xe, hwe)
>  			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
>  
> +		/* Kill display, if it exists */
> +		res = drmModeGetResources(device.fd_xe);
> +		if (res) {
> +			igt_display_t display;
> +
> +			drmModeFreeResources(res);
> +			igt_display_require(&display, device.fd_xe);
> +			igt_display_commit2(&display, COMMIT_ATOMIC);
> +			igt_display_fini(&display);
> +		}
> +
>  		get_d3cold_allowed(device.pci_xe, d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
>  	}
> -- 
> 2.34.1
> 
