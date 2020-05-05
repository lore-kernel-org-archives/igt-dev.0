Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EE46E5BD
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 14:22:46 +0000 (UTC)
Date: Tue, 5 May 2020 17:22:42 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200505142242.amdxbkl62rje7x5y@ahiler-desk1.fi.intel.com>
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-7-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428202255.31309-7-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/7] igt/params: use igt_params_set_save
 for igt_set_module_param*
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 11:22:54PM +0300, Juha-Pekka Heikkila wrote:
> Unify parameter access. Here is also decided 'default' device
> if -1 is specified as device. Derault being that device
> which is first to match requirements, starting search
> from zero upwards.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_params.c | 134 +++++++++++++++++++++++++++++++++++------------
>  1 file changed, 100 insertions(+), 34 deletions(-)
> 
> diff --git a/lib/igt_params.c b/lib/igt_params.c
> index d9cf986c..dc35f233 100644
> --- a/lib/igt_params.c
> +++ b/lib/igt_params.c
> @@ -27,12 +27,14 @@
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <sys/ioctl.h>
> +#include <sys/stat.h>
>  
>  #include <i915_drm.h>
>  
>  #include "igt_core.h"
>  #include "igt_params.h"
>  #include "igt_sysfs.h"
> +#include "igt_debugfs.h"
>  
>  struct module_param_data {
>  	char *path;
> @@ -107,15 +109,59 @@ static void igt_params_save(int dir, const char *path, const char *name)
>  	module_params = data;
>  }
>  
> -static int __igt_params_open(int device, char **outpath)
> +static int __igt_params_open(int device, char **outpath, const char *param)

Please add a function documentation block on top of this. Deciphering
the role of the new "param" argument in the context of this function
from the code alone is really hard. You should also mention how it being
set vs it being NULL affect the outcome.

I would appreciate a bit more contet on this change in the commit
message, especially about the sysfs -> debugfs switch.

If I got your intention right, the code LGTM.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
