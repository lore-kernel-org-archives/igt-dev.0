Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 17 Jan 2024 07:14:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <20240117071430.1d70535e@maurocar-mobl2>
In-Reply-To: <2utfb2ntlzox27wcrqtdzoojj5r6idhkxjhbgur6wnlmh5qpb4@rtlje3o72eit>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
 <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
 <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
 <87mst7rri8.fsf@intel.com> <20240115205207.5b491e3e@maurocar-mobl2>
 <2utfb2ntlzox27wcrqtdzoojj5r6idhkxjhbgur6wnlmh5qpb4@rtlje3o72eit>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 16 Jan 2024 08:50:51 -0600
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Mon, Jan 15, 2024 at 08:52:07PM +0100, Mauro Carvalho Chehab wrote:
> >On Mon, 15 Jan 2024 09:21:35 +0200
> >Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >  
> >> On Mon, 15 Jan 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:  
> >> > On 1/12/24 15:29, Lucas De Marchi wrote:  
> >> >>> On such case, you should document kunit_debugfs at Documentation/ABI.  
> >> >>
> >> >> debugfs is not part of ABI.  
> >> >
> >> > That's arguable. Check Documentation/ABI and you'll see several debugfs
> >> > nodes documented there.  
> >>
> >> I guess you could argue documenting your debugfs under Documentation/ABI
> >> makes it ABI, but I'd avoid doing that. Usually we use debugfs precisely
> >> to avoid the burden of ABI and all the baggage that brings.  
> >
> >Placing things at debugfs "precisely to avoid the burden of ABI and all
> >the baggage that brings" sounds a bad practice to me, but you can ask
> >others at LKML and see if this is a acceptable.
> >
> >My understanding is that, if userspace tools rely on what's there at
> >debugfs, and a change break such tools, there is a high chance that
> >such change will end being reverted - at best, it will surely provide
> >some flame wars.
> >
> >I remember we had some troubles related to trace logic in the past,
> >due to something similar: even not originally meant to provide a stable
> >ABI, and being under debugfs, there were some changes breaking userspace
> >which caused lots of discussions. Can't remember anymore if the changes
> >were reverted or not, but at the end ftrace ABI was considered as stable.  
> 
> ftrace provides a way for you to read the format of the tracepoint and
> use it (API). If you did it otherwise and hardcoded the format (ABI),
> you are on your own as tracepoints in the kernel keep changing.
> Try grepping "tracepoint" in the last pull requests.

Not quite true. Since when the EDAC subsystem was redesigned back
in 2013, RAS events have been using ftrace API to report hardware
problems to userspace. We did the design of such API together with the
ftrace maintainer, that developed an userspace counterpart (libtraceevent),
designed to have a stable uABI. 

The rasdaemon application uses it since then, originally on a fork, as 
it took a while for libtraceevent to become a separate tree and started
being shipped in distributions. Only last year we finally migrated to use
the current incarnation of libtraceevent, mostly to cleanup rasdaemon code.

During all this time (10+ years), the API remained the same, and we had
only once an incident on such interface - not directly related to uABI,
but to some behavioral change that happened at the logic to flush
ftrace ringbuffer, causing troubles for rasdaemon.

Regards,
Mauro
