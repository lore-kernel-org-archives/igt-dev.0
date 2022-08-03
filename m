Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388A71133D5
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 16:02:44 +0000 (UTC)
Date: Wed, 3 Aug 2022 12:02:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <YuqcG1EgKu6JG8L3@intel.com>
References: <20220801180145.243227-3-rodrigo.vivi@intel.com>
 <20220801181053.249195-1-rodrigo.vivi@intel.com>
 <CY5PR11MB6211DE00EB74B1E0466255A9959C9@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6211DE00EB74B1E0466255A9959C9@CY5PR11MB6211.namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_aux: Check suspend state
 support directly.
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

On Wed, Aug 03, 2022 at 09:59:01AM +0000, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Monday, August 1, 2022 11:41 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>
> > Subject: [PATCH i-g-t] lib/igt_aux: Check suspend state support directly.
> > 
> > Let's simplify the suspend state check directly by using its name instead of using
> > a mask style. This will allow us to introduce a new state cleanly.
> > 
> > v2: remove accidental fprintf
> > 
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>[Gupta, Anshuman] .
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

pushed, thanks for the reviews.

> > ---
> >  lib/igt_aux.c | 28 ++++++++++------------------
> >  1 file changed, 10 insertions(+), 18 deletions(-)
> > 
> > diff --git a/lib/igt_aux.c b/lib/igt_aux.c index 6cdda077..805550d1 100644
> > --- a/lib/igt_aux.c
> > +++ b/lib/igt_aux.c
> > @@ -815,29 +815,21 @@ static void suspend_via_sysfs(int power_dir, enum
> > igt_suspend_state state)
> >  				 suspend_state_name[state]));
> >  }
> > 
> > -static uint32_t get_supported_suspend_states(int power_dir)
> > +static bool is_state_supported(int power_dir, enum igt_suspend_state
> > +state)
> >  {
> > +	const char *str;
> >  	char *states;
> > -	char *state_name;
> > -	uint32_t state_mask;
> > 
> >  	igt_assert((states = igt_sysfs_get(power_dir, "state")));
> > -	state_mask = 0;
> > -	for (state_name = strtok(states, " "); state_name;
> > -	     state_name = strtok(NULL, " ")) {
> > -		enum igt_suspend_state state;
> > -
> > -		for (state = SUSPEND_STATE_FREEZE; state <
> > SUSPEND_STATE_NUM;
> > -		     state++)
> > -			if (strcmp(state_name, suspend_state_name[state]) ==
> > 0)
> > -				break;
> > -		igt_assert(state < SUSPEND_STATE_NUM);
> > -		state_mask |= 1 << state;
> > -	}
> > 
> > -	free(states);
> > +	str = strstr(states, suspend_state_name[state]);
> > 
> > -	return state_mask;
> > +	if (!str)
> > +		igt_info("State %s not supported.\nSupported States: %s\n",
> > +			 suspend_state_name[state], states);
> > +
> > +	free(states);
> > +	return str;
> >  }
> > 
> >  /**
> > @@ -868,7 +860,7 @@ void igt_system_suspend_autoresume(enum
> > igt_suspend_state state,
> >  	enum igt_suspend_test orig_test;
> > 
> >  	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
> > -	igt_require(get_supported_suspend_states(power_dir) & (1 << state));
> > +	igt_require(is_state_supported(power_dir, state));
> >  	igt_require(test == SUSPEND_TEST_NONE ||
> >  		    faccessat(power_dir, "pm_test", R_OK | W_OK, 0) == 0);
> > 
> > --
> > 2.35.3
> 
