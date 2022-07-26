Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452D518B073
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 23:26:32 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id
 v6-20020ac87486000000b0031ee0ae1400so8311588qtq.14
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 16:26:30 -0700 (PDT)
Message-ID: <1a809602f7e0de441abd84633f1bb1cc612b2fa3.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Mark Yacoub <markyacoub@chromium.org>, igt-dev@lists.freedesktop.org
Date: Tue, 26 Jul 2022 19:26:27 -0400
In-Reply-To: <20220720151940.12723-1-markyacoub@chromium.org>
References: <20220720151940.12723-1-markyacoub@chromium.org>
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
Cc: robdclark@chromium.org, petri.latvala@intel.com, amstan@chromium.org,
 seanpaul@chromium.org, ihf@google.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To make sure I'm understanding this code correctly: it seems like we're
looking for a downstream MST port by just checking to see if there's an
identically named port connected?

That's unfortunately not very reliable because connector names can change as
well, although the names of connectors that are built into the system
shouldn't. What we could -possibly- do is go through connector's path
properties, and see if they match the previous connector props of the MST
port.

If this isn't good enough still, then we probably should add a better
connector prop to the kernel then the path prop - preferably one that uses a
format like this:

${CONN_NAME}-${MST_RAD}

On Wed, 2022-07-20 at 11:19 -0400, Mark Yacoub wrote:
> [Why]
> On unplug, a lone MST connector can become invalid and disappear from
> the list of DRM connectors.
> When this happens, we can't check for the connector ID as it's no longer
> there to check.
> Hence, a connector disappearance indicates a disconnect.
> 
> Furthermore, on a replug, the connector ID can change as well. The only
> thing that remains unchageable is the connector name.
> 
> [How]
> Do not check for connector connetion state using the connector ID.
> Iterate through the current connectors and match with the name.
> If a connector disappeared, this means it's now disconnected.
> If it's there, return its connection status.
> Update the port connector ID with the current connector ID in case it
> changed on a replug.
> 
> Tested on Volteer with Chamelium V3 connected via a 2-DP-port CableMatters
> hub.
> Test: kms_chamelium --run-subtest dp-hpd
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/igt_chamelium.c | 52 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 45 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index d78ddd61..b5e9bbfd 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -266,21 +266,59 @@ chamelium_reprobe_connector(igt_display_t *display,
>                             struct chamelium_port *port)
>  {
>         drmModeConnector *connector;
> -       drmModeConnection status;
> +       drmModeConnection connection_status;
>         igt_output_t *output;
> +       drmModeRes* res = drmModeGetResources(display->drm_fd);
> +       bool is_connector_found = false;
> +       int i;
>  
>         igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
> -       connector = chamelium_port_get_connector(chamelium, port, true);
> +       for (i = 0; i < res->count_connectors; ++i) {
> +               connector = drmModeGetConnector(display->drm_fd, res-
> >connectors[i]);
> +               /* If the connector is MST and is now unplugged, the spawned
> connectors will no
> +                  longer be available but can still be counted as part of
> res->count_connectors */
> +               if (!connector) {
> +                       drmModeFreeConnector(connector);
> +                       connector = NULL;
> +                       continue;
> +               }
> +
> +               char connector_name[50];
> +               snprintf(connector_name, 50, "%s-%u",
> +                       kmstest_connector_type_str(connector-
> >connector_type),
> +                       connector->connector_type_id);
> +               if (strcmp(connector_name, port->name) == 0) {
> +                       is_connector_found = true;
> +                       break;
> +               }
> +
> +               drmModeFreeConnector(connector);
> +               connector = NULL;
> +       }
> +       drmModeFreeResources(res);
> +
> +       if (!is_connector_found) {
> +               igt_debug("Connector is not found. This indicates it's
> disconnected.\n");
> +               igt_assert(!connector);
> +               return DRM_MODE_DISCONNECTED;
> +       }
> +
>         igt_assert(connector);
> -       status = connector->connection;
> +       connection_status = connector->connection;
>  
> -       /* let's make sure that igt_display is up to date too */
> +       /* If we still have a connector, let's make sure that igt_display
> and the port are up to date too */
>         output = igt_output_from_connector(display, connector);
> -       output->force_reprobe = true;
> -       igt_output_refresh(output);
> +       if (output) {
> +               output->force_reprobe = true;
> +               igt_output_refresh(output);
> +       }
> +
> +       /* If the topology of the connector is MST, the connector ID could
> have changed. Update the
> +          chamelium port to the current connector ID. */
> +       port->connector_id = connector->connector_id;
>  
>         drmModeFreeConnector(connector);
> -       return status;
> +       return connection_status;
>  }
>  
>  /**

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
