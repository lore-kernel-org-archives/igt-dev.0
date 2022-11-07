Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B3C10E2F5
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 11:21:37 +0000 (UTC)
Date: Mon, 7 Nov 2022 13:21:40 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <Y2jqREPjsnv/8yoY@platvala-desk.ger.corp.intel.com>
References: <20221104184850.742606-1-alex.hung@amd.com>
 <CAJUqKUpHA2spA1ibU9e-WUMZK9iSs25estZPk52aqrva6Dmx_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJUqKUpHA2spA1ibU9e-WUMZK9iSs25estZPk52aqrva6Dmx_Q@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] kms_chamelium: fix a compile warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 04, 2022 at 03:35:14PM -0400, Mark Yacoub wrote:
> On Fri, Nov 4, 2022 at 2:49 PM Alex Hung <alex.hung@amd.com> wrote:
> >
> > Fix the following warning:
> >
> > ../tests/chamelium/kms_chamelium.c: In function ‘edid_stress_resolution’:
> > ../tests/chamelium/kms_chamelium.c:2570:31: warning: declaration of ‘monitor_edid’ shadows a global declaration [-Wshadow]
> >  2570 |                 monitor_edid *monitor_edid = &edids_list[i];
> >       |                               ^~~~~~~~~~~~
> > In file included from ../lib/monitor_edids/dp_edids.h:15,
> >                  from ../tests/chamelium/kms_chamelium.c:33:
> > ../lib/monitor_edids/monitor_edids_helper.h:25:3: note: shadowed declaration is here
> >    25 | } monitor_edid;
> >       |   ^~~~~~~~~~~~
> >
> > Fixes: 6a25c536 (kms_chamelium: Add new EDID stress resolution test)
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Mark Yacoub <markyacoub@chromium.org>

Merged, thanks for the fix!


-- 
Petri Latvala



> > ---
> >  tests/chamelium/kms_chamelium.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
> > index c824e67e..09839f98 100644
> > --- a/tests/chamelium/kms_chamelium.c
> > +++ b/tests/chamelium/kms_chamelium.c
> > @@ -2567,13 +2567,13 @@ static void edid_stress_resolution(data_t *data, struct chamelium_port *port,
> >                 bool is_video_stable;
> >                 int screen_res_w, screen_res_h;
> >
> > -               monitor_edid *monitor_edid = &edids_list[i];
> > +               monitor_edid *edid = &edids_list[i];
> >                 igt_info("Testing out the EDID for %s\n",
> > -                        monitor_edid_get_name(monitor_edid));
> > +                        monitor_edid_get_name(edid));
> >
> >                 /* Getting and Setting the EDID on Chamelium. */
> >                 chamelium_edid = get_chameleon_edid_from_monitor_edid(
> > -                       chamelium, monitor_edid);
> > +                       chamelium, edid);
> >                 chamelium_port_set_edid(data->chamelium, port, chamelium_edid);
> >                 free_chamelium_edid_from_monitor_edid(chamelium_edid);
> >
> > --
> > 2.34.1
> >
