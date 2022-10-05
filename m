Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2938F10E18A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 06:23:06 +0000 (UTC)
Date: Wed, 5 Oct 2022 08:23:00 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20221005082300.7bf3b672@maurocar-mobl2>
In-Reply-To: <YzbgHzTKxDBM9DjG@kamilkon-desk1>
References: <cover.1664173031.git.mchehab@kernel.org>
 <8e05b6bdd6381d7483ed0aa81470fe3754524dd0.1664173031.git.mchehab@kernel.org>
 <YzbgHzTKxDBM9DjG@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 17/76] i915/gem_exec_endless: Close device
 before exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 30 Sep 2022 14:25:03 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2022-09-26 at 08:17:22 +0200, Mauro Carvalho Chehab wrote:
> > From: Chris Wilson <chris.p.wilson@intel.com>
> > 
> > Close the device fd before we check for leaks during the atexit
> > handlers.  
> 
> This is somewhat misleading, it only changes type but missed
> actually closing i915 var.
> 
> Maybe some place for future improvement,

When igt_fd_t() is used, there's no need to explicitly close it, as
gcc/clang will use a typed cleanup to close it when the variable
lifetime expires.

> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> > 
> > Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> > 
> > To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH 00/76] at: https://lore.kernel.org/all/cover.1664173031.git.mchehab@kernel.org/
> > 
> >  tests/i915/gem_exec_endless.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
> > index b83d5a2c1480..2c56cc212036 100644
> > --- a/tests/i915/gem_exec_endless.c
> > +++ b/tests/i915/gem_exec_endless.c
> > @@ -28,6 +28,7 @@
> >  #include "igt.h"
> >  #include "igt_device.h"
> >  #include "igt_sysfs.h"
> > +#include "igt_types.h"
> >  #include "sw_sync.h"
> >  
> >  #define MAX_ENGINES 64
> > @@ -341,7 +342,7 @@ static void unpin_rps(int sysfs)
> >  igt_main
> >  {
> >  	const struct intel_execution_engine2 *e;
> > -	int i915 = -1;
> > +	igt_fd_t(i915);
> >  
> >  	igt_skip_on_simulation();
> >  
> > -- 
> > 2.37.3
> >   
