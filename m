Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A163910E5F9
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 10:36:32 +0000 (UTC)
Date: Mon, 19 Sep 2022 13:35:53 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Ananya Sharma <ananya.sharma@intel.com>
Message-ID: <YyhGCTHVAd8L5Cnw@platvala-desk.ger.corp.intel.com>
References: <20220919100623.667060-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919100623.667060-1-ananya.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_aux_dev: Convert test to
 dynamic
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

On Mon, Sep 19, 2022 at 03:36:23PM +0530, Ananya Sharma wrote:
> Modified kms_universal_plane to include dynamic test cases.
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>  tests/kms_dp_aux_dev.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index d3249fa3..ac12b500 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -118,7 +118,7 @@ static bool test(int drm_fd, uint32_t connector_id)
>  	return false;
>  }
>  
> -igt_simple_main
> +igt_main
>  {
>  	int valid_connectors = 0;
>  	drmModeRes *res;
> @@ -129,8 +129,13 @@ igt_simple_main
>  	res = drmModeGetResources(drm_fd);
>  	igt_require(res);

Calling anything that touches DRM outside of an igt_fixture or a
subtest is invalid. drmModeGetResources and its friends here for
example.


-- 
Petri Latvala


>  
> -	for (int i = 0; i < res->count_connectors; i++)
> -		valid_connectors += test(drm_fd, res->connectors[i]);
> +	igt_subtest_with_dynamic("basic") {
> +		for (int i = 0; i < res->count_connectors; i++)
> +			igt_dynamic_f("subtest-%d", i) {
> +				valid_connectors += test(drm_fd, res->connectors[i]);
> +			}
> +	}
> +
>  	igt_require(valid_connectors);
>  
>  	drmModeFreeResources(res);
> -- 
> 2.25.1
> 
