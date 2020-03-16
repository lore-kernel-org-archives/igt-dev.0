Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2146E394
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 09:05:07 +0000 (UTC)
Date: Mon, 16 Mar 2020 11:05:04 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200316090504.GB9497@platvala-desk.ger.corp.intel.com>
References: <20200313132556.26038-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313132556.26038-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Made debug info more
 evident
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 13, 2020 at 06:55:56PM +0530, Swati Sharma wrote:
> In present scenario, whenever subtest gets SKIPPED we get debug info
> "connector property not found or panel is non-HDR" which is quite vague.
> Added igt_info() stating the actual reason of skip. This will help in
> bug assessment too.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/kms_hdr.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 677936c6..71372556 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -285,7 +285,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>  		valid_tests++;
>  	}
>  
> -	igt_require_f(valid_tests, "No connector found with MAX BPC connector property\n");
> +	igt_require_f(valid_tests, "No connector found with max_bpc connector property\n");
>  }
>  
>  static bool cta_block(const char *edid_ext)
> @@ -609,24 +609,26 @@ static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
>  		 * set MAX_BPC property to 10bpc prior to setting
>  		 * HDR metadata property. Therefore, checking.
>  		 */
> -		if (!has_max_bpc(output))
> -			continue;
> -
> -		if (!has_hdr(output))
> +		if (!has_max_bpc(output) || !has_hdr(output)) {
> +			igt_info("%s connector not found with HDR metadata/max_bpc connector property\n", output->name);
>  			continue;
> +		}
>  
> -		if (!is_panel_hdr(data, output))
> +		if (!is_panel_hdr(data, output)) {
> +			igt_info("Panel attached via %s connector is non-HDR\n", output->name);
>  			continue;
> +		}
>  
>  		igt_info("HDR %s test execution on %s\n", test_name, output->name);
>  		if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
>  			test_static_toggle(data, output, flags);
>  		if (flags & TEST_SWAP)
>  			test_static_swap(data, output);
> +
>  		valid_tests++;
>  	}
>  
> -	igt_require_f(valid_tests, "No connector found with HDR metadata/MAX BPC connector property (or) panel is Non-HDR\n");
> +	igt_require_f(valid_tests, "No connector found with HDR metadata/max_bpc connector property (or) panel is non-HDR\n");
>  }
>  
>  igt_main
> -- 
> 2.25.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
