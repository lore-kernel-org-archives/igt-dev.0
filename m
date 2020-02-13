Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D24B6E2E2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2020 14:05:02 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Thu, 13 Feb 2020 14:05:00 +0000
Message-ID: <4fb1604c756c8a705876a9699f1a8df8b8188842.camel@intel.com>
References: <20200213093041.10120-1-mika.kahola@intel.com>
 <20200213120303.GU25209@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200213120303.GU25209@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <685A8BA40A87314891DAF5E80585F822@intel.com>
MIME-Version: 1.0
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
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 2020-02-13 at 14:03 +0200, Petri Latvala wrote:
> On Thu, Feb 13, 2020 at 11:30:41AM +0200, Mika Kahola wrote:
> > In case with semiplanar formats, we should use correct CCS plane
> > when these formats are under a test.
> > 
> > Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> > ---
> >  lib/igt_fb.c    |  2 +-
> >  lib/igt_fb.h    |  1 +
> >  tests/kms_ccs.c | 27 ++++++++++++++++++++-------
> >  3 files changed, 22 insertions(+), 8 deletions(-)
> > 
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 8bdb0a09..0f8435a5 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -359,7 +359,7 @@ static const struct format_desc_struct
> > *lookup_drm_format(uint32_t drm_format)
> >  	return NULL;
> >  }
> >  
> > -static bool igt_format_is_yuv_semiplanar(uint32_t format)
> > +bool igt_format_is_yuv_semiplanar(uint32_t format)
> 
> 
> New exported library function could use some docs if you don't mind!

Agreed. Some documentation would be nice to have. I'll fix that.

-Mika-
> 
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
