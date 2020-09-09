Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4A26ECD1
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2020 09:23:05 +0000 (UTC)
Date: Wed, 9 Sep 2020 12:07:47 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200909090747.GZ7444@platvala-desk.ger.corp.intel.com>
References: <20200908090436.1344-1-sowmyax.kaparthi@intel.com>
 <2c5152b0d78740d790754e878db075e3@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c5152b0d78740d790754e878db075e3@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_scaling: set minimum height
 and width to 20
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kaparthi,
 SowmyaX" <sowmyax.kaparthi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 09, 2020 at 06:51:13AM +0000, Kahola, Mika wrote:
> > -----Original Message-----
> > From: Kaparthi, SowmyaX <sowmyax.kaparthi@intel.com>
> > Sent: Tuesday, September 8, 2020 12:05 PM
> > To: igt-dev@lists.freedesktop.org; Ausmus, James
> > <james.ausmus@intel.com>; Kahola, Mika <mika.kahola@intel.com>;
> > Kaparthi, SowmyaX <sowmyax.kaparthi@intel.com>
> > Subject: [i-g-t] tests/kms_plane_scaling: set minimum height and width to 20
> > 
> > Depending on pixel format minimum width and height can be as high as 20.
> > Set width and height to 20. Remove is_planar_yuv_format, no longer used.
> > 
> > Cc: Ausmus, James <james.ausmus@intel.com>
> > Signed-off-by: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
> 
> The patch look ok to me. The width and height can be divided by 4 and there's no need to have separate width and height for yuv and planar formats.
> 
> Reviewed-by: Mika Kahola <mika.kahola@intel.com>

I'm confused by what's going on here. This patch was originated by
Matt Atwood, resent, re-reviewed...

I merged the patch now, with all S-o-b:s and R-b:s combined.



-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
