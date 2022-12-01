Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A32110E151
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 16:37:31 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id c26so782067uak.5
 for <igt-dev@lists.freedesktop.org>; Thu, 01 Dec 2022 08:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20221130174217.2261845-1-markyacoub@chromium.org>
 <Y4i8YB2kx6wKjqpn@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Y4i8YB2kx6wKjqpn@platvala-desk.ger.corp.intel.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 1 Dec 2022 11:37:19 -0500
Message-ID: <CAC0gqY7BL66YbV1XaOJDBKJU3E5Cju8usBDNuTtergioPOxHFA@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] igt_chameleon: Assert if there are no
 connected ports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, vsuley@google.com, amstan@chromium.org,
 ihf@google.com, igt-dev@lists.freedesktop.org, kalin@google.com,
 seanpaul@chromium.org, matthewtlam@google.com, khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 1, 2022 at 9:38 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Wed, Nov 30, 2022 at 12:42:17PM -0500, Mark Yacoub wrote:
> > [Why]
> > The tests are meant to run on devices that have a chameleon connected.
> > If autodiscovery finds no port, it means something is off and the DUT is
> > not behaving well.
> >
> > [How]
> > Add an assert if no port is mapped.
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  lib/igt_chamelium.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > index 79920de1..4e7a7a8f 100644
> > --- a/lib/igt_chamelium.c
> > +++ b/lib/igt_chamelium.c
> > @@ -2749,6 +2749,10 @@ unplug_port:
> >       igt_debug("Auto-discovery took %fms and found %i connector(s)\n",
> >                 (float)elapsed_ns / (1000 * 1000), chamelium->port_count);
> >
> > +     igt_assert_f(
> > +             is_any_port_mapped,
> > +             "No port is mapped. We don't expect to have no connected connectors.\n");
> > +
>
> If this situation (chamelium is configured but is not suitable for
> testing) ever happens, in my opinion an igt_abort would be more
> appropriate. Similar to the case where chamelium is configured but
> cannot be reached. What do you think?
>
So the case I saw is volteer failing to connect any of its ports
because of some bug it has that if it doesn't disconnect cleanly it
stops working without extra steps. I thought when we catch this, this
might be a good candidate for a real bug to file so it's a legit DUT
failure, hence the assert, rather than abort because test conditions
weren't met.
They're both good to me, so whatever you think is best.
>
> --
> Petri Latvala
