Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2336EC4A
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Sep 2021 17:08:56 +0000 (UTC)
Date: Wed, 22 Sep 2021 20:12:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YUtj7tV73Umlhheb@platvala-desk.ger.corp.intel.com>
References: <20210921075749.13049-1-jeevan.b@intel.com>
 <20210921075749.13049-2-jeevan.b@intel.com>
 <YUnUrDr+55ra5ui4@platvala-desk.ger.corp.intel.com>
 <909095362e9445269a2096ef0aaa6572@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <909095362e9445269a2096ef0aaa6572@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_aux: Rename
 igt_debug_manual_check and assert check if all is supplied
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "Souza, Jose" <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 22, 2021 at 07:45:54PM +0300, B, Jeevan wrote:
> >-----Original Message-----
> >From: Latvala, Petri <petri.latvala@intel.com>
> >Sent: Tuesday, September 21, 2021 6:19 PM
> >To: B, Jeevan <jeevan.b@intel.com>
> >Cc: igt-dev@lists.freedesktop.org; daniel@ffwll.ch; Souza, Jose
> ><jose.souza@intel.com>
> >Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_aux: Rename
> >igt_debug_manual_check and assert check if all is supplied
> >
> >On Tue, Sep 21, 2021 at 01:27:47PM +0530, Jeevan B wrote:
> >> rename igt_debug_manual_check and patch the igt functions
> >> igt_debug_manual_check() and igt_debug_wait_for_keypress() to assert
> >> if "all" is supplied.
> >
> >Why?
> 
> Addressing comments given here. (https://lore.kernel.org/intel-gfx/CAKMK7uE0Hd34fOobDZT27MhOYE1qjXdD1Yzn9C0B+u=RCXLi8w@mail.gmail.com/)

The code changes are doing the opposite though, probaly by mistake.

The point was that calling igt_debug_wait_for_keypress() with "all"
should assert. Executing a test with --interactive-debug=all should
not.

-- 
Petri Latvala


> 
> Thanks
> Jeevan B
> >
> >
> >--
> >Petri Latvala
> >
> >
> >>
> >> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> >> ---
> >>  lib/igt_aux.c            | 18 ++++++++++++------
> >>  lib/igt_aux.h            |  2 +-
> >>  tests/i915/kms_dsc.c     |  2 +-
> >>  tests/i915/kms_psr.c     |  2 +-
> >>  tests/i915/kms_psr2_sf.c |  2 +-
> >>  5 files changed, 16 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> >> index 1217f5e8..96929237 100644
> >> --- a/lib/igt_aux.c
> >> +++ b/lib/igt_aux.c
> >> @@ -971,8 +971,7 @@ void igt_drop_root(void)
> >>   *
> >>   * Waits for a key press when run interactively and when the corresponding
> >debug
> >>   * var is set in the --interactive-debug=$var variable. Multiple keys
> >> - * can be specified as a comma-separated list or alternatively "all" if a wait
> >> - * should happen for all cases.
> >> + * can be specified as a comma-separated list and assert if "all" is supplied.
> >>   *
> >>   * When not connected to a terminal interactive_debug is ignored
> >>   * and execution immediately continues.
> >> @@ -993,6 +992,10 @@ void igt_debug_wait_for_keypress(const char *var)
> >>  	if (!igt_interactive_debug)
> >>  		return;
> >>
> >> +	if (strstr(igt_interactive_debug, var) &&
> >> +	    strstr(igt_interactive_debug, "all"))
> >> +		igt_assert(false);
> >> +
> >>  	if (!strstr(igt_interactive_debug, var) &&
> >>  	    !strstr(igt_interactive_debug, "all"))
> >>  		return;
> >> @@ -1008,14 +1011,13 @@ void igt_debug_wait_for_keypress(const char
> >*var)
> >>  }
> >>
> >>  /**
> >> - * igt_debug_manual_check:
> >> + * igt_debug_interactive_mode_check:
> >>   * @var: var lookup to to enable this wait
> >>   * @expected: message to be printed as expected behaviour before wait for
> >keys Y/n
> >>   *
> >>   * Waits for a key press when run interactively and when the corresponding
> >debug
> >>   * var is set in the --interactive-debug=$var variable. Multiple vars
> >> - * can be specified as a comma-separated list or alternatively "all" if a wait
> >> - * should happen for all cases.
> >> + * can be specified as a comma-separated list and assert if "all" is supplied.
> >>   *
> >>   * This is useful for display tests where under certain situation manual
> >>   * inspection of the display is useful. Or when running a testcase in the
> >> @@ -1028,7 +1030,7 @@ void igt_debug_wait_for_keypress(const char *var)
> >>   *
> >>   * Force test fail when N/n is pressed.
> >>   */
> >> -void igt_debug_manual_check(const char *var, const char *expected)
> >> +void igt_debug_interactive_mode_check(const char *var, const char
> >*expected)
> >>  {
> >>  	struct termios oldt, newt;
> >>  	char key;
> >> @@ -1041,6 +1043,10 @@ void igt_debug_manual_check(const char *var,
> >const char *expected)
> >>  	if (!igt_interactive_debug)
> >>  		return;
> >>
> >> +	if (strstr(igt_interactive_debug, var) &&
> >> +	    strstr(igt_interactive_debug, "all"))
> >> +		igt_assert(false);
> >> +
> >>  	if (!strstr(igt_interactive_debug, var) &&
> >>  	    !strstr(igt_interactive_debug, "all"))
> >>  		return;
> >> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> >> index bf57ccf5..a92eb799 100644
> >> --- a/lib/igt_aux.h
> >> +++ b/lib/igt_aux.h
> >> @@ -193,7 +193,7 @@ int igt_get_autoresume_delay(enum igt_suspend_state
> >state);
> >>  void igt_drop_root(void);
> >>
> >>  void igt_debug_wait_for_keypress(const char *var);
> >> -void igt_debug_manual_check(const char *var, const char *expected);
> >> +void igt_debug_interactive_mode_check(const char *var, const char
> >*expected);
> >>
> >>  /* sysinfo cross-arch wrappers from intel_os.c */
> >>
> >> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> >> index 3e450207..772687f4 100644
> >> --- a/tests/i915/kms_dsc.c
> >> +++ b/tests/i915/kms_dsc.c
> >> @@ -72,7 +72,7 @@ int force_dsc_restore_fd = -1;
> >>
> >>  static inline void manual(const char *expected)
> >>  {
> >> -	igt_debug_manual_check("all", expected);
> >> +	igt_debug_interactive_mode_check("all", expected);
> >>  }
> >>
> >>  static void force_dsc_enable(data_t *data)
> >> diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
> >> index 270d3150..24a10676 100644
> >> --- a/tests/i915/kms_psr.c
> >> +++ b/tests/i915/kms_psr.c
> >> @@ -246,7 +246,7 @@ static bool psr_enable_if_enabled(data_t *data)
> >>
> >>  static inline void manual(const char *expected)
> >>  {
> >> -	igt_debug_manual_check("all", expected);
> >> +	igt_debug_interactive_mode_check("all", expected);
> >>  }
> >>
> >>  static bool drrs_disabled(data_t *data)
> >> diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> >> index 1be8c3da..93347327 100644
> >> --- a/tests/i915/kms_psr2_sf.c
> >> +++ b/tests/i915/kms_psr2_sf.c
> >> @@ -331,7 +331,7 @@ static void prepare(data_t *data)
> >>
> >>  static inline void manual(const char *expected)
> >>  {
> >> -	igt_debug_manual_check("all", expected);
> >> +	igt_debug_interactive_mode_check("all", expected);
> >>  }
> >>
> >>  static void plane_update_expected_output(int plane_type, int box_count)
> >> --
> >> 2.19.1
> >>
