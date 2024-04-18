Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D4BC04FFF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 22:14:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8410F10EDD1;
	Thu, 18 Apr 2024 22:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYOjBOoO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ABB10EE54
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 22:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713478459; x=1745014459;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o4jiE+/vvDyiQDSy9lIipbfp1CXzPtzyS29hcaUTzxc=;
 b=mYOjBOoOoyeL5EWdGozzmAljrILn+HN5BwHZkCggkbQ3k5Yu4xVcJxdh
 DnJpsIe9okv6DSG9n4M3DgtZ1jIw1eha88HccczuZSvbwfsCV1uQxEk3d
 pijgLslQQAJDatMz1SYYKjKhcS1wJC3+X65b5MUgh35j0RXuKg1lMJxPn
 mR16hxO6fXpIrTOHYl0rSqJMvRSASEXrEZk3xPc5KFvf5lHrqWzJA6nZS
 N77HQHKhkSYNYiALj1WeJYG00IOijji7dKjGXnnNl3NQBf7C8NHx0EvnT
 SKSanmY1xnVpCbcY1T9LQojFp+ZWMqrZuM7tZe8hN8WwE8lmnkUIaXPBS w==;
X-CSE-ConnectionGUID: A9sP721yRRK3lZakOBhqrQ==
X-CSE-MsgGUID: J5MFWjGYTbOBTjEVjb4n0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8917664"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8917664"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:14:18 -0700
X-CSE-ConnectionGUID: N/AgwKBjReS6VJ8wbDHnqA==
X-CSE-MsgGUID: kkC3pkGgRfaFiCk6fnE/TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27688090"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 15:14:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:14:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:14:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 15:14:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 15:14:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m32WJ5sz5SnU877hz+fydVWq/ScnMSW46O6dJLCI/EJMHLhAh5CkGqaYqNlmhbSUCV1FqZKlvTjasBShlCAe7y4E6gAg+MxuqsGpBOXtPBZmxIFMVyL3X4RHREJSzFvvgDAV5FVrYkMeK00Zk71ymoNvANaYko0Bynb2hrFd5MOiuSdIKrVCrulPv+8NxClNwnvB0REpY5THI8Q2UBV6LD0KKa116xY5IED4LKDu2FmOcaIrGXGJl96lv7HSYs/IRR4oQdm2PHlZqqYiff/5n2wsgqfqsCP3uDlktHwiIM3ldSOWDoJC/GQr3w1FV1JrPfYIQYjKwWi10gS94BRSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed7XOLIsuMDM1YZsf+tybStm8Hid2hs7Bm1t30cESL4=;
 b=LktfZ3l4Jvd/kBLqiEGNTOZ48QPZOlpGFfYb4zmYyz6VpjBuE5G2SV29NGPKtNMeNI6EGHhWmbwB5zhWL6G87X48L1CJF2HRvJl25iNBMYCmlY73aNoQXPF2Y7ubz5nxTTVRbcmYfyKTgjxf2UqP48GhUU16O0c9uKSy41NC8jNZ7xKePsN16vqAynGo4CGoLm4be4k8AtJVRC9f2+HCDKilgdOvDB9c1moHnvvI+6Uc1JofZKSXpUq1wOEXFZcsHGcqwZ0PuM7Cc5oSv2ZlZ322qApYOyoxCEa7Mb/bnSjwBeahK5cW86oFsC4N1v/67wu3mrjMougspxwbjMVQ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB7404.namprd11.prod.outlook.com (2603:10b6:208:430::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Thu, 18 Apr
 2024 22:14:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 22:14:14 +0000
Date: Thu, 18 Apr 2024 15:14:08 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 01/12] lib/igt_drm_fdinfo: Stop passing key twice
Message-ID: <ZiGbMGwTT63KC+d5@orsosgc001>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405060056.59379-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:180::38) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 8408f7d5-b94a-422e-64c0-08dc5ff4e1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: aLcwxv5wuHIlJ9k3E3JVUKksoQaZnwHbl16OSsYnDw/CFgxC9Sw3QDDTInAu2/Bjg9uPtme+BGNgjDxFTp8D8W5zxNP22n3+Hz9B7VkQoxbWrOn+6vGqhk5xytvs6xRdPLvnJUGlhDeGGkHCPdmJ1+u2VOsrn9vT/DXLGNfQ/miQ/4lO5CjuPJIEQCWsLuzKKBEcB5KDpLodXKPkhTWQeQBEl6thVvzTX6ITECFpnZQKcrbWitcci/EY04acur287DkI1TT03dhpQ2rlSWQsCPBsTYqgTKURcIE1E/lBxlElyhvPzAsnqLEX4qmcQ3dT270lL/SYg/csAiUqiFL72P4qPxM6vQWBK0QKGTE/VwahfZuT3jFKUpIg0HcSUiSIyZk/HUaslSYFXned+xib+difkNaWTK5csFZY+zw+/T8TU0Pno5Ag3Xyo7Yu50FgXKYk/FVMwjHR0h5QRZe2x9m2d5bgFp5SLMJM8YWY8T+v01tfFi9S5B9lOO/xosUYkCYMjuBbM1z6roy81VaEPeJHJva3e3Ym9CdT3X7XPlI9Rhs+aVyoJw65hVTql+LetVdSzvvacyL4+6mb3991ut/bSPUOznucA1SEz6OIQOVDaXqqQzzDzsZoTmqbeZvzK1AfoXccGuJL7ikhnLVr9hPZOGdwtQwUUfsVaUNEGCnY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjFKWUJySjg4dXlCMFFlN1BCM0xPQWZxU3E1SnB6VTVTZE56NGNPdHl4K0Jj?=
 =?utf-8?B?K2tMNGpwNnR2T2MvRVFFbGhiTFJuTWJiaWJGZWRJQS9rejc3TGplcEN5b2RO?=
 =?utf-8?B?dEJBQ3BoZWxJSXI1WU5Nb3BYMVU1RGxtdytLYWVnd3NhUWt4cWI4aWQxRGEr?=
 =?utf-8?B?dkF0L2J2RVFpb0ZYM29GK2ZtRVVIb2xIbG9yaWFyZ2dPMW9oWFpyQ010djZR?=
 =?utf-8?B?M0cwM0JhS3kyNnBid2hpb3cvTGUza0xjZHFhZVJ2TzdEYUI4UEUzVmhBaFBu?=
 =?utf-8?B?a3JwWHBkbWJRWTgvb0t6d3FsemVsWTc0VE5tT3ExUk5jQXV4S0hKdzV6MytP?=
 =?utf-8?B?cUpXMVp0YXF0OENwMlU0cjlOQ01VZVQrM1FmdGNQYVlwS1lWRThmSnJ6NWI4?=
 =?utf-8?B?RDU5V2l3VHRKYmh4YVJJTUg2SVdXNGlVR280TUxpMTMza0tEMEd5V1BpK256?=
 =?utf-8?B?VnJuejl5SE84WlI2VVRFOHRUcTdUNEZmVmw2UDc3djFTQXkrdE04TWtBS1lE?=
 =?utf-8?B?eFZ5Y1o5bE1zckpPSDBnbU9mVjZXSmJUUCtZMFMzWFQ2T05XeWFhVzZ6TkVV?=
 =?utf-8?B?SlVzQ25GZUJYalNpU0srRlJiU0NUMjcrYmRRWHN6TGNWTGNFTG9jK1ZPcWxH?=
 =?utf-8?B?TDE1b2xPR3ZIOTNPT0RGeXAxRCtwMnNkVEJxWGRRY1RnZFR0NTRzNkpEaWIz?=
 =?utf-8?B?VGE0cTVQZVYyWE95RWRXRlgzRkw5eEtlY1V6amFSZS9DYjd1ZnhVampXVkND?=
 =?utf-8?B?S0VES3kxTjVHdEhBMVdoa1lJWUlOTlF2dm5ocXdKZU1Kc1hJcDRFMHZxc0Ey?=
 =?utf-8?B?THJWTG8zY1lXMC95ZkxoOWJsdUlzVTd3bzVreVUxWm9adDZSVStXdlRkWmM5?=
 =?utf-8?B?Y3VSdUlObmVmL1NWdnZyS3h3REpiaVl0WEcyeWVncXgzVG5NSmZLMko2ME5w?=
 =?utf-8?B?Mk5tbHRVRmdXVmNRWFB4dUJkd09mSkhhTkxWQ3NGTjVsMVJyNHl5U1B0N3Iz?=
 =?utf-8?B?VXdSQ3dScVpCWlB3ck9tMXZuQlJ4YmdXS0tCMkxZdXFVU2tzdEZwVlE2MXpF?=
 =?utf-8?B?YUlrazNDbFBkT09VTkZhc1lXY3FRNUlxQjZNYzgxa0tDeVJzM2RtU0U1WDZZ?=
 =?utf-8?B?SWFhbS9rc09qVXJCQWJXTi9vMy9qZ04wN0ZmZW9UZTAyQ0RWci9VaEMzblBJ?=
 =?utf-8?B?eFNCck1CdmJITjdiT0hHVUxtTzBBY3dWeVpwL3lmN0dJVEY3dS9lc2E1VzRm?=
 =?utf-8?B?RFpybGZPYXFodjJqRjg0SVl6eTI1K3JxWG02MDk3WnQ5a016SnIwVWdsWWt0?=
 =?utf-8?B?eEtjcEJXRzlOREpMdy9ra01ubUVKRVo5eWljTy8rYUp5R0tweWRHUXEwQWVa?=
 =?utf-8?B?YWc2UGVmWlhnUFMvMXJEMnFpVnZKdjQzNXFGZ3JkeXBGbklCRG1zTXhzZzdj?=
 =?utf-8?B?a0VWV1NsVGE1cXBkclJMYlJUVkVPZ1Q2cmR2REUvaHB4bnZYeDBLMER0eDdX?=
 =?utf-8?B?NHU2UUNMT09URHRKL3V3cjZFaG1pNHdYV3Fub1ZTQmJTdEk4NXlHUm1SdHJ0?=
 =?utf-8?B?SzQxM0lFWHNBUVNwTG5PQjRDUkNMd0wzK3NRamVRZlhrbTA0MXM0aDdWZEJS?=
 =?utf-8?B?V2hBcm1KZVNvUDFFOGg2eENTRmpwQlFNMFJXQTlmOUFZN1JZbnVKZDBQSFRm?=
 =?utf-8?B?SVJPVVpKRklYS2VSNDJCL1hNYnJrcFNveG1zL0RaNTZMTGRJdGFFcjdkQmRR?=
 =?utf-8?B?RnRlVWdCdkxmNnpyejV1QXhIWUt3TUdIeWhIV0txRm5zRTJJMzdWdE94aXVw?=
 =?utf-8?B?QjR3Z1FNeEFXM2Flb2ZQS3pEZ1FBZkdjMldmRlVBb1F5SlU3MlJUUytpa1lL?=
 =?utf-8?B?Qmdob2kzM1FjUVV2OFl0dHBRSnpRY3VGVXlCaFczdDZVckFEYlJuZWtnd2xk?=
 =?utf-8?B?cW4rZlRacmhRNGZaKzdrLytzNzFsanlqVENraG03RHNxNURremNvMk1aWWU3?=
 =?utf-8?B?dWNkeU1wTnBKNUMwYnptMlVaOGpXRzFCVDF6NGsxcHBHdGpONmNuRGxjbGxQ?=
 =?utf-8?B?OThmNk9VbEVyZ1JkbVpvajJjeHNRWmQwUjRJRXVRVE9GYTFUcS9Wd0oxeVhv?=
 =?utf-8?B?ZGd2ajdIWnRqMkNJZHlyRHhwVlFWVWpSUVdGallUVElHYmxveTYzcGhQdFo4?=
 =?utf-8?Q?KTqRFaaDlHKfWaYZfyutGFE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8408f7d5-b94a-422e-64c0-08dc5ff4e1ad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 22:14:14.4363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00RjKZ57fNF1S6mO32wfas3z4PrjRcYGVS2kBkeVYcS0Setd96VnQAYPUE6mvTEJQWWyI6m1NNPhMnmnZDnz7581yVCEORTMZPm+CMC5n1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7404
X-OriginatorOrg: intel.com
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

On Fri, Apr 05, 2024 at 01:00:45AM -0500, Lucas De Marchi wrote:
>Change strstartswith() so it also returns the length, which then can be
>used inside the branch when it matches. A good compiler shall optimize
>out the strlen call since the argument is a constant literal.
>
>With this, the find_kv() is not needed anymore and the difference with
>regard the other branches can be summarized with a new ignore_space()
>helper and the fact it matches the entire key by appending the ':'. The
>helper is added on top of the file so it can be reused later.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/igt_drm_fdinfo.c | 87 +++++++++++++++++++++++---------------------
> 1 file changed, 45 insertions(+), 42 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 18dbb5d0b..bfc946f24 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -53,6 +53,14 @@ static size_t read_fdinfo(char *buf, const size_t sz, int at, const char *name)
> 	return count > 0 ? count : 0;
> }
>
>+static const char *ignore_space(const char *s)
>+{
>+	for (; *s && isspace(*s); s++)
>+		;
>+
>+	return s;
>+}
>+
> static int parse_engine(char *line, struct drm_client_fdinfo *info,
> 			size_t prefix_len,
> 			const char **name_map, unsigned int map_entries,
>@@ -104,23 +112,6 @@ static int parse_engine(char *line, struct drm_client_fdinfo *info,
> 	return found;
> }
>
>-static const char *find_kv(const char *buf, const char *key, size_t keylen)
>-{
>-	const char *p;
>-
>-	if (strncmp(buf, key, keylen))
>-		return NULL;
>-
>-	p = buf + keylen;
>-	if (*p != ':')
>-		return NULL;
>-
>-	for (p++; *p && isspace(*p); p++)
>-		;
>-
>-	return *p ? p : NULL;
>-}
>-
> static int parse_region(char *line, struct drm_client_fdinfo *info,
> 			size_t prefix_len,
> 			const char **region_map, unsigned int region_entries,
>@@ -205,6 +196,11 @@ out:
> 		}							\
> 	} while (0)
>
>+#define strstartswith(a, b, plen__) ({					\
>+		*plen__ = strlen(b);					\
>+		strncmp(a, b, *plen__) == 0;				\
>+})
>+
> unsigned int
> __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 		       const char **name_map, unsigned int map_entries,
>@@ -222,31 +218,39 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
>
> 	while ((l = strtok_r(_buf, "\n", &ctx))) {
> 		uint64_t val = 0;
>+		size_t keylen;
> 		const char *v;
> 		int idx;
>
> 		_buf = NULL;
>
>-		if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
>-			strncpy(info->driver, v, sizeof(info->driver) - 1);
>-			good++;
>-		}  else if ((v = find_kv(l, "drm-client-id",
>-					 strlen("drm-client-id")))) {
>-			info->id = atol(v);
>-			good++;
>-		} else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
>-			/* optional */
>+		if (strstartswith(l, "drm-driver:", &keylen)) {
>+			v = l + keylen;
>+			v = ignore_space(v);
>+			if (*v) {
>+				strncpy(info->driver, v, sizeof(info->driver) - 1);
>+				good++;
>+			}
>+		}  else if (strstartswith(l, "drm-client-id:", &keylen)) {
>+			v = l + keylen;
>+			v = ignore_space(v);
>+			if (*v) {
>+				info->id = atol(v);
>+				good++;
>+			}
>+		} else if (strstartswith(l, "drm-pdev:", &keylen)) {
>+			v = l + keylen;
>+			v = ignore_space(v);
> 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>-		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>-			idx = parse_engine(l, info,
>-					   strlen("drm-engine-capacity-"),
>+		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
>+			idx = parse_engine(l, info, keylen,
> 					   name_map, map_entries, &val);
> 			if (idx >= 0) {
> 				info->capacity[idx] = val;
> 				num_capacity++;
> 			}
>-		} else if (!strncmp(l, "drm-engine-", 11)) {
>-			idx = parse_engine(l, info, strlen("drm-engine-"),
>+		} else if (strstartswith(l, "drm-engine-", &keylen)) {
>+			idx = parse_engine(l, info, keylen,
> 					   name_map, map_entries, &val);
> 			if (idx >= 0) {
> 				if (!info->capacity[idx])
>@@ -256,25 +260,24 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 				if (idx > info->last_engine_index)
> 					info->last_engine_index = idx;
> 			}
>-		} else if (!strncmp(l, "drm-total-", 10)) {
>-			idx = parse_region(l, info, strlen("drm-total-"),
>+		} else if (strstartswith(l, "drm-total-", &keylen)) {
>+			idx = parse_region(l, info, keylen,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, total, val);
>-		} else if (!strncmp(l, "drm-shared-", 11)) {
>-			idx = parse_region(l, info, strlen("drm-shared-"),
>+		} else if (strstartswith(l, "drm-shared-", &keylen)) {
>+			idx = parse_region(l, info, keylen,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, shared, val);
>-
>-		} else if (!strncmp(l, "drm-resident-", 13)) {
>-			idx = parse_region(l, info, strlen("drm-resident-"),
>+		} else if (strstartswith(l, "drm-resident-", &keylen)) {
>+			idx = parse_region(l, info, keylen,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, resident, val);
>-		} else if (!strncmp(l, "drm-purgeable-", 14)) {
>-			idx = parse_region(l, info, strlen("drm-purgeable-"),
>+		} else if (strstartswith(l, "drm-purgeable-", &keylen)) {
>+			idx = parse_region(l, info, keylen,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, purgeable, val);
>-		} else if (!strncmp(l, "drm-active-", 11)) {
>-			idx = parse_region(l, info, strlen("drm-active-"),
>+		} else if (strstartswith(l, "drm-active-", &keylen)) {
>+			idx = parse_region(l, info, keylen,
> 					   region_map, region_entries, &val);
> 			UPDATE_REGION(idx, active, val);
> 		}
>-- 
>2.44.0
>
