Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4F57234F
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 10:38:27 +0000 (UTC)
Date: Fri, 24 Jan 2020 12:38:24 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200124103824.GQ25209@platvala-desk.ger.corp.intel.com>
References: <1579766442-20285-1-git-send-email-kunal1.joshi@intel.com>
 <1579766442-20285-3-git-send-email-kunal1.joshi@intel.com>
 <20200124100754.GN25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124100754.GN25209@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 2/4] Moved common function in
 kms_color and kms_color_chamelium to kms_color_helper.c
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, ville.syrjala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 24, 2020 at 12:07:54PM +0200, Petri Latvala wrote:
> On Thu, Jan 23, 2020 at 01:30:40PM +0530, Kunal Joshi wrote:
> > kms_color and kms_color_chamelium shared common functions.
> > Moved them to tests/kms_color_helper.c to avoid code duplication.
> > 
> > (v4)
> >         Made a library kms_color_helper.c which is specific to
> >         kms_color and kms_color_chamelium.
> > 
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > Suggested-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  tests/Makefile.am        |   3 +
> >  tests/Makefile.sources   |  13 +-
> >  tests/kms_color.c        | 383 +---------------------------------------------
> >  tests/kms_color.h        | 105 +++++++++++++
> >  tests/kms_color_helper.c | 386 +++++++++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build        |  19 ++-
> >  6 files changed, 525 insertions(+), 384 deletions(-)
> >  create mode 100644 tests/kms_color.h
> >  create mode 100644 tests/kms_color_helper.c
> > 
> > diff --git a/tests/Makefile.am b/tests/Makefile.am
> > index fc30524..87ffec2 100644
> > --- a/tests/Makefile.am
> > +++ b/tests/Makefile.am
> > @@ -13,11 +13,14 @@ endif
> >  if HAVE_CHAMELIUM
> >  TESTS_progs += \
> >  	kms_chamelium \
> > +	kms_color_chamelium \

Well, this I missed: The build system changes related to
kms_color_chamelium need to be moved to the patch that adds
kms_color_chamelium.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
