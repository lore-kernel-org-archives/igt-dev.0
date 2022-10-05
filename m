Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269B810E4A3
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 10:23:00 +0000 (UTC)
Date: Wed, 5 Oct 2022 12:22:52 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20221005122252.256d00a8@maurocar-mobl2>
In-Reply-To: <Yz1WCjOSxGBbtEyt@kamilkon-desk1>
References: <20221005074546.55955-1-mauro.chehab@linux.intel.com>
 <20221005074546.55955-2-mauro.chehab@linux.intel.com>
 <Yz1WCjOSxGBbtEyt@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 01/77] lib: Introduce typed cleanups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 5 Oct 2022 12:01:46 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2022-10-05 at 09:44:30 +0200, Mauro Carvalho Chehab wrote:
> > From: Chris Wilson <chris@chris-wilson.co.uk>  
> 
> imho here should be added "why" part, consider adding
> something like following (re-worded from cover letter):
> 
> We close devices on exit but that doesn't work when inside
> igt_subtest_group is used igt_skip(), as it uses longjmp,
> causing the code to go out of scope and miss close(). 
> 
> > 
> > Start introducing standard types with automatic cleanup courtesy of
> > gcc's __attribute__((cleanup)). As an example, we start with an fd
> > that will automatically call close() on going out of scope, and
> > crucially before atexit where we will want to check for resource leaks.
> > 
> > [mchehab: add test descriptions]
> > Suggested-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> > Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>  

Makes sense. Changing it to:

    lib: Introduce typed cleanups
    
    We close devices on exit but that doesn't work when inside
    igt_subtest_group is used igt_skip(), as it uses longjmp,
    causing the code to go out of scope and miss close().
    
    Start introducing standard types with automatic cleanup courtesy of
    gcc's __attribute__((cleanup)). This also works with clang, when
    using volatile integers.
    
    As an example, we start with an fd that will automatically call
    close() on going out of scope, and crucially before atexit where
    we will want to check for resource leaks.
    
    [mchehab: add test descriptions]
    Suggested-by: Andrzej Hajda <andrzej.hajda@intel.com>
    Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
    Cc: Andrzej Hajda <andrzej.hajda@intel.com>
    Reviewed-by: Petri Latvala <petri.latvala@intel.com>
    Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro
