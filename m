Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BE710F431
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 08:25:14 +0000 (UTC)
Date: Thu, 19 May 2022 11:22:50 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <YoX+Wv2H5PY58Yg9@platvala-desk.ger.corp.intel.com>
References: <20220315065509.398990-1-bhanuprakash.modem@intel.com>
 <YjB7y8eD3eBxELul@platvala-desk.ger.corp.intel.com>
 <1f59b2c7-e201-7ead-4861-942340d06b89@intel.com>
 <ed653bad-6527-5935-2eee-772050d148ac@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed653bad-6527-5935-2eee-772050d148ac@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915_module_load: Unload the module
 before exiting the subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 19, 2022 at 01:00:21PM +0530, Sharma, Swati2 wrote:
> Hi Bhanu,
> 
> Overall patch LGTM.
> Minor changes.
> 1. Change subject to tests/i915/i915_module_load
> 2. Please add fixes tag.
> 
> With this fixed.
> Reviewed-by:
> Swati Sharma <swati2.sharma@intel.com>

NAK on the patch, it's just hiding the real problem. The real cause
needs to be found and understood before "fixing" it by slapping
unloads to places.

What this patch effectively does is adding an unload right before
another unload. Why does that help?



-- 
Petri Latvala



> 
> On 15-Mar-22 5:35 PM, Modem, Bhanuprakash wrote:
> > On Tue-15-03-2022 05:13 pm, Petri Latvala wrote:
> > > On Tue, Mar 15, 2022 at 12:25:09PM +0530, Bhanuprakash Modem wrote:
> > > > On DP-MST setup, after execution of "reload" subtest, i915
> > > > became unloadable. And this is effecting the next subtest
> > > > "reload-no-display".
> > > > 
> > > > Observing below error, if we run all subtests of i915_module_load
> > > > (or) run "reload" & "reload-no-display" in same order using the
> > > > igt_runner. But not seen any issue if we run each subtest individually.
> > > > 
> > > > $ ./igt_runner -o -l verbose -s --test-list tests.txt
> > > > --use-watchdog ../tests/ results/
> > > > (or)
> > > > $ ./build/tests/i915_module_load
> > > >    Starting subtest: reload
> > > >    ...
> > > >    Subtest reload: SUCCESS (3.780s)
> > > > 
> > > >    Starting subtest: reload-no-display
> > > >    (i915_module_load:42617) igt_kmod-WARNING: Could not unload i915
> > > >    Module                   Used by
> > > >    i915                     1
> > > >    ...
> > > >    Reloading i915 with disable_display=1
> > > >    Module i915 already inserted
> > > >    Could not load i915
> > > >    Subtest reload-no-display: FAIL (1.998s)
> > > > 
> > > > $ ./build/tests/i915_module_load --r reload
> > > >    Starting subtest: reload
> > > >    ...
> > > >    Subtest reload: SUCCESS (5.562s)
> > > > $ ./build/tests/i915_module_load --r reload-no-display
> > > >    Starting subtest: reload-no-display
> > > >    ...
> > > >    Subtest reload-no-display: SUCCESS (7.995s)
> > > > 
> > > > This patch will unload the module before exiting the subtest. So
> > > > that we can make sure that the module is unloaded.
> > > 
> > > Does it succeed in there? Or does this just make sure that the failure
> > > is caught in the right place? What is actually holding the reference
> > > to i915.ko?
> > 
> > Not sure who is holding the ref to i915. lsmod showing it is used by 1
> > but not showing who actually holding it.
> > 
> > Module                   Used by
> > i915                     1
> > 
> > But with this fix, there is no such failures mentioned in commit msg.
> > 
> > - Bhanu
> > 
> > > 
> > > 
> > 
> 
> -- 
> ~Swati Sharma
