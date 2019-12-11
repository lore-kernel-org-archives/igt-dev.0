Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373896EB38
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 12:54:10 +0000 (UTC)
Date: Wed, 11 Dec 2019 14:46:57 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20191211124657.i4w7oaxm3svwwu3v@ahiler-desk1.fi.intel.com>
References: <20191202130109.929-1-petri.latvala@intel.com>
 <20191202130109.929-3-petri.latvala@intel.com>
 <20191203133341.7wqchgwwvs37qebd@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203133341.7wqchgwwvs37qebd@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 02/11] runner/resultgen: Extract finding
 begin/end lines for a subtest to a helper
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 03, 2019 at 03:33:45PM +0200, Arkadiusz Hiler wrote:
> On Mon, Dec 02, 2019 at 03:01:00PM +0200, Petri Latvala wrote:
> > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > ---
> >  runner/resultgen.c | 99 ++++++++++++++++++++++++----------------------
> >  1 file changed, 51 insertions(+), 48 deletions(-)
> > 
> > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > index 31bc0bb1..be058327 100644
> > --- a/runner/resultgen.c
> > +++ b/runner/resultgen.c
> > @@ -376,6 +376,54 @@ static void add_igt_version(struct json_object *testobj,
> >  
> >  }
> >  
> > +static int find_subtest_idx_limited(struct matches matches,
> > +				    const char *bufend,
> > +				    const char *linekey,
> > +				    const char *pattern,
> > +				    const char *subtest_name,
> > +				    int first,
> > +				    int last)
> > +{
> > +	char *full_line;
> > +	int line_len;
> > +	int k;
> > +
> > +	/*
> > +	 * The pattern is a string literal in all call-sites, and we
> > +	 * don't want to disable this warning globally
> > +	 */
> > +#pragma GCC diagnostic push
> > +#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> > +	line_len = asprintf(&full_line, pattern, linekey, subtest_name);
> > +#pragma GCC diagnostic pop
> 
> I guess that you didn't go for:
> 
> __attribute__((format(printf, 5, 6)))
> static int find_subtest_idx_limited(struct matches matches,
> 				    int first,
> 				    int last,
> 				    const char *bufend,
> 				    const char *pattern,
> 				    ...)
> 
> because linekey is needed for comparison few lines below this and
> extracting it with va_start()/va_arg()/va_end() is equally ugly.
> 
> How about using an enum for selecting the desired one from a set of
> locally defined patterns instead of passing it as char* with all this
> pragma wizardry.

Other than the comment above the series is:
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
