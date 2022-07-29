Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198F210E12A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 13:16:45 +0000 (UTC)
Date: Fri, 29 Jul 2022 16:15:21 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Alexandru M Stan <amstan@chromium.org>
Message-ID: <YuPdaT6wKtn2UtnZ@platvala-desk.ger.corp.intel.com>
References: <20220715192200.1782193-1-markyacoub@chromium.org>
 <CAHNYxRy1txH-VKyt3+ONanP5Dvnznkd-aWERPDHRQKa1oF9J9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHNYxRy1txH-VKyt3+ONanP5Dvnznkd-aWERPDHRQKa1oF9J9Q@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] lib/igt_chamelium: Extend check of valid
 ports to port=0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, Ilja Friedel <ihf@google.com>,
 igt-dev@lists.freedesktop.org, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@google.com>, khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 03:29:49PM -0400, Alexandru M Stan wrote:
> On Fri, Jul 15, 2022 at 3:22 PM Mark Yacoub <markyacoub@chromium.org> wrote:
> >
> > [Why]
> > Chamelium V3 has a valid port at 0 so 0 should not be rejected.
> 
> Can confirm, nowhere in the API specifications does it say port_id==0
> is invalid and I have started using 0 on v3 since they're just indexes
> in my internal chameleond ports array, so they start at 0.
> 
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
> >                 port->id = g_key_file_get_integer(igt_key_file, group,
> >                                                   "ChameliumPortID",
> >                                                   &error);
> > -               if (!port->id) {
> > +               if (port->id < 0 || port->id > CHAMELIUM_MAX_PORTS) {
> 
> CHAMELIUM_MAX_PORTS seems to be #defined to 4 in another file. That
> looks a little wrong.

It's documented as "the maximum number of ports supported by
igt_chamelium".

IGT's usage of port ids are from
https://chromium.googlesource.com/chromiumos/platform/chameleon/+/master/chameleond/utils/ids.py,
for the record.


-- 
Petri Latvala


> 
> I would do an RPC call for .GetSupportedPorts() to get the exact valid
> set of port_ids instead of relying on a range. You might have some
> invalid ones in there if you do it this way (no plans to do such gaps,
> but again the API does not really specify).
> 
> >                         igt_warn("Failed to read chamelium port ID for %s: %s\n",
> >                                  map_name, error->message);
> >                         ret = false;
> > --
> > 2.37.0.170.g444d1eabd0-goog
> >
> 
> Alexandru Stan (amstan)
