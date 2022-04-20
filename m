Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F3510E425
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 08:19:40 +0000 (UTC)
Date: Wed, 20 Apr 2022 11:17:30 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <Yl/BmuwYuCxJ7gUa@platvala-desk.ger.corp.intel.com>
References: <20220419234339.181-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419234339.181-1-quic_jesszhan@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1] meson: Move MSM-specific tests to
 their own subdirectory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com,
 robdclark@chromium.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 19, 2022 at 04:43:39PM -0700, Jessica Zhang wrote:
> Move all custom MSM tests to their own subdirectory and have them
> installed in an msm/ subdirectory
> ---
>  meson.build                    |  9 +++++++++
>  tests/meson.build              |  4 +---
>  tests/msm/meson.build          | 15 +++++++++++++++
>  tests/{ => msm}/msm_mapping.c  |  0
>  tests/{ => msm}/msm_recovery.c |  0
>  tests/{ => msm}/msm_submit.c   |  0
>  6 files changed, 25 insertions(+), 3 deletions(-)
>  create mode 100644 tests/msm/meson.build
>  rename tests/{ => msm}/msm_mapping.c (100%)
>  rename tests/{ => msm}/msm_recovery.c (100%)
>  rename tests/{ => msm}/msm_submit.c (100%)
> 
> diff --git a/meson.build b/meson.build
> index 3e937f5a5b98..a42414c1d22d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -260,6 +260,7 @@ includedir = get_option('includedir')
>  libdir = get_option('libdir')
>  libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>  amdgpudir = join_paths(libexecdir, 'amdgpu')
> +msmdir = join_paths(libexecdir, 'msm')
>  mandir = get_option('mandir')
>  pkgconfigdir = join_paths(libdir, 'pkgconfig')
>  python3 = find_program('python3', required : true)
> @@ -295,10 +296,18 @@ if get_option('use_rpath')
>  		amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, '..')
>  	endforeach
>  	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
> +
> +	msmdir_rpathdir = '$ORIGIN'
> +	foreach p : msmdir.split('/')
> +		msmdir_rpathdir = join_paths(msmdir_rpathdir, '..')
> +	endforeach
> +	msmdir_rpathdir = join_paths(msmdir_rpathdir, libdir)
> +
>  else

Extra empty line there.



>  	bindir_rpathdir = ''
>  	libexecdir_rpathdir = ''
>  	amdgpudir_rpathdir = ''
> +	msmdir_rpathdir = ''
>  endif
>  
>  subdir('lib')
> diff --git a/tests/meson.build b/tests/meson.build
> index 7261e9aa2950..4ee06677a1eb 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -63,9 +63,6 @@ test_progs = [
>  	'kms_vrr',
>  	'kms_writeback',
>  	'meta_test',
> -	'msm_mapping',
> -	'msm_recovery',
> -	'msm_submit',
>  	'panfrost_get_param',
>  	'panfrost_gem_new',
>  	'panfrost_prime',
> @@ -420,6 +417,7 @@ test_executables += executable('sw_sync', 'sw_sync.c',
>  test_list += 'sw_sync'
>  
>  subdir('amdgpu')
> +subdir('msm')
>  
>  gen_testlist = find_program('generate_testlist.sh')
>  test_list_target = custom_target('testlist',
> diff --git a/tests/msm/meson.build b/tests/msm/meson.build
> new file mode 100644
> index 000000000000..9f1788a38d20
> --- /dev/null
> +++ b/tests/msm/meson.build
> @@ -0,0 +1,15 @@
> +msm_progs = [
> +	'msm_mapping',
> +	'msm_recovery',
> +	'msm_submit'
> +]
> +msm_deps = test_deps
> +
> +foreach prog : msm_progs
> +	test_executables += executable(prog, prog + '.c',
> +				       dependencies : msm_deps,
> +				       install_dir : msmdir,
> +				       install_rpath : msmdir_rpathdir,
> +				       install : true)
> +	test_list += join_paths('msm', prog)
> +endforeach
> diff --git a/tests/msm_mapping.c b/tests/msm/msm_mapping.c
> similarity index 100%
> rename from tests/msm_mapping.c
> rename to tests/msm/msm_mapping.c
> diff --git a/tests/msm_recovery.c b/tests/msm/msm_recovery.c
> similarity index 100%
> rename from tests/msm_recovery.c
> rename to tests/msm/msm_recovery.c
> diff --git a/tests/msm_submit.c b/tests/msm/msm_submit.c
> similarity index 100%
> rename from tests/msm_submit.c
> rename to tests/msm/msm_submit.c
> -- 
> 2.31.0
> 


Matches what's done with amdgpu dir,
Acked-by: Petri Latvala <petri.latvala@intel.com>

The major change by this is that the piglit-names for the tests become
igt@msm/msm_*@* instead of igt@msm_*@* and I don't know who's affected
by that. Tomeu's patch series maybe, the one for integrating msm
testing to gitlab-CI...


-- 
Petri Latvala
