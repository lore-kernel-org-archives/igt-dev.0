Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C642D6E854
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 12:52:55 +0000 (UTC)
Date: Wed, 25 Mar 2020 14:52:53 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200325125253.GZ9497@platvala-desk.ger.corp.intel.com>
References: <20200325123318.240545-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325123318.240545-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Only show the kmsg
 underflow/overflow message once
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

On Wed, Mar 25, 2020 at 12:33:18PM +0000, Chris Wilson wrote:
> Instead of repeating every single time we underflow the read from kmsg,
> just once per test is enough warning.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  runner/executor.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index a56cb5d66..b26cb7bc7 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -549,6 +549,8 @@ static int dump_dmesg(int kmsgfd, int outfd)
>  	int comparefd;
>  	unsigned flags;
>  	unsigned long long seq, cmpseq, usec;
> +	bool underflow_once = false;
> +	bool overflow_once = false;
>  	char cont;
>  	char buf[2048];
>  	ssize_t r;
> @@ -586,10 +588,16 @@ static int dump_dmesg(int kmsgfd, int outfd)
>  		r = read(kmsgfd, buf, sizeof(buf));
>  		if (r < 0) {
>  			if (errno == EPIPE) {
> -				errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
> +				if (!overflow_once) {
> +					errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
> +					overflow_once = true;
> +				}

if (!overflow_once)
Warning: underflow


And then


if (!underflow_once)
Warning: overflow




>  				continue;
>  			} else if (errno == EINVAL) {
> -				errf("Warning: Buffer too small for kernel log record, record lost.\n");
> +				if (!underflow_once) {
> +					errf("Warning: Buffer too small for kernel log record, record lost.\n");
> +					underflow_once = true;
> +				}

I'd just not bother with once-proofing this case here. If it happens,
we will fix it by increasing buf to 4k from 2k.

For those in the audience, EINVAL happens when the next single kernel
log record is larger than the read() buffer. Whereas EPIPE is about
the number of log records that are unread.


tl;dr: Just once-proof the EPIPE-underflow and call it underflow_once.

Next order of business is hooking that underflow to cause dmesg-warn.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
