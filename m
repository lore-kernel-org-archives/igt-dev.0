Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2139E6E4E3
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 12:21:58 +0000 (UTC)
Date: Wed, 29 Jul 2020 15:21:55 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200729122155.GJ20883@platvala-desk.ger.corp.intel.com>
References: <20200729113425.29486-1-petri.latvala@intel.com>
 <159602402103.8877.14463651350795263196@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159602402103.8877.14463651350795263196@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner/resultgen: Remember to close
 fd to aborted.txt
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

On Wed, Jul 29, 2020 at 01:00:21PM +0100, Chris Wilson wrote:
> Quoting Petri Latvala (2020-07-29 12:34:24)
> > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
> > ---
> >  runner/resultgen.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > index e2e162b0..3fe83b43 100644
> > --- a/runner/resultgen.c
> > +++ b/runner/resultgen.c
> > @@ -1637,6 +1637,7 @@ struct json_object *generate_results_json(int dirfd)
> >                 add_to_totals("runner", &abortsub, &results);
> >  
> >                 free_subtests(&abortsub);
> > +               close(fd);
> >         }
> >  
> >         free_settings(&settings);
> 
> For completeness, I noticed that generate_results_path() has an open
> within a matching close.

Hmm, well caught!

generate_results_path() calls generate_results() which calls
generate_results_json(), none of which close the passed fd. All those
functions are exported entry points with their own callers here and
there... and from a quick look around, it's expected that the caller
still owns the fd. Without it being commented. Hrmph.

Other callers do close the fd themselves, except for two, igt_results
binary and generate_results_path(). Will fix that in a future patch.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
