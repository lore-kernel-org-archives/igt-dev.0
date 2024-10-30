Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721D3D74954
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 02:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245EC10E13C;
	Wed, 30 Oct 2024 02:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4mcg7I1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CFC10E13C
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 02:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730256310; x=1761792310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XjYkqx3M0rRvra3zVeKiN4x4KDtPvwcMGh1ntiPHu/o=;
 b=b4mcg7I1Gy5xsQe521iVOJ0+PrunqrqYrc5dBvIVIrjFfmE5PayWPJgl
 Oz9Rie+DZF41RFC9/xLUDX71Lj+kWdwov+Gp/PBIJq+DMEsdz25fT5gNT
 5r6iR60QQL33wZzLiWwd7ycA1XdIZ59d1xzcasMM1g5qCfOqMMwjjLBxX
 MPbU8yJ381yRFEFzg5rQ7mp1Muhq+6sWOw+53Ih5ml5jVJG5o+dr0ub5Y
 X5I3sQ8bqjmLCy1bjRgo+UTkD6YoabbKWu/XRRGqdyboX6Vi6khD+hSx9
 QE63nFC1NGp3DzEoypWAMwRK8s8LGVmRsKWItA+pQRlyDf/SvWcRo+HUJ g==;
X-CSE-ConnectionGUID: HR5cPeUwTdGJT78D09i77w==
X-CSE-MsgGUID: 0oCn6tuHRPeMC5kutiDoxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30081096"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30081096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 19:45:09 -0700
X-CSE-ConnectionGUID: 8bQknrJWTmePXOl+bkPbjg==
X-CSE-MsgGUID: ymnRsdySSomPQDwuOM5GXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="87295368"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 19:45:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 19:45:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 19:45:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 19:45:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaSeiWO/mEeG9Q/4nPJ06m4O6h817I51A/XVefUp9qhea+U/GMx0HyaaHlbHeS1oXurrS/Qk4RjklG5O58AMNpmq4n94wJ1+psEZ0HlPb7hJry94V1FP7N4SH4lizbQ4lSVFTVAGbestfrHvzzgHE26mPV3kRPN5INrBEm79JNMKUs64GGvhlpU41KYtN9mqpi7jW8ZpwOtV3baHKH6BdFdVgbCrKzA9szhR4dFvkCojlQSaUaip4dUJBkm9U3B8bs5421fYoAbItkdouuWnmFCrDY/kanWfXb7bdcvjD9/j6JLCQ/uQPEJFxQVpDMV8i2sUnB2u3F4Tbluf/gO07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYG03vZjc9KMRL+aItcKQ1enz9uAO64ZbRLlHx6SdBU=;
 b=Lrd31v8XXZBELIubswj5AqeXd6Bi1Swnjr/aNYITZF5Bshl7LCgcXA+SLF5eoai0am5adCuEViBsSpEOrz40oawNf4KJ97oZbIZxLatNdcooTiFsvO/ubXLc5hNh8dZcdXinp7kKr4KIdQPd1GIskWAU4v2oHNjqcZzbk9KnGGo/bH8oCsZZChnuVEqxWy4gXist9vPwnLLR7WYBE5/PafO+phF9H+Qm3aiwg2jTlTSqqy3hjsW6XCYHl+Z0KZLMCZTV3TmEWkktvXVbNraGdruqo1y8lgmQrdb20l/Go6r1oMkA94P5YUzFMCNK9g5qySxGOF48MzTjnQ8n4lkAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by PH7PR11MB6955.namprd11.prod.outlook.com (2603:10b6:510:206::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Wed, 30 Oct
 2024 02:44:58 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8093.024; Wed, 30 Oct 2024
 02:44:58 +0000
Message-ID: <2c2ac067-6070-41b7-88fd-e187d4d89eac@intel.com>
Date: Wed, 30 Oct 2024 08:14:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Skip test if big joiner
 display is connected
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <karthik.b.s@intel.com>
References: <20241029092445.1965070-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241029092445.1965070-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|PH7PR11MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c3b746-b352-4c5d-b760-08dcf88cd7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REd1VTU0M2dxeThQU0wvNVcxZFdNZjZMUGNsOXkvQlZsOHg0YSs1WEJ4N3lL?=
 =?utf-8?B?RlNVV0NrTVRYR0Iwb2RxSXhITGN6b2NNSW5kaFlrcEVOeVZURXh6Z0hkNmdJ?=
 =?utf-8?B?alYzRkVSS2J4REVpL3FYVkRwOHkvQTQyMW1RSjJuc1h6ZGNzVEV0Rk92bW1y?=
 =?utf-8?B?TlRMNGNwL0pLTElpVWpnK21hVXUvSTVoUGJ3MkJYQWE0dG5KdDlzd1hXRzc0?=
 =?utf-8?B?c2t1TjJLWVVMdkV5bW5oV1RQNFBTUVJxUE5GOGJzeEhSbkxYQ3ZPVFArT1U1?=
 =?utf-8?B?TXduSkV6bHllc3ZZLzNIWS84dmdwc0Z1eTF1Z2VuRmVpM0k3Qis3VW5hTUtP?=
 =?utf-8?B?a3pjR0hZMnNGVURlWXhEZDR6aGFnS0NTWnpVQzhkN3pnMU9uS21sQkIwNk5j?=
 =?utf-8?B?R3hkUmxNS2ZMamJXT09EWW1GSHcxcHRxVHBmNlFDeWwybDJ3R0J3b2tJYTdx?=
 =?utf-8?B?WFV5ZHdCKzlEaUtMUUM1UFAxT0s3bUpkSUs5Y1VZbUJOTUprVkVRZnNPTjQy?=
 =?utf-8?B?K0dhTCtFZ21TMXFsOWp2OUJNYm9jM1FSV01aWGdIeGFKZFY0MlVNUExyWWZu?=
 =?utf-8?B?ODV6YUU2Y091VjE1M2l1bUZNQlhuSERQUVAxMXF2cnp2MS9sK2lWWTJiYzZY?=
 =?utf-8?B?dVZZOFhrYkhjRVhIeFVLZ2lFZDk5eEJRWjFGRHM5Zk03UnZrelN1WjhyMEFy?=
 =?utf-8?B?K2Q5cExiL2lSTjRuMjVZUGhjMHo0UkQzanZpR2gxWEVwTDdxcEhtbjlYaXJG?=
 =?utf-8?B?dWtsNWhvYzg2NlFVTnRScTNZcUdUYXB4c0lBRU1SbzV0VEFhRkFTV1RQbEJa?=
 =?utf-8?B?RmtwcGFKOE50RGhWb1lsZ050RUJKcGxmVnRHaDhCOE9jeUh4clVlbTJzbUp5?=
 =?utf-8?B?TTZqMEsvNlJCT3dSNU53Rmo4MlRGZ2gzYzhsbUJzTFdCbld0NmhKdGJuUFc2?=
 =?utf-8?B?YlVKa2FkbzZBTC9yU1N1Y0VORDdlRG9jQWVtRWlVUWRMV2JCNmk4Mm5qZzh2?=
 =?utf-8?B?NDNZems2VmorMDhZWWx0UGsxT0NuSnBTLzdNYTBEUituaUVpTWovSGhvRlYr?=
 =?utf-8?B?SkxqL3gxQUt3UlM4eUJMN29zWEJ2QlI0WnJyVDdleEhpZWZQMnBoN2dsMnhP?=
 =?utf-8?B?QU1uVWdqOENHV255RTNkbWZIK3BCNHBBUDlHbmJ2MGFpaW94Mzg0VDhKTG9i?=
 =?utf-8?B?QUlnSXFwd2orbDY1cHEwTzRIVEhPTmF0VVRyUW5UNlJrTHByTGhUOVhXdXli?=
 =?utf-8?B?ZUJxNkVWN0VOTzloVTlnR0JKZUlGVFVpWEI0ZTdGUGpoRTcxNmlLNHAwTU4x?=
 =?utf-8?B?Y1d6blNoYVNxT3ZKUTdqeWFwaW1zeVFHN0ZwVkFudFdMMmgveFhKSlpXZXpY?=
 =?utf-8?B?OXF5bzVJUDFGbFJSSno3LzFIV0ZQdFR2UnhpMU0rZUh6ZXdubmpXZisyNzNH?=
 =?utf-8?B?QlZkWWM2bGZIVzJiSDMwWVJkVDNFOHk2UTduWmd1NXJ5dUFCaGNZUkcvTDBv?=
 =?utf-8?B?T2h1Y3JwOXk5dVJtR0ZPQnJaZ1FnWUR5KzdDZmNqUVZ6R3J2VHJOWDZIRE1K?=
 =?utf-8?B?bWxpK2N3WmpNQi9HVE9EYUhzcWliZ0p3TS9sR0YyWTMrY09jMVRyNitMM3FQ?=
 =?utf-8?B?bFgzbHF6RDM2OG1NNnJXaHdQVmMrMXBDUStyT3J1ZDhLbWJGN0ZQQ21MR1E4?=
 =?utf-8?B?OTVuR0ZPMkZGTnZYaXJrTVI2ZEZ5R2wwRzlMRU1EK2xVRmN2NXlXdHhyTkdp?=
 =?utf-8?Q?VvdY7CiGX9KW/DNshJXJVTLvcb78udaFvb7VhvC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm9IU0M2eDNHc2l6ZVdwQlN5OUtrVXZYQ1NEcWxaZkFWSCs3c1VlMldDa2Rr?=
 =?utf-8?B?eXJ6NWNrQ2VTcFlwZkhzTTZ2WmFaYSsralROZE4vd014Y1k1M0c2dDJXSHV4?=
 =?utf-8?B?SFJKOUo3UGoxSS9TZ2hUWjBvbkZWTUg5cmtlU0oyYzExaEJqUWkxZWVsRzlF?=
 =?utf-8?B?SFVSVUs4QVFpenpSSnNCRmZlakErTW9pY2pmSHlyUDJsekIyS2ZJeWxiTVlj?=
 =?utf-8?B?V1VHQ0U2cklONHJqU2tweDNDT01aekVOWEo1ZHZ5eVRTT0lFb2VML3NnbDk1?=
 =?utf-8?B?WWE1Q29iQ21PSUo1RUgvcXhMT3lLb1AxdFhBVlJlM29VZWQ3WFNIWEg0TnBY?=
 =?utf-8?B?VWxocE1HemJoSGlJWnpFWUIwd0k3d0FVcXF2K085LzNidllhSm1ZSHFqbFpx?=
 =?utf-8?B?NThNRUN0RTFwZFE2Z21UUGVTM0JVcFlQRy9XTzhHWjcvdTNITm5KaURCQ2Zr?=
 =?utf-8?B?RmNsa1Y0cDBpWlF5NUFVMjdOVHA1OGFBdWZXS3hwbHBmL0RGUTB0dWtZRHcx?=
 =?utf-8?B?UlRyOVltYkpUb0NJU1hZeE9tbVF0amxBNURpaURySTZtNXlSOXdnS29MdThG?=
 =?utf-8?B?QWROdThGNXE4T0I3SUQrRzR0ZVVyTGxMQTR2MEt0ZDRjSlg1aWJnb1RLcHRx?=
 =?utf-8?B?Yk1FSUU1MEdVSXpsaE1FcDUrNEpaVlNSUy9EK3VtSVBBM1A5TzZDSm91dXRx?=
 =?utf-8?B?WlFEbDRIUXNLMnFEdzM3RG1mMzJwMitucWlkWnliRml1aGtIbDBWRjZudVVK?=
 =?utf-8?B?NTJzWm9iREU2czh2QmJRKzc5MWJXMHpmSWFmZmRjcEZNMlZvQ0lIUkFxTUla?=
 =?utf-8?B?SFJJam9BbHhBa2g4S0Z0THZJaEdhNXp0TUxxemYvOTUxYUpKVzZUOUFLQkVW?=
 =?utf-8?B?dTJ0dWxwUU5mSDB6K2hPMEdLR1NkREY1S3A5eXp1RVN5eTYySnZxak5WczVl?=
 =?utf-8?B?MHJoOVR4U2VaMDZRNmtlbnUvcWdrNEtpQ01CdVNPUTBGZ3U2MGZPMjhnTHd6?=
 =?utf-8?B?S3VaK3RsMmJNSGUzNjVENlZDM0xWdjdwc0FLVlNRVkZXc3F3TjY0eGRYSzlq?=
 =?utf-8?B?TkQyR0IzUzBlbHl0Z1dqKzlqTStXdFFjUk5tYytEZzVvVXdVd0k5cnZYazBN?=
 =?utf-8?B?OWNJcHZXUmFTblg4UnZCakV5aFhNeDFSMlZQQWtLcTVtbWxJdmVoK0tTaXFn?=
 =?utf-8?B?ckN3c296VWZYWlFuQXR4MTc3eEZtajQyWThkcTJmUTRJOVZqcTVkMy9Va0s4?=
 =?utf-8?B?OE1GTUlMUk5PQlcwRU5mTG5BbHpMR3JaMS9PSnd3ZTMxQ3MwUHJwMXlrMXFl?=
 =?utf-8?B?WFNIMnYyQ1VyanNsZHhwcmlGTkpmMkgxWmROMFN5MnM4VnlReUtwK2NXNEI3?=
 =?utf-8?B?MmxBWEdiczBPdnFJbllxZFUrNWwzTzRqcmN3dWdSUVQzeENlMThRUHBRaFlh?=
 =?utf-8?B?RHJxTHYrMmE5THcrTm1RWUlqNVBEVWN6MmV2djZkeTJ1M3cvVmw2NEtvRUg2?=
 =?utf-8?B?Y3BYUTJPaVNEOWtyZTFMcGcxL1EzaDBScWdKZUR0TlhFZlgzeHlQTHlFZkZU?=
 =?utf-8?B?QUYwVnlXZWtkZmZaVHdoSjFMMklEQlY1UzRReEtyd056U3pyM0ZsTEh5OUtn?=
 =?utf-8?B?K1hJZVdEdldaMWVwdTRUdTRLaWpIa3FzOXovOE8zalZQbXpVdkxvS0hhRzlr?=
 =?utf-8?B?Vm02Y2VwUTZMQzlkNHlDY3BpQWppK212OFpzYnZPMjFzTEdUZEc1UjQrd3dv?=
 =?utf-8?B?cGxGY0tGWWlLZlZBSUd4SzAvTG9nOEFEK0wra3E1WHJFMnQ5MkQ5M1hXZnVM?=
 =?utf-8?B?d0dxLzZ5cXpvc0NCbC9idEhJUEd3Qlhad0tkaGdKNzBPM0ZGVUdqRGxmRmJC?=
 =?utf-8?B?ckJ1dk42SnBjTmFRSVFFNzUvMjlOcTFvZTAzakFsbVFIWkFTSEliY2xIaThX?=
 =?utf-8?B?Q0ZyRm1jcFlObXdMUDg2Z0IwaTB2NDVWa2RsY2dETkprblpEVkVWYkpqY1Zt?=
 =?utf-8?B?cHpNeVhQYTZEbjdkdkdXTUxjMjhSMldWZm9IWE12VTRYY3ZhZnNCOXVvVThx?=
 =?utf-8?B?OHp4b1IyOWFDVEFmMVBhUnNESW9IZlNvb0RLcFMvR0RFTC8rY2Z6NVZLbkdt?=
 =?utf-8?B?R2RKNTRFdUYzd2hmUXF1b3VTNEhkSE84NTFnQWZPRGdwVHV6aWMyeWtFalFL?=
 =?utf-8?Q?AuZAvxoEbrrkYgiVPVExtCg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c3b746-b352-4c5d-b760-08dcf88cd7c7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:44:58.2691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMk6TlTSoO3wcG6E2sEOqAOHre4ffiH/BJhjYmQVU624xNIiQk0Rj3cWAR3HmPriOTXKYgbHQ6/e82Re90MEvZu8rfwNoUv2OrPQRlUsAI2gVW5ELnt6yCyiHSfElOzh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6955
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



On 29-10-2024 14:54, Jeevan B wrote:
> High-resolution displays that support big joiner can cause extended mode
> tests to fail. This commit introduces a check to skip these tests if a
> big joiner display is connected, ensuring the test suite runs smoothly
> without unnecessary failures.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index f1d8ab03d..0950cc483 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -318,6 +318,12 @@ igt_main
>   		igt_display_require_output(&data.display);
>   
>   		for_each_connected_output(&data.display, output) {
> +			drmModeConnector *connector = output->config.connector;
> +			drmModeModeInfo mode;
> +			int max_dotclock = igt_get_max_dotclock(data.drm_fd);
> +
> +			igt_require_f(!bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode),
> +				      "Big Joiner Connector Found Unsupported Config\n");
 >> Hi Jeevan,
	Do we need to skip ultra joiner outputs as well here?
>   			data.mst_output[count++] = output;
>   			if (output_is_dp_mst(&data, output, dp_mst_outputs))
>   				dp_mst_outputs++;

