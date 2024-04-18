Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B70DC04FF8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 22:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C5B11A070;
	Thu, 18 Apr 2024 22:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mj4fMKzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C305A11A06B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 22:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713479526; x=1745015526;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uudIzgdE91Xf/3PFFjkHTrK3CsE/fv3KhUg1n5+o/eQ=;
 b=mj4fMKzwfTD19EML3DROAnHGvSpzERyNr94G1hIFcFnmEIu8byAuMJ+f
 unfDObxAwstZUXWS6GSw62C1f64PRIyZmqQ/X9PFX906TTz6CYk3rdlzH
 G757gokYA6+JTmabUCLaVz22CCucppc5hAQ5jF4Re26DsQ0FpfWr0i9dW
 da2A82iu/ZOCiYVXWikXy/778O+LlDeGw+tvjz/bU51M7gvd3oI0bleeQ
 KUWUDhOWlq635GUnf3myEJ99GDOY49G2ltcUw7KZ1wgdhfakGy9YV9zWJ
 oAD0djxL7Gc+ASBOt5v6391J3cm6fr3S/WHfNIqqbIaXqyg9G9cg4NPFs A==;
X-CSE-ConnectionGUID: u5elWlCtTjKPvtTO4/a4Zw==
X-CSE-MsgGUID: yBp39XGKTOKG8yrunhvOsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26516229"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="26516229"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:31:33 -0700
X-CSE-ConnectionGUID: E6/dBNzPR925C6wminNcng==
X-CSE-MsgGUID: wrcOlqpkTZCVANjy3dDfGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23582557"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 15:31:32 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:31:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 15:31:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 15:31:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZsvwLeJDiYXuFnc2sPU73GgkAXz4KVRZ7BTgQqNPgpMyfL8/XNLPuEqyjXfjHjlVl/O7hBCV/t+hM9kaYkhHK2sn+dUDtzbUl1xuPpYSDU8OYWK/ODRp8u7jdS1Ahw/4k2o462J9VqjrMNVvY+VmkZRSBoXaEQVGheZvZKeXoPtRjg428efxmzzSYQTcJTsVzdITlo2DrX5FgZDPTUT2Y2pzODDtKRvI21ugCQJ1ASKl91mSAxo0MFdpqNVOuffR/fVbkbn5ALSkb3z06/OrWdgTCMCosfWcXphQFNC47gCZfVqqJAr5pag5mZU/VMgdVRhlvZTiKw1UllfkkRUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzC2At1rKmcljECf0BUowijEz7cm24tkkIb3S50Aujw=;
 b=XRmWbxpZoCEWWqW6RwjHDifphId/hE8+M4gjGi4PNmKHXFtU6RwIa9IvWCS4WPF9OpLv3KMSXTQ2eon4SmFNxBZx7qN7cmlau8EnToyqRfNw04YIepMOBSdmfR8M/0YDqjXoTGboDDrrrBTi9qAog/HdOLMRQPxZdf4jLtvHGtN+qQrkxH/2KAl0I+h60RBwhHU1iCis1i9xCbdLSbQZgkNu8TbmeJmCA4cDfa5Tj3E/l1aAh5mbBVb5s0yXsYm/3VSxoCK37fxzHuOXvNXhW8CkXGoMke97sMIa0TsbNKeOLwILGvnc0/ucqamKF9sqn3jkObWAumloifPHOrBwsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Thu, 18 Apr
 2024 22:31:29 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 22:31:29 +0000
Date: Thu, 18 Apr 2024 15:31:27 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 05/12] lib/igt_drm_fdinfo: Detect invalid
 drm-client-id
Message-ID: <ZiGfM5jW++mzf0aE@orsosgc001>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405060056.59379-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 442a04ab-8805-48cb-aaad-08dc5ff74a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zqsc4JlerJPzj/KBen0sadvnqpwOKe7xBipBicbQD5F1jgRa0NgfvRwmj9+s6vJL2yHzKo8VOAaaJwuTq5HSqZhfEm/SWQyyYkxxlNFkbIhDC27tHsGFaE1nzBsY794gzSwAv8tdhUgcEPE5PXeyrhuU/C/GVxC1UAiVJLx1V2DJWq8F+fjDI4eRIiLaNFlpROuwkHVSbQ32l8c2SER9Kyl65yTMXJcuauHoPzbDx/hl1eY7QQ/3gyvjS+oBsiPtYYUupvvhs+Pxe8dJZMiwUsYj/7zCUP/LkU387+YeAL/l6QS0WcHlEoa9nzxzDScwC/2KklniAmjLcu5DaEfKLhxrYhP0m4gX5+iP2aMwWqKr772NYnUG4Q4B6v5t3/Pt8opiAZh9bhDQJnlzyZ3iCo8fi611B5E/KgIJx8p/i/kYcv9CD1xMZO8t5jYMVSB4xipRSDxMANG1QAoPl/2UQkMNaVYAQYFg02dGSHP4dyhl7XicsOHxlJwjBPe9DUUc1zZgaqpJxTzJeZIz877ZLfv/I97QefSUKoYA3wtHxTC2zJdrZ+LT/3OedRgTRx4iBkn+A0Vw1LNmKA6Xx81CnJn056RALJ8l8ZrxypNySI2yHjU92RqBEtC9/sXvF1Wqx3d1+tDlNkRGLm1MnvXrDMiKL/5oJEGGbsanJxxNcEk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5zWFErU1BIM2kvME1TZnJLWmg2S3k3cWthVTFFMlRkb0FQMEF5azRtOXBo?=
 =?utf-8?B?Ulk2aXorMWRyTXAyeWI2YWtzWVQ2WUdLUnd5VWJuMCtoMWFuL21QdndsZnZJ?=
 =?utf-8?B?Q3JYU3dvYi9qK3l6aGZncXFSaWtQcVhhVHdVRUIxMS8vcTVTYm5oUExFNTQx?=
 =?utf-8?B?T2R4VTlkL1FzRTJ5QXk5ejE2K2lXK3ZUSmVZaWxUcFdBVXQxQnN0RnlZN1dw?=
 =?utf-8?B?L3IvUjNWVDBOZ2hhWHh2L1VLUEhxS2VUcGw0bEJVZ1FBRUE4aEV5a1IwalhO?=
 =?utf-8?B?UjI3bXpRNjNMSkk5S0pFU1ROb0JzZldRR1dhYnJNMTQzd01pZjBjZElINW04?=
 =?utf-8?B?UWJwYzZkMnRUczlleUQzY0RETThsd2ZSYkRDQ3VaL3c1elFBbTNBemY2N2lM?=
 =?utf-8?B?MlhVUTZWTGZsQUN2eGtFc1JFZkgycXpzZ1VsbmhKU1dCUjVIMkx4Y0VmclVN?=
 =?utf-8?B?N2ZwWmpaM0tVWXkrL3JyUjRRR21kb2p0KzVGUEt0N3AyOEUzVitMMUw3ODZl?=
 =?utf-8?B?RExjWEw1Z2ZMcUp0UFpxSE9KZkwzKzViM1B5UnpvdVduNnU3aXl0NElpcEZF?=
 =?utf-8?B?NS9HY21tVytNWExJSzh2aXphc3lPdnJ3enE5ZW5DcnNIdDlPTjJiRHp0c2Vx?=
 =?utf-8?B?d3NMaUVEcllQV1dSK25DcHlwSURQSUxCQ1NiU3VyaDQvbjYzQStmams1eXhs?=
 =?utf-8?B?UHZEZG01SnlKQ01LT3ljdi80U28yczNzVWRCbTJ6b0JvaFNNRVRUallMR3Rk?=
 =?utf-8?B?Q08rcDdEbjJmOG5HYVA2RWF6bmlnWTBQTHk3bHJYR1Zwcy9jUngwMG9rTGIr?=
 =?utf-8?B?Q29RdHFRUUZUbU1zT1NlUnAyRVhpQ1NzY0tYQkZqbmNCU3Ezb2I5YWU1Y1FN?=
 =?utf-8?B?eEVvV2RXMGltRnVwTzBLRytCb0g5RElTTmUraUUvNnBxV21wcGZIZmRTN2tv?=
 =?utf-8?B?RVlIZlJ1VlNTZWdKRVVmMzJ4WDR5UUxuM3hrWHZrcXVOSEZoK3NjTDczdzdL?=
 =?utf-8?B?NitXODZZc2d4U09lZm1aZVVKSElWNkdWRkZVd0VRbUJWS2o2ZzZUTFpualkz?=
 =?utf-8?B?NThPaTg5MzdtbFh6OXJyOEkvY0g2d3B2UWU4a2g5UCtFNGdlbnF1Z1ZPcnBz?=
 =?utf-8?B?VGdFdzhZRUpYeElPSFBJV3NtbFYvRkZTL25pUFl5S1JEL09wRWd6aW1QZ1hY?=
 =?utf-8?B?ejAvcmxCSWthQXAwWUFpVmVudEVCSGZMWjhZcEVyZnZkSmk0TWphS2NYems1?=
 =?utf-8?B?a3lJSVh0cXZHVy9YT2o5c2pnL3BmaHB2RmlocXJEY0NYTFBxMWorMXdwZGQ2?=
 =?utf-8?B?NWlSaE81Y0d5OWpuakREb0sxT25rbExsRFVDbEJ6dmVqTE4zdDd5TmxKaFFk?=
 =?utf-8?B?dkRHWFRZMGVUUGp4YlNzMUFuV0NpUnZjdk1XUDVlZys3d0REbDVLZkRqaDk2?=
 =?utf-8?B?Tk9YNnRMQXl6VFJYSCtkaWFhY2ROblJ5RnowOW9WeVlnQUR0NjdUS2ljdHln?=
 =?utf-8?B?QytIeXp5c3grUzNhRU9pQ0IzTkNFdWtVeTZwWkc2SDBESkY4M05qUFIxVnMv?=
 =?utf-8?B?bW0rS09FSzRCRHo3cVEyT1kvMmVYQ0RZUUI3YkZNVGpENGkrUi9wVlY4REtV?=
 =?utf-8?B?MGFWOVBlS242UlhaSkFTSFZhNnhWVmw1NHlPQU9tc2QydG9UMFVNTWtYaS9r?=
 =?utf-8?B?N1k0WUJrZHU2aDY2OTRZajl5UmtTa0NtVDRjaE9DcEVySjlnMmZjZ285ZGJU?=
 =?utf-8?B?RmRDVXlrWnNDd09WK1pWNUIvcjE4YWFvTHoxUDdDb2psNkNBRWxZbyt2SmNB?=
 =?utf-8?B?K1JPMnl2MkdGUFhFdGlRUTNscXRXUTlzanZ2VUQvY3NZdUpScDkwYUZYTUxs?=
 =?utf-8?B?MEZyUnZhR3crenlXU3MweXdWSEUvblBmL1ZyWFNoN2dieHhBMmtOUmU1bStW?=
 =?utf-8?B?R3QvNk9iQVkyTUszVU9qSmttTFB6UVNVMVFOeThIOVV4ZWxDTkovSGRVbWlR?=
 =?utf-8?B?L2hvcS8wSS9KWnhRNnQrV0d4T0YvZmI1cWFidlNNNEt4Z3NIc3hYYzE0NFFs?=
 =?utf-8?B?Qk1oL3pTRjJaekZGWFI4Z1RsL2liME9QMG1lNklGNDhzbkw5cCtZcGQ0RHRI?=
 =?utf-8?B?d2FxRk0xWmFhdjdRbUw2TitGQUhDQWF3WHF2VVFRSXhtamFxZ2lWemhVbUkw?=
 =?utf-8?Q?S4fJoI4/uuC9HC7FUX0wx5k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 442a04ab-8805-48cb-aaad-08dc5ff74a69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 22:31:29.1812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKM27Lxn/ZHqU4rjS8ytg6LRTnjWO+0nEZdME0wgI6O+7kq0Iim/mBH500kGi7UBWwvIXVcj2/bgUdakzyVwo53zRZry5jyPyDkfLltpK2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
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

On Fri, Apr 05, 2024 at 01:00:49AM -0500, Lucas De Marchi wrote:
>Use strtol() for string to long conversion which allows us to detect if
>there was an invalid number. It also has the advantage that it already
>ignores leading spaces.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> lib/igt_drm_fdinfo.c | 7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index de1962efa..8eb5e5eed 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -216,6 +216,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 		uint64_t val = 0;
> 		size_t keylen;
> 		const char *v;
>+		char *end_ptr;
> 		int idx;
>
> 		_buf = NULL;
>@@ -229,11 +230,9 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 			}
> 		}  else if (strstartswith(l, "drm-client-id:", &keylen)) {
> 			v = l + keylen;
>-			v = ignore_space(v);
>-			if (*v) {
>-				info->id = atol(v);
>+			info->id = strtol(v, &end_ptr, 10);
>+			if (end_ptr != v)
> 				good++;
>-			}

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

> 		} else if (strstartswith(l, "drm-pdev:", &keylen)) {
> 			v = l + keylen;
> 			v = ignore_space(v);
>-- 
>2.44.0
>
