Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAC889CD3
 for <igt-dev@lists.freedesktop.org>; Tue, 25 May 2021 06:59:36 +0000 (UTC)
Date: Tue, 25 May 2021 08:59:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210525065924.GC3631@zkempczy-mobl2>
References: <20210524163429.5658-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524163429.5658-1-andrzej.turko@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/1] Fix the multiprocess mode of intel
 allocator
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
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 24, 2021 at 06:34:28PM +0200, Andrzej Turko wrote:
> In the multiprocess mode all requests to the allocator are
> processed in the parent. However, in certain scenarios
> (for example gem_exec_capture@pi), a child process may want
> to create an allocator instance using its own private file
> desriptor.  Thus all ioctls used to determine available gtt size
> must be called in the child process and not in the parent.
> 
> This patch implements the above change.

BTW you can "detach" allocations from parent to child itself
calling intel_allocator_init(). This has some drawback child
initializes allocator data structure locally so it cannot use
shared vm with other child anymore.

--
Zbigniew

> 
> 
> 
> Andrzej Turko (1):
>   lib/intel_allocator: Move the ioctl calls to client processes
> 
>  lib/intel_allocator.c        | 51 ++++++++++++++++++++++++++----------
>  lib/intel_allocator_random.c | 28 ++++++++------------
>  lib/intel_allocator_reloc.c  | 20 ++++----------
>  lib/intel_allocator_simple.c | 44 ++++---------------------------
>  4 files changed, 58 insertions(+), 85 deletions(-)
> 
> -- 
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
