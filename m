Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6258C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 22:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FABE10E075;
	Tue, 23 Apr 2024 22:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giW1ES3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4E310E075
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 22:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713910948; x=1745446948;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=2XDns9+PWrnEs0QAABiJ/hBN5vgieyLp7A6BiwnXe6k=;
 b=giW1ES3sQBVm/+YzyuV6g8YNGs4B7QnViLzlhwggjZ8LdZz2ZerG3fSW
 p9NCInTIvIYCDVdSq8zAy8FEXuQ2grHRJoRa+r9tnq1nYyhuBi+tFPvG2
 niWUML+eInXx8ed7s9z9mj/x9vBM1NkkSmTtjnXzoDkuyJ8oLm/risnJn
 n8gzYCyeWIAYF5MXenbFNBHXodFKC0eADDTUAHWScpJ+02mNTUhY23JN+
 lmf4IjUFmA+RSF/k1xKI02AqJTtYuDViHMdB7FdAukVGt5rOABB8PuFTH
 XFg5FMpBj/gPi+Dli3IlE8BSPGx401YJaqZ/Cfb5LWi+Knsb9NUN7QidC A==;
X-CSE-ConnectionGUID: zrmq4cu7Qkmx6pXIEDwzgQ==
X-CSE-MsgGUID: 2cWzeXmeR7WTNdHzpgp86A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9737094"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9737094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 15:22:27 -0700
X-CSE-ConnectionGUID: pYBjNpfcQKq6DtTBPaNWXg==
X-CSE-MsgGUID: YzBT8D1kT2iDeEdwavjBtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29306173"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 15:22:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 15:22:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 15:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe6ol99XaEWI3CO/4xRW8sK+B6oxYb2Ad7sI8Z8JZw7OW+he7YGBRsANOTleQeIfxv3ggDHzxkA5hmftJ7lZsINjY4x7YUccgshajKG4U4lNk79kK2Z0rpK1QE4jehQ4iXR31m16OAt7Zt+jGN6fs6QcIBf+IQX5vx+IUZ0PSDJ0ierrfvBD7zw82XVdgVr818kZeqT/040MCsQRMv0OFzPSUxArFtp3Yokg+Eo4V7JBDLZA13NXccLHuPSkWlTnSiKrj9P1MqhJtCAlDBDEQ4Al/Qj7Ri+DI0PYeP685XxCO/kpWL+FqvNy+H1Hs7XXcc4W6/E1w9WaB4p6Wpi/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svUtQuywq2OxZLIKvyRsK+r14YE5jOZlkDy0+m27pNQ=;
 b=EGSwUXWlv3qnWtzL50kdoRhAWe4DsJhoG3NuhXVVHSzaQU/ZMTfD7Kv0RMc1KYEqDGtN3+0DabckNCBtYRrfIJSm6UGh2R3Wsm2qIdwi5tZfSJFGPIW+2JMKPkyLcL3N6CP4gcmT3mqxAyPeD+4fssvo0nRxGmlnkZ49ybfk/jqoh9eSfnrVoDAv1nmT7nsoZu/+ZHXX5hK2R3nGMwVHzohDRUQd5K11oTAWldrbtwvLrEhnhpShQLIIBoVxi2zhyC1Fc0iWhv34bcQqQC+JDcnyfPzSwuCpoRH9TtETAtvVMgvHBx/YFTtTO3JEbGSDYWOzbM+7eHmPuuDTOQJ7dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 22:22:24 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7519.021; Tue, 23 Apr 2024
 22:22:24 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/xe_wedged: Introduce a new test for Xe
 device wedged state
Date: Tue, 23 Apr 2024 18:22:16 -0400
Message-ID: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: c15ba94b-a044-4fed-432b-08dc63e3d98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmkzMU9jaVc5dmthZkNNK1hHSDk5WW9qaVlqd0lxU2c0N21xQ1pZYTk1U3pR?=
 =?utf-8?B?czYvU1VGekUrY0g5dnh1Yk8vVXBQVnZCL0FkK0hPMjltLzlQNnpadEw3NGNi?=
 =?utf-8?B?dmtPRnY0R3M3MktEb0xIRWFndzl1TThWZlpEVzVRSEluc1J6UVJjbC94OVA5?=
 =?utf-8?B?OFpOWUpCbHhJL2lkUzlYdzRhUWQyQWV3WEY2WEJBSFM0RWJJQXRDK2JZWmRP?=
 =?utf-8?B?QXNRZWdvRmFucmdKbVV5UGduVFkzZ3h4ZzRUaW1GUlFONVh2dTQ3dkdnQXRY?=
 =?utf-8?B?dWxRYVF4aWUzNGVVbGUrTm5NSW1rSE1GZFE1UlFjT0Z2aWl2dm82a1UwUW11?=
 =?utf-8?B?ZEFpdGx4QXhYaElvdEhCVFBnU1oreHEwT01qS2xSb1llMzF5K1RRRWRtWG1u?=
 =?utf-8?B?ZDRucjlIS002VDFDOVVUeW9iWld1RFAzRExlOHU1WGtWSjVnbGRzMHZOcHQy?=
 =?utf-8?B?TnpkbnVSb3JiWTBpbUg2UXlwMWt1MjA1TUFzSFoxY1gxTUc2QWZTSkZwUFdX?=
 =?utf-8?B?QmZzSGQwbXVuUm9LNFRTVlYrVXRiZzBzZlpyMGpSNHYzRTVESzYzc0lCRzVh?=
 =?utf-8?B?S0RHaGlNNjYzS2tORVB6My9oeGdYVHY5RU9VZ1FXRFJWeW5nN25KVGpQR1hx?=
 =?utf-8?B?d3dQTTE3Qjh3MFNuVGliMTQ1M04wWXJUdzMwK04vQXFzQTAzTHI5cWtPTzAw?=
 =?utf-8?B?cXBZWFhXMk9aTi80TUd2S1FISDlJT24xUkFXcEV4MWUzeHhJQWRzMTQvQ21s?=
 =?utf-8?B?ajJIY0h3TnN0OFB2bS9KY25HSGhlemxBOTROZjI1SDZOTlMwRUtjRCtUamg5?=
 =?utf-8?B?UGdzRk9BZGRHUDF3SHI5M0RUSldQZm04ZGwvbjlhRGdTNDdIL1RBWVVZRkIz?=
 =?utf-8?B?cURlYVFaZERQTG4yc3BZR2xrOXo1VHRDblQ0NDUzK0NMT1pYQmNzQ1kwNnVB?=
 =?utf-8?B?VG1mRm9oZWV6YnJhcHBpL1p2Q2g5UEowWk55aW5pQ0lIVjU0OFRmNDBlUzQy?=
 =?utf-8?B?ZDBvUlZmeXlEd1hIY0FSMUc1ejF1SHFUMS9HT1RNeW9tVWhXd1EyNkZqK21M?=
 =?utf-8?B?TXVYenNGQm1yTWtXQUhqWEZabXEvRjVLR3FybWt6T2ZSV3QzRGpoMDl5M0Jy?=
 =?utf-8?B?THVydkwrV0kvbUJSaTd5NlpobjFpS2tkT1hFRHNzOCsvNXpwQTJBSE1sOWkw?=
 =?utf-8?B?YTd6UURwOW5Sa000YjRCdERONTBudUtYbGJxRmFKR2xESHpUeEttRk5UeDQr?=
 =?utf-8?B?K2gzbFpIT3UvY3lTbWFycFBQQXBzeUZSTysxdGV2dExjRDhnZWswTHp3Vitx?=
 =?utf-8?B?cmVpNlM5SjczZHhqR3Z1VmdLUFg0S09GN2ZqQnZNb2szY3hQZmdkT3pVWUFx?=
 =?utf-8?B?STM3ZnhQZWxoQlZIaFJhSlg3U3VzUFFBTjVSbm5XNENDR1dDd3NSa2pSU1Av?=
 =?utf-8?B?Ry9sZ2U4Rjh0NGh6OVRVaS9tZGVUeGtCRVd6REYwaDBnNmNsbEpEdUlBRWRJ?=
 =?utf-8?B?TURSWTI4ZThkdUE3d3hpV0R3M1FXMVVydU1tQzV3QVNMWkpOcnFxeVo2UDU0?=
 =?utf-8?B?ZDF6M0JqMzN0OXN5cXRSNEpNRm0raGk1SGlVMnJFYkhKTUlFb2VEc3lBcFFT?=
 =?utf-8?B?WGtlTllHQUF4SWx3UTVpQzZud3M1Nzh5aDJWaVVaMm1yOTdtUHdYbmFURXVH?=
 =?utf-8?B?VldDQnFIZEJGOEFVYjRtTExTTzRvYnBGcVBsR2lRRDJHY0laNUk4dHhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUgxRlhxR2VudUplVklzeWpWMEN3RStQR0kxd1orQmIwTFV3RHhSVzRHNXMw?=
 =?utf-8?B?b1NnUTlmbmsvQnFZRnlveGk2NDkyOFg4cVVKTVpzQStrSzNQbVQxTDBiblpZ?=
 =?utf-8?B?bERxSC90QldOWnlJNnhkYU9DSW5DTG1YZjhLWEJqNWtjcWZQdjZVVklrc0hv?=
 =?utf-8?B?YXMvZ3lveUZOTWNuNUt3ZEp0dTd0b3AzVnZyWnE1MC9KRHhUeEVqZDhtUGlK?=
 =?utf-8?B?bFpWRWxyVUh6TVB5QUFVSVUyeU1aZk51OXhKSldNYzcyT0pIbkRnbkppOC9m?=
 =?utf-8?B?SEo4YS84OGYxUGxUZW9SY29MUlBwTHdNZTRJcm1sYTRjUDY3RlNMNzlLKzlY?=
 =?utf-8?B?NThUNGVzNTNsdkQ0QWNYaG9FYUpETko4b0piQ1VvQStWeGhURlVjMlFDUzZk?=
 =?utf-8?B?RTNxbGNKajJFUzAyVXo2anp5TkozU3J3VGFJNzdoaXcvb0pwSDRPMEpYQ05F?=
 =?utf-8?B?ZmxXUEtFU3orcnBKMXZlN2pYTU1lRGFxa2ZQdGZ6dEp1TkQ3MUliTFRmQndw?=
 =?utf-8?B?RkFNZzlBakhySWJ1dnBBMTZlM1pwZnhHSmVEemZlV2RKZmhEQ1FWNjZqdkY0?=
 =?utf-8?B?WldaN1B5ZW8wQzY2dFovSCt5c0NzTENXcEY4U0hkUXZuRlpzNytvNjRGOTI3?=
 =?utf-8?B?ZjJpbXB5cEZiRmJib1lQSHRUTEhFVHcxamRkZGJDSWE4SG8wQU1aaTlYWE9o?=
 =?utf-8?B?bk9yNUZoS2RLUzE1WUl4bjRtNVRERnBFUWhlZkJ6bUFOQ3RyNXl1S0U0T3Nn?=
 =?utf-8?B?elFxcHcyMmJsZVZVbTB3ZjNEVG0wV2xTNHYvRFNKQVBuZm1YSDk0QVVnMW9Q?=
 =?utf-8?B?eTNGMFliSWVQNzFTV3o3RHQwUzlWL1Azdk45NmlHaWszK3p2bFEvVTRzQ3Ji?=
 =?utf-8?B?a2ZBTWt4d0pzL282TnUvbHlsYngrTDBMRlphek5YLzRwNXFNU3hLdG9UMnRv?=
 =?utf-8?B?cTBzOFh4bm9uQzlHUlZFY2NIWjNycm9ST3o4VDJjbE5lSlhtazZnMjZZU09M?=
 =?utf-8?B?UGl0TUNGdnNzM1Q4WitIeUdpNEFydm9OZ1dmOUlCUzJGRTYrVnBNSTRZcWEr?=
 =?utf-8?B?MDVzV0NUME1OTXUxN2tZUXdKUEsvVWFNQnhGcmxQYmlIbGc2d3I5b1pzOERu?=
 =?utf-8?B?eVJNQVVocWpESWNBK2ZzT1I5Um9DWUFaU3RLL2VrWHg1SmZSMi9EemZ3dXpp?=
 =?utf-8?B?bWJCaHJFODNza2RtaDBnUGwrc0JmTlJvVThTUWU3UFNlUlBnRDNnNThKMkFy?=
 =?utf-8?B?QVRWTU95aTVVaHVFWFlYTVVkOXY1NGh1RCtxOUtmaXB2TXMrbDZVMVZ4WHE1?=
 =?utf-8?B?U3JkSElrRWgwc1piTzF4d3RJUWRFTVBZNWZxSE1FaXU0ZnhWMTd5Y2paT3A1?=
 =?utf-8?B?N1dYS2I0Vk02dmp0a0xyd1VmaHNuOVZIdnZ6YnJVVXNnd2pjTCtuR0krTDF3?=
 =?utf-8?B?QUdwRStNMVFkcWk2dU44bFpNQWRESEY4UHJ6a3IvcEJDdG5zSFltd3FCNWI1?=
 =?utf-8?B?elNveWlseHg0Sk4zT1JNNDl4d2JEYVArV3VrSUlRcDU4WVgyZGZtMEtkUStm?=
 =?utf-8?B?bnd2ZExmcjI1QmdYeVYrT1h6Qy9iV1B6OTh5L3FDejNJZmdwUUlCUWRWVkNx?=
 =?utf-8?B?dmxzbzNYMnRHLzZERE03TWRZSmllTHpacnAyMVVZNFNlL1ZqTmhvYUNlQjZB?=
 =?utf-8?B?U0ZoTXVFd3luRFVKaXVPSlU0cHdlTStHTmVTb01qWHZqckdoS3F1dTdGdklp?=
 =?utf-8?B?K0Q4YXRKN1AvTjBVR0Q5dVlqKzErRmhsbmUydFdpK01GYTE1U0R4bXFQS2c5?=
 =?utf-8?B?anNvdUxpbWZqVHRWOFJEYjdsK0gxbGsxS2cwN2ZZOC9CcVFIaHdyWFQvMGlk?=
 =?utf-8?B?MElrZUhlNGhRTXlBOHdnZEkwdklyaURtL0tJL3pSRHMvVnRFendYMTI1VlBP?=
 =?utf-8?B?MUxDSkg5UFpEaGVLKzRCNEFiNjFTdGVHUkF0T1Z2ZzBGZVVoRHF2OThKTjlk?=
 =?utf-8?B?elFCWWs2aVZTVFIxamJoMGZiLzhzaEFaamxNY0pKNGt1ZXpZM2hWNUJvMEUr?=
 =?utf-8?B?dUhMeERFYUZ2REl0aXJaZVpZZjFJUytYNDZkNmZ6M1ZrOEUyR1MxRjEwL0k5?=
 =?utf-8?B?SWFiWGxyOFVTMVRHZFJtYWJ2N3FBSWs4NjBib1p0SnV2TW1Sa2c1V2toRCtP?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c15ba94b-a044-4fed-432b-08dc63e3d98e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 22:22:24.0404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNZtjURnhP4r9RGIOd2m4LP1EvrdUK3jWd/VKRLNpfUvcXzqxlV+oVQ8kvuZEZDCTtv9ja83ab6GMLfpmwPrTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

Let's inject a gt_reset failure that will put Xe device in the
new wedged state, then we confirm the IOCTL is blocked and we
reload the driver to get back to a clean state for other test
execution, since wedged state in Xe is a final state that can only
be cleared with a device rebind/reprobe.

The fault injection of this test is entirely based on xe_uevent
provided by Himal.

v2: Use rebind instead of module reload (Lucas)
    And other improvements also pointed out by Lucas.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc:  Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 108 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 tests/intel/xe_wedged.c

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
new file mode 100644
index 000000000..f2587cc43
--- /dev/null
+++ b/tests/intel/xe_wedged.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: cause fake gt reset failure which put Xe device in wedged state
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: wedged
+ * Test category: functionality test
+ */
+
+#include <limits.h>
+#include <dirent.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
+#include "igt_sysfs.h"
+
+#include "xe/xe_ioctl.h"
+
+static void force_wedged(int fd)
+{
+	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
+	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
+
+	xe_force_gt_reset(fd, 0);
+	sleep(1);
+}
+
+static int rebind_xe(int fd)
+{
+	char pci_slot[NAME_MAX];
+	int sysfs;
+
+	igt_device_get_pci_slot_name(fd, pci_slot);
+
+	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
+	igt_assert(sysfs);
+
+        igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
+
+	/*
+	 * We need to close the client for a proper release, before
+	 * binding back again.
+	 */
+	close(fd);
+
+        igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
+	close(sysfs);
+
+	/* Renew the client connection */
+	fd = drm_open_driver(DRIVER_XE);
+	igt_assert(fd);
+
+	return fd;
+}
+
+static int simple_ioctl(int fd)
+{
+	int ret;
+
+	struct drm_xe_vm_create create = {
+		.extensions = 0,
+		.flags = 0,
+	};
+
+	ret = igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+
+	if (ret == 0)
+		xe_vm_destroy(fd, create.vm_id);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: basic-wedged
+ * Description: Force Xe device wedged after injecting a failure in GT reset
+ */
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest("basic-wedged") {
+		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
+					       O_RDWR));
+
+		igt_assert_eq(simple_ioctl(fd), 0);
+		force_wedged(fd);
+		igt_assert_neq(simple_ioctl(fd), 0);
+		fd = rebind_xe(fd);
+		igt_assert_eq(simple_ioctl(fd), 0);
+	}
+
+	igt_fixture {
+		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
+			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
+			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
+		}
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index a856510fc..65b8bf23b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -274,6 +274,7 @@ intel_kms_progs = [
 ]
 
 intel_xe_progs = [
+	'xe_wedged',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.44.0

