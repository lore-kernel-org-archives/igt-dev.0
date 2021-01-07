Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E0D6E43D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jan 2021 11:58:58 +0000 (UTC)
Date: Thu, 7 Jan 2021 12:58:54 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20210107115854.GN6508@kdec5-desk.ger.corp.intel.com>
References: <20201028154639.41616-1-apoorva1.singh@intel.com>
 <20201120145548.GH6508@kdec5-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120145548.GH6508@kdec5-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/i915_hangman: Added test
 description for test case
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
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 03:55:48PM +0100, Katarzyna Dec wrote:
> On Wed, Oct 28, 2020 at 09:16:39PM +0530, apoorva1.singh@intel.com wrote:
> > From: Apoorva Singh <apoorva1.singh@intel.com>
> > 
> > Added test and subtests description
> > 
> > Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> > Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> > ---
> >  tests/i915/i915_hangman.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> > index 2b341c4b..4340d680 100644
> > --- a/tests/i915/i915_hangman.c
> > +++ b/tests/i915/i915_hangman.c
> > @@ -36,6 +36,8 @@
> >  #include "igt_sysfs.h"
> >  #include "igt_debugfs.h"
> >  
> > +IGT_TEST_DESCRIPTION("Tests the handling of hang scenarios");
> > +
> >  #ifndef I915_PARAM_CMD_PARSER_VERSION
> >  #define I915_PARAM_CMD_PARSER_VERSION       28
> >  #endif
> > @@ -274,9 +276,11 @@ igt_main
> >  		igt_require(has_error_state(sysfs));
> >  	}
> >  
> > +	igt_describe("Validates the error state after manually triggering a hang");
> >  	igt_subtest("error-state-basic")
> >  		test_error_state_basic();
> >  
> > +	igt_describe("For each engine, validates the error state after injecting a hanging batch");
> >  	igt_subtest_with_dynamic("error-state-capture") {
> >  		__for_each_physical_engine(device, e) {
> >  			igt_dynamic_f("%s", e->name)
> > @@ -284,6 +288,7 @@ igt_main
> >  		}
> >  	}
> >  
> > +	igt_describe("Verify that execution of unterminated batch buffer triggers a hang");
> >  	igt_subtest("hangcheck-unterminated")
> >  		hangcheck_unterminated();
> Maybe too verbose, but LGTM.
> Reviewed-by: Katarzyna Dec <katarzyna.dec@intel.com>
> 
> Kasia :)
Hello,
I wanted to merge this patch, but there is a conflict. Could you resend it
rebased?

Kasia
> 
> >  
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
