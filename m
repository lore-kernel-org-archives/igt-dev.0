Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6876E497
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 08:28:44 +0000 (UTC)
Date: Tue, 14 Apr 2020 07:00:59 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20200414013058.GA14869@intel.com>
References: <20200414081447.1451675-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414081447.1451675-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] test/kms_chamelium: Start with
 disabling modeset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-04-14 at 11:14:45 +0300, Arkadiusz Hiler wrote:
> Doing disabling modeset from igt_display_require() is quite tricky, as
> there are some tests that depend on the leftover mode set by fbcon in
> order to work + PSR debugfs checks seem to behave a bit weird.
> 
> While those issues are being worked on let's do a disabling modeset
> between igt_display_require() and chamelium_init() so port
> auto-discovery works reliably on all configurations.
> 
> Issue: https://gitlab.freedesktop.org/drm/intel/issues/323
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  tests/kms_chamelium.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index e5cfa633..b7207ef9 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -2520,6 +2520,12 @@ igt_main
>  		igt_display_require(&data.display, data.drm_fd);
>  		igt_require(data.display.is_atomic);
>  
> +		/*
> +		 * XXX: disabling modeset, can be removed when
> +		 * igt_display_require will start doing this for us
> +		 */
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +
>  		/* we need to initalize chamelium after igt_display_require */
>  		data.chamelium = chamelium_init(data.drm_fd);
>  		igt_require(data.chamelium);
> -- 
> 2.24.1
> 
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
