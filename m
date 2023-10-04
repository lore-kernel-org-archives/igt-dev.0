Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B7510E0F4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 10:37:11 +0000 (UTC)
Date: Wed, 4 Oct 2023 12:36:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231004103641.wj5dukxexd73r62e@kamilkon-desk.igk.intel.com>
References: <20231001103006.431894-1-kunal1.joshi@intel.com>
 <17bd5bee-d5ff-9351-ed9b-e917b780d491@intel.com>
 <1f8f7bfc-21cb-e986-401a-591892adefeb@intel.com>
 <8bba0a41-769f-4921-89b5-0f5d2d315459@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8bba0a41-769f-4921-89b5-0f5d2d315459@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add test for hotplug validation in
 simulation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Juha-Pekka,

On 2023-10-04 at 11:15:25 +0300, Juha-Pekka Heikkila wrote:
> On 4.10.2023 8.48, Modem, Bhanuprakash wrote:
> > Forgot to add Kamil to the TO/CC list.
> > 
> > On Tue-03-10-2023 02:42 pm, Modem, Bhanuprakash wrote:
> > > Hi Kunal,
> > > 
> > > On Sun-01-10-2023 04:00 pm, Kunal Joshi wrote:
> > > > Test to validate hotplug in simulation environment we
> > > > have scratch pad register 0x4f080 from which we can
> > > > trigger uevents such as HPD, VBLANK..etc, Idea is to
> > > > have port mapping placed in igtrcthrough which test
> > > > can write to 0x4f080 and check if we get hotplug
> > > 
> > > In first glance, do we really need to upstream this test? I am
> > > pretty sure, no one (including Intel) is going to use this test from
> > > upstream repo (We don't have any simulation environment in public
> > > CI).
> > > 
> > > So, we can't merge this.
> > > 
> > > + Kamil, thoughts?
> > > 
> 
> Not sure why this wouldn't fit in upstream? It is valid igt test, will be of
> interest only for Intel guys hence in in intel directory and when in
> upstream it will not be causing issues during backports. We anyway already
> have more generic tests taking into account if they're being run in
> simulated environments.
> 
> /Juha-Pekka
> 

imho this should not be upstreamed as any user outside Intel
will not be able to run it. Why it cannot be a subtest with
some generic test like kms_hotplug.c with only timeout increased
for simulation? Such test may be in upstream if it will work
with existing hardware in CI.

Regards,
Kamil
