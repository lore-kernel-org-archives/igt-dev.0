Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E2F10E0A6
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 13:30:20 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so4417075e87.1
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 06:30:20 -0700 (PDT)
Date: Tue, 16 May 2023 16:30:16 +0300
From: Petri Latvala <adrinael@adrinael.net>
Message-ID: <ZGOFaEP9/zBClGYL@adrinael.net>
References: <20230515163908.50961-1-kamil.konieczny@linux.intel.com>
 <20230516084241.45226c0e@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516084241.45226c0e@maurocar-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t] meson: fix testplan building for old
 meson
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 16, 2023 at 08:42:41AM +0200, Mauro Carvalho Chehab wrote:
> Hi Kamil,
> 
> On Mon, 15 May 2023 18:39:08 +0200
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> 
> > Old meson 0.47.2 do not support dictionary adding so fix
> > testplan building.
> > 
> > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  docs/testplan/meson.build | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> > index 2014f91b5..6454f2933 100644
> > --- a/docs/testplan/meson.build
> > +++ b/docs/testplan/meson.build
> > @@ -27,12 +27,15 @@ xe_test_dict = {
> >  		 'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> >  	       }
> >  
> > -test_dict = {
> > +if build_xe
> > +	test_dict = {
> > +		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
> > +		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
> > +	    }
> > +else
> > +	test_dict = {
> >  	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
> >  	    }
> 
> This would mean that, for every new driver with documentation we'll
> need two changes. It would be even harder if we ever need to add options
> to control other driver builds.
> 
> Btw, I double-checked that, with meson, we can't update the directory
> with something like:
> 
> 	xe_tests = { 'input': xe_test_config, 'extra_args': check_testlist }
> 	test_dict['xe_tests'] = xe_tests
> 
> As this would generate this error:
> 
> 	../docs/testplan/meson.build:33:1: ERROR: Assignment target must be an id.
> 		test_dict['xe_tests'] = xe_tests
> 	 ^
> 
> According to [1]:
> 
> 	"All objects are immutable, you can not change the contents 
> 	 of them. You can only create new ones. 
> 	 (which is what += does behind the scenes)."
> 
> [1] https://github.com/mesonbuild/meson/issues/3931#issuecomment-407180830
> 
> On other words, with version < 0.48, we're stuck with data or code
> duplication.
> 
> So, IMO, we should:
> 
> 	1. Change the gitlab's "build:tests-fedora-oldest-meson" pipeline
> 	   to honor the minimal version from meson.build file, e. g.:
> 
> 		$ MESON_MIN_VERSION=$(perl -ne "print \$1 if (m/meson_version\s*:\s*'([^']+)/)" meson.build)
> 		$ echo $MESON_MIN_VERSION
> 		>=0.47.2
> 
> 	2. Update the minimal version to at least 0.48.
> 
> Yet, if there are strong reasons why keeping support for such old version,
> feel free to add my ack:
> 
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org> # if we can't update meson_version to at least >= 0.48

The ideal fix for this is indeed bumping the minimum required version
to the oldest that's in Ubuntu LTS / Debian Stable / etc. However that
requires changing the docker image building in gitlab-CI to use the
new version and no one has had time to look into why any changes there
break all kinds of stuff. In other words: Not impossible, just not
possible quickly.


-- 
Petri Latvala

