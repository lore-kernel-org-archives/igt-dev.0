Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D867110E034
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Nov 2023 17:48:22 +0000 (UTC)
Date: Tue, 28 Nov 2023 18:48:16 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <ZWYn4Dm3CWrZR_8v@fdugast-desk.home>
References: <20231116145348.7-1-francois.dugast@intel.com>
 <20231116145348.7-5-francois.dugast@intel.com>
 <20231121170006.gjhznv3sxuob54jl@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121170006.gjhznv3sxuob54jl@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v1 04/13] xe_query: Add missing include.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 06:00:06PM +0100, Kamil Konieczny wrote:
> Hi Francois,
> On 2023-11-16 at 14:53:39 +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> 
> LGTM, please remove final dot from subject line at merge.

Sure, will do.

Francois

> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> > When trying to use xe_for_each_mem_region from a caller
> > that is not importing the igt_aux.h, the following build issue
> > will occur:
> > 
> > ../lib/xe/xe_query.h:76:38: error: implicit declaration of function ‘igt_fls’ [-Werror=implicit-function-declaration]
> >    76 |         for (uint64_t __i = 0; __i < igt_fls(__memreg); __i++) \
> > 
> > So, to avoid a dependency chain, let's include from the file
> > that is using the helper.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/xe/xe_query.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > index 38e9aa440..7b3fc3100 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -11,6 +11,8 @@
> >  
> >  #include <stdint.h>
> >  #include <xe_drm.h>
> > +
> > +#include "igt_aux.h"
> >  #include "igt_list.h"
> >  #include "igt_sizes.h"
> >  
> > -- 
> > 2.34.1
> > 
