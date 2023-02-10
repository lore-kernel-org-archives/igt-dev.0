Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 10 Feb 2023 17:18:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Message-ID: <20230210161850.yowh6au7f4dye3vu@kamilkon-desk1>
References: <20230210152207.585007-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230210152207.585007-1-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] intel_gpu_top: Add compute
 class names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Christopher Snowhill <kode54@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tvrtko,

On 2023-02-10 at 15:22:07 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> No one remembered to add names for the new compute engines.

Actually there was patch:
https://patchwork.freedesktop.org/series/112674/
intel_gpu_top: Add display name for compute engine class
Submitted by Christopher Snowhill on Jan. 11, 2023, 1:22 p.m. 

What prevented me from merge was From: != s-o-b

Christopher Snowhill <kode54@gmail.com> != Christopher Snowhill <chris@kode54.net>

warning from checkpatch.pl but if you think it is minor warn
you are free to give r-b and to merge that.

+cc Christopher

Regards,
Kamil

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  tools/intel_gpu_top.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index c043c8960dd0..e13e35b71f4b 100644
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
> 2.34.1
> 
