Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108E710E064
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 10:13:40 +0000 (UTC)
Date: Wed, 26 Apr 2023 12:13:36 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: janga.rahul.kumar@intel.com
Message-ID: <20230426101336.acli72woncnfonsq@zkempczy-mobl2>
References: <20230425184003.3089338-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425184003.3089338-1-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/xe/xe_query: Add subtest
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

On Wed, Apr 26, 2023 at 12:10:03AM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Check query with invalid extension returns expected error code.
> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/xe/xe_query.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
> index 3f038225..6c35730c 100644
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
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);

I forget to comment this value, -1 is not valid error code we should
validate in this test.

--
Zbigniew

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
