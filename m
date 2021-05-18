Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C606E85E
 for <igt-dev@lists.freedesktop.org>; Tue, 18 May 2021 09:27:21 +0000 (UTC)
References: <20210507125039.2255568-1-arundhati.hagaragi@intel.com>
 <20210518085851.771874-1-arundhati.hagaragi@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <71253df8-b082-9206-2ec0-26d1f024cccc@intel.com>
Date: Tue, 18 May 2021 14:57:11 +0530
MIME-Version: 1.0
In-Reply-To: <20210518085851.771874-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_lease: Add subtest
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Gupta Nidhi1 <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 5/18/2021 2:28 PM, Arundhati Hagaragi wrote:
> Added description for subtest
>
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Cc: B S Karthik <karthik.b.s@intel.com>
> Cc: Gupta Nidhi1 <nidhi1.gupta@intel.com>
>
> v2: Modified & applied description to each tests seperately. (Petri)
> v3, v4: Modified description of subtests (Karthik)
> ---
>   tests/kms_lease.c | 35 +++++++++++++++++++++--------------
>   1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 6397ef8f..0b7a560f 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -1281,21 +1281,27 @@ igt_main
>   	const struct {
>   		const char *name;
>   		void (*func)(data_t *);
> +		const char *desc;
>   	} funcs[] = {
> -		{ "simple_lease", simple_lease },
> -		{ "lessee_list", lessee_list },
> -		{ "lease_get", lease_get },
> -		{ "lease_unleased_connector", lease_unleased_connector },
> -		{ "lease_unleased_crtc", lease_unleased_crtc },
> -		{ "lease_revoke", lease_revoke },
> -		{ "lease_again", lease_again },
> -		{ "lease_invalid_connector", lease_invalid_connector },
> -		{ "lease_invalid_crtc", lease_invalid_crtc },
> -		{ "lease_invalid_plane", lease_invalid_plane },
> -		{ "page_flip_implicit_plane", page_flip_implicit_plane },
> -		{ "setcrtc_implicit_plane", setcrtc_implicit_plane },
> -		{ "cursor_implicit_plane", cursor_implicit_plane },
> -		{ "atomic_implicit_crtc", atomic_implicit_crtc },
> +		{ "simple_lease", simple_lease, "Check if create lease ioctl call works" },
> +		{ "lessee_list", lessee_list, "Check if listed lease is same as created one" },
> +		{ "lease_get", lease_get, "Tests getting the required contents of a lease" },
> +		{ "lease_unleased_connector", lease_unleased_connector, "Negative test by trying to"
> +			" use an unleased connector " },
> +		{ "lease_unleased_crtc", lease_unleased_crtc, "Negative test by trying to use an unleased crtc" },
> +		{ "lease_revoke", lease_revoke, "Tests revocation of lease" },
> +		{ "lease_again", lease_again, "Tests leasing objects more than once" },
> +		{ "lease_invalid_connector", lease_invalid_connector, "Tests leasing an invalid connector" },
> +		{ "lease_invalid_crtc", lease_invalid_crtc, "Tests leasing an invalid crtc" },
> +		{ "lease_invalid_plane", lease_invalid_plane, "Tests leasing an invalid plane" },
> +		{ "page_flip_implicit_plane", page_flip_implicit_plane, "Negative test by using a "
> +			"non-primary plane with the page flip ioctl" },
> +		{ "setcrtc_implicit_plane", setcrtc_implicit_plane, "Negative test by using a "
> +			"non-primary plane with the setcrtc ioctl" },
> +		{ "cursor_implicit_plane", cursor_implicit_plane, "Negative test by using a non-primary"
> +			" plane with setcursor ioctl" },
> +		{ "atomic_implicit_crtc", atomic_implicit_crtc, "Negative test by using a crtc-id "
> +			"property with atomic ioctl" },

Please change this to "Negative test by using a different crtc with 
atomic ioctl".

With this fixed, the patch looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>   		{ }
>   	}, *f;
>   
> @@ -1307,6 +1313,7 @@ igt_main
>   
>   	for (f = funcs; f->name; f++) {
>   
> +		igt_describe(f->desc);
>   		igt_subtest_f("%s", f->name) {
>   			run_test(&data, f->func);
>   		}


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
