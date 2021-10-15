Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0586E21A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Oct 2021 02:49:16 +0000 (UTC)
Date: Fri, 15 Oct 2021 04:49:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211015024905.GA3607@zkempczy-mobl2>
References: <20211014081917.15977-1-zbigniew.kempczynski@intel.com>
 <20211014081917.15977-8-zbigniew.kempczynski@intel.com>
 <87r1cncquu.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r1cncquu.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] benchmarks/gem_exec_fault: Add
 softpin mode to support gens with ppgtt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 14, 2021 at 01:07:37PM -0700, Dixit, Ashutosh wrote:
> On Thu, 14 Oct 2021 01:19:17 -0700, Zbigniew Kempczyński wrote:
> >
> > @@ -127,9 +151,14 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
> >					obj.alignment = 0;
> >					gem_execbuf(fd, &execbuf);
> >
> > -					/* fault out */
> > -					obj.alignment = 1ull << 63;
> > -					__gem_execbuf(fd, &execbuf);
> > +					if (ahnd) {
> > +						obj.offset = get_offset(ahnd, obj.handle, size, 0);
> > +						obj.flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > +					} else {
> > +						/* fault out */
> > +						obj.alignment = 1ull << 63;
> > +						__gem_execbuf(fd, &execbuf);
> > +					}
> 
> Bug above, __gem_execbuf should be moved out of the else {}.

No, it shouldn't. Normal execbuf will lead to unbind/bind with new offset
and no 'alignment' fault-out execbuf is necessary.

--
Zbigniew

> 
> With the bug fixed this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
