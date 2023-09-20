Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <50978871-5bf8-aa65-d6a9-c4dcd20e3a03@linux.intel.com>
Date: Wed, 20 Sep 2023 13:58:57 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
 <20230919142000.91363-2-rodrigo.vivi@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230919142000.91363-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 01/16] drm-uapi/xe_drm: Align with new
 PMU interface
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 19/09/23 19:49, Rodrigo Vivi wrote:

Hi Rodrigo,

can  you please pick the latest header xe_drm.h I did a small fix for comment.

Thanks,
Aravind.
> Align with commit ("drm/xe/pmu: Enable PMU interface")
>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 804c02270..6aaa8517c 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -1053,6 +1053,44 @@ struct drm_xe_vm_madvise {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * XE PMU event config IDs
> + *
> + * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
> + * as part of perf_event_open syscall to read a particular event.
> + *
> + * For example to open the XE_PMU_INTERRUPTS(0):
> + *
> + * .. code-block:: C
> + *	struct perf_event_attr attr;
> + *	long long count;
> + *	int cpu = 0;
> + *	int fd;
> + *
> + *	memset(&attr, 0, sizeof(struct perf_event_attr));
> + *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
> + *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
> + *	attr.use_clockid = 1;
> + *	attr.clockid = CLOCK_MONOTONIC;
> + *	attr.config = XE_PMU_INTERRUPTS(0);
> + *
> + *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
> + */
> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (56)
> +
> +#define ___XE_PMU_OTHER(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
> +#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
