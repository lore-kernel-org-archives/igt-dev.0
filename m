Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBF610E777
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 16:40:10 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id e68so6280049ybh.2
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 08:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20221117194639.481656-1-markyacoub@chromium.org>
 <Y3dD3zhcUrhmvwoC@platvala-desk.ger.corp.intel.com>
In-Reply-To: <Y3dD3zhcUrhmvwoC@platvala-desk.ger.corp.intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 18 Nov 2022 11:39:59 -0500
Message-ID: <CAJUqKUppHCLqvM5Ee-Q4VwQ_B-0q0kZ72b1a2MYTse9K6N7DwA@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] Cv3 Workaround: Skip Plug all at init.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, vsuley@google.com, amstan@chromium.org,
 ihf@google.com, igt-dev@lists.freedesktop.org, kalin@google.com,
 seanpaul@chromium.org, matthewtlam@google.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 3:36 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Thu, Nov 17, 2022 at 02:46:39PM -0500, Mark Yacoub wrote:
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
> > +
> >       port_count = chamelium_get_video_ports(chamelium, port_ids);
> > +     igt_debug("CHAMELIUM PLUG ALL: %zu ports\n", port_count);
> >       if (port_count <= 0)
> >               return false;
> >
> > +     /* A temporary workaround for Chamelium V3: Currently, Cv3 doesn't allow
> > +      * all ports to be plugged in at the same time. Cv3 first port has an ID
> > +      * of 0 while Cv2 has first port ID as 1. */
>
> Format this comment as
>
> /*
>  * Text starts from this line.
>  * The begin and end of block comment on their own lines
>  */
>
Fixed.
>
>
> > +     if (port_ids[0] == 0)
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
>
> Make sure debug prints end in newline.
>
Removed.
> >
> >               if (!strstr(group, "Chamelium:"))
> >                       continue;
> > @@ -3060,6 +3070,7 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
> >               igt_assert(chamelium->port_count <= CHAMELIUM_MAX_PORTS);
> >
> >               map_name = group + (sizeof("Chamelium:") - 1);
> > +             igt_debug("Checking map %s", map_name);
>
> Same here.
Removed.
>
>
> --
> Petri Latvala
>
>
> >
> >               for (int j = 0;
> >                    j < res->count_connectors;
> > --
> > 2.38.1.584.g0f3c55d4c2-goog
> >
