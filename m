Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8ADD5C0EE
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 15:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB6E10E9EF;
	Fri,  8 Nov 2024 15:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aaIlJNm8";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BAA10E9EB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 15:23:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6D7B1C0008;
 Fri,  8 Nov 2024 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731079419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FglUfLtjHgvkO+Yc9wYhaDLHEeTEbBhGFUii5EEWZP4=;
 b=aaIlJNm8CfpnoD2vkMLasrpX2+uOmJtlMtll6yQXc25XzoDV4U6z5HMw2DlFofzc5EtPKz
 qakGS0cZp8iRynQRzgk133C/neezvMo0aDK84ns75dMb5EzLOSghB1PkuskfrxadJ2i4km
 3AW8PLNv3ppBsDvmmb7oH5cOd678NPQTItZbyM84eM1WPkrFWfa+P/mM6opGJQcLCoP7rk
 4IASj6J5GEufm7gZaa5z3ysTiSepe2EKnuKPINnpwmomaDibpRZZ+fl1jMIASGx/Z9nwvP
 o5tcKwc5qScLaMvS8UkvU+Cdfs33rvVrbB09V57HSC1VmYQcwIdwRHtTnQSWyg==
Date: Fri, 8 Nov 2024 16:23:37 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeigtyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 3/5] lib/igt_kms: Add function to list connected
 connectors
Message-ID: <Zy4s-a3xdn7vK9f0@fedora>
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
 <20241022-b4-cv3-01-igt-kms-v2-3-8f654694b513@bootlin.com>
 <20241106142044.4jbxxwd5wqimxpxi@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106142044.4jbxxwd5wqimxpxi@kamilkon-desk.igk.intel.com>
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

On 06/11/24 - 15:20, Kamil Konieczny wrote:
> Hi Louis,
> On 2024-10-22 at 12:28:37 +0200, Louis Chauvet wrote:
> > Introduce the igt_get_connected_connectors() function, which returns a
> > list of connector IDs that are currently connected according to DRM.
> > 
> > This function includes a timeout mechanism because connectors can be
> > unplugged at any time. Also, especially with MST, the connector can be
> > listed by drmModeGetResources() but not yet accessible with
> > drmModeGetConnector().
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  lib/igt_kms.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_kms.h |  1 +
> >  2 files changed, 55 insertions(+)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 40c0a207cd17..44b546ae52dc 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -7181,3 +7181,57 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
> >  		  connector_id);
> >  	return false;
> >  }
> > +
> > +/**
> > + * igt_get_connected_connectors - List all connectors reported as CONNECTED by DRM.
> > + *
> > + * @drm_fd: DRM file description
> > + * @connector_ids: out pointer for the list of connector ids connected. It must be freed by the
> > + * caller.
> > + *
> > + * The returns value is the number of connectors
> > + */
> > +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
> > +{
> > +	int connected_count = 0;
> > +	drmModeResPtr resources;
> > +	struct timespec start, end;
> > +
> > +	*connector_ids = NULL;
> > +
> > +	resources = drmModeGetResources(drm_fd);
> > +	for (int j = 0; j < resources->count_connectors; j++) {
> > +		drmModeConnectorPtr connector = NULL;
> > +
> > +		connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
> > +		/*
> > +		 * This time is required as sometimes some id in the connector list are not totally
> > +		 * ready or can disappear
> > +		 */
> > +		clock_gettime(CLOCK_MONOTONIC, &start);
> > +		clock_gettime(CLOCK_MONOTONIC, &end);

(same change as previous patch, end = start)

> > +		while (!connector &&
> > +		       igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {
> > +			connector = drmModeGetConnector(drm_fd, resources->connectors[j]);
> > +			clock_gettime(CLOCK_MONOTONIC, &end);
> > +		}

After this loop, we have either:
- connector != NULL and elapsed < timeout
- elapsed > timeout

> > +
> > +		if (igt_time_elapsed(&start, &end) < igt_default_detect_timeout()) {

If this condition is true, it means that connector must be set

> > +			igt_assert(connector);
> 
> Please try to not assert in lib functions, unless abslutly nessesery.
> Why not just return zero in case no connected connectors are detected.

So an assert here is only a hint for the developper, this should never 
fail. And if it fails, it is a bug, the previous loop must ensure that 
connector is set.
 
> Regards,
> Kamil
> 
> > +
> > +			if (connector->connection == DRM_MODE_CONNECTED) {
> > +				*connector_ids = reallocarray(*connector_ids,
> > +							      connected_count
> > +							      + 1, sizeof(**connector_ids));
> > +				igt_assert(*connector_ids);
> > +				(*connector_ids)[connected_count] = resources->connectors[j];
> > +				connected_count++;
> > +			}
> > +			drmModeFreeConnector(connector);
> > +		}
> > +	}
> > +	drmModeFreeResources(resources);
> > +
> > +	return
> > +	    connected_count;
> > +}
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 4cd4a4f65460..4674b271638a 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -1265,5 +1265,6 @@ float igt_default_detect_timeout(void);
> >  
> >  bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> >  				   int drm_mode);
> > +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
> >  
> >  #endif /* __IGT_KMS_H__ */
> > 
> > -- 
> > 2.46.2
> > 
