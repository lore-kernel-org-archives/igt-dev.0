Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032D410E139
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 10:25:45 +0000 (UTC)
Date: Thu, 22 Sep 2022 13:25:08 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <Yyw4BHqQvqsurWV7@platvala-desk.ger.corp.intel.com>
References: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
 <20220922051142.2003118-9-bhanuprakash.modem@intel.com>
 <Yyv3fowHUEsbY9cN@intel.com> <Yyv+HrGb0NlF0Sdz@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yyv+HrGb0NlF0Sdz@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 8/8] tests/kms_color: Fix crc compare check
 in CTM tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 09:18:06AM +0300, Ville Syrjälä wrote:
> On Thu, Sep 22, 2022 at 08:49:50AM +0300, Ville Syrjälä wrote:
> > On Thu, Sep 22, 2022 at 10:41:42AM +0530, Bhanuprakash Modem wrote:
> > > !igt_skip_crc_compare || igt_check_crc_equal() is always true
> > > which is not correct.
> > > 
> > > Fixes: 1a42910d
> > 
> > Hang on. Now you're saying the regression in detecting actual failures
> > was introduced in commit 1a42910d4f8b ("tests/kms_color: Don't opencode
> > igt_check_crc_equal()") rather than the dynamic subtest conversion
> > commit (which is what the previous Fixes line claimed)?
> > 
> > So apparently the test may have been broken for 1.5 years now and
> > no one realize it.
> 
> Looks like the tests were in fact failing (at least on some hw)
> before and CI did notice the change in the behaviour:
> https://patchwork.freedesktop.org/series/88075/#rev2
> 
> But it did not raise any kind of stink about that, and still
> flagged the whole thing as an overall success. I presume
> Lyude neglected to look at the individual results in any detail
> once the overall succees was indicated (kinda dangerous thing
> to do with our CI it seems).

The previous run was full of notruns, making the results all kinds of
noisy =(

> 
> So why did CI not present that change in behaviour more
> prominently?
> 
> Is it because we went from FAIL to apparent SUCCESS
> and that's always considered sort of fine. I suppose flagging
> the thing a failure because something seems to have gotten
> fixed would be weird, but maybe it should at least present
> such changes in behaviour at the top of the list.

Are you saying the "Possible fixes" section should come before "Issues
hit"? Reasonable ask.

But the "Possible fixes" section in that result had 18 tests change
state to PASS. I suppose it's possible to just ctrl+f for kms_color
there but to a non-i915 developer, how should one have noticed
something is amiss? In a results email of ten billion status
changes. As you said, the overall verdict of "success" sounds like
something that could be followed.

> Or is it because it attributed that change to these bugs
> https://gitlab.freedesktop.org/drm/intel/-/issues/1149
> https://gitlab.freedesktop.org/drm/intel/-/issues/315
> Does CI consider everything with an associated bug a potential
> ping pong and just basically hides any change it the result
> in that big list of CI noise in the report (which this series 
> hit a lot)? If so we need to get that fixed. Expected fail
> should be handled differently from a known ping pong.

Ah, the meat of the matter. The kms_color results indeed went from
#1149 and #315 to PASS. Which possibly should have caused some alarm
bells. The question is how to add that logic.

At this time we don't have the possibility of marking XFAIL in
cibuglog to raise alarms on a test going PASS when it shouldn't. I
suspect the need isn't that great for that functionality, a rough
guesstimate for the amount of such bug reports is two, these kms_color
ones. Having that functionality for SKIP results would be a nightmare
to maintain, for skips that depend on, say, the display configuration.


-- 
Petri Latvala
