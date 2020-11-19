Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5446E50B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 09:00:32 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:00:29 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201119090029.GF7444@platvala-desk.ger.corp.intel.com>
References: <20201119083559.2157131-1-chris@chris-wilson.co.uk>
 <20201119085304.GE7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119085304.GE7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/kms: Range check pipe before lookup
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

On Thu, Nov 19, 2020 at 10:53:04AM +0200, Petri Latvala wrote:
> On Thu, Nov 19, 2020 at 08:35:59AM +0000, Chris Wilson wrote:
> > Make sure the lookup index is within the range of the table before
> > accessing.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  lib/igt_kms.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index e5d8e82c9..9175e50fe 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -1902,7 +1902,7 @@ static void igt_fill_display_format_mod(igt_display_t *display);
> >   */
> >  void igt_require_pipe(igt_display_t *display, enum pipe pipe)
> >  {
> > -	igt_skip_on_f(!display->pipes[pipe].enabled,
> > +	igt_skip_on_f(pipe >= display->n_pipes || !display->pipes[pipe].enabled,
> >  			"Pipe %s does not exist or not enabled\n",
> >  			kmstest_pipe_name(pipe));
> 
> Who's calling this with an invalid 'pipe' value? display->pipes size
> is no longer display->n_pipes, right?

Correction, it is. But n_pipes is not the amount of pipes as reported
by count_crtcs, it's IGT_MAX_PIPES.

So who's calling this with 'pipe' that's >= IGT_MAX_PIPES?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
