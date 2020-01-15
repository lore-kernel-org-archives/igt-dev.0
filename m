Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E84F6E90D
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2020 10:59:58 +0000 (UTC)
Date: Wed, 15 Jan 2020 12:59:55 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200115105955.GP25209@platvala-desk.ger.corp.intel.com>
References: <20200110120642.19844-1-petri.latvala@intel.com>
 <20200110120642.19844-2-petri.latvala@intel.com>
 <20200115102957.modz5fqfof4kcskf@ahiler-desk1.fi.intel.com>
 <20200115104847.GO25209@platvala-desk.ger.corp.intel.com>
 <20200115105456.n7m43slguxc6hfiq@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115105456.n7m43slguxc6hfiq@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] runner: Ensure generated json is
 properly UTF8-encoded
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 15, 2020 at 12:54:56PM +0200, Arkadiusz Hiler wrote:
> On Wed, Jan 15, 2020 at 12:48:47PM +0200, Petri Latvala wrote:
> > On Wed, Jan 15, 2020 at 12:29:57PM +0200, Arkadiusz Hiler wrote:
> > > On Fri, Jan 10, 2020 at 02:06:41PM +0200, Petri Latvala wrote:
> > > > Sometimes tests output garbage (e.g. due to extreme occurrences of
> > > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/55) but we
> > > > need to present the garbage as results.
> > > > 
> > > > We already ignore any test output after the first \0, and for the rest
> > > > of the bytes that are not directly UTF-8 as-is, we can quite easily
> > > > represent them with two-byte UTF-8 encoding.
> > > > 
> > > > libjson-c already expects the string you feed it through
> > > > json_object_new_string* functions to be UTF-8.
> > > > 
> > > > v2: Rebase, adjust for dynamic subtest parsing
> > > > 
> > > > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > > > Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > > > Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com> #v1
> > > > ---
> > > >  runner/resultgen.c | 45 +++++++++++++++++++++++++++++++++++----------
> > > >  1 file changed, 35 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > > > index 2c8a55da..105ec887 100644
> > > > --- a/runner/resultgen.c
> > > > +++ b/runner/resultgen.c
> > > > @@ -405,15 +405,40 @@ static void free_matches(struct matches *matches)
> > > >  	free(matches->items);
> > > >  }
> > > >  
> > > > +static struct json_object *new_escaped_json_string(const char *buf, size_t len)
> > > > +{
> > > > +	struct json_object *obj;
> > > > +	char *str = NULL;
> > > > +	size_t strsize = 0;
> > > > +	size_t i;
> > > > +
> > > > +	for (i = 0; i < len; i++) {
> > > > +		if (buf[i] > 0 && buf[i] < 128) {
> > > > +			str = realloc(str, strsize + 1);
> > > > +			str[strsize] = buf[i];
> > > > +			++strsize;
> > > > +		} else {
> > > > +			/* Encode > 128 character to UTF-8. */
> > > > +			str = realloc(str, strsize + 2);
> > > > +			str[strsize] = ((unsigned char)buf[i] >> 6) | 0xC0;
> > > > +			str[strsize + 1] = ((unsigned char)buf[i] & 0x3F) | 0x80;
> > > > +			strsize += 2;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	obj = json_object_new_string_len(str, strsize);
> > > > +	free(str);
> > > > +
> > > > +	return obj;
> > > > +}
> > > 
> > > Looking at this for the 3rd time I wonder whether this realloc() every
> > > character is not too costly, especially that we do that for every field.
> > 
> > Do you mean as opposed to allocating a larger chunk at a time? realloc
> > already does this.
> > 
> > With a quick whipup test, realloc()ing same pointer repeatedly for
> > sizes 1 to 0xffffff (randomly chosen end point) with increments of 1,
> > the returned pointer was different a total of 29 times. For funzies, a
> > total of 9 times when stdout was a pipe instead of tty.
> 
> I have expected that even if it's not a part of the standard the actual
> implementation would optimize for this. Nice to see it's this good.
> 
> > > Have you tried comparing times igt_results for some intermediates with
> > > large dmesgs?
> > 
> > I can do that but I won't be expecting much difference.
> 
> Yeah, does not make sense to test it. Go ahead with mergeing.

Thanks. Merged now.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
