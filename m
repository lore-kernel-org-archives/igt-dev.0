Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B181010E3B6
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 15:14:54 +0000 (UTC)
Date: Mon, 7 Nov 2022 17:14:57 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <Y2kg8RILFo4EhmT0@platvala-desk.ger.corp.intel.com>
References: <20221107120151.2365523-1-petri.latvala@intel.com>
 <20221107120151.2365523-2-petri.latvala@intel.com>
 <Y2kTMvaA0RlNt0Vz@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2kTMvaA0RlNt0Vz@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] igt_core: Split too long log lines
 when sending to runner with comms
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

On Mon, Nov 07, 2022 at 03:16:18PM +0100, Kamil Konieczny wrote:
> Hi Petri,
> 
> On 2022-11-07 at 14:01:47 +0200, Petri Latvala wrote:
> > Especially with file dumps a single log packet could exceed the max
> > size of a UNIX datagram. Split too long log chunks instead.
> 
> imho this is needed when you check packet size in other patch,
> it's network layer decision to split or not packets, so on local
> machine no split happens (well, I may be wrong here as I do not
> know much about network communication). The other way around
> would be to collect packet up to sended size.

With SOCK_STREAM, sure, but runnercomms is using SOCK_DGRAM. Datagram
packets are full-or-nothing atomically.


> 
> > 
> > Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> > Cc: Arkadiusz Hiler <arek@hiler.eu>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/igt_core.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index 3941c528..d4bef161 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -457,6 +457,23 @@ static void _igt_log_buffer_reset(void)
> >  	pthread_mutex_unlock(&log_buffer_mutex);
> >  }
> >  
> > +static void _log_to_runner_split(int stream, const char *str)
> > +{
> > +	size_t limit = 4096;
> > +	char *buf;
> > +
> > +	if (strlen(str) > limit) {
> > +		buf = calloc(limit + 1, 1);
> > +		strncpy(buf, str, limit);
> > +		send_to_runner(runnerpacket_log(stream, buf));
> > +		free(buf);
> > +
> > +		_log_to_runner_split(stream, str + limit);
> > +	} else {
> > +		send_to_runner(runnerpacket_log(stream, str));
> > +	}
> > +}
> > +
> 
> There are many places which calls send_to_runner, maybe it would
> be better to split it there ?

That would complicate send_to_runner a bit too much to my
taste. send_to_runner() is for all packet types, not just for log
packets. It would have to check for packet type log, extract the data
from that packet, and then create new ones...

> Or use _log_to_runner instead of send_to_runner ?
> Btw a while loop would be better than recursive call.

Yeah, you're right. I'll change that to a while loop.


-- 
Petri Latvala


> 
> Kamil
> 
> >  __attribute__((format(printf, 2, 3)))
> >  static void _log_line_fprintf(FILE* stream, const char *format, ...)
> >  {
> > @@ -467,7 +484,7 @@ static void _log_line_fprintf(FILE* stream, const char *format, ...)
> >  
> >  	if (runner_connected()) {
> >  		vasprintf(&str, format, ap);
> > -		send_to_runner(runnerpacket_log(fileno(stream), str));
> > +		_log_to_runner_split(fileno(stream), str);
> >  		free(str);
> >  	} else {
> >  		vfprintf(stream, format, ap);
> > -- 
> > 2.30.2
> > 
