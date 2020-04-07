Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EC66E80B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 09:58:10 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200407095545.GL9497@platvala-desk.ger.corp.intel.com>
References: <20200407083105.1692124-1-chris@chris-wilson.co.uk>
 <20200407083533.1692277-1-chris@chris-wilson.co.uk>
 <20200407095545.GL9497@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158625348544.8918.7558010451816371087@build.alporthouse.com>
Date: Tue, 07 Apr 2020 10:58:05 +0100
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-04-07 10:55:45)
> On Tue, Apr 07, 2020 at 09:35:33AM +0100, Chris Wilson wrote:
> > Include the reason why we are dumping the task state (test timeout) in
> > the kmsg log prior to the task state. Hopefully this helps when reading
> > the dump.
> 
> Thanks, hopefully this will reduce the amount of times I hear "look, I
> found evidence, there's a task dump in dmesg, must be caused by it"...
> 
> 
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > ---
> >  runner/executor.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> > 
> > diff --git a/runner/executor.c b/runner/executor.c
> > index 1b69f9c57..7061b28d3 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -678,9 +678,20 @@ static bool sysrq(char cmd)
> >       return success;
> >  }
> >  
> > -static void show_kernel_task_state(void)
> > +static const char *show_kernel_task_state(const char *msg)
> >  {
> > +     int fd;
> > +
> > +     fd = open("/dev/kmsg", O_WRONLY);
> > +     if (fd != -1) {
> > +             write(fd, "<4>[IGT] ", 7);
> 
> Either replace this 7 with the correct 8 or a strlen call.

Pesky political correctness gone too far!
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
