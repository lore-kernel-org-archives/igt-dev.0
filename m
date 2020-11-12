Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEA26E22C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2020 13:45:06 +0000 (UTC)
Date: Thu, 12 Nov 2020 15:44:55 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201112134455.GP7444@platvala-desk.ger.corp.intel.com>
References: <20201008061118.22868-1-priyanka.dandamudi@intel.com>
 <20201112132545.GP6508@kdec5-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112132545.GP6508@kdec5-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/core_auth: Added test description
 for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 02:25:45PM +0100, Katarzyna Dec wrote:
> On Thu, Oct 08, 2020 at 11:41:18AM +0530, priyanka.dandamudi@intel.com wrote:
> > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > 
> > Added test description to all the available subtests.
> I am starting the effort to help to merge documentation patches. And this is the
> first one on the list :)
> Documentation will have brief description and categories, e.g. SW only, Stress,
> Functional, HW test, etc.


Thanks for helping with the docs review. But I'd rather leave the
categorization for separate patches, along with the bigger discussion
that's needed for the overall effort. Majorly, what is the set of
categories we're going to be using, and what consumes this, and also
the explanation of why the hell we're doing it in the doc strings.


-- 
Petri Latvala



> > 
> > Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > ---
> >  tests/core_auth.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/core_auth.c b/tests/core_auth.c
> > index 9c240fdb..955876d3 100644
> > --- a/tests/core_auth.c
> > +++ b/tests/core_auth.c
> > @@ -195,6 +195,7 @@ igt_main
> >  	int master;
> >  
> >  	/* root (which we run igt as) should always be authenticated */
> > +	igt_describe("Checks whether drm client is always authenticated or not.");
> Let's remove 'or not' and add cathegories. I suggest:
> 
> igt_describe("Check drm client is always authenticated category=SW_only,
> category=Core");
> 
> >  	igt_subtest("getclient-simple") {
> >  		int fd = drm_open_driver(DRIVER_ANY);
> >  
> > @@ -203,6 +204,9 @@ igt_main
> >  		close(fd);
> >  	}
> >  
> > +	 igt_describe("Test tries to open two clients and checks if one of the drm client is"
> > +		      " authenticated or not also, checks the authentication"
> > +		      " for the same drm client by dropping the other one.");
> I would go with:
> igt_describe("Use 2 clients, check second is authenticated even when first
> dropped category=SW_only, category=Core");
> >  	igt_subtest("getclient-master-drop") {
> >  		int fd = drm_open_driver(DRIVER_ANY);
> >  		int fd2 = drm_open_driver(DRIVER_ANY);
> > @@ -220,11 +224,15 @@ igt_main
> >  	igt_subtest_group {
> >  		igt_fixture
> >  			master = drm_open_driver_master(DRIVER_ANY);
> > -
> I think empty line between master and igt_describe should remain.
> > +		igt_describe("Test tries to retrieve magic for slave "
> > +			     "and checks if magic on master is authorised only once.");
> I think I would go with:
> igt_describe("Test magic numbers for master and slave category=SW_only, category=Core");
> >  		igt_subtest("basic-auth")
> >  			test_basic_auth(master);
> >  
> >  		/* this must be last, we adjust the rlimit */
> > +		igt_describe("Tests tries to retrieve magic for maximum possible number of slaves"
> > +			     " and verifies if all the retrieved magic values are different."
> > +			     "It also checks if the magic values can be authorised by master.");
> I think I would go with something like:
> igt_description("Test authentication and magic numbers uniqness for rlimit
> slaves, category=SW_only, category=Core");
> >  		igt_subtest("many-magics")
> >  			test_many_magics(master);
> >  	}
> Waiting for other comments or V2.
> Kasia :)
> > -- 
> > 2.28.0
> > 
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
