Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 21 Jun 2021 13:57:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YNBwoaw3fgYfxsXS@platvala-desk.ger.corp.intel.com>
References: <20210531153922.4683-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531153922.4683-1-shawn.c.lee@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_dsc: Avoid SIGSEGV when
 release DRM connector.
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
To: Lee Shawn C <shawn.c.lee@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 31, 2021 at 11:39:22PM +0800, Lee Shawn C wrote:
> Got SIGSEGV fault while running kms_dp_dsc test but did not
> connect DP DSC capable monitor on eDP/DP port. This test daemon
> should "SKIP" test without any problem. We found kms_dp_dsc
> can't get proper drmModeConnector and caused this SIGSEGV fault
> when release it. Make sure drmModeConnector is available before
> free it can avoid this issue.
> 
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/kms_dp_dsc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
> index 2446fd82bba3..ea7c9f4f72ce 100644
> --- a/tests/kms_dp_dsc.c
> +++ b/tests/kms_dp_dsc.c
> @@ -262,7 +262,7 @@ igt_main
>  	data_t data = {};
>  	igt_output_t *output;
>  	drmModeRes *res;
> -	drmModeConnector *connector;
> +	drmModeConnector *connector = NULL;
>  	int i, test_conn_cnt, test_cnt;
>  	int tests[] = {DRM_MODE_CONNECTOR_eDP, DRM_MODE_CONNECTOR_DisplayPort};
>  
> @@ -311,7 +311,8 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		drmModeFreeConnector(connector);
> +		if (connector)
> +			drmModeFreeConnector(connector);
>  		drmModeFreeResources(res);
>  		close(data.debugfs_fd);
>  		close(data.drm_fd);
> -- 
> 2.17.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
