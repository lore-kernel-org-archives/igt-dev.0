Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F4CD49219
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 13:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EF110E325;
	Mon, 18 Nov 2024 13:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJlzwQ6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2434B10E325
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731934808; x=1763470808;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6UXLiw/iIW/kGDN1J89BFqdjWcBqIXYjbyZeue2OtEM=;
 b=OJlzwQ6i522XDMS8g67j3FcDJ8gjdNWAV5SyFlewJ0FC/2hFUOi/ndZZ
 q6S1zdeYDaX1rdwAL2CvhvBIu7+tfwJ0SL86IuOjxwo36etq4MKXxaN66
 Xs6AMAwREFE89FOdngLSXmlnW4H3OElH5Nqkqdb84AXgqUc50V4Z5Lusj
 L61TGV2no2tmVfrQpfNPq2DxcTaOEnfxnGaVqsrqwDYQizavtx5aqPC6S
 UmNoiNYB2ppBMulSCaTWh7W6AtGZeidZjg+2tImQDY11wT8sO2YcWOQXw
 6urU2Onw1FVPpXm84V7RH7xoTSIyzcbzQ/sBP171yWe8dOzE7jVTWk4yi Q==;
X-CSE-ConnectionGUID: Hds0z8GvS3u/r/JoPBRnlw==
X-CSE-MsgGUID: sAj4pbB3RKOuWx6Z2PdS/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42523969"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="42523969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 05:00:07 -0800
X-CSE-ConnectionGUID: fBVfErSmSU+D1qtpFzX46g==
X-CSE-MsgGUID: LMZdciz3SiqJ3aKS4bOCTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89140417"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 05:00:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 05:00:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 05:00:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 05:00:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKU2CrbN3CO7a5RAQkTbm+uKtLmoztPXrFSAEBYZBCwwGDJCrTY1Dfy35qHLwpxGiIacCahGXXn9uPeCVu2wqYS2L4kcM79kJ7+4lDwD122CWhxcHV/SLWow0TML20hwAZeQmN5Q5tKCJlVbjLV1KoDY5PmSxnVTolu0td5p5Ul3xFaGbmNcEfN8FPXxG5byBA+7yx7m4Vx1+I+lZHcRuO9AGWC7UdbMTM2z9gqwnahBd49a9ejJnMG89TD1c3pfEcYQYbGd/KaEKzHqo/5AHQibYO1PRTXoJruAe/R0LRGdtkOazOeVDi+uftm4tF1Oak1EGz0XzlXssSL7aQcLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46Kd1fwN1Oo+85WNnZ51Ey4QDGUSHhT1XI5u5posXJA=;
 b=nBugMDDc58/JUDj2cY3Py13YokjwvSElaRMCFJIPhaYRGrWh7D+wiqwKNZ+uODUH46i4Ss77YQSZzAhztXwUW60dIEuKc2KCG2QVCv0vszmGRM1WkKmp+hBUBY3j0LuGyhmvY3W/w1aexPrCxtAt7pktJHxAyA78lwPgV1Y6ad+C6QclCJWC5umox5yMVYPdImhmt/9rYIR9DSuTO98M+ak1vn2t0Fo6fl/gy/vCQrFkC8k1L1uH/hbeiLLhSIrW2mFpXb7yEW1cIAIZ4PLiWFl0BWmiatgSUeQPffMZ9jW/EPCMqwOHEzeswR2z1Dpkj7Ecv/h+dWBsRENmAsG5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 13:00:03 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 13:00:03 +0000
Message-ID: <64ec9c9e-e5ee-4aad-bc21-d280fdc4bd54@intel.com>
Date: Mon, 18 Nov 2024 14:00:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/gppgu_shader: Add write to ppgtt offset
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-2-gwan-gyeong.mun@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241115141132.866838-2-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|MW4PR11MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 638e5cbf-f8b7-48a4-65b8-08dd07d0eb0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVZjd2ZRMDJhS3M5bi93WmRoV2dRZFRSWVlWMVBYdHFvSTVsS29QUDBQSGlK?=
 =?utf-8?B?RnpyUGlkZjltci9GQmVkRndwOEFsTmRXdGpJYjJsK2wxdkFSSkJLQUpJNjd4?=
 =?utf-8?B?OG52ZENScll5MGNiSnRzSi9mdDJ4bEd1YTkxa3h1NnpGdFFBVHdZYUFWYUgr?=
 =?utf-8?B?eWZsdjM4aXFkSHpUYXg5bm40YjV2eE9tYnUxRTg0OEkwamVIKy93ektFU3Jr?=
 =?utf-8?B?aU8rOVdPa2NXQ002MHFNM0ZDamdQUElzNWJTbXZBcG10QmhxbWlhczBZZE5k?=
 =?utf-8?B?YXdpSVpKQittb3dSSXF0SzlUd0hRLzZVclQ3ejI4NG1BLzMwMkpIVnBvM0J0?=
 =?utf-8?B?MUYvN0NnbUgzczlWK3piN2p4TVJWNUpzdUUvYkllSkg1ZnlwZUhlNjdlSFpQ?=
 =?utf-8?B?K3BjMjlDT3p0c25ITVluZ1BiTzVSTjBtRm9vM2trbmZnRERjU1k0S1ZJYXdj?=
 =?utf-8?B?alVSc2JjK2U0YnhWdmdiVnYybFJvWHBsQzFidUd2NGVnRS81K0pYajZXRkpr?=
 =?utf-8?B?Z3BGNFFRY1IyRlI5VkUvU1dEenRCUFZ3YjBQK1NCUHNXOEZPb1ZwR3Jzck5X?=
 =?utf-8?B?TG14ZHY2UTBoM1pBeFA1TlRTcmF2VUw1cTlSR0hTbVJlMG4yRFNtNE13cG1a?=
 =?utf-8?B?bk1BMGFRbzZGc1JkSjJDRGlac3Y0YTJJUnR4Y1JHR2JpaUVtQ2NwV1BhSlQw?=
 =?utf-8?B?NVdrVVRWc1FMR3hncHFwQ2tUWFZtRnRqcWtYblUrWHRDY0xLTkZTUmtlSGpa?=
 =?utf-8?B?RkI5RU9wSWdXZisyT1RGUFlIaGZVQVdISndweFIrTFhXc0k1YnpLQk9vdnpU?=
 =?utf-8?B?dFVDU1lvZkY3aUZDbXRlbUJkSC8xanZ0Z1J6Sk1TMmM0WktlTXVVcmNoOHk3?=
 =?utf-8?B?NUNrQ2RSY2tDa01xdGg4UVlwZnNUcGUzQU5tTDU3KzdDbE1xWnV4bUVkWUts?=
 =?utf-8?B?S1VUSnZaVkVPbmtPYkVEdHhLL0xxWkJsRUROQlhnd3RRVFUvb3JmNHhYYkZi?=
 =?utf-8?B?ODF0QjJVNlBXNG5JZzFYajBQMk1pMVgwL25GZS9yOFNITlY5LzFWeHdYSks5?=
 =?utf-8?B?dUlpdmJZdEluMmFZT3o5dnFHZFhZT3ZSY1A5REdyQTVNVkdFL1RWNXAybkdM?=
 =?utf-8?B?YU8xV1hJNTFWWHMvazJnM2tjUTBhSFlXQkJKZVk1bENONmU3VkxpWEFKUU1x?=
 =?utf-8?B?UWVMZ1RCczhHKzFUMjVjbHdHRktpTXAxZXRIMEx3eEExLytDaWFUa2pIbUt4?=
 =?utf-8?B?K1FYMW1YTlhLOEU5MGNlTmR4cnFZT2ZiT0M4Zko2YklaSndIRlRKN1FKckY5?=
 =?utf-8?B?QXp2eWZFcEp3R3F5bzNOb3ZWNnlKQkQ3RzA4WGRNS0RYdnFVenhqbjV5Nmlm?=
 =?utf-8?B?UzNBSWdzWWxNNmFCMG5MbTMvWGZ2bXlkeUFEMUMzamtBSHZsbmFaNGt5WGVk?=
 =?utf-8?B?OHdweElYVXUzeklQMWNlZkdOL3RDTFJZQmk5SlpLaVZ4NFZaYm1VVTZiQzBl?=
 =?utf-8?B?bUNSc083aG5IL08yWG50ZU9tVHIxRmZjUlpaLzM3SjZNOTJ4MWl6NmpCU1Fy?=
 =?utf-8?B?K2RVK09hRXlxMU1ObFNqNm1zbXdWRXg0NFBIcFZxYTk3L2s3WHFvTy9qSExJ?=
 =?utf-8?B?aUdPUXc3NS9XT0gxYVRWNk1PTjVwMGhCNzV0VG1sNUxBNDZkRitxeWVqL21k?=
 =?utf-8?B?SG1MdHl3V3Z2QXZOQm1QelRLZGtFRW9jL3FpZXAzRzduMXNTMC85bmdlai80?=
 =?utf-8?Q?z4ZlFoNtF6AX8n5NKWjyqtClJNLqQ6+OVYXCQ19?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlNhUER0VkZUNkpRTnhITU50YnRZdlJPZnpXZmpvT3Z6OUtMWFcyaWxxb3lS?=
 =?utf-8?B?cGNLWGdHa0p6MnZPRHhYUDduU3YrWHo5UFhhVENVUkpMWlZRNXdXZUNSMy9p?=
 =?utf-8?B?WkwvVUsxNzI5YWtIVWdGN2UyQktXdVZLNTJoVUh2T3h3MnpVT3JHK0ZzdCtl?=
 =?utf-8?B?d0dEY29mMmRlVnNSMFlybEhSSC9NVk9ENG85bDhMNlVqRDRwakNxRDlRY2cr?=
 =?utf-8?B?TnhwRkRkcGVFSXdoT0hKK0tBNy9uQlIwVW5ZeU90UGIrUVFEeXhuUXB6V3Z3?=
 =?utf-8?B?L2IwMXRuZGtla1BNT0UwTWtEZVR3KzFRNjRvZnV6VTNBZkJYMmFOSFJUYnlw?=
 =?utf-8?B?bm5yVnVQOFFWZ1FHQlNVOUtnWjFCTWNkcTNjZDEzMkNxczkwQXFzb29WamNU?=
 =?utf-8?B?eERKTEZCQWFRRm9JeE1JUSs1S2R3clJCWXVKQjl3ang3RWpyZERWUkRWVVpC?=
 =?utf-8?B?VmRnVDd0UGJldENlY252QThnak01Q0pTUG52WFBEY3VoR2Q4OVFnWnBLT3Bk?=
 =?utf-8?B?MHZSKyt5bE1odXdOWVFxRUdYb2dwbTVpWDhKeUxRQjRHVHZwck1tOVRwaVNh?=
 =?utf-8?B?a3I0VnZrMkx4NXhMSGdDZkVpZ3JiWmxFek05OUZDd1J3T1ZyN0wrR2FHZkJj?=
 =?utf-8?B?RXdwTE9jb1kwWnFIL29oRG03bjhCZUlBSWdFdEZXNFZuTWFma2puM2tHSHhj?=
 =?utf-8?B?VGVMYmYyNTN3SXNLbmFWT3BnVDNhcjdFOXlUNCswMER2bXpUUWZuQ0FCNWJ3?=
 =?utf-8?B?eEZnVytyM2xLVjVKcGtFYkFKT2F2dUQ5dWI4U09NVTBhWVVtOURNQTJ1R0w0?=
 =?utf-8?B?SjBjeXljdnFSR05SbVNxTTkyZDN6NU5ncS9Wc2k1Z1BHUWtuaHBiVmo2STRt?=
 =?utf-8?B?T2dySFRlRUgyTm5VSDJHTHROdk9ObmVuN1FpYzNJZUtBZjY3Tm9hUDBJNTBm?=
 =?utf-8?B?RjRYbSs3QkNJcjl4MlBTWUdLUFU3KzVLNG9qVCtoRkk0a3dxdTJ5bnlwelll?=
 =?utf-8?B?b1ZrblBMcy9mczRJckZVak43cVdZV2N5NHBVL2hUeEJ0MkJxazB3WnhCL004?=
 =?utf-8?B?dnAyRmhQV1cxVU5SMlF3aUhRZy9wdWMrZjhGbEdWWHdBZjc2ejExTDRUZ3Rl?=
 =?utf-8?B?bUl1WVBmQVZUU0lNbmdUaEp6Wnp4T1pBVThMa1BRbjJteEZ4NktMYzE2eG9V?=
 =?utf-8?B?eHBQTEs5Z2ZjREFTZDVLWTV1QlgxY0tkZVRyVjMybTFaOGx4TFNXOG5IR1VV?=
 =?utf-8?B?Sk9UVUZiNklJOEMzS3cyS21UR1BPMENXdXhkSXBWUkxIWXllRDBRWEJOMHpn?=
 =?utf-8?B?ZG5VTy9sSlI1TXZ2TDU1a0ZmLzI2VU5NdVNTaVo1OVNDNEJOVzhYVnNzOXZG?=
 =?utf-8?B?Nk43d2c0VHBGTUQyVmdOZi9OQzhidzJiNnB2Z2tWd3VEKzIwV3NKQlpvTlhP?=
 =?utf-8?B?YkdGaFUvUXN5aWcwZ0JYaWs1ck9rRDFGSW9saks1NEY1MVBhVkJpNkw0MXdR?=
 =?utf-8?B?REIrcFh0V09UaG5SMlVSYXpGcktzTmZJMlNrcDhlZFZhdUlUQmh5cFVHYmtP?=
 =?utf-8?B?akpHOFFZTjdMWEhlVUtCSlJ4ZlBydUY2R1A0WG9DS3pxdktFZ3kvek5OT3Ju?=
 =?utf-8?B?aUNyaW8ydDZIaWZ4NzFqNVllZE9HQndNZXVGU2hDSTFBU1hqVDZVNVFLK3FQ?=
 =?utf-8?B?aHZoYk41UjBheEpsWmpqOFhXbE12Nm9Ld3VaNHJkU05IQ1g1dUxKVHZlcXhk?=
 =?utf-8?B?YmwzOUc3dXJ2bm1WMXNNY1U1SUVqRkpxMGE0NlNsTENlaWNKOERxUm1UUWtm?=
 =?utf-8?B?TjZ2R214eGFkY0lCN2l3eW11RmZZWW8rbHNwZzYvdFgyWlFXMEZwU0toSk5n?=
 =?utf-8?B?ZnY1RVRxeU5hTkFXUy9qNXNxd1ZJY1VzU0NMaXU3UFJ2b1NTVnd3SFBEUXZT?=
 =?utf-8?B?RG4rendSMUxJaHFJU3h4dm4yMFpXK3VuNjVVc2pIVVAzOVpGS3dnMEhKUExY?=
 =?utf-8?B?V1RVS3JVVnZtOTdCQWd3VUNGcmZzcmhZRGFsWlUvRWFOTW8zRTJxdzQxd2VS?=
 =?utf-8?B?T0ZST1FPRHRUVWF1dVU3U3JTdjgrbkphWE4vT1NMSU5YNkJZTm5FanlxVHdw?=
 =?utf-8?B?TzJPYmV1MS9xNDFVY013S0F5RXc3RWdkWUxkbW5ZM1BncWE1NTQrQzhkbGh5?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 638e5cbf-f8b7-48a4-65b8-08dd07d0eb0b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 13:00:03.7686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NviM/27k7p1TY6VN+5D/Ezk/n6Q8Vnft9JWJFblqNDJBFsIkf0KFz4+YhBhmGFT95PjrsICxyUwKk9wVD90Y7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
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

W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> Create a function that adds the capacity to fill an oword at a given
> ppgtt offset with a dword value.  Xe2 does this with an Untyped 2D Block
> Array Store operation, though older platforms used to do this with a
> Media Write Block, so both means are supported.
> 
> Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   lib/gpgpu_shader.c          | 109 ++++++++++++++++++++++++++++++++++++
>   lib/gpgpu_shader.h          |   2 +
>   lib/iga64_generated_codes.c |  81 ++++++++++++++++++++++++++-
>   3 files changed, 191 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 4e1b8d5e9..7a2f0d28d 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -652,6 +652,115 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>   	", 2, y_offset, 3, value, value, value, value);
>   }
>   
> +/**
> + * gpgpu_shader__write_offset:
> + * @shdr: shader to be modified
> + * @ppgtt_offset: write target virtual address
> + * @value: dword to be written
> + *
> + * Fill oword at @ppgtt with dword stored in @value.
> + *
> + * Note: for the write to succeed, the address specified by @ppgtt_offset has
> + * to be bound. Otherwise a page fault will be triggered.
> + */
> +void gpgpu_shader__write_offset(struct gpgpu_shader *shdr, uint64_t ppgtt_offset,
> +				uint32_t value)

The name is somehow misleading, maybe gpgpu_shader__fill_a64_4dw? 
Anything better?

> +{
> +	uint64_t offset = CANONICAL(ppgtt_offset);
> +	igt_assert_f((offset & 0xf) == 0, "Offset must be aligned to oword!\n");
> +
> +	emit_iga64_code(shdr, write_offset, "					\n\
> +#if GEN_VER < 2000 // Media Block Write						\n\
> +(W)	mov (8|M0)		r30.0<1>:ud	0x0:ud				\n\
> +	// canonical address							\n\
> +(W)	mov (1|M0)		r30.0<1>:ud	ARG(0):ud			\n\
> +(W)	mov (1|M0)		r30.1<1>:ud	ARG(1):ud			\n\
> +	// written value							\n\
> +(W)	mov (1|M0)		r31.0<1>:ud	ARG(2):ud			\n\
> +(W)	mov (1|M0)		r31.1<1>:ud	ARG(3):ud			\n\
> +(W)	mov (1|M0)		r31.2<1>:ud	ARG(4):ud			\n\
> +(W)	mov (1|M0)		r31.3<1>:ud	ARG(5):ud			\n\

It could be replaced by "mov (4) r31.0<1>:ud ARG(2):ud", and then 
removed duplicated arguments ARGS(3-5).

> +	// owblock write							\n\
> +(W)	send.dc1 (16|M0)	null	r30	r31	0x0	0x20d40ff	\n\
> +	// owblock read, to block the thread until the write is materialized	\n\
> +(W)	send.dc1 (16|M0)	r32	r30	null	0x0	0x21500ff	\n\
> +#else // Unyped 2D Block Store							\n\
> +// Instruction_Store2DBlock							\n\
> +// bspec: 63981									\n\
> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both		\n\
> +//	the block parameters and the 2D Surface parameters.			\n\
> +// src1 data payload format is selected by Data Size.				\n\
> +// Untyped2DBLOCKAddressPayload							\n\
> +// bspec: 63986									\n\
> +// [243:240] Array Length: 0 (length is 1)					\n\
> +// [239:232] Block Height: 0 (height is 1)					\n\
> +// [231:224] Block Width: 0xf (width is 16)					\n\
> +// [223:192] Block Start Y: 0							\n\
> +// [191:160] Block Start X: 0							\n\
> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)			\n\
> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)			\n\
> +// [63:0] Untyped 2D Surface Base Address					\n\
> +// initialize register								\n\
> +(W)	mov (8)			r30.0<1>:uq	0x0:uq				\n\
> +// [0:31] Untyped 2D Surface Base Address low					\n\
> +(W)	mov (1)			r30.0<1>:ud	ARG(0):ud			\n\
> +// [32:63] Untyped 2D Surface Base Address high					\n\
> +(W)	mov (1)			r30.1<1>:ud ARG(1):ud				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f					\n\
> +//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1) 		r30.2<1>:ud	0x3f:ud				\n\
> +// [127:96] Untyped 2D Surface Height: 0x0					\n\
> +//	    (Height minus 1 (in number of data elements) of			\n\
> +//	    the Untyped 2D surface, it represents 1)				\n\
> +(W)	mov (1) 		r30.3<1>:ud	0x0:ud				\n\
> +// [159:128] Untyped 2D Surface Pitch: 0x3f					\n\
> +//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1)			r30.4<1>:ud	0x3f:ud				\n\
> +// [231:224] Block Width: 0xf (15)						\n\
> +//	     (Specifies the width minus 1 (in number of data elements) for this	\n\
> +//	     rectangular region, it represents 16)				\n\
> +// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).		\n\
> +// [239:232] Block Height: 0							\n\
> +//	     (Specifies the height minus 1 (in number of data elements) for	\n\
> +//	     this rectangular region, it represents 1)				\n\
> +// [243:240] Array Length: 0							\n\
> +//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,	\n\
> +//	     must be zero for 2D Block Store messages, it represents 1)		\n\
> +(W)	mov (1)			r30.7<1>:ud	0xf:ud				\n\
> +// src1 data payload size							\n\
> +// Block Height x Block Width x Data size / GRF Register size			\n\
> +//	=> 1 x 16 x 32bit / 512bit = 1						\n\
> +// data payload size is 1							\n\
> +(W)	mov (8)			r31.0<1>:uq	0x0:uq				\n\
> +(W)	mov (1|M0)		r31.0<1>:ud 	ARG(2):ud			\n\
> +(W)	mov (1|M0)		r31.1<1>:ud	ARG(3):ud			\n\
> +(W)	mov (1|M0)		r31.2<1>:ud	ARG(4):ud			\n\
> +(W)	mov (1|M0)		r31.3<1>:ud	ARG(5):ud			\n\
> +// send.ugm Untyped 2D Block Array Store					\n\
> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc				\n\
> +// Execution Mask restriction: SIMT1						\n\
> +//										\n\
> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)	\n\
> +// bspec: 67780									\n\
> +// 0x0 =>									\n\
> +// [32:22] Global Y_offset: 0							\n\
> +// [21:12] Global X_offset: 0							\n\
> +//										\n\
> +// Message Descriptor								\n\
> +// bspec: 63981									\n\
> +// 0x2020407 =>									\n\
> +// [30:29] Address Type: 0 (FLAT)						\n\
> +// [28:25] Src0 Length: 1							\n\
> +// [24:20] Dest Length: 0							\n\
> +// [19:16] Cache : 2 (L1UC_L3UC)						\n\
> +// [11:9] Data Size: 2 (D32)							\n\
> +// [5:0] Store Operation: 7							\n\
> +(W)	send.ugm (1)		null	r30	r31:1	0x0	0x2020407	\n\
> +#endif										\n\
> +	", offset & 0xffffffff, offset >> 32, value, value, value, value);

with above change, and proper macros line above becomes:
, lower_32_bits(offset), upper_32_bits(offset), value);

> +}
> +
>   /**
>    * gpgpu_shader__clear_exception:
>    * @shdr: shader to be modified
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index c7c21c115..355b128b5 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -83,6 +83,8 @@ void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset);
>   void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value);
>   void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>   			       uint32_t y_offset);
> +void gpgpu_shader__write_offset(struct gpgpu_shader *shdr, uint64_t ppgtt_offset,
> +				uint32_t value);
>   void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, uint32_t x_offset,
>   				      uint32_t y_offset, uint32_t mask, uint32_t value);
>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 6638be07b..b23613ac4 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
> +#define MD5_SUM_IGA64_ASMS 4fcde43dedb9d3212f1d85b5b180b0c1
>   
>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> @@ -323,6 +323,85 @@ struct iga64_template const iga64_code_clear_exception[] = {
>   	}}
>   };
>   
> +struct iga64_template const iga64_code_write_offset[] = {
> +	{ .gen_ver = 2000, .size = 64, .code = (const uint32_t []) {
> +		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e354220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
> +		0x800c0061, 0x1f054330, 0x00000000, 0x00000000,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f154220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x1f354220, 0x00000000, 0xc0ded005,
> +		0x80032031, 0x00000000, 0xf80e1e0c, 0x00801f0c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f454220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x1f654220, 0x00000000, 0xc0ded005,
> +		0x80001d01, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
> +		0x80044131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
> +		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f154220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x1f354220, 0x00000000, 0xc0ded005,
> +		0x8013a031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
> +		0x8010c131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f454220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x1f654220, 0x00000000, 0xc0ded005,
> +		0x80001d01, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
> +		0x80044131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
> +		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e254220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x1f254220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x1f454220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x1f654220, 0x00000000, 0xc0ded005,
> +		0x8004d031, 0x00000000, 0xc1fe1e0c, 0x03501f04,
> +		0x80044131, 0x200c0000, 0xc1fe1e0c, 0x01400000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
>   struct iga64_template const iga64_code_media_block_write[] = {
>   	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>   		0x80100061, 0x04054220, 0x00000000, 0x00000000,

