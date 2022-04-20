Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C2510F1F6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 19:30:45 +0000 (UTC)
Date: Wed, 20 Apr 2022 15:30:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Message-ID: <YmBfYFrFLdTSMBtl@intel.com>
References: <20220420184628.412506-1-rodrigo.vivi@intel.com>
 <671434dd9c4241e481bcf4abb0f2666c@intel.com>
 <3dd9fb53d204f1e7865b74bb675078fb462ed958.camel@intel.com>
 <ddc1a8ca3b7149c68455ca9cd5068545@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddc1a8ca3b7149c68455ca9cd5068545@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc.c: Remove PC8+
 dependency from DC9.
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

On Wed, Apr 20, 2022 at 03:27:19PM -0400, Srivatsa, Anusha wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Wednesday, April 20, 2022 12:09 PM
> > To: igt-dev@lists.freedesktop.org; Srivatsa, Anusha
> > <anusha.srivatsa@intel.com>
> > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Deak, Imre
> > <imre.deak@intel.com>
> > Subject: Re: [PATCH i-g-t] tests/i915/i915_pm_dc.c: Remove PC8+
> > dependency from DC9.
> > 
> > On Wed, 2022-04-20 at 12:07 -0700, Srivatsa, Anusha wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > Sent: Wednesday, April 20, 2022 11:46 AM
> > > > To: igt-dev@lists.freedesktop.org
> > > > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Deak, Imre
> > > > <imre.deak@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>;
> > > > Srivatsa, Anusha <anusha.srivatsa@intel.com>
> > > > Subject: [PATCH i-g-t] tests/i915/i915_pm_dc.c: Remove PC8+
> > > > dependency from DC9.
> > > >
> > > > Different from DC6, DC9 does not depend on the BIOS/PCU to execute
> > > > save and restore or any other sequence when going to PC9/PC10.
> > > >
> > > > DC9 actually depends on D3 and PCODE simply remove power if SW
> > > > allowed.
> > >
> > > Is this the case for both igfx and dgfx?
> > 
> > yes
> > 
> When the check was introduced- for ICL, wasn’t this the requirement though? How come we have not had issues on ICL+ platforms till now if the check was wrong. 

The foils I'm checking is for gen9+. I have fwded it to you couple weeks ago.

DC9 never had any dependency on Package-C states, but only on D3.
Even on BXT.

I believe this addition here was accidental when adding the checks for DC6.

> 
> Anusha
> > >
> > > Anusha
> > >
> > > > Cc: Imre Deak <imre.deak@intel.com>
> > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >  tests/i915/i915_pm_dc.c | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > >
> > > > diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index
> > > > 2c2c5086..9a22246c 100644
> > > > --- a/tests/i915/i915_pm_dc.c
> > > > +++ b/tests/i915/i915_pm_dc.c
> > > > @@ -531,8 +531,6 @@ int main(int argc, char *argv[])
> > > >
> > > >         igt_describe("This test validates display engine entry to
> > > > DC9 state");
> > > >         igt_subtest("dc9-dpms") {
> > > > -
> > > >         igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_
> > > > fd),
> > > > -                               "PC8+ residencies not supported\n");
> > > >                 test_dc9_dpms(&data);
> > > >         }
> > > >
> > > > --
> > > > 2.34.1
> > >
> 
