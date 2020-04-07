Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6F989DFD
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 09:51:19 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <158624903366.6356.11697630519432451804@build.alporthouse.com>
References: <20200407083105.1692124-1-chris@chris-wilson.co.uk>
 <20200407083533.1692277-1-chris@chris-wilson.co.uk>
 <875zeblmau.fsf@intel.com>
 <158624903366.6356.11697630519432451804@build.alporthouse.com>
Date: Tue, 07 Apr 2020 12:51:14 +0300
Message-ID: <87369flj3h.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Show why we dump the task state
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 07 Apr 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Jani Nikula (2020-04-07 09:42:01)
>> On Tue, 07 Apr 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
>> > Include the reason why we are dumping the task state (test timeout) in
>> > the kmsg log prior to the task state. Hopefully this helps when reading
>> > the dump.
>> >
>> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> > Cc: Petri Latvala <petri.latvala@intel.com>
>> > ---
>> >  runner/executor.c | 25 ++++++++++++++++---------
>> >  1 file changed, 16 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/runner/executor.c b/runner/executor.c
>> > index 1b69f9c57..7061b28d3 100644
>> > --- a/runner/executor.c
>> > +++ b/runner/executor.c
>> > @@ -678,9 +678,20 @@ static bool sysrq(char cmd)
>> >       return success;
>> >  }
>> >  
>> > -static void show_kernel_task_state(void)
>> > +static const char *show_kernel_task_state(const char *msg)
>> >  {
>> > +     int fd;
>> > +
>> > +     fd = open("/dev/kmsg", O_WRONLY);
>> > +     if (fd != -1) {
>> > +             write(fd, "<4>[IGT] ", 7);
>> > +             write(fd, msg, strlen(msg));
>> > +             close(fd);
>> > +     }
>> > +
>> 
>> igt_kmsg(KMSG_WARNING "%s\n", msg);
>
> We're outside of libigt.so

Quoting yourself, "Yeah, I haven't had coffee."

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
