Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BF910E5FF
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 16:01:15 +0000 (UTC)
Date: Thu, 31 Aug 2023 18:01:06 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230831180106.6ff8022f@maurocar-mobl2>
In-Reply-To: <20230831145622.1158622-7-bhanuprakash.modem@intel.com>
References: <20230831145622.1158622-1-bhanuprakash.modem@intel.com>
 <20230831145622.1158622-7-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V5 6/7] tests/meson.build: Split intel targets
 based on their nature
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

On Thu, 31 Aug 2023 20:26:21 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> Instead of having all intel specific programs in a single list,
> split those into multiple lists based on their nature.
> 
> Example:
>  - intel_i915_xe_progs: List of tests those supports both i915 & xe
>  - intel_i915_progs: List of i915 specific tests
>  - intel_kms_progs: List of intel specific kms tests
>  - intel_xe_progs: List of xe specific tests
> 
> As a side effect, this would help if we ever need to add option
> to enable/disable i915 and/or kms test builds.
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/meson.build | 55 +++++++++++++++++++++--------------------------
>  1 file changed, 24 insertions(+), 31 deletions(-)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 211ecd513..aa27fd9af 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -82,8 +82,11 @@ test_progs = [
>  	'vgem_slow',
>  ]
>  
> -intel_progs = [
> +intel_i915_xe_progs = [
>  	'api_intel_allocator',
> +]
> +
> +intel_i915_progs = [
>  	'api_intel_bb',
>  	'debugfs_test',
>  	'drm_fdinfo',
> @@ -230,6 +233,18 @@ intel_progs = [
>  	'i915_query',
>  	'i915_selftest',
>  	'i915_suspend',
> +	'prime_busy',
> +	'prime_mmap',
> +	'prime_mmap_coherency',
> +	'prime_mmap_kms',
> +	'prime_self_import',
> +	'sysfs_defaults',
> +	'sysfs_heartbeat_interval',
> +	'sysfs_preempt_timeout',
> +	'sysfs_timeslice_duration',
> +]
> +
> +intel_kms_progs = [
>  	'kms_big_fb',
>  	'kms_big_joiner' ,
>  	'kms_busy',
> @@ -252,18 +267,9 @@ intel_progs = [
>  	'kms_psr2_su',
>  	'kms_psr_stress_test',
>  	'kms_pwrite_crc',
> -	'prime_busy',
> -	'prime_mmap',
> -	'prime_mmap_coherency',
> -	'prime_mmap_kms',
> -	'prime_self_import',
> -	'sysfs_defaults',
> -	'sysfs_heartbeat_interval',
> -	'sysfs_preempt_timeout',
> -	'sysfs_timeslice_duration',
>  ]
>  
> -xe_progs = [
> +intel_xe_progs = [
>  	'xe_ccs',
>  	'xe_create',
>  	'xe_compute',
> @@ -383,6 +389,13 @@ foreach prog : test_progs
>  		     output : name + '.testlist')
>  endforeach
>  
> +intel_progs = intel_i915_xe_progs
> +intel_progs += intel_i915_progs + intel_kms_progs
> +if build_xe
> +	build_info += 'Xe **experimental** tests enabled.'
> +	intel_progs += intel_xe_progs
> +endif
> +
>  foreach prog : intel_progs
>  	testexe = executable(prog,
>  		   [join_paths('intel', prog + '.c')] + extra_sources.get(prog, []),
> @@ -400,26 +413,6 @@ foreach prog : intel_progs
>  		     output : name + '.testlist')
>  endforeach
>  
> -if build_xe
> -	foreach prog : xe_progs
> -		testexe = executable(prog,
> -			   [join_paths('intel', prog + '.c')] + extra_sources.get(prog, []),
> -			   dependencies : test_deps + extra_dependencies.get(prog, []),
> -			   install_dir : libexecdir,
> -			   install_rpath : libexecdir_rpathdir,
> -			   install : true)
> -		test_list += prog
> -		test_executables += testexe
> -		name = prog.split('/').get(-1)
> -		testlist_files += custom_target(name + '.testlist',
> -			     build_by_default : true,
> -			     command : [testexe, '--show-testlist'],
> -			     capture : true,
> -			     output : name + '.testlist')
> -	endforeach
> -	build_info += 'Xe **experimental** tests enabled.'
> -endif
> -
>  foreach prog : msm_progs
>  	test_executables += executable(prog, join_paths('msm', prog + '.c'),
>  				       dependencies : test_deps,
