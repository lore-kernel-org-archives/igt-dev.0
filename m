Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC1DC5B557
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D96210E542;
	Wed, 28 Aug 2024 14:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Px56Enq5";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB0910E542
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:31:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4EACCC7446
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:31:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9602CFF806;
 Wed, 28 Aug 2024 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724855483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=STZPcDVY5HfunweE+apfRbfzXVyP4oVVaANY6ek66jc=;
 b=Px56Enq5AUeBAY1Kf9TeXQC0Ck+m8BumQUXaJ97wLmWN8lkNSdUgshi7kIf2zLQ9f3gIAv
 In3NwYn9kiChp2dWyFhtyj97d0EHd8TCGrwzm8HkMxu1UqJF2YBd6GNWSWxDVGtzPFKrBB
 vJN4Wgi6e2wKHDj5aM13eD9OGm8HPU0Jt3SkIAWzWWwiP7T4BLBXgNhXpVd7YnTcgYiUzj
 ZfhtxyQuhTr4vbqflEWLo+IWqSNf1nZqMIAyFB4sLttYoaoGpfk1XoSHXL79ocmjUhmfdF
 hVtW6pwtszhUX0BBiSutqTmRzMJRsgi4/3zQwAQjdXKyauV1dUgWn/OR9uFwZw==
Date: Wed, 28 Aug 2024 16:31:21 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, ihf@google.com,
 markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v2 01/39] lib/igt_kms: Add a detect timeout value
Message-ID: <Zs80uTohaVPVh7IF@louis-chauvet-laptop>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
 <20240709-dev-remove-static-ports-v2-1-5adfc6985778@bootlin.com>
 <20240827075148.uc35w6ydfjer6k72@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827075148.uc35w6ydfjer6k72@kamilkon-DESK.igk.intel.com>
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

Le 27/08/24 - 09:51, Kamil Konieczny a écrit :
> Hi Louis,
> On 2024-07-09 at 17:34:17 +0200, Louis Chauvet wrote:
> > Some tests need to wait for a specific connector status. In order to make
> > the timeout customisable for each target, add an option in the
> > configuration file.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Could you split this series into smaller chunks for easier review?
> +cc Vignesh

I will try to split and extract igt_kms and monitor_edids series at least. 
For the chamelium part I don't know yet.

> I also spotted one file with GPL licence, in IGT it should have
> MIT or at least 'GPL or MIT'

I will fix it for the v2.

> This particular patch LGTM,
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks!

> Btw for patches which touch KMS libs please add few
> other kms developers, for example Bhanu and Juha-Pekka:
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Thanks for the information, I will add them!
 
> Regards,
> Kamil
> 
> > ---
> >  lib/igt_core.c |  3 +++
> >  lib/igt_kms.c  | 24 ++++++++++++++++++++++++
> >  lib/igt_kms.h  |  9 +++++++++
> >  3 files changed, 36 insertions(+)
> > 
> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index 3ff3e0392316..5f5adb553629 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -260,6 +260,9 @@
> >   *	&num; It is not mandatory and allows overriding default values.
> >   *	[DUT]
> >   *	SuspendResumeDelay=10
> > + *	&num; The following option define the timeout for detection feature
> > + *	&num; (waiting for a connector status)
> > + *	DetectTimeout=10.0
> >   * ]|
> >   *
> >   * Some specific configuration options may be used by specific parts of IGT,
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 64318ef7fb15..4877da4c6c9d 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -57,6 +57,7 @@
> >  #include "intel_chipset.h"
> >  #include "igt_debugfs.h"
> >  #include "igt_device.h"
> > +#include "igt_rc.h"
> >  #include "igt_sysfs.h"
> >  #include "sw_sync.h"
> >  #ifdef HAVE_CHAMELIUM
> > @@ -6662,3 +6663,26 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
> >  
> >  	return num_scalers;
> >  }
> > +
> > +/**
> > + * igt_default_detect_timeout - Get the default timeout value for detection feature
> > + *
> > + * Some tests requires to wait for a specific connector status. This value will determine the
> > + * timeout value for this waiting.
> > + */
> > +float igt_default_detect_timeout(void)
> > +{
> > +	static double timeout = 0.0;
> > +	static bool first_call = true;
> > +
> > +	if (first_call) {
> > +		if (igt_key_file)
> > +			timeout = g_key_file_get_double(igt_key_file, "DUT", "DetectTimeout", NULL);
> > +		else
> > +			timeout = DEFAULT_DETECT_TIMEOUT;
> > +
> > +		first_call = false;
> > +	}
> > +
> > +	return timeout;
> > +}
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 501d48763fb6..f89e1be86b30 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -39,6 +39,13 @@
> >  #include "igt_fb.h"
> >  #include "ioctl_wrappers.h"
> >  
> > +/**
> > + * define DEFAULT_DETECT_TIMEOUT - Default timeout used for some detection functions
> > + *
> > + * It can be overiden by option DetectTimeout in the .igtrc file.
> > + */
> > +#define DEFAULT_DETECT_TIMEOUT 10.0
> > +
> >  /* Low-level helpers with kmstest_ prefix */
> >  
> >  /**
> > @@ -1224,4 +1231,6 @@ bool igt_check_output_is_dp_mst(igt_output_t *output);
> >  int igt_get_dp_mst_connector_id(igt_output_t *output);
> >  int get_num_scalers(int drm_fd, enum pipe pipe);
> >  
> > +float igt_default_detect_timeout(void);
> > +
> >  #endif /* __IGT_KMS_H__ */
> > 
> > -- 
> > 2.44.2
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
