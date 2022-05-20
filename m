Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B611D10E1A3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 10:01:18 +0000 (UTC)
Date: Fri, 20 May 2022 12:58:56 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Message-ID: <YodmYCPoBTxre6sr@platvala-desk.ger.corp.intel.com>
References: <20220518112308.79136-1-ryszard.knop@intel.com>
 <YoYpKbjCCKZWC0cL@platvala-desk.ger.corp.intel.com>
 <40c24e9f2cc06a973cb3d06f69b888c677b36e54.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40c24e9f2cc06a973cb3d06f69b888c677b36e54.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Check if port
 adapters are in use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 20, 2022 at 12:30:02PM +0300, Knop, Ryszard wrote:
> On Thu, 2022-05-19 at 14:25 +0300, Petri Latvala wrote:
> > On Wed, May 18, 2022 at 01:23:08PM +0200, Ryszard Knop wrote:
> > > If a DUT has Chamelium ports connected via an adapter (for example,
> > > DP
> > > on the Chamelium side -> DP-HDMI adapter -> HDMI on the DUT), this
> > > will
> > > usually cause many tests to fail. If mismatching port types are
> > > found
> > > on both sides, the tests will now be aborted with a warning.
> > >
> > > This behavior can be overridden with a new AdapterAllowed config
> > > value,
> > > which must be set in [Chamelium:PORT] blocks in .igtrc.
> >
> > Your signed-off-by is missing.
> 
> Oops, that's right, will re-send v2 with that.
> 
> 
> > > ---
> > >  docs/chamelium.txt  | 18 ++++++++++++++----
> > >  lib/igt_chamelium.c | 35 +++++++++++++++++++++++++++++++++++
> > >  2 files changed, 49 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/docs/chamelium.txt b/docs/chamelium.txt
> > > index 32c296f7..7484a3f8 100644
> > > --- a/docs/chamelium.txt
> > > +++ b/docs/chamelium.txt
> > > @@ -94,7 +94,8 @@ example (only Chamelium.URL is mandatory):
> > >      URL=http://192.168.1.2:9992
> > >
> > >      # The rest of the sections are used for defining connector
> > > mappings. This
> > > -    # is optional, the mappings will be discovered automatically.
> > > +    # is optional if the same connector type (ex. DP-DP) is used
> > > on both sides,
> > > +    # the mappings will be discovered automatically.
> > >
> > >      # The name of the DRM connector
> > >      # The DP-1 of [Chamelium:DP-1] and the HDMI-A-1 of
> > > [Chamelium:HDMI-A-1] indicate
> > > @@ -102,13 +103,22 @@ example (only Chamelium.URL is mandatory):
> > >      [Chamelium:DP-1]
> > >      # The ChameliumPortID indicates physical port (device) id of a
> > > Chamelium Board.
> > >      # A Chamelium daemon program defines these port ids as
> > > -    # DP1 (located next to the HDMI port) = 1
> > > -    # DP2 (located next to the VGA connector) = 2
> > > -    # HDMI = 3 and VGA = 4
> > > +    # - DP1 (located next to the HDMI port) = 1
> > > +    # - DP2 (located next to the VGA connector) = 2
> > > +    # - HDMI = 3
> > > +    # - VGA = 4
> > >      # The port ids are defined at:
> > >      #
> > > https://chromium.googlesource.com/chromiumos/platform/chameleon/+/master/chameleond/utils/ids.py
> > >      ChameliumPortID=1
> > >
> > > +    [Chamelium:HDMI-A-1]
> > > +    # Notice that the DRM side has HDMI, but Chamelium has DP on
> > > port 2.
> > > +    # This is possible via an HDMI-DP adapter, but such scenarios
> > > often cause
> > > +    # issues, so by default we fail if mismatching connector types
> > > are found.
> > > +    # If AdapterAllowed is set to 1, the tests will proceed with a
> > > warning.
> > > +    ChameliumPortID=2
> > > +    AdapterAllowed=1
> > > +
> > >      [Chamelium:HDMI-A-2]
> > >      ChameliumPortID=3
> > >
> > > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > > index b4d838bb..55cbfa12 100644
> > > --- a/lib/igt_chamelium.c
> > > +++ b/lib/igt_chamelium.c
> > > @@ -26,6 +26,7 @@
> > >
> > >  #include "config.h"
> > >
> > > +#include <stdbool.h>
> > >  #include <string.h>
> > >  #include <errno.h>
> > >  #include <math.h>
> > > @@ -103,6 +104,7 @@ struct chamelium_port {
> > >         int id;
> > >         int connector_id;
> > >         char *name;
> > > +       bool adapter_allowed;
> > >  };
> > >
> > >  struct chamelium_frame_dump {
> > > @@ -2324,6 +2326,9 @@ static bool
> > > chamelium_read_port_mappings(struct chamelium *chamelium,
> > >                         goto out;
> > >                 }
> > >
> > > +               port->adapter_allowed =
> > > g_key_file_get_boolean(igt_key_file, group,
> > > +
> > > "AdapterAllowed", &error);
> > > +
> > >                 for (j = 0;
> > >                      j < res->count_connectors && !port-
> > > >connector_id;
> > >                      j++) {
> > > @@ -2557,6 +2562,7 @@ static bool chamelium_autodiscover(struct
> > > chamelium *chamelium, int drm_fd)
> > >                 port->id = port_id;
> > >                 port->type = chamelium_get_port_type(chamelium,
> > > port);
> > >                 port->connector_id = conn_id;
> > > +               port->adapter_allowed = false;
> > >
> > >                 connector = drmModeGetConnectorCurrent(drm_fd,
> > > conn_id);
> > >                 snprintf(conn_name, sizeof(conn_name), "%s-%u",
> > > @@ -2703,6 +2709,7 @@ error:
> > >  struct chamelium *chamelium_init(int drm_fd)
> > >  {
> > >         struct chamelium *chamelium = chamelium_init_rpc_only();
> > > +       bool mismatching_ports_found = false;
> > >
> > >         if (chamelium == NULL)
> > >                 return NULL;
> > > @@ -2734,9 +2741,37 @@ struct chamelium *chamelium_init(int drm_fd)
> > >                 }
> > >         }
> > >
> > > +       for (int i = 0; i < chamelium->port_count; i++) {
> > > +               bool type_mismatch = false;
> > > +               struct chamelium_port * port = &chamelium-
> > > >ports[i];
> > > +               drmModeConnectorPtr connector =
> > > +                       drmModeGetConnectorCurrent(drm_fd, port-
> > > >connector_id);
> > > +
> > > +               igt_assert(connector != NULL);
> > > +
> > > +               type_mismatch = port->type != connector-
> > > >connector_type;
> > > +
> > > +               if (type_mismatch)
> > > +                       igt_info("Chamelium port %d is %s, but the
> > > DRM connector is %s\n",
> > > +                                port->id,
> > > kmstest_connector_type_str(port->type),
> > > +
> > > kmstest_connector_type_str(connector->connector_type));
> > > +
> > > +               if (type_mismatch && !port->adapter_allowed)
> > > +                       mismatching_ports_found = true;
> > > +
> > > +               drmModeFreeConnector(connector);
> > > +       }
> > > +
> > >         cleanup_instance = chamelium;
> > >         igt_install_exit_handler(chamelium_exit_handler);
> > >
> > > +       igt_abort_on_f(mismatching_ports_found,
> > > +                      "Chamelium port(s) with mismatching
> > > connector type on the "
> > > +                      "DRM side found - this will most likely
> > > cause test failures. "
> > > +                      "If you want to proceed with this this
> > > configuration, set the "
> > > +                      "port mapping manually in .igtrc with
> > > AdapterAllowed=1. See "
> > > +                      "docs/chamelium.txt for more
> > > information.\n");
> >
> > This abort should probably be before the exit handler installation
> > above.
> 
> The exit handler basically runs the same cleanup as the error handler,
> but also plugs in ports that could be left in a wonky state after
> autodetection and destroys allocated EDIDs. Would it not be better to
> still run that?

The system is already in a funky state for testing if we decide to
abort here. Although some level of support is good for setups that
don't want to reboot right after an abort... Alright, keep the abort
where it is now.


-- 
Petri Latvala
