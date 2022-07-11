Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4822A8F6F0
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jul 2022 16:02:26 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Srivatsa, Anusha"
 <anusha.srivatsa@intel.com>
Date: Mon, 11 Jul 2022 16:01:49 +0000
Message-ID: <ec4a07adcfeb4b399940eacad803039c@intel.com>
References: <20220708181744.398984-1-anusha.srivatsa@intel.com>
 <19d53e1a0dee4cb28ddbc68ec7859d65@intel.com>
 <7bcf69369cce79fcf56dbfb6009579529859487b.camel@intel.com>
 <YswwLe67ReJKGUSy@intel.com>
In-Reply-To: <YswwLe67ReJKGUSy@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/i915/i915_pm_dc: Remove PC8+ dependency
 from DC9
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



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Monday, July 11, 2022 7:44 PM
> To: igt-dev@lists.freedesktop.org; Srivatsa, Anusha
> <anusha.srivatsa@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>
> Subject: Re: [igt-dev] [i-g-t] tests/i915/i915_pm_dc: Remove PC8+ depende=
ncy
> from DC9
>=20
> On Mon, Jul 11, 2022 at 02:00:42PM +0000, Vivi, Rodrigo wrote:
> > On Mon, 2022-07-11 at 04:11 +0000, Gupta, Anshuman wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Srivatsa, Anusha <anusha.srivatsa@intel.com>
> > > > Sent: Friday, July 8, 2022 11:48 PM
> > > > To: igt-dev@lists.freedesktop.org
> > > > Cc: Srivatsa, Anusha <anusha.srivatsa@intel.com>; Deak, Imre
> > > > <imre.deak@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> > > > Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > Subject: [i-g-t] tests/i915/i915_pm_dc: Remove PC8+ dependency
> > > > from
> > > > DC9
> > > >
> > > > Different from DC6, DC9 does not depend on BIOS/PCU to execute
> > > > save and restore or any other sequence when going to PC9/PC10
> > > Commit message should explain this is a change for all DGFX platform.
> >
> > yeap. the commit message needs to change as well.
>=20
> I meant to say commit subject...
>=20
> >
> > and I'd say preferably we would have that IS_DGFX patch in place and
> > use that instead of individual platforms.
> >
> > That patch got nacked because has_lmem is preferred, but in this case
> > the lmem check makes not much sense and the clean way is the IS_DGFX.
> > So maybe we have a good reason after all..
Agree we will need a IS_DGFX() check, probably we can relay on below debugf=
s for that
# cat /sys/kernel/debug/dri/1/i915_gpu_info |  grep  "is_dgfx: yes"
is_dgfx: yes

Thanks,
Anshuman Gupta.
> >
> >
> > > Thanks,
> > > Anshuman Gupta.
> > > >
> > > > DC9 actually depends on D3 and PCODE simply remove power if SW
> > > > allowed
> > > >
> > > > v2: resrict the check for igfx only.
> > > >
> > > > Cc: Imre Deak <imre.deak@intel.com>
> > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>(v2)
> > > > ---
> > > > =A0tests/i915/i915_pm_dc.c | 5 +++--
> > > > =A01 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> > > > index a780f2cb..5132734b 100644
> > > > --- a/tests/i915/i915_pm_dc.c
> > > > +++ b/tests/i915/i915_pm_dc.c
> > > > @@ -532,8 +532,9 @@ int main(int argc, char *argv[])
> > > >
> > > > =A0igt_describe("This test validates display engine entry to DC9
> > > > state");
> > > > =A0igt_subtest("dc9-dpms") {
> > > > -
> > > > igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> > > > -"PC8+ residencies not supported\n");
> > > > +if (!(IS_DG1(data.devid) || IS_DG2(data.devid)))
> > > > +
> > > > igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> > > > +=A0=A0=A0=A0=A0 "PC8+ residencies not supported\n");
> > > > =A0test_dc9_dpms(&data);
> > > > =A0}
> > > >
> > > > --
> > > > 2.25.1
> > >
> >
