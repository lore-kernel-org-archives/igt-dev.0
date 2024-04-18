Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B528C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 22:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1770F11A059;
	Thu, 18 Apr 2024 22:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c84H2Z+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F1511A054
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 22:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713479144; x=1745015144;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2dM6XhJJ61oRgN/m6Km1tLfksAuL4Ok6s4Rmer8+dbU=;
 b=c84H2Z+rRPYbfCBduD6PPeFeOCyODBL1tF0liY8MHlNu7M5EQBicP3iw
 1+I23PsSA+tSJ6J/cQcumPOWh8130L/7X9/K5/VOH0C0qbsWTmQK4N4Ci
 ema3LERcd9ESWRZ+hhopm180Aki/3QKAL1hsXjOWeC7v1YopJAlCzy7Mw
 hTurM50Dh2lS7+tRqxEL0zMrawkwPx7+G9QKNL+aANUIqAjhkmPfBR61O
 Ia9s6wZaRl4ovVMWHylRKmt2RskT/QfNbjEyNWuTRdUf1DIZWNI+kBbTk
 ZvnmM6lHpYvCPpRy/aSyUJnSytiRSsqZ1cmzvEtbSdhif1vSgzOqhANJQ A==;
X-CSE-ConnectionGUID: ngjEMTiFTjuI1K+XZ583tg==
X-CSE-MsgGUID: myfPqtMBT569e+QQVSAKUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8919282"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8919282"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:25:44 -0700
X-CSE-ConnectionGUID: Uao5fBuXS4uIUhsvdlM4tQ==
X-CSE-MsgGUID: 3FfnuMHFQp2zkzhLFN+JYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="54051011"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 15:25:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:25:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:25:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 15:25:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 15:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnXnYM1Ye01yeIqeY4g4VnKXRG9anJs8wnGygEMG06iEzZ9KzOW0Ft2wL44H47E1bXzd3nI/UZDC+EWnJwIbdrWSKDfaYsliaUBWkaJsYr0kb9bUL5z43jpCKjlwIf/MSyqcE4JtqNuFfNuX4SOdiLnY5CH5jN+vN1PkThPhA5xhDoSyw103xbPQnhnXgC0HcyVAm4E/+7TFJcX+lbsykiAgiZHRkfqOEqbPwL15oVUdCylp0iG0QuNDSy6rcFcmSSq/ag854Wu+DS1sV9ODROgbeCEAE4p734YsUrRSlZntjeF5VY9mtcSkqfyLV0a9zunEwjQ1XitHUKsBk7hzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpzpPSD3Y8ZtO0rCqZykp1IhpMrcqED4xkCCKPtDyAQ=;
 b=Sf0B++sYyFz9kzS20nQHDKY1iX5z3oVGeblNuiKUARHXC/ZLRgZfDxMmfap4PHdISF7NNCOQnvuaOeKiO/ynvnBK5cHAOOH8gttfqgjAXi0vS2w8st90TDQt+aXaAVDTj44+T61PmyeYnAez62++SulntBh30vh+7XGyUcDoOd3hlwPCZnTw0YQLB6swVgEKK7iv+4FY36Pk6rSx8ry6z4v/hkwjfD5NZ1h2XCYn0EIcW9j8R6iqVSgr8sii39+aQbOtRgi8rdnzUM5IcrKa0h4592ZXlsSSwWZ3mxshh5VDL/bzNqYHpaqFmStyh09zgYBEkZZBFXy+3sSEkndZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB7212.namprd11.prod.outlook.com (2603:10b6:208:43e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 22:25:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 22:25:41 +0000
Date: Thu, 18 Apr 2024 15:25:35 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 03/12] lib/igt_drm_fdinfo: Fix wrong name len assert
Message-ID: <ZiGd0YbYQUHxRtfl@orsosgc001>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405060056.59379-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 2feb7975-8d53-42e8-27e6-08dc5ff67ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Mh3QOOs2FJFHbLVw6b1GXObmWPlma1ju4b5p07jB37zcQtVEwfLMX0aNR89zbI0ixG0QeU+LjqrPA3aDeyMVvYKK39ascr92XyParhvN3U//xsGrcRGA1vA+7Cv+OJ8rjW9nbJDiwG+OczkgcJUZTn09Fk5jSGalTTqEYvXzP4SBIrORYcu9NHEgpceYT2wBLhhmDYcqeWWOP5zNzCRNG9Iz8d0J/nC/z4ZadLWH5OTy5ANURwbGxalFNPQRy1rZXYtb7PJ36gevnwZSXYp13k5dmPcrKIdwKTPq/1il7cxdxKEdfZnu0pde0jYFk9f+pgqcfXqeVzYjjqBucWCLnzwmUposH5gHLWP14Jxksj9xyDShX5by8g1DEDxNQvaPoqeXDC/iy4XM3Qnj3bPilI1Df3HeyFl4bAS6ZUDaBauCDyYhmQbw0P+F174TYfn3uOd7oqPIMOSrn5rZ3CiXUk7qVktTUHqisrS5+Q4Feoun6yrDAzVRtn/oUCFUeg2eTU/wvxzI5593/9oSK2C0wtkCkc45V+sBYBIjqYVwXzo5YtwVthgUN7CgyZyTnTRmeTF+LCqOyEcXNC5EwN4s2RXE/Cd/cvZ6xX3DpIQ6YsDh6Es54+FyjOzl1uaHCoL31Q3Xd3bmMHER8M8bBRcndqJtiHFoAhrwxXhcIsHYGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHBkZUdmNHh0QXh3OCs2aThtenJBNXBtVnpEMUN0UkVVOXdjdHhOZnR5UFRP?=
 =?utf-8?B?KzBuYk9uWWlPeHVKOWNwTEExL1FKZkdFUm9Ibi94ZGxjL1FQQWFHS0xmd2kz?=
 =?utf-8?B?cFBIOXhja1VzRlp1RDBpTlFqc2t2VTVnT2Fpd3RockpiQ1hjQWlMbWhHNjhZ?=
 =?utf-8?B?YlVRa2tqdS8vVGNrNkdTaDY3Z0lvUHJiTU15eUZsaDRYSWhweEE4U0kzT3VL?=
 =?utf-8?B?WTJLMlJqUHFYbzJDeXNiT3BKODQrOXRqcGFjalZreTdUWHl1YVJWUU11RW9I?=
 =?utf-8?B?T1JvYTAvaThoc2g5ZlYzMnIvLzRtdTZRSmN4eGtweFdrVU1teEp1OUljZDNl?=
 =?utf-8?B?ZE9ncEx1RGFsTW5paUhWSHJwSHVFMHVReWkwUVlnMUVMUCtpS3RZUWFURG1O?=
 =?utf-8?B?dTE0RmlpclVNOEdRSU1ZVnBpUWt5RFVONEFHK3VjU25SY2w5aWViaUR6NmM4?=
 =?utf-8?B?NnplN3ZYUTc3Rm15RzExRUdKbFRwVWRlY0oxUnRYVmVNN3Z0NVhITjZkODN0?=
 =?utf-8?B?dGE0Q1lPYzZXSnN0VlE5ZlZXc0lEU28wS3c5MkxlaTBldWdia3gwMkMrQnFV?=
 =?utf-8?B?bGYvaDl4WXU1T0hTVThvSVFkYnZhY0FtUFFTTUtpMFpUZGoxdFE1YmMrREJo?=
 =?utf-8?B?b3I1RmQxY0ZCQUt4MmVZSWFmMEVSOG5vRlZOMGlFTDNsR3pVaG9nRnVGTEcr?=
 =?utf-8?B?WlV5dUJad1Z5WTBNWXhIWjF5b0V3NEhaajdQaVJ2OGhzbGpKNS93enJyTEZP?=
 =?utf-8?B?Z05WZFBNQWI1eFJmMjRydnFUOWpFclNFRm03RGphR1ZXRDdRUEFQS0d2eGlx?=
 =?utf-8?B?U1J5TnFHSE43UjQ5OFlHNTlOWnlFMkR3bmQ1b05uVm5wdEF4cHhFempXa2Vn?=
 =?utf-8?B?RElETFB3WG42aVV2ZjgzcHBTUTM3SHJza1RWd0h3R0VycVoybFVLU05IT2pY?=
 =?utf-8?B?aTJoYkoxYTRLN2h5QjZYQ0FKV3A4cHFRUWpWRkZQSUJuQ0YrQkgwa3B3WVlW?=
 =?utf-8?B?MkttaXhyYngyY1h6dGlxUzY1U0h2S3V5TEd3eWFjNXhvTnJKRTJ5MWtkQWt3?=
 =?utf-8?B?bFRqcXVIZnZqdkhGVERuS3NYNTlVcFdZMkVjUHRIbzBwTGxQZEdVRVM3U2dY?=
 =?utf-8?B?ZUpWS2l1dkg1ZXAzd2xRa0Y2THk1YzNIaVhHSVo3OHZqUU9CN1FNOHRmL2xH?=
 =?utf-8?B?UUxmK29xZnRTY0Z5RktJOTNFRHpaR3RDZWpWQmZtMXgzYnBjOENWSlkraWll?=
 =?utf-8?B?L2NWWE9UUGVkcytZTmpwUE5vR0ovb1ovTUErMXBKQTkwc21UenU4RSt6aTBj?=
 =?utf-8?B?a1RROXMxWUd1UTcwYi9ORTNJNVFKSUJCbmFZTjVPV05scFpUeE95M2VBeGlU?=
 =?utf-8?B?N0NrUzdqNWpxU2hoY2F3WHlXVXo2alNnUFJwSXA1dUtTdzhFM0lUbG54QzFC?=
 =?utf-8?B?bnp5U1pqYzNnRTBmek5PTDdkN1NvSU5FUDJnTkZzSEp1bnJydC9RbXlTUi8y?=
 =?utf-8?B?cnNGRTBid2RaZVNhNWFtYlU4bFBsMmRzVlVtc3hnVDVzUm1IaXBwdzNFUFRZ?=
 =?utf-8?B?bTNsMngrc0gvUXVlVmhZakY2QTJQaE12dXVGQnJMOTBRSFBtL1ZiWCttUjBm?=
 =?utf-8?B?dWxxc1ppMnM5c1NTRzJiS2hPRm42emV5OFNHb0REb09mZXNqVk9lci9JNytC?=
 =?utf-8?B?T0pvcE9HODRUaS9vcHh2ZVJJSnd6b0x1OVJZZmRmODBydFVGQ3FKQTZWekxN?=
 =?utf-8?B?bmZSYnlBZys2cWNqY1ZNY2pPOE9UY3NVM2J3Wml5K0UxWTFPdXFzNnVmeE1v?=
 =?utf-8?B?U1duWnJFaDdoYTREU1E4aEZva0V1SnF6VS9LTHBMa1hDdHNLeHZDRHFlL1Yw?=
 =?utf-8?B?eXpmQzJENHExWGN4Z2dwVmxMNENXOXVZbmJTRk45VzlaR2pLM0d4bE9RVita?=
 =?utf-8?B?YkQ1M1A3OExaczVsdUhmQmIrVWVhUyttZS9WV0poMkdNelJNUHdGMTJYUVhZ?=
 =?utf-8?B?dFVUN05ZZWo1ZFZCa2Q3WFZ0MmM3UjM1Y0psaHM1cndGVHZ0TEdZN2lqc2hL?=
 =?utf-8?B?dTZ1N0pGSWV1RmorREFzcEc1ZzBmRTJYMExqV1dKUGhLWGIzd0c2eWtaM1Rj?=
 =?utf-8?B?dlkrb09Pd1phY09zd1cwYTNlTkxaVnhjVzRiamYwbzZuQjZ1dzB5SVZjcnFz?=
 =?utf-8?Q?Atf7NXX+RtQswUFQ+FQmYCA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2feb7975-8d53-42e8-27e6-08dc5ff67ae2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 22:25:41.0128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZcZqRVdbjaTyG1LvWGh6Xn+eoTcPxpQNxCe7RqMDN5+bZAGg4rZihyL+PD2D0hUaWCwedSRQmg9fsm4NmNJ582W9vU9iJE7YyHG55TEFn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7212
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

On Fri, Apr 05, 2024 at 01:00:47AM -0500, Lucas De Marchi wrote:
>When parsing engine name, at this point we have something like:
>
>	"drm-engine-render:	232409619162 ns"
>	            ^      ^
>	            |      |
>	          name     p
>
>We are copying the engine name to the final destination, but
>strlen(name) will actually contain the entire string. Since we already
>know the name length, calculated previously, just use it for copying the
>string.
>
>Since each name is 256-bytes long, the assert doesn't trigger easily,
>but it's better to be correct. And more efficient.

Agree,
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_fdinfo.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 7a9ae94f0..9b1776775 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -96,8 +96,9 @@ static int parse_engine(const char *name, struct drm_client_fdinfo *info,
>
> 		if (found < 0) {
> 			assert((info->num_engines + 1) < ARRAY_SIZE(info->names));
>-			assert((strlen(name) + 1) < sizeof(info->names[0]));
>-			strncpy(info->names[info->num_engines], name, name_len);
>+			assert(name_len  < sizeof(info->names[0]));
>+			memcpy(info->names[info->num_engines], name, name_len);
>+			info->names[info->num_engines][name_len] = '\0';
> 			found = info->num_engines;
> 		}
> 	}
>-- 
>2.44.0
>
