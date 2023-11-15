Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1CA10E542
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 11:07:32 +0000 (UTC)
Date: Wed, 15 Nov 2023 13:07:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <ZVSmcDIr7pVS_odg@intel.com>
References: <20231115090605.1506704-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115090605.1506704-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] lib/igt_kms: Don't read max dotclock on
 non-display platforms
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

On Wed, Nov 15, 2023 at 02:36:05PM +0530, Bhanuprakash Modem wrote:
> On non-display platforms, there is no point in checking for
> max dotclock.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/9672
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 89510ff22..2073fae53 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6056,7 +6056,8 @@ int igt_get_max_dotclock(int fd)
>  	char *s;
>  	int dir, res, max_dotclock = 0;
>  
> -	if (!is_intel_device(fd))
> +	/* If there is no display, then no point to check for dotclock. */
> +	if (!is_intel_device(fd) || !drmModeGetResources(fd))

That will leak.

>  		return max_dotclock;
>  
>  	dir = igt_debugfs_dir(fd);
> -- 
> 2.40.0

-- 
Ville Syrjälä
Intel
