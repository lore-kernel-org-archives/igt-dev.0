Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E3C10E310
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 16:21:19 +0000 (UTC)
Date: Tue, 27 Jun 2023 18:16:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230627161616.idcsyxpg2i5p3o6j@kamilkon-desk1>
References: <20230625122948.535456-1-priyanka.dandamudi@intel.com>
 <20230625122948.535456-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230625122948.535456-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] lib/igt_sysfs: Add support to
 iterate over engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tejas.upadhyay@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Priyanka,

On 2023-06-25 at 17:59:44 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> It helps to test engines by iterating over sysfs/engines.
> 
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/igt_sysfs.c | 35 +++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  3 +++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 35a4faa9..1f32e659 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -856,3 +856,38 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
>  	igt_assert_eq(get, prev);
>  	igt_assert(!ret);
>  }
> +

Please add description to each new public function.

Regards,
Kamil

> +void igt_sysfs_engines(int xe, int engines, const char *file,
> +					   void (*test)(int, int))
> +{
> +	struct dirent *de;
> +	DIR *dir;
> +
> +	lseek(engines, 0, SEEK_SET);
> +
> +	dir = fdopendir(engines);
> +	if (!dir)
> +		close(engines);
> +
> +	while ((de = readdir(dir))) {
> +		int engine;
> +
> +		if (*de->d_name == '.')
> +			continue;
> +
> +		engine = openat(engines, de->d_name, O_RDONLY);
> +		if (engine < 0)
> +			continue;
> +
> +		igt_dynamic(de->d_name) {
> +			if (file) {
> +				struct stat st;
> +
> +				igt_require(fstatat(engine, file, &st, 0) == 0);
> +			}
> +			errno = 0;
> +			test(xe, engine);
> +		}
> +		close(engine);
> +	}
> +}
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 978b6906..c89780ac 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -147,4 +147,7 @@ typedef struct igt_sysfs_rw_attr {
>  
>  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
>  
> +void igt_sysfs_engines(int xe, int gt, const char *file,
> +		       void (*test)(int, int));
> +
>  #endif /* __IGT_SYSFS_H__ */
> -- 
> 2.25.1
> 
