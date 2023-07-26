Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54CC10E428
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 07:30:42 +0000 (UTC)
Date: Wed, 26 Jul 2023 09:30:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Message-ID: <20230726073038.gnexrxxcumtr2jbk@kamilkon-desk1>
References: <20230724073737.666171-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230724073737.666171-1-nemesa.garg@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdmi_inject: Fix audio test
 by loading snd driver
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

Hi Nemesa,

you put this in Cc: Garg@freedesktop.org
but it looks like this is incorrect e-mail address:

5.1.0 - Unknown address error 550-'5.1.1 <Garg@freedesktop.org>: Recipient address rejected: User unknown in local recipient table'

I see Jeevan already responded but if you plan on keeping
this patch or sending other one, please see below.

On 2023-07-24 at 13:07:37 +0530, Garg, Nemesa wrote:
> As audio driver is blacklisted so load the snd_hda_intel module before the inject_audio
--------------------------------------------------------- ^
Split line here (try to keep under 65 chars).

> test run
--------- ^
Put dot '.' at end.

> 
> Signed-off-by: Garg, Nemesa <nemesa.garg@intel.com>
---------------- ^^^^^^^^^^^^  ^^^^^^^^^^^
This do not match, please configure your git so it will write:

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>

as your s-o-b.

> ---
>  tests/kms_hdmi_inject.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> index 9aa5c59fc..1964d7541 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -30,6 +30,7 @@
>  #include "igt_edid.h"
>  #include "igt_eld.h"
>  #include "xe/xe_query.h"
> +#include "igt_kmod.h"
------------ ^
Keep it sorted so put this before xe/xe_query.h include.

Regards,
Kamil

>  
>  #define HDISPLAY_4K	3840
>  #define VDISPLAY_4K	2160
> @@ -206,6 +207,9 @@ igt_main
>  		igt_require(connector);
>  
>  		kmstest_unset_all_crtcs(drm_fd, res);
> +
> +		if (!igt_kmod_is_loaded("snd_hda_intel"))
> +			igt_kmod_load("snd_hda_intel", NULL);
>  	}
>  
>  	igt_describe("Make sure that 4K modes exposed by DRM match the "
> -- 
> 2.25.1
> 
