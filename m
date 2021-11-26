Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 26 Nov 2021 10:24:27 +0100
Message-ID: <1886908.yKVeVyVuyW@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <f2dfa757-5483-903e-d30b-ef60f156f14d@linux.intel.com>
References: <20211118084140.120777-1-janusz.krzysztofik@linux.intel.com>
 <f2dfa757-5483-903e-d30b-ef60f156f14d@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/core_hotunplug: Show
 device PCI bus address on errors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Bernatowicz,
 Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, 26 November 2021 09:00:06 CET Bernatowicz, Marcin wrote:
> 
> On 11/18/2021 9:41 AM, Janusz Krzysztofik wrote:
> > Strange -ENODEV responses from the kernel to i915 driver rebind attempts
> > have been sporadically observed.  After successfully unbinding the driver
> > from a device by writing a string representing its PCI bus address to
> > /sys/bus/pci/driver/i915/unbind, the test then fails while writing the
> > same device PCI bus address string to /sys/bus/pci/drivers/i915/bind.  It
> > is unlikely that the device disappears from the bus when this happens --
> > the test would attempt to rescan the bus in such cases while it doesn't.
> > 
> > To shed more light on what may be going on, extend error messages emitted
> > by the test with the device PCI bus address string it uses also printed.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >   tests/core_hotunplug.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> > index b36616688..2f2fb7ac1 100644
> > --- a/tests/core_hotunplug.c
> > +++ b/tests/core_hotunplug.c
> > @@ -174,11 +174,11 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
> >   	igt_set_timeout(timeout, "Driver unbind timeout!");
> >   	igt_assert_f(igt_sysfs_set(priv->fd.sysfs_drv, "unbind",
> >   				   priv->dev_bus_addr),
> > -		     "Driver unbind failure!\n");
> > +		     "Driver unbind failure (%s)!\n", priv->dev_bus_addr);
> >   	igt_reset_timeout();
> >   
> >   	igt_assert_f(faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0),
> > -		     "Unbound device still present\n");
> > +		     "Unbound device still present (%s)\n", priv->dev_bus_addr);
> >   }
> >   
> >   /* Re-bind the driver to the device */
> > @@ -190,12 +190,12 @@ static void driver_bind(struct hotunplug *priv, int timeout)
> >   	igt_set_timeout(timeout, "Driver re-bind timeout!");
> >   	igt_assert_f(igt_sysfs_set(priv->fd.sysfs_drv, "bind",
> >   				   priv->dev_bus_addr),
> > -		     "Driver re-bind failure\n!");
> > +		     "Driver re-bind failure (%s)!\n", priv->dev_bus_addr);
> >   	igt_reset_timeout();
> >   
> >   	igt_fail_on_f(faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr,
> >   				F_OK, 0),
> > -		      "Rebound device not present!\n");
> > +		      "Rebound device not present (%s)!\n", priv->dev_bus_addr);
> >   
> >   	if (priv->snd_unload)
> >   		igt_kmod_load("snd_hda_intel", NULL);
> > @@ -223,7 +223,7 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
> >   	igt_assert_eq(priv->fd.sysfs_dev, -1);
> >   
> >   	igt_assert_f(faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr, F_OK, 0),
> > -		     "Unplugged device still present\n");
> > +		     "Unplugged device still present (%s)\n", priv->dev_bus_addr);
> >   }
> >   
> >   /* Re-discover the device by rescanning its bus */
> > @@ -239,7 +239,7 @@ static void bus_rescan(struct hotunplug *priv, int timeout)
> >   
> >   	igt_fail_on_f(faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr,
> >   				F_OK, 0),
> > -		      "Fakely unplugged device not rediscovered!\n");
> > +		      "Fakely unplugged device not rediscovered (%s)!\n", priv->dev_bus_addr);
> >   }
> >   
> >   static void cleanup(struct hotunplug *priv)
> > 
> LGTM,
> Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Thanks Marcin, pushed.

Janusz


