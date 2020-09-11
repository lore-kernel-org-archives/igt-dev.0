Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <162f01fdd164618423a4786b6a7d23bac852bfc0.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 11 Sep 2020 15:15:43 +0200
In-Reply-To: <20200911122235.GO7444@platvala-desk.ger.corp.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
 <20200911103039.4574-22-janusz.krzysztofik@linux.intel.com>
 <20200911122235.GO7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 21/24] tests/core_hotunplug: HSW/BDW
 audio issue workaround
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, =?UTF-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

On Fri, 2020-09-11 at 15:22 +0300, Petri Latvala wrote:
> On Fri, Sep 11, 2020 at 12:30:36PM +0200, Janusz Krzysztofik wrote:
> > Unbinding the i915 driver on some Haswell and Broadwell platforms with
> > Azalia audio results in a kernel WARNING on "i915 raw-wakerefs=1
> > wakelocks=1 on cleanup".  The issue can be worked around by manually
> > enabling runtime power management for the conflicting audio adapter.
> > Use that method but also display a warning to preserve visibility of
> > the issue.  Also tag the workaround with a FIXME comment.
> > 
> > v2: Extend the scope of the workaround over Broadwell
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  tests/core_hotunplug.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> > index ac106d964..3e2a76ddb 100644
> > --- a/tests/core_hotunplug.c
> > +++ b/tests/core_hotunplug.c
> > @@ -484,8 +484,23 @@ igt_main
> >  		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
> >  
> >  		if (is_i915_device(fd_drm)) {
> > +			uint32_t devid = intel_get_drm_devid(fd_drm);
> > +
> >  			gem_quiescent_gpu(fd_drm);
> >  			igt_require_gem(fd_drm);
> > +
> > +			/**
> > +			 * FIXME: Unbinding the i915 driver on some Haswell
> > +			 * platforms with Azalia audio results in a kernel WARN
> > +			 * on "i915 raw-wakerefs=1 wakelocks=1 on cleanup".  The
> > +			 * below CI friendly user level workaround prevents the
> > +			 * warning from appearing.  Drop this hack as soon as
> > +			 * this is fixed in the kernel.
> > +			 */
> > +			if (igt_warn_on_f(IS_HASWELL(devid) ||
> > +					  IS_BROADWELL(devid),
> > +			    "Manually enabling audio PM to work around a kernel WARN\n"))
> > +				igt_pm_enable_audio_runtime_pm();
> 
> What happens without this? Is it just a kernel warning, or does the
> operation also fail?

runner: This test was killed due to a kernel taint (0x200).
(https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw4/igt@core_hotunplug@unbind-rebind.html)

That happens before the test completes so no results of the operation
are reported. 

> 
> If the former, what does this gain? 

CI unfriendly incompletes are avoided.

> All it does is we lose the
> capability to track whether the kernel still has that issue, we still
> have to filter this warning in cibuglog.

I know, but for now I can see no good alternative - we can either keep
the test still bocklisted or suppress the warning so CI coverage is not
affected.  i915_module_unload just unloads snd-hda-intel module
silently which prevents this issue from popping up.  If you think that
approach would be better, or we should recognize that issue as an
expected behaviour, I can drop the IGT warning.

Thanks,
Janusz

> 
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
