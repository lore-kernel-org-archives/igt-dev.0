Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6394F10E777
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 16:39:48 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-37063f855e5so54820637b3.3
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 08:39:48 -0800 (PST)
MIME-Version: 1.0
References: <20221117194639.481656-1-markyacoub@chromium.org>
 <Y3diRurGtb79zJnJ@kamilkon-desk1>
In-Reply-To: <Y3diRurGtb79zJnJ@kamilkon-desk1>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 18 Nov 2022 11:39:36 -0500
Message-ID: <CAJUqKUoB3C=EBLh79b1HDAKN2KJQYBrqjHi937qePx-b9vyCWA@mail.gmail.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 robdclark@chromium.org, vsuley@google.com, petri.latvala@intel.com,
 ihf@google.com, amstan@chromium.org, kalin@google.com, seanpaul@chromium.org,
 matthewtlam@google.com, khaled.almahallawy@intel.com, markyacoub@google.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] Cv3 Workaround: Skip Plug all at init.
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

On Fri, Nov 18, 2022 at 5:45 AM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Mark,
>
> On 2022-11-17 at 14:46:39 -0500, Mark Yacoub wrote:
>
> Few nits for subject line:
> [PATCH] Cv3 Workaround: Skip Plug all at init.
> ----------- ^ --------- ^ -- ^ ------------- ^
> Generally do not use upper case in subject (with exceptions to
> some propoer names like GPU, CPU etc) and do not end it with
> dot, so better:
>
> [PATCH] Cv3 workaround: skip plug all at init
>
Fixed
> > [Why]
> > Currently, Cv3 doesn't allow all ports to be plugged in at the same time
> > so chamelium_plug_all() always fails.
> >
> > [How]
> > Check for the first Port ID as it's unique between V2 and V3, and skip
> > the plugging if it's V3.
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  lib/igt_chamelium.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > index 68864bb8..6c52ac3b 100644
> > --- a/lib/igt_chamelium.c
> > +++ b/lib/igt_chamelium.c
> > @@ -3015,10 +3015,19 @@ bool chamelium_plug_all(struct chamelium *chamelium)
> >       int port_ids[CHAMELIUM_MAX_PORTS];
> >       xmlrpc_value *v;
> >
> > +     igt_debug("CHAMELIUM PLUG ALL\n");
> ------------------ ^
> Don't use upper-case, so
> s/CHAMELIUM PLUG ALL/Chamelium plug all/
>
Removed. I accidentally forgot to amend my changes.
> > +
> >       port_count = chamelium_get_video_ports(chamelium, port_ids);
> > +     igt_debug("CHAMELIUM PLUG ALL: %zu ports\n", port_count);
> ------------------ ^
> Same here.
>
Removed.
> >       if (port_count <= 0)
> >               return false;
> >
> > +     /* A temporary workaround for Chamelium V3: Currently, Cv3 doesn't allow
> > +      * all ports to be plugged in at the same time. Cv3 first port has an ID
> > +      * of 0 while Cv2 has first port ID as 1. */
> > +     if (port_ids[0] == 0)
>
> If you put debugs elsewhere, maybe also put it here ?
I added a debug to know that this is Cv3
> This looks like you will not test any plugged port on Cv3 ?
We use autodiscovery later on to figure out what is connected.
> Do you have separate test iterate on ports ?
> Do you want to test anything here for Cv3 if port_count == 1 ?
We do test it elsewhere when we set up the chamelium ports anyway.
>
> Regards,
> Kamil
>
Thanks a lot for your review. Let me know if you'd like to me to
always add you on my IGT patches.
> > +             return true;
> > +
> >       for (int i = 0; i < port_count; ++i) {
> >               v = __chamelium_rpc(chamelium, NULL, "Plug", "(i)", port_ids[i]);
> >
> > @@ -3053,6 +3062,7 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
> >       for (int i = 0; group_list[i] != NULL; i++) {
> >               char *map_name;
> >               group = group_list[i];
> > +             igt_debug("Checking group %s", group);
> >
> >               if (!strstr(group, "Chamelium:"))
> >                       continue;
> > @@ -3060,6 +3070,7 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
> >               igt_assert(chamelium->port_count <= CHAMELIUM_MAX_PORTS);
> >
> >               map_name = group + (sizeof("Chamelium:") - 1);
> > +             igt_debug("Checking map %s", map_name);
> >
> >               for (int j = 0;
> >                    j < res->count_connectors;
> > --
> > 2.38.1.584.g0f3c55d4c2-goog
> >
