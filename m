Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5461B6F3AE
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 08:23:55 +0000 (UTC)
Date: Thu, 7 Oct 2021 11:27:22 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YV6vamfWa+8n4oh7@platvala-desk.ger.corp.intel.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
 <20211006161444.904476-9-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006161444.904476-9-rodrigo.vivi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] README.md: Accept the i915_drm.h
 standalone update.
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

On Wed, Oct 06, 2021 at 12:14:44PM -0400, Rodrigo Vivi wrote:
> Looking to our git log we can see that the most common case
> is the update of the single i915_drm.h file.
> 
> There are some advantages of doing this standalone update:
> 
> 1. Make reviews easier without the noise of other headers.
> 2. Avoid the developer to have to touch other areas that are
>    not immediately related to targeted work.
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  README.md | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/README.md b/README.md
> index 62bef46d..66f2bc0f 100644
> --- a/README.md
> +++ b/README.md
> @@ -159,6 +159,20 @@ These should be updated all together by:
>  Then, commit with a note of which exact commit from airlied's branch
>  was used to generate them.
>  
> +### `include/drm-uapi/i915_drm.h`
> +
> +Imported i915_drm.h uapi headers from airlied's drm-next branch.
> +
> +In some cases updating a single uapi file is needed as our history
> +shows. So in this case, it should be done by:
> +
> +    # From the kernel dir with a drm/drm-next commit checked out:
> +    $ make INSTALL_HDR_PATH=<dest-dir> headers_install
> +    $ cp <dest-dir>/include/drm/i915_drm.h <igt-dir>/include/drm-uapi/
> +
> +Then, commit with a note of which exact commit from airlied's branch
> +was used to generate it.
> +
>  ### `include/linux-uapi/sync_file.h`
>  
>  Imported non-DRM uapi headers from airlied's drm-next branch.
> -- 
> 2.31.1
> 
