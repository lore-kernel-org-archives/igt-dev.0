Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5026E2E9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2020 12:03:06 +0000 (UTC)
Date: Thu, 13 Feb 2020 14:03:03 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200213120303.GU25209@platvala-desk.ger.corp.intel.com>
References: <20200213093041.10120-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213093041.10120-1-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_ccs: Use correct CCS plane
 for semiplanar formats
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 11:30:41AM +0200, Mika Kahola wrote:
> In case with semiplanar formats, we should use correct CCS plane
> when these formats are under a test.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  lib/igt_fb.c    |  2 +-
>  lib/igt_fb.h    |  1 +
>  tests/kms_ccs.c | 27 ++++++++++++++++++++-------
>  3 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 8bdb0a09..0f8435a5 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -359,7 +359,7 @@ static const struct format_desc_struct *lookup_drm_format(uint32_t drm_format)
>  	return NULL;
>  }
>  
> -static bool igt_format_is_yuv_semiplanar(uint32_t format)
> +bool igt_format_is_yuv_semiplanar(uint32_t format)


New exported library function could use some docs if you don't mind!


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
