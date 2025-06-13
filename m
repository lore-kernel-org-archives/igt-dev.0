Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70B7C71141
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 03:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EAA10E142;
	Fri, 13 Jun 2025 03:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5sLe8/T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0F410E142
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 03:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749785739; x=1781321739;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=nWaJKPHRxBRtdaBzrq66wWIS2T+9ywuJbwVu30zSyZs=;
 b=g5sLe8/Tu7wCAPPx6hCmhOagVL4oRWK3z/ydYV5vL6U6T/7pqhykCOwc
 wBi1rfU+0DlM2Jp540zuxN5DZHZuhBfWnx9Dw/XUK3I7wof7AVewuZap5
 w9MZ/kkzPqDfqCTbhzhItmxayp7NcFR2kO2wTCrOMtwy/jmNHjnT9Qpdq
 kFiN9OdUF8XXAYzvqmOTMVH8yKoj/Xf98OeQMGmAkdZmDD+7E3pZFgnNZ
 68a4RDD7ZysvJkzPry/GLa0zJ3x6wn/H42OLQQi9OZZSOtX9UkJj1FQck
 qzu8t0OPH9OGadatB6bQJFrrAZgUsSx5ND+L+KF41DoWehJzZgUzV7F0H w==;
X-CSE-ConnectionGUID: A5AYzIKiQxucWacQUzap1g==
X-CSE-MsgGUID: 2d671cMCTn6mP97LERCYPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52138113"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208,217";a="52138113"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 20:35:36 -0700
X-CSE-ConnectionGUID: DNGxansrTCqfaxKYrPIxPA==
X-CSE-MsgGUID: jWMzT+TET5eaw8WdzNbPhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
 d="scan'208,217";a="147587817"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 20:35:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 20:35:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 20:35:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.75) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 20:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgPmeUx2+YwKr0UEPxwVLDSDKlRDXUnJyjPUffyJVpIA3FCb8Lg6a9GUtkc5+0nzmZng2ERLVJgWGsCDaGBAZDMr/ZPCtk0e5pr1/Vj8FbRw2OFo31bJcR9q5ZleRS3E7w++RZSDS+zbNfQYI8PX59/SrJ53lnJ+S5xilCxlmEs2hNKclwSBYzyPyPj/e9hEQqP0cUvb2/fEwEPH3DHIODm6TSWdTJ5u1ZYfNDSXaRNayj4wCOi/bRcOND+WBAkGxM1IMat14DWoYhzegkE+BsTBhVscLo7XsyIptHWA2hN+kYA1tBzO73EsoKXhvu2y2AR3hZUn+gqiK6KkjuM2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBigGLCqYwNUIB9mSOppgTNEREjd6R7rUnbvJ2LOvpE=;
 b=l0H0zE2iLpgUP5A+0E3oD1u1m3ZQlj1nPz4nZwRmZdEYIb2jyaA3iugNpxeaHjxua5ICttX5/wSsX2oXcRNIfbk4vmg/hPOB7S/fI6tpZhaTaB9/vnkbr1ypolMEbPlRoY69C3yrm3Du0Od/xPgkzsDhKWNhNoCNIoZ5eGDRNUNCciKtPjBlWlA341W66qK85WMYz1PDfPpo5KO+fXig/wp/WLXyDj1b/UyQRTaQsUX6aKUlhqOfHqBfGXFJsEXIs7y+t37aqygBW3aCP/gILJo0lAWMfpz2vpYwFrMrFEbP+FftjNsxNWoE/lU3laA3sxisoJNJHfeWYB/k5UTOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 03:35:30 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.8769.029; Fri, 13 Jun 2025
 03:35:29 +0000
Content-Type: multipart/alternative;
 boundary="------------gQP6iNJXTrtp6BM1ykwum4qc"
Message-ID: <2b6b3910-88e7-40c5-88bb-f5c3bbc46bdc@intel.com>
Date: Fri, 13 Jun 2025 09:05:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel-ci: Blocklist unsupported Xe scaling
 tests
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250612201734.3280725-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250612201734.3280725-1-ramanaidu.naladala@intel.com>
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1dd2f1-9fd7-4dd7-a808-08ddaa2b57f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVhXcnpjSmZ5SGNKaExrYklITmdNWk5vVXRwT0Ztam1EZHhIcFRIcDNUMXRC?=
 =?utf-8?B?aGQ2RHE0V0VwbU8zdWNYbkhmWkc0V05PZnE1bis2dEwyYjJPK0dJY084UzNn?=
 =?utf-8?B?S0lFREpWSVhNaTFXTU8zMlZuME5DU0ljTnF3MXlsTWhsOUt2ckp5V2U0eUE1?=
 =?utf-8?B?elVpdHV3aE82NGZ1T3ZlcHQvQlBZclJYRzdybG00RkhrK2xibU01RVo4U0xW?=
 =?utf-8?B?ZWtKSXk1OWxxeHRodzlwcTU1SUc0emVIeHJmVjNyZTY2ZytOT2ZvTWxGUDln?=
 =?utf-8?B?bmhQTDlNalN6Y3JrbUIra2duOGVqd2RWTnd1ZWJ0d3BYbnhmK0dkQ0NvSFlR?=
 =?utf-8?B?QUJuRjhwM0wrL3BEenBydVRPZ1loTjgrKzlRRWtOQnBrbndaQWxvby9ZQi9n?=
 =?utf-8?B?LzZMSFJxRERuVk5BRTdEWHk2YlJzTHpkTWt6OEc2azRaeXdsVTVrUm4yV3dX?=
 =?utf-8?B?UmJET2FUdENCaXZlMTFIVEgxdW8vTTlmRnNWR01zREMwYW1aY2F5aGE0SVNC?=
 =?utf-8?B?QmZ0WXF4ZFdDSVg1WXlzb2FZSDJ2UUtWbkJIVHdnN2lWL2ttVk85MERwRHZX?=
 =?utf-8?B?bGVlaC8xVzV1UGhGcktoMDRZRGVEdWpXNHVHYTJoMUJHVW5meVBHQ1Npc01X?=
 =?utf-8?B?a0RVblFHVUlxUWZscm5VV0wrL1NSb09Na1R3ZnZxcjYwbm82Y2FRWmUyZjdH?=
 =?utf-8?B?VklaWHlCamQvaEdYWTd5Y01UQjY2MGkwRzlJYWFPV2hWRHJiQ2hFWVM0K3I0?=
 =?utf-8?B?NGZMaUlPbWhlSVdLRzVaenphbG16eXhFS0l0REEyeDM0UlkrMGhKaW55RGVs?=
 =?utf-8?B?WXpQa3FLcy9Ec05JbG1ld1VLTVN6MXFKRDVIMlMrMlFlM0NLbFpWMkhSZTRW?=
 =?utf-8?B?MDlUYTE3TkxFWWVYeW91M28xOGNaWFZVdldkL0U4cjRCTnlIWEdscUFEaTBs?=
 =?utf-8?B?STVkT1BQRFFzSjI4REN6Vkg5RUR4Z2tkQTN3RjNFZU9kUHRSVVgxcDNQVkp5?=
 =?utf-8?B?U09sM2NUdnk1NjZRMGFqaFZ0RzUyM0NpRjdUTjBDaG1iTVkxa3lub05Ja3lB?=
 =?utf-8?B?MWZSSGxFUjhXS3NIQ1F5L0F2WGFkNk03MmdpT3llamJoUDRhWWg4R3JXN0Zs?=
 =?utf-8?B?U3dQQS9oc2JJOGZyc3ZzWVZiUWZDRTh3TlZrMGhIZ1NNM0JJRGk5a2hIK1I3?=
 =?utf-8?B?ZVhURk9uckNDcXlmeGZwTHRiWjUxOTdFTzZuT1g0WW1YSDIrdjRSMHlIcC8x?=
 =?utf-8?B?OGFib0cyM25XejMrWFpZY3BvQ1JaZzRmWk9Ca3Q2ZmFoakhrT2xKZW91czJY?=
 =?utf-8?B?amh0a2hvdWprR0tOdXdnM0xZajFJT0pDcTZlaEIzSjVOSUZuamtRK3o2NVVy?=
 =?utf-8?B?dU8zS3g2N0tDeUcrd0pJd0VjZGROL3BYYzdEckh2bkZyS010SjVLWmV1anJP?=
 =?utf-8?B?VTdaaGp0V2ZjTjRYWlZkYlg4VzF5TEMvZmJvaFhPcUh5YjBWVEdpaUJIK3Q3?=
 =?utf-8?B?YVlhaW1tdldOVWxsVCtyK2JWbVBqTDVEZmR3eUZvR0tmNnNoNzYwcmJuVkZz?=
 =?utf-8?B?eDRGSHZTVjNGTEZXVVkrVUxLa1hXRGwxTThaekF0L295RXAvSmhkZE1TenVt?=
 =?utf-8?B?ZjN6bVAzQzlyMm9TUkZaOWo2VjFMTUlCalN0L01WK2YzNmJJQ0NvZy81Z1NB?=
 =?utf-8?B?NkE4cFNyVTFRUzA1b0NkN0JZZVlyN0NzVEQ1ZWJrL1M0SVVsVGcxTTV3ZmVU?=
 =?utf-8?B?SmJYOEJUL0ZCNjZxbVo3MS9UbnU0VUVjWTg0RFo5dGdKNFZVNmhDaHVKa2RO?=
 =?utf-8?B?L2wySTdJZlZkd1A0ZUQzTG5WVXhtQzVZalErczYyMWJ0K0J5K2R6K1pnZ0Uw?=
 =?utf-8?B?U2JmVDR1Wno0MVVzcFdORG5vS243QUxSRHBJcXdOMGJWNnhmOGFTa1pDVlVp?=
 =?utf-8?Q?6ofJSTNLsQw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGJVNzRYWU1qNUFGdU0zLytoMkZqZGc2QTdtUU1GL3BraVRTZVhGTndUOFJi?=
 =?utf-8?B?eDIrUWc2allWREh3NU5kWlNWWk82WGtGUnE1Mmlldys2dFZzbnYyZDl6dlhr?=
 =?utf-8?B?dUZyalFZV0U3TkRCZGpTVlFoVWZndlJRY1gxTE5qNzZWOWtJYXV1YXpZVG9X?=
 =?utf-8?B?em0yblQ0ZmNyMHRTOGJqNUpFOFpzVHRmNDNNTlJZMGI0S3I5emw2cXprdmhy?=
 =?utf-8?B?bmZGNCtHUWVtY0xsQlZIdHNJOXU0b01vcEQweHZhU0pxaFBhd0tSd0hkOWdI?=
 =?utf-8?B?Y1pGYVRacllDOGtuTkhmNmlPUnkvSlFvcTFROFhUUG1iQmZ2ZEQrUWMyWEpE?=
 =?utf-8?B?cG1BRGlMTUpIbHY1N0JKMXllQnN6blk1RmhtclJ3Y3VwaUdveWtiK1ZSVTBl?=
 =?utf-8?B?bXk3d3NOVzN3dzRqUXlMM0paNmZCRWVIMmQvbm8wR21waWorZUVNaEVRU21I?=
 =?utf-8?B?RGxsOFNLdnVBUGNyUlJrL0xlbFVNeURQUW1Va3dqVlJVWU9SWUxaT0E4aUc3?=
 =?utf-8?B?Wk8vSmpVSUUyM2M1U2pMc2o4Rmx0cVlMQ1hzUlh6RzNISzh3OFRVdXdkTE1G?=
 =?utf-8?B?Y3RHODFrcUNlU2NPZHQ4bDFPa1ZhUjlVY0sySjQ4bDFvL0hqeU8zbWxOMmdu?=
 =?utf-8?B?eFpvbDZCVE5vTnBPTytxY0pEN3o3OXY1ZldURTVUcjkrOFNIV0lrbjM3UVJD?=
 =?utf-8?B?SzJUeGRkMVRMdTBFbUN0SHU1cC93Z2plNnZxZGo2RVVLdDRIUUsxR1lSUVov?=
 =?utf-8?B?b1B2cjFLTWhWTTlKdzUxMjJUUzJidzk1aUFId1JZbjVGMWo2MjdLa21vRGk3?=
 =?utf-8?B?NXpjZThvL2VSY091ZzFadHBpSThIQ3UzZSt3QVlxa2l0VzVtOURyeW5YRWhh?=
 =?utf-8?B?dENmRURUa0dYSDRBZDBBY2FvMU5JN3ZHWktabjhSM1BvY0RUQ2pnd1MvOFFj?=
 =?utf-8?B?U2RwYVdNWjNsVDF6bDA5enBuRzhlS2E4SjhhTmVXSHNXd0dDcEVqcjladzV4?=
 =?utf-8?B?Y09NbHFnWER1SzdRMWRhTlRoZ1RyVnBDS25mN05sSzA2cVpoM1A2RUV6cC9T?=
 =?utf-8?B?RUZKTlFva3VEUFZIYyttcmx4aVIzTW1OeklJSEtVNmNuemtuL2VaMDZHUWZ0?=
 =?utf-8?B?bTNRNGloM3RjOVhnZUd3Z1hpY2hWanhucUZ2eUo1QVBBa2ZhTlFGWERxZWVq?=
 =?utf-8?B?bGMvbUJ1VkxvQkdNc1RQTGhTSWR2enZFT053Q3VJdmptbGdkSzNlT29kYk14?=
 =?utf-8?B?RnRKbFplVDVKMkVtUTV6eXZtSDdiTFJWYzQ1bkVhTTlIMXV2dDFQRmk1eUJB?=
 =?utf-8?B?NUpCRithRm1OeTdDN1phWnJ1YU1vcW5zaE1nZ1k5b1RtTEkyRzVBL0U2bVlz?=
 =?utf-8?B?a1B4SkJ5dk1NclVrRG50b201a3NhL05WTms2OVlLcmNSd2NIVmJPOVBHOUxn?=
 =?utf-8?B?VkZjNytiejc0YkpUWWxtVlR5cU5zY1dXRkozMGNaTUcwb2QzMnZOK0ladC9O?=
 =?utf-8?B?VENRK2tBS0ROQytkbk93MWxLbWZlS3lCZURxTnBMVE91RzdNeU4ydWxxUXRG?=
 =?utf-8?B?VHJ2Nlp4NS9nNk41Q29kdUpmR3hhTnB4blQ2c3ZCczl4UUYyNW9hR0hFVmJG?=
 =?utf-8?B?dTJIQTJxQlREZ3FRQ3ljbFNwUW5rT09Ca09IMlZuK2U2RGNsc3BTNkZLWGZE?=
 =?utf-8?B?SjVOQWdabWRXbHpMbThSYzhWeTAvMGFXRnVoZ1RNOUhUdGw3dStHV1d2UHFy?=
 =?utf-8?B?cCtuZXk0VnNtKytuVnpIMG8xTXlNaTJtdjNHOEhqaGxtRG5RUnpwSzJTNFl4?=
 =?utf-8?B?UStHOXBwOTlXai9tYXhNUHV5R05SdHpzZ2lJZTliUXJJalArL1RHQ2NZRTgr?=
 =?utf-8?B?TVkzdkQxUS9TZUNzOGx2a0NiTGkrSjc1dmRreEp6S0FZbmZOclNTbytCZ3JE?=
 =?utf-8?B?UjcyYmJMczFQT1c2OEJicUliNis2WG9xR2tqYmdjbGF6Y05nQlQ4eVMwVUxz?=
 =?utf-8?B?UHcyOCtxKzdRcDY5ZkZpRTRBMDY4NzcyVkFERUxLQXl1MG5rd3JML3RzV3JV?=
 =?utf-8?B?dHBzWEd5V2h3RExvN1AxejlkdnFDTTJXZDhrYVk5K3hhK3R0anhhVk13WTVF?=
 =?utf-8?Q?o3RG3f9a000hzMG6OWKFjl1uY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1dd2f1-9fd7-4dd7-a808-08ddaa2b57f0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 03:35:29.6379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tP3AQnca8LNnrI42mqx28rpYlYZwhW1Ta0vrkoz3k+SrkRRqT8CAmE4O0iyESjQsqR1Y0RKMRUZcMnKgS1BjtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
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

--------------gQP6iNJXTrtp6BM1ykwum4qc
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 6/13/2025 1:47 AM, Naladala Ramanaidu wrote:
> The second scaler does not support downscaling in either
> vertical or horizontal dimensions. Blocklist the affected IGT
> kms_plane_scaling tests that involve downscaling scenarios
> unsupported by the second scaler.
>
> Bspec: 69901
>
> Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index ebe1ff006..8e43c217d 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -82,6 +82,10 @@igt@kms_pm_rpm@cursor.*
>   ##################################################################
>   igt@kms_atomic@plane-primary-overlay-mutable-zpos
>   igt@kms_plane_scaling@.*downscale-factor-0-25.*
> +igt@kms_plane_scaling@planes-downscale-factor-.*5
I see few of the tests passing with this filter where we've upscale on 
the second plane. We need a more specific filter here.
> +igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-.*
> +igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-.*
Could the above 2 can be combined into one? 
'igt@kms_plane_scaling@planes-upscale-.*-downscale-factor-.*'
> +igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-.*

This I see is mostly passing other than 0.25 which is blocklisted 
already. Do we need this?

Thanks,
Karthik.B.S
>   igt@kms_prime@.*
>   igt@kms_scaling_modes@scaling-mode-none
>   igt@kms_writeback@writeback.*
--------------gQP6iNJXTrtp6BM1ykwum4qc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 6/13/2025 1:47 AM, Naladala
      Ramanaidu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250612201734.3280725-1-ramanaidu.naladala@intel.com">
      <pre wrap="" class="moz-quote-pre">The second scaler does not support downscaling in either
vertical or horizontal dimensions. Blocklist the affected IGT
kms_plane_scaling tests that involve downscaling scenarios
unsupported by the second scaler.

Bspec: 69901

Signed-off-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index ebe1ff006..8e43c217d 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -82,6 +82,10 @@ <a class="moz-txt-link-abbreviated" href="mailto:igt@kms_pm_rpm@cursor.*">igt@kms_pm_rpm@cursor.*</a>
 ##################################################################
 igt@kms_atomic@plane-primary-overlay-mutable-zpos
 <a class="moz-txt-link-abbreviated" href="mailto:igt@kms_plane_scaling@.*downscale-factor-0-25.*">igt@kms_plane_scaling@.*downscale-factor-0-25.*</a>
+igt@kms_plane_scaling@planes-downscale-factor-.*5</pre>
    </blockquote>
    I see few of the tests passing with this filter where we've upscale
    on the second plane. We need a more specific filter here.
    <blockquote type="cite" cite="mid:20250612201734.3280725-1-ramanaidu.naladala@intel.com">
      <pre wrap="" class="moz-quote-pre">
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-.*
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-.*</pre>
    </blockquote>
    Could the above 2 can be combined into one? '<span style="white-space: pre-wrap"><a class="moz-txt-link-abbreviated" href="mailto:igt@kms_plane_scaling@planes-upscale-.*-downscale-factor-.*">igt@kms_plane_scaling@planes-upscale-.*-downscale-factor-.*</a></span>'
    <blockquote type="cite" cite="mid:20250612201734.3280725-1-ramanaidu.naladala@intel.com">
      <pre wrap="" class="moz-quote-pre">
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-.*</pre>
    </blockquote>
    <p>This I see is mostly passing other than 0.25 which is blocklisted
      already. Do we need this?</p>
    Thanks,<br>
    Karthik.B.S
    <blockquote type="cite" cite="mid:20250612201734.3280725-1-ramanaidu.naladala@intel.com">
      <pre wrap="" class="moz-quote-pre">
 <a class="moz-txt-link-abbreviated" href="mailto:igt@kms_prime@.*">igt@kms_prime@.*</a>
 igt@kms_scaling_modes@scaling-mode-none
 <a class="moz-txt-link-abbreviated" href="mailto:igt@kms_writeback@writeback.*">igt@kms_writeback@writeback.*</a>
</pre>
    </blockquote>
  </body>
</html>

--------------gQP6iNJXTrtp6BM1ykwum4qc--
