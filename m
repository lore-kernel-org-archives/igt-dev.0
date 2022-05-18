Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A71310F239
 for <igt-dev@lists.freedesktop.org>; Wed, 18 May 2022 12:38:52 +0000 (UTC)
Date: Wed, 18 May 2022 15:38:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <YoTo2Q3yhZunYyQZ@intel.com>
References: <20220516035255.28288-1-karthik.b.s@intel.com>
 <YoNTStoMBn3nRWO0@intel.com>
 <20220517182949.GA34204@mdnavare-mobl1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220517182949.GA34204@mdnavare-mobl1.jf.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_invalid_mode: Skip
 clock-too-high subtest on DSC panel
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

On Tue, May 17, 2022 at 11:29:49AM -0700, Navare, Manasi wrote:
> On Tue, May 17, 2022 at 10:48:26AM +0300, Ville Syrjälä wrote:
> > On Mon, May 16, 2022 at 09:22:55AM +0530, Karthik B S wrote:
> > > Max clock limit calculation isn't valid with DSC.
> > 
> > What does it have to do with DSC?
> 
> The problem with DSC is that, with DSC we can support much higher mode
> clock withc ompressed BPP.
> So even if the test sets high mode clock, driver is able to handle it
> with compressed BPP and hence the modeset actually succeeds and test
> fails.

DSC does not affect the max dotclock. Well, except indirectly by
allowing the use of bigjoiner.

> 
> Manasi
> 
> > 
> > > Skip the test on DSC panels.
> > > 
> > > Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4402
> > > 
> > > Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> > > ---
> > >  tests/kms_invalid_mode.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> > > index bb92a94e..cf011a17 100644
> > > --- a/tests/kms_invalid_mode.c
> > > +++ b/tests/kms_invalid_mode.c
> > > @@ -73,6 +73,8 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
> > >  	int max_dotclock = data->max_dotclock;
> > >  
> > >  	igt_require(max_dotclock != 0);
> > > +	igt_require(!igt_is_dsc_supported(data->drm_fd,
> > > +					  data->output->config.connector));
> > >  
> > >  	/*
> > >  	 * FIXME When we have a fixed mode, the kernel will ignore
> > > -- 
> > > 2.22.0
> > 
> > -- 
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
