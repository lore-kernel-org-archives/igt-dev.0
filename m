Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C0E6E83A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2020 06:29:11 +0000 (UTC)
Message-ID: <7a1a5aeb98945560facfb8e0bfd34522a19348eb.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 15 Sep 2020 08:29:07 +0200
In-Reply-To: <d4516cc5a792b774a48d92996e40260a542d8534.camel@linux.intel.com>
References: <20200914133652.13021-1-uma.shankar@intel.com>
 <b486d9d8aab62930853beb5e1485166f27072c9e.camel@linux.intel.com>
 <d0e3ad645ce2444f827682c366a0d5dd@intel.com>
 <d4516cc5a792b774a48d92996e40260a542d8534.camel@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/device_reset: Work around for
 driver unbind issue with audio
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
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Bernatowicz, Marcin" <marcin.bernatowicz@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 2020-09-15 at 08:18 +0200, Janusz Krzysztofik wrote:
> Hi Lakshmi,
> 
> On Mon, 2020-09-14 at 20:47 +0000, Vudum, Lakshminarayana wrote:
> > @Janusz Krzysztofik Can you share the link to the failure that contains IGT warning?
> 
> Here it is:
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9008/shard-hsw4/igt@device_reset@unbind-reset-rebind.html

The same issue triggered by core_hotunplug@*bind*:
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9008/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

Thanks,
Janusz
> 
> and before the change for reference:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5783/shard-hsw8/igt@device_reset@unbind-reset-rebind.html
> 
> Thanks,
> Janusz
> 
> >  
> > 
> > Thanks,
> > Lakshmi.
> > -----Original Message-----
> > From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> 
> > Sent: Monday, September 14, 2020 12:19 PM
> > To: Shankar, Uma <uma.shankar@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Bernatowicz, Marcin <marcin.bernatowicz@intel.com>; Deak, Imre <imre.deak@intel.com>; Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> > Subject: Re: [PATCH i-g-t] tests/device_reset: Work around for driver unbind issue with audio
> > 
> > On Mon, 2020-09-14 at 19:06 +0530, Uma Shankar wrote:
> > > Unbinding the i915 driver on some Haswell and Broadwell platforms with 
> > > Azalia audio results in a kernel WARNING on "i915 raw-wakerefs=1
> > > wakelocks=1 on cleanup".  The issue can be worked around by manually 
> > > enabling runtime power management for the conflicting audio adapter.
> > > Use that method but also display a warning to preserve visibility of 
> > > the issue. Also tag the workaround with a FIXME comment.
> > > 
> > > Suggested-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > 
> > Pushed.
> > 
> > @Lakshmi, since kernel WARN has been replaced with an IGT warning but the issue remains the same, please update the filter of the bug.
> > 
> > Thanks,
> > Janusz
> > 
> > > ---
> > >  tests/device_reset.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/tests/device_reset.c b/tests/device_reset.c index 
> > > b1181b3b..9cb59ee4 100644
> > > --- a/tests/device_reset.c
> > > +++ b/tests/device_reset.c
> > > @@ -232,9 +232,20 @@ static void set_device_filter(const char* 
> > > dev_path)
> > >  
> > >  static void unbind_reset_rebind(struct device_fds *dev)  {
> > > +	uint32_t devid = intel_get_drm_devid(dev->fds.dev);
> > >  	igt_debug("close the device\n");
> > >  	close_if_opened(&dev->fds.dev);
> > >  
> > > +	/**
> > > +	 * FIXME: Unbinding the i915 driver on some platforms with Azalia audio
> > > +	 * results in a kernel WARN on "i915 raw-wakerefs=1 wakelocks=1 on cleanup".
> > > +	 * The below CI friendly user level workaround prevents the warning from
> > > +	 * appearing. Drop this hack as soon as this is fixed in the kernel.
> > > +	 */
> > > +	if (igt_warn_on_f((bool) IS_HASWELL(devid) || IS_BROADWELL(devid),
> > > +	    "Manually enabling audio PM to work around a kernel WARN\n"))
> > > +		igt_pm_enable_audio_runtime_pm();
> > > +
> > >  	driver_unbind(dev);
> > >  
> > >  	initiate_device_reset(dev);

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
