Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20210318162400.2065097-1-tvrtko.ursulin@linux.intel.com>
 <20210318162400.2065097-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210318162400.2065097-2-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 30 Mar 2021 11:49:56 +0100
Message-ID: <CAM0jSHOx2qmW0-BsBZBEGcg2rREGi=2QePymqzfAyQUCKg-Ggw@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib: Add helper for reading
 modparam values
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <Intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 18 Mar 2021 at 16:24, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Add __igt_params_get for simple reading of modparams.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  lib/igt_params.c | 26 ++++++++++++++++++++++++++
>  lib/igt_params.h |  2 ++
>  2 files changed, 28 insertions(+)
>
> diff --git a/lib/igt_params.c b/lib/igt_params.c
> index c06416988baa..1dc6de77b2e0 100644
> --- a/lib/igt_params.c
> +++ b/lib/igt_params.c
> @@ -156,6 +156,32 @@ int igt_params_open(int device)
>         return params;
>  }
>
> +/**
> + * __igt_params_get:
> + * @device: fd of the device
> + * @parameter: the name of the parameter to set

to get

> + *
> + * This reads the value of the modparam.
> + *
> + * Returns:
> + * A nul-terminated string, must be freed by caller after use, or NULL
> + * on failure.
> + */
> +char *__igt_params_get(int device, const char *parameter)
> +{
> +       char *str;
> +       int dir;
> +
> +       dir = igt_params_open(device);
> +       if (dir < 0)
> +               return NULL;
> +
> +       str = igt_sysfs_get(dir, parameter);
> +       close(dir);
> +
> +       return str;
> +}

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
