Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A6A10E062
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 19:40:41 +0000 (UTC)
Date: Thu, 22 Sep 2022 22:40:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <Yyy6NQhaaJCnCM3W@intel.com>
References: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
 <20220922051142.2003118-9-bhanuprakash.modem@intel.com>
 <Yyv3fowHUEsbY9cN@intel.com> <Yyv+HrGb0NlF0Sdz@intel.com>
 <221fa5e51f2ef4fbcafa1fcb5b55e9af052ffee0.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <221fa5e51f2ef4fbcafa1fcb5b55e9af052ffee0.camel@redhat.com>
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

On Thu, Sep 22, 2022 at 03:06:22PM -0400, Lyude Paul wrote:
> On Thu, 2022-09-22 at 09:18 +0300, Ville Syrjälä wrote:
> > On Thu, Sep 22, 2022 at 08:49:50AM +0300, Ville Syrjälä wrote:
> > > On Thu, Sep 22, 2022 at 10:41:42AM +0530, Bhanuprakash Modem wrote:
> > > > !igt_skip_crc_compare || igt_check_crc_equal() is always true
> > > > which is not correct.
> > > > 
> > > > Fixes: 1a42910d
> > > 
> > > Hang on. Now you're saying the regression in detecting actual failures
> > > was introduced in commit 1a42910d4f8b ("tests/kms_color: Don't opencode
> > > igt_check_crc_equal()") rather than the dynamic subtest conversion
> > > commit (which is what the previous Fixes line claimed)?
> > > 
> > > So apparently the test may have been broken for 1.5 years now and
> > > no one realize it.
> > 
> > Looks like the tests were in fact failing (at least on some hw)
> > before and CI did notice the change in the behaviour:
> > https://patchwork.freedesktop.org/series/88075/#rev2
> > 
> > But it did not raise any kind of stink about that, and still
> > flagged the whole thing as an overall success. I presume
> > Lyude neglected to look at the individual results in any detail
> > once the overall succees was indicated (kinda dangerous thing
> > to do with our CI it seems).
> 
> sheesh, I'll definitely keep this in mind for the future. Glad it at least
> wasn't a clear cut case of me just missing the CI output entirely lol…
> 
> fwiw, feel fine to revert this change. it was a minor nitpick

I guess some kind of mass revert is still needed, or someone
needs to just figure out why the test is now broken. And I'm
not talking about the failures on icl+ (or maybe glk+) since
those are apparently expected. But the idle runs are now
showing the test failing on absolutely all machines, so
clearly a real regression has managed to sneak in.

-- 
Ville Syrjälä
Intel
