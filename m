Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5D589C18
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Dec 2021 13:41:33 +0000 (UTC)
Date: Mon, 20 Dec 2021 15:39:42 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YcCHnq3zCBuRWqB5@platvala-desk.ger.corp.intel.com>
References: <20211220094153.282527-1-ananya.sharma@intel.com>
 <20211220094153.282527-3-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220094153.282527-3-ananya.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_lease: replacing
 drmModeAtomicCommit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ananya Sharma <ananya.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 03:11:53PM +0530, Ananya Sharma wrote:
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>  tests/kms_lease.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index c5c88e14..db433958 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -477,7 +477,7 @@ static void atomic_implicit_crtc(data_t *data)
>  	igt_assert(ret >= 0);
>  
>  	/* sanity check */
> -	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> +	ret = igt_display_commit2(&data->master.display, COMMIT_ATOMIC);
>  	igt_assert(ret == 0 || ret == -EINVAL);
>  
>  	ret = drmModeAtomicCommit(mcl.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> @@ -492,7 +492,7 @@ static void atomic_implicit_crtc(data_t *data)
>  	igt_assert(ret >= 0);
>  
>  	/* sanity check */
> -	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> +	ret = igt_display_commit2(&data->master.display, COMMIT_ATOMIC);

If you wanted to replace the calls with an equivalent igt wrapper,
these are not equivalent. You dropped TEST_ONLY from these calls.


-- 
Petri Latvala
