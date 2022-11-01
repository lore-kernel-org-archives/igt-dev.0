Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037CC10E339
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Nov 2022 09:02:58 +0000 (UTC)
Date: Tue, 1 Nov 2022 11:02:57 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y2DgwbLrAIneXoau@platvala-desk.ger.corp.intel.com>
References: <20221031195859.127493-1-rodrigo.vivi@intel.com>
 <20221031195859.127493-2-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031195859.127493-2-rodrigo.vivi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tools/intel_pm_rpm: Only init
 debufs_fd if needed.
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

On Mon, Oct 31, 2022 at 03:58:59PM -0400, Rodrigo Vivi wrote:
> So we can run a --setup-d3cold without depending on the presence
> of a debugfs.
> 
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


For the series:
Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tools/intel_pm_rpm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 05d7f6fb..17cd2bc1 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -197,10 +197,9 @@ int main(int argc, char *argv[])
>  		goto exit;
>  	}
>  
> -	data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
> -
>  	data.res = drmModeGetResources(data.drm_fd);
>  	if (data.res) {
> +		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
>  
> @@ -240,7 +239,8 @@ exit:
>  	if (data.res)
>  		igt_display_fini(&data.display);
>  
> -	close(data.debugfs_fd);
> +	if (data.debugfs_fd)
> +		close(data.debugfs_fd);
>  	close(data.drm_fd);
>  	igt_devices_free();
>  
> -- 
> 2.37.3
> 
