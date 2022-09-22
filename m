Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C561110E06C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 19:06:27 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id
 u9-20020a05622a14c900b0035cc7e8cbaeso7067925qtx.19
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 12:06:25 -0700 (PDT)
Message-ID: <221fa5e51f2ef4fbcafa1fcb5b55e9af052ffee0.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu, 22 Sep 2022 15:06:22 -0400
In-Reply-To: <Yyv+HrGb0NlF0Sdz@intel.com>
References: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
 <20220922051142.2003118-9-bhanuprakash.modem@intel.com>
 <Yyv3fowHUEsbY9cN@intel.com> <Yyv+HrGb0NlF0Sdz@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t V2 8/8] tests/kms_color: Fix crc compare check
 in CTM tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 2022-09-22 at 09:18 +0300, Ville Syrjälä wrote:
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

sheesh, I'll definitely keep this in mind for the future. Glad it at least
wasn't a clear cut case of me just missing the CI output entirely lol…

fwiw, feel fine to revert this change. it was a minor nitpick

> 
> So why did CI not present that change in behaviour more
> prominently?
> 
> Is it because we went from FAIL to apparent SUCCESS
> and that's always considered sort of fine. I suppose flagging
> the thing a failure because something seems to have gotten
> fixed would be weird, but maybe it should at least present
> such changes in behaviour at the top of the list.
> 
> Or is it because it attributed that change to these bugs
> https://gitlab.freedesktop.org/drm/intel/-/issues/1149
> https://gitlab.freedesktop.org/drm/intel/-/issues/315
> Does CI consider everything with an associated bug a potential
> ping pong and just basically hides any change it the result
> in that big list of CI noise in the report (which this series 
> hit a lot)? If so we need to get that fixed. Expected fail
> should be handled differently from a known ping pong.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
