Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A383D10E569
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Oct 2022 12:50:47 +0000 (UTC)
From: maxime@cerno.tech
Date: Mon, 24 Oct 2022 14:43:23 +0200
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20221024124323.tfyxcadyd4nz56jz@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2dmxmodhjaajdztg"
Content-Disposition: inline
Subject: [igt-dev] Must-Pass Test Suite for KMS drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Martin Roukala <martin.roukala@mupuf.org>, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--2dmxmodhjaajdztg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've discussing the idea for the past year to add an IGT test suite that
all well-behaved KMS drivers must pass.

The main idea behind it comes from v4l2-compliance and cec-compliance,
that are being used to validate that the drivers are sane.

We should probably start building up the test list, and eventually
mandate that all tests pass for all the new KMS drivers we would merge
in the kernel, and be run by KCi or similar.

I did a first pass to create a draft of such a test-suite, which would
contain:

igt@core_auth@basic-auth
igt@core_auth@getclient-master-drop
igt@core_auth@getclient-simple
igt@core_auth@many-magics
igt@core_getclient
igt@core_getstats
igt@core_getversion
igt@core_hotunplug@hotrebind-lateclose
igt@core_hotunplug@hotunbind-rebind
igt@core_hotunplug@unbind-rebind
igt@core_setmaster
igt@core_setmaster_vs_auth
igt@device_reset@unbind-reset-rebind
igt@drm_read
igt@dumb_buffer
igt@fbdev
igt@feature_discovery@display
igt@kms_3d
igt@kms_addfb_basic
igt@kms_async_flips
igt@kms_color
igt@kms_concurrent
igt@kms_cursor_crc
igt@kms_cursor_edge_walk
igt@kms_cursor_legacy@basic-busy-flip-before-cursor
igt@kms_cursor_legacy@basic-flip-after-cursor
igt@kms_cursor_legacy@basic-flip-after-cursor
igt@kms_display_modes
igt@kms_dither
igt@kms_dp_aux_dev
igt@kms_flip@basic-flip-vs-dpms
igt@kms_flip@basic-flip-vs-modeset
igt@kms_flip@basic-flip-vs-wf_vblank
igt@kms_flip@basic-plain-flip
igt@kms_flip_event_leak@basic
igt@kms_force_connector_basic@force-connector-state
igt@kms_force_connector_basic@force-edid
igt@kms_force_connector_basic@force-load-detect
igt@kms_force_connector_basic@prune-stale-modes
igt@kms_getfb
igt@kms_hdmi_inject
igt@kms_hdr
igt@kms_invalid_mode
igt@kms_lease
igt@kms_panel_fitting
igt@kms_pipe_crc_basic
igt@kms_plane_alpha_blend
igt@kms_plane
igt@kms_plane_cursor
igt@kms_plane_lowres
igt@kms_plane_multiple
igt@kms_plane_scaling
igt@kms_prop_blob
igt@kms_properties
igt@kms_rmfb
igt@kms_scaling_modes
igt@kms_sequence
igt@kms_setmode
igt@kms_sysfs_edid_timing
igt@kms_tv_load_detect
igt@kms_universal_plane
igt@kms_vblank
igt@kms_vrr
igt@kms_writeback

Most of them are skipped on vc4 right now, but I could see that some of
them fail already (kms_rmfb, core_hotunplug), so it proves to be useful
already.

What do you think? Is there some more tests needed, or did I include
some tests that shouldn't have been there?

Thanks!
Maxime

--2dmxmodhjaajdztg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1aIawAKCRDj7w1vZxhR
xaG/AQCQB4q4ubcOyjczAsYRbONVmM5omzkz0TOL8W0auwZzAgEAmoIby8HLuxgq
Etd9UuxGcj0qeLCETV9ql9OddgrMdgQ=
=g52/
-----END PGP SIGNATURE-----

--2dmxmodhjaajdztg--
