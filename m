Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA63E10E3FF
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 19:00:53 +0000 (UTC)
Message-ID: <d0d7a799-b36e-211b-bda1-0e6ee7c36b53@quicinc.com>
Date: Mon, 25 Apr 2022 12:00:49 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, <igt-dev@lists.freedesktop.org>
References: <20220421172858.263-1-quic_jesszhan@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220421172858.263-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3] meson: Move MSM-specific tests to
 their own subdirectory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This has been applied keeping petri's ack from the previous version.

Thanks

Abhinav

On 4/21/2022 10:28 AM, Jessica Zhang wrote:
> Move all custom MSM tests to their own subdirectory and have them
> installed in an msm/ subdirectory
> 
> Changes from v1:
> - Removed extra whitespace
> - Moved meson build commands for msm tests from tests/msm/meson.build
>    to tests/meson.build
> 
> Changes from v2:
> - Removed unused variables
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   tests/meson.build              | 18 +++++++++++++++---
>   tests/{ => msm}/msm_mapping.c  |  0
>   tests/{ => msm}/msm_recovery.c |  0
>   tests/{ => msm}/msm_submit.c   |  0
>   4 files changed, 15 insertions(+), 3 deletions(-)
>   rename tests/{ => msm}/msm_mapping.c (100%)
>   rename tests/{ => msm}/msm_recovery.c (100%)
>   rename tests/{ => msm}/msm_submit.c (100%)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 7261e9aa2950..fb0f1e37f633 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -63,9 +63,6 @@ test_progs = [
>   	'kms_vrr',
>   	'kms_writeback',
>   	'meta_test',
> -	'msm_mapping',
> -	'msm_recovery',
> -	'msm_submit',
>   	'panfrost_get_param',
>   	'panfrost_gem_new',
>   	'panfrost_prime',
> @@ -253,6 +250,12 @@ i915_progs = [
>   	'sysfs_timeslice_duration',
>   ]
>   
> +msm_progs = [
> +	'msm_mapping',
> +	'msm_recovery',
> +	'msm_submit'
> +]
> +
>   test_deps = [ igt_deps ]
>   
>   if libdrm_nouveau.found()
> @@ -294,6 +297,15 @@ foreach prog : i915_progs
>   	test_list += prog
>   endforeach
>   
> +foreach prog : msm_progs
> +	test_executables += executable(prog, join_paths('msm', prog + '.c'),
> +				       dependencies : test_deps,
> +				       install_dir : libexecdir,
> +				       install_rpath : libexecdir_rpathdir,
> +				       install : true)
> +	test_list += prog
> +endforeach
> +
>   test_executables += executable('drm_fdinfo',
>   	   join_paths('i915', 'drm_fdinfo.c'),
>   	   dependencies : test_deps + [ lib_igt_drm_fdinfo ],
> diff --git a/tests/msm_mapping.c b/tests/msm/msm_mapping.c
> similarity index 100%
> rename from tests/msm_mapping.c
> rename to tests/msm/msm_mapping.c
> diff --git a/tests/msm_recovery.c b/tests/msm/msm_recovery.c
> similarity index 100%
> rename from tests/msm_recovery.c
> rename to tests/msm/msm_recovery.c
> diff --git a/tests/msm_submit.c b/tests/msm/msm_submit.c
> similarity index 100%
> rename from tests/msm_submit.c
> rename to tests/msm/msm_submit.c
