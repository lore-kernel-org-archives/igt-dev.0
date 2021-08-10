Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E278C89F5F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 10:00:52 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 10 Aug 2021 12:00:47 +0200
Message-ID: <2206187.ElGaqSPkdT@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <YRI8e3vKxxsFVi4C@platvala-desk.ger.corp.intel.com>
References: <20210809191020.18960-1-janusz.krzysztofik@linux.intel.com>
 <YRI8e3vKxxsFVi4C@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [RFC PATCH i-g-t 1/2] lib/core: Add igt_debug_on*
 variants
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On wtorek, 10 sierpnia 2021 10:44:43 CEST Petri Latvala wrote:
> On Mon, Aug 09, 2021 at 09:10:19PM +0200, Janusz Krzysztofik wrote:
> > If a test calls a function which can return a failure, only the fact
> > that the function failed can be reported to the caller, with no details
> > on what actually failed inside.  It could be helpful if functions which
> > perform several steps or iterations emitted debug messages with failure
> > details.
> > 
> > To simplify coding and avoid code duplication in functions, igt_debug
> > variants similar to igt_warn_on and friends could be useful.  Add them.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> 
> 
> This looks lovely.
> 
> Only thing I didn't like was that one double negative if statement
> with if (!igt_debug_on(!cond)) but meh...
> 
> Series is
> 
> Acked-by: Petri Latvala <petri.latvala@intel.com>

Thanks Petri, pushed.

Janusz

> 
> 
> > ---
> >  lib/igt_core.h | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/lib/igt_core.h b/lib/igt_core.h
> > index 6075d1539..8d433fc16 100644
> > --- a/lib/igt_core.h
> > +++ b/lib/igt_core.h
> > @@ -1274,6 +1274,58 @@ extern enum igt_log_level igt_log_level;
> >  		ret__; \
> >  	})
> >  
> > +/**
> > + * igt_debug_on:
> > + * @condition: condition to test
> > + *
> > + * Print a IGT_LOG_DEBUG level message if a condition is met.
> > + *
> > + * Should be used when something fails in a function that doesn't perform
> > + * a long jump in that case, and either performs several operations that
> > + * can fail that way or doesn't return unambiguous error codes on failures.
> > + * This is useful to streamline the test logic since it allows for
> > + * replacing open conding with function calls without loosing ability to
> > + * provide debug output with failure details.
> > + *
> > + * This macro also returns the value of @condition.
> > + */
> > +#define igt_debug_on(condition) ({ \
> > +		typeof(condition) ret__ = (condition); \
> > +		if (ret__) \
> > +			igt_debug("Condition %s occurred in function %s, file %s:%i\n", \
> > +				  #condition, __func__, __FILE__, __LINE__); \
> > +		ret__; \
> > +	})
> > +
> > +/**
> > + * igt_debug_on_f:
> > + * @condition: condition to test
> > + * @...: format string and optional arguments
> > + *
> > + * Print a IGT_LOG_DEBUG level message if a condition is met.
> > + *
> > + * Should be used when something fails in a function that doesn't perform
> > + * a long jump in that case, and performs one or more operations in a
> > + * loop, each time with different values of parameters.  This is useful
> > + * to streamline the test logic since it allows for replacing open conding
> > + * with function calls without loosing ability to provide debug output
> > + * with failure details.
> > + *
> > + * In addition to the plain igt_debug_on() helper this allows to print
> > + * additional debug information to help debugging operation failures.
> > + *
> > + * It also returns the value of @condition.
> > + */
> > +#define igt_debug_on_f(condition, f...) ({ \
> > +		typeof(condition) ret__ = (condition); \
> > +		if (ret__) {\
> > +			igt_debug("condition %s occurred in function %s, file %s:%i\n", \
> > +				  #condition, __func__, __FILE__, __LINE__); \
> > +			igt_debug(f); \
> > +		} \
> > +		ret__; \
> > +	})
> > +
> >  void igt_set_timeout(unsigned int seconds,
> >  		     const char *op);
> >  
> 



