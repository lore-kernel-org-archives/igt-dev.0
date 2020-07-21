Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1086E420
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2020 15:57:39 +0000 (UTC)
References: <20200715120339.11403-1-pankaj.laxminarayan.bharadiya@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <e61c9dd3-95e9-7fa4-0929-a98c37e2a59e@intel.com>
Date: Tue, 21 Jul 2020 21:27:37 +0530
MIME-Version: 1.0
In-Reply-To: <20200715120339.11403-1-pankaj.laxminarayan.bharadiya@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [i-g-t] tests/kms_big_fb: Use igt_assert on bufmgr
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
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 7/15/2020 5:33 PM, Pankaj Bharadiya wrote:
> NULL bufmgr pointer leads to SIGSEGV. Assert on NULL bufmgr so that
> correct failure reason will get dumped in the stack trace.
> 
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>   tests/kms_big_fb.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index a754b2997..b19b56f90 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -649,6 +649,7 @@ igt_main
>   			data.render_copy = igt_get_render_copyfunc(data.devid);
>   
>   		data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
> +		igt_assert(data.bufmgr);

Looks good to me.
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>   		data.batch = intel_batchbuffer_alloc(data.bufmgr, data.devid);
>   	}
>   
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
