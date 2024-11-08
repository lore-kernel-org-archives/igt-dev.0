Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC0CD5C0ED
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 15:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E939E10E9EB;
	Fri,  8 Nov 2024 15:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kNiTyg3K";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5425C10E9EF
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 15:23:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D0D61C000B;
 Fri,  8 Nov 2024 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731079419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LgobM9ELWM8bykpfpM6un4S1JuB8ODmPGazOW8a2Py4=;
 b=kNiTyg3Kts2G2+ZaNFy9kJ1/QMQ9ieNBnDN6ru+PUYWj9IJFk88ECaMzqxCX9QNXYWrcf4
 sgZXn0hvVe6dP1RDFuA/UEprnIgj0iBwLTid4OTFPeKpdQE8VAB57IqJhLXN38MKPNZjyZ
 1L9VpunMuSBh7aW+WnllLzi6cyMBI/xdIKrLVZ7tog967A2xbx/LXXjhz0gp/dhpV8Kna2
 l3o/MLJHjARasc4sOrbjhaCsk5L4jScUKeVDANvtQgnL0CZVs5qVwE3OfaImOI3M9jkJlG
 6pJ0bEkyTO09ggoYr51vo5FqVJ6UVzAnH/BrLwX9SxMPSNEMd4YMpY/2kSFJMw==
Date: Fri, 8 Nov 2024 16:23:37 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 nicolejadeyee@google.com, seanpaul@google.com,
 jeremie.dautheribes@bootlin.com, markyacoub@google.com
Subject: Re: [PATCH i-g-t v2 2/5] lib/igt_kms: Add helper to wait for a
 specific status on a connector
Message-ID: <Zy4s-WU2UJ6RD57C@fedora>
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
 <20241022-b4-cv3-01-igt-kms-v2-2-8f654694b513@bootlin.com>
 <20241106141723.74jwtjujtxxee47m@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106141723.74jwtjujtxxee47m@kamilkon-desk.igk.intel.com>
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

On 06/11/24 - 15:17, Kamil Konieczny wrote:
> Hi Louis,
> On 2024-10-22 at 12:28:36 +0200, Louis Chauvet wrote:
> > During testing with chamelium, it is frequent to wait for a specific
> > connector status. This new helper is polling the DRM API to wait for this
> > status. This allows detecting new status without notifier systems (which
> > can fail if hot plug detection is not working properly on the device under
> > test.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  lib/igt_kms.c | 38 ++++++++++++++++++++++++++++++++++++++
> >  lib/igt_kms.h |  3 +++
> >  2 files changed, 41 insertions(+)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 195868646a14..40c0a207cd17 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -7143,3 +7143,41 @@ float igt_default_detect_timeout(void)
> >  
> >  	return timeout;
> >  }
> > +
> > +/**
> > + * igt_wait_for_connector_status - Wait for at most @timeout that the connector @connector_id
> > + * status become @drm_mode
> > + *
> > + * @drm_fd: drm file descriptor
> > + * @connector_id: connector to monitor
> > + * @timeout: maximum duration to wait, in second

 * @timeout: maximum duration to wait, in second. If 0.0, it will use the 
value of igt_default_detect_timeout().

> > + * @drm_mode: mode to wait for, see enum drmModeConnection
> > + *
> > + * Returns: true when the status is reached, false if there is a timeout
> > + */
> > +bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> > +				   int drm_mode)
> > +{
> > +	drmModeConnector *connector;
> > +	struct timespec start, end;
> > +
> > +	if (timeout == 0.0)
> 
> Floating comparision is tricky, I would suggest something like
> 	if (abs(timeout) < epsilon)

I know that float comparison are tricky, but the goal is to allow the 
caller to ask for the default timeout. I agree it is missing some 
documentation. 

Maybe I can do timeout == -1.0 (nobody will ask for a negative timeout 
except on purpose), is it better?
 
> > +		timeout = igt_default_detect_timeout();
> 
> What if it is still zero here?

It means that the user configured the timeout to 0.0, so this will 
probably probably fail, but on purpose.

I agree that this may not work as expected, see my change bellow:

> Regards,
> Kamil
> 
> > +
> > +	clock_gettime(CLOCK_MONOTONIC, &start);
> > +	clock_gettime(CLOCK_MONOTONIC, &end);

Change the previous line to:

	end = start;

> > +
> > +	while (igt_time_elapsed(&start, &end) <= timeout) {

So here the igt_time_elapsed returns 0.0, so there will be one attempt to 
detect the connector.

> > +		connector = drmModeGetConnector(drm_fd, connector_id);
> > +		if (connector && connector->connection == drm_mode) {
> > +			free(connector);
> > +			return true;
> > +		}
> > +		free(connector);
> > +		clock_gettime(CLOCK_MONOTONIC, &end);
> > +	}
> > +
> > +	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
> > +		  connector_id);
> > +	return false;
> > +}
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 4f0030264d9f..4cd4a4f65460 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -1263,4 +1263,7 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output);
> >  
> >  float igt_default_detect_timeout(void);
> >  
> > +bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
> > +				   int drm_mode);
> > +
> >  #endif /* __IGT_KMS_H__ */
> > 
> > -- 
> > 2.46.2
> > 
