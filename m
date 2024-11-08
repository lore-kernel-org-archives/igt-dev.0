Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7098AD5C0F0
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 15:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263D310E9F0;
	Fri,  8 Nov 2024 15:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="c/geJKfF";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C0F10E9EB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 15:23:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D76DDE0002;
 Fri,  8 Nov 2024 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731079420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AwnOaTyv4WyVFDLlSBARelc1jvF0dOK7LvLwTk1iPoQ=;
 b=c/geJKfFr1DlRenMpdt0Z+GED++fW0mZkqaC7k5/0cNiznERD28bycUIZl/SrdY6Fe5beF
 t7uNvtQQI69S9z8iQgB3ZGVNcW30HpIZmr1xrr/FMhCWEDDbxne5wyg3OPkSZwYl0fdnF8
 KEivr9QAGmwZxIEbgNJa1WhJAccy7yqzXIQwRR+Wpc+/YN1vc5n8ClzZ5nBZvUHiOu5Gno
 H5LV1nhaebWYAdAYIQMXEouqLK8GOXaiPYMBxe7az/z/0BSgZp8kvKYuilJKhdvExq+6Cx
 v356MpQavwKUsJdTqUNuIoA5jV4BPq2JLm7WUZY2ucko7+LKrtKYWOJC/zOvzg==
Date: Fri, 8 Nov 2024 16:23:38 +0100
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
Subject: Re: [PATCH i-g-t v2 5/5] lib/igt_kms: Add function to get valid pipe
 for specific output
Message-ID: <Zy4s-iIYMasqhz-L@fedora>
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
 <20241022-b4-cv3-01-igt-kms-v2-5-8f654694b513@bootlin.com>
 <20241106142827.hhkxbweo6s3yojdm@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106142827.hhkxbweo6s3yojdm@kamilkon-desk.igk.intel.com>
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

On 06/11/24 - 15:28, Kamil Konieczny wrote:
> Hi Louis,
> On 2024-10-22 at 12:28:39 +0200, Louis Chauvet wrote:
> > Introduces a new function igt_get_pipe_for_output in igt_kms. The function
> > is designed to retrieve a valid pipe for a specific output in a display.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  lib/igt_kms.c | 19 +++++++++++++++++++
> >  lib/igt_kms.h |  1 +
> >  2 files changed, 20 insertions(+)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index fce5666cefc6..82d63d6e6229 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -7332,3 +7332,22 @@ uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path)
> >  	drmModeFreeResources(res);
> >  	return 0;
> >  }
> > +
> > +/**
> > + * igt_get_pipe_for_output - Get a valid pipe for a specific output
> > + * @display: display to fetch the pipes
> > + * @output: output to use
> > + */
> > +enum pipe igt_get_pipe_for_output(igt_display_t *display,
> > +				  igt_output_t *output)
> > +{
> > +	enum pipe pipe;
> > +
> > +	for_each_pipe(display, pipe) {
> > +		if ((igt_output_is_connected((output)) &&
> > +		     (output->config.valid_crtc_idx_mask & (1 << (pipe)))))
> > +			return pipe;
> > +	}
> > +
> > +	igt_assert_f(false, "No pipe found for output %s\n", igt_output_name(output));
> 
> Please try to not assert in lib function.

I will change it to `return PIPE_NONE;` for v2
 
> Regards,
> Kamil
> 
> > +}
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index e9732c247dea..e0d968b52033 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -1269,5 +1269,6 @@ int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
> >  drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
> >  uint32_t igt_get_connector_id_from_name(int drm_fd, const char *port_name);
> >  uint32_t igt_get_connector_id_from_mst_path(int drm_fd, const void *mst_path);
> > +enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
> >  
> >  #endif /* __IGT_KMS_H__ */
> > 
> > -- 
> > 2.46.2
> > 
