Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9F210E599
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Aug 2022 10:44:20 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:41:09 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <YwYARY/G4p52mvXT@platvala-desk.ger.corp.intel.com>
References: <20220823124157.1285114-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823124157.1285114-1-ryszard.knop@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] igt: Allow overriding the commit hash
 in the version string
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 02:41:57PM +0200, Ryszard Knop wrote:
> By default, the latest Git commit hash is always used to create the
> version string embedded in libigt - if libigt changes, most targets are
> marked as "dirty" and need to be relinked. This makes it difficult to
> easily compare two IGT builds on binaries alone.
> 
> This commit introduces a new Meson option, -Dversion_hash="your text!",
> which allows overriding this hash, for instance under CI builds.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/meson.build   | 8 +++++++-
>  meson_options.txt | 4 ++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 98c2803b..6910c061 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -168,9 +168,15 @@ else
>      srcdir = join_paths(meson.source_root(), 'tests')
>  endif
>  
> +if get_option('version_hash') != ''
> +    vcs_command = ['echo', get_option('version_hash')]
> +else
> +    vcs_command = [ 'git', 'log', '-n1', '--pretty=format:g%h' ]
> +endif
> +
>  lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
>  		      fallback : 'NO-GIT',
> -		      command : [ 'git', 'log', '-n1', '--pretty=format:g%h' ] )
> +		      command : vcs_command )
>  
>  lib_intermediates = []
>  foreach f: lib_sources
> diff --git a/meson_options.txt b/meson_options.txt
> index bed63efa..d978813b 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -51,6 +51,10 @@ option('use_rpath',
>         value : false,
>         description : 'Set runpath on installed executables for libigt.so')
>  
> +option('version_hash',
> +       type : 'string',
> +       description : 'Override the Git commit hash embedded in the binaries')
> +
>  option('srcdir',
>         type : 'string',
>         description : 'Override the source code path embedded inside target binaries (optional)')
> -- 
> 2.37.2
> 
