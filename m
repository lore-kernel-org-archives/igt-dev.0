Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCE810E497
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 08:39:02 +0000 (UTC)
Date: Thu, 2 Feb 2023 09:38:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230202083857.m67gkm4sewb27gpb@zkempczy-mobl2>
References: <20230201132657.575932-1-zbigniew.kempczynski@intel.com>
 <20230201132657.575932-3-zbigniew.kempczynski@intel.com>
 <20230201154441.keb4xwtafvsxkqgq@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230201154441.keb4xwtafvsxkqgq@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/i915_crc: Use graphics version
 to determine ALU SHL/SHR caps
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 01, 2023 at 04:44:41PM +0100, Kamil Konieczny wrote:
> On 2023-02-01 at 14:26:57 +0100, Zbigniew Kempczyński wrote:
> > Start supporting crc calculations on platforms which contains necessary
> > ALU instructions.
> 
> Something to consider in future: maybe we can add to i915 library new
> function has_alu_shl_shr(devid) ?

Thank you for the review. I pushed the series.

Regarding has_alu_shl_shr() - I think it is worth to add if there will
be more users of it. At the moment only crc calculation uses this.

--
Zbigniew

> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> --
> Kamil
> 
> > ---
> >  lib/i915/i915_crc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/i915/i915_crc.c b/lib/i915/i915_crc.c
> > index cdd3cef6df..7d68f8e5c4 100644
> > --- a/lib/i915/i915_crc.c
> > +++ b/lib/i915/i915_crc.c
> > @@ -295,5 +295,5 @@ bool supports_i915_crc32(int i915)
> >  {
> >  	uint16_t devid = intel_get_drm_devid(i915);
> >  
> > -	return IS_DG2(devid);
> > +	return intel_graphics_ver(devid) > IP_VER(12, 50);
> >  }
> > -- 
> > 2.34.1
> > 
