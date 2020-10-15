Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <b8fa0496f0b6c62e65fc67729e39a3f6879ac9c9.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 15 Oct 2020 14:25:21 +0200
In-Reply-To: <19482560cb22b16f296d193284a8c700436b8362.camel@linux.intel.com>
References: <20201013110234.17680-1-janusz.krzysztofik@linux.intel.com>
 <19482560cb22b16f296d193284a8c700436b8362.camel@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/core_hotunplug: Restore i915
 debugfs health check
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
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 2020-10-15 at 09:15 +0200, Marcin Bernatowicz wrote:
> On Tue, 2020-10-13 at 13:02 +0200, Janusz Krzysztofik wrote:
> > Removal of igt_fork_hang_detector() from local_i915_healthcheck() by
> > commit 1fbd127bd4e1 ("core_hotplug: Teach the healthcheck how to
> > check
> > execution status") resulted in unintentional removal of an important
> > though implicit test feature of detecting, reporting as failures and
> > recovering from potential misses of debugfs subdirs of hot rebound
> > i915
> > devices.  As a consequence, unexpected failures or skips of other
> > unrelated but subsequently run tests have been observed on CI.
> > 
> > On the other hand, removal of the debugfs issue detection and subtest
> > failures from right after hot rebinding the driver enabled the better
> > version of the i915 GPU health check fixed by the same commit to
> > detect
> > and report other issues potentially triggered by device late close.
> > 
> > Restore the missing test feature by introducing an explicit sysfs
> > health check, not limited to i915,  that verifies existence of device
> > sysfs and debugfs areas.  Also, split hotrebind/hotreplug scenarios
> > into a pair of each, one that performs the health check right after
> > hot
> > rebind/replug and delegates the device late close step to a follow up
> > recovery phase, while the other one checks device health only after
> > late closing it.
> > 
> > v2: Give GPU health check a better chance to detect issues - run it
> >     before sysfs health checks.
> > v3: Run sysfs health check on any hardware, not only i915.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> > Even if the root cause has occurred to be sitting on the IGT lib side
> > and has been already fixed by commit 937526629344 ("lib: Don't fail
> > debugfs lookup on an expected absent drm device"), I think we should
> > restore the debugfs health check just in case new issues with similar
> > symptoms appear in the future and start affecting subsequent tests
> > silently.
> > 
> > Thanks,
> > Janusz
> > 
> >  tests/core_hotunplug.c | 68 ++++++++++++++++++++++++++++++++++++++
> > ----
> >  1 file changed, 62 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> > index 70669c590..cdc07c85d 100644
> > --- a/tests/core_hotunplug.c
> > +++ b/tests/core_hotunplug.c
> > @@ -308,7 +308,7 @@ static void node_healthcheck(struct hotunplug
> > *priv, unsigned flags)
> >  		priv->failure = "Unrecoverable test failure";
> >  		if (local_i915_healthcheck(fd_drm, "") &&
> >  		    (!(flags & FLAG_RECOVER) ||
> > local_i915_recover(fd_drm)))
> > -			priv->failure = "Healthcheck failure!";
> > +			priv->failure = "GPU healthcheck failure!";
> >  		else
> >  			priv->failure = NULL;
> >  
> > @@ -317,6 +317,16 @@ static void node_healthcheck(struct hotunplug
> > *priv, unsigned flags)
> >  		priv->failure = NULL;
> >  	}
> >  
> > +	if (!priv->failure) {
> > +		char path[200];
> > +
> > +		priv->failure = "Device sysfs healthckeck failure!";
> > +		local_debug("%s\n", "running device sysfs
> > healthcheck");
> > +		igt_assert(igt_sysfs_path(fd_drm, path, sizeof(path)));
> > +		igt_assert(igt_debugfs_path(fd_drm, path,
> > sizeof(path)));
> > +		priv->failure = NULL;
> > +	}
> > +
> 
> LGTM,
> Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Thank you Marcin, pushed.

Janusz

> 
> >  	fd_drm = close_device(fd_drm, "", "health checked ");
> >  	if (closed || fd_drm < -1)	/* update status for
> > post_healthcheck */
> >  		priv->fd.drm_hc = fd_drm;
> > @@ -437,7 +447,7 @@ static void hotunplug_rescan(struct hotunplug
> > *priv)
> >  	healthcheck(priv, false);
> >  }
> >  
> > -static void hotrebind_lateclose(struct hotunplug *priv)
> > +static void hotrebind(struct hotunplug *priv)
> >  {
> >  	igt_assert_eq(priv->fd.drm, -1);
> >  	igt_assert_eq(priv->fd.drm_hc, -1);
> > @@ -448,6 +458,30 @@ static void hotrebind_lateclose(struct hotunplug
> > *priv)
> >  	driver_bind(priv, 0);
> >  
> >  	healthcheck(priv, false);
> > +}
> > +
> > +static void hotreplug(struct hotunplug *priv)
> > +{
> > +	igt_assert_eq(priv->fd.drm, -1);
> > +	igt_assert_eq(priv->fd.drm_hc, -1);
> > +	priv->fd.drm = local_drm_open_driver(false, "", " for hot
> > replug");
> > +
> > +	device_unplug(priv, "hot ", 60);
> > +
> > +	bus_rescan(priv, 0);
> > +
> > +	healthcheck(priv, false);
> > +}
> > +
> > +static void hotrebind_lateclose(struct hotunplug *priv)
> > +{
> > +	igt_assert_eq(priv->fd.drm, -1);
> > +	igt_assert_eq(priv->fd.drm_hc, -1);
> > +	priv->fd.drm = local_drm_open_driver(false, "", " for hot
> > rebind");
> > +
> > +	driver_unbind(priv, "hot ", 60);
> > +
> > +	driver_bind(priv, 0);
> >  
> >  	priv->fd.drm = close_device(priv->fd.drm, "late ", "unbound ");
> >  	igt_assert_eq(priv->fd.drm, -1);
> > @@ -465,8 +499,6 @@ static void hotreplug_lateclose(struct hotunplug
> > *priv)
> >  
> >  	bus_rescan(priv, 0);
> >  
> > -	healthcheck(priv, false);
> > -
> >  	priv->fd.drm = close_device(priv->fd.drm, "late ", "removed ");
> >  	igt_assert_eq(priv->fd.drm, -1);
> >  
> > @@ -570,7 +602,31 @@ igt_main
> >  		post_healthcheck(&priv);
> >  
> >  	igt_subtest_group {
> > -		igt_describe("Check if the driver hot unbound from a
> > still open device can be cleanly rebound, then the old instance
> > released");
> > +		igt_describe("Check if the driver can be cleanly
> > rebound to a device with a still open hot unbound driver instance");
> > +		igt_subtest("hotrebind")
> > +			hotrebind(&priv);
> > +
> > +		igt_fixture
> > +			recover(&priv);
> > +	}
> > +
> > +	igt_fixture
> > +		post_healthcheck(&priv);
> > +
> > +	igt_subtest_group {
> > +		igt_describe("Check if a hot unplugged and still open
> > device can be cleanly restored");
> > +		igt_subtest("hotreplug")
> > +			hotreplug(&priv);
> > +
> > +		igt_fixture
> > +			recover(&priv);
> > +	}
> > +
> > +	igt_fixture
> > +		post_healthcheck(&priv);
> > +
> > +	igt_subtest_group {
> > +		igt_describe("Check if a hot unbound driver instance
> > still open after hot rebind can be cleanly released");
> >  		igt_subtest("hotrebind-lateclose")
> >  			hotrebind_lateclose(&priv);
> >  
> > @@ -582,7 +638,7 @@ igt_main
> >  		post_healthcheck(&priv);
> >  
> >  	igt_subtest_group {
> > -		igt_describe("Check if a still open while hot unplugged
> > device can be cleanly restored, then the old instance released");
> > +		igt_describe("Check if an instance of a still open
> > while hot replugged device can be cleanly released");
> >  		igt_subtest("hotreplug-lateclose")
> >  			hotreplug_lateclose(&priv);
> >  

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
