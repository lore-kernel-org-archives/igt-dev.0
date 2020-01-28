Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B827E6E059
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 12:34:46 +0000 (UTC)
Date: Tue, 28 Jan 2020 18:04:16 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20200128123416.GA28452@arjun-NUC8i7BEH>
References: <20200128120849.24015-1-arjun.melkaveri@intel.com>
 <158021427043.2129.1023440030917732997@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158021427043.2129.1023440030917732997@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH V5] i915/gem_exec_nop:Adjusted test to utilize
 all available engines
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 12:24:30PM +0000, Chris Wilson wrote:
> Quoting Arjun Melkaveri (2020-01-28 12:08:49)
> > @@ -621,10 +626,7 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
> >         igt_require(__gem_execbuf(fd, &execbuf) == 0);
> >  
> >         if (flags & CONTEXT) {
> > -               uint32_t id;
> > -
> > -               igt_require(__gem_context_create(fd, &id) == 0);
> > -               execbuf.rsvd1 = id;
> > +               execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
> 
> So where's the skip for machines without context support?
> -Chris
Missed that , will correct it now 
-Arjun 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
