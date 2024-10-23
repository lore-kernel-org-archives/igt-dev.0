Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83F8D2E01F
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 07:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB7910E1F8;
	Wed, 23 Oct 2024 07:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apxfLaX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B9510E1F8
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729669456; x=1761205456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gEQlk3C4UpcitAbf3m+4Kj27CP7w5Lfzvj9EQR8zQ2M=;
 b=apxfLaX7oAmcOSznN2eZFxuq9NTTkz0b0JYFaU4qjV66hqGJV+ePRGDu
 w9g8M7TV3flcm2gVhBmAyyNydPexnpSd8sBzg49jz6p5aUdcHlyhBLtu6
 wZZ8luEqw52wcPKCRspY8ktzW0RIc0HZltN3w1+mqnuasf6eAAhDRtKhv
 XD9BLUdLRC1GSjG8M1eibmO9ocjwvVLkysT66AhE5FLGbTZJ/od9mdHQz
 QnV7MgQUc/TVjfGmki5leW1lgeQortv/Av6/24y4Kx05pZFzk7ebgChq1
 xGN3k9hI3Ro9RIB8OpH4ApGGe4PY52bZfttfPIcibTs6QgNvI4aF2hSBc Q==;
X-CSE-ConnectionGUID: EW8nRVHfRliolP5qi3xFqQ==
X-CSE-MsgGUID: yNQHM+R8Rq6q3/Rnnhstcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51785449"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51785449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 00:44:16 -0700
X-CSE-ConnectionGUID: KZ8z7YhATryaKmC1Gto42Q==
X-CSE-MsgGUID: hnh0UQEZTLKzDIYKlq6CsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="80934802"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 00:44:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 00:44:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 00:44:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 00:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxJThGEczi8xD3hBIGImd7JIprqEiM2gNAyJ4hjtn6yFBJNFfwAIHzr1QR8Ln7uuifaqWRykvJXX3IFBUM0TmhIXlvi5c0VvZnS/dcleKy+Tivz/tRvmYcjQLNNZ6+KQwqHkRiTCb84VboPof+5DN0edVk8l69Of7dC6qpvgtQkYhZQfcwPzjjG9N6jXGYTYQgPMBYrWXa9mrx/6AftBWRoxT2bTrRkPeBcheNVycGkH6L+PcF4u0Sk+n9IQRkocQUIUJuzkrDsROKZEKNZ4sq7k1S4hcYi0eG3NqSR2AeqnpEzpREucCdn06i2uXWDemqM59zL83ZRvd5TLTk03xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3Xlc+p9Ls9hWIFynpszDrMZMsjhjiCLR21Aolf6p10=;
 b=mc28CXKo1MB5Em2JddbzgIqafhA7IgFXHxrhs4tfSRRAw7/+cNz7BoDkL6PFsr0CVKd1E6deyyr2B3PsO9I91cCuafql/aCQRNPeGdy2VR1MmJsXW9ZxcqMF2/BMQ9fRwJAPkkkHy5aw/QEsZDyOzPp3+10npgOXglPdjZOdUyvzk1CPbNREbr9Tu71ekezQLaN0sDEe0iffAp9lAFn03ZY+hSvU9tb4xjV+w1tSZAPEQjDP6AykMcAmUnFcY4mgrfl5Y71m4mtVs4bxJxLVs4vYK+sRqT7x7h9cYaLZwHyoONSAASoA/DpoHqrD8IDyjfA0r46hgNxnMTYVmXGBMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 07:44:12 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 07:44:12 +0000
Message-ID: <22d9b1c8-1f89-4954-9a77-58e4678907ae@intel.com>
Date: Wed, 23 Oct 2024 13:14:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v4,1/2] tests/intel/xe_pm_residency: Add GT coarse power
 gating validation
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20241022104918.2120652-1-sk.anirban@intel.com>
 <20241022104918.2120652-2-sk.anirban@intel.com>
 <a33c8dd0-46c1-4b12-8610-6fa4e3129115@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <a33c8dd0-46c1-4b12-8610-6fa4e3129115@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 1624459d-2a7d-406c-329d-08dcf3367c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXBCZFR4WG90L1ZMcVBKK2ZHN0NCMmxiSnZwWTNCYlpCdlM4RjNMZDB6Z1Ex?=
 =?utf-8?B?dndCNHhFa3d6QTlOdHVyV3VZeGIvRmlEbUJIMVFxemszaTgyWmMxRnhyNjNm?=
 =?utf-8?B?VHZ1VnpiK0VSZW1YNEt4dkx4RjA5dHVmSk9PWEdha0RaV0lHY1RzQWk0cjBt?=
 =?utf-8?B?S1BjYW5ockllK2szcU5QY1pGSW9ZNGZvT29HZnRIS092amR6WWF6dDAyL000?=
 =?utf-8?B?bjduUG0wRzFkVGhWQUw0OUpycWpXSVBBZnF6enp5TERTWDZlOTBlcW56c0Ns?=
 =?utf-8?B?ODdrTUtRd2FnL3Z1ZWpMVFJYbGFhZkZyaG5QTER3SG9yQTlaMnkvM3Jlcnhx?=
 =?utf-8?B?eXFzM2hqSFhxMjVjaVY1eVJMRnV0SG0rRVJWMXkzYlFTczh0eDVDQldDdzU4?=
 =?utf-8?B?VGlJSGJwYjFKZXp1RmVVOEh0UVB4RVlhanVib1BqeG5JZnhXTFJ3UWlTWnQx?=
 =?utf-8?B?OHZ6ZkFUTDJiSHhOWnUvRHJnL3RIZTNlSjdIRURURzBsZHhyMUxGMHVjaS92?=
 =?utf-8?B?Y2ZVVEtzSnRuMk9qK3JLUHBxOVNZK1dLV2pjK1crdWsyeWY1VE9Qb1p2TmNF?=
 =?utf-8?B?UmMra2hQQ1N1YzdKR1dnU1FaemxvYmdjbW5ZRzdUbytGYTU2WUZLaHptTE5T?=
 =?utf-8?B?Zm94Rk9LMkJ0WFpqWFBMcEwwcWlEQWwzN3VDUlc1OTJBejFrOXlLN1VFL3FE?=
 =?utf-8?B?SVQ0TVJMRjR2VXdYOWxvZkpxYXJ4QWIyendjSzJxa3d5dm5QbldtTXVvejht?=
 =?utf-8?B?cU9QOFJ1bDMvNDhXVjh1SUxmZGZqQ3k5THAwNmhPVHhOQ0xvQUVEMjN1WVR5?=
 =?utf-8?B?TVRpYzJmZ0M1cWhVUzd2Mk5zWVh0MzlWaVNzUWlDTmE0MlZKbSt4Q2xBRUVN?=
 =?utf-8?B?Y3VyZ2tvaDNTZVNiaG9FeDdjd1RUTUpheE40ajhSckZRNUNXbnRVZ094aTlR?=
 =?utf-8?B?N2FwM3J4Z1FiRTZmTTUvL2VzRmVGbExNODVhclV4RDlQdUtrUUNLaVRTV2Fw?=
 =?utf-8?B?a0FnODdDVlc5eDdKcWxsbVNvV0IyaWtsN1dmSHUrMzBBeVlPS1BZNW1ibmtq?=
 =?utf-8?B?N3l5NG55TXlKOU5GVXJPdWE2OUxOTUtPS2JLV2dxNmFwd3Fac0czVkVkZzhB?=
 =?utf-8?B?dWxRaXlkM3V0VlR3MmdWZ1A3eE13bGlXcWxzZkEwN09XMTlsVWcxdXpyWWtu?=
 =?utf-8?B?YW9KUFhCRlNZTzFzdE5hclNUZGNEMmNGb1o0VEtHZW5qTWlVZlVOZGNQVFB1?=
 =?utf-8?B?VUI2M2hpdXZtS0dvdkJvRCtFd0NrMjlyUTdpSnJlRjg5elJaTk5sTXlrQi9h?=
 =?utf-8?B?MDE1ZzNWU1o4RVRwMmN4QXRudlBvNG1PODRJYlgxMWFycVZQTmtvTG9uM3pj?=
 =?utf-8?B?Y0ttblEreFg2UHptYlNSMVZhVTdlZU1sZWtScjZzcklNeHEybzQxaTB6b1dj?=
 =?utf-8?B?MTJLZ0wxb2RML2NZdHVSTXF0STRiR0JETUJ6UkdldkpHRk1rZ09Lc1Q0MGEz?=
 =?utf-8?B?UExXRDlWcHR4NkZmVGZEcEtSSktPaVUxazZ0Y0FaZG9idXdDUitMdnBVbU9X?=
 =?utf-8?B?RlBaZmdETmpXTmk5MXAwODlqYVU4MEVQa3p5K2tGMGNFd1JUTFB4aCtBWTJH?=
 =?utf-8?B?U0NScC9RNFgzWlhxVTZrNm45U3djK0d3ZVNaZzNjV2tDUUpZeDV0WWVoa0tH?=
 =?utf-8?B?RTl1V1NJc2VhZFBNRkhRRWJHQ3VLd2dOYmdVUDBwb2FTb1FtVjdKS0FPdjRj?=
 =?utf-8?Q?j4evpGT8vuv73g5EiLig82nYDHm2ys5fQlneKsn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emhaWDBrVkJ4TDhWMjVVVHkrNEFwWGlYNDliaFEwMEJFWVFKWEV1ZFh2L3Nx?=
 =?utf-8?B?MWQ1MHFQNko5c2JZdVJScnkyK3hVMHFFbFF1QjdWN3Fjc0llZ2NCVnRFaHFl?=
 =?utf-8?B?dlhiMTRmT0F1V3ZTRTZTUFZMUEh2RlZKYkwyOEZmbjJ5L3Y2ZUNyVDhYNTl4?=
 =?utf-8?B?UDZiak9iUE1iSmFqZkhhU3FhVzdjeEUzSXVMa3RaWG1zbGNvYlAyNGRpbjJ4?=
 =?utf-8?B?MEt0TFdmdVJobmNIRWQzaFNCLzZHZkdGTlcydzA5b0ZCUVQ5MUJ2MFF4bC9U?=
 =?utf-8?B?dGJrLzNyY1YrbDJxY1FJTGNDR29HQWVheGdScytua3QxRFd3QjQ5RTdKNjFX?=
 =?utf-8?B?WExwbUthUHNQS05xU3c2S2Erb0FRc3cyUVZLeFBjaFZMSlQ5c01jZXFEOUdB?=
 =?utf-8?B?NW5lSVo0TTREVEwvVEFZazVLSW9DZnk0cmNYbXk0eGlKSS9kU25ka0w4Skln?=
 =?utf-8?B?dWFBejNraXZTTUZPSDc4TXU2NTdJSGR1d2NkcENTaGtsTXdrY1hhOGtpSWM4?=
 =?utf-8?B?N01rRG9jdnIyUTJ3b0l4TWtIWTJZN0ZDc2xCMmQ1dmRmWXErSGJmSU1TRGNo?=
 =?utf-8?B?YzBqMk1EbkdsSHZGTVZoQ0NkcXBzQjQxZDg1RWNOTHFmS0RRaStycVd4YUdS?=
 =?utf-8?B?V0QzYmcrWXRWWnQvTVplSFFDZGRHa3J4ZGtrQzdVK0VmTzZxcWNINDVvSm9Z?=
 =?utf-8?B?UGxlSWpBbTFrNjZkU3d4V2VQZVEvclpVdm5leGlYNDRlSlVjSk90M1R4MmJr?=
 =?utf-8?B?NkxVVWU1cUQxSG13Z3BrZW11MXZFRmZUd0FrczNGd01mdjBhSTB5dDNCa2Q4?=
 =?utf-8?B?TE9lOXRtN09lcVY4bjNQMEkzOVdHSXhXRC9hZ1pCMUxHZllNNEVwQ1ZJazVa?=
 =?utf-8?B?OXlMSStvTElWdS9xdVF5aEJCOWdISFNuaG9kMG5VN0kzYlh2MlIzemF0clRZ?=
 =?utf-8?B?RTlFd0lVOThjOWh3U0Q2TVhieDBhSFE1TU5ubUlzT1BBL3NZajNBc2RUM0k2?=
 =?utf-8?B?Ukk2WlJSWmc5dUsycEM0b1AxT1Y2NzBOajJCVHRETHhmR0dMNkNseFJ4Nk5J?=
 =?utf-8?B?VnYrU0xmQmMzVDJNb0ZUOXFINURwRjg1M1hUNEo2eTkvQUxHNmh2Z0J3ZDg5?=
 =?utf-8?B?SnZiMldzSWM4R2poc3hQVHhMcW1paTkvYkZ2dXlES2ppT2w0VjZQNktQcC9m?=
 =?utf-8?B?aC90ZTIzbFFBK1haUVBDbFdpY05tdTBTZkF0ckdHQy8xTURZUFhpMXBYalUy?=
 =?utf-8?B?VHdrMlU3SVFOYnJJaXRPTlRPTXYwRkdkR1poUytJenp2cWkxR2NQcTYwS213?=
 =?utf-8?B?MmR3dGRqTzhNd0xyUHJZOEM5YU1sN1VOR0ZWR0dYdE4wR005ZnQyeDRUdlA4?=
 =?utf-8?B?RmpMRCt1WjZiQ3o1Sm85OVF5ZFg2QjVKMGRNVWx5V04xdzNZN0lKb2FxL3o3?=
 =?utf-8?B?UnM5MXJpaTROMmtPUW1yNUVDd1hGNXFkMjcvTUFrR2I5aS9ISG5EVkJKZmRP?=
 =?utf-8?B?WWVqWnFXUDl5Q1lCaURoKzNOejhWa3IxdkQ0bzViTERUUVFpZWgzOWV5dGs3?=
 =?utf-8?B?OWFjTVNaaVRDZnFBUWEvSFV5TXBXb0xzWjhkWGsxUUZyKzZEaVRPL2dLakVZ?=
 =?utf-8?B?VDlpQS96bFViNzNKcnlxU2xZUWJnTDQ0eFhiTUcyRXpRL0g1ZGJqVFByK0Nu?=
 =?utf-8?B?T3VqWWI2ZWEreEl3eStST0pVUEFBdWpQVjlYOEtFVVkwK3NlYk85UDh6enlV?=
 =?utf-8?B?anVPaURVNTA0a1BOaU9NdFlCdWpvT3FWc3JYVURpam9KM1MvanRVNW5SRXJD?=
 =?utf-8?B?RGhBTmdwaWZGN0JxWVZXaTBsemFSK0t3K1BCV3NzMVdXeW9YdUZOSWc4YzBW?=
 =?utf-8?B?dnpDVmRyUzBmN2pMOEhnTk82RVBIVWRqYlcydFNJM1hlbHFTS1NTZFI0b21v?=
 =?utf-8?B?L1J1UmxmNGd0ekZKN1JUaHlLNGRsUFR4STF4V2xEWXY2STFnU0xkbDlEbzk4?=
 =?utf-8?B?SXBaSmtNaGZOUXhhMThCRjdwRnhGVHBTa0FlTDRvRWRRU1c5UWxSNHZQVFha?=
 =?utf-8?B?WFcvMDRQc3ovbWh4K0JLZ2NGaGJUZjVwM3ZsR0JObjNzM3ljTnY5bi9TMWxr?=
 =?utf-8?Q?soR30pAHWFoupUKBW+Sofmgxp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1624459d-2a7d-406c-329d-08dcf3367c6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 07:44:12.4737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HL/f4vqTs5uA+uRMwkHYBZww8vfBOJJ8GePYepN3XEOXAY1laNlzrwoN9ovsqfIUVvr5lRbpVbMwAp0Y1CwV/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
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

Hi Riana

I was using the dir in the previous version of the patch, I will remove 
unnecessary opening and assertion of the gt directory.

Thanks,

Anirban

On 23-10-2024 12:55, Riana Tauro wrote:
> Hi Anirban
>
> On 10/22/2024 4:19 PM, sk.anirban@intel.com wrote:
>> From: Sk Anirban <sk.anirban@intel.com>
>>
>> Implement test cpg-basic to validate coarse power gating status
>> after S3 cycle.
>> Add test cpg-gt-toggle to check if GT coarse power gating is up when
>> forcewake is acquired and down when released.
>>
>> v2: Address cosmetic review comments (Riana)
>>      Fix suspend state (Riana)
>>      Add exit handler for test cpg-gt-toggle (Riana)
>>
>> v3: Address cosmetic review comments (Riana)
>>      Fix commit message & test name (Konieczny)
>>
>> v4: Address cosmetic review comments (Riana)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 90 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 90 insertions(+)
>>
>> diff --git a/tests/intel/xe_pm_residency.c 
>> b/tests/intel/xe_pm_residency.c
>> index 772fe9b57..e9a257fd4 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -63,6 +63,12 @@ enum test_type {
>>    * SUBTEST: toggle-gt-c6
>>    * Description: toggles GT C states by acquiring/releasing forcewake,
>>    *        also validates power consumed by GPU in GT C6 is lesser 
>> than that of GT C0.
>> + *
>> + * SUBTEST: cpg-basic
>> + * Description: Validate GT coarse power gating status with S3 cycle.
>> + *
>> + * SUBTEST: cpg-gt-toggle
>> + * Description: Toggle GT coarse power gating states by 
>> acquiring/releasing forcewake.
>>    */
>>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>   @@ -317,6 +323,79 @@ static void toggle_gt_c6(int fd, int n)
>>                    "Power consumed in GT C6 should be lower than GT 
>> C0\n");
>>   }
>>   +static void cpg_enabled(int fd, int gt)
>> +{
>> +    int dir;
>> +    char str[512], path[PATH_MAX], *render_substr, *media_substr;
>> +    const char *render_power_gating = "Render Power Gating Enabled: ";
>> +    const char *media_power_gating = "Media Power Gating Enabled: ";
>> +
>> +    dir = igt_debugfs_gt_dir(fd, gt);
>> +    igt_assert(dir >= 0);
> Not using dir anywhere. Why are you opening this gt dir?
>> +
>> +    snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
>> +    igt_debugfs_read(fd, path, str);
>> +    close(dir);
>> +
>> +    render_substr = strstr(str, render_power_gating);
>> +    if (render_substr)
>> +        igt_assert_f(strncmp(render_substr + 
>> strlen(render_power_gating), "yes", 3) == 0,
>> +                 "Render Power Gating should be enabled");
>> +
>> +    media_substr = strstr(str, media_power_gating);
>> +    if (media_substr)
>> +        igt_assert_f(strncmp(media_substr + 
>> strlen(media_power_gating), "yes", 3) == 0,
>> +                 "Media Power Gating should be enabled");
>> +}
>> +
>> +static void powergate_status(int fd, int gt, const char 
>> *expected_status)
>> +{
>> +    int dir;
>> +    char str[512], path[PATH_MAX], *status_substr;
>> +    const char *power_gate_status = "Power Gate Status: ";
>> +
>> +    dir = igt_debugfs_gt_dir(fd, gt);
>> +    igt_assert(dir >= 0);
> Same
>
> Thanks
> Riana Tauro
>
>> +
>> +    snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
>> +    igt_debugfs_read(fd, path, str);
>> +    close(dir);
>> +
>> +    status_substr = strstr(str, power_gate_status);
>> +    while (status_substr) {
>> +        igt_assert_f((strncmp(status_substr + 
>> strlen(power_gate_status), expected_status,
>> +                      strlen(expected_status)) == 0),
>> +                  "Power Gate Status Should be %s\n %s\n", 
>> expected_status, str);
>> +        status_substr = strstr(status_substr + 
>> strlen(power_gate_status),
>> +                       power_gate_status);
>> +    }
>> +}
>> +
>> +static void cpg_basic(int fd, int gt)
>> +{
>> +    cpg_enabled(fd, gt);
>> +    igt_system_suspend_autoresume(SUSPEND_STATE_S3, SUSPEND_TEST_NONE);
>> +    cpg_enabled(fd, gt);
>> +}
>> +
>> +static void cpg_gt_toggle(int fd)
>> +{
>> +    int gt;
>> +
>> +    fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +    igt_assert_lte(0, fw_handle);
>> +
>> +    xe_for_each_gt(fd, gt) {
>> +        cpg_enabled(fd, gt);
>> +        powergate_status(fd, gt, "up");
>> +    }
>> +
>> +    close(fw_handle);
>> +    sleep(1);
>> +    xe_for_each_gt(fd, gt)
>> +        powergate_status(fd, gt, "down");
>> +}
>> +
>>   igt_main
>>   {
>>       uint32_t d3cold_allowed;
>> @@ -380,6 +459,17 @@ igt_main
>>           toggle_gt_c6(fd, NUM_REPS);
>>       }
>>   +    igt_describe("Validate Coarse power gating status with S3 
>> cycle");
>> +    igt_subtest("cpg-basic")
>> +        xe_for_each_gt(fd, gt)
>> +            cpg_basic(fd, gt);
>> +
>> +    igt_describe("Toggle GT coarse power gating states by managing 
>> forcewake");
>> +    igt_subtest("cpg-gt-toggle") {
>> +        igt_install_exit_handler(close_fw_handle);
>> +        cpg_gt_toggle(fd);
>> +    }
>> +
>>       igt_fixture {
>>           close(fd);
>>       }
>
