Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FCD9336E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 08:12:42 +0000 (UTC)
Date: Tue, 12 Jul 2022 10:12:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <Ys0s9TKkvuzppri8@zkempczy-mobl2>
References: <20220707065939.33453-1-zbigniew.kempczynski@intel.com>
 <20220707065939.33453-5-zbigniew.kempczynski@intel.com>
 <YswKluUDYWhnj7rh@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YswKluUDYWhnj7rh@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] lib/igt_device_scan: Align
 microseconds to six leading zeros
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

On Mon, Jul 11, 2022 at 01:33:42PM +0200, Kamil Konieczny wrote:
> On 2022-07-07 at 08:59:37 +0200, Zbigniew Kempczyński wrote:
> > Previous format was not correct when DBG() was in use leading to
> > not properly aligned output.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  lib/igt_device_scan.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index afb6f07e18..e41c9f8b64 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -34,6 +34,7 @@
> >  #include <libudev.h>
> >  #include <linux/limits.h>
> >  #include <sys/stat.h>
> > +#include <sys/time.h>
> >  #include <sys/types.h>
> >  
> >  /**
> > @@ -170,7 +171,7 @@
> >  { \
> >  	struct timeval tm; \
> >  	gettimeofday(&tm, NULL); \
> > -	printf("%10ld.%03ld: ", tm.tv_sec, tm.tv_usec); \
> > +	printf("%10ld.%06ld: ", tm.tv_sec, tm.tv_usec); \
> ---------------- ^
> I checked other debug prints and this is the only place which
> uses 10ld for seconds, in other places there is %ld, so maybe
> it is worth to change this ?

I've enforced alignment to 10 digit to be sure time it will be 
well formatted even if on test machine date would be 1970 (I got 
this in my mind from the past). We will switch to 11ld in 2286-11-20
so if nothing amazing will happen I likely won't see this jump
in the future.

If you want I will change this - this code is blocked anyway unless
you're playing with debug.

--
Zbigniew 

> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> >  	printf(__VA_ARGS__); \
> >  }
> >  
> > -- 
> > 2.34.1
> > 
