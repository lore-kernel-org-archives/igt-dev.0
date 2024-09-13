Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386B8FA3750
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 20:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF45310EC22;
	Fri, 13 Sep 2024 20:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQ0gBl8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4624510EC22
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 20:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726257747; x=1757793747;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=h9nZ9NRYmYa4q8ZXZj7dmzqw9zYmWwp8ATpNNUxYg4Q=;
 b=LQ0gBl8FYVTCvlBCmVmNHU6ehonjcdSSg9dIfv3tQV7N+BXeneIJc9RE
 4MU/CgTAWEDRmmd9qgL1nXAb6RiOfmLBf/x0qzyi/qosO70ODWCOL3w5a
 OOF1fe/x/Bx3kXl/0Nc5OJCfAXqdzFWvux1BX64Rtwf3PEbAXhFFvIQzh
 KBIl+1T8NfK86elfr/PNI+74Sfs6G3NH2EuinuAWm6BNOBL1or7OBRL65
 e60mgu1JKhEClhuoK8cslEnUgqT9nsVU1qOUDvE3okTLslexShScQyfO0
 v15fKd7a5ITBbqF6eMHy8KlqLZoRHy+bSKgJ931PaODHlrZp/6X2ugwSo w==;
X-CSE-ConnectionGUID: UQCmI5ipSByPnxaa3CWuhw==
X-CSE-MsgGUID: aLjF0wBHSt6OPY3bx2uExw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36307569"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="36307569"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 13:02:27 -0700
X-CSE-ConnectionGUID: au4CknCwQfeq0hBknLUewQ==
X-CSE-MsgGUID: GL4j8MdNQeKjKPiBlchoMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="68279320"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 13:02:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 13:02:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 13:02:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 13:02:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7J7oz8ibf9WYnmAmHrpo4J9q+b7gkxTDI5sLmP3SZwm5judVP6YHLcCUYWmLFCQ2cpLLGA5fDGYAuxZ/4i0Mul5TIXFGChtTP5i+i40XPKzQcSQIghJv8MSjuCU/MBO2W6kTJdRT01fw00YvqwQpqf/35wFOlPRntApNuGEI2I88Tf4JgfGICt6XlEZhP2uyMcgLEjFhyMFk4i36eb28Y3r4/kcoxUP09rNtFbEqN7Vxcm//6b5g2F10OvUqqUt5PqOAWTOsMc0B17csR7xHCM9Th5JxidNhIfam3wZdTNoDUpnDAhEtRkLl2hWGNxSn6YoTKzEPg5fLrEZPzgkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9nZ9NRYmYa4q8ZXZj7dmzqw9zYmWwp8ATpNNUxYg4Q=;
 b=OcsHuttsjM+CnQGqLeW3gJ6ZudnYT+ox6Q+IatGoAJmw7TVPBMC0I9Id4vPyKBezyGPUtw/sEwyRvHJyvJIr7SaIGZGteJAeFWrFUWJgGFs1lyfuswDPuGp7JQIR+r7o3FWZAHphp5QcRSTgqFt5ISv2B6rbJZQwuGyrRac/k5X+5AWwIX61Gs3j29AZe/rUi9yRExChcZOf5JEDYzTJL3ghypsEOrOiU/GgW8SjzyamLu7+Ng+YB86+KW83jZuzmqkxsfrJVmz8cgDLbIqdJ6n+rbz598x/EFBu28ZrahEmY1H3a8ufeUw9PIF0CfIfVZeLz2HlYQe9RDZGuyyXrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Fri, 13 Sep
 2024 20:02:23 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 20:02:23 +0000
Message-ID: <1c4f30b9-0b19-490e-8b57-7c02a0ad6d23@intel.com>
Date: Fri, 13 Sep 2024 13:02:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/*_query: Add new hwconfig table entry
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240910011238.254204-1-julia.filipchuk@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240910011238.254204-1-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:303:8f::28) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW5PR11MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 1669e002-1078-4ec0-97d5-08dcd42efb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXA5MlJ5N2tIcXpiSmhFL0FhVTJsL0JRblNoV1FYbXovRy85dXlCbVkyUWRG?=
 =?utf-8?B?YXdUMUJ5MXI4ZWVnRXlsdGUyYTZRZ2F4cWhFSkFKRk9QYTVkazJIbUF4L1JZ?=
 =?utf-8?B?ek5QY2hvek1MWmsremVGVyt3aDh4YW9MM1BTTVBzWlVEYVg5Y0JlVkt1RHFn?=
 =?utf-8?B?MDh1U0xzMzRCVmY1VWxINWNBTnBsWXA3Z3ROdStyOE5sSUxvU0JEY1FjOGFo?=
 =?utf-8?B?OW5mTzd2KzBsWEs3bjcyVzc3L1J3aVNHUW04Z2RhMnNtQWtxbHRCdW1rTmJ3?=
 =?utf-8?B?ZkFLVkNOZzJMYXNrMG9DVkpBSFlpZHRDRi94WjEwSzk2SzRJYU55M05KNERP?=
 =?utf-8?B?cmxvVmttUmFORkJvSFJ5SFFoQ2pCbDQvWVF5bGUreElrTmxEN1R4U3dzeXFu?=
 =?utf-8?B?K0hvVGsvM2hidjJBOXljRUxKdVVsaHNUb1A2QzYya1lUQkRjdlA4alkyNTJo?=
 =?utf-8?B?UWV3WUVZZDE0R0VkbVI3ZGE1d3AxYy9nZ2dPU0piV2lPT2hvR1ZnV0ZxODM4?=
 =?utf-8?B?WXo5c2VZalA1U3BvdlR3MmY0T2ZJYUVsNXNTN1hERS9rK0I2dEtHcTAyZkNt?=
 =?utf-8?B?UDlNb1hkREZGdExJdTNYTG52amVLZVpaUWtLLzV3N1ZUcWVYR1ZlMWRpWDEz?=
 =?utf-8?B?eVdhOHQzYVpPODZBRUxoWTRUWVpycUF2NHlEeGRKb2MwWXpQSGNKSk1pNXdB?=
 =?utf-8?B?cUZrUVpJK3h3TXZQUHJFY2FBb2Vhd3VRTG1Yck1DNkhYTXBVNHV4UHZSM1RD?=
 =?utf-8?B?MGFPZXA4NUZPeE1tZzdMdk9VdmoyQXh2eGY2YnB3VEM3bmxHalBnOEFTQUg3?=
 =?utf-8?B?dlBFYmVOWmhEUGNRbnJabjA0VXhVbnFmK0RIM1ZGWGp2cVV1WXVqU1pDOGt3?=
 =?utf-8?B?b050ZDhXODdyUlBIcUY4K2tTV2lWK2F5dTg5VmNHZW1uU0diNVgydG1Lc2ky?=
 =?utf-8?B?clFuS0dwbVJPeHJMaEpXaFFEdVY1S3BnbTRTdXpJQTVqa0lsRHFhSGJYdlRD?=
 =?utf-8?B?NHNCeVlCcnhNQ1ZHWFhleGtCeEtId3FMK29BQ2ZXQ3owN21DN0xpaEpDcUhV?=
 =?utf-8?B?OERUYkc5dVJRZkFoMDMreGFWcFIyOUdTbVI5b3I3WEkySE9kcUQ2YktIS2Jr?=
 =?utf-8?B?aE9YVG5XUjY1M1VLNmRtazEzazJkK0k5alREbEIxNGZIOE5UWjNOVzl1L25r?=
 =?utf-8?B?ejBmT0s3a2gxczdWV1FqQ1F3bUkybEY0cHdwRkNvTGw1b2pyQlRtd3lUWTNY?=
 =?utf-8?B?RXQyR25mUGkxRVFKbzdUMFhYd3p4b0xNd3JJWWJKMGpEWGUvOXovZE4xSkZm?=
 =?utf-8?B?WEp3aE52RzVuUEdxcmk0THBPdnhlNnRGRFdHMnV0c2YzVmMvV0JOeWMzN1Js?=
 =?utf-8?B?SWlPMis5VGluclVkTjM5bC9RRVIxQWl2NndENkt6N1ZVcjZoR0puNnRRMFVH?=
 =?utf-8?B?cGdmTzlzSFU0V3pUREl2MXNDTmZROVJwenRzUGU1ZGcwcGFOaXdWMmdpOW5a?=
 =?utf-8?B?dWxmbVNjSVM2L3RWOWdEeTUwMGFQWXdqMUs4dlpLdm5BNkgxeXNXb3l0bG15?=
 =?utf-8?B?akNEYWNjeVNVNWx1K0JQY0U4S0RmK3diRVowTEdTTytZRmxrLy9YUTZnRXRI?=
 =?utf-8?B?Vi94REtlYmRibGtjVVRkOWZOcnNqTUlGeWNCUG54RldsMk93b3VSSWlmUThR?=
 =?utf-8?B?UE12VXdub1VYZGZmdnFSNWVPZTBMWTZrTlozWFJRSEEwN1pqcXc4d21yQWxG?=
 =?utf-8?B?Q3FTS2FpdnE3MEpGNmR5eU1ZZ25pRzFwZUJxU3dSLzB5L1dtaWVDOEtzQkFs?=
 =?utf-8?B?MG9YNlJqNnd3b2Rib0pmUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WElka3h3ZjRBeWRuc2FmZU5QNEVjQ3hseHQrK1lFMGZ5T3FBMi9EbGxydGhv?=
 =?utf-8?B?Yy9jcEx1a253UTJvdXVKZHBkMWJqenhBTTE2WVZremwwME1aV0lsRVhseVps?=
 =?utf-8?B?dFJ0bGo4QTBpNXVOZ2pLY3ZJUGFVekNLMitDclNtUGUrc3VpMDhnOVRneGRT?=
 =?utf-8?B?VDhYajAwQ3lLbndJMFF5ZzRNbklkZUNtTnMzejJuNVJWVm05eWhITU5oWlQy?=
 =?utf-8?B?ODF2N2dGd2w4djUyMEdCazNjSmZlMUw5aEFnd0tPZUN2RlZxYzhrMWtFb0Vk?=
 =?utf-8?B?M1RXUHljeDR4YjdiRWlRdzJ0d09YMmFKOXRoQXVMeUNGRjBPRUh3QmE0SWxR?=
 =?utf-8?B?MmNlQ0JObjdmLy85MFNkMElvcllGWTF5NHh1U1dWOGdMeUlaTGRJQzVXQ0Fz?=
 =?utf-8?B?anZFYU5NaVUva3g2S3VuUGNQKzZ6V0VCOXFseVhtdTJWM1MyczFQU1VheFV3?=
 =?utf-8?B?T1lhRGNQSURVV3lxY2k1M0RwV25XVzE5Z0lPSTNodnFCV2wxWDR2RmRKcHhW?=
 =?utf-8?B?blFwT3BGVUNOWnNrTzZMQTc5UWpYbGlIUUxQZ0pXZmsybjR5dEsvZFFNLzBD?=
 =?utf-8?B?WGJ3ZXA3YXlFZ2VuYkFRZkR2bVo2RWNNRmVHMW4rVU1CdjgycEZQaTJhN2cz?=
 =?utf-8?B?bWpyclpOVWxiZDB1QUt6NGhDUzFWdFpNR2NrTXI1RVVMNTA4OWVIQkE5TG00?=
 =?utf-8?B?UGRiRkwxRm1pZXdybEdZWW5MYXN5bWV1alRRQjZMbjRBV2x2T0VseHZld1ZC?=
 =?utf-8?B?Q2JDU2pvL01Bck1ySVZOYTkxRFJnTFB3MFI3NnQzYmVJRnZMeGRzR01VZlRl?=
 =?utf-8?B?ZGhhMzZ6U0tCQ1ZQWEgyZ0xCWDltYnZmRTJYb0hQMW42NUh4U01BMnE3UmtS?=
 =?utf-8?B?SnNkN2NyRWtEaEFPYnVEZDBiOWYzNy9EZHByWlNKcVliQS96c09YeFo2RWtW?=
 =?utf-8?B?aXovbTN2YTZDMGkwZEJVbWRJK3hTc01EVzhqUTE1Um9nc3lMV0lrMDlBcndm?=
 =?utf-8?B?MVE1SVNsYURhbG8reWN6a1VCRTBkUEZrM3NMYnhQenFsUGQ4Q0EwWW11RkFp?=
 =?utf-8?B?dWQwTDhQZ0o3dVZwcUJuem1JaGUwY3hhc0tLUjR3azc4M3BUOG52UkRPeERJ?=
 =?utf-8?B?MEhMWWVrdUlwamttc3pEbWxTZUo5QXJVVHVlRlJOOER2WmxOVmpra1BnTU5z?=
 =?utf-8?B?eGNCcE1vSDBwU1puSTBYQWMzWEp1ZGswUkkrbHUrNWZvVDdRZmowdFRMQU1z?=
 =?utf-8?B?a3N4bWVWL2tpUUpwRmxFcFUzakw3cXFZTkRxWGY3R1F2MmZNK0p0ME9wbDha?=
 =?utf-8?B?UGZUbVFHMzkrRHlqeXBFdDdLYkJ1MFNjWE9hTjdqbjZ2YVlMcmdWSHBvZlI4?=
 =?utf-8?B?cDhZb3c4bFZoWDJrQWRDWStNWjBHK09lTU5Qb0dTclRBWnlHY3JvQmlJdzNu?=
 =?utf-8?B?NEZyci9TKzJMVkZoVmFtcmJDK3N5SDdNQldIVTlvSldhNk1nOVZDM2taQU0v?=
 =?utf-8?B?Z29XbjluVHNGWFdwckFTZE95MUNDdmJDQmt3dDVnNzMxelpEQit6anpISnJW?=
 =?utf-8?B?bUdrcTV2aDNuRTE2SUQ2clZPdEpCYmRrOFBzRDBaTU80cG5QdmEraTdYenlm?=
 =?utf-8?B?KzNLbHlQQ0xqMjV3Z0JPdENCOHpNV1k1ZVhNb0RsVFNXa0FZdHByY0NTQXN0?=
 =?utf-8?B?cWtLQ2FBcFFoTCs3ZVQwcnhER08vMGVtanVsWmZoVXBIazJUMTVBK1BKQk5C?=
 =?utf-8?B?YTNWdDRLc0pQQTM3ZkI5UURFZ2VpR2FBaVdjZHpjNUhvTFAwME5uSXhueTNx?=
 =?utf-8?B?UmlrL0FkUENWMk5EZ3dyRy9FVk1DdGZ0N3h0aDJRMForTEY2S1JOQXhFR2Mw?=
 =?utf-8?B?Q1dXU2FxTjRQQzgrK2ZrVGN5R0t4S09IWDVEV3VSRGRCaXVFa0xzaTdpZnZi?=
 =?utf-8?B?cnE0MWhIZjNiV3h1QTNhMmUyeWxhNFFibGZPOW5ENHVpdlBucWxXa2lmN1Yz?=
 =?utf-8?B?TUFGcUZuWHFsU0wrNTZoWHhYSVYzY2t4RHI4RVhsNHlNZ2hoZWkwTmdKeWtv?=
 =?utf-8?B?MkxzS2dyRmVweHVWYUw5M01Fbys2OVNQV3p6M3pIaXk5UUk2bEtFdm0waXdO?=
 =?utf-8?B?bCthYXZwQlZudlF2TjdteTB3YThtOFIzSXZsSW1sWWxNSDc4ZGlXSEl1Ullp?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1669e002-1078-4ec0-97d5-08dcd42efb8b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 20:02:23.5783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYBXVs2l//faxLVKCK7iOtNCbUaZAgcE2peIugClKpeKAz/WvUM64LW6GI91F+3L0HzUK19rVyw5AtAPXpkzdYoltFKO1W5k1bYIsyMnGSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
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

On 9/9/2024 18:12, Julia Filipchuk wrote:
> Two new entries added to the hardware config table. Updated enum and
> tests accordingly.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

