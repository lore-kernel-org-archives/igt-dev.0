Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC08C369A0
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 10:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FD310E98A;
	Thu,  3 Apr 2025 10:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3YMwPnN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69B610E98A
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 10:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743675198; x=1775211198;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G7xP7d7XywyCUTKvZUia2IAG0jBySkrVgMxIPmXJYT0=;
 b=e3YMwPnNN0IMLTeg9vhZuoeUtpYsidqjIoEc5jdnUw6LNh/Dc7uwzTC6
 FOkOoxTdsIifxiZKpsWuw0dXLnZkHQOGNydRJJ2IvdH9BfJPD/RWK2xnk
 ToxPfVwYqQPczsI/yFvfmmvpmvUW1udvjz1bfbb8uMLxBzYrg/kGtX3ux
 M51n5KRBQ6fxoDBdJTQGvVyrUp/g+QxZAB2DuWIQf9EzZNJwq33P3smzH
 p95tANcy19ArxyKRJOtjv6+0c8PWpCyYMXKI4pG2ADrugd7i3VTt+XpJk
 W0UwIQQn5mcavVb3tN9dIOiaCd62huMdZ4iYvyq73Nx2YkhW8N/rDdoDJ g==;
X-CSE-ConnectionGUID: 20pwOEvhS6yFB74J66cwhg==
X-CSE-MsgGUID: uLh9L+C2T2udfo9XoLjVPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44225389"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44225389"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:13:18 -0700
X-CSE-ConnectionGUID: Akf9Cjc6Qr2zFwpCqXjw9A==
X-CSE-MsgGUID: FgwTuPzUS6Gm+oaMuKbuAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127474364"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:13:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 03:13:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 03:13:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 03:13:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIwhPo9wEcd8lElq4nd8hMBAs/Nhye0lJO4fbbZ2lHgN5lIpRHZr78sr60DwZFVWBAFgMaw1TZFFyAPdJuVUSPY+dq7D/EO6BHF87I7VGFdd4sBEUTqXvv5ApJhhtK7++2z4i55a2PteYszRHNj1lsqCV+qy8PrxBmMlo88ezy/tw+xtj+bDSSOzG4mf2H9BKw2/VEWOuomQDlsb6YH8x6+r+OmjVBvUAMMqPnO+vC8loxm47kBtvSp/Vq29E+4z23Aj84KoJ0XPcpL5TbucvYIKJI7owq6e8ki0eEOYVscBft5fH6dLUb7XftyjBjybob82bYhtzxbHvhUxxxc4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryRw1k2auD2EzsGUDrdSf9AK64Gguq/qBWDs0fCgI9Y=;
 b=RyOoPaNPC62mUXklqWjYAQVZUxtMWRfkiW7J1YQ6Wh9oqWv9q6jVlL3Ev1lRq6yeTlD/+LimeBYDSRJ6ywfMZl+7F6NEm38GUuwwkGya+lz1/Rh+kZ8tNJuq+DmZMp1uoRkN3jGww6Lzock4/0AmmZF14DAbGEX6FKsdVoHOc4EKkUwpamNEM8fsIFOAtWA5frYBA5EDWHMyuvsymbIkVYtt9TfIRf+Wc+KDx4UGSrnk/CfAKFUtNVG3dqV2zBHEWK7UjiCr31WF+vXDS5Z6FCkYiuYjmsOXjILete/9K3+kpdXxaCrsX9Yyoq6/Ora7/etOq4ia/v6l8fI8N28OMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 10:12:47 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 10:12:47 +0000
Message-ID: <56a5a821-4a97-49ee-bbfe-5578ec878a4f@intel.com>
Date: Thu, 3 Apr 2025 15:42:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 00/37] IGT tests for the KMS Color Pipeline API
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::32) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ea8c3e-4811-4742-29f4-08dd72981509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnhRc01wYzVIT0xTclUyZ2NUNUlmWU9lbWJEQWtIcGV3WThSS1pjRWV1bXQw?=
 =?utf-8?B?UVo4czhOcFZORmlnMkVsWHN6Y1NmUjhLSEM4VHVVUDFsWHE1d3VOOXBObDFh?=
 =?utf-8?B?ay8zVWw2cEdTcENheWhJQjZFNUNsV3c0Y3dDZnNYRit6K0tFS3JzelJMT09m?=
 =?utf-8?B?dDAvNXV4SG80dGdpMG9oampPekRCK1JBWUx2eGNHa0U4Zm1pckxiY29pK01L?=
 =?utf-8?B?Q1R3dFR3OUtYU3haSE9Ra25TSnJ1QWZld0FPczZVZEN1eEVEOFJLekZsU1Fk?=
 =?utf-8?B?SzRkbHdVcUVNRXFuaXRCK3d2aVdOMEhvUTdUNGlqWlMrMmluTVY3eFBHZVNV?=
 =?utf-8?B?V2lKTk5mUVlaRWN5bnJ3UFREQmVxWDNXWkZ6UnVEN3dla3I2UmtPaUwvQ24y?=
 =?utf-8?B?SVZ5SmZ0WFpQdno5cE8yY1FiRlUyeFhTaVJuemwrY05NZVFvNFFpVEFxaVFx?=
 =?utf-8?B?Q3lWVzdzQ2gzbEtrbENuT0ltcjJXUkZqYVFLRjdMWW1COWFVSEgrdENIbEQz?=
 =?utf-8?B?czcxdTNXZTRMRlo1eEY5NG9aYXZZVUtaZUMvMlg2c3JpV1NjSGdKbEVUZWxm?=
 =?utf-8?B?enRIdGIyalRlK0xyd1NMWmVpYURsZ253VTdGa28raitZekRwbHF1QnRhdWM0?=
 =?utf-8?B?MnNaRFRnQ3R3dm5tVnYxSkR0UkNveDlKbXVZbW9MeHNlV2JSREo5ZERYUGxt?=
 =?utf-8?B?aFdBYVJSTFErdFhYQ3ByUXoyMUp4NlFjUWdGQTVIbUpWK2hRdzBjL3MvT3NY?=
 =?utf-8?B?NFFjODFUNGFQeWVwaHRrK2dkNDFEcXdSWmZmemtOWHJmMGZWdUt2eWUvWTlZ?=
 =?utf-8?B?aHZCZW1YblhUSGZnSVBZd21TdTlVUnVDN2JnNkxnRUgxaXVRUUJSKzU0U0Nk?=
 =?utf-8?B?elhqUHloU0ZBRmRHMkV1SFhXSHpsV09oZ0JIUXV1SDBYdytraVVBTFoyeWts?=
 =?utf-8?B?SU5iZFkvditZc2VmQU93Yks3MG9vNkZkUmYyL2hRTUs5YmFwZU96bVhkSjJ1?=
 =?utf-8?B?SVk4VE1QNWs2Y09WaWhmOWhnVmZVUEtaQk5EV2Q4eVdvdzdzL3c5c0pOZUUr?=
 =?utf-8?B?U254bW05Ym1GRWp4dkpRTmwzTSs4RTRyVUtyRXdjVFJBaDlKaElkRGI5SWo3?=
 =?utf-8?B?QXRoUkFWVUNaSC9XY0tTZlI1ZlZveUpDbXNRUDdNWE54R21lWTA0VjhldEFM?=
 =?utf-8?B?eDlTanlMS2IvY1E3dVZNd2VUTmNWR2hacUh1TENwSjduclY4dW8yTTUxeUN6?=
 =?utf-8?B?dWtoUS90aU16ZzlRQ2dZTE1OWCs1clJNODNvVENyZ1oxR25SUmNOMis2WEZV?=
 =?utf-8?B?RUhkcWZQK0hwYlJRbTM3TFlBNjZTdW8zL1RnbGM2T1VtRWpWK3dxMHIrdEM4?=
 =?utf-8?B?dGpCcmJnc3RYMWxsQVMvVEZMdFhZNHpIWnRxVFpRbnpidHlwdWk4dUUxYTdP?=
 =?utf-8?B?WHdYTmV3OHdVZExKbVdKQ2I1dmEvbHJUS2xNYm90WWVScDQrV0h5R1pobG1w?=
 =?utf-8?B?a3gyd3hKU3orNEhNWEZaUnEwVnhBT0JTNEUyeFJCWnRQNi82bzNxL3U4UU1J?=
 =?utf-8?B?NWo5ZFRLNktvaGlGQW4vMlJPeVR4WGo0MW9Qc2x5aWo1eDAxZzZWbWduTkpu?=
 =?utf-8?B?RGlVQkRyeEd6WEFZcXcwZHkyT3c5WXpHVWZ1VTMzeUZqR1RqQUhKVG9Sc08z?=
 =?utf-8?B?R25rSElYVW91YmNtZ0FvcjFIWlo5MXpIT0pBN1MzTzlSWmIxcUZ1bGlIbGZz?=
 =?utf-8?B?ZXdHSnMzb3ZaL0pobktkZEQ2a25weVYwNnRIRzlMYW5QK1VFWWhZaXZXbXJC?=
 =?utf-8?B?dGgzNGF5clkyb0dSSDFxZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2JuVHdzM3lPUi96bjZjSVNxZFFJRFZMa3Z4a3BTMFE3VktNNExoV3d1M1Q1?=
 =?utf-8?B?b0xiRUoySExsUDlsQmNCbEhaL29jSFlvV3Z2NHExMlRtVmVnTVROMjNMTzhM?=
 =?utf-8?B?TTJQM1ZyNW5rYllqY0wvU1FXd3JNNW9GU1RhN3A2ZXBKNVZWV2NCaFhSalZo?=
 =?utf-8?B?UHBZeXJqSkIrUEdDRzljS05RcitFcm5hSmJ6WElYemY0cm5zNU02eUZGemgv?=
 =?utf-8?B?M281MGd0aUlqN2Y0N0FUaGIwVXc5Y0NCSldMUGxmcDZOTy9TYlZIcmdEb2VR?=
 =?utf-8?B?elZVd0FSY0lZNWsyb2NEUkJ6UGwzemh1d1NmV3FlN2h4d3VrcVkyVEZGMm5o?=
 =?utf-8?B?TWxxaCtnSHJwNjJUaDlEaHdDQUd0NTgyRjEzMDlPbjhUQ0M3cEVJaVNPTm96?=
 =?utf-8?B?a0V3SnVsaXVnMGtrRitjNzZUTGZFcndiUmYyOTR3cU9pZ0xrMklPUkZnbWxV?=
 =?utf-8?B?RkFya3c3Ums3U01XZktiNEdmaE9lczhDSmp1S3c3Z2MweGI2cGlBWWV3QVg1?=
 =?utf-8?B?SG9ibkpEbWlTSDVBQStZRVZUamVOVUxzR1BvV2I1SC9ZVW1rNWpETktvZGlT?=
 =?utf-8?B?aFlLQkE0TFdVdFVCQnJuUkR1QUJVeGVzS2h3bnh5TlZyTmd5WG5aMFhUMGkr?=
 =?utf-8?B?ak0zRjFuYjVWdlN4cWZ4aHpIUUFITXZyalZTODRxaURhRXZBUU9CVmYvaFlz?=
 =?utf-8?B?RXFrNi9aMUNUTG1UODFnMjV4YzUraHUzYmRmMzA3SmlDWGhBUTVRRTB4VExo?=
 =?utf-8?B?N00wZ2VCVFg5RzZNSENsM0F0WFEvdGYyZWxwMkI5dnR1WU5sWE9LSS9yK2VP?=
 =?utf-8?B?YWhrWER0SzU0bFhVVGFwaFo4OVRMd2ozUWxFeVFOOHJ3c3NwTDZodEppWUZS?=
 =?utf-8?B?RjVXMGRiTW1Zc1p6QmNMSXJweXRyakIwQ05qcUVoV21TUkZJMER1dWQzNkVv?=
 =?utf-8?B?QnlCRUVEM1JPajl5Sm9WQWQwY2ZLdG1qR3h5NWNYMFJndHBxWHMyTTA5Y1RR?=
 =?utf-8?B?RTd0dVFVcm8vdTRxbzBzSnN2cmJNNzdjajZCVVV6bTRnbmJETHlsa1FjcEZZ?=
 =?utf-8?B?Y0ZtR20zSjMxUTNxbGc4bmZHbHlUcG5pNmNwWFZ6SzBhYmJnYTdhUWZNNkk5?=
 =?utf-8?B?Mm9IVTZuVFhBQnBVT0NoTEsyOEQ1dkx1U0pYYnVxbHVVMm5adjlpUmFwTTl0?=
 =?utf-8?B?UW13Rnl5L2Jpdm4yZ2hBSVpORUFUOFB6Y21Mc1RiKzIzTDJKdjRDb2NSanEy?=
 =?utf-8?B?bWkvWXo1eDdPR0JqY2VzcGZ4T1VpZkI3dDgwdTB4dWlyeVlFVTU0Wi9QeVhm?=
 =?utf-8?B?NWJ0UHVhcWYyWmxPSkZiNEVWTmNaaGJQWVByN1NqTkt2SkU0N1JVOU5KUHBP?=
 =?utf-8?B?KzNUbzIxSmFpdnBQVGRIODNxNEFDbjJKRXhZQkFvY2lOeUJwWGhZblAxc0Nu?=
 =?utf-8?B?SklPQ0pick13dktrZk5XVWsySWw3WlRPUGw3b3E1bmdnVDRFNExzM20wdlYz?=
 =?utf-8?B?WDQ4K0NGQllKc3NLNnd5R0pvZmRzYXA5UTF1T1kzOTczVEl3RjNqak1BY1pY?=
 =?utf-8?B?dzkxdU1KTm5ObGFjcHppZnQ5dzlvbzlBVkF0OGFZYnpUKy9VSHZvSW1BcnFC?=
 =?utf-8?B?a1V3WGUramRzN1R4eWpqQVo2RjA0Vkt1em9kb0FhTkdlL0ZzYzhBaGhPRm1x?=
 =?utf-8?B?ekhPZStQdXdyUHJQR3BlalgxdVRlaWZQakJVTVNLTDJ1ZW1mNVhSZWlhY3hQ?=
 =?utf-8?B?ZGxzLy9jRExpajlueEFtZ3l1My9jUWFMOCt5OC9iN1d6TXJrUFY2SU5EUkJJ?=
 =?utf-8?B?QXBlL21tMjZlV29MbU1PbFBHdndUdTNJUXZNU0pxTkhzcFpWVzVuTWQ1VGR4?=
 =?utf-8?B?RW1FT1hzMFVOTjMxcVlCRi9neVprR01Kb1NhQzFNNTJMV0JzQmI4MFpOVmtk?=
 =?utf-8?B?RUlTWTNTYUwwaUxwV0xCTGFBTklkNkhwZCtObUJNb25GYWQrQTNpKzhMOWI5?=
 =?utf-8?B?d3ZKQzV3TXlwKytFY05kelFCUG5UMm56bXF0NHczSEk2d0hjRnlaallWeFZ4?=
 =?utf-8?B?RVJrR0NaMUNuYnBVanJBMGpNUnUybUQ1NEVnSkc3RVlHTU16M1ZOSXhPeThi?=
 =?utf-8?B?S1cxQ0xONUhSNUZYZEY4UGduU0pLK1lhQWRrbHFLNlhJUStlS2VZOFhlRUls?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ea8c3e-4811-4742-29f4-08dd72981509
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:12:47.3010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84L5wHhSfMJpSbi7jkdLssbBmwxL3FNOKOkef33W3YL0pcfW6jtWom4UNaE15LuLaKEbQ5BGfckFzdcIM+eVdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

Hi Alex,

I could see there were few patches from Bhanu in rev4
required to enable plane color pipeline on intel h/w.
https://patchwork.freedesktop.org/series/123448/#rev4

However, those seems missing on latest rev7.

On 27-03-2025 05:05 am, Alex Hung wrote:
> This series introduces support for
> * drm_colorop DRM objects
> * COLOR_PIPELINE plane property
>
> Kernel changes can be found at [1] and on dri-devel.
>
> It also adds a new kms_colorop test case that tests the color pipeline
> API. The tests are designed to be easily extensible with a "transform"
> and "compare" function pointer for each test. The "transform" function
> performs the transformations under test via SW routines. The "compare"
> function compares the DRM/KMS result (via a writeback connector) with
> the result derived via the SW "transform".
>
> This series introduces a number of tests for pre-defined transfer
> functions, custom LUTs, 3x4 CTMs, a multiplier, 3D LUT, and a bypass
> test.
>
> It tests 8-bit and 10-bit RGB surface formats, depending on driver support
> on the drm_plane as well as the writeback drm_connector end.
>
> [1] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v8
>
> v7:
>   - Add more documents and sync up with kernel implementation
>   - Update 3DLUT tests according to kernel changes
>
> v5:
>   - Bypass test
>   - 10 bpc support
>   - Proper setup and cleanup
>   - PQ/BT2020 TFs
>   - 1D LUT tests
>   - Multiplier tests
>   - 3D LUT test
>
> v4:
>   - Intel color pipeline work, to possibly be combined with v5 in a future iteration.
>
> v3:
>   - Remove need for IOCTLs and libdrm changes
>   - Test colorop properties with both atomic and legacy code paths
>   - move enum drm_colorop_type to drm_mode.h
>   - Add descriptions for public functions in lib (Kamil)
>   - Use SPDX style license identifier (Kamil)
>   - Replace Skia license comment with copyright note in file header
>   - Fix kms_colorop subtests if applicable color pipeline not found
>
> Alex Hung (9):
>    lib/igt_kms: increase MAX_NUM_COLOROPS to 128
>    tests/kms_colorop: Add a sRGB test for EOTF -> Inverse EOTF -> EOTF
>    lib/igt_color: Add 1D LUT color transformation support
>    test/kms_colorop: Add tests that exercise the 1D LUT colorops
>    tests/kms_colorop: Add multiplier tests
>    scripts/convert_3dlut.py Convert a 3D LUT to igt_3dlut_t array for 3D
>      LUT API
>    tests/kms_colorop: Add a 3D LUT subtest
>    drm-uapi: Update kernel doc for drm_colorop_type
>    drm-uapi: Sync up definition with kernel colorop implementation
>
> Harry Wentland (28):
>    lib/drmtest: Add is_vkms_device()
>    tests/kms_writeback: Fix kms_writeback for VKMS
>    lib/igt_kms: Move get_writeback_formats_blob to lib
>    lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>    include/drm-uapi: Add COLOROP object
>    drm-uapi: Add 3x4 CTM
>    drm-uapi: Add 1D LUT drm_colorop_type
>    lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
>    tests/kms_properties: Add colorop properties test
>    igt/color: Add SW color transform functionality
>    lib/igt_fb: Add copy_fb function
>    tests/kms_colorop: Add kms_colorop tests
>    lib/igt_kms: Add support for DATA colorop property
>    lib/igt_color: Add support for 3x4 matrices
>    tests/kms_colorop: Add 3x4 CTM tests
>    tests/kms_colorop: Add bypass test
>    tests/kms_colorop: Parametrize the buffer format
>    tests/kms_colorop: Add 10bpc test and skip if format not supported
>    tests/kms_colorop: Skip if writeback does not support fourcc
>    lib/igt_fb: Allow any non-planar format for igt_copy_fb
>    kms/colorop: Do proper setup and cleanup
>    lib/igt_color: Support color transform for XRGB2101010
>    tests/kms_colorop: Set wide [13, 13] bracket for comparison on amdgpu
>    lib/igt_color: Add PQ variants for 0-1 and 0-125 range
>    tests/kms_colorop: Add tests for PQ variants
>    lib/igt_color: add BT2020/BT709 transfer functions
>    tests/kms_colorop: Add tests for BT2020/BT709 TFs
>    lib/igt_color: Point license header at skia license
>
>   include/drm-uapi/amdgpu_drm.h |    9 -
>   include/drm-uapi/drm.h        |   15 +
>   include/drm-uapi/drm_mode.h   |   99 +
>   lib/drmtest.c                 |    5 +
>   lib/drmtest.h                 |    1 +
>   lib/igt_color.c               |  648 +++++
>   lib/igt_color.h               |  162 ++
>   lib/igt_color_lut.h           | 4946 +++++++++++++++++++++++++++++++++
>   lib/igt_fb.c                  |   34 +-
>   lib/igt_fb.h                  |    3 +
>   lib/igt_kms.c                 |  359 ++-
>   lib/igt_kms.h                 |  100 +
>   lib/meson.build               |    1 +
>   scripts/convert_3dlut.py      |   94 +
>   tests/kms_colorop.c           |  702 +++++
>   tests/kms_colorop.h           |  261 ++
>   tests/kms_properties.c        |   94 +-
>   tests/kms_writeback.c         |   38 +-
>   tests/meson.build             |    1 +
>   19 files changed, 7523 insertions(+), 49 deletions(-)
>   create mode 100644 lib/igt_color.c
>   create mode 100644 lib/igt_color.h
>   create mode 100644 lib/igt_color_lut.h
>   create mode 100755 scripts/convert_3dlut.py
>   create mode 100644 tests/kms_colorop.c
>   create mode 100644 tests/kms_colorop.h
>

