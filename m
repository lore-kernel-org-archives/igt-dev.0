Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Date: Tue, 10 Oct 2023 12:33:52 +0200
Message-ID: <4299448.ejJDZkT8p0@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20231009173731.sqtkomm45leyplq5@kamilkon-desk.igk.intel.com>
References: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
 <20231009122750.519112-22-janusz.krzysztofik@linux.intel.com>
 <20231009173731.sqtkomm45leyplq5@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t v2 09/11] lib/kunit: Prepare for KTAP
 parsing after modprobe completed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

Thanks for review.

On Monday, 9 October 2023 19:37:31 CEST Kamil Konieczny wrote:
> Hi Janusz,
> On 2023-10-09 at 14:28:00 +0200, Janusz Krzysztofik wrote:
> > We are going to add support for reading a list of kunit test cases
> > provided by a kunit test module prior to executing those test cases.  That
> --------------------------------------------------------------------- ^^
> Two spaces, use only one.

I've discussed that point in details with Kamil and we've agreed that using 
two spaces for separating sentences can improve readability of a text usually 
printed with a fixed font, with no use of advance typesetting methods.

Thanks,
Janusz

> 
> > will be done by first loading kunit modules in list only mode, then
> > reading the list from /dev/kmsg with our KTAP parser.  Since that parsing
> -------------------------------------------------------^^
> Same here.
> 
> > will be performed after the kunit test module is successfully loaded and
> > there will be no concurrently running modprobe thread, we need to make
> > synchronization of reads from /dev/kmsg with potential errors modprobe
> > thread optional.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> > ---
> >  lib/igt_kmod.c | 50 ++++++++++++++++++++++++++------------------------
> >  1 file changed, 26 insertions(+), 24 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index fed0855c84..ed41aa1235 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -802,34 +802,36 @@ static int kunit_kmsg_result_get(struct 
igt_list_head *results,
> >  		if (igt_debug_on(igt_kernel_tainted(&taints)))
> >  			return -ENOTRECOVERABLE;
> >  
> > -		err = igt_debug_on(sigaction(SIGCHLD, &sigchld, saved));
> > -		if (err == -1)
> > -			return -errno;
> > -		else if (unlikely(err))
> > -			return err;
> > -
> > -		err = pthread_mutex_lock(&modprobe->lock);
> > -		switch (err) {
> > -		case EOWNERDEAD:
> > -			/* leave the mutex unrecoverable */
> > -			igt_debug_on(pthread_mutex_unlock(&modprobe-
>lock));
> > -			__attribute__ ((fallthrough));
> > -		case ENOTRECOVERABLE:
> > -			igt_debug_on(sigaction(SIGCHLD, saved, NULL));
> > -			if (igt_debug_on(modprobe->err))
> > -				return modprobe->err;
> > -			break;
> > -		case 0:
> > -			break;
> > -		default:
> > -			igt_debug("pthread_mutex_lock() error: %d\n", 
err);
> > -			igt_debug_on(sigaction(SIGCHLD, saved, NULL));
> > -			return -err;
> > +		if (modprobe) {
> > +			err = igt_debug_on(sigaction(SIGCHLD, &sigchld, 
saved));
> > +			if (err == -1)
> > +				return -errno;
> > +			else if (unlikely(err))
> > +				return err;
> > +
> > +			err = pthread_mutex_lock(&modprobe->lock);
> > +			switch (err) {
> > +			case EOWNERDEAD:
> > +				/* leave the mutex unrecoverable */
> > +				
igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
> > +				__attribute__ ((fallthrough));
> > +			case ENOTRECOVERABLE:
> > +				igt_debug_on(sigaction(SIGCHLD, saved, 
NULL));
> > +				if (igt_debug_on(modprobe->err))
> > +					return modprobe->err;
> > +				break;
> > +			case 0:
> > +				break;
> > +			default:
> > +				igt_debug("pthread_mutex_lock() error: 
%d\n", err);
> > +				igt_debug_on(sigaction(SIGCHLD, saved, 
NULL));
> > +				return -err;
> > +			}
> >  		}
> >  
> >  		ret = read(fd, record, BUF_LEN);
> >  
> > -		if (!err) {
> > +		if (modprobe && !err) {
> >  			igt_debug_on(pthread_mutex_unlock(&modprobe-
>lock));
> >  			igt_debug_on(sigaction(SIGCHLD, saved, NULL));
> >  		}
> 



