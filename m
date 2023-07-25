Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E40110E3E6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 16:05:43 +0000 (UTC)
Date: Tue, 25 Jul 2023 18:04:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230725160430.oq6mur2qlzutglzh@kamilkon-desk1>
References: <20230720150239.550161-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230720150239.550161-1-nemesa.garg@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdmi_inject: As audio driver
 is blacklisted so loading the module before the test run
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Garg, Nemesa" <nemesa.garg@intel.com>, Garg@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nemesa,

please make commit message short, this one:

As audio driver is blacklisted so loading the module before the test run

is better for description, so maybe something like:

tests/kms_hdmi_inject: load audio driver before tests

On 2023-07-20 at 20:32:39 +0530, Garg, Nemesa wrote:

Write here description why we need it.

> Signed-off-by: Garg, Nemesa <nemesa.garg@intel.com>
---------------- ^ --- ^
This should be as in your e-mail address:

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>

> ---
>  tests/kms_hdmi_inject.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> index 9aa5c59fc..1b99e190e 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -30,6 +30,7 @@
>  #include "igt_edid.h"
>  #include "igt_eld.h"
>  #include "xe/xe_query.h"
> +#include "igt_kmod.h"
>  
>  #define HDISPLAY_4K	3840
>  #define VDISPLAY_4K	2160
> @@ -208,6 +209,9 @@ igt_main
>  		kmstest_unset_all_crtcs(drm_fd, res);
>  	}
>  
> +	if (!igt_kmod_is_loaded("snd_hda_intel"))
> +                igt_kmod_load("snd_hda_intel", NULL);
> +

Place this in fixture, good place would be in if block which
checks for intel driver.

Regards,
Kamil

>  	igt_describe("Make sure that 4K modes exposed by DRM match the "
>                       "forced EDID and modesetting using it succeed.");
>  	igt_subtest("inject-4k")
> -- 
> 2.25.1
> 
