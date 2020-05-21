Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF436E936
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2020 15:12:43 +0000 (UTC)
Date: Thu, 21 May 2020 18:12:37 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200521151237.GA19279@ideak-desk.fi.intel.com>
References: <20200519125956.13206-1-imre.deak@intel.com>
 <20200521130239.GF31478@intel.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F8250CE1A@BGSMSX104.gar.corp.intel.com>
 <20200521144504.GG31478@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521144504.GG31478@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Keep signal helpers
 enabled after a failed interruptible subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Nidhi1" <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 21, 2020 at 08:15:04PM +0530, Anshuman Gupta wrote:
> On 2020-05-21 at 19:52:34 +0530, Shankar, Uma wrote:
> > 
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Anshuman
> > > Gupta
> > > Sent: Thursday, May 21, 2020 6:33 PM
> > > To: Deak, Imre <imre.deak@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org; Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> > > Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Keep signal helpers enabled
> > > after a failed interruptible subtest
> > > 
> > > On 2020-05-19 at 18:29:56 +0530, Imre Deak wrote:
> > > > For the duration of all the interruptible subtests the signal helper
> > > > is assumed to stay running after each subtest, both in case the
> > > > subtest passes or aborts with a failure. So make sure we don't leave
> > > > the signal helper suspended in case igt_assert() aborts.
> > > >
> > > > References: https://gitlab.freedesktop.org/drm/intel/issues/1883
> > > > Fixes: 60e8be7ccc72 ("tests/kms_flip: Retry test in case of a DP/HDMI
> > > > link reset")
> > > > Cc: Uma Shankar <uma.shankar@intel.com>
> > > > Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
> > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > Looks good to me,
> > > But i have some doubts regarding the reported failure in issue 1883.
> > > > ---
> > > >  tests/kms_flip.c | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/tests/kms_flip.c b/tests/kms_flip.c index
> > > > 46bfc5858..7bf6958af 100755
> > > > --- a/tests/kms_flip.c
> > > > +++ b/tests/kms_flip.c
> > > > @@ -1325,10 +1325,15 @@ retry:
> > > >  	 * reset event, which the driver signals with a hotplug event.
> > > >  	 */
> > > >  	if (!state_ok) {
> > > > +		bool hotplug_detected;
> > > > +
> > > >  		igt_suspend_signal_helper();
> > > > -		igt_assert(!retried && igt_hotplug_detected(mon, 3));
> > > AFAIU correctly the test didn't received any HOTPLUG uevent due to any
> > > wait_event_interruptible() waitqueue in driver blocking it till 3 seconds, if this
> > > waitqueue in kernel get interrupted by SIGCONT signal, which is primarly signal
> > > helper in this igt, then igt_hotplug_detected() will detect a hotplug. Hope my
> > > understading here is correct here.

No, there wasn't any hotplug events sent, there couldn't be since it's
an eDP test (HPD interrupts are ignored by the kernel).

> > Here since we have suspended the signal handler which will ignore or mask any interrupts,
> > we need to ensure to resume it before we assert.
>
> IMHO igt_suspend_signal_helper send a SIGSTOP to signal helper
> process, which will stop the signal helper execution, which was
> actually signalling SIGCONT to parent process at 500Hz intervel.  I am
> not able to see if it masks any interrupt here.  Please correct me if
> i am wrong here.  I am interested here to know why it has not received
> HOTPLUG event for a period of 3 second, what was really blocking it
> from kernel driver.

The problem was a missed frame (due to a scheduling delay, not b/c of
hotplug events) and as a result igt_assert() aborting the subtest with
the signal helper suspended. That abort will result in continuing with
the next dynamic subtest or ending the whole test if this was the last
dynamic subtest (as in our case). In the first case we'll call
igt_suspend_signal_helper(), in the second case igt_stop_helper(), but
these will hang since the signal helper is suspended. IGT's 90sec
watchdog will kill the test. For instance in our case:

Dynamic subtest C-eDP1: FAIL (12.824s)
Subtest plain-flip-ts-check-interruptible: FAIL (36.786s)
Received signal SIGQUIT.
Stack trace:
 #0 [fatal_sig_handler+0xd6]
 #1 [killpg+0x40]
 #2 [waitpid+0x12]
 #3 [__waitpid+0x46]
 #4 [igt_wait_helper+0x11]
 #5 [igt_stop_helper+0x2a]
 #6 [igt_stop_signal_helper+0x19]
 #7 [__real_main1570+0x1b2]
 #8 [main+0x27]
 #9 [__libc_start_main+0xe7]
 #10 [_start+0x2a]


> Thanks,
> Anshuman Gupta.
> 
> > 
> > > Thanks,
> > > Anshuman Gupta.
> > > > +		if (!retried)
> > > > +			hotplug_detected = igt_hotplug_detected(mon, 3);
> > > >  		igt_resume_signal_helper();
> > > >
> > > > +		igt_assert(!retried && hotplug_detected);
> > > > +
> > > >  		igt_debug("Retrying after a hotplug event\n");
> > > >  		retried = true;
> > > >  		memset(&o->vblank_state, 0, sizeof(o->vblank_state));
> > > > --
> > > > 2.23.1
> > > >
> > > > _______________________________________________
> > > > igt-dev mailing list
> > > > igt-dev@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
