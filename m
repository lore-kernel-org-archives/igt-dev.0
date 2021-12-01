Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1AE6E087
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Dec 2021 00:05:19 +0000 (UTC)
Date: Wed, 1 Dec 2021 15:57:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20211201235738.GB36147@jons-linux-dev-box>
References: <20211126015735.908681-1-mastanx.katragadda@intel.com>
 <b4f66160-c947-1c47-5788-8a0d69f9bc48@linux.intel.com>
 <BN9PR11MB52905C33F740FAB54340B43C97669@BN9PR11MB5290.namprd11.prod.outlook.com>
 <5c09cc84-7f44-969c-9a7f-8c925f077ec5@linux.intel.com>
 <20211130164818.GA12888@jons-linux-dev-box>
 <400e33dd-8c5f-10ee-c5e9-631ebcf63253@linux.intel.com>
 <ccf3f049-a67a-ec5b-377d-c23abecbc94b@intel.com>
 <CAKMK7uHN4k9zDEmdQyscj7MsoDFcqVp0P80uEMzHfcaZ8HxnqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHN4k9zDEmdQyscj7MsoDFcqVp0P80uEMzHfcaZ8HxnqA@mail.gmail.com>
Subject: Re: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip Guc
 Submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Katragadda, MastanX" <mastanx.katragadda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 01, 2021 at 12:46:06PM +0100, Daniel Vetter wrote:
> On Wed, Dec 1, 2021 at 12:37 PM Radoslaw Szwichtenberg
> <radoslaw.szwichtenberg@intel.com> wrote:
> > On 01/12/2021 10:46, Tvrtko Ursulin wrote:
> > > On 30/11/2021 16:48, Matthew Brost wrote:
> > >>
> > >> IMO this fix is 100% correct as this is a known, tracked issue. It was
> > >> agreed upon (arch, i915, GuC team) that we just skip these tests with
> > >> GuC submission.
> > This does not look like a fix to me - you just disable test to hide the
> > result. If this issue is recorded with a bug, is tracked - why cant we
> > just let this test fail till we get this issue fixed?
> 
> This is correct in general, but sadly not for gem igts and selftests.
> The state of our validation suite is screwed up enough that
> unfortunately the safe starting point for failing tests is that the
> test is simply wrong, or too much just validating implementation
> details of the current platform/driver, while not actually validating
> stuff that should be tested for.
> 

That is exactly what this test is doing - IMO it is validating details
of backend scheduler not ABI nor a POR arch requirement. 

> > > I915 team is here on upstream as well.
> > >
> > > Record those acks publicly would be my ask. Unless some security by
> > > obscurity is happening here? Until then from me it is a soft nack to
> > > keep disabling tests which show genuine weaknesses in GuC mode. Soft
> > > until we get a public record of exactly what is broken and in what
> > > circumstances, acked by architects publicly as you say they acked it
> > > somewhere. Commit message devoid of detail is not good enough.
> > This should be most probably documented in the bug, right? Here we
> > should just keep the test as is till the issue is fixed. I don't see how
> > docummenting an issue would enable us to just disable the test.
> 
> Sadly the situation is bad enough that I'm tempted to just drop a few
> thousand Acked-by: me tags in this thread for any case where a
> questionable testcase gets in the way. Unless someone can proof that
> it's a POR architectural requirement we're validating here.
>

Agree our selftests / IGTs are a complete mess with many questionable
test cases. You wouldn't believe the amount of time / effort we waste
looking into these.

> I do agree though that really we should just delete such tests
> outright, not hide the mess on each platform individually.

Agree likely should do an audit of our tests and delete some of them.

Matt

> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
