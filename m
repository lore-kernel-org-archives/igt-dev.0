Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842A210E33C
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 14:20:13 +0000 (UTC)
Date: Thu, 27 Apr 2023 16:20:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: janga.rahul.kumar@intel.com
Message-ID: <20230427142009.iixocfxoj7mtz7qu@zkempczy-mobl2>
References: <20230427114256.3182329-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230427114256.3182329-1-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_query: Add subtest
 query-invalid-extension
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 05:12:56PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Check query with invalid extension returns expected error code.
> 
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> CC: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/xe/xe_query.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
> index 3f038225..a0fb5422 100644
> --- a/tests/xe/xe_query.c
> +++ b/tests/xe/xe_query.c
> @@ -435,6 +435,23 @@ test_query_invalid_size(int fd)
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);
>  }
>  
> +/**
> + * SUBTEST: query-invalid-extension
> + * Description: Check query with invalid extension returns expected error code.
> + */
> +static void
> +test_query_invalid_extension(int fd)
> +{
> +	struct drm_xe_device_query query = {
> +		.extensions = -1,
> +		.query = DRM_XE_DEVICE_QUERY_CONFIG,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +}
> +
>  igt_main
>  {
>  	int xe;
> @@ -468,6 +485,9 @@ igt_main
>  	igt_subtest("query-invalid-size")
>  		test_query_invalid_size(xe);
>  
> +	igt_subtest("query-invalid-extension")
> +		test_query_invalid_extension(xe);
> +
>  	igt_fixture {
>  		xe_device_put(xe);
>  		close(xe);
> -- 
> 2.25.1
> 
