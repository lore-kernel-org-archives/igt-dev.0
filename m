Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6056EAD6
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2020 10:25:36 +0000 (UTC)
Date: Fri, 8 May 2020 13:25:32 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200508102532.fn3eq5pnq4kj2eys@ahiler-desk1.fi.intel.com>
References: <20200506155803.358220-1-arkadiusz.hiler@intel.com>
 <20200506155803.358220-2-arkadiusz.hiler@intel.com>
 <20200507195305.GB10497@ideak-desk.fi.intel.com>
 <20200507201628.GC10497@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507201628.GC10497@ideak-desk.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_kms: Make
 igt_display_require() + chamelium more robust
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 07, 2020 at 11:16:28PM +0300, Imre Deak wrote:
> On Thu, May 07, 2020 at 10:53:05PM +0300, Imre Deak wrote:
> > On Wed, May 06, 2020 at 06:58:03PM +0300, Arkadiusz Hiler wrote:
> > > 1. We don't reset Chamelium, as this generates extra unplug events if
> > >    any of the ports is already connected which is often the case
> > > 
> > > 2. We try to plug all the chamelium ports, it's a noop if they are
> > >    already plugged
> > > 
> > > 2. We wait for all the ports being connected:
> > >    - if the port mapping is provided: wait for the ports to be connected
> > >    - if there is no mapping: sleep(10) and hope for the best
> > > 
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > Cc: Imre Deak <imre.deak@intel.com>
> > > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > > ---
> > >  lib/igt_chamelium.c | 87 +++++++++++++++++++++++++++++++++++++++------
> > >  lib/igt_chamelium.h |  2 ++
> > >  lib/igt_kms.c       |  2 ++
> > >  3 files changed, 80 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > > index 28be5248..69ad8378 100644
> > > --- a/lib/igt_chamelium.c
> > > +++ b/lib/igt_chamelium.c
> > > @@ -2532,17 +2532,6 @@ bool chamelium_plug_all(struct chamelium *chamelium)
> > >  	size_t port_count;
> > >  	int port_ids[CHAMELIUM_MAX_PORTS];
> > >  	xmlrpc_value *v;
> > > -	v = __chamelium_rpc(chamelium, NULL, "Reset", "()");
> > > -
> > > -	if (v != NULL)
> > > -		xmlrpc_DECREF(v);
> > > -
> > > -	if (chamelium->env.fault_occurred) {
> > > -		igt_debug("Chamelium RPC call failed: %s\n",
> > > -		     chamelium->env.fault_string);
> > > -
> > > -		return false;
> > > -	}
> > 
> > The reset could've been added for some stability issue in Chamelium, so
> > imo better to remove it in a separate patch.

The reset was there just to get the default EDIDs, but I think it's
worth skipping it to avoid extra unplugs. I can spin it off into a
separate patch though.

> > >  	port_count = chamelium_get_video_ports(chamelium, port_ids);
> > >  	if (port_count <= 0)
> > > @@ -2565,6 +2554,82 @@ bool chamelium_plug_all(struct chamelium *chamelium)
> > >  	return true;
> > >  }
> > >  
> > > +bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium, int drm_fd)
> > > +{
> > > +	drmModeRes *res;
> > > +	drmModeConnector *connector;
> > > +	char **group_list;
> > > +	char *group;
> > > +	bool ret = true;
> > > +
> > > +	int connectors[CHAMELIUM_MAX_PORTS];
> > > +	int connectors_count = 0;
> > > +
> > > +	res = drmModeGetResources(drm_fd);
> > > +
> > > +	group_list = g_key_file_get_groups(igt_key_file, NULL);
> > > +
> > > +	for (int i = 0; group_list[i] != NULL; i++) {
> > > +		char *map_name;
> > > +		group = group_list[i];
> > > +
> > > +		if (!strstr(group, "Chamelium:"))
> > > +			continue;
> > > +
> > > +		igt_assert(chamelium->port_count <= CHAMELIUM_MAX_PORTS);
> > > +
> > > +		map_name = group + (sizeof("Chamelium:") - 1);
> > > +
> > > +		for (int j = 0;
> > > +		     j < res->count_connectors;
> > > +		     j++) {
> > > +			char name[50];
> > > +
> > > +			connector = drmModeGetConnectorCurrent(
> > > +			    drm_fd, res->connectors[j]);
> > > +
> > > +			/* We have to generate the connector name on our own */
> > > +			snprintf(name, 50, "%s-%u",
> > > +				 kmstest_connector_type_str(connector->connector_type),
> > > +				 connector->connector_type_id);
> > > +
> > > +
> > > +			if (strcmp(name, map_name) == 0) {
> > > +				igt_assert(connectors_count < CHAMELIUM_MAX_PORTS);
> > > +				connectors[connectors_count++] = connector->connector_id;
> > > +				break;
> > > +			}
> > > +
> > > +			drmModeFreeConnector(connector);
> > > +		}
> > > +	}
> > > +
> > > +	drmModeFreeResources(res);
> > 
> > Couldn't you reuse chamelium_read_port_mappings()?

I did that first but...

1. I want to avoid calling chamelium_get_port_type() which does
   chamelium XMLRPC calls.

2. I don't to half initalize chamleium->ports

Then I have attempted to rework chamelium_read_port_mappings() to
extract a common helpers and make those things optional, but it ended up
much longer and much harder to follow than what we have here now.

> > > +	if (connectors_count == 0) {
> > > +		igt_info("No chamelium port mappping, sleeping for %d seconds "
> > > +			 "for the hotplug to take effect",
> > > +			 CHAMELIUM_HOTPLUG_DETECTION_DELAY);
> > > +		sleep(CHAMELIUM_HOTPLUG_DETECTION_DELAY);
> > > +		return true;
> > > +	}
> > 
> > In igt_chamlium this makes the startup delay 20 sec now with the
> > detection delay added in the previous patch.
> > 
> > Would it make sense to change autodiscover to retry detection for 10 sec
> > instead, which you could call from here? Then you could also call
> > autodiscover without the unconditional sleep in the previous patch.
> 
> Ah that wouldn't work, since we don't know how many connectors to wait
> for:/ But I'd avoid doing twice the detection delay, for instance by
> removing it from the previous patch, since chamelium_init() is always
> called after igt_display_require().

They play two different roles.

In igt_display_require() we just plug the ports for the sake of
non-chamelium tests.

In chamelium's discovery we are resetting the state, setting up custom
EDIDs, etc.

We cannot use connectors considered by igt_display_require() as
connected for the sake of autodiscovery - we still need a hard sleep()
there as we may not get the updated state/EDID immediately with TypeC.

We could create something like this though:

extern const bool __igt_chamelium_test = false;
#define IGT_CHAMELIUM_TEST __igt_chamelium_test = true

and then skip the wait in igt_display_require() basing on the contents.

IMO that feels too hacky, and I am more keen on with making the
autodiscovery annoyingly long to incentivize people to put the snippet
kms_chamelium is printing out in their .igtrc.


-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
