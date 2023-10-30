Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461FA10E082
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 09:56:18 +0000 (UTC)
Date: Mon, 30 Oct 2023 10:56:13 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231030105613.2fe80103@maurocar-mobl2>
In-Reply-To: <20231025095622.q6mmkda4h4km54fp@kamilkon-desk.igk.intel.com>
References: <20231024141855.160633-1-mauro.chehab@linux.intel.com>
 <20231024141855.160633-8-mauro.chehab@linux.intel.com>
 <20231025095622.q6mmkda4h4km54fp@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] runner/runner_tests: change a regex
 to match case-insensitive
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 25 Oct 2023 11:56:22 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> On 2023-10-24 at 16:11:10 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > As regular expressions are now case-insensitive, change an
> > unit test to verify that case-insensitive logic is working
> > as expected.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  runner/runner_tests.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> > index 11ff05bc0e7e..c35668bc8f0e 100644
> > --- a/runner/runner_tests.c
> > +++ b/runner/runner_tests.c
> > @@ -1812,7 +1812,7 @@ igt_main
> >  
> >  	igt_subtest_group {
> >  		const char testlisttext[] = "igt@successtest";
> > -		const char blocktext[] = "igt@successtest@first";
> > +		const char blocktext[] = "igt@successTEST@first";
> 
> Please make a separate test for this, also add Petri on Cc.
> You can also consider upper-case test names (or subtests).

Adding more than one test for case-insensitive regex is probably
overkill, as we don't want to check if glib is doing the right
thing. We just want to ensure that no regressions on IGT will
happen if one ever changes the arguments for g_regex_new() call
for blacklists at runner/settings.c.

Just sent a refresh of this one adding a new test instead of
modifying an existing one.

> 
> Regards,
> Kamil
> 
> >  		struct job_list *list = malloc(sizeof(*list));
> >  		volatile int dirfd = -1;
> >  		char dirname[] = "tmpdirXXXXXX";
> > -- 
> > 2.41.0
> > 
