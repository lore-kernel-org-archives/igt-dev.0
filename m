Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6991010E185
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 14:54:04 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef5380669cso53559767b3.9
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 07:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220715192200.1782193-1-markyacoub@chromium.org>
 <YuPczW1iwuH0oJnq@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YuPczW1iwuH0oJnq@platvala-desk.ger.corp.intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 29 Jul 2022 10:53:52 -0400
Message-ID: <CAJUqKUrm9Yn02vEBSPn2Wpcfr3yBMp1jj49Z2qXej_=o8szv-g@mail.gmail.com>
To: Petri Latvala <petri.latvala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] lib/igt_chamelium: Extend check of valid
 ports to port=0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, amstan@google.com, ihf@google.com,
 igt-dev@lists.freedesktop.org, seanpaul@chromium.org, markyacoub@google.com,
 khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 29, 2022 at 9:14 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Fri, Jul 15, 2022 at 03:22:00PM -0400, Mark Yacoub wrote:
> > [Why]
> > Chamelium V3 has a valid port at 0 so 0 should not be rejected.
> >
> > [How]
> > Check for port values between 0 and CHAMELIUM_MAX_PORTS which should
> > also include the V2 ports range.
> >
> > Test: ./kms_chamelium --run-subtest dp-hp
> > Tested on: Volteer & cv3
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  lib/igt_chamelium.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > index 55cbfa12..5d68372b 100644
> > --- a/lib/igt_chamelium.c
> > +++ b/lib/igt_chamelium.c
> > @@ -2311,7 +2311,7 @@ static bool chamelium_read_port_mappings(struct chamelium *chamelium,
> >               port->id = g_key_file_get_integer(igt_key_file, group,
> >                                                 "ChameliumPortID",
> >                                                 &error);
> > -             if (!port->id) {
> > +             if (port->id < 0 || port->id > CHAMELIUM_MAX_PORTS) {
>
> You rather need to check whether 'error' is set to something. 0 might
> be a valid port id in v3 but it's also what g_key_file_get_integer
> returns on error.
Updated om v2: https://patchwork.freedesktop.org/patch/495936/
Thanks! that was easy.
>
>
> --
> Petri Latvala
>
>
> >                       igt_warn("Failed to read chamelium port ID for %s: %s\n",
> >                                map_name, error->message);
> >                       ret = false;
> > --
> > 2.37.0.170.g444d1eabd0-goog
> >
