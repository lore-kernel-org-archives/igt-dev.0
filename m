Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7E110E107
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 15:54:48 +0000 (UTC)
Date: Tue, 7 Mar 2023 16:54:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230307155444.a4oi2i2yme6hf2sf@kamilkon-desk1>
References: <20230302063334.81563-1-vikas.srivastava@intel.com>
 <20230302110239.pwdbx5tzbb3stj25@kamilkon-desk1>
 <BYAPR11MB3767B87F06B92236F3049E1989B29@BYAPR11MB3767.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3767B87F06B92236F3049E1989B29@BYAPR11MB3767.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_userptr_blits: skip
 set-cache-level subtest on MTL platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vikas,

On 2023-03-02 at 11:34:09 +0000, Srivastava, Vikas wrote:
> Hi Kamil,
> 
> Thanks for checking , ok I will send this change as a part of " skip gem_set_caching call for mtl".
> 
> Regards,
> Vikas 
> 

no problem, I looked at it again and imho you can use:

	bool has_set_caching = IS_METEORLAKE(devid) ? false : true;

and later:
		igt_require_f(has_set_caching);

or you can create function gem_has_set_caching and use it.
We already have few such functions, see for example
gem_has_context or other gem_has_*

This way you avoid calling set_caching with tmp values (which
may fail) or accidentally setting caching for object 0.

Regards,
Kamil

> > -----Original Message-----
> > From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Sent: Thursday, March 2, 2023 4:33 PM
> > To: Srivastava, Vikas <vikas.srivastava@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_userptr_blits: skip set-cache-
> > level subtest on MTL platform
> > 
> > Hi Vikas,
> > 
> > On 2023-03-02 at 12:03:34 +0530, Vikas Srivastava wrote:
> > > SET_CACHE ioctl is not supported on latest platform like MTL so
> > > instead of failing in set-cache-level subtest just skip it.
> > 
> > You already have patchset: tests/i915: skip gem_set_caching call for mtl Why
> > not place it there ?
> > 
> > >
> > > Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> > > ---
> > >  tests/i915/gem_userptr_blits.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/i915/gem_userptr_blits.c
> > > b/tests/i915/gem_userptr_blits.c index 483570d0a..402d8810b 100644
> > > --- a/tests/i915/gem_userptr_blits.c
> > > +++ b/tests/i915/gem_userptr_blits.c
> > > @@ -2417,8 +2417,11 @@ igt_main_args("c:", NULL, help_str, opt_handler,
> > NULL)
> > >  			test_sd_probe(fd);
> > >  		}
> > >
> > > -		igt_subtest("set-cache-level")
> > > +		igt_subtest("set-cache-level") {
> > > +			igt_require_f(__gem_set_caching(fd, 0, 0) != -
> > EOPNOTSUPP,
> > 
> > Maybe better to check for MTL here and skip with message ?
> > 
> > Regards,
> > Kamil
> > 
> > > +				      "set_caching not supported on this
> > platform");
> > >  			test_set_caching(fd);
> > > +		}
> > >
> > >  		igt_subtest("userfault")
> > >  			test_userfault(fd);
> > > --
> > > 2.25.1
> > >
