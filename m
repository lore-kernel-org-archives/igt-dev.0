Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617DCD2E9EB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Nov 2024 13:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D0D10E1AD;
	Mon, 11 Nov 2024 13:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeCLVTGu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A07010E1AD
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Nov 2024 13:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731331232; x=1762867232;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+6OOqtZ4qzDi9YigE2Q5tUIKlZJPolk44MdMnlgxG9Y=;
 b=VeCLVTGuVViOkqkzDwq+xzR2nOTSMMH/mWNa5kSrEDCajFjDVMpw6qnJ
 Y5HQSj0NDhPG4yJnRiNk2sDPbuMFmlc+yTKorW6u4AYRKq5oD4TbVjf9F
 unUpcHdtQXcDlyS1SD8v8OZrz3UaFOsAU1ofKezVGk+zungdKm7l6X4zV
 LGcXVMMy+SgQi4vXso1Y66wgcQLlFUazEx8neW3r3MBmKKa39ERlp+uVY
 g4jjxlADTvBqV3Rrcyyf0hbrXtgtXVqP6NGw5HgOrpdjL/KhnEQoJ5udJ
 xyOdY+ZgF/doX3J5JfaDw2DtXXHXM0riUekVsjzo2rbTqv7bwNI87sudz Q==;
X-CSE-ConnectionGUID: DrUwBardSTqk8Veb0vhm2Q==
X-CSE-MsgGUID: K6UlFX3UQ7mWnWNZ/YT/Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41695104"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41695104"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 05:20:31 -0800
X-CSE-ConnectionGUID: kW9JRd7/QlOlDzjgAgMfxg==
X-CSE-MsgGUID: NLd+4BoBSPOAglVUyOe2Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="87709645"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 05:20:31 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 05:20:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 05:20:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 05:20:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4dkdpIT0KEXg4Ra3UdyfOOETZj6FvRTbUloXTwPkISzFZIttyhbcx4IkPkT8WqPqGes9YRzmEBNOMYszIl7l7nV/Lnm86I471tpuFc4Z2Kc9gdqAkmLKuGuwWRXX36ZEM1FXIMCS2EOpS45/DzSqkpXzPaE8f39PhSNaVvAFUMzqIJxz8YxQ/znMFuu4z0W8RAHEnx7l4+S80zJ8WA5rpIMwihcGLOIUderc3ZBlnExvMOqESTxRSjvg8qtT66WDfd+rvkCM07EjU80eMixoNygDUBnC0LXCyUZbuE5W0hvN+72lVGkbCQ44SXU2tW3gIL4kP/qWg0JUOp5UD7zLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9g37godUa/mzqNgtJ5Y/mirjjIyvSGzu1clGvLq0mQ=;
 b=SvEoaBMruTkdjH6OBvZKxkxr7orIoP/CRwdj4reQYjzlh7eL0HeUfzKW5LN9E5UNTjO1e5nKlAOzUpcoZTeasjoqKOQ8R0ZMEapiTfoHDJOTqtSzjnVYU7tRP7mgwe8GpJ+hgPD+W0Jwk6ZrDjRahVF3g9YiX1KO564ttuT+LZhQ3/u7a5r1aMDY69m7Sa7R1kvRwEDGIyR+7sc6eLuAKzkXYNzikB7OgcgnzWgSMtbWBcy3/H50uYDN/yu1dr84b8KWkd/hIA0zCjbPvNCdrRzO6INIE4qcm+f4OyKSAvZ88A8KLLmPBezo+K8V28qeXhrJlX0PHZn4I5gTKdtJWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH0PR11MB5950.namprd11.prod.outlook.com (2603:10b6:510:14f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.25; Mon, 11 Nov
 2024 13:20:26 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 13:20:26 +0000
Message-ID: <62df4ce0-bcf4-458c-a27e-2a8a74f2d519@intel.com>
Date: Mon, 11 Nov 2024 18:50:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/chamelium/kms_chamelium_sharpness_filter:
 Add adaptive sharpness chamelium filter test
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241018190627.1367970-1-swati2.sharma@intel.com>
 <20241018190627.1367970-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241018190627.1367970-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH0PR11MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 3447dcfe-08cf-4590-d43a-08dd02539b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnlxVVFRMEFNdVUxVENMT0VhNlh3L0NTR2FWRGZ5WnNONlFjT0cwcDhYbjgz?=
 =?utf-8?B?Ukc4QnhBc1FTdFZ4L2xlZ2xGV2lkaERkTFQ0MXRXQnBicDJoVFhoQXN4OHZV?=
 =?utf-8?B?SGR0VElkSDlFQllhWkdoV2tYNFlMcTR6WVBlbGVQN2FoNTYzM3ZkK2hGY2Ny?=
 =?utf-8?B?WUJsV0xTTTJNVTdaZlBQYldzNGRrOFNPYzZ0dE5vQmtHTEZXZHpReFBlNUgx?=
 =?utf-8?B?TmpJdWtNUk54UVZrRXdaWkdkamRWZERvQWtFTklyRTBQSXR6VVdIaytqdTFq?=
 =?utf-8?B?UmdBV1ZXZjlvVHRIY1FQby94enJIdkwxZmltRTVTaXR4cm5Tb1JNTUI0V0hj?=
 =?utf-8?B?ekt6K1hjMHpJSk5KZ2hEUUtPUXBiMytlVU4xTGtPNzhOaWNMRk5idmg4R0lE?=
 =?utf-8?B?cStTdlFVNlU3ODRVNjdtOHBrR0ZwZU5IanVldUw0eVhCK28vWThzZmtXTVFZ?=
 =?utf-8?B?Nzg5QW9hNEY1T2hBWUhvLzJVSzI1cFhlbTZlQ3l0Q2V1cW5EcFlJQ1Bvc05G?=
 =?utf-8?B?SUhRdCtRMkNpMnU3WmpRSWlPUWdXQmkvMGdrQ2hiRTVQWVM4VHdVNW5Fd21h?=
 =?utf-8?B?UVNiSHVIbDNBTk9MRjd5YnZNSUlkdzBHa0xvRDlrTDdFRE1DazI1cGMySXQw?=
 =?utf-8?B?WGR3NGpGdDZOdlZVWEhoTTBFUjArb2FQdUN1amFTTjBIZk5vK2xNaTZkWDRC?=
 =?utf-8?B?Q0tJVG9aTFc0UUFlbExBR3RQVHdGdmVtYUZ3WnJZeGVMaEg0UDR4N3E1ajRo?=
 =?utf-8?B?Q0V2Zzc3MTZiT2FJOG9XVzFQajh1TUV0T3FsMldqOVl5amtNTWMraDhtd0ZW?=
 =?utf-8?B?SXFtbXVnUnl6SGduY25sVXpoMTV3aEo5RnFsNEZka3RZMFd3SU41dS9iRUNI?=
 =?utf-8?B?aDlqeFY3Ym9ORWozdWJYK0tqeXZkTXQ4bGd5UlNsOVA0c1U1OTA1cjQ0dlN6?=
 =?utf-8?B?bWdTU0VKTko0V1cwT1pYUEx4QUpoNjBKMjVkZHQwOUIrRnlsbmZub1psSWlS?=
 =?utf-8?B?K0d5UjRDekRIU0s3elR2cVlFOVp1Y2p2Y1BYc0RTbjNrOVFhMXI0OGdhK0Qw?=
 =?utf-8?B?MkdRMnhJZmM1OU1iUGlaT3laUWlaaG8yMVpVQ0hoYjBWQk1OSG8zd01Zdnpq?=
 =?utf-8?B?bEVCV1p2OTNGNW05MjNrMEdsWWF5WVJZSXNKYSs2Wk9POUUxRkFoUUR2bXhT?=
 =?utf-8?B?L1pkUExHeTVoOVoxVG1lV1N2S3BJMTJxOFdPbFRXb3FWWi9VaFRXWlRyc2xL?=
 =?utf-8?B?UFJndHdJNFlSODJNR29ZZFRkRHduRjJ2MlpRbzBlYi9VaHJUd1k3SnQrcEpJ?=
 =?utf-8?B?NlIyMitEWUlMM29DU2JnQUZWWXhHSGZtTXAwZWx0SEhRMTlkZURIakdhME92?=
 =?utf-8?B?NEVpbEc5T3BHdGxpWDg2OFJRMXZ4NW45Y3VELzFKKzNodDN6bk9lRTVqQ0tz?=
 =?utf-8?B?Q0ZqVnYvU0JUOGN1bE0zTjJ2QWhrV054TXdQUFptV0pITU1uSmRDNXZyM3Y3?=
 =?utf-8?B?TWhtekFtUG5zS0ZnaDhoZXo3bjZyU0FlZWVqbk9idXY1c003VTh0d1hENlQ2?=
 =?utf-8?B?bkNnSkZRbkNpUnVNdDV1SW93VjdwZXNpT2g1MUViSTNYR2RES1BrNzhOY2hN?=
 =?utf-8?B?WHVBUkVzdHFDQ1Voa0k4Q1Vjd3VJcHZSdVRldTI5eVI3NzREMkdMZm5XUnJI?=
 =?utf-8?B?YWxielVZOHdnU1hNaG9jMVJtVWlTUmNwbFppWmt2emN5ekVzK0NZUkQ2ZWJD?=
 =?utf-8?Q?VUtTndN9C78Ucu5kNMssd9SZbTp+7nhN6YsrPet?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEhZLysxRWRUaTl2VHRlUXpKZGpCQzU1b0dWdDRaUEtKUFd4U0twOG5kdDJY?=
 =?utf-8?B?bDFxZFI2SC9NYjBRT3lRY0lJY3N6c0NxL05uWGVLRi9wWkFtTTJ3TzEwTTE0?=
 =?utf-8?B?dlpoUzFRQ1AxNVBtcDN3WmZnQnQvaGhYYVNKSzVlUHk2ZTZMV040WkxhWGFO?=
 =?utf-8?B?MXkvcTFVSEVMVkdaK3JOT0l2K2dHUk9LeDE3NUROTHQ0VUZwcU4wTjRINE9D?=
 =?utf-8?B?WWlBY3ZTMWNvVjRVMHRMejZ6TUM0RksxdUlzUXljQzlJSXlFUjhTeVE1OGxP?=
 =?utf-8?B?ejJPc2pNRURWVVVWV2gvTlV5NENxWDVTVDBHS05SUjAyMWZUaDZTNTRZbXBi?=
 =?utf-8?B?bitoWDlVSG9obmJBNk84QXRlQ2ZoT1JrS1lkUzdRZEJUNktCcUo4MEErK3M2?=
 =?utf-8?B?L2RrTStUQTYxMW10U0hDRndhbEVsTmNpNXRyNktRTGxsYjIvY08rODdVaVRm?=
 =?utf-8?B?dTUxZitBaFRRbXpzL2FITzVxTzhYMHNXd2d2TWltVEkvYlRTaXBGMVZRN2kz?=
 =?utf-8?B?eUhkM2pGYVNsZmhqME9NQ2ZWNTdhY2ZPRGljSHp1NXdXK2R5dG9jWVNIazBG?=
 =?utf-8?B?citFeEZFKzFFQUNLaFU2VWhSOHB0L3pZbU40aXVXQmlBdHlTT21PTmgySVQx?=
 =?utf-8?B?eC9NRXBQbUVKSTFjUkEybUQzcTJqTHNzaHo3VGRxb2lwUmtQQnVKODZWdFVH?=
 =?utf-8?B?NjB6Z1dyMHA1dXVZTmRqTXpVSm5hWmFEVU5Qa0QyUHJIdllWRTExSTVpbUZY?=
 =?utf-8?B?eVZsTHQ5K3ZPWmlnL1dESUxiczUzdkhFUi92a1JSbHYwd2pKS1pjQm1YaWRK?=
 =?utf-8?B?bFhDR3VNWkxETG5VS2Q2MW1GakhhcUs0c01aWkx5dzZ2bGs4TExRYzZJZE9U?=
 =?utf-8?B?Z3VxTGdKd0Q1TVpXYVNMaWFNcU9xR09qNEhvaC8rWWFadVR3T0FQVUpucmJ1?=
 =?utf-8?B?MXRwaHE2Rkx5UGM0SStDVVRldHhzdVFzOWk4c2UwREt4YzdTbVphVk1wYmpq?=
 =?utf-8?B?ZldXWHVOZXlVNHdmdUZacFVLRGovMzBIVzZ3dDNsZ0dpUVlSOUlNelZ0bVdV?=
 =?utf-8?B?ZHdzbFNqakh4STJWVjJoQm5oTVpNRmVXWXdrOUNoM3NkUlR3QVpKRXE3cEpt?=
 =?utf-8?B?dkFWclY3SXVNS21pTGRsdnBRek8vSHIrZmR1MlFPNGFiY1RSRWZCZ2dqODFD?=
 =?utf-8?B?ZFRXc0cxYkdNdGNKYythYkx6a2ZlVlM3NGVSUVEyaFQySDhMVURXdTI3Szk5?=
 =?utf-8?B?QzQ3L3FqbllWZHg0QTdpdXJqOHVuSkdEKzd2c0Z2blRHdnFFQTZvY3RnSVFs?=
 =?utf-8?B?SnBydFh2WVVrU3E1YlAyYy9RMnpuekhmdGFKZk1aVnVVUmMyQjhGQ0lFdERo?=
 =?utf-8?B?dFNRY21ydGxUNEd1V3Z2OFg4TmZ0Snh1ZVl5ODVLTk1aanZTVXBTVzRTeUxV?=
 =?utf-8?B?Syt3Q2w2RGEwaU1mVkZ3a0VRTVhxRDlXUjhGSE1iOGM2ckJOYVJYVGE1dnRD?=
 =?utf-8?B?TmNDdUp1YTdoL1RMYUJDTGVkV29YTGpKTGUzeGxIN3NmSmhYSS9qcG1GZ2Ra?=
 =?utf-8?B?RkJsbkM0RHQ4b2krNy9MSDVheElHQTNnTE5CU0kvSUJvM2VnNU5TWWNYVWd1?=
 =?utf-8?B?TmIzRHhKVlFCU1dvelRnREhUS3lHTTdaL1VxemdhalpOWGpsVU5iS1E5WVVz?=
 =?utf-8?B?OVZKWk10Nk4rV3RxeTBTZys2amZZVWdZeThnYzVqK2R3aXlVWUR2ZjJ6Y3Qv?=
 =?utf-8?B?cEEzQXdTSzE2ZG9Bb1RFd3ZuMHE0QUFqSkI2U2FxUHo0dTI4dk1pYlM4bURh?=
 =?utf-8?B?L0NhVUsraUs4dlU4SFN2eXJwNFBsZWpWYWcwWUdtUGFwcHRNY1h6RXlqN3hU?=
 =?utf-8?B?WExtMkI1NDlnSnl5SSt4YjV0eU9NU01pMXZVaHp0VHQ2UWtDUGVBOXUrcXRl?=
 =?utf-8?B?Q2ZiSy81akhSWjNZOWFjeituY0NmeVVFMFdNMkFpWUFGSGp4TjRpbitLWEoz?=
 =?utf-8?B?ZWZkZ0xmRGdvU1ZPUFNISVZ6aEVzUVhRbkE0bzR5WDFqOXFzN3JFa21FbjlH?=
 =?utf-8?B?NExoaFBOdGNBT3BjajgxUFZGUHJ6clBWWlUyV3FvdGNKQUJIenorckxPVnN6?=
 =?utf-8?B?RjJURVNXMEQ2L0NnVVF2YncwbkpIVlVqR2RWcEFlQ2VNbytVUmFKUWdjM1JW?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3447dcfe-08cf-4590-d43a-08dd02539b1d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:20:26.8425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXIUKK5N+rI8LC3if2JTSFTgL7QUIlMz1dnVLTjsYtQr3CHxp0GU97AvD6i4iHDZP8kJV9DrlGm0aoCZVsNfdvXgSAkbQuiEI6Uc5xOeNO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5950
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


On 10/19/2024 12:36 AM, Swati Sharma wrote:
> Add new chamelium based sharpness test. Basic test is added where
> we have tried comparing frame dump of unsharped and sharped image.
> After, sharpness filter is applied its expected both frame dumps
> will be different.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   .../kms_chamelium_sharpness_filter.c          | 250 ++++++++++++++++++
>   tests/meson.build                             |   2 +
>   2 files changed, 252 insertions(+)
>   create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
>
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
> new file mode 100644
> index 000000000..a60d22b63
> --- /dev/null
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms chamelium sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter using Chamelium
> + * Driver requirement: xe
> + * Functionality: chamelium, casf
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +/**
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + */
> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter using Chamelium");
> +
> +#define DISABLE_FILTER			0
> +#define MIN_FILTER_STRENGTH		1
> +#define MID_FILTER_STRENGTH		128
> +#define MAX_FILTER_STRENGTH		255

MIN/MAX_FILTER_STRENGTH are not used.


> +
> +typedef struct {
> +	int drm_fd;
> +	enum pipe pipe_id;
> +	struct igt_fb fb, fb_ref;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	struct chamelium *chamelium;
> +	struct chamelium_port **ports;
> +	int port_count;
> +} data_t;
> +
> +static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
> +{
> +	bool ret = true;
> +
> +	igt_output_set_pipe(data->output, pipe);
> +		if (!intel_pipe_output_combo_valid(&data->display))
> +			ret = false;

Alignment doesn't seem right.

> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +
> +	return ret;
> +}
> +
> +static void disable_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				DISABLE_FILTER);
> +}
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +	igt_remove_fb(data->drm_fd, &data->fb_ref);
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_override_mode(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +
> +static bool test_t(data_t *data, igt_plane_t *primary,
> +		   struct chamelium_port *port)
> +{
> +	igt_output_t *output = data->output;
> +	drmModeModeInfo *mode = data->mode;
> +	struct chamelium_frame_dump *dump;
> +	int height = mode->hdisplay;
> +	int width =  mode->vdisplay;
> +	bool ret = false;
> +
> +	igt_output_set_pipe(output, data->pipe_id);
> +
> +	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb_ref);
> +	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
> +
> +	igt_plane_set_fb(data->primary, &data->fb_ref);
> +	disable_filter_strength_on_pipe(data);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);

We dont need to do commit with fb_ref.

> +
> +	igt_plane_set_fb(data->primary, &data->fb);
> +	set_filter_strength_on_pipe(data);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_debug("Reading frame dumps from Chamelium...\n");
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	dump = chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	ret = chamelium_frame_match_or_dump(data->chamelium, port,
> +					    dump, &data->fb_ref,
> +					    CHAMELIUM_CHECK_ANALOG);
> +	chamelium_destroy_frame_dump(dump);
> +	cleanup(data);
> +
> +	return ret;
> +}
> +
> +static int test_setup(data_t *data, enum pipe p)
> +{
> +	igt_pipe_t *pipe;
> +	int i = 0;
> +
> +	igt_display_reset(&data->display);
> +	igt_modeset_disable_all_outputs(&data->display);
> +	chamelium_reset_state(&data->display, data->chamelium, NULL,
> +			      data->ports, data->port_count);
> +
> +	pipe = &data->display.pipes[p];
> +	igt_require(pipe->n_planes >= 0);
> +
> +	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(data->primary);
> +
> +	/*
> +	 * Prefer to run this test on HDMI connector if its connected, since on DP we
> +	 * sometimes face DP FSM issue
> +	 */
> +        for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +                for (i = 0; i < data->port_count; i++) {
> +                        if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +			    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +			    strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
> +                                return i;
> +                }
> +        }
> +
> +	for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +		for (i = 0; i < data->port_count; i++) {
> +			if (strcmp(data->output->name,
> +				   chamelium_port_get_name(data->ports[i])) == 0)
> +				return i;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum pipe p)
> +{
> +	int port_idx = test_setup(data, p);
> +
> +	igt_require(port_idx >= 0);
> +	igt_require(igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_SHARPNESS_STRENGTH));
> +
> +	if (!pipe_output_combo_valid(data, p))
> +		return;
> +
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
> +		igt_assert_f(test_t(data, data->primary, data->ports[port_idx]) == 0, "No sharpness observed.\n");
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	enum pipe pipe;
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +		for_each_pipe(display, pipe) {
> +			data->filter_strength = MID_FILTER_STRENGTH;
> +			test_sharpness_filter(data, pipe);

I think we need to set data->pipe_id here. It doesnt seem to be set, but 
is used to track the pipe.

Regards,

Ankit

> +		}
> +	}
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +
> +		igt_chamelium_allow_fsm_handling = false;
> +
> +		/* we need to initalize chamelium after igt_display_require */
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
> +		igt_require(data.chamelium);
> +
> +		data.ports = chamelium_get_ports(data.chamelium,
> +						 &data.port_count);
> +
> +		if (!data.port_count)
> +			igt_skip("No ports connected\n");
> +		/*
> +		 * We don't cause any harm by plugging
> +		 * discovered ports, just incase they are not plugged
> +		 * we currently skip in test_setup
> +		 */
> +		for(int i = 0; i < data.port_count; i++)
> +			chamelium_plug(data.chamelium, data.ports[i]);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	run_sharpness_filter_test(&data);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 7f5bc68d3..1fa47d09d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -335,6 +335,7 @@ chamelium_progs = [
>   	'kms_chamelium_edid',
>   	'kms_chamelium_frames',
>   	'kms_chamelium_hpd',
> +	'kms_chamelium_sharpness_filter',
>   ]
>   
>   test_deps = [ igt_deps ]
> @@ -360,6 +361,7 @@ extra_sources = {
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
