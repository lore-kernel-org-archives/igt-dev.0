Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40673D5C0EF
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 15:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F029410E9EE;
	Fri,  8 Nov 2024 15:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gCBjc3ip";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479F610E9EE
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 15:23:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFE761C0005;
 Fri,  8 Nov 2024 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731079419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m9haf7na+jnKRh8Nd2LMzBYFnEZCBlUZSMyUTbL1WrQ=;
 b=gCBjc3ipfhsoKpJ9cC7SeYhbfLa0HJsJBnG3w9rg3pU/c4CS1iGsbs0Tsjh2dZglFBHoij
 fXKmvdpsC6sEgvqhKXdT+Wv/XlOlBL9Rj7k9Bc1/CqUXt/9eh3aI+ztj2eNDuoMPVPDdev
 D9N0BftpNwriwMTpV3WUAq1QM+fy9rmfih3n//R2zEP8M+nzb7ofvEKQeuWxTui0Osd8UF
 XdoYTuVa+g25YYXt+LmSE0fS9AOyiCUFtpnye1vAxr8D5rhNSVtD7vExdZxv91f8PxOOGH
 a7hDAukVOduFddJmfBTUDY3ec+o1dQEXneOozf9zckF1CDhXbnoed1uQLtkBCA==
Date: Fri, 8 Nov 2024 16:23:37 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 4/5] lib/igt_kms: Add helper to obtain a
 connector by its name or MST path
Message-ID: <Zy4s-WgVEx4fJ3qN@fedora>
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
 <20241022-b4-cv3-01-igt-kms-v2-4-8f654694b513@bootlin.com>
 <20241106142456.ts3ukhf5aviqc2yn@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106142456.ts3ukhf5aviqc2yn@kamilkon-desk.igk.intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On 06/11/24 - 15:24, Kamil Konieczny wrote:
> Hi Louis,
> On 2024-10-22 at 12:28:38 +0200, Louis Chauvet wrote:
> > Introduce the functions igt_get_connector_from_name() and
> > igt_get_connector_id_from_mst_path(). These functions serve to retrieve
> > the connector object using a connector name and a connector ID from its
> > MST path, respectively.
> > 
> > Given that the connector id may not be consistent, especially with MST
> > connectors, these functions are essential to recognize each connector even
> > after system reboots and plug/unplug events.
> > 
> > The function igt_get_connector_id_from_name() is a convenient wrapper for
> > igt_get_connector_from_name() to streamline its usage when the caller only
> > requires the connector id.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  lib/igt_kms.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_kms.h |  3 ++
> >  2 files changed, 100 insertions(+)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 44b546ae52dc..fce5666cefc6 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -7235,3 +7235,100 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
> >  	return
> >  	    connected_count;
> >  }
> > +
> > +drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name)
> > +{
> > +	drmModeResPtr res = drmModeGetResources(drm_fd);
> > +	struct timespec start, end;
> > +	int i;
> > +
> > +	if (!res)
> > +		return 0;
> > +
> > +	for (i = 0; i < res->count_connectors; i++) {
> > +		char name[50];
> 
> Add define for this '50' or later on use ARRAY_SIZE()

I will use ARRAY_SIZE(), thanks
 
> > +
> > +		drmModeConnectorPtr connector = drmModeGetConnector(drm_fd, res->connectors[i]);
> > +		/*
> > +		 * This time is required as sometimes some id in the connector list are not totally
> > +		 * ready or can disappear
> > +		 */
> > +		clock_gettime(CLOCK_MONOTONIC, &start);
> > +		clock_gettime(CLOCK_MONOTONIC, &end);

(Same change as before, end = start)

> > +		while (!connector &&
> > +		       igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
> > +			connector = drmModeGetConnector(drm_fd, res->connectors[i]);
> > +			clock_gettime(CLOCK_MONOTONIC, &end);
> > +		}
> 
> Could connectors appear/get connected out-of-order?
> Some get connected and some others never get it?

There are two issues:
- One connector can be present when calling drmModeGetResources, and 
disapear before drmModeGetConnector
- The MST connectors are not immediatly available, even modetest is 
crashing, so I have to call again drmModeGetConnector in some case(if I 
remember correctly, `watch -n0 modetest -c` can show you segfaults)

It will not cache new connectors after the call to drmModeGetResources, 
but at least it will not crash with a segfault because connector is not 
available yet/anymore.

> Regards,
> Kamil
> 
> > +
> > +		if (igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
> > +			igt_assert(connector);
> > +
> > +			/* We have to generate the connector name on our own */
> > +			snprintf(name, 50, "%s-%u",
> > +				 kmstest_connector_type_str(connector->connector_type),
> > +				 connector->connector_type_id);
> > +
> > +			if (strcmp(port_name, name) == 0) {
> > +				drmModeFreeResources(res);
> > +				return connector;
> > +			}
> > +			drmModeFreeConnector(connector);
> > +		}
> > +	}
> > +	drmModeFreeResources(res);
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * igt_get_connector_id_from_name - Get a connector ID from a connector name
> > + * @drm_fd: DRM file descriptor
> > + * @port_name: Port name to find in the connector
> > + *
> > + * Returns 0 when no connector is found with the correct name
> > + */
> > +uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name)
> > +{
> > +	drmModeConnectorPtr connector = igt_get_connector_from_name(drm_fd, port_name);
> > +
> > +	if (connector) {
> > +		int connector_id = connector->connector_id;
> > +
> > +		drmModeFreeConnector(connector);
> > +		return connector_id;
> > +	}
> > +	return 0;
> > +}
> > +
> > +/**
> > + * igt_get_connector_id_from_mst_path - Get a connector ID from a mst path
> > + * @drm_fd: DRM file descriptor
> > + * @mst_path: MST path to find in the connector
> > + *
> > + * Returns 0 when no connector is found with the correct mst path
> > + */
> > +uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
> > +{
> > +	drmModeResPtr res = drmModeGetResources(drm_fd);
> > +	int i;
> > +
> > +	if (!res)
> > +		return 0;
> > +
> > +	for (i = 0; i < res->count_connectors; i++) {
> > +		uint32_t connector_id = res->connectors[i];
> > +
> > +		drmModePropertyBlobPtr path_blob = kmstest_get_path_blob(drm_fd, connector_id);
> > +
> > +		if (path_blob) {
> > +			if (strcmp(path_blob->data, mst_path) == 0) {
> > +				drmModeFreePropertyBlob(path_blob);
> > +				drmModeFreeResources(res);
> > +				return connector_id;
> > +			}
> > +			drmModeFreePropertyBlob(path_blob);
> > +		}
> > +	}
> > +	drmModeFreeResources(res);
> > +	return 0;
> > +}
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 4674b271638a..e9732c247dea 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -1266,5 +1266,8 @@ float igt_default_detect_timeout(void);
> >  bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> >  				   int drm_mode);
> >  int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
> > +drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
> > +uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
> > +uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
> >  
> >  #endif /* __IGT_KMS_H__ */
> > 
> > -- 
> > 2.46.2
> > 
