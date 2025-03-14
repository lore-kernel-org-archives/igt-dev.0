Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A71C28B2F
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 09:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFBF10E2FC;
	Fri, 14 Mar 2025 09:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1gNLV8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF40C10E2FC
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741945487; x=1773481487;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nl5jJZxV/RvR90yJGioMCThN7j3dQK/0OSJxv3sf6Is=;
 b=J1gNLV8UMhcUFd9RueadWh0MfBI0srIvF9fQIVvtmT0GN90WJ5uyyaB7
 saP2NbpVhl49vxk//LKWRmZDknAr95MJ641dwanHwPa8jNq5if39mHrYm
 f2gxk3Plz6d6YHsRDpROTkLOb1+kAfXHJOv4Yd/gP1payNAKLdUe92j/M
 W89uaax5FzceH2PBwFdBLN2KtnIgQunTtRad4VqqxqV6dLc6HpHM4Ukof
 tLwFT8GuxrYRn+eSilImlDpI+do7DkXo+tIm1jfTDuMNvxXAaOdwnRKc6
 9Xa6CTpYDFvgHwFIEcssCiP2xyCMcmCJO9kwDTfXe4RbY+TT8GV6fKtXw A==;
X-CSE-ConnectionGUID: H1+T58QXRTyXLDYeEufjFQ==
X-CSE-MsgGUID: HRAmITlJSG6GsKfnj7z9wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60488910"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="60488910"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 02:44:47 -0700
X-CSE-ConnectionGUID: U/kouz5qS6a/eHBi4/b0Yg==
X-CSE-MsgGUID: NR29zSZ2SlqoEzwZHroWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152152917"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 02:44:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 02:44:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 02:44:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 02:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ubi3AJ4DOMgrE3jCrzU3ipqVMQxx2GQO6Aa1OWx6Zs7JcO85c53mEfrrAxqKdW6lXOGT/1ZyT6R8cL3Hq2VhbIQkkcFuHmlErF1OOBCMJDZq0nbl9FUdmTePDBCwJ4HlINtWN3FvOSy9wLuFXgg7rQD2I8NSuTNACeYqZ5uHtn4dR0oEg0TqPu9QDajkAPRqh8d0BFIN8d0vrhgoWZEXrq/QSK16Ya+59535KexM8yJkJiiAKyp+TsNDQzvGzEvXhEB8oWgG0SNxrDeWpiKGkNRieHD3L4FBBPhcWDRBqpIH0i+Yo8m5nPmcMf7uUGXYTzEfiIWpbuMTnSOcPUhlUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8Sj4LLz68jlNFsSxmTKuldtEkplwqTlNAOPjGRpOyw=;
 b=YKA+J5HUet4iq/+/Ei2jWFXP4XFuft4IEY+T2YL3uNzWJwqjPpaygIjND1oWIoPOk3pi1CCyC0gVzXjnZmBUFCYPDFXwEs2Uu4+T30zJzMZ8i78GtELTotWHOe2p+g9d2QjfbJXDOX+T6FyyQnCKMyXOBif8KweVOUVjOpoz4zFAFZt2SKJUF/8CTfEhWHiBUe1pbBcNDY2f73nrsvAy7X8+lbBrTOqEg34UK76DmfSqxwDIpc1bbjxllgKAMj8Db77vO12PjG4T2LkJjZNjb+XD4Qai1Illr7Cxfh+tABiF+ffA6qtO+30ASsSZv3DIUxqd5dCcJAr0qcYbhAVFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB7080.namprd11.prod.outlook.com (2603:10b6:303:21a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 09:44:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 09:44:03 +0000
Message-ID: <17c91321-4885-4649-a8dc-4438b782ae26@intel.com>
Date: Fri, 14 Mar 2025 15:13:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_addfb_basic: Split tests into subtest
 groups
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <pranay.samala@intel.com>
References: <20250312103008.613087-1-karthik.b.s@intel.com>
 <20250312204328.mvo7qdvryx77vp72@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250312204328.mvo7qdvryx77vp72@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::31) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cae97b9-318f-4753-111f-08dd62dcc0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUx2Tm9yWWYvUDRDZHVBdWl6QW1kSmZFWllpSkxScVZQa01iT1RqaDVZenhm?=
 =?utf-8?B?WnpjTWc3RUVYQVVKMXFQZkI4c3JPSEFJbTBDbGNKYUZQMGdTTGlYVXh2ZUc3?=
 =?utf-8?B?UzhNdDdGekFxREovWHlPZVBLbmF2SlRLN1hwT3p5b1JCMWpQSTFRMHBUbnRI?=
 =?utf-8?B?TWRZTjNzTHJDMzFqZ2F3bktpZ3BWQ2xxMEI2aHNJY0JQR1hrMDI2ejNQU3I5?=
 =?utf-8?B?dEJJTlFhdjJSZ2RoU2JqU216aTEyMHdpYTJnTEU3QkxvSGQ5VzR0QWJERnRC?=
 =?utf-8?B?YzJQTHhtdXNRdnMveFRzZzlLaHVLejFjYnRUKytTTkx6bWorUWtXYmpuUXJz?=
 =?utf-8?B?dE5teTZnZG4zSy9VNGQzOHErWnJzWHpFdjQyTzZHdGVjSWpFS09hTzlvcklF?=
 =?utf-8?B?eFhwbndzK1c4RkxiUThFa240VGUxSTAyWVZzR05pbEh1NXY4MDNjNlppeWJS?=
 =?utf-8?B?cStjWGc2VkF2VEJ1d3N2ek5kMm5zRWpIcmpScHdGUTEvSGNnSWlDdHh2UitS?=
 =?utf-8?B?bmlUNk5rZGhKQXc3bnU1dzluR2xnUHArQXhVT2FSOXZVS3NHYlczWnZVamlO?=
 =?utf-8?B?cnZpL2NZbXVxWDZLa1czWnF6VVVQUHBGWE4raVhDMmc3dWQ4cWRIUHlzZGpz?=
 =?utf-8?B?MzVmWUtoOElEQVFmWTQ2Y2twQTZsbCtIR2NkKzUwNzMyZmNJY0dYVXNzeWhO?=
 =?utf-8?B?Y1FWK2dUSmF4QzEwZEFsTjhOYTFYeFoyM1l1NjRUY2R2eUk5OGtwL0ZiVmhm?=
 =?utf-8?B?cXE2YitFOFVFYXR4RUNCbFhhUUxxTXJIbHg1VnZPWXhFL0VUd3FiUkVxdjI1?=
 =?utf-8?B?YkM3NUVaVkhsdEtmSmJObFo1dVNDR0FXaklTLzFhMmhMc2N6b0FJT29yMlpu?=
 =?utf-8?B?QjRZL3gvMjVQRU5UUDVJWmpLNzNINnE3NUhwZ2trYjlHRjc3b2cxM1Bhd1lM?=
 =?utf-8?B?ekkrSG5YR2NteVJCY2VGKzE3TmI5aExsSDlDL1lLN0ZPVG1SWEpjUEdXY3Vk?=
 =?utf-8?B?NXFlVkFwN3YyNzhrWkZLd0x6ekNZdk9XOWNFdWtxZUpVMkhSQ1pLMmFFcmp2?=
 =?utf-8?B?NUZyaFNMb3Yxbk04dm02Qkczb2QwVFVVVXJCVi9PL2xvVEFJV0kwVTVTbTg2?=
 =?utf-8?B?eWZQb0NVMDE0clFTZTYwdmN5VGQ0dGRtRnc2cVJLMGt1M0huWGZqdkh0L2RO?=
 =?utf-8?B?S3E5alJTb2hqMzVpMWdTNHBwRE5BRXJHZEw0a09RZExlTXl5a3krYXNhT0sx?=
 =?utf-8?B?YUFKK0YrZVlxa2kzbFhxcTlhOUlZYm5MZ1NxNUdPMWQvdVZhK0FqV2s3TFVY?=
 =?utf-8?B?eWZXTGRQR0lXUEMzR3A0N05jc3BHY2tBdVNRYzZSOHVNaXpYM2o3ZWYxOFBa?=
 =?utf-8?B?bVAwNjYzM3F0bzhWaUpRWUllVWhsVVdMSG5pMnNTQ3htVG9FWFBZTnJzaFhl?=
 =?utf-8?B?dzJYZm0yamZtTVZTZkxScTgyWDhpYWRmNnJ5U3BKUXFvOFJWUDVLT1puL21W?=
 =?utf-8?B?TkQ5ZzJVNXY5bEhZWVIwcTBKMFJxeThQcWhYME5LYVNUckh4aUR5WFJJUEc5?=
 =?utf-8?B?eU1EZ3JBSGJzdDhwdEJIY3EycEw3dGRRQWs3elNFbk1xa2ZOUmhKVUFZSVpz?=
 =?utf-8?B?VXVPSWNUWWZxMmNuV0pSVy93dlFReGtncVV3MHIwKzIxY0dEa01aeVc4aWJp?=
 =?utf-8?B?eWhnYytrbTBEeHhoQWNYaEVneWFmMmZaa05VV0FrTzBBT1JDSGgrQW85dWsy?=
 =?utf-8?B?cGxJR3kra0llZ2R1WVM0NnlJVm9vaWJRZmh3SWFoMUR4a1VzbUJXc05uZllL?=
 =?utf-8?B?SDhsODB2YlFWVkZNVXlyOWpqeVR4SStnQ0c1eUJFSlVtQk1hODEwdkdHUmM2?=
 =?utf-8?Q?zyzTwQl9VtAhs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTRKTXlwSS90WXBlQ1Q0alBjSTAxbmJJVVVCL3V6SEVWT3RPQm5Eak5aZmdP?=
 =?utf-8?B?dGczVWxyZnpTVlBOTS9hWmVtM2ZxVHJ6OURROVoyTENJSkN1cE1ZeGxEa0s5?=
 =?utf-8?B?YzZzaUlhbTVpN091ek1odnQxbDNSOXo0WlQyNHE2REFldVBFVnhPV2RkUStH?=
 =?utf-8?B?eWE3VXM4d1ZITzBmeFM2Wk85UjYrK1Fqa2VBdDdjODNwTEFLZEdUSUk3M1pu?=
 =?utf-8?B?Rk5rYVU4YnNOOWptdmFteWFWblpMcTBScCtVSnZBSlNuYWl5aHI1ZG5BT1M5?=
 =?utf-8?B?MzRVYXJXdjZxeVFmbVBYRFBZejBGNGJZWDRDMHhnb0hwRWFuU0tRWGVXQ3ZF?=
 =?utf-8?B?ZitMZm5Bc0RSNUJkT3prSEJURU1PWjJRb3gvbCtTMHQzMWE5WHNzdnNLb1Rv?=
 =?utf-8?B?ZzR6RWlmdjRWOEhoY1pYMWVHaFBTdHdXQ0lKdnArdU45Wlg2UGd4MjlNNnI3?=
 =?utf-8?B?OTcvQ3lDeEtoVnJySCsvZXBjSXltMnE2TStDc1VMR09NMnhnbU9ISWFqTkNh?=
 =?utf-8?B?Skk4Vlhob0cxMXhQeXVFZ1dDYUtZU2VjZi9wUXZnQk92TGp1dXFPLzJ4dVU3?=
 =?utf-8?B?RUlPNmlTbVFvY0ZxZlFqTUYrM0tnZU9PN0l0bjhMaXd1Nm5US3F4WnlPNmZX?=
 =?utf-8?B?YWxvSWxRcEpDVUJkVE8rWWRzQy9IUHJqdHR5Sjc3c1J1Q2hVYnlqUzQwWnlE?=
 =?utf-8?B?a3NoV29UMEdTNjdkczhNVitWVVpUZWplYTArRXFVMU1nWm9Bcmg0K3JQM3E0?=
 =?utf-8?B?NzVOVWFqNW9FMkZVUFpwa2tvWWVFdGtSOENpd1dHVFdUZG11eTIrcHBrMWNZ?=
 =?utf-8?B?QXdjSlM0cUdaRWxiZUJNQUlweVJ4Ylh0cDhpWkNZR1VMVkkrWUl5OUUzbFdw?=
 =?utf-8?B?U3huODl1SHA0bXFNdjlISCtiMmd5YUlhcW5UT1pYZUt5Y0tneHB5eWUvNVdZ?=
 =?utf-8?B?MTlrRVVsSXZMcUxMSUxpQm12d1Q4QkhhSUpUVUFIQzBkeDFDL3VZcVZGUTBV?=
 =?utf-8?B?UGhpbEozSzVXMHRHME4vTERIQ3JITEI5Y2VNUDhxRlk0bjdjRzJuVWVKcjlh?=
 =?utf-8?B?MFBGa1NTRFh5b2w5S2tHSjhsMlYveG9pRU5HSmlWQkVqTDBVUmMxM3pQWkFX?=
 =?utf-8?B?dEJyNUswc1I0L0tSdzJVME1uRnovMkx6amtUTm5WUENTQnh6RHJJTW1VcUJS?=
 =?utf-8?B?TjJ3K0M4dFJxZmRWVE5zU3RaZmlJYzVkYzB1UDFuQnZxbU9XQVcwWUV4Z0t6?=
 =?utf-8?B?RHdsY2FSemVpdWNpQVZ0OGZLVHFOUzB0bTRjZDFBNW1xcmZvbHhlOVN6ZzFa?=
 =?utf-8?B?cDNLb2tlVnhUbFlMNk4zSFc5TEN4L0F1ODdQUlhMS1V2cnVYZXM2UXRDaGdw?=
 =?utf-8?B?SlVheDQySnlraUVlTVhVR2NzQXBLb3VnZkhEV1NKQks5S3Y4aGFveFhQeEZK?=
 =?utf-8?B?YWhNeUlNd1NtdXk4M2c1bUk0cG1Gc1hBMlh2V2hEdExFVWVYeXJTMm0vbzVp?=
 =?utf-8?B?ZlFyZXNpdFE2RGd5OFhiNHN6aSttZDV0WFJXMzU0cGowWjFKSjFLUmd3dGVu?=
 =?utf-8?B?T3Q3MFJwT3BUOWptMVNzeGhNdUhnMzRIUzN2b1AyNzAxSFJrUUVWZW9zY2g2?=
 =?utf-8?B?Y3J5dURyK1FoZG1mU01neEt4Z1FvR1E4ZFlDY0VxRXh4ZlRnVlJPTktOUlp3?=
 =?utf-8?B?bTJJd3RnM1dXMncrYUwzc0dHT2tsQWZiR1c2NmgxRmdNdmI1SXpjZ1hGWHI0?=
 =?utf-8?B?eHU5dDlROGpkZ3VTRy8yVWVGSEZ3a2NYKzN5ZXZ5UlEzMXBFcWJFcENzeHFP?=
 =?utf-8?B?SUhEZ2svUkNDUXR6WUliOC9EZms5bk5QZEVUc1ZLdUs5SUhJUzRHZ0tPL0Z3?=
 =?utf-8?B?NWM3T1RmbjlPQmRBTHJZR0Y3NUxqTENKWHBPeXRJQldvQjd2SVVVTG5hMDZW?=
 =?utf-8?B?Q0hOWmtzMnh5elBmeUlGQURXZ0JRTVRBdzNVdzlpZWYvTEtVcU9HZTE1ZFdz?=
 =?utf-8?B?aTYvOElxSFJ5RGNGZ2lLUEFISVJjSGFMMEpxeHlsZEZDWTJIQ1cwWktzb1Zr?=
 =?utf-8?B?K3pLdWVZeWEvNDR1SklORW45OG9qMkhIWW9icHIrSC82K1JPUGoyR001ZGc4?=
 =?utf-8?Q?SEFAvTgz/3NFVUm5mDS0imffH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cae97b9-318f-4753-111f-08dd62dcc0f7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 09:44:02.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/G6e7QS3RTU5kcAjLxE4OPdG8r0t3sFFi+DMOGvsgLhaFmzTS6v3xMVT/z5SbTq3/GaUgs5TJxbiPjtx0PpPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7080
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

Hi Kamil,

On 3/13/2025 2:13 AM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2025-03-12 at 16:00:08 +0530, Karthik B S wrote:
>> Multiple subtest groups exist in kms_addfb_basic with individual
>> igt_fixutre calls. Split these using igt_subtest_group so that any
>> failure in the fixture of one of the individual subtest groups don't
>> affect the results of subtests in other groups.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_addfb_basic.c | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
>> index e5ff9ea32..268e4e0e4 100644
>> --- a/tests/kms_addfb_basic.c
>> +++ b/tests/kms_addfb_basic.c
>> @@ -989,15 +989,20 @@ igt_main
>>   		igt_require(has_addfb2_iface(fd));
>>   	}
>>   
>> -	invalid_tests(fd);
>> +	igt_subtest_group
>> +		invalid_tests(fd);
>>   
>> -	pitch_tests(fd);
>> +	igt_subtest_group
>> +		pitch_tests(fd);
>>   
>> -	prop_tests(fd);
>> +	igt_subtest_group
>> +		prop_tests(fd);
>>   
>> -	master_tests(fd);
>> +	igt_subtest_group
>> +		master_tests(fd);
>>   
>> -	tiling_tests(fd);
>> +	igt_subtest_group
>> +		tiling_tests(fd);
> I looked into those tests and imho this needs a major refactor,
> for example there should not be any igt_assert() in a fixture.
> Generally igt tests works ok for one fixture in begin, last one
> at igt_main() end. When used in-between it becomes more
> complicated to handle cleanup.

Thank you for the review.

I tried out by inducing an error using an igt_assert(0) within the 
igt_fixture of a subtest group and verified that the this change handles 
the issue by not failing the subtests in other subtest groups. As agreed 
offline, will use this as a quick fix to handle failures in the current 
design and for the long run will check if there is a way these fb 
tests(kms_addfb_basic, kms_getfb) can be redesigned to be more robust.

Thanks,
Karthik.B.S
>
> Regards,
> Kamil
>
>>   
>>   	igt_subtest_group {
>>   		igt_fixture
>> -- 
>> 2.43.0
>>
