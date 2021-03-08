Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203A66E81D
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Mar 2021 07:25:43 +0000 (UTC)
Date: Mon, 8 Mar 2021 08:25:37 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210308072537.GA7125@zkempczy-mobl2>
References: <20210301161403.98278-1-zbigniew.kempczynski@intel.com>
 <20210301161403.98278-10-zbigniew.kempczynski@intel.com>
 <161495380144.8241.2166065440472521262@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161495380144.8241.2166065440472521262@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v21 09/35] lib/intel_allocator: Try to
 stop smoothly instead of deinit
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

On Fri, Mar 05, 2021 at 02:16:41PM +0000, Chris Wilson wrote:

> > +               /* Thread has stuck somewhere */
> > +               if (READ_ONCE(allocator_thread_running)) {
> > +                       /* Deinit, this should stop all blocked syscalls, if any */
> > +                       channel->deinit(channel);
> > +                       pthread_join(allocator_thread, NULL);
> > +               } else {
> > +                       pthread_join(allocator_thread, NULL);
> > +                       channel->deinit(channel);
> 
> If the allocator thread was known to not be running, wouldn't it be safe
> to call channel->deinit() anyway?
> -Chris

You're right, we can safely call deinit(). Order is important only 
for first case.

--
Zbigniew
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
