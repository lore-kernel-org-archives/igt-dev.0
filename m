Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AEB6ED9F
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2020 09:27:24 +0000 (UTC)
From: "Kaparthi, SowmyaX" <sowmyax.kaparthi@intel.com>
Date: Wed, 9 Sep 2020 09:27:19 +0000
Message-ID: <DM6PR11MB3002BB10CB6459C7AD5255069B260@DM6PR11MB3002.namprd11.prod.outlook.com>
References: <20200908090436.1344-1-sowmyax.kaparthi@intel.com>
 <2c5152b0d78740d790754e878db075e3@intel.com>
 <20200909090747.GZ7444@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200909090747.GZ7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: "Latvala, Petri" <petri.latvala@intel.com>, "Kahola, Mika" <mika.kahola@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

  This patch got merged in internal igt but not in open source igt.  This causing the kms_plane_scaling test case fail. So I requested Mika to push this patch to open source igt. 

Thanks and Regards
Sowmya

-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com> 
Sent: 09 September 2020 14:38
To: Kahola, Mika <mika.kahola@intel.com>
Cc: Kaparthi, SowmyaX <sowmyax.kaparthi@intel.com>; igt-dev@lists.freedesktop.org; Ausmus, James <james.ausmus@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_scaling: set minimum height and width to 20

On Wed, Sep 09, 2020 at 06:51:13AM +0000, Kahola, Mika wrote:
> > -----Original Message-----
> > From: Kaparthi, SowmyaX <sowmyax.kaparthi@intel.com>
> > Sent: Tuesday, September 8, 2020 12:05 PM
> > To: igt-dev@lists.freedesktop.org; Ausmus, James 
> > <james.ausmus@intel.com>; Kahola, Mika <mika.kahola@intel.com>; 
> > Kaparthi, SowmyaX <sowmyax.kaparthi@intel.com>
> > Subject: [i-g-t] tests/kms_plane_scaling: set minimum height and 
> > width to 20
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

I'm confused by what's going on here. This patch was originated by Matt Atwood, resent, re-reviewed...

I merged the patch now, with all S-o-b:s and R-b:s combined.



--
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
