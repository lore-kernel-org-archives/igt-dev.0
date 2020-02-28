Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BA16F4B2
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2020 18:48:03 +0000 (UTC)
Date: Fri, 28 Feb 2020 20:47:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200228184757.GI13686@intel.com>
References: <20200228182229.1860-1-ville.syrjala@linux.intel.com>
 <16fda11b6ae81113adf15f16cc96bc1811e8321f.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16fda11b6ae81113adf15f16cc96bc1811e8321f.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915_pm_dc: Move PSR checks
 back to individual subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 28, 2020 at 06:32:17PM +0000, Souza, Jose wrote:
> Anshuman already send a fix for this one:
> https://patchwork.freedesktop.org/series/73509/

Ah, cool. I'll presume someone will pushed it eventually.

> =

> ping Anushaman on the change in the second patch.
> =

> On Fri, 2020-02-28 at 20:22 +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The dpms tests don't need PSR. So move the PSR check back into
> > the subtests that need it.
> > =

> > Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> > Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > Fixes: 6cbe6af372a0 ("tests/i915_pm_dc: Use psr_sink_support instead
> > of reimplement it again")
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  tests/i915/i915_pm_dc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > =

> > diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> > index afcc10bc7e20..6975f165be7f 100644
> > --- a/tests/i915/i915_pm_dc.c
> > +++ b/tests/i915/i915_pm_dc.c
> > @@ -393,7 +393,6 @@ int main(int argc, char *argv[])
> >  		igt_require(igt_setup_runtime_pm(data.drm_fd));
> >  		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
> >  		igt_display_require(&data.display, data.drm_fd);
> > -		igt_require(psr_sink_support(data.debugfs_fd,
> > PSR_MODE_1));
> >  		/* Make sure our Kernel supports MSR and the module is
> > loaded */
> >  		igt_require(igt_kmod_load("msr", NULL) =3D=3D 0);
> >  =

> > @@ -405,6 +404,7 @@ int main(int argc, char *argv[])
> >  	igt_describe("In this test we make sure that system enters
> > DC3CO "
> >  		     "when PSR2 is active and system is in SLEEP
> > state");
> >  	igt_subtest("dc3co-vpb-simulation") {
> > +		igt_require(psr_sink_support(data.debugfs_fd,
> > PSR_MODE_1));
> >  		test_dc3co_vpb_simulation(&data);
> >  	}
> >  =

> > @@ -412,6 +412,7 @@ int main(int argc, char *argv[])
> >  		     "while PSR is active");
> >  	igt_subtest("dc5-psr") {
> >  		data.op_psr_mode =3D PSR_MODE_1;
> > +		igt_require(psr_sink_support(data.debugfs_fd,
> > PSR_MODE_1));
> >  		psr_enable(data.debugfs_fd, data.op_psr_mode);
> >  		test_dc_state_psr(&data, CHECK_DC5);
> >  	}
> > @@ -420,6 +421,7 @@ int main(int argc, char *argv[])
> >  		     "while PSR is active");
> >  	igt_subtest("dc6-psr") {
> >  		data.op_psr_mode =3D PSR_MODE_1;
> > +		igt_require(psr_sink_support(data.debugfs_fd,
> > PSR_MODE_1));
> >  		psr_enable(data.debugfs_fd, data.op_psr_mode);
> >  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.
> > msr_fd),
> >  			      "PC8+ residencies not supported\n");

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
