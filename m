Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F8D10E335
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 07:22:36 +0000 (UTC)
Message-ID: <6a1f7ace-88bc-ca79-82b3-5202555e9639@intel.com>
Date: Tue, 9 May 2023 12:51:58 +0530
Content-Language: en-US
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
 <20230504045726.2954788-4-bhanuprakash.modem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230504045726.2954788-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 3/6] lib/xe/xe_query: Add xe_config() interface
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com, mchehab@kernel.org, kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com, karthik.b.s@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>



On Thu-04-05-2023 10:27 am, Bhanuprakash Modem wrote:
> Add support to get XE configuration from xe_device.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>   lib/xe/xe_query.c | 8 ++++++++
>   lib/xe/xe_query.h | 1 +
>   2 files changed, 9 insertions(+)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index bd5eb1d18..d254a23cb 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -479,6 +479,14 @@ uint32_t xe_min_page_size(int fd, uint64_t region)
>   	return xe_mem_region(fd, region)->min_page_size;
>   }
>   
> +/**
> + * xe_config:
> + * @fd: xe device fd
> + *
> + * Returns xe configuration of xe device @fd.
> + */
> +xe_dev_FN(xe_config, config, struct drm_xe_query_config *);
> +
>   /**
>    * xe_number_hw_engine:
>    * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index cc6e7cefd..63f32ca92 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -86,6 +86,7 @@ struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
>   struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
>   const char *xe_region_name(uint64_t region);
>   uint32_t xe_min_page_size(int fd, uint64_t region);
> +struct drm_xe_query_config *xe_config(int fd);
>   unsigned int xe_number_hw_engines(int fd);
>   bool xe_has_vram(int fd);
>   uint64_t xe_vram_size(int fd, int gt);

