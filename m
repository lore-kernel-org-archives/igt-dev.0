Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7B26E062
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2020 10:35:25 +0000 (UTC)
Date: Wed, 4 Nov 2020 12:35:21 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201104103521.GQ7444@platvala-desk.ger.corp.intel.com>
References: <20201102194957.30123-1-umesh.nerlige.ramappa@intel.com>
 <20201103080644.GN7444@platvala-desk.ger.corp.intel.com>
 <20201104001542.GP70749@orsosgc001.ra.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104001542.GP70749@orsosgc001.ra.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf: Make sure i915 is loaded
 before reading proc
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 04:15:42PM -0800, Umesh Nerlige Ramappa wrote:
> On Tue, Nov 03, 2020 at 10:06:44AM +0200, Petri Latvala wrote:
> > On Mon, Nov 02, 2020 at 11:49:57AM -0800, Umesh Nerlige Ramappa wrote:
> > > The previous test may have unloaded i915 or failed to load it back. To
> > > combat such cases, each test fixture is supposed to ensure that i915 is
> > > loaded prior to running the subtests. In most fixtures this happens
> > > automatically when we try to get a handle to i915. In perf OA, we stat
> > > some proc/sys files even before getting a handle to i915. Occassionally,
> > > perf tests fail trying to stat these files. Fix perf OA by checking and
> > > loading i915 if it's not loaded.
> > > 
> > > v2: Use drm_load_module() (Petri)
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/405
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > 
> > 
> > Excellent, thanks. I would slap an R-b here but it's already in :P
> > 
> Thanks Petri, Would you please also help me merge this? I don't have
> permissions.


Merged now.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
