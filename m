Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6706C6E0CE
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 15:07:18 +0000 (UTC)
From: "Mrzyglod, Daniel T" <daniel.t.mrzyglod@intel.com>
Date: Thu, 5 Mar 2020 15:07:15 +0000
Message-ID: <9640fceaa2465ca1e2b05f8d16af3e39e36a5e6a.camel@intel.com>
References: <20200303103412.29563-1-daniel.t.mrzyglod@intel.com>
 <20200303111442.GN3839@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200303111442.GN3839@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <7F444819E584844397695624280046C9@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: move upper_32_bits() and
 lower_32_bits() to library
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
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 2020-03-03 at 13:14 +0200, Petri Latvala wrote:
> On Tue, Mar 03, 2020 at 11:34:12AM +0100, Daniel Mrzyglod wrote:
> > Move inline upper_32_bits() and lower_32_bits() function from tests
> > to
> > library. Functiom will be usefull for elsewhere use.
> > 
> > Cc: Katarzyna Dec <katarzyna.dec@intel.com>
> > Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
> > ---
> >  lib/ioctl_wrappers.h        | 20 ++++++++++++++++++++
> >  tests/i915/gem_exec_fence.c | 10 ----------
> >  2 files changed, 20 insertions(+), 10 deletions(-)
> > 
> > diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> > index 7614e688c..17f54b2f9 100644
> > --- a/lib/ioctl_wrappers.h
> > +++ b/lib/ioctl_wrappers.h
> > @@ -244,4 +244,24 @@ static inline void *from_user_pointer(uint64_t
> > u64)
> >  	return (void *)(uintptr_t)u64;
> >  }
> >  
> > +/**
> > + * lower_32_bits
> > + *
> > + * return bits 0-31 of a number
> > + */
> > +static inline uint32_t lower_32_bits(uint64_t x)
> > +{
> > +	return x & 0xffffffff;
> > +}
> > +
> > +/**
> > + * lower_32_bits
> > + *
> > + * return bits 32-63 of a number
> 
> upper_
> 
> Does the name need a colon : after it to be recognized? Can you build
> docs and check that these appear?
> 
> 

I will fix docs error. 
static inlines will not apper there are no references in docs for any
static inline in code

Daniel 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
