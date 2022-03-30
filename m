Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BAB10F1CA
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Mar 2022 06:59:03 +0000 (UTC)
Date: Wed, 30 Mar 2022 09:58:25 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <YkP/kUUW3IBbhiV9@platvala-desk.ger.corp.intel.com>
References: <20220328064722.127301-1-riana.tauro@intel.com>
 <20220328064722.127301-3-riana.tauro@intel.com>
 <fb6518b872e7474bbf05a11b58dbd0fa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb6518b872e7474bbf05a11b58dbd0fa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/intel-ci/fast-feedback: Add
 system-suspend-without-i915 subtest into fast-feedback list
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

On Mon, Mar 28, 2022 at 10:18:27AM +0300, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > Sent: Monday, March 28, 2022 12:17 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Ewins, Jon <jon.ewins@intel.com>; Dixit,
> > Ashutosh <ashutosh.dixit@intel.com>
> > Subject: [PATCH i-g-t 2/2] tests/intel-ci/fast-feedback: Add system-suspend-
> > without-i915 subtest into fast-feedback list
> > 
> > From: "Tauro, Riana" <riana.tauro@intel.com>
> > 
> > Add system-suspend-without-i915 subtest to CI fast-feedback test list.
> > 
> > v2 : Addressing review comments
> > 
> > Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
> Looks good to me.
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/intel-ci/fast-feedback.testlist | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-
> > feedback.testlist
> > index 5c867bbf..c1014558 100644
> > --- a/tests/intel-ci/fast-feedback.testlist
> > +++ b/tests/intel-ci/fast-feedback.testlist
> > @@ -174,6 +174,7 @@ igt@core_hotunplug@unbind-rebind
> > igt@vgem_basic@unload  igt@i915_module_load@reload
> > igt@i915_pm_rpm@module-reload
> > +igt@i915_suspend@system-suspend-without-i915
> Hi Petri,
> Could you please provide Ack to add above test to BAT list.
> This will test Suspend/Resume without i915 module to filter out system level issue
> with Suspend/Resume.

Hmm, it looks like it's already useful, there's a dmesg-warn caught on
rpl-s.

The runtimes range from 1s to 17s but that should be alright.

Acked-by: Petri Latvala <petri.latvala@intel.com>

> Thanks,
> Anshuman Gupta.
> > 
> >  # Kernel selftests
> >  igt@i915_selftest@live
> > --
> > 2.25.1
> 
