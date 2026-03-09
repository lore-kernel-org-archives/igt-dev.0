Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76FFEFCD9A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 11:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732F910E4D3;
	Mon,  9 Mar 2026 11:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iknTuDaT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6797D10E4D3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773054423; x=1804590423;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kWxII44snJoacYl1c7zjQREuOGZnw6OXyIa244n+WAY=;
 b=iknTuDaTDgSSXl7/rE3Neh67ZUKatB8JVcgDL4QLVpCgGstPT17Ze0Ft
 W/oyWMGDwxLJPE9dQwbndbtd0MLn3HSy09EpdRh3xyTuWSNIDVugzck7D
 XcYfyw1oCld1jLTFHhkUOnWU3/MkuWBDxTX7YmFmCXLzMorOok+ixP/S4
 yIHwwb7Sz1hYK3s3vOFaznwVuMnRKwjf6Ghi540HPOFuIAuj1o9ooVTDd
 vBF2xIj6JXevITAA5qTXNtT/FAiDr0xTrRNUGs64ASrzkLktAqxeyGrM7
 keVF4llRAznLD4lUlA2SubmqCcO+9TRfvZlnERBCH9eoAiG8WvcTTpDxq g==;
X-CSE-ConnectionGUID: OeBJL5upSNe18E8El5SbCw==
X-CSE-MsgGUID: odhZWjLLScGamI99n1sOEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73094032"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73094032"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:07:01 -0700
X-CSE-ConnectionGUID: edS9oVeYRbGvBURcnx70Wg==
X-CSE-MsgGUID: AniuIjwHQeav1cIa9I3TSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218926786"
Received: from rvinayku-mobl1.gar.corp.intel.com (HELO [10.247.170.133])
 ([10.247.170.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:07:00 -0700
Message-ID: <d3322c0b-8bd6-4242-8a74-ad5dfacb3909@intel.com>
Date: Mon, 9 Mar 2026 16:36:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,2/6] lib/igt_connector_helper: Add generic connector
 helpers
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, igt-dev@lists.freedesktop.org
References: <20260225212859.876713-3-kunal1.joshi@intel.com>
 <d256aedf-2e67-41be-a440-a6e39ad5d18b@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <d256aedf-2e67-41be-a440-a6e39ad5d18b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hello Arun,

On 09-03-2026 15:08, Murthy, Arun R wrote:
> On 26-02-2026 02:58, Kunal Joshi wrote:
>> Add a lightweight helper library for DRM connector operations used
>> by USB4 switch and other dock/undock tests:
>>
>>   - igt_connector_get_connected(): enumerate connected connectors
>>   - igt_connector_get_info(): query name, EDID serial, and MST path
>>   - igt_connector_find_by_path(): PATH-based connector lookup (MST)
>>   - igt_connector_find_by_name(): name-based connector lookup
>>   - igt_connector_reprobe_all(): force reprobe all connectors by
>>     iterating each connector to trigger DRM core re-detection
>>
>> These helpers abstract common DRM connector patterns that are needed
>> by multiple test suites for display enumeration and verification.
> The contents of these are already present in lib/igt__kms.c
>
Wasn't able to find similar helper that maybe already present,
Could you please point to those function names?
> Instead of a new file, can these be exported from lib/igt_kms.c ?
It was intentional, since igt_kms is already over 8k lines, want to have 
separate lib's grouped by entity,
In this case created connector_helper for having all connector related 
helpers at one place.

Thanks and Regards
Kunal Joshi
>
>
> Thanks and Regards,
> Arun R Murthy
> -------------------
>
>>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_connector_helper.c | 299 +++++++++++++++++++++++++++++++++++++
>>   lib/igt_connector_helper.h |  27 ++++
>>   lib/meson.build            |   1 +
>>   3 files changed, 327 insertions(+)
>>   create mode 100644 lib/igt_connector_helper.c
>>   create mode 100644 lib/igt_connector_helper.h
>>
>> diff --git a/lib/igt_connector_helper.c b/lib/igt_connector_helper.c
>> new file mode 100644
>> index 000000000..6be849b7a
>> --- /dev/null
>> +++ b/lib/igt_connector_helper.c
>> @@ -0,0 +1,299 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * SECTION:igt_connector_helper
>> + * @short_description: Generic connector helper functions for DRM/KMS
>> + * @title: Connector Helper
>> + * @include: igt_connector_helper.h
>> + *
>> + * Helper functions for DRM connector operations including enumeration,
>> + * lookup by name/path, and EDID serial extraction.
>> + */
>> +
>> +#include <string.h>
>> +#include <xf86drm.h>
>> +#include <xf86drmMode.h>
>> +
>> +#include "igt_core.h"
>> +#include "igt_edid.h"
>> +#include "igt_kms.h"
>> +#include "igt_connector_helper.h"
>> +
>> +/**
>> + * igt_connector_get_connected:
>> + * @drm_fd: DRM file descriptor
>> + * @connectors: array to store connector IDs; must be valid if 
>> @max_connectors > 0
>> + * @max_connectors: maximum number of connectors to store
>> + *
>> + * Walks all DRM connectors and stores the IDs of those currently 
>> connected.
>> + * Scanning stops once @max_connectors IDs have been collected; later
>> + * connectors are not examined.
>> + *
>> + * Returns: number of connector IDs written to @connectors, capped by
>> + * @max_connectors.
>> + */
>> +int igt_connector_get_connected(int drm_fd, uint32_t *connectors,
>> +                int max_connectors)
>> +{
>> +    drmModeRes *res;
>> +    drmModeConnector *conn;
>> +    int count = 0;
>> +    int i;
>> +
>> +    igt_assert(max_connectors >= 0);
>> +    if (max_connectors > 0)
>> +        igt_assert(connectors);
>> +
>> +    res = drmModeGetResources(drm_fd);
>> +    if (!res)
>> +        return 0;
>> +
>> +    for (i = 0; i < res->count_connectors && count < max_connectors; 
>> i++) {
>> +        conn = drmModeGetConnector(drm_fd, res->connectors[i]);
>> +        if (!conn)
>> +            continue;
>> +
>> +        if (conn->connection == DRM_MODE_CONNECTED)
>> +            connectors[count++] = conn->connector_id;
>> +
>> +        drmModeFreeConnector(conn);
>> +    }
>> +
>> +    drmModeFreeResources(res);
>> +    return count;
>> +}
>> +
>> +/**
>> + * igt_connector_get_info:
>> + * @drm_fd: DRM file descriptor
>> + * @connector_id: connector ID
>> + * @name: buffer for connector name (mandatory)
>> + * @name_size: size of @name; must be > 0
>> + * @serial: buffer for EDID-derived serial (mandatory)
>> + * @serial_size: size of @serial; must be > 1
>> + * @path: buffer for MST PATH property (optional, may be NULL)
>> + * @path_size: size of @path buffer
>> + *
>> + * Fills connector name, MST PATH, and EDID-derived serial for a 
>> connector.
>> + * @name is always filled when the connector is found. @serial is 
>> filled from
>> + * the ASCII serial string descriptor (0xFF) if present, else from 
>> the 32-bit
>> + * header serial number; left empty if no EDID is available. @path 
>> is filled
>> + * only if requested and the PATH property exists.
>> + *
>> + * Success means the connector object was found and @name was filled.
>> + * @serial and @path are best-effort and may still be empty on success.
>> + *
>> + * Returns: true if the connector was found, false otherwise.
>> + */
>> +bool igt_connector_get_info(int drm_fd, uint32_t connector_id,
>> +                char *name, size_t name_size,
>> +                char *serial, size_t serial_size,
>> +                char *path, size_t path_size)
>> +{
>> +    drmModeConnector *conn;
>> +    drmModePropertyBlobPtr edid_blob = NULL;
>> +    uint64_t blob_id = 0;
>> +    drmModePropertyPtr prop;
>> +    const struct edid *edid;
>> +    int i;
>> +
>> +    igt_assert(name && name_size > 0);
>> +    igt_assert(serial && serial_size > 1);
>> +    igt_assert(!path || path_size > 0);
>> +
>> +    name[0] = '\0';
>> +    serial[0] = '\0';
>> +    if (path)
>> +        path[0] = '\0';
>> +
>> +    conn = drmModeGetConnector(drm_fd, connector_id);
>> +    if (!conn)
>> +        return false;
>> +
>> +    snprintf(name, name_size, "%s-%d",
>> +         kmstest_connector_type_str(conn->connector_type),
>> +         conn->connector_type_id);
>> +
>> +    for (i = 0; i < conn->count_props; i++) {
>> +        prop = drmModeGetProperty(drm_fd, conn->props[i]);
>> +        if (!prop)
>> +            continue;
>> +
>> +        if (strcmp(prop->name, "EDID") == 0)
>> +            blob_id = conn->prop_values[i];
>> +
>> +        drmModeFreeProperty(prop);
>> +        if (blob_id)
>> +            break;
>> +    }
>> +
>> +    /* Extract MST PATH if requested */
>> +    if (path) {
>> +        drmModePropertyBlobPtr path_blob;
>> +
>> +        /* PATH blob payload is a NUL-terminated string */
>> +        path_blob = kmstest_get_path_blob(drm_fd, connector_id);
>> +        if (path_blob) {
>> +            snprintf(path, path_size, "%s",
>> +                 (const char *)path_blob->data);
>> +            drmModeFreePropertyBlob(path_blob);
>> +        }
>> +    }
>> +
>> +    drmModeFreeConnector(conn);
>> +
>> +    if (blob_id) {
>> +        edid_blob = drmModeGetPropertyBlob(drm_fd, blob_id);
>> +        if (edid_blob) {
>> +            if (edid_blob->length >= sizeof(struct edid)) {
>> +                edid = edid_blob->data;
>> +                edid_get_any_serial(edid, serial, serial_size);
>> +            }
>> +            drmModeFreePropertyBlob(edid_blob);
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +/**
>> + * igt_connector_find_by_path:
>> + * @drm_fd: DRM file descriptor
>> + * @path: MST PATH property value to match
>> + * @connector_id: output for connector ID (filled on success)
>> + *
>> + * Finds the currently connected connector whose PATH property 
>> matches @path
>> + * (exact string comparison).  PATH is the preferred stable identity 
>> for MST
>> + * connectors; connector IDs may change across hotplug events.
>> + *
>> + * Returns: true if a matching connected connector was found.
>> + */
>> +bool igt_connector_find_by_path(int drm_fd, const char *path,
>> +                uint32_t *connector_id)
>> +{
>> +    drmModeRes *res;
>> +    drmModeConnector *conn;
>> +    drmModePropertyBlobPtr path_blob;
>> +    bool found = false;
>> +    int i;
>> +
>> +    if (!path || !connector_id)
>> +        return false;
>> +
>> +    res = drmModeGetResources(drm_fd);
>> +    if (!res)
>> +        return false;
>> +
>> +    for (i = 0; i < res->count_connectors && !found; i++) {
>> +        conn = drmModeGetConnector(drm_fd, res->connectors[i]);
>> +        if (!conn)
>> +            continue;
>> +
>> +        if (conn->connection == DRM_MODE_CONNECTED) {
>> +            path_blob = kmstest_get_path_blob(drm_fd,
>> +                              conn->connector_id);
>> +            if (path_blob) {
>> +                if (strcmp(path_blob->data, path) == 0) {
>> +                    *connector_id = conn->connector_id;
>> +                    found = true;
>> +                }
>> +                drmModeFreePropertyBlob(path_blob);
>> +            }
>> +        }
>> +
>> +        drmModeFreeConnector(conn);
>> +    }
>> +
>> +    drmModeFreeResources(res);
>> +
>> +    if (found)
>> +        igt_debug("igt_connector: Found connector %u for path '%s'\n",
>> +              *connector_id, path);
>> +
>> +    return found;
>> +}
>> +
>> +/**
>> + * igt_connector_find_by_name:
>> + * @drm_fd: DRM file descriptor
>> + * @name: connector name to match (e.g., "DP-6")
>> + * @connector_id: output for connector ID (filled on success)
>> + *
>> + * Name-based lookup helper.  Prefer igt_connector_find_by_path() 
>> for MST
>> + * connectors, since connector names and IDs may change across 
>> hotplug events.
>> + *
>> + * Returns: true if a matching connected connector was found.
>> + */
>> +bool igt_connector_find_by_name(int drm_fd, const char *name,
>> +                uint32_t *connector_id)
>> +{
>> +    drmModeRes *res;
>> +    drmModeConnector *conn;
>> +    char conn_name[IGT_CONNECTOR_NAME_MAX];
>> +    bool found = false;
>> +    int i;
>> +
>> +    if (!name || !connector_id)
>> +        return false;
>> +
>> +    res = drmModeGetResources(drm_fd);
>> +    if (!res)
>> +        return false;
>> +
>> +    for (i = 0; i < res->count_connectors && !found; i++) {
>> +        conn = drmModeGetConnector(drm_fd, res->connectors[i]);
>> +        if (!conn)
>> +            continue;
>> +
>> +        snprintf(conn_name, sizeof(conn_name), "%s-%d",
>> + kmstest_connector_type_str(conn->connector_type),
>> +             conn->connector_type_id);
>> +
>> +        if (strcmp(conn_name, name) == 0 &&
>> +            conn->connection == DRM_MODE_CONNECTED) {
>> +            *connector_id = conn->connector_id;
>> +            found = true;
>> +        }
>> +
>> +        drmModeFreeConnector(conn);
>> +    }
>> +
>> +    drmModeFreeResources(res);
>> +
>> +    if (found)
>> +        igt_debug("igt_connector: Found connector %u for name '%s'\n",
>> +              *connector_id, name);
>> +
>> +    return found;
>> +}
>> +
>> +/**
>> + * igt_connector_reprobe_all:
>> + * @drm_fd: DRM file descriptor
>> + *
>> + * Issues a GETCONNECTOR ioctl for every connector, requesting fresh 
>> state
>> + * from the kernel. This is often sufficient to refresh connector 
>> status and
>> + * MST topology visibility after hotplug events, but does not 
>> guarantee a
>> + * full hardware reprobe in all driver paths.
>> + */
>> +void igt_connector_reprobe_all(int drm_fd)
>> +{
>> +    drmModeRes *res;
>> +    drmModeConnector *conn;
>> +    int i;
>> +
>> +    res = drmModeGetResources(drm_fd);
>> +    if (!res)
>> +        return;
>> +
>> +    for (i = 0; i < res->count_connectors; i++) {
>> +        conn = drmModeGetConnector(drm_fd, res->connectors[i]);
>> +        if (conn)
>> +            drmModeFreeConnector(conn);
>> +    }
>> +
>> +    drmModeFreeResources(res);
>> +}
>> diff --git a/lib/igt_connector_helper.h b/lib/igt_connector_helper.h
>> new file mode 100644
>> index 000000000..fffb2661b
>> --- /dev/null
>> +++ b/lib/igt_connector_helper.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_CONNECTOR_HELPER_H
>> +#define IGT_CONNECTOR_HELPER_H
>> +
>> +#include <stdbool.h>
>> +#include <stddef.h>
>> +#include <stdint.h>
>> +
>> +#define IGT_CONNECTOR_NAME_MAX 32
>> +
>> +int igt_connector_get_connected(int drm_fd, uint32_t *connectors,
>> +                int max_connectors);
>> +bool igt_connector_get_info(int drm_fd, uint32_t connector_id,
>> +                char *name, size_t name_size,
>> +                char *serial, size_t serial_size,
>> +                char *path, size_t path_size);
>> +bool igt_connector_find_by_path(int drm_fd, const char *path,
>> +                uint32_t *connector_id);
>> +bool igt_connector_find_by_name(int drm_fd, const char *name,
>> +                uint32_t *connector_id);
>> +void igt_connector_reprobe_all(int drm_fd);
>> +
>> +#endif /* IGT_CONNECTOR_HELPER_H */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index ea721ecf7..074b21fdf 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -113,6 +113,7 @@ lib_sources = [
>>       'igt_vmwgfx.c',
>>       'igt_psr.c',
>>       'igt_amd.c',
>> +    'igt_connector_helper.c',
>>       'igt_edid.c',
>>       'igt_eld.c',
>>       'igt_infoframe.c',
