Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8204B10E3AE
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 13:39:41 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
Date: Mon, 5 Sep 2022 13:39:37 +0000
Message-ID: <CY5PR11MB6211B55CB83981C95A10504A957F9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220823153829.21939-1-swati2.sharma@intel.com>
 <YwYp4mtlcK1J6H9X@ideak-desk.fi.intel.com>
 <d4d85c76-2ae5-ce57-bd4d-934e5d027985@intel.com>
 <CY5PR11MB621159BEF6B3F7A0F1803E9C957F9@CY5PR11MB6211.namprd11.prod.outlook.com>
 <YxXx+lsBJqt7BEsV@ideak-desk.fi.intel.com>
In-Reply-To: <YxXx+lsBJqt7BEsV@ideak-desk.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Add new dc9 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Deak, Imre <imre.deak@intel.com>
> Sent: Monday, September 5, 2022 6:26 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Add new dc9 t=
est
>=20
> On Mon, Sep 05, 2022 at 08:58:35AM +0300, Gupta, Anshuman wrote:
> >
> >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > Sharma,
> > > Swati2
> > > Sent: Monday, September 5, 2022 12:20 AM
> > > To: Deak, Imre <imre.deak@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org
> > > Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Add new
> > > dc9 test
> > >
> > > Hi Imre,
> > >
> > > Thanks for the review.
> > > Have answered your review comments in
> > > https://patchwork.freedesktop.org/series/108079/#rev2
> > > Please review rev#2
> > Here we are testing runtime suspend time for DC9.
> > I have few question regarding the test mythology.
> > 1. Is there any power differences,   When all display pipes are off (i.=
e all
> connectors are dpms off)  vs DC9  ?
> > We are already having a lot runtime pm test in i915_pm_rpm ?
> > why do we need a test which just check the runtime suspend ?
> > We are already checking d3hot and d3cold in i915_pm_rpm ?
>=20
> Being runtime suspended is a dependency for DC9 on all platforms, hence i=
t
> makes sense to check for this too. Since DC9 doesn't cause display regist=
ers to
> reset on DG2, being runtime suspended is the only thing we can check ther=
e.
IMO then this should be applicable for DG1/DG2, on DG2 due to various reaso=
ns the DGFX SOC Pkg power states limited to a shallow Pkg state which
even can be achieved with display on idle use case.=20

Future DGFX platforms will enable the deepest Pkg state which may need to r=
evisit this test.

Thanks,
Anshuman Gupta.
 =20
>=20
> > Thanks,
> > Anshuman Gupta.
> > >
> > > On 24-Aug-22 7:08 PM, Imre Deak wrote:
> > > > On Tue, Aug 23, 2022 at 09:08:29PM +0530, Swati Sharma wrote:
> > > >> Added new test to validate dc9 on both igfx and dgfx.
> > > >> runtime_suspended_time value increases when system enters DC9.
> > > >> Existing test will be restricted to igfx only.
> > > >> Also, changed debugfs entry to check if platform is dgfx or igfx.
> > > >>
> > > >> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > > >> ---
> > > >>   lib/igt_pm.c            | 25 ++++++++++++++++++++++---
> > > >>   lib/igt_pm.h            |  1 +
> > > >>   tests/i915/i915_pm_dc.c | 39 ++++++++++++++++++++++++++++++++++-
> ----
> > > >>   3 files changed, 57 insertions(+), 8 deletions(-)
> > > >>
> > > >> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index
> > > >> 6ebbad330..6c99eaff9
> > > >> 100644
> > > >> --- a/lib/igt_pm.c
> > > >> +++ b/lib/igt_pm.c
> > > >> @@ -947,19 +947,23 @@ static int igt_pm_get_power_attr_fd(struct
> > > pci_device *pci_dev, const char *attr
> > > >>    snprintf(name, PATH_MAX,
> > > "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/power/%s",
> > > >>             pci_dev->domain, pci_dev->bus, pci_dev->dev,
> > > >> pci_dev->func, attr);
> > > >>
> > > >> -  fd =3D open(name, O_RDWR);
> > > >> +  if (!strcmp(attr,"runtime_suspended_time"))
> > > >> +          fd =3D open(name, O_RDONLY);  else
> > > >> +          fd =3D open(name, O_RDWR);
> > > >> +
> > > >
> > > > There is a few other places opening an attribute with RDONLY, so
> > > > maybe add an igt_pm_get_power_attr_fd_rdonly() helper for that?
> > > >
> > > >>    igt_assert_f(fd >=3D 0, "Can't open %s\n", attr);
> > > >>
> > > >>    return fd;
> > > >>   }
> > > >>
> > > >> -static bool igt_pm_read_power_attr(int fd, char *attr, int len,
> > > >> bool
> > > >> autosuspend_delay)
> > > >> +static bool igt_pm_read_power_attr(int fd, char *attr, int len,
> > > >> +bool
> > > >> +power_attr)
> > > >>   {
> > > >>    int size;
> > > >>
> > > >>    size =3D read(fd, attr, len - 1);
> > > >>
> > > >> -  if (autosuspend_delay) {
> > > >> +  if (power_attr) {
> > > >
> > > > How did this fail for runtime_suspended_time? It doesn't return
> > > > -EIO as opposed to autosuspend_delay, so maybe fd was invalid?
> > > >
> > > >>            if (size < 0 && errno =3D=3D EIO)
> > > >>                    return false;
> > > >>    } else {
> > > >> @@ -1202,3 +1206,18 @@ void
> > > >> igt_pm_print_pci_card_runtime_status(void)
> > > >>
> > >
> > > igt_pm_print_pci_dev_runtime_status(__pci_dev_pwrattr[i].pci_dev);
> > > >>    }
> > > >>   }
> > > >> +
> > > >> +int igt_pm_get_runtime_suspended_time(struct pci_device
> > > >> +*pci_dev) {
> > > >> +  char time_str[64];
> > > >> +  int time, time_fd;
> > > >> +
> > > >> +  time_fd =3D igt_pm_get_power_attr_fd(pci_dev,
> > > "runtime_suspended_time");
> > > >> +  if (igt_pm_read_power_attr(time_fd, time_str, 64, true))
> > > >> +          igt_assert(sscanf(time_str, "%d", &time) > 0);
> > > >
> > > > If reading the attribute failed for any reason then we'd return
> > > > random data from this function. Being able to open the attribute
> > > > and reading it is a requirement for the given test.
> > > >
> > > >> +
> > > >> +  igt_info("runtime suspend time for PCI '%04x:%02x:%02x.%01x' =
=3D
> > > %d\n",
> > > >> +            pci_dev->domain, pci_dev->bus, pci_dev->dev,
> > > >> +pci_dev->func, time);
> > > >> +
> > > >> +  return time;
> > > >> +}
> > > >> diff --git a/lib/igt_pm.h b/lib/igt_pm.h index
> > > >> f28b6ebfd..ca1db7440
> > > >> 100644
> > > >> --- a/lib/igt_pm.h
> > > >> +++ b/lib/igt_pm.h
> > > >> @@ -79,5 +79,6 @@ void igt_pm_enable_pci_card_runtime_pm(struct
> > > pci_device *root,
> > > >>   void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev=
);
> > > >>   void igt_pm_restore_pci_card_runtime_pm(void);
> > > >>   void igt_pm_print_pci_card_runtime_status(void);
> > > >> +int igt_pm_get_runtime_suspended_time(struct pci_device
> > > >> +*pci_dev);
> > > >>
> > > >>   #endif /* IGT_PM_H */
> > > >> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> > > >> index f664a2a2c..69afa3e6f 100644
> > > >> --- a/tests/i915/i915_pm_dc.c
> > > >> +++ b/tests/i915/i915_pm_dc.c
> > > >> @@ -31,8 +31,11 @@
> > > >>   #include "igt_kmod.h"
> > > >>   #include "igt_psr.h"
> > > >>   #include "igt_sysfs.h"
> > > >> +#include "igt_device.h"
> > > >> +#include "igt_device_scan.h"
> > > >>   #include "limits.h"
> > > >>   #include "time.h"
> > > >> +#include "igt_pm.h"
> > > >>
> > > >>   /* DC State Flags */
> > > >>   #define CHECK_DC5        (1 << 0)
> > > >> @@ -426,7 +429,7 @@ static bool check_is_dgfx(data_t *data)
> > > >>   {
> > > >>    char buf[4096];
> > > >>
> > > >> -  igt_debugfs_simple_read(data->debugfs_fd, "i915_gpu_info",
> > > >> +  igt_debugfs_simple_read(data->debugfs_fd, "i915_capabilities",
> > > >>                            buf, sizeof(buf));
> > > >
> > > > Should this be a separate patch explaining the rational of the chan=
ge?
> > > >
> > > >>    return strstr(buf, "is_dgfx: yes");
> > > >>   }
> > > >> @@ -453,6 +456,23 @@ static void setup_dc9_dpms(data_t *data, int
> > > dc_target)
> > > >>    dpms_on(data);
> > > >>   }
> > > >>
> > > >> +static void check_dc9_runtime_suspend_time(data_t *data) {
> > > >> +  struct pci_device *i915;
> > > >> +  int before, after;
> > > >> +
> > > >> +  i915 =3D igt_device_get_pci_device(data->drm_fd);
> > > >> +
> > > >> +  before =3D igt_pm_get_runtime_suspended_time(i915);
> > > >> +  dpms_on(data);
> > > >> +  cleanup_dc_dpms(data);
> > > >> +  dpms_off(data);
> > > >> +  sleep(1);
> > > >> +  after =3D igt_pm_get_runtime_suspended_time(i915);
> > > >> +  igt_assert_lt(before, after);
> > > >> +  dpms_on(data);
> > > >> +}
> > > >
> > > > I think it's better to run test_dc9_dpms() on dGFX as well, only
> > > > change
> > > > dc9_wait_entry() which polls for both runtime_suspend_time to
> > > > increase (on both iGFX and dGFX) and for the DC5/6 counter to
> > > > reset (on iGFX only).
> > > >
> > > >> +
> > > >>   static void test_dc9_dpms(data_t *data)
> > > >>   {
> > > >>    int dc_target;
> > > >> @@ -539,11 +559,20 @@ int main(int argc, char *argv[])
> > > >>            test_dc_state_dpms(&data, CHECK_DC6);
> > > >>    }
> > > >>
> > > >> -  igt_describe("This test validates display engine entry to DC9
> > > >> state");
> > > >> +  igt_describe("This test validates display engine entry to DC9 s=
tate"
> > > >> +               "for both igfx and dgfx");
> > > >>    igt_subtest("dc9-dpms") {
> > > >> -          if (!(check_is_dgfx(&data)))
> > > >> -
> > >
> > > igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> > > >> -                                "PC8+ residencies not supported\n=
");
> > > >> +          check_dc9_runtime_suspend_time(&data);
> > > >> +  }
> > > >> +
> > > >> +  igt_fixture
> > > >> +          igt_require(!(check_is_dgfx(&data)));
> > > >> +
> > > >> +  igt_describe("This test validates display engine entry to DC9 s=
tate"
> > > >> +               "only for igfx");
> > > >> +  igt_subtest("dc9-dpms-igfx") {
> > > >> +
> > >
> > > igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> > > >> +                        "PC8+ residencies not supported\n");
> > > >>            test_dc9_dpms(&data);
> > > >>    }
> > > >>
> > > >> --
> > > >> 2.25.1
> > > >>
> > >
> > > --
> > > ~Swati Sharma
