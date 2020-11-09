Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAE18919F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 06:59:06 +0000 (UTC)
Date: Mon, 9 Nov 2020 08:59:02 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201109065902.GW7444@platvala-desk.ger.corp.intel.com>
References: <20201107111544.65260-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107111544.65260-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr: Check for available
 modesetting support
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Nov 07, 2020 at 11:15:44AM +0000, Chris Wilson wrote:
> Check that there is a valid output/mode combo before trying to
> dereference them.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2212
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/kms_psr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> index af81a259b..bb18e563a 100644
> --- a/tests/kms_psr.c
> +++ b/tests/kms_psr.c
> @@ -411,8 +411,11 @@ static void setup_test_plane(data_t *data, int test_plane)
>  
>  static void test_setup(data_t *data)
>  {
> +	igt_require(data->mode);
> +	igt_require(data->output);


"Requirement failed: data->mode" is slightly less than useful. Please
use igt_require_f here with whatever explanation is appropriate for
these situations. "No valid modes available", is that just lacking
appropriate resolutions from the GPU side? "No outputs connected" for
the latter?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
