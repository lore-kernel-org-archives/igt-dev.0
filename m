Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B046E379
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2020 08:38:12 +0000 (UTC)
Date: Wed, 16 Sep 2020 11:38:07 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200916083807.GY7444@platvala-desk.ger.corp.intel.com>
References: <20200915195614.7618-1-abhinavk@codeaurora.org>
 <20200915195614.7618-3-abhinavk@codeaurora.org>
 <20200916081403.GX7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916081403.GX7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/5] lib/igt_kms: move some of the
 useful dump functions to igt_kms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: igt-dev@lists.freedesktop.org, tanmay@codeaurora.org, swboyd@chromium.org, khsieh@codeaurora.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 11:14:03AM +0300, Petri Latvala wrote:
> On Tue, Sep 15, 2020 at 12:56:11PM -0700, Abhinav Kumar wrote:
> > Some of the functions inside the intel_dp_compliance are
> > generic and can be used by other modules as well. Move these
> > to the igt_kms lib.
> > =

> > changes in v2:
> > 	- add more documentation for the new APIs in the lib
> > =

> > Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> > ---
> >  lib/igt_kms.c               | 92 +++++++++++++++++++++++++++++++++++++
> >  lib/igt_kms.h               | 22 +++++++++
> >  tools/intel_dp_compliance.c | 92 +------------------------------------
> >  3 files changed, 116 insertions(+), 90 deletions(-)
> > =

> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 7cf2008e..be34d07b 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -1,4 +1,5 @@
> >  /*
> > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> >   * Copyright =A9 2013 Intel Corporation
> >   *
> >   * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > @@ -4778,3 +4779,94 @@ uint32_t igt_reduce_format(uint32_t format)
> >  		return format;
> >  	}
> >  }
> > +
> > +void igt_dump_connectors_fd(int drmfd)
> > +{
> > +	int i, j;
> > +
> > +	drmModeRes *mode_resources =3D drmModeGetResources(drmfd);
> > +
> > +	if (!mode_resources) {
> > +		igt_warn("drmModeGetResources failed: %s\n", strerror(errno));
> > +		return;
> > +	}
> > +
> > +	igt_info("Connectors:\n");
> > +	igt_info("id\tencoder\tstatus\t\ttype\tsize (mm)\tmodes\n");
> > +	for (i =3D 0; i < mode_resources->count_connectors; i++) {
> > +		drmModeConnector *connector;
> > +
> > +		connector =3D drmModeGetConnectorCurrent(drmfd,
> > +				mode_resources->connectors[i]);
> > +		if (!connector) {
> > +			igt_warn("Could not get connector %i: %s\n",
> > +				 mode_resources->connectors[i],
> > +				 strerror(errno));
> > +			continue;
> > +		}
> > +
> > +		igt_info("%d\t%d\t%s\t%s\t%dx%d\t\t%d\n",
> > +			 connector->connector_id,
> > +			 connector->encoder_id,
> > +			 kmstest_connector_status_str(connector->connection),
> > +			 kmstest_connector_type_str(connector->connector_type),
> > +			 connector->mmWidth,
> > +			 connector->mmHeight,
> > +			 connector->count_modes);
> > +
> > +		if (!connector->count_modes)
> > +			continue;
> > +
> > +		igt_info("  Modes:\n");
> > +		igt_info("  name refresh (Hz) hdisp hss hse htot vdisp ""vss vse vto=
t flags type clock\n");
> > +		for (j =3D 0; j < connector->count_modes; j++) {
> > +			igt_info("[%d]", j);
> > +			kmstest_dump_mode(&connector->modes[j]);
> > +		}
> > +
> > +		drmModeFreeConnector(connector);
> > +	}
> > +	igt_info("\n");
> > +
> > +	drmModeFreeResources(mode_resources);
> > +}
> > +
> > +void igt_dump_crtcs_fd(int drmfd)
> > +{
> > +	int i;
> > +	drmModeRes *mode_resources;
> > +
> > +	mode_resources =3D drmModeGetResources(drmfd);
> > +	if (!mode_resources) {
> > +		igt_warn("drmModeGetResources failed: %s\n", strerror(errno));
> > +		return;
> > +	}
> > +
> > +	igt_info("CRTCs:\n");
> > +	igt_info("id\tfb\tpos\tsize\n");
> > +	for (i =3D 0; i < mode_resources->count_crtcs; i++) {
> > +		drmModeCrtc *crtc;
> > +
> > +		crtc =3D drmModeGetCrtc(drmfd, mode_resources->crtcs[i]);
> > +		if (!crtc) {
> > +			igt_warn("Could not get crtc %i: %s\n",
> > +					mode_resources->crtcs[i],
> > +					strerror(errno));
> > +			continue;
> > +		}
> > +		igt_info("%d\t%d\t(%d,%d)\t(%dx%d)\n",
> > +			 crtc->crtc_id,
> > +			 crtc->buffer_id,
> > +			 crtc->x,
> > +			 crtc->y,
> > +			 crtc->width,
> > +			 crtc->height);
> > +
> > +		kmstest_dump_mode(&crtc->mode);
> > +
> > +		drmModeFreeCrtc(crtc);
> > +	}
> > +	igt_info("\n");
> > +
> > +	drmModeFreeResources(mode_resources);
> > +}
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 45da6bf6..cf03c721 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -1,4 +1,5 @@
> >  /*
> > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> >   * Copyright =A9 2013 Intel Corporation
> >   *
> >   * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > @@ -874,6 +875,7 @@ int igt_connector_sysfs_open(int drm_fd,
> >  			     drmModeConnector *connector);
> >  uint32_t igt_reduce_format(uint32_t format);
> >  =

> > +
> >  /*
> >   * igt_require_pipe:
> >   * @display: pointer to igt_display_t
> > @@ -887,4 +889,24 @@ uint32_t igt_reduce_format(uint32_t format);
> >  void igt_require_pipe(igt_display_t *display,
> >  		enum pipe pipe);
> >  =

> > +/**
> > + * igt_dump_connectors_fd:
> > + * @drmfd: handle to open drm device.
> > + *
> > + * Iterates through list of connectors and
> > + * dumps their list of modes.
> > + *
> > + */
> > +void igt_dump_connectors_fd(int drmfd);
> > +
> > +/**
> > + * igt_dump_crtcs_fd:
> > + * @drmfd: handle to open drm device.
> > + *
> > + * Iterates through the list of crtcs and
> > + * dumps out the mode and basic information
> > + * for each of them.
> > + */
> > +void igt_dump_crtcs_fd(int drmfd);
> =

> Docs look good, but function documentation goes with the definition,
> not the declaration. In other words, these should be in igt_kms.c
> instead. I'll move them when merging.

Merged, thanks for the patches!


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
