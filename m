Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E466F46B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 12:30:26 +0000 (UTC)
Date: Thu, 7 Oct 2021 15:33:57 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YV7pNcItpdKXpPZ/@platvala-desk.ger.corp.intel.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
 <20211006161444.904476-8-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006161444.904476-8-rodrigo.vivi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] include: Introduce linux-uapi for
 non-drm-uapi files.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 06, 2021 at 12:14:43PM -0400, Rodrigo Vivi wrote:
> sync_file.h is needed for dma-buf, but it is part of the
> linux-uapi include dir.
> 
> The patch aims to have a drm-uapi directory that is a pure
> copy of the generated drm-uapi include dir.
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  README.md                                    | 12 +++++++++++-
>  include/{drm-uapi => linux-uapi}/sync_file.h |  0
>  meson.build                                  |  2 +-
>  3 files changed, 12 insertions(+), 2 deletions(-)
>  rename include/{drm-uapi => linux-uapi}/sync_file.h (100%)
> 
> diff --git a/README.md b/README.md
> index d71a2fa7..62bef46d 100644
> --- a/README.md
> +++ b/README.md
> @@ -154,8 +154,18 @@ These should be updated all together by:
>      # From the kernel dir with a drm/drm-next commit checked out:
>      $ make INSTALL_HDR_PATH=<dest-dir> headers_install
>      $ rm -f <igt-dir>/include/drm-uapi/*
> -    $ cp <dest-dir>/include/linux/sync_file.h <igt-dir>/include/drm-uapi/
>      $ cp <dest-dir>/include/drm/* <igt-dir>/include/drm-uapi/
>  
>  Then, commit with a note of which exact commit from airlied's branch
>  was used to generate them.
> +
> +### `include/linux-uapi/sync_file.h`
> +
> +Imported non-DRM uapi headers from airlied's drm-next branch.
> +
> +    # From the kernel dir with a drm/drm-next commit checked out:
> +    $ make INSTALL_HDR_PATH=<destdir> headers_install
> +    $ cp <destdir>/include/linux/sync_file.h ~/igt/include/linux-uapi/
> +
> +Then, commit with a note of which exact commit from airlied's branch
> +was used to generate them.
> diff --git a/include/drm-uapi/sync_file.h b/include/linux-uapi/sync_file.h
> similarity index 100%
> rename from include/drm-uapi/sync_file.h
> rename to include/linux-uapi/sync_file.h
> diff --git a/meson.build b/meson.build
> index 06e76189..f9a284d8 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -86,7 +86,7 @@ with_libdrm = get_option('libdrm_drivers')
>  
>  build_info = ['Build type: ' + get_option('buildtype')]
>  
> -inc = include_directories('include/drm-uapi', 'lib', 'lib/stubs/syscalls', '.')
> +inc = include_directories('include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
>  
>  inc_for_gtkdoc = include_directories('lib')
>  
> -- 
> 2.31.1
> 
