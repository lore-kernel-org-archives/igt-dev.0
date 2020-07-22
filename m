Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C724A89243
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2020 07:41:12 +0000 (UTC)
Date: Wed, 22 Jul 2020 10:41:04 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200722074104.GQ20883@platvala-desk.ger.corp.intel.com>
References: <20200715120339.11403-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715120339.11403-1-pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms_big_fb: Use igt_assert on bufmgr
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
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 05:33:39PM +0530, Pankaj Bharadiya wrote:
> NULL bufmgr pointer leads to SIGSEGV. Assert on NULL bufmgr so that
> correct failure reason will get dumped in the stack trace.
> 
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  tests/kms_big_fb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index a754b2997..b19b56f90 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -649,6 +649,7 @@ igt_main
>  			data.render_copy = igt_get_render_copyfunc(data.devid);
>  
>  		data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
> +		igt_assert(data.bufmgr);
>  		data.batch = intel_batchbuffer_alloc(data.bufmgr, data.devid);

Make the error message more helpful, as suggested by Chris last time
this patch was independently written by Swati:

const struct intel_device_info *info;
info = intel_get_device_info(data.devid);
igt_assert_f(data.bufmgr, "Update libdrm for %s support\n",
             info->gen ? info->codename : "<unknown chipset>");


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
