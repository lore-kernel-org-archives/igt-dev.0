Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D67C10E194
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 10:55:55 +0000 (UTC)
Date: Mon, 12 Dec 2022 12:56:22 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Message-ID: <Y5cI1qD/1Uofb9BZ@platvala-desk.ger.corp.intel.com>
References: <20221202154228.45766-1-mcanal@igalia.com>
 <20221202154228.45766-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202154228.45766-2-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/5] tests/vc4: Move VC4 tests to
 their own folder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Emma Anholt <emma@anholt.net>, igt-dev@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 02, 2022 at 12:42:24PM -0300, Maíra Canal wrote:
> VC4 contains a substantial number of tests. In order to avoid polluting
> the main tests folder, move the VC4 tests to a separate folder.
> Moreover, create a subdir "vc4" to install the VC4-specific tests.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  meson.build                        |  8 ++++
>  tests/meson.build                  | 10 +----
>  tests/vc4/meson.build              | 19 ++++++++
>  tests/{ => vc4}/vc4_create_bo.c    |  0
>  tests/{ => vc4}/vc4_dmabuf_poll.c  |  0
>  tests/{ => vc4}/vc4_label_bo.c     |  0
>  tests/{ => vc4}/vc4_lookup_fail.c  |  0
>  tests/{ => vc4}/vc4_purgeable_bo.c |  0
>  tests/{ => vc4}/vc4_tiling.c       |  0
>  tests/{ => vc4}/vc4_wait_bo.c      |  0
>  tests/{ => vc4}/vc4_wait_seqno.c   |  0
>  tests/vc4_ci/vc4.testlist          | 70 +++++++++++++++---------------
>  12 files changed, 64 insertions(+), 43 deletions(-)
>  create mode 100644 tests/vc4/meson.build
>  rename tests/{ => vc4}/vc4_create_bo.c (100%)
>  rename tests/{ => vc4}/vc4_dmabuf_poll.c (100%)
>  rename tests/{ => vc4}/vc4_label_bo.c (100%)
>  rename tests/{ => vc4}/vc4_lookup_fail.c (100%)
>  rename tests/{ => vc4}/vc4_purgeable_bo.c (100%)
>  rename tests/{ => vc4}/vc4_tiling.c (100%)
>  rename tests/{ => vc4}/vc4_wait_bo.c (100%)
>  rename tests/{ => vc4}/vc4_wait_seqno.c (100%)
> 
> diff --git a/meson.build b/meson.build
> index 709c7a6c..f5e30827 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -261,6 +261,7 @@ libdir = get_option('libdir')
>  libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>  amdgpudir = join_paths(libexecdir, 'amdgpu')
>  v3ddir = join_paths(libexecdir, 'v3d')
> +vc4dir = join_paths(libexecdir, 'vc4')
>  mandir = get_option('mandir')
>  pkgconfigdir = join_paths(libdir, 'pkgconfig')
>  python3 = find_program('python3', required : true)
> @@ -302,11 +303,18 @@ if get_option('use_rpath')
>  		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
>  	endforeach
>  	v3d_rpathdir = join_paths(v3d_rpathdir, libdir)
> +
> +	vc4_rpathdir = '$ORIGIN'
> +	foreach p : vc4dir.split('/')
> +		vc4_rpathdir = join_paths(vc4_rpathdir, '..')
> +	endforeach
> +	vc4_rpathdir = join_paths(vc4_rpathdir, libdir)
>  else
>  	bindir_rpathdir = ''
>  	libexecdir_rpathdir = ''
>  	amdgpudir_rpathdir = ''
>  	v3d_rpathdir = ''
> +	vc4_rpathdir = ''
>  endif
>  
>  subdir('lib')
> diff --git a/tests/meson.build b/tests/meson.build
> index 619c18b2..ed6a9c2e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -80,14 +80,6 @@ test_progs = [
>  	'syncobj_timeline',
>  	'template',
>  	'tools_test',
> -	'vc4_create_bo',
> -	'vc4_dmabuf_poll',
> -	'vc4_label_bo',
> -	'vc4_lookup_fail',
> -	'vc4_purgeable_bo',
> -	'vc4_tiling',
> -	'vc4_wait_bo',
> -	'vc4_wait_seqno',
>  	'vgem_basic',
>  	'vgem_slow',
>  ]
> @@ -453,6 +445,8 @@ subdir('amdgpu')
>  
>  subdir('v3d')
>  
> +subdir('vc4')
> +
>  gen_testlist = find_program('generate_testlist.sh')
>  test_list_target = custom_target('testlist',
>  	      output : 'test-list.txt',
> diff --git a/tests/vc4/meson.build b/tests/vc4/meson.build
> new file mode 100644
> index 00000000..bdb2a6b0
> --- /dev/null
> +++ b/tests/vc4/meson.build
> @@ -0,0 +1,19 @@
> +vc4_progs = [
> +	'vc4_create_bo',
> +	'vc4_dmabuf_poll',
> +	'vc4_label_bo',
> +	'vc4_lookup_fail',
> +	'vc4_purgeable_bo',
> +	'vc4_tiling',
> +	'vc4_wait_bo',
> +	'vc4_wait_seqno',
> +]
> +
> +foreach prog : vc4_progs
> +	test_executables += executable(prog, prog + '.c',
> +				       dependencies : test_deps,
> +				       install_dir : vc4dir,
> +				       install_rpath : vc4_rpathdir,
> +				       install : true)
> +	test_list += join_paths('vc4', prog)
> +endforeach
> diff --git a/tests/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
> similarity index 100%
> rename from tests/vc4_create_bo.c
> rename to tests/vc4/vc4_create_bo.c
> diff --git a/tests/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
> similarity index 100%
> rename from tests/vc4_dmabuf_poll.c
> rename to tests/vc4/vc4_dmabuf_poll.c
> diff --git a/tests/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
> similarity index 100%
> rename from tests/vc4_label_bo.c
> rename to tests/vc4/vc4_label_bo.c
> diff --git a/tests/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
> similarity index 100%
> rename from tests/vc4_lookup_fail.c
> rename to tests/vc4/vc4_lookup_fail.c
> diff --git a/tests/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
> similarity index 100%
> rename from tests/vc4_purgeable_bo.c
> rename to tests/vc4/vc4_purgeable_bo.c
> diff --git a/tests/vc4_tiling.c b/tests/vc4/vc4_tiling.c
> similarity index 100%
> rename from tests/vc4_tiling.c
> rename to tests/vc4/vc4_tiling.c
> diff --git a/tests/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
> similarity index 100%
> rename from tests/vc4_wait_bo.c
> rename to tests/vc4/vc4_wait_bo.c
> diff --git a/tests/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
> similarity index 100%
> rename from tests/vc4_wait_seqno.c
> rename to tests/vc4/vc4_wait_seqno.c
> diff --git a/tests/vc4_ci/vc4.testlist b/tests/vc4_ci/vc4.testlist
> index e86d4c81..ec09dda9 100644
> --- a/tests/vc4_ci/vc4.testlist
> +++ b/tests/vc4_ci/vc4.testlist
> @@ -1,35 +1,35 @@
> -igt@vc4_create_bo@create-bo-0
> -igt@vc4_create_bo@create-bo-4096
> -igt@vc4_create_bo@create-bo-zeroed
> -igt@vc4_dmabuf_poll@poll-read-waits-until-write-done
> -igt@vc4_dmabuf_poll@poll-write-waits-until-write-done
> -igt@vc4_label_bo@set-label
> -igt@vc4_label_bo@set-bad-handle
> -igt@vc4_label_bo@set-bad-name
> -igt@vc4_label_bo@set-kernel-name
> -igt@vc4_lookup_fail@bad-color-write
> -igt@vc4_purgeable_bo@mark-willneed
> -igt@vc4_purgeable_bo@mark-purgeable
> -igt@vc4_purgeable_bo@mark-purgeable-twice
> -igt@vc4_purgeable_bo@access-purgeable-bo-mem
> -igt@vc4_purgeable_bo@access-purged-bo-mem
> -igt@vc4_purgeable_bo@mark-unpurgeable-check-retained
> -igt@vc4_purgeable_bo@mark-unpurgeable-purged
> -igt@vc4_purgeable_bo@free-purged-bo
> -igt@vc4_tiling@get-bad-handle
> -igt@vc4_tiling@set-bad-handle
> -igt@vc4_tiling@get-bad-flags
> -igt@vc4_tiling@set-bad-flags
> -igt@vc4_tiling@get-bad-modifier
> -igt@vc4_tiling@set-bad-modifier
> -igt@vc4_tiling@set-get
> -igt@vc4_tiling@get-after-free
> -igt@vc4_wait_bo@bad-bo
> -igt@vc4_wait_bo@bad-pad
> -igt@vc4_wait_bo@unused-bo-0ns
> -igt@vc4_wait_bo@unused-bo-1ns
> -igt@vc4_wait_bo@used-bo
> -igt@vc4_wait_bo@used-bo-0ns
> -igt@vc4_wait_bo@used-bo-1ns
> -igt@vc4_wait_seqno@bad-seqno-0ns
> -igt@vc4_wait_seqno@bad-seqno-1ns
> +igt@vc4/vc4_create_bo@create-bo-0
> +igt@vc4/vc4_create_bo@create-bo-4096
> +igt@vc4/vc4_create_bo@create-bo-zeroed
> +igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done
> +igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done
> +igt@vc4/vc4_label_bo@set-label
> +igt@vc4/vc4_label_bo@set-bad-handle
> +igt@vc4/vc4_label_bo@set-bad-name
> +igt@vc4/vc4_label_bo@set-kernel-name
> +igt@vc4/vc4_lookup_fail@bad-color-write
> +igt@vc4/vc4_purgeable_bo@mark-willneed
> +igt@vc4/vc4_purgeable_bo@mark-purgeable
> +igt@vc4/vc4_purgeable_bo@mark-purgeable-twice
> +igt@vc4/vc4_purgeable_bo@access-purgeable-bo-mem
> +igt@vc4/vc4_purgeable_bo@access-purged-bo-mem
> +igt@vc4/vc4_purgeable_bo@mark-unpurgeable-check-retained
> +igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged
> +igt@vc4/vc4_purgeable_bo@free-purged-bo
> +igt@vc4/vc4_tiling@get-bad-handle
> +igt@vc4/vc4_tiling@set-bad-handle
> +igt@vc4/vc4_tiling@get-bad-flags
> +igt@vc4/vc4_tiling@set-bad-flags
> +igt@vc4/vc4_tiling@get-bad-modifier
> +igt@vc4/vc4_tiling@set-bad-modifier
> +igt@vc4/vc4_tiling@set-get
> +igt@vc4/vc4_tiling@get-after-free
> +igt@vc4/vc4_wait_bo@bad-bo
> +igt@vc4/vc4_wait_bo@bad-pad
> +igt@vc4/vc4_wait_bo@unused-bo-0ns
> +igt@vc4/vc4_wait_bo@unused-bo-1ns
> +igt@vc4/vc4_wait_bo@used-bo
> +igt@vc4/vc4_wait_bo@used-bo-0ns
> +igt@vc4/vc4_wait_bo@used-bo-1ns
> +igt@vc4/vc4_wait_seqno@bad-seqno-0ns
> +igt@vc4/vc4_wait_seqno@bad-seqno-1ns
> -- 
> 2.38.1
> 
