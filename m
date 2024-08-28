Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B273C636E5
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 17:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA4010E152;
	Wed, 28 Aug 2024 17:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ox38ea2F";
	dkim-atps=neutral
X-Greylist: delayed 10487 seconds by postgrey-1.36 at gabe;
 Wed, 28 Aug 2024 17:26:11 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0585D10E152
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 17:26:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02B87FF803;
 Wed, 28 Aug 2024 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724865969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8L32uLIcm2EdGvil9OQ4OqFMrwH2JYz2idvM6BWiSc8=;
 b=Ox38ea2FKM9rm5XqCxftr1NO3eGXvHoYZ6vu6NA1LPDwItmB7d6soUswMjJiRP2ZSdLEat
 AI7LTH8wmrqjm84qvgKY/cB+z3cT/cZZ+MeL8v15wAjr7KTz2hZep6D0ll7T2ti79nkaLf
 S1TDuSo4so7jDggvlvST1H2qgrEtekrK+Y1gHQ2jBsN1S86wSBMPXN8EDszPtSYKf4rP17
 ibeVF8Dsgq+mva8BSONQEO2DvV7+TYIsE0N/AuMFRKzlOlKQvpieRNesM9+R89/DakmlZH
 7fcK7Exvo2klcoWJqMW9EsJB77a/z5pk17izzHFhBvvJSWqv0M40HMKtStL2LA==
Date: Wed, 28 Aug 2024 19:26:07 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 daniels <daniels@collabora.com>
Subject: Re: [PATCH i-g-t v2 28/39] lib/chamelium/v3: Plug specific ports for
 all tests
Message-ID: <Zs9dr91JnxNlLzBn@louis-chauvet-laptop>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
 <20240709-dev-remove-static-ports-v2-28-5adfc6985778@bootlin.com>
 <3e689ade-862e-4a35-8762-8f0000847289@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e689ade-862e-4a35-8762-8f0000847289@collabora.com>
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

Le 26/08/24 - 14:56, Vignesh Raman a écrit :
> Hi Louis,
> 
> On 09/07/24 21:04, Louis Chauvet wrote:
> > As the chamelium v3 does not support plugging all ports at the same time,
> > something is required to identify which port must be plugged during
> > non-chamelium specific tests.
> > 
> > Add two options in port configuration:
> > - ConnectOnAnyTest: force this port to be plugged during any test
> > - EDID: Set a specific EDID for this port
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   lib/chamelium/v3/igt_chamelium.c | 19 ++++++++++++++
> >   lib/chamelium/v3/igt_chamelium.h |  7 +++++
> >   lib/igt_kms.c                    | 55 +++++++++++++++++++++++++++++++++++-----
> >   3 files changed, 74 insertions(+), 7 deletions(-)
> > 
> > diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
> > index 51b3a610e358..736e593a465e 100644
> > --- a/lib/chamelium/v3/igt_chamelium.c
> > +++ b/lib/chamelium/v3/igt_chamelium.c
> > @@ -18,6 +18,8 @@
> >   #define CHAMELIUM_V3_CONFIG_MST_PATH "MstPath"
> >   #define CHAMELIUM_V3_CONFIG_PARENT_ID "ChameliumParentID"
> >   #define CHAMELIUM_V3_CONFIG_AUTODETECT_SAVE "ChameliumAutodetectSave"
> > +#define CHAMELIUM_V3_CONFIG_CONNECT_ON_ANY_TEST "ConnectOnAnyTest"
> > +#define CHAMELIUM_V3_CONFIG_EDID "EDID"
> >   
> >   struct igt_chamelium_v3 {
> >   	xmlrpc_env env;
> > @@ -234,6 +236,23 @@ static void chamelium_v3_fill_port_mapping_from_config_v3(struct igt_chamelium_v
> >   
> >   			port_mapping = chamelium_v3_port_mapping_alloc();
> >   			port_mapping->port_id = chamelium_port_id;
> > +			port_mapping->connect_on_any_test = g_key_file_get_boolean(igt_key_file,
> > +										   group_list[group_idx],
> > +										   CHAMELIUM_V3_CONFIG_CONNECT_ON_ANY_TEST,
> > +										   NULL);
> > +
> > +			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
> > +					       CHAMELIUM_V3_CONFIG_EDID, NULL)) {
> > +				port_mapping->edid_name = g_key_file_get_string(igt_key_file,
> > +										group_list[group_idx],
> > +										CHAMELIUM_V3_CONFIG_EDID,
> > +										&error);
> > +				if (error) {
> > +					igt_info("Skipping malformed entry %s: %s\n",
> > +						 group_list[group_idx], error->message);
> > +					goto exit_loop;
> > +				}
> > +			}
> >   
> >   			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
> >   					       CHAMELIUM_V3_CONFIG_PORT_NAME, NULL)) {
> > diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
> > index 90d2a7473894..834f446f4317 100644
> > --- a/lib/chamelium/v3/igt_chamelium.h
> > +++ b/lib/chamelium/v3/igt_chamelium.h
> > @@ -18,6 +18,9 @@ typedef int chamelium_edid_id;
> >    * the chamelium
> >    *
> >    * @port_id: Chamelium port ID.
> > + * @connect_on_any_test: if true, this port will be connected, even for tests that are not
> > + *                       chamelium-specific
> > + * @edid_name: When using @connect_on_any_test, set this specific EDID to the port
> >    * @connector_name: DRM connector name, used to identify the connector in DRM, mutually exclusive
> >    *		    with @mst_path
> >    * @mst_path: MST path property, used to identify the connector in DRM, mutually exclusive with
> > @@ -29,6 +32,10 @@ typedef int chamelium_edid_id;
> >   struct chamelium_v3_port_mapping {
> >   	chamelium_v3_port_id port_id;
> >   
> > +	/* Using chamelium to emulate a display */
> > +	bool connect_on_any_test;
> > +	char *edid_name;
> > +
> >   	/* For normal DRM connector */
> >   	char *connector_name;
> >   
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 6c2b7cc4f5bd..a30bb483594c 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -49,6 +49,8 @@
> >   #include <time.h>
> >   
> >   #include <i915_drm.h>
> > +#include <chamelium/v3/igt_chamelium.h>
> > +#include <monitor_edids/monitor_edids_helper.h>
> 
> Should this be in ifdef HAVE_CHAMELIUM_V3 ?

Yes, those includes are not needed, thanks
 
> >   
> >   #include "drmtest.h"
> >   #include "igt_kms.h"
> > @@ -2883,14 +2885,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
> >   	if (!resources)
> >   		goto out;
> >   
> > -/*
> > - * FIXME: Dirty hack to avoid those lines when chamelium v3 is used
> > - *
> > - * Must be replaced with a configuration file information, so the end user can choose if the
> > - * chamelium must be connected or not.
> > - */
> >   #ifdef HAVE_CHAMELIUM_V2
> > -#ifndef HAVE_CHAMELIUM_V3
> >   	{
> >   		struct chamelium *chamelium;
> >   
> > @@ -2906,6 +2901,52 @@ void igt_display_require(igt_display_t *display, int drm_fd)
> >   		}
> >   	}
> >   #endif
> > +
> > +#ifdef HAVE_CHAMELIUM_V3
> > +	{
> > +		struct igt_chamelium_v3 *chamelium = chamelium_v3_init_from_config();
> > +
> > +		if (chamelium) {
> > +			struct chamelium_v3_port_mapping *mapping, *tmp;
> > +
> > +			chamelium_v3_reset(chamelium);
> > +			chamelium_v3_fill_port_mapping(chamelium);
> > +
> > +			igt_list_for_each_entry_safe(mapping, tmp,
> > +						     chamelium_v3_get_port_mapping(chamelium),
> > +						     link) {
> > +				if (mapping->connect_on_any_test && !chamelium_v3_is_mst(chamelium, mapping->port_id)) {
> > +					int edid_id = CHAMELIUM_DEFAULT_EDID;
> 
> Need to use CHAMELIUM_V3_EDID_DEFAULT from lib/chamelium/v3/igt_chamelium.h.

Yes, sorry!
 
> > +
> > +					igt_info("Plugging port %s\n", mapping->connector_name);
> > +					if (mapping->edid_name) {
> > +						struct edid *edid = get_edid_by_name(mapping->edid_name);
> > +
> > +						if (edid)
> > +							edid_id = chamelium_v3_create_edid(chamelium,
> > +											   edid);
> > +						else
> > +							igt_warn("Impossible to find an edid named \"%s\". Available names:\n",
> > +								 mapping->edid_name);
> > +							list_edid_names(IGT_LOG_WARN);
> > +					}
> > +					if (edid_id == CHAMELIUM_DEFAULT_EDID)
> 
> Same as above.

Fixed!

> > +						igt_info("\tUsing default EDID\n");
> > +					else
> > +						igt_info("\tUsing edid: %s\n", mapping->edid_name);
> > +
> > +					chamelium_v3_apply_edid(chamelium, mapping->port_id,
> > +								edid_id);
> > +					chamelium_v3_plug(chamelium, mapping->port_id);
> > +					igt_require(igt_wait_for_connector_status(drm_fd,
> > +										  chamelium_v3_port_mapping_get_connector_id(mapping, drm_fd),
> > +										  igt_default_detect_timeout(),
> > +										  DRM_MODE_CONNECTED));
> > +				}
> > +			}
> > +			chamelium_v3_uninit(chamelium);
> > +		}
> > +	}
> >   #endif
> >   
> >   	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
> > 
> 
> Regards,
> Vignesh

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
