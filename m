Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9ED606A903
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MINblJaT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9074E10E2C1;
	Thu,  5 Nov 2026 16:44:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC13710E2C1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793896979; x=1825432979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AlUBFQrbS86q7YulN5mr6dhLkIQOC2rY83tinkS+jLI=;
 b=MINblJaTtA8PzA7GBwIcLpCmiVJkbmbRDL/+v2TodO+aVN04Ib7vSsyi
 wvDLbklI04iIH0OgtAsM4eUb8OVINu2WhuZJdhstr+zbubb6uQJVlMJi5
 sGnKpzj4G7+OS6oG8ujukxq5zqRsd0tDciHPBhBDa5GxcFh6vQqqECp06
 Ky6EekixUhas0ec471y+oRglGck/xohTf6R+I7UcgBHmhno8cVLHmRJU8
 F+M3aucTUgx+5FBTwU1UHVVGds+b3jG+0p7uvpIeKTzwqVGNxJ6a44J26
 gcXPwzxdWfkpOsTVK73phymwFUGexzv2rSthaNFxNRB4kfhF0o2CDhRXq Q==;
X-CSE-ConnectionGUID: ShT6h6HnQ02MHqaTZ/yH+g==
X-CSE-MsgGUID: zRug+oijT7GnRYxZkTknZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2785587"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2785587"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:42:59 -0800
X-CSE-ConnectionGUID: xIbfV1ArQjWdu6PJkdZKfQ==
X-CSE-MsgGUID: /m8QUIlOQc64jXa4dfQWbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6956328"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:42:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 08:42:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 08:42:58 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 08:42:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kD+NF+KEfk5n9fYGr0ZKke+jpyOgaB85wkVR2fgkefo4PznrSkji9u5HL/LMqr14z7x2yt+1mwKkyavPlI0uYYwc4CuOkE2wb+VZPY5UOjOIsQyUG7P4W7A1eR5bHxK56c5cV0gU4UnovtJ6Nk/f/zor1JsavNZtbIfVJLeyoGSLR2guX+WhuPgzSyFLZGDsiWXYTo2Qq9NdUr8NoTVeQHiKF0OEyv5a+kLYl84BBx6JE5JeVqQ0AEi9Gu01IAzr2qC1UmJfhRUczGJNLBrigELVzPCYzB43n+3j8r2Ttp7pfKSmFjxoDFxjmFArDaPW8T+DAE/q+sSOJ/hAim8o7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/b/1DTtHD33iUMBH50uwAUdM5uaokj1cDYqfclqJMs=;
 b=Jp9upk+3y8Mqr0aZG45BTzSSYOjb6YG8DLEg+vmsFRSPc4yIzvUyJeocTXeJINCFD5eRAv7ZfF9s2ag73SImP+ve3A8RdfxtOOzl4dlNOJA5UdSqoVHXEx95bTjnmmWBzITl/5yANRDYJ/lCcwnxirm4/+Kdy+w3iNva/KGs8fcTsarIUMuyua+0Mwfebvdx4zAjl6Cvoa3t8f3TiIib9PyEYbOhiR/g69nWkxMVPtCYCUr12BmTzyhTR4HLJsXnMoMFb0j78KF+i4IAbUHHnFrcIBJsh2vj1kgHMi1Lt+dXGJ6952+ZyHlkA4Il5AMh/SCoyzs01v3AT3jj0MYU8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH9PR11MB309436.namprd11.prod.outlook.com
 (2603:10b6:610:339::19) by PH0PR11MB4983.namprd11.prod.outlook.com
 (2603:10b6:510:40::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 16:42:55 +0000
Received: from CH9PR11MB309436.namprd11.prod.outlook.com
 ([fe80::a9c1:3c1e:c160:a3f0]) by CH9PR11MB309436.namprd11.prod.outlook.com
 ([fe80::a9c1:3c1e:c160:a3f0%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 16:42:55 +0000
Message-ID: <b7ebfad9-6e26-4c34-93f4-61f8f23fcf95@intel.com>
Date: Thu, 5 Nov 2026 22:12:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/i915_pm_rpm: Print reason for skipping
 PC8 subtest
To: Hiresh Kumar Yadav <hiresh.kumar.yadav@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>
References: <20261105100027.1940039-1-hiresh.kumar.yadav@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20261105100027.1940039-1-hiresh.kumar.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0205.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::14) To CH9PR11MB309436.namprd11.prod.outlook.com
 (2603:10b6:610:339::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH9PR11MB309436:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: c70b0292-d5d4-45de-21ed-08df3b5bd795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|261021123027099003|261009223027099003|261102123227099003|261022075727099003|261021121427099003|261022113327099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ab5+gnxylD40j1wAlPL7uLM3banrAof8gCXQBOvv52qXmXl557DC+v3V9elNh04e02lpUMj7GOwbJaqnGiNYs962gahJTxbwni0prL5+MH1K9WwEFrt3RnGKiCzVz8dfVK8SOBE1CR4YoAh1iw/rFKKDxZHi/4IEhqZL5+9aXykgKS62YQB3Q8VyVbq/6V9YRw9LRJwh0yp55T/WGUsE9AzJSO7SX+Oxp9IIr92R8R5Gfix7mxpHxOauL0q3rGvvr6lQIq1NqGtYWl77uMPzReELkCf8yTMbvqPeF5C+mYSJDiFs0UOWxsOny3KfTe1okyZ07gfM4ZlObTkYL+5VoaJAW826orpwJkmcHn98iUX8DO90yt3I1zQn4xbAqNYbqj5EIQ0J1LLZAfRDVwEBudplBQZ3bwaw4ctVNdj3Z1y2jMv7tr9kzcCkGYCXTUrBGA9F7Cct5uyXqXg3DoebayiV5DgxjqQXFMS0iQeiRFFZD2WUuVFMefRZjL1iXAAN3nKW3AnBJal7qr6Wi8W9lsIxMa3dnqkhUWQjCLsXZF7HSVw4cJ/Mbuc9Cr+yc6cOsYdWAziUfW8DdVIaMdPxmN18n/HVW8XYtsnDUNc7xC0yprN4z1ji3nfB3oMolKl2wKmgMLygZrwqUUXI9bxA7IfQelf7uG6cKCc0rHflc/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH9PR11MB309436.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261102123227099003)(261022075727099003)(261021121427099003)(261022113327099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFPbkhUaGJlNWV2Y0pIN0FIRmRaR0xWNDJES0VyY3M4Zk5ieFRFNWVhZzdm?=
 =?utf-8?B?S3NYT1JDSVpZYWRXOXlsWlh1bVFkU0d4MTJVVlAxT3AyUHA5Y01mQnpobHhH?=
 =?utf-8?B?ek1LcllVSU5WcTVTV3oyY1NmMnlETEl2RmVxS0c2YVJWMy9FVWJLMGxNejJx?=
 =?utf-8?B?b0ZQenZ2UHprak1VQzNoVDJ4R09ubGNGaFJLVzNIWWtYSEtkQVZUV05LOFZ6?=
 =?utf-8?B?Tk1nM2VQRFoxUnNyOTVuVjYyamJmN2lKMU41cEFWbEk4Szk5endCSlNodDhV?=
 =?utf-8?B?bTNpVzFyTTg5Qnd4OXo0QWRVbk9xZVlQQ3FaRnljdlB4NWRZZ09qVGJIck1V?=
 =?utf-8?B?L3ROVjdrQTNSVlBWV21QSXJGRisvYXRPdlQ1a3kyRFNxVXZVQnlIYnlTblRU?=
 =?utf-8?B?QnRvc2lsZzlGcE0yRmpGQkxOL3ZkMTdtMG9qbVd6QWZlcEw2Znl5VFVSNHds?=
 =?utf-8?B?MkpIdyt1NDlXTEFya0Z3eng0Tk10Nm1CMEZPeERVbytNTldKQ09pYTFUcXNT?=
 =?utf-8?B?aW5uN0RyWG5MaGtYQkJITHZ4c21uTmhFcDhjSnhnTGNHak0wOTlNaVhkeDNa?=
 =?utf-8?B?alpRVDd2ZlVzL0NHOXRQenlZSlFwWFBHQmVTRFd3VjdiR1VUbmZMQlhXYy9o?=
 =?utf-8?B?UWdqYVo3bkxLL3ZGeHMzV05pVmhrZTVOSVpLNGE3NHpESWgrY3J4d0FWZ3lV?=
 =?utf-8?B?aGlpalpnS1RFUkFTUGZVbStzaFU4dDFvMmV2K0hjYy9WNG1mRXZuR1dlMXlv?=
 =?utf-8?B?bjlkVVZ3REJURGdzNWpGUzc3WlMwbG9jQ2RwcGo2ejhKWnB6Y1M4RElJcjE2?=
 =?utf-8?B?ME1wWXpXNnlyeXdidVM5ZlJ4MTBqc0FxbFpCSUpHMGZlYkx2cFBoLzF0ODlN?=
 =?utf-8?B?OFQ3ckVmVHNUZXh4OERxUTJuWUFkNnBNcXNCZ1NVQnM3elg4aTVEemhSZmtj?=
 =?utf-8?B?VjhCdERJa0RpcEd0d3QvQTNRRnJxeXlWYjhnNGpOaHZyYjd6bjQ5WDdCTDVP?=
 =?utf-8?B?WXN6a1cvT1pVWEFYbUhmcVg5STI4aitrakZVRVdvN3FFcU5weVA1WnFUL1gz?=
 =?utf-8?B?UlBpaTFud3QwdWpoaWVDUjJDcUVCUnlQRG9QbEZKK01Yc2h5bHUrYTY0dXFT?=
 =?utf-8?B?b2J0dU8xdHE2bDNDUW1XcDlaTTErYU5JWHV4dklwaVBBLzNhY3VkVXlNU25Z?=
 =?utf-8?B?YVNPY2dxQ1kyTkRqVFBSWWs2NVVaQjQ4VEwrV3hUcXJyM1o5TVZKR2hXYWdm?=
 =?utf-8?B?S1l1ZmZWOWFUVVZqNFVhSnpXZi9CV0lvOXpvUUZZM25aR21VblBqRkhLQ1NN?=
 =?utf-8?B?UW0xNnF5ampseWhGK3NBaC9rcHlGUm15YUdYYlhjaW5yNW1vdWNRNUErMFJO?=
 =?utf-8?B?T09pWUtqQ1RRdjBDWkRnSmFzbXY5Q2RVQ0d3ZEdWd21pTFlzaGgyaDJvWitO?=
 =?utf-8?B?WklBVXJsaFQ0UzR5aUwxYnl2OXJ5bjUzUGtJajgxajljck9JOGdITVZjZitp?=
 =?utf-8?B?YlE3ZDhhcmZpNk9nd05vUWpvck80MG9YRDhyT3FVVE1WZjNXa3dxNGg1Tk5T?=
 =?utf-8?B?a2ZGWnpSUDNVSnU4LzVsSkNlWFJDUlpDWWZXdEo1bnZKVWZ4ejQ4c2czMUNG?=
 =?utf-8?B?VDVtMzFkN2x3L1ZvOGphQ2dEa3lPczBkTnRQMXJBNE5wb2tmMTZIUC9ETWNw?=
 =?utf-8?B?bVh2c25oVmt5ZEhJOVl0VEhEalBwb2pYR0FvSC9QdGo2N2F0bE5nWS9SOXBo?=
 =?utf-8?B?TURQeTErci9nT0RzY0Y4RklPaWJqRVdZa2tZMTQ0RFNkMmhiLzdmVWQ1b0FC?=
 =?utf-8?B?elN6Q3NuMGJoK2NEL0svMHZhS2ZYS29rSUlCV1MvZXBhTy9xc1FoTFNvR1dh?=
 =?utf-8?B?OXM5dGVrcGd3eE9RRURQZEgvQ0xXSDRCWXFTOUZNUFJOd2RiNnJCa3VFaTg1?=
 =?utf-8?B?TURwamRwaVh3S2ZDRXNoeGJoSGhsVERLNUs1WDFxK1orU0M0L21jSWU0cDdz?=
 =?utf-8?B?S2huK2VSdFlvdnI3enNOQ2VUVUxUVmdIZ3gwQlFDOW5CZmtMQmVMM3RybzVl?=
 =?utf-8?B?NGFqNGZnR1R6RDFhOWN2dTBsWjNtMnloSitwZGRjQzh0bTRIV1RGVXM1Ryt2?=
 =?utf-8?B?cWJncXFNQmdlVFV6NzZDcTlHZjliZ3I2NklheUhVVzFndXNmT3VuQXFUblRF?=
 =?utf-8?B?ZFlIZVR1S2FtTExhU3liakRWRm1kZVF5MjNjUHE3R1dlQ1JyVTBZSlFxdEJ3?=
 =?utf-8?B?Q3dBVFpwTm1mMDJ4Q1JGdVE3QWZvT0VldnJvN0szQTVtNVJZVGVpZkFDeEVr?=
 =?utf-8?B?cUNVWFdXbVhEdXdUWGNjeTYyWVJYQXp4VDh1aXF0dks2b1J2WDRPZz09?=
X-Exchange-RoutingPolicyChecked: DMUm/RpMZiFQjnvWko5OfoNQcmH30xKS3gIm0GH2hONbrl0pc321l4qx+Zyq7i14gVmWCRN6wlY0Y5l8GNTMuJIuwAmAn/1I+L8j6dbv2TsvKjciirP8Bg7aJHtMFR5OopmWLIi2+S+TZ5ZYQM9sUJDfwS5+0ZNm48MmM6aGIuS2UWw6JBIH+usd+j7E0wOolutn4C4fs9DZtP5mXdVNq8XwUAMdZiJHbDHJHJchEnEncRGCOKMvJ/tW8frhZVqOE6wXY1rkgRGkGrjfG4TeVN9/numMb3tX44ecZmlZZFUVsupRErLYRg2iddXK+CCVtUJ+H05vuV69oVDUUjRgDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c70b0292-d5d4-45de-21ed-08df3b5bd795
X-MS-Exchange-CrossTenant-AuthSource: CH9PR11MB309436.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 16:42:55.7896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OY77bZnnrHXdhnY/vG+GaQOQN3UscuPDDHL0d8Du6xVP6NZxKIVSkViieOAxbPiPn4tkUUouF3eHaoMdLaknA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Hiresh,

On 05-11-2026 15:30, Hiresh Kumar Yadav wrote:
> gem-execbuf-stress-pc8 skips with only "Test requirement: has_pc8",
> which doesn't tell the user why PC8+ support is unavailable.
>
> Record the specific reason in setup_pc8() (unsupported platform,
> PC8+ residency MSRs not readable, or package C-states limited by
> BIOS) and print it along with the platform name when skipping.
>
> Signed-off-by: Hiresh Kumar Yadav <hiresh.kumar.yadav@intel.com>
> ---
>   tests/intel/i915_pm_rpm.c | 24 +++++++++++++++++++-----
>   1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index b4da27b21..7ea0ce306 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -131,6 +131,7 @@ enum plane_type {
>   int drm_fd, msr_fd, pc8_status_fd;
>   int debugfs;
>   bool has_runtime_pm, has_pc8;
> +static const char *pc8_skip_reason = "PC8+ setup not run";
Is there any situation possible where the test can print "PC8+ setup not 
run"?
>   struct mode_set_data ms_data;
>   
>   /* Stuff used when creating FBs and mode setting. */
> @@ -222,15 +223,24 @@ static bool supports_pc8_plus_residencies(void)
>   
>   	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC8_RES);
>   	if (rc != sizeof(val))
> -		return false;
> +		goto no_msr;
>   	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC9_RES);
>   	if (rc != sizeof(val))
> -		return false;
> +		goto no_msr;
>   	rc = pread(msr_fd, &val, sizeof(uint64_t), MSR_PC10_RES);
>   	if (rc != sizeof(val))
> +		goto no_msr;
> +
> +	if (!igt_pm_pc8_plus_residencies_enabled(msr_fd)) {
> +		pc8_skip_reason = "package C-states limited below PC8 by the BIOS";
In case of read failures also igt_pm_pc8_plus_residencies_enabled() will 
return false. So the above message is misleading. Also if disabled by 
bios, internally also
the same string will be printed.
>   		return false;
> +	}
>   
> -	return igt_pm_pc8_plus_residencies_enabled(msr_fd);
> +	return true;
> +
> +no_msr:
> +	pc8_skip_reason = "PC8/PC9/PC10 residency MSRs not readable (non-ULT/ULX SKU?)";

why "?" ?

> +	return false;
>   }
>   
>   static uint64_t get_residency(uint32_t type)
> @@ -550,8 +560,10 @@ static void setup_pc8(void)
>   	has_pc8 = false;
>   
>   	/* Only Haswell supports the PC8 feature. */
> -	if (!IS_HASWELL(ms_data.devid) && !IS_BROADWELL(ms_data.devid))
> +	if (!IS_HASWELL(ms_data.devid) && !IS_BROADWELL(ms_data.devid)) {
> +		pc8_skip_reason = "PC8+ residency is only supported on Haswell/Broadwell";
>   		return;
> +	}
>   
>   	/* Make sure our Kernel supports MSR and the module is loaded. */
>   	igt_require(modprobe("msr") == 0);
> @@ -1147,7 +1159,9 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
>   	igt_require_gem(drm_fd);
>   
>   	if (wait_flags & WAIT_PC8_RES)
> -		igt_require(has_pc8);
> +		igt_require_f(has_pc8, "Platform %s: %s\n",
> +			      intel_get_device_info(ms_data.devid)->codename,
> +			      pc8_skip_reason);

Please handle the platforms here for which code-names are not available, 
else %s can cause issue.

Thanks,
Anirban

>   
>   	i = 0;
>   	batch_buf[i++] = MI_NOOP;
