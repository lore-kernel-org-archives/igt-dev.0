Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0686C112451
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 21:42:21 +0000 (UTC)
Date: Mon, 18 Jul 2022 17:42:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <YtXTsa9mNIOHYMwm@intel.com>
References: <20220713155233.1155128-1-rodrigo.vivi@intel.com>
 <20220713155233.1155128-3-rodrigo.vivi@intel.com>
 <20220718064748.GC32110@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220718064748.GC32110@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/igt_aux: Introduce the ability
 to force S3 suspend state.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 18, 2022 at 12:17:49PM +0530, Anshuman Gupta wrote:
> On 2022-07-13 at 11:52:32 -0400, Rodrigo Vivi wrote:
> > Testing both Suspend-to-Idle and Suspend-to-RAM is critical.
> > So far our test suite are relying on the system's default
> > for the "suspend-to-mem", what reduces our ability to cover
> > multiple scenarios or requires manual intervention.
> > This also brings confusions in some debugging scenarios.
> >
> > For the Suspend-to-Idle it is easy. The FREEZE state already
> > enforces it. However, there's only one way to enforce the
> > Suspend-to-RAM (aka S3) which is using MEM state with mem_sleep
> > at "deep".
> >
> > However, let's not break the whole world overnight. Let's
> > first introduce the ability to force the Suspend-to-RAM.
> > Then convert the tests as needed.
> >
> > So, the SUSPEND_STATE_MEM will continue to exist and do
> > exactly what is expected when you set "mem" to /sys/power/state,
> > which is respect whatever is in the /sys/power/mem_sleep.
> >
> > Let's introduce a new SUSPEND_STATE_S3 state aiming to force
> > the Suspend-to-RAM, by changing both /sys/power/state and
> > /sys/power/mem_sleep.
> >
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  lib/igt_aux.c | 118 ++++++++++++++++++++++++++++++--------------------
> >  lib/igt_aux.h |  19 +++++---
> >  2 files changed, 84 insertions(+), 53 deletions(-)
> >
> > diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> > index 5129d9f0..69ae9b58 100644
> > --- a/lib/igt_aux.c
> > +++ b/lib/igt_aux.c
> > @@ -698,7 +698,8 @@ static int autoresume_delay;
> >  static const char *suspend_state_name[] = {
> >  	[SUSPEND_STATE_FREEZE] = "freeze",
> >  	[SUSPEND_STATE_STANDBY] = "standby",
> > -	[SUSPEND_STATE_MEM] = "mem",
> > +	[SUSPEND_STATE_S3] = "mem", /* Forces Suspend-to-Ram (S3) */
> > +	[SUSPEND_STATE_MEM] = "mem", /* Respects system default */
> >  	[SUSPEND_STATE_DISK] = "disk",
> >  };
> >
> > @@ -840,6 +841,63 @@ static uint32_t get_supported_suspend_states(int power_dir)
> >  	return state_mask;
> >  }
> >
> > +/**
> > + * igt_get_memsleep_state
> > + *
> > + * Reads the value of /sys/power/mem_sleep and
> > + * returns the current suspend state associated with 'mem'.
> > + *
> > + * Returns : an #igt_mem_sleep state, current suspend state associated with 'mem'.
> > + */
> > +int igt_get_memsleep_state(void)
> > +{
> > +	char *mem_sleep_states;
> > +	char *mem_sleep_state;
> > +	enum igt_mem_sleep mem_sleep;
> > +	int power_dir;
> > +
> > +	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
> > +
> > +	if (faccessat(power_dir, "mem_sleep", R_OK, 0))
> > +		return MEM_SLEEP_NONE;
> > +
> > +	igt_assert((mem_sleep_states = igt_sysfs_get(power_dir, "mem_sleep")));
> > +	for (mem_sleep_state = strtok(mem_sleep_states, " "); mem_sleep_state;
> > +	     mem_sleep_state = strtok(NULL, " ")) {
> > +		if (mem_sleep_state[0] == '[') {
> > +			mem_sleep_state[strlen(mem_sleep_state) - 1] = '\0';
> > +			mem_sleep_state++;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!mem_sleep_state) {
> > +		free(mem_sleep_states);
> > +		return MEM_SLEEP_NONE;
> > +	}
> > +
> > +	for (mem_sleep = MEM_SLEEP_S2IDLE; mem_sleep < MEM_SLEEP_NUM; mem_sleep++) {
> > +		if (strcmp(mem_sleep_name[mem_sleep], mem_sleep_state) == 0)
> > +			break;
> > +	}
> > +
> > +	igt_assert_f(mem_sleep < MEM_SLEEP_NUM, "Invalid mem_sleep state\n");
> > +
> > +	free(mem_sleep_states);
> > +	close(power_dir);
> > +	return mem_sleep;
> > +}
> > +
> > +static void set_mem_sleep(int power_dir, enum igt_mem_sleep sleep)
> > +{
> > +	igt_assert(sleep < MEM_SLEEP_NUM);
> > +
> > +	igt_assert_eq(faccessat(power_dir, "mem_sleep", W_OK, 0), 0);
> > +
> > +	igt_assert(igt_sysfs_set(power_dir, "mem_sleep",
> > +				 mem_sleep_name[sleep]));
> > +}
> > +
> >  /**
> >   * igt_system_suspend_autoresume:
> >   * @state: an #igt_suspend_state, the target suspend state
> > @@ -866,6 +924,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
> >  {
> >  	int power_dir;
> >  	enum igt_suspend_test orig_test;
> > +	enum igt_mem_sleep orig_mem_sleep = MEM_SLEEP_NONE;
> >
> >  	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
> >  	igt_require(get_supported_suspend_states(power_dir) & (1 << state));
> > @@ -877,6 +936,14 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
> >  		      "Suspend to disk requires swap space.\n");
> >
> >  	orig_test = get_suspend_test(power_dir);
> > +
> > +	if (state == SUSPEND_STATE_S3) {
> > +		orig_mem_sleep = igt_get_memsleep_state();
> > +		set_mem_sleep(power_dir, MEM_SLEEP_DEEP);
> > +		igt_skip_on_f(igt_get_memsleep_state() != MEM_SLEEP_DEEP,
> > +			      "S3 not possible in this system.\n");
> 		This should be reordered, skip first and then set_mem_sleep().

If we change the order the purpose is defeated.
We need to change to the desired mode and then check if it sticks.
If we check it before it will skip without putting us to the desired mode.

> 		set_mem_sleep() may assert if "deep" is not supported by mem_sleep.

it kind of does, no?!
igt_assert(igt_sysfs_set(power_dir, "mem_sleep", mem_sleep_name[sleep]));

will fail with Invalid argument if the mode is not supported.
I don't believe that extra checks are needed.

Unless I'm missing something.

Thanks for all the reviews.

> 		With that addressed.
> 		Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>
> > +	}
> > +
> >  	set_suspend_test(power_dir, test);
> >
> >  	if (test == SUSPEND_TEST_NONE)
> > @@ -884,6 +951,9 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
> >  	else
> >  		suspend_via_sysfs(power_dir, state);
> >
> > +	if (orig_mem_sleep)
> > +		set_mem_sleep(power_dir, orig_mem_sleep);
> > +
> >  	set_suspend_test(power_dir, orig_test);
> >  	close(power_dir);
> >  }
> > @@ -958,52 +1028,6 @@ int igt_get_autoresume_delay(enum igt_suspend_state state)
> >  	return delay;
> >  }
> >
> > -/**
> > - * igt_get_memsleep_state
> > - *
> > - * Reads the value of /sys/power/mem_sleep and
> > - * returns the current suspend state associated with 'mem'.
> > - *
> > - * Returns : an #igt_mem_sleep state, current suspend state associated with 'mem'.
> > - */
> > -int igt_get_memsleep_state(void)
> > -{
> > -	char *mem_sleep_states;
> > -	char *mem_sleep_state;
> > -	enum igt_mem_sleep mem_sleep;
> > -	int power_dir;
> > -
> > -	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
> > -
> > -	if (faccessat(power_dir, "mem_sleep", R_OK, 0))
> > -		return MEM_SLEEP_NONE;
> > -
> > -	igt_assert((mem_sleep_states = igt_sysfs_get(power_dir, "mem_sleep")));
> > -	for (mem_sleep_state = strtok(mem_sleep_states, " "); mem_sleep_state;
> > -	     mem_sleep_state = strtok(NULL, " ")) {
> > -		if (mem_sleep_state[0] == '[') {
> > -			mem_sleep_state[strlen(mem_sleep_state) - 1] = '\0';
> > -			mem_sleep_state++;
> > -			break;
> > -		}
> > -	}
> > -
> > -	if (!mem_sleep_state) {
> > -		free(mem_sleep_states);
> > -		return MEM_SLEEP_NONE;
> > -	}
> > -
> > -	for (mem_sleep = MEM_SLEEP_S2IDLE; mem_sleep < MEM_SLEEP_NUM; mem_sleep++) {
> > -		if (strcmp(mem_sleep_name[mem_sleep], mem_sleep_state) == 0)
> > -			break;
> > -	}
> > -
> > -	igt_assert_f(mem_sleep < MEM_SLEEP_NUM, "Invalid mem_sleep state\n");
> > -
> > -	free(mem_sleep_states);
> > -	close(power_dir);
> > -	return mem_sleep;
> > -}
> >  /**
> >   * igt_drop_root:
> >   *
> > diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> > index 9d5b7bd2..b1e48b0f 100644
> > --- a/lib/igt_aux.h
> > +++ b/lib/igt_aux.h
> > @@ -135,13 +135,19 @@ bool igt_aub_dump_enabled(void);
> >
> >  /**
> >   *  igt_suspend_state:
> > - *  @SUSPEND_STATE_FREEZE: suspend-to-idle target state, aka S0ix or freeze,
> > + *  @SUSPEND_STATE_FREEZE: Suspend-To-Idle target state, aka S0ix or freeze,
> >   *			   first non-hibernation state
> > - *  @SUSPEND_STATE_STANDBY: standby target state, aka S1, second
> > + *  @SUSPEND_STATE_STANDBY: "Power-On Suspend" target state, aka S1, second
> >   *			    non-hibernation state
> > - *  @SUSPEND_STATE_MEM: suspend-to-mem target state aka S3, third
> > - *			non-hibernation state
> > - *  @SUSPEND_STATE_DISK: suspend-to-disk target state, aka S4 or hibernation
> > + *  @SUSPEND_STATE_S3: Suspend-To-RAM: It enforces a "deep" state to mem_sleep,
> > + *		       what forces the system to go to the third
> > + *		       non-hibernation state, aka S3.
> > + *  @SUSPEND_STATE_MEM: A memory sleep (non-hibernation) target state,
> > + *			respecting the system's mem_sleep default:
> > + *				s2idle: Suspend-To-Idle target state
> > + *				shallow: "Power-On Suspend"
> > + *				deep: Suspend-To-RAM
> > + *  @SUSPEND_STATE_DISK: Suspend-To-Disk target state, aka S4 or hibernation
> >   *
> >   *  Target suspend states used with igt_system_suspend_autoresume().
> >   *  See /sys/power/state for the available states on a given machine.
> > @@ -149,7 +155,8 @@ bool igt_aub_dump_enabled(void);
> >  enum igt_suspend_state {
> >  	SUSPEND_STATE_FREEZE,
> >  	SUSPEND_STATE_STANDBY,
> > -	SUSPEND_STATE_MEM,
> > +	SUSPEND_STATE_S3, /* Forces Suspend-to-Ram (S3) */
> > +	SUSPEND_STATE_MEM, /* Respects system default */
> >  	SUSPEND_STATE_DISK,
> >
> >  	/*< private >*/
> > --
> > 2.35.3
> >
