Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3A66E11E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 10:05:40 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:05:34 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201214100534.GB7444@platvala-desk.ger.corp.intel.com>
References: <20201211233258.2952266-1-chris@chris-wilson.co.uk>
 <20201214064710.GY7444@platvala-desk.ger.corp.intel.com>
 <160793873733.1732.12371578970918786827@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160793873733.1732.12371578970918786827@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci: Include the small concurrent
 tests
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

On Mon, Dec 14, 2020 at 09:38:57AM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2020-12-14 06:47:10)
> > On Fri, Dec 11, 2020 at 11:32:58PM +0000, Chris Wilson wrote:
> > > The tiny tests run quick, but sometimes just enough to trip over the
> > > system.
> > > 
> > > v2: Only 4K, and only the bigger bombs.
> > > 
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > ---
> > >  tests/intel-ci/blacklist.txt | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> > > index c6af22b30..db8480c93 100644
> > > --- a/tests/intel-ci/blacklist.txt
> > > +++ b/tests/intel-ci/blacklist.txt
> > > @@ -15,7 +15,7 @@ igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
> > >  ###############################################
> > >  igt@gem_busy@hang.*
> > >  igt@gem_close_race@(?!.*basic).*
> > > -igt@gem_concurrent_blit(@.*)?
> > > +igt@gem_concurrent_blit@(?!4KiB-tiny.*bomb)
> > 
> > ITYM igt@gem_concurrent_blit@(?!4kib-tiny.*bomb)
> 
> The name I gave the test is 4KiB. Why would something be renaming them?
> [Yes, I think it is absurd that the results have different names from
> the tests.]

piglit is the one that originally did that. igt_runner tries to be
compatible.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
