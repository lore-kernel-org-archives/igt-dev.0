Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4418410E34D
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 15:45:40 +0000 (UTC)
Date: Fri, 7 Oct 2022 18:45:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <Y0BJoDOIt8MdcXpp@intel.com>
References: <20221007134029.3188-1-ville.syrjala@linux.intel.com>
 <Y0BGpv2T0Mkp1hFB@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y0BGpv2T0Mkp1hFB@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] Revert "kms_invalid_mode: Close
 device before exit"
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

On Fri, Oct 07, 2022 at 05:32:54PM +0200, Kamil Konieczny wrote:
> Hi Ville,
> 
> On 2022-10-07 at 16:40:27 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > This reverts commit 544fe3ab351e26b39c2db4a8bc9ac2b5032566c4.
> > 
> > Collateral damage.
> 
> You made also two other reverts to this test, maybe this close()
> is ok ? This change was part of big series and waited here for
> over a week, so please try to send patch series with cover letter
> and put there any logs, debug, dumps or links to our CI to see
> what happened. Note also that there are other kms tests with
> similar change.
> 
> If I may suggest please send series with two other reverts to see
> if this close() could stay.

I was too lazy to start resolving the conflicts. I'll leave
that to those who broke the test.

> 
> Regards,
> Kamil
> 
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tests/kms_invalid_mode.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> > index f1c38669860d..0ae98a31fcc2 100644
> > --- a/tests/kms_invalid_mode.c
> > +++ b/tests/kms_invalid_mode.c
> > @@ -306,6 +306,5 @@ igt_main
> >  	igt_fixture {
> >  		igt_display_fini(&data.display);
> >  		igt_reset_connectors();
> > -		close(data.drm_fd);
> >  	}
> >  }
> > -- 
> > 2.35.1
> > 

-- 
Ville Syrjälä
Intel
