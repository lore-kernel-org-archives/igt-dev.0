Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49FA8EF73
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 20:03:41 +0000 (UTC)
Received: by mail-qv1-f70.google.com with SMTP id
 op9-20020a056214458900b00475a72eeb4dso3172480qvb.11
 for <igt-dev@lists.freedesktop.org>; Mon, 01 Aug 2022 13:03:39 -0700 (PDT)
Message-ID: <a5774d21c116425d5328da5eca82a7e573225607.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 01 Aug 2022 16:03:35 -0400
In-Reply-To: <CAJUqKUopDdGowFdmx2+ev9Fo+GrbmUffyn8GfqHYsiG92-dqHw@mail.gmail.com>
References: <20220720151940.12723-1-markyacoub@chromium.org>
 <1a809602f7e0de441abd84633f1bb1cc612b2fa3.camel@redhat.com>
 <CAJUqKUopDdGowFdmx2+ev9Fo+GrbmUffyn8GfqHYsiG92-dqHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH] lib/chamelium: Support MST connectors on
 reprobe by using connector name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com, markyacoub@google.com,
 igt-dev@lists.freedesktop.org, seanpaul@chromium.org, ihf@google.com,
 khaled.almahallawy@intel.com, amstan@chromium.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2022-07-27 at 15:37 -0400, Mark Yacoub wrote:
> On Tue, Jul 26, 2022 at 7:26 PM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > To make sure I'm understanding this code correctly: it seems like we're
> > looking for a downstream MST port by just checking to see if there's an
> > identically named port connected?
> So, what's happening here is that the DUT and Chamelium are required
> to be in static condition, meaning the same ports are always connected
> at all times.
> Before we run any chamelium test, we set up the igt config and
> specifically match the connected ports as shown in this doc:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/1b5f7f139660ac27f3c8b4c4a2d23fdd9430ccab/docs/chamelium.txt#L112
> Through my testing, i saw that even when the connectors were unplugged
> and disappeared, the connector name assigned in igtrc remained the
> same, hence my assumption.
> Given this situation, let me know if my assumption can still hold true.

Heads up: when I say "real connector" here I mean "a physical connector
directly on the DUT", and when I say "port connectors" I mean any connector in
an MST topology.

Anyway - that assumption doesn't hold true unfortunately. Connector names are
totally arbitrary and can change based on the order in which the connectors
are created, which could change due to any number of factors out of our
control. For instance, if one MST hub doesn't have a consistent time between
power on and being available for probing in the topology - you might observe
the name for that port connector changing between reprobes.

Real connectors on the other hand, should mostly* have the same connector name
since they're always present on the system. Since those names are consistent
enough, what you need to do in order to distinguish different port connectors
is to use the PATH property on the connector in order to figure out the actual
real connector the port connector is on along with the RAD (relative address,
e.g. the actual hardware address used to refer to the branch connector). If a
connector has the same RAD as a previous connector, then they're guaranteed to
be the same connector. And since the RAD is determined by a branch's location
in the topology, it'll remain consistent.

* I said mostly because I _THINK_ this assumption may not hold true in certain
situations when it comes to laptops with multiple GPUs being probed in a
inconsistent order. You're probably not dealing with that though, so feel free
to ignore this tidbit :).

> > 
> > That's unfortunately not very reliable because connector names can change
> > as
> > well, although the names of connectors that are built into the system
> > shouldn't. What we could -possibly- do is go through connector's path
> > properties, and see if they match the previous connector props of the MST
> > port.
> > 
> > If this isn't good enough still, then we probably should add a better
> > connector prop to the kernel then the path prop - preferably one that uses
> > a
> > format like this:
> > 
> > ${CONN_NAME}-${MST_RAD}
> > 
> > On Wed, 2022-07-20 at 11:19 -0400, Mark Yacoub wrote:
> > > [Why]
> > > On unplug, a lone MST connector can become invalid and disappear from
> > > the list of DRM connectors.
> > > When this happens, we can't check for the connector ID as it's no longer
> > > there to check.
> > > Hence, a connector disappearance indicates a disconnect.
> > > 
> > > Furthermore, on a replug, the connector ID can change as well. The only
> > > thing that remains unchageable is the connector name.
> > > 
> > > [How]
> > > Do not check for connector connetion state using the connector ID.
> > > Iterate through the current connectors and match with the name.
> > > If a connector disappeared, this means it's now disconnected.
> > > If it's there, return its connection status.
> > > Update the port connector ID with the current connector ID in case it
> > > changed on a replug.
> > > 
> > > Tested on Volteer with Chamelium V3 connected via a 2-DP-port
> > > CableMatters
> > > hub.
> > > Test: kms_chamelium --run-subtest dp-hpd
> > > 
> > > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > > ---
> > >  lib/igt_chamelium.c | 52 +++++++++++++++++++++++++++++++++++++++------
> > >  1 file changed, 45 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > > index d78ddd61..b5e9bbfd 100644
> > > --- a/lib/igt_chamelium.c
> > > +++ b/lib/igt_chamelium.c
> > > @@ -266,21 +266,59 @@ chamelium_reprobe_connector(igt_display_t
> > > *display,
> > >                             struct chamelium_port *port)
> > >  {
> > >         drmModeConnector *connector;
> > > -       drmModeConnection status;
> > > +       drmModeConnection connection_status;
> > >         igt_output_t *output;
> > > +       drmModeRes* res = drmModeGetResources(display->drm_fd);
> > > +       bool is_connector_found = false;
> > > +       int i;
> > > 
> > >         igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
> > > -       connector = chamelium_port_get_connector(chamelium, port, true);
> > > +       for (i = 0; i < res->count_connectors; ++i) {
> > > +               connector = drmModeGetConnector(display->drm_fd, res-
> > > > connectors[i]);
> > > +               /* If the connector is MST and is now unplugged, the
> > > spawned
> > > connectors will no
> > > +                  longer be available but can still be counted as part
> > > of
> > > res->count_connectors */
> > > +               if (!connector) {
> > > +                       drmModeFreeConnector(connector);
> > > +                       connector = NULL;
> > > +                       continue;
> > > +               }
> > > +
> > > +               char connector_name[50];
> > > +               snprintf(connector_name, 50, "%s-%u",
> > > +                       kmstest_connector_type_str(connector-
> > > > connector_type),
> > > +                       connector->connector_type_id);
> > > +               if (strcmp(connector_name, port->name) == 0) {
> > > +                       is_connector_found = true;
> > > +                       break;
> > > +               }
> > > +
> > > +               drmModeFreeConnector(connector);
> > > +               connector = NULL;
> > > +       }
> > > +       drmModeFreeResources(res);
> > > +
> > > +       if (!is_connector_found) {
> > > +               igt_debug("Connector is not found. This indicates it's
> > > disconnected.\n");
> > > +               igt_assert(!connector);
> > > +               return DRM_MODE_DISCONNECTED;
> > > +       }
> > > +
> > >         igt_assert(connector);
> > > -       status = connector->connection;
> > > +       connection_status = connector->connection;
> > > 
> > > -       /* let's make sure that igt_display is up to date too */
> > > +       /* If we still have a connector, let's make sure that
> > > igt_display
> > > and the port are up to date too */
> > >         output = igt_output_from_connector(display, connector);
> > > -       output->force_reprobe = true;
> > > -       igt_output_refresh(output);
> > > +       if (output) {
> > > +               output->force_reprobe = true;
> > > +               igt_output_refresh(output);
> > > +       }
> > > +
> > > +       /* If the topology of the connector is MST, the connector ID
> > > could
> > > have changed. Update the
> > > +          chamelium port to the current connector ID. */
> > > +       port->connector_id = connector->connector_id;
> > > 
> > >         drmModeFreeConnector(connector);
> > > -       return status;
> > > +       return connection_status;
> > >  }
> > > 
> > >  /**
> > 
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
