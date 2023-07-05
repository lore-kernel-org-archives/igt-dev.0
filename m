Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4802B10E2BF
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 12:09:54 +0000 (UTC)
Message-ID: <03d64c92-eabc-b2ae-6b8d-2971cac13767@intel.com>
Date: Wed, 5 Jul 2023 14:09:22 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230704090104.120219-1-zbigniew.kempczynski@intel.com>
 <20230704090104.120219-4-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230704090104.120219-4-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 03/12] lib/drmtest: Add
 get_intel_driver() helper
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

On 4.07.2023 11:00, Zbigniew Kempczyński wrote:
> In libraries which diverges i915 and xe code we might use

nit: plural form, or could say something like "In libraries with i915 
and Xe code divergence"

> is_xe_device() or is_i915_device() to distinct code paths.
> But to avoid additional open and string compare we can cache
> this information in data structures.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/drmtest.c | 10 ++++++++++
>   lib/drmtest.h |  1 +
>   2 files changed, 11 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 5cdb0196d3..e1da66c877 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -151,6 +151,16 @@ bool is_intel_device(int fd)
>   	return is_i915_device(fd) || is_xe_device(fd);
>   }
>   
> +enum intel_driver get_intel_driver(int fd)
> +{
> +	if (is_xe_device(fd))
> +		return INTEL_DRIVER_XE;
> +	else if (is_i915_device(fd))
> +		return INTEL_DRIVER_I915;
> +
> +	igt_assert_f(0, "Device is not handled by Intel driver\n");
> +}

That looks like a helpful function. As a follow up to this series, we 
could update ibb->driver assignment in __intel_bb_create().

But for now:
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> +
>   static char _forced_driver[16] = "";
>   
>   /**
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 9c3ea5d14c..97ab6e759e 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -124,6 +124,7 @@ bool is_nouveau_device(int fd);
>   bool is_vc4_device(int fd);
>   bool is_xe_device(int fd);
>   bool is_intel_device(int fd);
> +enum intel_driver get_intel_driver(int fd);
>   
>   /**
>    * do_or_die:
