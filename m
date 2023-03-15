Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDAD10E994
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 10:25:07 +0000 (UTC)
Date: Wed, 15 Mar 2023 12:25:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <ZBGc/3axSjSQn0UN@intel.com>
References: <20230313151406.2113963-1-bhanuprakash.modem@intel.com>
 <20230313151406.2113963-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313151406.2113963-2-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 2/3] tests/i915/kms_ccs: Cleanup to use
 linear modifier
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 08:44:05PM +0530, Bhanuprakash Modem wrote:
> Use either compressed or linear modifier to test. Due to the
> lack of available bandwidth, we cannot fit two CCS planes into
> the available FIFO configurations.
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/i915/kms_ccs.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
> index 9be3fa252..18d48fb80 100644
> --- a/tests/i915/kms_ccs.c
> +++ b/tests/i915/kms_ccs.c
> @@ -393,10 +393,8 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>  	 */
>  	if (fb_flags & FB_COMPRESSED)
>  		modifier = data->ccs_modifier;
> -	else if (!(fb_flags & FB_HAS_PLANE))
> -		modifier = DRM_FORMAT_MOD_LINEAR;
>  	else
> -		modifier = 0;
> +		modifier = DRM_FORMAT_MOD_LINEAR;

Isn't this whole change a nop? If so why does the commit message
seem to indicate some kind of functional change?

>  
>  	create_fb_prepare_add(data->drm_fd, width, height,
>  			      data->format, modifier,
> -- 
> 2.39.1

-- 
Ville Syrjälä
Intel
