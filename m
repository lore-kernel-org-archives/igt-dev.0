Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD2F6E993
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 09:29:25 +0000 (UTC)
Date: Mon, 4 Oct 2021 12:32:53 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YVrKRXeGi2V37xCP@platvala-desk.ger.corp.intel.com>
References: <20210903123027.1433-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903123027.1433-1-contact@emersion.fr>
Subject: Re: [igt-dev] [RFC i-g-t] tests/kms_lease: add empty lease test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Simon Ser <contact@emersion.fr>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 03, 2021 at 12:30:38PM +0000, Simon Ser wrote:
> This is an update for a kernel change currently being reviewed.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

When is the kernel change going to hit drm-tip? We're going to need a
bug report and cibuglog filter for this failing without it if this is
merged before kernel. (Which is ok, with the bug filing done)


> ---
>  tests/kms_lease.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index c5c88e145e1a..b69d99389de0 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -250,6 +250,15 @@ static void simple_lease(data_t *data)
>  	terminate_lease(&lease);
>  }
>  
> +static void empty_lease(data_t *data)
> +{
> +	struct drm_mode_create_lease mcl = {0};
> +
> +	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +
> +	close(mcl.fd);
> +}
> +
>  static void page_flip_implicit_plane(data_t *data)
>  {
>  	uint32_t object_ids[3];
> @@ -842,16 +851,10 @@ static void run_test(data_t *data, void (*testfunc)(data_t *))
>  static void invalid_create_leases(data_t *data)
>  {
>  	uint32_t object_ids[4];
> -	struct drm_mode_create_lease mcl;
> +	struct drm_mode_create_lease mcl = {0};
>  	drmModeRes *resources;
>  	int tmp_fd, ret;
>  
> -	/* empty lease */
> -	mcl.object_ids = 0;
> -	mcl.object_count = 0;
> -	mcl.flags = 0;
> -	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
> -
>  	/* NULL array pointer */
>  	mcl.object_count = 1;
>  	igt_assert_eq(create_lease(data->master.fd, &mcl), -EFAULT);
> @@ -1221,6 +1224,7 @@ igt_main
>  		const char *desc;
>  	} funcs[] = {
>  		{ "simple_lease", simple_lease, "Check if create lease ioctl call works" },
> +		{ "empty_lease", empty_lease, "Check that creating an empty lease works" },
>  		{ "lessee_list", lessee_list, "Check if listed lease is same as created one" },
>  		{ "lease_get", lease_get, "Tests getting the required contents of a lease" },
>  		{ "lease_unleased_connector", lease_unleased_connector, "Negative test by trying to"
> -- 
> 2.33.0
> 
> 
