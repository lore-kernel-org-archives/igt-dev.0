Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6733310E52E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 09:21:56 +0000 (UTC)
Date: Fri, 24 Mar 2023 10:21:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230324092151.kumrdwsajwu47bi5@zkempczy-mobl2>
References: <20230324050253.2560-1-niranjana.vishwanathapura@intel.com>
 <20230324071246.3eb2ef35@maurocar-mobl2>
 <ZB1B5+7YUhJAYFDq@nvishwa1-DESK>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZB1B5+7YUhJAYFDq@nvishwa1-DESK>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe/xe_query: Extern
 xe_supports_faults()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 11:23:35PM -0700, Niranjana Vishwanathapura wrote:
> On Fri, Mar 24, 2023 at 07:12:46AM +0100, Mauro Carvalho Chehab wrote:
> > On Thu, 23 Mar 2023 22:02:53 -0700
> > Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> wrote:
> > 
> > > Do not check for supports_faults in xe_device_get() as
> > > it creates a VM in fault mode which prohibits creation
> > > of any other VM in non-fault mode until this fault mode
> > > VM is closed. This leads to test failures in multi threaded
> > > cases.
> > 
> > Hmm...
> > 
> > > 
> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  lib/xe/xe_query.c | 51 ++++++++++++++++++++++-------------------------
> > >  lib/xe/xe_query.h |  3 ---
> > >  2 files changed, 24 insertions(+), 30 deletions(-)
> > > 
> > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > index 183523280..dc91d59bc 100644
> > > --- a/lib/xe/xe_query.c
> > > +++ b/lib/xe/xe_query.c
> > > @@ -160,23 +160,6 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_usage *mem_usage
> > >  	return alignment;
> > >  }
> > > 
> > > -static bool xe_check_supports_faults(int fd)
> > > -{
> > > -	bool supports_faults;
> > > -
> > > -	struct drm_xe_vm_create create = {
> > > -		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > > -			 DRM_XE_VM_CREATE_FAULT_MODE,
> > > -	};
> > > -
> > > -	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> > > -
> > > -	if (supports_faults)
> > > -		xe_vm_destroy(fd, create.vm_id);
> > 
> > Weren't the VM supposed to be closed here?
> > 
> 
> Yes, but before it does destroy the VM, some other thread can try
> to create a VM in non-fault mode and fail because we have created
> a fault mode VM here. This happens in multi-threaded test like
> xe_exec_threads.

I've question about it - why separately created vm in fault mode
influences on creating another vm in non-fault mode? Those vm's
are separate entities so why they collide?

I've examined the code and at the moment I see two scenarios
- threads are reusing same xe_device instantiated on opening
fixture and are opening their own fd, what means each cached
xe_device entry reside on separate fd. I see there's lack
of proper locking during insertion to igt_map (I'm going to
send a fix in a minute). I bet this might be reason of problems
- multiple threads adding to hashmap (which might resize in
this moment).

I see there's risk of executing xe_check_supports_faults()
twice on same fd from two competing threads and this is not
mutexed. But create/destroy vm is on local stack and even with
this it shouldn't influence on other thread execution.

--
Zbigniew

> 
> Niranjana
> 
> 
> > 
> > Regards,
> > Mauro

