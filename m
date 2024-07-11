Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDABC3271E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 06:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6119010E958;
	Thu, 11 Jul 2024 06:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8DJjR3T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B61D10E97A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 06:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720679238; x=1752215238;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=93Gnp8WlHDrmZ4u8OBFkDROej20l/3vTDDpKBpyWlKU=;
 b=U8DJjR3TEb4MXq9WtK+zzvBPmrLW0Nw4SmOsDfPAGccS7jNwf8QxWEcG
 PFGNcdtpjB6MmNHSpbPRbhrnbcOnf44EK1yjxVo/Q9+/O8wz1xeRY+Tt3
 uKyQJqQxIg+MO+lbE4koUZL7EmEmv1W1MTPb/U5ggcF+nrkugyErBeKrv
 iR1J08oOT8l5p7iSnx6bDOV5h5lQ5Acu4BjFXnmRVf5UqzhnktYCTCCL3
 qcWlMcetGqowVi6raSEAory1ZDd/RIx8SibFFjt4kqY6F5NHUSAc7UHTA
 4o1W+s+Q8JzYWqbmhwXBlUFfPBc8syJZrHmVtPF7NQpuc8bDvQgva/IUD A==;
X-CSE-ConnectionGUID: l3RDEV7kSPehU0xLHCr2tw==
X-CSE-MsgGUID: qOA0jFuGQEeckvf4skX1IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18173924"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="18173924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 23:26:09 -0700
X-CSE-ConnectionGUID: C9KxFQmORzWW36DBRl9IKw==
X-CSE-MsgGUID: j2SDQwKCTEWoAEj8xYC8Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="52842142"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 23:26:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 23:26:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 23:26:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 23:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUDZ0wxu/KLlTHUdOaREKmfD4crD34oeaDEoFEj8oUhtrMD+LcS4WcihaOJZP2LSawvFeTdC1I7MujewFbUsXjVDMHJ/XUo/XMN2t1+PgTIi60dCzv8i+eWYq8xHD2PBVflMB57cGAkQzDo+RrrExRidiukTxxhuyCPtcUAXqNSgeIx/+dQmyyQJevYJVLE3fBEZnLB3UBLmivu9hvnA/IHkM1DdbAOAx8DHuzAzQiYUCdgZ+8quF2MYbJn6a1R5hriYURNccF84OQsNL4POfS66MhU42F37x38GpzIqNU/JOQc0x9XOavnXK+A4UA0Swa31RKGjVHVFFOiU/vuvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0B2Q8ZA003aV4pxxWtoJGCPo3XPyJmi0yUmXu5wTvmc=;
 b=PoHDV6pUA0cLMHlURSa4kKUTA2MEkjz1h55SK7pXuLlNM+4re5EjEccDYiY+BqjDfKBq6W2SIOawmPRiE+EihZ7tZGVOEocOwoowZTZCsSj9g4DAVDv/9U7e7wLqUosyqCkQBn/JVNIUqy6KzQrK4zu+zFVy9kISRjAgn2lsMr49KOUPLrPdsHyD3jacChfCMsneN4peBd3L8TkKXKanvxemnyOpCHAtJIN0NrNgBlehu/RG3XnXGQ4BYZSc0qrsCxJG+JnB3WYpcjFwkMH/RPJSWcwYRU1apGQleTAzwuhJIq64FUue80VFsHjEVJjuPFVxjlcHqZ72AOmPU3j7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MN6PR11MB8169.namprd11.prod.outlook.com (2603:10b6:208:47d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 06:25:59 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 06:25:58 +0000
Message-ID: <da609bfb-214c-4e24-ad74-509536bf292b@intel.com>
Date: Thu, 11 Jul 2024 11:55:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_plane_scaling: Improvise the scaling
 BW issues.
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240709130321.455906-1-ramanaidu.naladala@intel.com>
 <20240709130321.455906-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240709130321.455906-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MN6PR11MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: f4de1f3a-ae95-4cec-41f3-08dca172540a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE1SK3FxQnQ0QUJOeFdOS0FYaTgrWXIwOE5EOExzSms3bWU5MnJCODFYbHpz?=
 =?utf-8?B?Zy9CZlJYQVdXYWZ2MWdwSmRmdzdTSUJXQ2taT3Zjb3RrNWxZblMrWUthaXhY?=
 =?utf-8?B?QjloM1E3amtxRDhwUmpJMzBpWEpHdmMrU1BSdzRkVGVVYlhIS1pseGptSWV6?=
 =?utf-8?B?MTlMVUNkOTJ2RStoNTA0NmI0RlVycVdQQlgwY0MvUFYvTU5iQk5WeC80N1p5?=
 =?utf-8?B?cmNyZG8xOC80dmpHY0FzZlUxQWp6dWlIWkt2MGNqL0YxMjYrMGNnbzNrYWhi?=
 =?utf-8?B?T2pncytiTlVCaTRyckpjemxxM0lOa1ZyUTc4Mk1xbkZmWGpYNlI3dm5BVzBY?=
 =?utf-8?B?Rk9XNkltN1VmemFMdVZmM3RLcmpmNHEvN1dqaDJtZ0Z4NXpQTm9XTmZFMEJJ?=
 =?utf-8?B?K2cvWCtJNmx6bEhVU1hDYWV2TnJzZUVYL3RrUE5pM0xwYmhuVTNPSWxKbTNB?=
 =?utf-8?B?V0wxelBWQ3ZqQlNLZzN1TFBwTnRRK2tzRzFORzJoZFlYbzZuZmVkL3ZjOE5B?=
 =?utf-8?B?cHF0NnhSVE81R0JtOTdTZWVLY1R5YnBDZVRQZFR4N3JUN21GUnFBRTZUTnpY?=
 =?utf-8?B?M1hJZDhsZEpqQ3Zkam5odXJGL1dKV2tUekExVkxCeWRUMlp3TUZkMzNGRDhk?=
 =?utf-8?B?UzRMVU5IQ2lwa3FvUXRuVU1yMG5VMTFTQU1vRVVNTm82NzBncHB1TkVkSHR1?=
 =?utf-8?B?RXRYNHlZWHpTQWcxVzFPazJtY2JYWWN5eVdWTTBaYW5DaGhEdzZUMDNJZVNV?=
 =?utf-8?B?TmM5QmludGRodndzT0d6cWlQREFjRlQ5dGhqM29HWFRNdDdHcVpTZENHcDNB?=
 =?utf-8?B?Z01GYjdRaGNNNE1kVGF2NmxGc0EzejA4dHNNOHBtUnRyYjdQQU55d29VOFZp?=
 =?utf-8?B?Y0lDMmozSUgzSHh3YjJsNHUzNHRGTFgrd01xUy93bitacDgyYkVTd2VPYVRW?=
 =?utf-8?B?VkQ2N1AxVGMrZWpxQ0J3NjY2UkJyVzlYL2dPTHVGYkJTdjY5RWpwK1FCZEpY?=
 =?utf-8?B?aVlwcUdrZFFoZjRabjl0TER4bmhOOVBmRTh4OVR6aEJrRCtnUjRGZU9sZm8w?=
 =?utf-8?B?cjVEQXJHVm1xbUYzYkZTTVJFVWpxNWZCYzRzM1NyZFBkbGw1UTVnRkc1ZnN1?=
 =?utf-8?B?d1lyamZobms5LzI2VlVlOEFIWWswWlcrc2Z0YTJ1dWh4ck5FTTB6QXRmTTcv?=
 =?utf-8?B?S2ZCYWhCUE5iekhtKy9tamZwdUpMNkhzN1JUQjNrRVVkeEowT21GTnM1clk3?=
 =?utf-8?B?MGRRVzRDYTNCc3NOZ1Q5NW40Q3A4TzI5UlFMU2NhTVhtZGRzU1R3bmw2YlJX?=
 =?utf-8?B?NU1sa0laSGN1d2szYzlsUjNsWkJmTmFOMmJsVnlLazFNNisrRVhWZkZVWm9v?=
 =?utf-8?B?TVBEM3QwWmpWeW54c01oTGJuTTd1R01RVmQ5Q1p5d01JcHM5THZMQnhtVFRp?=
 =?utf-8?B?UGY3WVJWclJkcWVmQktUSHRyd3pFYnBLYXg0b01JWGJFeStxeXhwaENTQW5u?=
 =?utf-8?B?aVZOZU9UVVQ2UU9hYkpSWVZVMm8xL2IyWWl4Wkd2MThMKzhMeTBjeWQrbkhr?=
 =?utf-8?B?aFpHWG1FRmlKbEtjOGU5QkM5MWRyTjlYblA2cUVYNnoxR1Z0VVFsc2Y5eHcz?=
 =?utf-8?B?UGlPY293anVJdU0vTExrNUpxY3ZJQmNkeEJpVkFDVE5QWElBQ3IyRm5QTjVI?=
 =?utf-8?B?RmNUN0hiM2xYY1FpZklRR2VTQ29ZODVFdENBdEZkL29pWk51elZFa0NtQmRl?=
 =?utf-8?B?UDFqRDM3OVdFNlBIMXhXOU5hMm5uU0pJa1ZNQ0lraEdxUm4xTHFVU2d3aXFB?=
 =?utf-8?B?UEJ2eDdTOHh3b09Qa0Jmdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckwrVk5EQVVGcW5ZTTR6M1JsNzNJTjNpLzhqa05yTlFQcUZlU0VRbUFoK0dI?=
 =?utf-8?B?SzViaFBoRi93cmJYYVNjRlM1VnJCY3J5clNSb1IzUStXM1Qxd3BTd0dRNFIz?=
 =?utf-8?B?dGlvWHBwc1dSelhpaXFoZVUvb0txRlh4RU0rdjBEREtBRXZQYTFuZ2daVzdC?=
 =?utf-8?B?TXB5akt3dlY3bEJsWEs5K0VkWDlJQTh3VG5waytpT0xwMWlHdU9lZzAycThJ?=
 =?utf-8?B?NElIZWsrL1pxMU1MaXFiNFU1M205c2VqcDAyRjNvSHg1TTUrbFpsQklJN2lu?=
 =?utf-8?B?cnlCZzNzTlpXMW9NdVVXVnJTaTJwSGxBUFdReklueDlycUU3SlhyOUQxN2Ji?=
 =?utf-8?B?QlBNeXRSdXhwTldkQy8vbkttVG5BREZ4azByeFdGRHhKUnU2ZjNsMzBkK2ZV?=
 =?utf-8?B?WUk3VGoxMlFVcFBGMHNVbit4K3dLR3VoOXh5VFZEbVNjL2hycndnT1V3NS9Y?=
 =?utf-8?B?QXJSdmFZYmlySGdIZFRERE1IdkpZdGJmOU1uTnBjNWwxWUdqZTdZUDl0Zm9w?=
 =?utf-8?B?R1VWNzRoeGdTOUI1UGd6Wnc1SUJ3aXZuaExGSS9qckUzVWRiWFl1NjJJWUc4?=
 =?utf-8?B?OVFoNjFFWksvZXA5S0gwK09pMVZIRXlsOVIwV3dTTno5TXo2TGZBOHhzY0J3?=
 =?utf-8?B?VjliTkN3UHpVbEpxWnFka2YzVjVEVUZlU1owQXNPb0RVK1hzTmYzazFndm1X?=
 =?utf-8?B?dlZOQ1l5OEZkbDRvNExoQnVKZ2F6VEVRaWVicGxWK2VVWXJlOWw3dm5ZM25y?=
 =?utf-8?B?M3lRaWR3TUZwZmtxSzMwZ3huUWtmU29LclNGWFZWSmNTVDQzVy8xeFNqT0k0?=
 =?utf-8?B?UlVBY0hKUG5xbW5xOFhRRU5vbzhwOXZGZ0Y0OWxtUUl2NHprVHBWL1BQWVV2?=
 =?utf-8?B?NFZUK05GQStmck1xVVN2SjFQQUlXclNZQ1BaZi8yVGNTYkFFN0VJSW51OUg1?=
 =?utf-8?B?aXlVa2tuWVJ3Y0dQWCtXbFVhK0tOS1AvRnJiYzJCU0ZIYzlvVDZSeXd4NllI?=
 =?utf-8?B?V1A3RkIvRVB0TXBzQzliWkV6UGU5RktTYk85bDlSaHRFelFWTGo5Y1E2aitH?=
 =?utf-8?B?czhYTENIeWVOaHJTVTR5bXdMdHc0OStOV294VzBkbGlRRmNoQVcwTzRxWWNi?=
 =?utf-8?B?OENnTmtqaGd5Z28xS3Y3ZmtxUWJhR1JpN3NWTTJndlV3c2YvN21hWnV1N3dh?=
 =?utf-8?B?NWhPWEpxbHhqTzFKaWthMDNobE5QaWdmNEhLTUR3VS8xOUtrN0x0dHdLWndk?=
 =?utf-8?B?eDFJMlVxdzU3TlNoOHB1N1FDbmZsVHNWNmo5M09QQ1o4WkJNWmZOdjJKQ0xP?=
 =?utf-8?B?UkJLM2U3MkEvMkxoeHZwSk9LdTQ4MVE3WU13K0tsRHBTczJBTmJlR0I4d1Zt?=
 =?utf-8?B?WlFsc29BRnVlZmpIK2s2S01WY25HcXZtb0xGNC8rdjU1OFhrWnJmV2Rjbnd0?=
 =?utf-8?B?UUFNeTNoQmRUemlxampONm9YNk5tRFVGUktuWGFlS0ZFTDFPUWcxTUJzaUVY?=
 =?utf-8?B?T3NVOXpRZG9pcUJtSkc2ZWZwK3l5QzhJVVlrOW5vYmdLY0ZERmg3MG1nUDcw?=
 =?utf-8?B?WXIzS3krWklPRnNSYUI1SWw5ODJvd3IvNG5id01ib3R2Tk5ORGxqcEpwQVZU?=
 =?utf-8?B?R1lJVnFqdVNNZzJGSUhUaTkzWHlGV1phSTF4eFg4eXJ4U01MeFhQRmxvYUJn?=
 =?utf-8?B?WXhXYlo3SWd6L2dabzR1ZldMNllFR1drbDdidlJOTlNyOEFUMlIwbXdqTGdH?=
 =?utf-8?B?MHE4UThFcnM0aDFQMHhFQUdUejQ2RXQxbGpYaXUwLzdqRmttSVNlTFo4MTFR?=
 =?utf-8?B?bGRsc0kzaWpZYnRIMU5rNUF2RVA2V0ZrU0RCWUl0cWsyUVFHenBhZ1ZIbFhU?=
 =?utf-8?B?Tlh2MDJ5VjdhMTRyZnpkVlViSmdTUlhaUnJHTVFYZEZ1dVFiUkxsMk52MDdL?=
 =?utf-8?B?ZTVEd2NqV1A2Z0xRcHNTYlpGQWlFQlZWTlU1eDZicjgvRXFJTlJ3UlZJR3Y5?=
 =?utf-8?B?QjBEcUNZeE1rZXVHdGJHSThnY0lmNHV3c3hmaWJrMWZvTWIvZnMrY0JxRWhv?=
 =?utf-8?B?U2pWS2VhUUlEcm9GcmRLUzFob05ydTBLQXlIa0lTdVdNQVAxRXEvVlppb1hG?=
 =?utf-8?B?SVNQR29YSWRNeE5sWlFZZVp6alB0WE9XaW01dFNDb01QQktHSllWWXNVSzJO?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4de1f3a-ae95-4cec-41f3-08dca172540a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 06:25:58.8901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ugzube3sx2AilJZ+UraUTYEGTS2xYq1JOwa91t3ssf09QANtmNJwcO93b0NPDzY9nqgMv5rir2q1xWXaZgNUSVvEV3fbVu2f4ujsHi1S/Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8169
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


On 7/9/2024 6:33 PM, Naladala Ramanaidu wrote:
> Many tests are failing due to Bandwidth issues.
> To eliminate this failures we change the least
> working display modes.
>
> - Observed, for higher modes Bandwidth is not sufficient
>    to downscale operation and multi-plane scaling operations.
> - Add a fix, when Bandwidth is not sufficent for higher
>    modes it will try the next lower display mode.
> - Fixed some styling issues in the patch.
>
> v2: Fix some styling issues in the patch . (Ankit)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 181 ++++++++++++++++++++++----------------
>   1 file changed, 106 insertions(+), 75 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 3f63d3cf4..3296f98e8 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -210,6 +210,9 @@ typedef struct {
>   	igt_display_t display;
>   	struct igt_fb fb[4];
>   	bool extended;
> +	double sf_plane1;
> +	double sf_plane2;
> +	bool flag;
>   } data_t;
>   
>   struct invalid_paramtests {
> @@ -579,48 +582,57 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,

I think we can just change the functions to pass scaling factor instead 
of width and height.

More details below.

>   	drmModeModeInfo *mode;
>   	int commit_ret;
>   	int w, h;
> +	bool mode_support = false;
> +
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		if (is_upscale) {
> +			w = width;
> +			h = height;
> +		} else {
> +			if (d->flag == true) {
> +				width = mode->hdisplay + 100;
> +				height = mode->vdisplay + 100;
> +			} else {
> +				width = get_width(mode, d->sf_plane1);
> +				height = get_height(mode, d->sf_plane1);
> +			}
> +			w = mode->hdisplay;
> +			h = mode->vdisplay;
> +		}
>   
> -	mode = igt_output_get_mode(output);
> -
> -	if (is_upscale) {
> -		w = width;
> -		h = height;
> -	} else {
> -		w = mode->hdisplay;
> -		h = mode->vdisplay;
> +		/*
> +		 * guarantee even value width/height to avoid fractional
> +		 * uv component in chroma subsampling for yuv 4:2:0 formats
> +		 */
> +		w = ALIGN(w, 2);
> +		h = ALIGN(h, 2);
> +		igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
> +		igt_plane_set_fb(plane, &d->fb[0]);
> +		igt_fb_set_position(&d->fb[0], plane, 0, 0);
> +		igt_fb_set_size(&d->fb[0], plane, w, h);
> +		igt_plane_set_position(plane, 0, 0);
> +		commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +		igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> +				"Unsupported resolution parameters  %dx%d\n",
> +				 w, h);
> +		if (is_upscale)
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +		else
> +			igt_plane_set_size(plane, width, height);
> +
> +		if (rot != IGT_ROTATION_0)
> +			igt_plane_set_rotation(plane, rot);
> +
> +		if (igt_display_try_commit2(display, COMMIT_ATOMIC) >= 0) {
> +			igt_plane_set_fb(plane, NULL);
> +			igt_plane_set_position(plane, 0, 0);
> +			cleanup_fbs(d);
> +			mode_support = true;
> +			break;
> +		}
>   	}
> -
> -	/*
> -	 * guarantee even value width/height to avoid fractional
> -	 * uv component in chroma subsampling for yuv 4:2:0 formats
> -	 * */
> -	w = ALIGN(w, 2);
> -	h = ALIGN(h, 2);
> -
> -	igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
> -
> -	igt_plane_set_fb(plane, &d->fb[0]);
> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> -	igt_fb_set_size(&d->fb[0], plane, w, h);
> -	igt_plane_set_position(plane, 0, 0);
> -
> -	if (is_upscale)
> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	else
> -		igt_plane_set_size(plane, width, height);
> -
> -	if (rot != IGT_ROTATION_0)
> -		igt_plane_set_rotation(plane, rot);
> -	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> -
> -	igt_plane_set_fb(plane, NULL);
> -	igt_plane_set_position(plane, 0, 0);
> -	cleanup_fbs(d);
> -
> -	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> -		      "Unsupported scaling factor with fb size %dx%d\n",
> -		      w, h);
> -	igt_assert_eq(commit_ret, 0);
> +	igt_skip_on_f(!mode_support, "Band Width not sufficent for scaling\n");
>   }
>   
>   static const igt_rotation_t rotations[] = {
> @@ -847,41 +859,52 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,

I think we should do away with w1,h1,w2,h2 and just pass scaling factor1 
and 2 in these functions.

We are anyway overwriting these. With that, we will not be required to 
add extra members sf_plane1/2 in data.

Also we might want to split into smaller patches.

Otherwise the approach looks good to me.

Regards,

Ankit

>   	igt_display_t *display = &d->display;
>   	drmModeModeInfo *mode;
>   	int ret;
> -
> -	mode = igt_output_get_mode(output);
> -
> -	igt_plane_set_fb(p1, fb1);
> -	igt_plane_set_fb(p2, fb2);
> -
> -	switch (test_type) {
> -	case TEST_PLANES_UPSCALE:
> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
> -		break;
> -	case TEST_PLANES_DOWNSCALE:
> -		igt_plane_set_size(p1, w1, h1);
> -		igt_plane_set_size(p2, w2, h2);
> -		break;
> -	case TEST_PLANES_UPSCALE_DOWNSCALE:
> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(p2, w2, h2);
> -		break;
> -	case TEST_PLANES_DOWNSCALE_UPSCALE:
> -		igt_plane_set_size(p1, w1, h1);
> -		igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
> -		break;
> -	default:
> -		igt_assert(0);
> +	bool mode_support = false;
> +
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		w1 = get_width(mode, d->sf_plane1);
> +		h1 = get_height(mode, d->sf_plane1);
> +		w2 = get_width(mode, d->sf_plane2);
> +		h2 = get_height(mode, d->sf_plane2);
> +
> +		igt_output_override_mode(output, mode);
> +		igt_plane_set_fb(p1, fb1);
> +		igt_plane_set_fb(p2, fb2);
> +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
> +				"Resolution not supported by driver\n");
> +
> +		switch (test_type) {
> +		case TEST_PLANES_UPSCALE:
> +			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
> +			break;
> +		case TEST_PLANES_DOWNSCALE:
> +			igt_plane_set_size(p1, w1, h1);
> +			igt_plane_set_size(p2, w2, h2);
> +			break;
> +		case TEST_PLANES_UPSCALE_DOWNSCALE:
> +			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(p2, w2, h2);
> +			break;
> +		case TEST_PLANES_DOWNSCALE_UPSCALE:
> +			igt_plane_set_size(p1, w1, h1);
> +			igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
> +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		if (ret >= 0) {
> +			mode_support = true;
> +			igt_plane_set_fb(p1, NULL);
> +			igt_plane_set_fb(p2, NULL);
> +			igt_assert_eq(ret, 0);
> +			break;
> +		}
>   	}
> -
> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -
> -	igt_plane_set_fb(p1, NULL);
> -	igt_plane_set_fb(p2, NULL);
> -
> -	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
> -		      "Scaling op not supported by driver\n");
> -	igt_assert_eq(ret, 0);
> +	igt_skip_on_f(!mode_support, "Band Width not sufficent for Multi Plane\n");
>   }
>   
>   static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
> @@ -902,9 +925,9 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   	int n_planes;
>   
>   	cleanup_crtc(d);
> +	mode = igt_output_get_mode(output);
>   
>   	igt_output_set_pipe(output, pipe);
> -	mode = igt_output_get_mode(output);
>   
>   	n_planes = display->pipes[pipe].n_planes;
>   	igt_require(n_planes >= 2);
> @@ -1308,6 +1331,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> +							data.sf_plane1 = scaler_with_pixel_format_tests[index].sf;
>   
>   							test_scaler_with_pixel_format_pipe(&data,
>   								get_width(mode, scaler_with_pixel_format_tests[index].sf),
> @@ -1333,6 +1357,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> +							data.sf_plane1 = scaler_with_rotation_tests[index].sf;
>   
>   							test_scaler_with_rotation_pipe(&data,
>   								get_width(mode, scaler_with_rotation_tests[index].sf),
> @@ -1358,6 +1383,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   							drmModeModeInfo *mode = igt_output_get_mode(output);
> +							data.sf_plane1 = scaler_with_modifiers_tests[index].sf;
>   
>   							test_scaler_with_modifier_pipe(&data,
>   								get_width(mode, scaler_with_modifiers_tests[index].sf),
> @@ -1382,6 +1408,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.flag = true;
>   
>   						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
>   							mode->vdisplay + 100, false, pipe, output);
> @@ -1402,6 +1429,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.flag = true;
>   
>   						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
>   							mode->vdisplay + 100, false, pipe, output);
> @@ -1422,6 +1450,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.flag = true;
>   						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
>   							mode->vdisplay + 100, false, pipe, output);
>   					}
> @@ -1442,6 +1471,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
>   						drmModeModeInfo *mode = igt_output_get_mode(output);
> +						data.sf_plane1 = scaler_with_2_planes_tests[index].sf_plane1;
> +						data.sf_plane2 = scaler_with_2_planes_tests[index].sf_plane2;
>   
>   						test_planes_scaling_combo(&data,
>   							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
