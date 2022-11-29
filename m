Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D3D10E07D
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 09:59:55 +0000 (UTC)
Date: Tue, 29 Nov 2022 11:59:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <Y4XYGG+X8qFZiIsf@intel.com>
References: <20221129084710.1151876-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221129084710.1151876-1-jani.nikula@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_vbt_decode: decode VBT MIPI
 sequence v4 native flag
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

On Tue, Nov 29, 2022 at 10:47:10AM +0200, Jani Nikula wrote:
> MIPI sequence v4 has a flag for native/non-native GPIO.

An naturally zero docs on what it actually means. But looks like
we're just meant to poke various DE registers for the "native" case.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tools/intel_vbt_decode.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index a63bfdda142a..94a910b5c107 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2049,8 +2049,12 @@ static const uint8_t *mipi_dump_gpio(const uint8_t *data, uint8_t seq_version)
>  		number = *data++;
>  		flags = *data++;
>  
> -		printf("\t\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
> -		       index, number, flags & 1, flags);
> +		if (seq_version >= 4)
> +			printf("\t\t\tGPIO index %u, number %u, native %d, set %d (0x%02x)\n",
> +			       index, number, !(flags & 2), flags & 1, flags);
> +		else
> +			printf("\t\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
> +			       index, number, flags & 1, flags);
>  	} else {
>  		index = *data++;
>  		flags = *data++;
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
