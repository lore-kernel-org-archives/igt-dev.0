Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5533989CBC
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 08:17:28 +0000 (UTC)
Date: Tue, 15 Jun 2021 11:19:09 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YMhiff2k3S9MDYmx@platvala-desk.ger.corp.intel.com>
References: <20210614153557.19934-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614153557.19934-1-Anson.Jacob@amd.com>
Subject: Re: [igt-dev] [i-g-t,
 1/2] tests/amdgpu: Introduced new amdgpu module reload test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anson Jacob <Anson.Jacob@amd.com>
Cc: igt-dev@lists.freedesktop.org, Victor Lu <victorchengchi.lu@amd.com>, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 11:35:56AM -0400, Anson Jacob wrote:
> From: Victor Lu <victorchengchi.lu@amd.com>
> 
> Based off of i915/i915_module_load, unloads and loads the
> amdgpu module.
> 
> Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
> Acked-by: Anson Jacob <Anson.Jacob@amd.com>
> ---
>  lib/igt_kmod.c                 | 41 ++++++++++++++++++
>  lib/igt_kmod.h                 |  3 ++
>  tests/amdgpu/amd_module_load.c | 77 ++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build       |  1 +
>  4 files changed, 122 insertions(+)
>  create mode 100644 tests/amdgpu/amd_module_load.c
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 55295fa5..69bdc810 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -433,6 +433,47 @@ igt_i915_driver_unload(void)
>  	return IGT_EXIT_SUCCESS;
>  }
>  
> +int
> +igt_amdgpu_driver_load(const char *opts)
> +{
> +	if (opts)
> +		igt_info("Reloading amdgpu with %s\n\n", opts);
> +
> +	if (igt_kmod_load("amdgpu", opts)) {
> +		igt_warn("Could not load amdgpu\n");
> +		return IGT_EXIT_FAILURE;
> +	}
> +
> +	bind_fbcon(true);
> +
> +	return IGT_EXIT_SUCCESS;
> +}
> +
> +int
> +igt_amdgpu_driver_unload(void)
> +{
> +	bind_fbcon(false);
> +
> +	if (igt_kmod_is_loaded("amdgpu")) {
> +		if (igt_kmod_unload("amdgpu", 0)) {
> +			igt_warn("Could not unload amdgpu\n");
> +			igt_kmod_list_loaded();
> +			igt_lsof("/dev/dri");
> +			return IGT_EXIT_SKIP;
> +		}
> +	}
> +
> +	igt_kmod_unload("drm_kms_helper", 0);
> +	igt_kmod_unload("drm", 0);
> +
> +	if (igt_kmod_is_loaded("amdgpu")) {
> +		igt_warn("amdgpu.ko still loaded!\n");
> +		return IGT_EXIT_FAILURE;
> +	}
> +
> +	return IGT_EXIT_SUCCESS;
> +}

Add documentation for these functions please.

(Now that I mention it, the i915 equivalent functions have
documentation blocks but don't actually document the return values...)


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
