Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5D1C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 18:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670E010E3D0;
	Tue, 18 Jun 2024 18:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbtzNbR6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895E610E3D0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 18:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718733707; x=1750269707;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GME3CSUoy4wsHwuXbhQKzd0XaEcisCq7VsIs3OZPoHM=;
 b=EbtzNbR65FzY7ng1PdcKQJmhO/C0FhvO4M+tVVorMUgvRbRU5hJ91t32
 I7GTvHSa8voLUsb9l9h6AITVBgxqyB/jS2l2NbHqZ7lQnTFErgnS/S6NO
 ruMEF5HJcN2JwUu/NnzVv0rs1BMiBLJviy0UahrtY3c+rkhkgM6ozOvSD
 Qv1W0J2n4jr7dLyD89q5Q0kIb4dro3m5BcjHMJJnAfzTisDyoajhcv8Gn
 i7xl5E/uX7EBM9I9pjj7agJuccbKlXb/+8QTlipBA0apLGREW5ofl7x8q
 Uguzwdgba70FDpmLhPYXHVVusaTZOznRV1/MDiomnCpxO0iq0PSVSKsD4 Q==;
X-CSE-ConnectionGUID: nosKh7dHT3yZDtURNGRhfQ==
X-CSE-MsgGUID: pgFoGe3SS6OxP5q50PGpOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26266736"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26266736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 11:01:47 -0700
X-CSE-ConnectionGUID: kBkHn+1qQ0O6AwiQwN9ieg==
X-CSE-MsgGUID: RfcD6n4DRNuY6QMP8XOqiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="42125249"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 11:01:45 -0700
Date: Tue, 18 Jun 2024 20:01:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 kunal1.joshi@intel.com
Subject: Re: [PATCH i-g-t 1/2] tests/kms_3d: "1080p-left.png": No such file
 or directory fix
Message-ID: <20240618180125.dgwjvxzi2v37odnx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 kunal1.joshi@intel.com
References: <20240618121638.231181-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240618121638.231181-1-ramanaidu.naladala@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Naladala,,
On 2024-06-18 at 17:46:37 +0530, Naladala, Ramanaidu wrote:

describe here what you did and why

> Signed-off-by: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
---------------- ^ ------- ^

This should be:
Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>

imho the best place is to put it into your git config.

Regards,
Kamil

> ---
>  lib/igt_core.c                   |   9 +++++++--
>  lib/igt_core.h                   |   4 ++--
>  lib/meson.build                  |   1 +
>  meson.build                      |   1 +
>  tests/{ => data}/1080p-left.png  | Bin
>  tests/{ => data}/1080p-right.png | Bin
>  tests/data/meson.build           |   8 ++++++++
>  tests/{ => data}/pass.png        | Bin
>  tests/meson.build                |   8 ++------
>  9 files changed, 21 insertions(+), 10 deletions(-)
>  rename tests/{ => data}/1080p-left.png (100%)
>  rename tests/{ => data}/1080p-right.png (100%)
>  create mode 100644 tests/data/meson.build
>  rename tests/{ => data}/pass.png (100%)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ff3e0392..daef37c64 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3237,7 +3237,7 @@ void igt_reset_timeout(void)
>  }
>  
>  FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
> -		       const char* filename)
> +		       const char* igt_imgdir,const char* filename)
>  {
>  	char path[PATH_MAX];
>  	FILE *fp;
> @@ -3249,7 +3249,12 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
>  		fp = fopen(path, "r");
>  	}
>  	if (!fp) {
> -		snprintf(path, sizeof(path), "./%s", filename);
> +                snprintf(path, sizeof(path), "%s/%s", igt_imgdir, filename);
> +                fp = fopen(path, "r");
> +        }
> +
> +	if (!fp) {
> +		snprintf(path, sizeof(path), "./data/%s", filename);
>  		fp = fopen(path, "r");
>  	}
>  
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 084d94da7..c13711902 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1427,7 +1427,7 @@ static inline uint32_t igt_seconds_elapsed(struct timespec *start)
>  void igt_reset_timeout(void);
>  
>  FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
> -		       const char* filename);
> +		       const char* igt_imgdir, const char* filename);
>  /**
>   * igt_fopen_data:
>   * @filename: filename to open.
> @@ -1436,7 +1436,7 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
>   * then from build directory, and finally from current directory.
>   */
>  #define igt_fopen_data(filename) \
> -	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, filename)
> +	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR,IGT_IMGDIR, filename)
>  
>  int igt_system(const char *command);
>  int igt_system_quiet(const char *command);
> diff --git a/lib/meson.build b/lib/meson.build
> index e2f740c11..9e210f26c 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -226,6 +226,7 @@ foreach f: lib_sources
>  	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>  	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>  	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
> +            '-DIGT_IMGDIR="@0@"'.format(imgdir),
>  	])
>  
>      lib_intermediates += lib
> diff --git a/meson.build b/meson.build
> index ab44aadb1..20fd70632 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -282,6 +282,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>  mandir = get_option('mandir')
>  pkgconfigdir = join_paths(libdir, 'pkgconfig')
>  python3 = find_program('python3', required : true)
> +imgdir = join_paths(build_root,'tests','data')
>  
>  if get_option('use_rpath')
>  	# Set up runpath for the test executables towards libigt.so.
> diff --git a/tests/1080p-left.png b/tests/data/1080p-left.png
> similarity index 100%
> rename from tests/1080p-left.png
> rename to tests/data/1080p-left.png
> diff --git a/tests/1080p-right.png b/tests/data/1080p-right.png
> similarity index 100%
> rename from tests/1080p-right.png
> rename to tests/data/1080p-right.png
> diff --git a/tests/data/meson.build b/tests/data/meson.build
> new file mode 100644
> index 000000000..01af4b48c
> --- /dev/null
> +++ b/tests/data/meson.build
> @@ -0,0 +1,8 @@
> +image_files = [
> +  '1080p-left.png',
> +  '1080p-right.png',
> +  'pass.png',
> +]
> +install_data(sources : image_files, install_dir : imgdir)
> +install_data(sources : image_files, install_dir : datadir)
> +
> diff --git a/tests/pass.png b/tests/data/pass.png
> similarity index 100%
> rename from tests/pass.png
> rename to tests/data/pass.png
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..b4a92e997 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -467,6 +467,8 @@ subdir('vc4')
>  
>  subdir('vmwgfx')
>  
> +subdir('data')
> +
>  gen_testlist = find_program('generate_testlist.sh')
>  test_list_target = custom_target('testlist',
>  	      output : 'test-list.txt',
> @@ -505,11 +507,5 @@ if not meson.is_cross_build()
>  			output : 'gem_stress.testlist')
>  endif
>  
> -image_files = [
> -  '1080p-left.png',
> -  '1080p-right.png',
> -  'pass.png',
> -]
> -install_data(sources : image_files, install_dir : datadir)
>  
>  subdir('intel-ci')
> -- 
> 2.43.0
> 
