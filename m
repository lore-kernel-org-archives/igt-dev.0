Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E0AC3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 05:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1D210E943;
	Thu, 11 Jul 2024 05:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aE4/GiXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163F10E943
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 05:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720676895; x=1752212895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lOVriIZ3R32f9BEjH0otSs2GeRd52T2r0v3NDSnkNFw=;
 b=aE4/GiXZmgJcW/A2XP7Er+m5Tsf2GA7w94lcBgkgp+J+AaG/Pk2Akv1q
 VYdOH+B7NLc6x2dBqD61d9r9/PO3BNwe3FmpLlo76THY1f90MjONFSo12
 YqtemKjdGbVCcLrt0Fnvc+kHBlYPiqa9PnUyULQDsXjHCmL6XDokdCaeE
 AadxAluwZLJQTJh4Ub/aj445Xp/fvKpQOnYQl4NW9ISkeWiuq1ee/FlLe
 WaxW5vF0IEzIp5ywwlAeGSAszqUw81YetL8dIuGn3LNGtb93LZTpa3WQh
 Q40unmFIOqbtFmPUpfKt9KZpuR08+i1plDh3WIveynqZ92ySSF5m5Siog A==;
X-CSE-ConnectionGUID: chi6T0UWTs+iqGKQION9PQ==
X-CSE-MsgGUID: 8ECR2/P4Q2+QaFEiev3+nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18176391"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="18176391"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 22:48:14 -0700
X-CSE-ConnectionGUID: 5rZPrIa3SCuIkcbzY3AFAQ==
X-CSE-MsgGUID: CjOfz+vmSfOuU+b1KGWSfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="79581833"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 22:48:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 22:48:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 22:48:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 22:48:13 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 22:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXlDAZL98SifpvUurSez+HFIbyYtVe/wYnF/dXjYn/B/spzlk85PcWBSv32kkh2nn9GsLuIovEaeTb45yj78jQ5KsvyKvKVLorhgz6MojxEhPs8zTE3zeisFxi1d8egljgBHMD+ggVvCpwDJZqiniueQIczgnkvJsnMNHO9zYInNM0RTJjlz+rv+kbY9LhUwRzcwFvMoPWe/s4FcKkOuSo8ZQ3NPhPYoGjUMaSfHWGPsxxAvXsAgjAXBG5jdmDAxWQsgmMHUuxqsCSP5TyIGjMVgdwtHXUSYAgMuRuSbMqZzdEey52EYkK1Kz0F92O51QNXYpBTzzuxkDmMCft04uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ckw5iB7w5NU7aq9z51OLI3vvnONXskm7DEk8yJHHd6Y=;
 b=oTPbhTo6Rhp2voG8fG2dMnpJv72JyNJlmCj0fDVWuM38TG6v/cw6UUj24Eplh8SiXn6UdyzoFnFJzBc1wFxXirmLuhm2gg1ISoUO+QGzLU9x6ZqVu2BOR4ry3kjVZJEkV5H/GWDdnfZhO8Q/+bqeFDFp1U/y9Bm/kKbYEN0/0ZMt4BdloLeoefI3qS3WIaIF3etmG7DsR7NGAwyyxOTUcWEn3tzHdwMaS11iqAywuY8JrbQp5/B2lqBsL+YnskYWt/dpjkGfALCnFVNvL8B3kF/ci5FGtL/vF7HoOQnxxBgPhXBjHZni3UYJUBSjCXw40+PGYfMl1KwTEd+OOYRp0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5726.namprd11.prod.outlook.com (2603:10b6:408:164::23)
 by IA0PR11MB7882.namprd11.prod.outlook.com (2603:10b6:208:40f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.40; Thu, 11 Jul
 2024 05:48:06 +0000
Received: from BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::e484:b723:d325:e5e0]) by BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::e484:b723:d325:e5e0%5]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 05:48:06 +0000
Message-ID: <585347be-9483-4c49-97d6-bef9d4bdb7f8@intel.com>
Date: Thu, 11 Jul 2024 11:17:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/3] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20240711041355.749937-1-pranay.samala@intel.com>
 <20240711041355.749937-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240711041355.749937-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To BN0PR11MB5726.namprd11.prod.outlook.com
 (2603:10b6:408:164::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5726:EE_|IA0PR11MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 258a4475-5fe8-400b-4a13-08dca16d0922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUh2eUFaUWU4OUtiaWF3eGpWV1FQTE5sN1NhK2ZGRzVnSXNtNDhMUmMzSTJu?=
 =?utf-8?B?Wm1BK1o2TkhtemhQenBHcVYwMDdoSTFxYVk5bVdoT0JtUGtKOWx1Mlh1MTJZ?=
 =?utf-8?B?OFVwa3hoejlBai9VdjY4UFphdjlhM0R2eUdVR05BWVovZ3kvQTcydGxDM2tS?=
 =?utf-8?B?VEl0T0F2S3oxcFU4NXFvRTlrZ0dTVGNxS1ZaR3VrVElsVUJZMFB1bnVsNDY5?=
 =?utf-8?B?c0JOSitNNEQvc2RRdU54RUpseUxCVWxMb1ZCZk01dU5DWlhaUVgwbFJaeU5R?=
 =?utf-8?B?dkszMHo1aXdGb2dGMHlrdW11ZkVVZ1lTY3Q0MW45bWIxNnBKUnJPUmNuWDBh?=
 =?utf-8?B?eUhReFA5U0Zhb2IrVE5lL05IRFEvWkpBNDEwL1k2WGxwTy9hV2ZNZ1VzaTRa?=
 =?utf-8?B?K0QwUXRsSXNPK0hwY1pUdlhwKzE3cFhkRTVuT2ZGUHpUcEVwckIwTm54bjFV?=
 =?utf-8?B?WjMyUzJha0ZrRWdiTzdZMkE2WW9tc3hWeThQdWx4aWxiRVl0TDhUUElNV21Y?=
 =?utf-8?B?dUU2VVU0Wmd2cHZlM1NjV3hlUmVFOGRQU2o3b24rdStTMEJZWWw1dlFzNWJI?=
 =?utf-8?B?KzMrb3pQSTNZbnFIM0FYM3JOWnhFTUVQbHRTenRwaEZRa2x0TVBDWG9iUzdM?=
 =?utf-8?B?TkxtZzljeHdYN29UZDVoNlp1NG5NaWNacTM1Mjd1dnE1bFdkVGs0ak9FMFBt?=
 =?utf-8?B?QUljUjFNSDBwTVd5UW9Iejd4Wk1zOUYyQ2VzUmN3RktuN2VjME54UUF4YzNH?=
 =?utf-8?B?blJrVzREZUZUZkNHRmtxeTdLelo0ZUhQU0pKK1BxWlp0M1pESUxrOHhhOEg2?=
 =?utf-8?B?U1pLUFRQS0JCTGtoMG1xTGp1dVdETVRuZUZTWHVJOWJKZHVDd0NYYWxsWkwz?=
 =?utf-8?B?ZmlZNHN3dzFKbDA5WVV1SExGdnlnUFkwajl0Y1YxYzF1bFpmeVBTZVVLaXIz?=
 =?utf-8?B?Zi9vTjViTTFjT3JvK0RHU3JnaVB6SFJoZlpFWFMwY0dCNmxvampQdC9Ga3RP?=
 =?utf-8?B?b1g3RDRoWi83M3dQVFhhOEZkRDNwYlI4Y0NmRHpPNFptMW9pNk01bFpLa0ta?=
 =?utf-8?B?cFNSTFJyTlh1eVVIUlBIWm1rVno5eEtqc1VMejdNa2dGY003cUpHeVhpNkp6?=
 =?utf-8?B?eXJ1N0dBeGhIbUlHWU0xYTMwSWRLZDdwV3ZGblA3ZmJPNVRVaTd5VWFwQmd1?=
 =?utf-8?B?WCtDVUNWRFpSelhmS0ZPMjduTVU3c3YrdGl3Nkd4RTgwTllHZDhjVXVFZGZY?=
 =?utf-8?B?MlZtU0duMGZBM05uNVBaL3U4emFCVW5wei9EZ2g2WE1PM1I1dm5OMDhNWmVE?=
 =?utf-8?B?NGV3YlMwYjFFTEZQdHFqUURmQWxCWHVMcFBMc25RNDVpRlVDYW1ScWlJTkdx?=
 =?utf-8?B?N0lObm1YOUIzNUhpZHE0N2w4TC9FSGpnNG9EVUdmaExuUHU2LzBaUmI4T3d3?=
 =?utf-8?B?YURrbUNYRjNCVHFxVVdhNzF0R0lZQnM5dG9JRk1wSlhzVHNLQnRJRXo4aUhU?=
 =?utf-8?B?UzkzWFlpL3JOS0tweEMyd0gyWm1SL0dNWGwxcWxYaDU1dXYwVkdFV3pBTmFY?=
 =?utf-8?B?NUVOUUt3aktHci9McW54bkpWUGdpYS9MZUFUNWhtSFJ1Z2EvYVpISnVtVkNK?=
 =?utf-8?B?bWM3QzRqOTAvRi9hdHB4WDJybTRmVFdUdThqVEZHWGc5MDRyTkxKQWREZXVI?=
 =?utf-8?B?dWp3NXdWeW8vTEtnSERRV1JYaEdhWDVMWDR5L3ZHdkh0V05NbVMvSmhkeTVz?=
 =?utf-8?B?V1V5NTNjYVFOcmJmVmpmampIY256cXZNbENxNUhWVFAvaHAxOFNBdk9Majda?=
 =?utf-8?B?UW9qNlBhc0QrQlhoV1hXdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5726.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZwczllOC9WRE5qb09COVNabkVZN3NUQUlUWjlueDM3RUlmV1J0L0ZiQ0NQ?=
 =?utf-8?B?Yy9UVWhaOEYraDVDQ1g3U3ZiVFVteVdnckVhZStpOGtuTkwxK2RsaE43ZDhl?=
 =?utf-8?B?eGluYkJadTdTMEZTRWtxcWY3Y1JIbDg0WGF3UEtOT0tXQVhuTmIzU1pPS2Iy?=
 =?utf-8?B?YzhTM2JvVUVpQjQ4UFdVSjNJOUVKNjE0MVFXaVRDZzFvb0Qzd2JiMDlMbEJy?=
 =?utf-8?B?RE5IWnI4aVRwVSs4bzlicld4RldxYUdiUUdRaUYwcWM2dTJuVTlmZ3BFMjly?=
 =?utf-8?B?ZUl1YktWYUJvMGJLSy9YQ1pYMXE1NS9iaG5IV0IyL3E2SHJVem1qR05yWVI0?=
 =?utf-8?B?a29ZTkk3SDZpa2NUN2RWTVY1Q0RYRFBGaUIxUW5DU2o4S3ZpcXh3b3BRcVBx?=
 =?utf-8?B?Q2xyZmcvN0I4eS82ZzhRbVZaVy9hQytPOTAyQjBzY3laRVdWRnhJeGJncmNz?=
 =?utf-8?B?ajF5Sks4N3U0R205bmRCZFJJQkQrZUJqYjBrdWl1bzFZZ3ZLNThxQ0hKSnM5?=
 =?utf-8?B?cnNRTmdQQmdTYUF1c25kYlVhT1ZZNnFmczUrQWhCVzVIV3FwSWYyUW54ZFZz?=
 =?utf-8?B?cmRTUkRBVjBoRHVnS2NqN055dnFQZ09idWtsb0tVQUUyRlNRYVkvZCtkbENt?=
 =?utf-8?B?UjNpaUYrUGs4V3R3ZDdXb0dic0pXeHk0RytMdVV0MHFTbVFTeHJzYndkWWtC?=
 =?utf-8?B?WFQ2cXBuSXkyOFh6YTlyWk5Sb1JQMmtuOVdoenFBMW5UTDlKdjVBNjdMZ0tw?=
 =?utf-8?B?bFRDdFptdHJKZjhGR1lwL21lMEloQXlSc3hWdVBESlR1Qmh0Y2pFZmNHb0gr?=
 =?utf-8?B?ZzVrTkNweXFJczROQTNNVXZnZTFudURQUTMzVjVtVFhJeDFWdVpUR1JXNjBl?=
 =?utf-8?B?TzA3MTIyb2N4bGdueWs1dXhTM2pvYVBCLzd6ckNGYnN1ZzJJcW5sZGtvVFhq?=
 =?utf-8?B?d0xxSnFQeUFRRk9MbnNjcmpBZWJGWS9vekRCVU1ST2RVMmR3S20wSUFLTUdB?=
 =?utf-8?B?dGFYcExKcnE0NlhRZmZaNXMxQUtvUEh3L0prcmRFcEE0V2M5dC8rREwzR1M2?=
 =?utf-8?B?RW1TZjZmbnJHZWlRTGJBS3hTTVEvUzVIcEJKdC9qS2hYVVN2dG9xL0FFVi9F?=
 =?utf-8?B?VVBzYkRmWUcvdEJxeHdLNElMWlBWeVpKdUZEOHpGTEQ3UDJzeDR4NUR3V0pQ?=
 =?utf-8?B?WElVSUdKb2RUd2ZPM0Y5ZVNYNUlzRUI0MzB0bVk4WlI1ZXpCTURhRlR5RG9P?=
 =?utf-8?B?T3dMZnlxOGNBMUE2WDZiK3Z2aHg2elhjQ3R6d1puTUlPMjRBWVBGbFAxeUFI?=
 =?utf-8?B?b1BESnNVTEhFTXBzN3g5c0o4Mmlwbk9kT2t0ci9SVW9LVHgrbEhzZmZqQU51?=
 =?utf-8?B?N2VuaXRLVFh5eUxobnZ1ZU1WKzhEc1BjZ0s2UUFsWXlQVWV5U0ptdjhSbmNa?=
 =?utf-8?B?TDY2blBEK2tPVjVwbW5YcDhrVGpBb3I5c3lYSitXUFAycWtBYzZCYnd4cWhQ?=
 =?utf-8?B?NUpCUEhkSUF1OG5KcExFcDB3bGh6V2RGVG1ydW1vRTlUQ2hoM3ZOa3A4Snly?=
 =?utf-8?B?dkkyMGp5aktaMkRFeWM2Y1g0OW5yRzMvTHZjZkdoZS91Q2hqQXlFeGJHRzhV?=
 =?utf-8?B?Wk9DQUxESjF4ZGVtTEYxc2VEYng3a1NvSWxnMmNramxlRzVPY3F2d2o0NjZv?=
 =?utf-8?B?SzNkaDFFVjEydnZzREg5dnd3SFdMQ0tRT1RROVhEaGpVUTA1RFF0MDRIbzZt?=
 =?utf-8?B?WXIrVmtVaE11Y1M2V0lUMFVBK2YwSGJnQnlrUy8zN2g4Z3BQc0NaeG9ZcHhU?=
 =?utf-8?B?cGZXU0Y2U2NCT2k2QXF5Um1VNWRndllQK2hlTHZpbHd5aHQxblEwV0tleU5V?=
 =?utf-8?B?VGVyR2NOOXI5eStFN2k4R1ZBVkRER3NlTTBEUWNFU2pqbWdSd0FQQUtRS2RP?=
 =?utf-8?B?aGN4TkN3c2ZZa3FzcWZNNFdrNk82WndzK29qZE1XL2ZkbEtYQnM1VmdsUnh0?=
 =?utf-8?B?cDhMb0phMGlEdlhROVVVZkVtQzh1R3d2R0hEV1V4c2UvSlFFVjlmazc1aDNz?=
 =?utf-8?B?REZhVy9VbWx2V1FWTHk0WjE1aHZWU3lKQStVeGhMODIycVBPRmhlbklnRTJS?=
 =?utf-8?B?L3RENEdDSDlNcFdMN3lPUjd6L1FIV3BkSUEwaVhIdU0xdzBtK1A1eXp6R01t?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 258a4475-5fe8-400b-4a13-08dca16d0922
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5726.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 05:48:05.9350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+F9EhEu0MECFO6nYFTYd+rI8hJbJUIPuWtwYa633LO99FFSrPZzLdJHOwYzMkkETj9y3WogzZ4vrV7jU5FCe3uMf3v+5HbkwlC1g1VQa38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7882
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


On 11-07-2024 09:43 am, Pranay Samala wrote:
> This test is debug logs are too much and was killed
> due to exceeding disk usage limit on the less disk
> space machines.
> 
> So dynamically reducing the debug log level to 13.
> 
> v3:
> - Calling loglevel init functionality in lib file (Bhanu)
> - Here 2 means the log level will be reduced by 2 (Bhanu)

Please keep maintain the rev history (v2 is missing).

> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_atomic_transition.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 29dd8ac4e..f89cd0814 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -34,6 +34,7 @@
>   #include "igt_rand.h"
>   #include "drmtest.h"
>   #include "sw_sync.h"
> +#include "igt_sysfs.h"
>   #include <errno.h>
>   #include <pthread.h>
>   #include <stdbool.h>
> @@ -1176,6 +1177,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> +		igt_drm_debug_level_update(2);

Comments in Rev 2 is not addressed.

Probably, you can read the current debug level & take the decision.

Ex:
if (igt_drm_debug_level_get() > <your magic number>)
	igt_drm_debug_level_update(2);

Also, please move this logic to end of the igt_fixture.
Ex: If there is valid connector found, then there is no point to update 
the debug level.

- Bhanu

> +
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
