Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81636E1F2
 for <igt-dev@lists.freedesktop.org>; Mon, 24 May 2021 15:16:54 +0000 (UTC)
References: <20210524110447.6166-1-kunal1.joshi@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <798d7067-8bde-4139-1adb-e4ce8fbcfa04@intel.com>
Date: Mon, 24 May 2021 20:46:02 +0530
MIME-Version: 1.0
In-Reply-To: <20210524110447.6166-1-kunal1.joshi@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_tiled_display: added test
 description for chamelium subtest
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
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 5/24/2021 4:34 PM, Kunal Joshi wrote:
> Added description for the newly added chamelium subtest,
> test is basically the same as basic-test-pattern just the
> fact it executes on chamelium.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_dp_tiled_display.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
> index 6dafc888..eb28dd6b 100644
> --- a/tests/kms_dp_tiled_display.c
> +++ b/tests/kms_dp_tiled_display.c
> @@ -481,6 +481,8 @@ igt_main
>   	}
>   
>   	#ifdef HAVE_CHAMELIUM
> +        igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
> +                     "page flips for all tiled CRTCs in one vblank (executes on chamelium).");
>   	igt_subtest_f("basic-test-pattern-with-chamelium") {
>   		int i;
>   


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
