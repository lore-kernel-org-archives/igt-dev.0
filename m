Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB2310E0A4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 17:12:32 +0000 (UTC)
Date: Wed, 4 Oct 2023 19:12:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Message-ID: <20231004171223.enzsle6zfdjfakzx@zkempczy-mobl2>
References: <20230926123224.514543-1-nemesa.garg@intel.com>
 <20230926123224.514543-2-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926123224.514543-2-nemesa.garg@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rmfb: Add check for xe
 driver
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

On Tue, Sep 26, 2023 at 06:02:23PM +0530, Nemesa Garg wrote:
> As the xe check is missing the value of open_count
> variable is not incrementing and because of this
> during drm_close_driver operation based on open_count
> value mutex is acquired and there is a callback to
> lastclose function.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  lib/drmtest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index e1da66c87..99b655680 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -649,7 +649,7 @@ int drm_open_driver(int chipset)
>  	 * starting a test and we install an exit handler to wait until
>  	 * idle before quitting.
>  	 */
> -	if (is_i915_device(fd)) {
> +	if (is_i915_device(fd) || is_xe_device(fd)) {

I think this might be changed to is_intel_device(fd) but
below cancel work doesn't work for xe if I'm not wrong
so it should be called for i915 only.

--
Zbigniew


>  		if (__sync_fetch_and_add(&open_count, 1) == 0) {
>  			__cancel_work_at_exit(fd);
>  			at_exit_drm_fd = drm_reopen_driver(fd);
> -- 
> 2.25.1
> 
