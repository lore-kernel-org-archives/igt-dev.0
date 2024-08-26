Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4C5C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 09:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFA210E178;
	Mon, 26 Aug 2024 09:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="dWquq4Th";
	dkim-atps=neutral
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F4310E173
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 09:26:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1724664404; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CbHr2bL49NJsLSvIivBYZnBUKEgfQB5zB5ou/55VCsTN1PuGfJsnITL63IKq08dOWSQhcmut7I84sqLeaYVKbGSTybhaD2SavKvX1GuWT6YwEwRlpWXksTEPrIL41+924hwqeiOXrgt63EhJrXS6UTs0OL7s5a0+f/r3B6V9LSw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724664404;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=Diipcu9yXm6CNr7POqyoYq5ZtVrMDrU36Ew/ouLWF5M=; 
 b=BtBBe9ogiMUOOsyj3NLFsFT1BFpHi6Jm9vGhTQ72EGt74dYlGsmbvKWKGhNmvc4weIy9CXHnK+lJcVjepfqyIGRBcU6jd8y/ob9dx+BlwyapMDJUsul76AL32JV1bpQUFUu0xnD1bmHDgFMmXLbEh5rt18T/c18cHSAYhiXU2f8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724664404; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=Diipcu9yXm6CNr7POqyoYq5ZtVrMDrU36Ew/ouLWF5M=;
 b=dWquq4ThmzI9Tv0W4yLRn9Ytd1KZ72oNBKEVgZVLRGOaZFaXhRli7Xx+veWTEoXZ
 UbhKtoeMURtHwM21h4m78T4n+fN/+fxOsg6ys63imhvRKZyEEQAWi9bOEq3QdszZdKe
 X4rwXporanfIGM7KfBQgeIGDkjTviOb0wLxMhOuU=
Received: by mx.zohomail.com with SMTPS id 172466440233572.61456800510132;
 Mon, 26 Aug 2024 02:26:42 -0700 (PDT)
Message-ID: <3e689ade-862e-4a35-8762-8f0000847289@collabora.com>
Date: Mon, 26 Aug 2024 14:56:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 28/39] lib/chamelium/v3: Plug specific ports for
 all tests
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org, 
 ihf@google.com, markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, daniels <daniels@collabora.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
 <20240709-dev-remove-static-ports-v2-28-5adfc6985778@bootlin.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-28-5adfc6985778@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Hi Louis,

On 09/07/24 21:04, Louis Chauvet wrote:
> As the chamelium v3 does not support plugging all ports at the same time,
> something is required to identify which port must be plugged during
> non-chamelium specific tests.
> 
> Add two options in port configuration:
> - ConnectOnAnyTest: force this port to be plugged during any test
> - EDID: Set a specific EDID for this port
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/chamelium/v3/igt_chamelium.c | 19 ++++++++++++++
>   lib/chamelium/v3/igt_chamelium.h |  7 +++++
>   lib/igt_kms.c                    | 55 +++++++++++++++++++++++++++++++++++-----
>   3 files changed, 74 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
> index 51b3a610e358..736e593a465e 100644
> --- a/lib/chamelium/v3/igt_chamelium.c
> +++ b/lib/chamelium/v3/igt_chamelium.c
> @@ -18,6 +18,8 @@
>   #define CHAMELIUM_V3_CONFIG_MST_PATH "MstPath"
>   #define CHAMELIUM_V3_CONFIG_PARENT_ID "ChameliumParentID"
>   #define CHAMELIUM_V3_CONFIG_AUTODETECT_SAVE "ChameliumAutodetectSave"
> +#define CHAMELIUM_V3_CONFIG_CONNECT_ON_ANY_TEST "ConnectOnAnyTest"
> +#define CHAMELIUM_V3_CONFIG_EDID "EDID"
>   
>   struct igt_chamelium_v3 {
>   	xmlrpc_env env;
> @@ -234,6 +236,23 @@ static void chamelium_v3_fill_port_mapping_from_config_v3(struct igt_chamelium_v
>   
>   			port_mapping = chamelium_v3_port_mapping_alloc();
>   			port_mapping->port_id = chamelium_port_id;
> +			port_mapping->connect_on_any_test = g_key_file_get_boolean(igt_key_file,
> +										   group_list[group_idx],
> +										   CHAMELIUM_V3_CONFIG_CONNECT_ON_ANY_TEST,
> +										   NULL);
> +
> +			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
> +					       CHAMELIUM_V3_CONFIG_EDID, NULL)) {
> +				port_mapping->edid_name = g_key_file_get_string(igt_key_file,
> +										group_list[group_idx],
> +										CHAMELIUM_V3_CONFIG_EDID,
> +										&error);
> +				if (error) {
> +					igt_info("Skipping malformed entry %s: %s\n",
> +						 group_list[group_idx], error->message);
> +					goto exit_loop;
> +				}
> +			}
>   
>   			if (g_key_file_has_key(igt_key_file, group_list[group_idx],
>   					       CHAMELIUM_V3_CONFIG_PORT_NAME, NULL)) {
> diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
> index 90d2a7473894..834f446f4317 100644
> --- a/lib/chamelium/v3/igt_chamelium.h
> +++ b/lib/chamelium/v3/igt_chamelium.h
> @@ -18,6 +18,9 @@ typedef int chamelium_edid_id;
>    * the chamelium
>    *
>    * @port_id: Chamelium port ID.
> + * @connect_on_any_test: if true, this port will be connected, even for tests that are not
> + *                       chamelium-specific
> + * @edid_name: When using @connect_on_any_test, set this specific EDID to the port
>    * @connector_name: DRM connector name, used to identify the connector in DRM, mutually exclusive
>    *		    with @mst_path
>    * @mst_path: MST path property, used to identify the connector in DRM, mutually exclusive with
> @@ -29,6 +32,10 @@ typedef int chamelium_edid_id;
>   struct chamelium_v3_port_mapping {
>   	chamelium_v3_port_id port_id;
>   
> +	/* Using chamelium to emulate a display */
> +	bool connect_on_any_test;
> +	char *edid_name;
> +
>   	/* For normal DRM connector */
>   	char *connector_name;
>   
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6c2b7cc4f5bd..a30bb483594c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -49,6 +49,8 @@
>   #include <time.h>
>   
>   #include <i915_drm.h>
> +#include <chamelium/v3/igt_chamelium.h>
> +#include <monitor_edids/monitor_edids_helper.h>

Should this be in ifdef HAVE_CHAMELIUM_V3 ?

>   
>   #include "drmtest.h"
>   #include "igt_kms.h"
> @@ -2883,14 +2885,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   	if (!resources)
>   		goto out;
>   
> -/*
> - * FIXME: Dirty hack to avoid those lines when chamelium v3 is used
> - *
> - * Must be replaced with a configuration file information, so the end user can choose if the
> - * chamelium must be connected or not.
> - */
>   #ifdef HAVE_CHAMELIUM_V2
> -#ifndef HAVE_CHAMELIUM_V3
>   	{
>   		struct chamelium *chamelium;
>   
> @@ -2906,6 +2901,52 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   		}
>   	}
>   #endif
> +
> +#ifdef HAVE_CHAMELIUM_V3
> +	{
> +		struct igt_chamelium_v3 *chamelium = chamelium_v3_init_from_config();
> +
> +		if (chamelium) {
> +			struct chamelium_v3_port_mapping *mapping, *tmp;
> +
> +			chamelium_v3_reset(chamelium);
> +			chamelium_v3_fill_port_mapping(chamelium);
> +
> +			igt_list_for_each_entry_safe(mapping, tmp,
> +						     chamelium_v3_get_port_mapping(chamelium),
> +						     link) {
> +				if (mapping->connect_on_any_test && !chamelium_v3_is_mst(chamelium, mapping->port_id)) {
> +					int edid_id = CHAMELIUM_DEFAULT_EDID;

Need to use CHAMELIUM_V3_EDID_DEFAULT from lib/chamelium/v3/igt_chamelium.h.

> +
> +					igt_info("Plugging port %s\n", mapping->connector_name);
> +					if (mapping->edid_name) {
> +						struct edid *edid = get_edid_by_name(mapping->edid_name);
> +
> +						if (edid)
> +							edid_id = chamelium_v3_create_edid(chamelium,
> +											   edid);
> +						else
> +							igt_warn("Impossible to find an edid named \"%s\". Available names:\n",
> +								 mapping->edid_name);
> +							list_edid_names(IGT_LOG_WARN);
> +					}
> +					if (edid_id == CHAMELIUM_DEFAULT_EDID)

Same as above.

> +						igt_info("\tUsing default EDID\n");
> +					else
> +						igt_info("\tUsing edid: %s\n", mapping->edid_name);
> +
> +					chamelium_v3_apply_edid(chamelium, mapping->port_id,
> +								edid_id);
> +					chamelium_v3_plug(chamelium, mapping->port_id);
> +					igt_require(igt_wait_for_connector_status(drm_fd,
> +										  chamelium_v3_port_mapping_get_connector_id(mapping, drm_fd),
> +										  igt_default_detect_timeout(),
> +										  DRM_MODE_CONNECTED));
> +				}
> +			}
> +			chamelium_v3_uninit(chamelium);
> +		}
> +	}
>   #endif
>   
>   	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
> 

Regards,
Vignesh
