Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B069E64006
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 19:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B495910EA41;
	Thu, 21 Nov 2024 19:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoqIik9k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAEA10EA41
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732216787; x=1763752787;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d+mx2dOKU3B73AGu/U9X80tGJTpDxRfQgGINAl+zmp4=;
 b=JoqIik9kqZt0+89y8zsDHMA9Hcbw/B4LiFNGtjQTPwOv7u5Zf/1cp8ql
 2JCVW0+p8M4/3LWTaSm3qX7AfDrEN1Ehk35T1gjiTvvdtXZeqtYre47BZ
 HIpuIDs1vQIcq8i4eCOYGz3jeyuZQqiGXRkBkieUeu2zQbSZPkZtxXdsx
 ZmiG7F3sF/qIILStMjLgCIYBWTT3Im7zoNAYnpITWSU29PmzXVIw8P5xq
 7FUI3f2onMqgHYHlDun4pzR1MqIpsZEGUkayQ3rE4AX921YZjQgnJjhxs
 RMSbWmy0STP0bgeKxu5+2W6wGh4ZGWIUqO4d87BE2RARVNvvdoscT9xvM g==;
X-CSE-ConnectionGUID: 3X/Z9B9DSLi+qgwDNexNHg==
X-CSE-MsgGUID: mTJwbHfBQ1204LrcTGBW4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32207989"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32207989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 11:19:46 -0800
X-CSE-ConnectionGUID: BpLnZdxlQOqi/k3GtwNIOA==
X-CSE-MsgGUID: NQ//N8ViTqW9OhgXpYJ2+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="121223165"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 11:19:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 11:19:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 11:19:46 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 11:19:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6RmUW6JspUmawL/Sf61s/PBYClBGiaX+2FT4EbZ3q9yd2PfK+vg+SfkEKZ/u4nlfVIdyPV35UhPqiAH9lvDhJCJ9rC/i2iEFhZkf2M+54r/6evgrBv9p34zrmPipae6Fvi5BTHIek2hY1XwEAkWGB5NKf21uWH3AQmnfcKWwjLzPLSEw/bj05Ottx0T4qIVw9Z9LNPkavXBxh/e2jFF2yttzbZHHyWSqbGslVUahJlQwdhByFymlHzWmWiCfd+aOP7ThzIt4olTV+kW5OjE5hqulFN8fBRuUaS2ql2wMS5a8Uq/YcG50rqOZWVXMhbKKPqxvmdzVlH2zeJ5a7PJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujc8LCDHzbO4fOFuVtgBfTT9VGQ6G34Pkr4PZeJvj2s=;
 b=wGk1py3ENdmK4mcS2j6EpDAB1TCBC5iUNq/5x2Qf0Nd/Y/FxvpPsKCro2lMTNsiHG8c6CU3tbvw7Ch+IFUYZxGumc0iN8ovMTZAasL01wxuKnDWTdlyXcfEbl1Kl+dW4UefJ8jdQcW9ES29Ys2fl+3jIUsxiZy+G0g5lGSNKNnBhQEpmLgsZA/a8Ogo768PW+AwSxLxJvk0aU06Anw0/uBA8KYX0E+X7r4t4FupvDIbybHLI8wBoQ/juaamhy6nxz2pV3y1Zyj5CpI0wSjmuvjoKc0qpXi6HONMbK9M/nk/1maUdcF789MpTtsvCiDBztq99+Tv2KHc0WqdnmvV85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ0PR11MB4863.namprd11.prod.outlook.com (2603:10b6:a03:2ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 19:19:40 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 19:19:40 +0000
Message-ID: <531da1ed-5f7c-4275-8bc9-661fee94c9f8@intel.com>
Date: Fri, 22 Nov 2024 00:49:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_big_fb: Intel display version
 20 onwards doesn't do hflip with tile4
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20241118081828.1895925-1-pranay.samala@intel.com>
 <20241118081828.1895925-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241118081828.1895925-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ0PR11MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: 3286cbb4-985b-4039-7e69-08dd0a617235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG9tcW9Bb0MwNHU4d1Q4ckxmajNqVGRaQXhPK2U2WDBBaHRoNG1GRU5xYjBN?=
 =?utf-8?B?NzJkZmcrOEs5aXY5bVlORmYyWDk1WXZQT1ByUVRGSVFOcys3YnFUWUJXNm01?=
 =?utf-8?B?SHBpVXpmbU5QeDNlZjA5MGd6cmNqUnN6YXZVUldhK0xTSEZqTzNGL1RXM3Bu?=
 =?utf-8?B?cjJyUDRmdC9BYVJCZC9CTlZGZWpjSGhyT3l1NHdpUHQ1emFIK1Nta3FBNVZS?=
 =?utf-8?B?d0JBNTNEek1GeU1HMTlrV3Y3NHFkOXhBMTdvRktCbklrMEwvTjZtckRPYTJZ?=
 =?utf-8?B?RkdKbjJiV0ZxWndSeHNNb0VCOVdJMkJLbHlFaXVpRzlKSzVZbVJCUXRNY3pv?=
 =?utf-8?B?bzd2RXE4NzRSVUs5VGhVSXdPd0lmNDZSN2VEYytNZS9vSTBzU2N5ejRzWjZD?=
 =?utf-8?B?cXRSeEdtemg0b0tkUldXanFWYmUzam04ZEM4L2JKUG9tUE81MERzUEtXQ3Bs?=
 =?utf-8?B?NG9PSWtmN0szZVVCa2ZNZzVJTEdNVnArdktuUlZtZllsRnhPUURHb1JQTmtG?=
 =?utf-8?B?aGRMVFp5WDF3QlNSRE9vSHk2RDlxOVhXWVEyeWw3OXY5aVlXcHBiaFdKemIv?=
 =?utf-8?B?VWNkbFVmZ0lNd3VTVVJnZXBHbGxLaTJCRG5nb1dXclZteFJGaVljN292Zmpx?=
 =?utf-8?B?OEc2U3RMMW1HVkVIYnhHUjRWU0dNZkZIUVpjOW5zNmtPdjYxeUZ6WjVzcnVG?=
 =?utf-8?B?eEs4MUtSWUlyUkFhVDZFMVlIVVBHQVM4UWNoNlFFQnozT0tMU043S2pPMngy?=
 =?utf-8?B?dDdhMXdKalJoNUd0aFRkb08vdGd2UloyUDlJTWw0bE9pOXZpVmdMNklWN1VO?=
 =?utf-8?B?VkhiMnBHQ3BkVTkrME5IK3U4bHNGL255YktZNCtOS3NJVGlRYndZQVduTmkx?=
 =?utf-8?B?alRqZVdCTGRHbGozdGNBRUhXWlhybHRIc25NNXJlTWlNTkpTQ2NLVW1UWmZR?=
 =?utf-8?B?elBNK3hSUE9JaVlWb0RLV3NReEtLNzBpeEpHbVppRkE1SEtUampLMFdTS0Na?=
 =?utf-8?B?aHpsNU1MTnhOUklVYTFuSUFsU3ZUV2hzK2JwVERzeXVxYjhTNHlIMmpkL2l6?=
 =?utf-8?B?bDdBUVJJcDc2dGxxbWtxdVZPTTFsd1FtSzNMdmxXR0kzb1BLaE4xQk5RRFJZ?=
 =?utf-8?B?ejdNeDRwWjBDS253V0xVbmlyQWZqbGRPMUpldTJDZzhNd3JaZTRYSXFQMGJo?=
 =?utf-8?B?VU5TcXN2S3BLelkxQ3duMGFxMWlZbnJpSnF1NC9ncjNHVzA1ZmM4bWN2ZG1Q?=
 =?utf-8?B?bis5K0xHYzQza1JweHViY2hVNk5YdUNyNkpDWmhkM1Z4TEYrcThzdzRKRTRQ?=
 =?utf-8?B?VEV6ZXZhM1IvblE5T2lXWDY3NnRKZFBDN3o5cFppVlducmdHYndJODNRODJG?=
 =?utf-8?B?SVdmN0RNOGxaWTU0VGJVUUYvcFZzSC8xcnJJQ3dXL29JNm9WbitPUlJuMnkr?=
 =?utf-8?B?R2xVNjFFV1RzQUJVQWxVYUFQalZ2OHVCZmFFR1FnazdOaGsvdzFBTTUvVXRt?=
 =?utf-8?B?bStBdk9veitPNEd3bHRDeXplUHViQTgrMG9lYTU2TGUvaksvY2ZGeDFTcHNt?=
 =?utf-8?B?Z2tZRjUxTTUrM0VHV1BtcEI4ZDgvSThYRVhITVhITWFWazJSaDFhbG02dmpw?=
 =?utf-8?B?MlB1RlBTb1lza0FnaEpvY0JWQ2xCejRXbC9FWCt4OGxwaUk0QXlJNkV2QTdx?=
 =?utf-8?B?cDkzMjhTSmtIbmN1VWgwbFh0VEZZMWNWcitneVFONzNWZ1EyRUVQdzY4R0lL?=
 =?utf-8?Q?T0rrV5xl7gaphCmd5mU4ksqNYOzIEIINq57RYJc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3hlRWpxdGZYaTREQmNuRWxBRlRaczZtNGNmS3lFY09FNUVGWExZRTc5L3N3?=
 =?utf-8?B?anFIWFBvZUVRdVFnTHNYNUNnTVRXQUVPbDF4bzdWcjRrUTVZWDdxVmlmWkhT?=
 =?utf-8?B?bEwwb1lkdnd5MEgrMHhOWGJ6U2srSXcrMnliZkNmWDR3WUdvUHZ5Z1hOQjdE?=
 =?utf-8?B?ZGRubVp0UDlBZ2NmQjl2QzR2eEg4cUVBNzBUdVRPRkpCWGl0cFJtRGhXUFBO?=
 =?utf-8?B?enJ3djJsM1VXRFdhQ1lWaTU0TFN1d3VnTEpyeTJURTZoQytyQU16dnRnc3Vl?=
 =?utf-8?B?b09OSUhDcmFwbVRwMmQrdlNmL0xNeGNvQzcxNU5qaEg5NU00SUFubzhJVUt3?=
 =?utf-8?B?eWdrZmN4blkwZVNOak9CSTFPQUhVcEpVWDlGTERXSXdORXlDNzB5YnQ3Z09m?=
 =?utf-8?B?UzVmNlNDcVZHemJrVkc0bXJRZTBjQ0NtTysrWlEzZmRYUmcraFVNTUl2L3or?=
 =?utf-8?B?Y3ZzVmJDSER4cFJUc294MVM2ZzBkQk82QkxWMzdsTEFtTjRsa21MR1RVZ1JH?=
 =?utf-8?B?dS9XVjI0UEkxRUxpTW9nQTBUdG91K1VURC9iczJpKys0OHlMSXp1VXNjZTVQ?=
 =?utf-8?B?UVl1VjYrMDIyNElOSEVWZUlxekFUNTRVUHlUbEVXbk9GQi9vMFp4azVzaFVh?=
 =?utf-8?B?T0JERjBxd045N05iSTc0NnY3QldTRjAya0xFVXVmTC9QUWdIcHRTR01lQVow?=
 =?utf-8?B?dkswaUpta1pWRHZFdzdiN1JzOHc0U2JiL1Zta0JpaUIzWUdHb3REVURUTUFB?=
 =?utf-8?B?RE42djhOa2xPVmttdDVkdTUzMWR2bmRlSjRkY3hDK2gzdmZpZkVYSy9UZitS?=
 =?utf-8?B?Tnhra1VqODlSWEk2L01LVXk5MEJzR0VaSWFBMldVUnhzQzlkMW5tQ1I4SEtu?=
 =?utf-8?B?R0hQN0h5WFdmdnhCRElzUitFZ0M4dkVvZ1BFd3pXc1F6YktsNzRPZjgwaThS?=
 =?utf-8?B?ckNxQW1WT3VGNXkzamNiMWdkdUxRZE1zVG5EMGI5SDBLUkJaaWx5eVBVQ1N3?=
 =?utf-8?B?dzNHU0ZFRGs1ckFXRTVRUGtLVnQ5aEMyc0dJSHU2WDVNSENLem4zVFJkR2N2?=
 =?utf-8?B?Y0l0MmlxVHMrYlNBNnk1eEdJUUJwU2xscFA2UE5ib05lQjRIU2VQMGIyWHgw?=
 =?utf-8?B?dlpoaUNsQmVObUZaVTBrVDFSMGM4QVdBVG01dzlkc05wLzRGcWtoUGx5SUZj?=
 =?utf-8?B?NGpycTRXY2REeUtDeUk5UjFYWFA1REFhbkloLzdreW1DZDFKZGk5YlVKS2Fj?=
 =?utf-8?B?emdaV3JRNWdrQ1BsVUo0ZkdnR3lHKy8xWWk0N05HODhKc053S0svZlAyTFJB?=
 =?utf-8?B?cTJwR2ZqZ2JEZkhoUXZpWjlCUXAyOWFNa05vSHZNM25Sejd2K3ZWU3NKU0Jh?=
 =?utf-8?B?UG5xMmlkY05BVERXdEkxakQ5K3VKUXRScDBoTE5lQ2ZZZllUdlpGZ3dtTEF6?=
 =?utf-8?B?V1ZYSmNEcGRZRmVGVTRiNHN4c3dMK2JqS2N6UVl0aVNzK3IvQVF5bTRFTDh5?=
 =?utf-8?B?Ylk1cmRVN3pmTThjRG9ydEhjSG5JTjdqak1mdGJrc2RFNThvdThFRVg2OVhp?=
 =?utf-8?B?T0pnczBmTm1sRmpVRE96TWZtSThsbVZ4NG9lRTZmOWNjdXN6ZXlqUy9HM3JX?=
 =?utf-8?B?K3Zhb1V2SlBNTTRDbm9IdFRIL2NVLzFWVURlalBFbU1obVdoK0xQYUplNXRI?=
 =?utf-8?B?SWowTkFhNzgyNHIvazhhaVBSbmY4NlFpNjFOdjZFbkdTajh5TlZrajdoNmNE?=
 =?utf-8?B?eVFxZ2tobFordG1BK2JObFRuSTR2UzlrNEVrL2tIU1FNaFAvWkVXZkxLRzNo?=
 =?utf-8?B?RGJiVDhhd3p5V0cyWWxQak8zZVhyaExHaGlxRUN6bDRaM0hkNUR6SUd4V2Iz?=
 =?utf-8?B?TGl3bldVZEthRk9ObXFERVZoRUZUTU8xQ29pYWdGcTZ2RzRZSy9McHpYTmZo?=
 =?utf-8?B?d1Q1ZTNqRXFPRDNXeHJWWVhEWjM5eXpzYlNOanhEd0ZQRk55RW5lMkVUcXVo?=
 =?utf-8?B?KzFKMGdjcnY0a1NHNUJTbmc4dW5McXRUVXJzdXd5b3FnWHBMUEtRcUtsek92?=
 =?utf-8?B?MUZFUE1jQjJGbitHcEdQYlFXYkI4OXAwRVVKOUw2dFJEd2FqUldIVmtCVml2?=
 =?utf-8?B?MVVKb1hmYTByVU40NnI2aE1pM05FZGM1UHI4UTJGWGF6Ni9GYlV3aGlBNVFo?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3286cbb4-985b-4039-7e69-08dd0a617235
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 19:19:40.4156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9rBWFt/yabFaCMwfpmcvukAH0evYI42htuYNkr/dPWq9AEJvrN/EEnYqRWq4TKdG5Mipk7NxZdKDrEG9olejw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4863
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 18-11-2024 01:48 pm, Pranay Samala wrote:
> Intel display version 20 onwards, Tile4 no longer can be used with
> horizontal flip.
>
> Bspec: 69853
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel/kms_big_fb.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 7da3d12d4..ab44a9a42 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -965,6 +965,19 @@ static const struct {
>   	{ 0, "" },
>   	{ IGT_REFLECT_X, "-hflip" },
>   };
> +
> +static bool test_requirements(data_t *data, int l)
> +{
> +	/* Intel display version 20 onwards cannot do reflect-x with tile4 */
> +	if (!(!is_intel_device(data->drm_fd) ||
> +	      intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 20 ||
> +	      !(fliptab[l].flip == IGT_REFLECT_X &&
> +	      data->modifier == I915_FORMAT_MOD_4_TILED)))
> +		return false;
> +
> +	return true;
> +}
> +
>   igt_main
>   {
>   	igt_fixture {
> @@ -1123,6 +1136,8 @@ igt_main
>   					igt_describe("test async flip on maximum hardware supported stride length for given bpp and modifiers.");
>   					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s-async-flip", modifiers[i].name,
>   						formats[j].bpp, rotations[k].angle, fliptab[l].flipname) {
> +							igt_require_f(test_requirements(&data, l),
> +								      "Can't use reflect-x with Tile4 on intel display version 20+\n");
>   							igt_require(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP));
>   							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
>   							test_scanout(&data);
