Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90BD10E0AB
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Nov 2022 14:07:36 +0000 (UTC)
Date: Mon, 14 Nov 2022 16:06:42 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <Y3JLcgTIBkTZWdUV@platvala-desk.ger.corp.intel.com>
References: <20221111080529.2427645-1-petri.latvala@intel.com>
 <Y3JKqlSxLdgqcPFc@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3JKqlSxLdgqcPFc@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Fix a memory leak in
 stderr_contains_warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 03:03:22PM +0100, Kamil Konieczny wrote:
> Hi,
> 
> On 2022-11-11 at 10:05:29 +0200, Petri Latvala wrote:
> > The matches object's internals weren't released.
> > 
> > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > Cc: Arkadiusz Hiler <arek@hiler.eu>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/resultgen.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > index 3d753828..21a3ed84 100644
> > --- a/runner/resultgen.c
> > +++ b/runner/resultgen.c
> > @@ -1912,6 +1912,8 @@ static bool stderr_contains_warnings(const char *beg, const char *end)
> >  		i++;
> >  	}
> >  
> > +	free_matches(&matches);
> > +
> >  	return false;
> 
> On second look you need to free it also before return true ?
> So maybe reformat it, use break and then 'return found;' ?

Ah, well caught! v2 inc.


-- 
Petri Latvala
