Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E65C3DA7F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 19:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C8010E528;
	Thu, 15 Aug 2024 19:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnBe6Xzv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BE110E528
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 19:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723749923; x=1755285923;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=qvU+EJQSH90HKV8gUKg0g46xTJG9Nb7BF5AMbTfoGGs=;
 b=PnBe6XzvHlbyoQz1k21vfPMzjcUxy4VsEFr2YT98zr5vPhh5So6vCF6q
 qxSpjbfW3MJgR6ou1gMJTl8xjsZb9WNWNpblseBw4dc+N1v/66qxd7uNt
 PEbC4ui9CxozfWH5OkvP47ir7vC+5x/rIbLc2jD3jvNw5RyLVjFq0FmCr
 cFu61rXRdj+SDxRzZqC/+IRnO3uOlxoDpJHocRPD3MQhvzn1xgCYyp2kl
 xDuJ6b0Yz1qcyWvYQDB2Q1iQ06WQYyv5pJDkk4Jr6r5DWMKUOujPbrPLw
 T0xQVxpi9trtr4N2C4/Hiv+toCVr0kLcp+c9Pf0s82gW8XYzmL1XIaN1J Q==;
X-CSE-ConnectionGUID: EV3LLcL1TbmMss7Chb6+Tg==
X-CSE-MsgGUID: yU1Hi+sAQuKNADgTdYNthw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22200799"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208,217";a="22200799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 12:25:23 -0700
X-CSE-ConnectionGUID: rNsF0BsIROeNiLq+P7uRdA==
X-CSE-MsgGUID: Nsjda7ZOQ76Y6hqtt2y0ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208,217";a="59127185"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 12:25:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 12:25:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 12:25:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 12:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJHfZLX+RBpMVw5aMJAuQ+hRePab1gkYMGu0JoG0O6edq/W2pPTzJsF4IvNWE+OsEWJ6GE82zxN4tKKwyp4m611/na8vXwXabL1IVBBA4Rjjy6Y/tCqqnCesnjfMu6mt4pxYfc+yXQD4dYjnOmrXLP4hSayn73tMyLvQsD88yD29GpuYNXrdSmsU/dKjUjLjURbgDB/8VTic1M/wHzZwAuGFFrWPv+mgSDwAhCulpcyoEJ6NfP5lTa10lwlqVWu4RGbZRaZhvtdOfOl2Fks996LvVQ7kSOd8n1mkAGWp3gQTljIIPNiTQasVLCKogms2yOU3MSnCDlaNbTM928hJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h23NoXILUx+H3grkHMbSm5ioxDseU/w52PU7lNK1jSE=;
 b=p/qryrTAl23fOPE3X4cJW0Lpwyadu2xa+ZZQLId33yYhA5avludxOPnzLS0G9Nl1QWMaXrl0/6J8Qi8M1hZ9desXg7OfUfEQJZMgSFL35HFzC3YOkqQlWcTseYWeO0TkjNLzWqEt5S/5aUgi2ZFqDy/vWbhrceSCtFHoQ2AMsYMi+kKTPlYE2olk/7PZiqO9mnNHtGe9IXTggHdEdE+5BsSITaEre4pTXLIT8QbUuPBjHxTZAhik3SjzbZQajHXrnCSNWRlShgqIk8sk/CkL7XLjvWAaPgHEeQwyCnxiOIk0rcYmLYkdrmJBnieE3saNbvr8xkFHXyYU0s9MBamTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SJ2PR11MB8299.namprd11.prod.outlook.com (2603:10b6:a03:53f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 19:25:18 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%6]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 19:25:18 +0000
Content-Type: multipart/alternative;
 boundary="------------rkXKb2cwAcZs8g0VRVjZ01pB"
Message-ID: <5a0d233a-bbec-495c-af5e-18a04bc0a282@intel.com>
Date: Thu, 15 Aug 2024 12:25:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/dpcd_reg: Advertise the dump command in usage
 text
To: Gustavo Sousa <gustavo.sousa@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240815191626.49244-1-gustavo.sousa@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240815191626.49244-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SJ2PR11MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c4882f-586d-452e-04ca-08dcbd5fff95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SC9VQWlLcmk3Sk1jNGhyU21MblE4NEtwbGVkV1VPV3dsMEZJWTVWbnJzY293?=
 =?utf-8?B?T3p2cHJablVhNCtqWCt1K0FWZ0tUUnE2NndZSkE0Q04yOXo0VTUrUUtFb3hF?=
 =?utf-8?B?UnZJb2hnRzJyUTRtTkx4RnM1SmVyeHBUOVFZc3dIdlpMZmRpUndmZ3IwaE9o?=
 =?utf-8?B?NEVUNTltOEhwVzMxQjlhRS9ZdEcxOXFEZDdzQzFCYXJHRVIxY2xWZWt3WU1U?=
 =?utf-8?B?UXQ3TTk4MEpIQjEyUFpHQktycC82MkVUNGZsMjBHOUhsNEg1NGsrZmJVTEZG?=
 =?utf-8?B?Y1FwdVNvSWNvZHU5VGRyTDQwQUZhdDhuU0xTNFZaYjZHWDcyc1RTbTJTU2tn?=
 =?utf-8?B?bmZjWkllQVpuUlVmcGNYdGtEa2hueVZxVjNQcldqQ1lvQUMyTU5MWXV1RFpz?=
 =?utf-8?B?UWN1WjhFR3h1NS9oeDFxR1VsdzFDNFRqWnFSNzAwU0RneGRGWTRBZUdmM2l6?=
 =?utf-8?B?allGTXJ4SDBDbXgvaE1odjRMQWZ1cG1IbE5aZDR4SUpDeXA1eWxHMVlvT2s2?=
 =?utf-8?B?cWxrVjMzWGJ4YktZMGU1anFvR3QrV2Zra1YrNTFWQlFNZ1BlNUlLMi8wWWl5?=
 =?utf-8?B?MU12ZGtCcllwanlBNzlFZVhlcTBBL05FbCtNMXZYL1AwTHlQUTBxeVdqK3Zm?=
 =?utf-8?B?TG13L09NTmNlVW1yc2FVMGt2NkRyL2dreTR2S09sYTdXZEsvZStZSWg4Ry8y?=
 =?utf-8?B?Tm5XcDdjOXRRTy9vM2dBaHRCUVFiS0xoM2hKd21pV2RYUisxV2cwSXhuSGEv?=
 =?utf-8?B?bFR2QWhwbFVOaDROUHlQSUdiRG5leTF6a2NobXhBOFNuUTVVbmJadHZodTc0?=
 =?utf-8?B?QWNETkdxdU1ZdVBZSGZmdU9pMGZiYmdTeG4vVlhxL0FLcXBHaW14V2FnbFJR?=
 =?utf-8?B?bVlYdU1Va3VRb0dMeWZ1enpkQmFYN1BqYUc4Uko1MHVrTHp1b2E5WVowMFFh?=
 =?utf-8?B?V3VHSVU0ZVZmQzhCcU1PWTMxQWFqbHVVdTZyZGY4WHZuQUFKWGpLY2lsekdy?=
 =?utf-8?B?NHpMcGIxLzVJNUtGNk1jNUR2Q3pCQ1F1WnFkTjdSRzdkR0tGaHJPS3l6Vzk5?=
 =?utf-8?B?ODZrNHhJajBpbEh6MVh2VWczWENVc1R1UHY2bU1admlOcm43ZEZ3eXJUWUVi?=
 =?utf-8?B?WVk1MDBEa0Rkc0w1SEd5T20vMXBrcVlJTHNmSVFJQWRsV2xLaCtWWWxtcU9V?=
 =?utf-8?B?SHJhL1BHdGdZcUZ6blhiUEIrN0hHYk9HTHI3TnlXd0VXVXp0WkpSKzJtd21a?=
 =?utf-8?B?K0dlZnQvbnpOYjlQcERLMks2SXZBcHE5SjVpMmIxMXA5bm5acDMyVCs0a2Yv?=
 =?utf-8?B?bjFrN2t6bG55UVlsZDdlcUdobmFpcXp1eVRyaDVBc2pKZ0ZrcXhwclR6eUVw?=
 =?utf-8?B?ajNIVytXMjVQenJIZ2pKWXpYaUZGMDI5VkUwS2FiYllJUE5VdVZOUXRoaE1W?=
 =?utf-8?B?U2tXNERXUlByVEFnd2hzNVNLVG5aZE8xNUlnUS9qaitLTjJmQ1VRMEVneGhv?=
 =?utf-8?B?cFhIQnZRL0l3VkNyZlcyemxxdDM5NjhraWF3NkorNTl1Q3NseHF6VU13SjZ3?=
 =?utf-8?B?NWVUNS90cG9ydUJORDJXbldKNzVXZXpoZ1hmS3k0Y2xOM0pTRFpkaWFRM2Zx?=
 =?utf-8?B?TTN6Wmd5ek9VVy80OHN1cU1UeWpxVDUzZWdGdHp0dmovc09RZGJKQkhHWk84?=
 =?utf-8?B?TlFlUHl1YjlBdFlmWTJqYUNWV01xcU9WdDB6YkhPOENXUE9jejc4VVdNTUZi?=
 =?utf-8?B?THZ5VlBEL0F4WktDcjhTYTB0TG4vRWV6WDdJZDl6Z0t3aGpVWDZvY3ZXZWV0?=
 =?utf-8?B?OVRlSDUwUGJlL1E3eUhVQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUFxbDNaMHVYc1Y2MTlzK1pyOUd4Yk56WWU4OGxTODRiNENDVGxKcEtKUlc0?=
 =?utf-8?B?dlNJK3dPVW5LeE5xcVQ0OWZ5Nkl2RmFMSWI4bHBFUnlhWDFhRVFjem05bVAz?=
 =?utf-8?B?ZTBFdXhsME5kSGtOVWVwTU9CSms2TVdCV3kzTmRveTh0bVZoQm82MkZHbWwy?=
 =?utf-8?B?bkxFN0lhejQrMUxtbnN3UkNTbm4wcjBoMC9RSHNkbXdCdmRWTUFJWFNZVXBm?=
 =?utf-8?B?dXRXeEg1OFFqS3BYejZ2b05YQmJGdUNZTzM2VmxRTWJ1alg1MEk5K2hUeFVt?=
 =?utf-8?B?U0l4Mzhyd09YSG9UbnF1NzBUbWZuS0YrcXJHRVY3dnVZaGR0ZHZybWNUUENr?=
 =?utf-8?B?UFpiV1RTRmFuWTNXdGFJMi9HUXlaWjdMaGNhTGpsV2pSd1V6a1NGWTdpKytq?=
 =?utf-8?B?VXlnNDVzNHhHWktQT1B0cEtQRGdXeVNGZ3NvaXBpMjNlNnRpUDJnWHVsQjhq?=
 =?utf-8?B?ZmF2bi9nQngyUklrQ05OVG9iVU9tTE1Lb01YWnFJWmFtdUFQNUtCTEM4UWRW?=
 =?utf-8?B?RWRldFMxS1ZzZ0ZxVkZZd1pLS2xRNWU3ald0UmZ0MjR0NHJWRWRMVUVqQlU3?=
 =?utf-8?B?VjAvbVk5MFJrN2ZkdzhyZkVpZ3RSbXd0NnRQVlg1THNYU0dkaitmYWlhdXRB?=
 =?utf-8?B?bGhYQXRLTXYrVHI0NHhMdit1a3h4QUVvWlFSMklFWFQxd0lOM29ud0htcEwz?=
 =?utf-8?B?aDRjNlVJTmpueUhYdktoUXl5QmZxYWtsMlJ3Q3NoN09sWC94dTJZQ3NadHJx?=
 =?utf-8?B?WVp0bmxGZVVFOGtybmVNNXpPbGJFMjB0NG1CeHA0bjUwSkc5U1V1aFF3WXlM?=
 =?utf-8?B?T0FNR0hRYngrNWVmRnNxK1NLdnpxRld2Q3BNZnZvQmZ0TzVCeHUvcTdPOHBD?=
 =?utf-8?B?S3pCMDlSNVJFL3hHNEJ5cHpkS0d3ZGxrYXA3VnkxNSt1akxCdFhrcTZGbExp?=
 =?utf-8?B?S09vZUZ5RXNhRHVzbFFoQ0tIRVlsMDhPeldiVmFOYlJMR1ZYajlHUUxENUho?=
 =?utf-8?B?K2NiUnRLTWh4U284WU1vSnBaYytQSHBjMDNoYUJRemZ0SU9QVjhBVytiUlg5?=
 =?utf-8?B?Qlk2eHQwaXlMTmQ2L2xZMlpabU1ZcCtxUUNFTVZNYUNDR0p5R1FOOE5sY2tS?=
 =?utf-8?B?eDRhOWI3U2JSUTVId29nNFFQK09WTmxzVDlLcE9aVzBjODhkZUFpdzJUZ29i?=
 =?utf-8?B?R1FuMWlHcFE5RlU3VFFiV1JLS29TdG9VUFp5Vnlka2V6bkJGd0pXK1Y1a0g4?=
 =?utf-8?B?RUZOMHAzeEFQbnVkL0hTaGRQM1BIeHdzVnIxbWNHaTNUN0tYR3Rmc2Jma1RI?=
 =?utf-8?B?WFJ1c1d6TVJPNGJ0K2cxdGJGK2tlSk93bDZPRWNIVDJBL3R4Qy9STFo4cHhm?=
 =?utf-8?B?blFUZW80NVNWeHFzSUsvMHdQRWQ0MGhmbWtVL081OEN4RFdyeG1XS3ozcHk5?=
 =?utf-8?B?cGFRWDlvSDBOeFY1SnltMUpmdnhib1V1Q3ZSRm5vQi9IUDNrZVJDTzQ1Q2Ra?=
 =?utf-8?B?cGFES20rRXNPemZRbWFaNDhIT1k0MGMranoySTB4QlRiNldodzJUaHc4eW9h?=
 =?utf-8?B?MUJsVkhabUp6elFIODdmRHQ3QU9vY0ppNTM0UldJTW1FdnhNNEIxMjFqbVdT?=
 =?utf-8?B?TTBmVnU2eFIrcEs1ZEQrM2V1VHYrc3IxQ0RRODFaUEhxM1A3ck96dzJpaWhp?=
 =?utf-8?B?bjlteS80S0duK2JGWnB5cktQcGRLQktPMVVzcU1CdUlmL0ZZeWVUMFh3QjhG?=
 =?utf-8?B?ZmY5QThwdyttaGpReXp1dnNIbG9kSnVBTXgwWHFKUEZnbVlwbnZnT3RaUXJq?=
 =?utf-8?B?WmhYcjNMcTRQalNDd2p4MzVvNEJGaUs2VGRSVXB6REppTFF1MEVhTjVQakwx?=
 =?utf-8?B?S0Zkd3V0YzB4NmxZc0VpRFllM3ZXU3NiYTBqbzRtd1BIeGxkRW1XV1l6YkNv?=
 =?utf-8?B?YWI3TmkrVFdoZVZwMDVXL2d1bTZ6dGNVaWlKYXZ1VG1pOG5STUVGT3J3SG5m?=
 =?utf-8?B?UjhCR25CRGp2bTU5K2I2SzkxQkZUcS93cTJIV0pzMzVlK20wRG5FcjZLV295?=
 =?utf-8?B?RVh3akFaV3Zsc3QwQWgxeUtNSVNSOGVQWGRoYU9pVDliZTU1WXNuNTNWS0Qz?=
 =?utf-8?B?aGhta1BCSTRmVXFoWlJ3YmhhNVR4SG9ZRHQxYmRraVBncUoyeHZLTGpDNUVt?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c4882f-586d-452e-04ca-08dcbd5fff95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 19:25:18.8393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNmQ6JsuI+z+4faBWZSZbHoZlnMBsOaAjksXtVJgr2Q+59xiMee2/wcwaddCBjPKfyeXRQOnGQmqodecevlVIFfypN2SYkgB+WPf+67xTho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8299
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

--------------rkXKb2cwAcZs8g0VRVjZ01pB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/15/2024 12:16 PM, Gustavo Sousa wrote:
> When no command is passed, the default operation for dpcd_reg is to dump
> DPCD data. However, passing "dump" explicitly is also supported.
>
> Improve the help message to let the user know about the "dump" command
> and that it is the default operation.
>
> Signed-off-by: Gustavo Sousa<gustavo.sousa@intel.com>
> ---
>   tools/dpcd_reg.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tools/dpcd_reg.c b/tools/dpcd_reg.c
> index 2761168d0030..7d497e36a46b 100644
> --- a/tools/dpcd_reg.c
> +++ b/tools/dpcd_reg.c
> @@ -89,6 +89,7 @@ static void print_usage(void)
>   {
>   	printf("Usage: dpcd_reg [OPTION ...] COMMAND\n\n");
>   	printf("COMMAND is one of:\n");
> +	printf("  dump:		Dump dpcd data (default command)\n");
>   	printf(" read: Read [count] bytes dpcd reg at an offset\n");
>   	printf("  write:	Write a dpcd reg at an offset\n\n");
>   	printf("Options for the above COMMANDS are\n");
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
--------------rkXKb2cwAcZs8g0VRVjZ01pB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/15/2024 12:16 PM, Gustavo Sousa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240815191626.49244-1-gustavo.sousa@intel.com">
      <pre class="moz-quote-pre" wrap="">When no command is passed, the default operation for dpcd_reg is to dump
DPCD data. However, passing &quot;dump&quot; explicitly is also supported.

Improve the help message to let the user know about the &quot;dump&quot; command
and that it is the default operation.

Signed-off-by: Gustavo Sousa <a class="moz-txt-link-rfc2396E" href="mailto:gustavo.sousa@intel.com">&lt;gustavo.sousa@intel.com&gt;</a>
---
 tools/dpcd_reg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/dpcd_reg.c b/tools/dpcd_reg.c
index 2761168d0030..7d497e36a46b 100644
--- a/tools/dpcd_reg.c
+++ b/tools/dpcd_reg.c
@@ -89,6 +89,7 @@ static void print_usage(void)
 {
 	printf(&quot;Usage: dpcd_reg [OPTION ...] COMMAND\n\n&quot;);
 	printf(&quot;COMMAND is one of:\n&quot;);
+	printf(&quot;  dump:		Dump dpcd data (default command)\n&quot;);
 	printf(<a class="moz-txt-link-rfc2396E" href="read:Read[count]bytesdpcdregatanoffset\n">&quot;  read:		Read [count] bytes dpcd reg at an offset\n&quot;</a>);
 	printf(&quot;  write:	Write a dpcd reg at an offset\n\n&quot;);
 	printf(&quot;Options for the above COMMANDS are\n&quot;);</pre>
    </blockquote>
    <span style="white-space: pre-wrap">Reviewed-by: Jagmeet Randhawa <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a>
</span>
  </body>
</html>

--------------rkXKb2cwAcZs8g0VRVjZ01pB--
