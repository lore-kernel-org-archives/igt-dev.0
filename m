Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE76D10F010
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 14:37:24 +0000 (UTC)
Date: Fri, 17 Feb 2023 15:37:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Message-ID: <20230217143712.z5dbgg5ua3atifre@kamilkon-desk1>
References: <33b61d47-b5e0-4905-bffb-398cfed26f0e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33b61d47-b5e0-4905-bffb-398cfed26f0e@app.fastmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel_gpu_top: Add display name for
 compute engine class
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Christopher Snowhill <kode54@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Christopher,

Sidenote: please decide which is your main e-mail address and
if it is different from s-o-b add From: line at begin like:

From: Christopher Snowhill <kode54@gmail.com>

On 2023-01-11 at 05:22:55 -0800, Christopher Snowhill wrote:
> Add label and abbreviated display name for the compute engine class.
> 
> Signed-off-by: Christopher Snowhill <kode54@gmail.com>

Patch itself lgtm,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tools/intel_gpu_top.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 6de8a164..08306f51 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -281,6 +281,8 @@ static const char *class_display_name(unsigned int class)
>  		return "Video";
>  	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
>  		return "VideoEnhance";
> +	case I915_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
>  	default:
>  		return "[unknown]";
>  	}
> @@ -297,6 +299,8 @@ static const char *class_short_name(unsigned int class)
>  		return "VCS";
>  	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
>  		return "VECS";
> +	case I915_ENGINE_CLASS_COMPUTE:
> +		return "CCS";
>  	default:
>  		return "UNKN";
>  	}
> -- 
> 2.39.0
