Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2E6ABA3B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 16:39:34 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:39:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <Yvp2ueIpesR83wOv@intel.com>
References: <20220810094027.541357-1-riana.tauro@intel.com>
 <20220810094027.541357-2-riana.tauro@intel.com>
 <CY5PR11MB62111399D88E1DED67C4D3A395659@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB62111399D88E1DED67C4D3A395659@CY5PR11MB6211.namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_aux : Skip SUSPEND_STATE_S3
 if mem_sleep deep state is not supported
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

On Wed, Aug 10, 2022 at 07:51:07AM -0400, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > Sent: Wednesday, August 10, 2022 3:10 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: [PATCH i-g-t 1/1] lib/igt_aux : Skip SUSPEND_STATE_S3 if mem_sleep
> > deep state is not supported
> > 
> > Forcing s3 by setting mem_sleep to deep fails if s3 is not supported by platform
> > 
> > Skip the test by checking if s3 is not one of the supported mem_sleep states
> > 
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6531
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  lib/igt_aux.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/lib/igt_aux.c b/lib/igt_aux.c index d80a1935..edb53425 100644
> > --- a/lib/igt_aux.c
> > +++ b/lib/igt_aux.c
> > @@ -882,6 +882,23 @@ static void set_mem_sleep(int power_dir, enum
> > igt_mem_sleep sleep)
> >  				 mem_sleep_name[sleep]));
> >  }
> > 
> > +static bool is_mem_sleep_state_supported(int power_dir, enum
> > +igt_mem_sleep state) {
> > +	const char *str;
> > +	char *mem_sleep_states;
> > +
> > +	igt_assert((mem_sleep_states = igt_sysfs_get(power_dir,
> > +"mem_sleep")));
> > +
> > +	str = strstr(mem_sleep_states, mem_sleep_name[state]);
> > +
> > +	if (!str)
> > +		igt_info("mem_sleep state %s not supported.\nSupported
> > mem_sleep states: %s\n",
> > +			 mem_sleep_name[state], mem_sleep_states);
> Nitpicking 
> With this It may print with []: 
> mem_sleep state deep not supported
> Supported mem_sleep states: [s2idle] shallow
> But as this could be an extra piece of information of current mem_sleep state as well.
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

pushed. thanks for fixing this.

> 
> > +
> > +	free(mem_sleep_states);
> > +	return str;
> > +}
> > +
> >  /**
> >   * igt_system_suspend_autoresume:
> >   * @state: an #igt_suspend_state, the target suspend state @@ -923,6 +940,8
> > @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
> > 
> >  	if (state == SUSPEND_STATE_S3) {
> >  		orig_mem_sleep = get_mem_sleep();
> > +		igt_skip_on_f(!is_mem_sleep_state_supported(power_dir,
> > MEM_SLEEP_DEEP),
> > +			      "S3 not supported in this system.\n");
> >  		set_mem_sleep(power_dir, MEM_SLEEP_DEEP);
> >  		igt_skip_on_f(get_mem_sleep() != MEM_SLEEP_DEEP,
> >  			      "S3 not possible in this system.\n");
> > --
> > 2.25.1
> 
