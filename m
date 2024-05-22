Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBEFC25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 07:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB5310E6D7;
	Wed, 22 May 2024 07:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hprofspx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AE510E6D7
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 07:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716364730; x=1747900730;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jMdLydqoz7fZZEoKZkrZnnlHTZIbqQ4PkL9oAuyO94Y=;
 b=HprofspxDgwlcGz62sxdeDWWTqYdT7o4uq845HBQJquojprU73uUsM4m
 ZR6f4Tb/rO8D6F4ydGT5rLVuCkbV79fPskm+qKywrz2yLiN0Mfp1NgMwK
 JtUHEk2B7pfWVQ/gLQUf3VFi1CyN+67A6a42sKbCN/ZaviFvSm62VRzla
 YrU1JOmoXsPeXU1EqrKR2ce8sJLlRNtiibzDSEVCjy48GiFMqmz69WDXs
 19VmaCVk9t+CWk2kqwjYyy/04dUg9sZpzrvHlVNAX9JXHrr+qNGdreDjk
 2tjtwXazYYazWTlnSKGm+82gDXtcs1yrivCRpJ0AL37OcdmpjMfv12RqH w==;
X-CSE-ConnectionGUID: v5/NpNs3Qb2Nw/WREqMoow==
X-CSE-MsgGUID: WzN4bT5DQtOWPIPXLI3zng==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12769996"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="12769996"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 00:58:50 -0700
X-CSE-ConnectionGUID: WqQ2b9WfSGuam+cxQCqNPg==
X-CSE-MsgGUID: 4iLhf5JwTa+9Ge32TPOG7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38035869"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 00:58:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 00:58:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 00:58:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 00:58:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BybT6QFSSIHfykQui1uGp1cqudKfsDL4mORNe4AHddBqREy13edKDcMmcYcZitvb/tKU7XLx+zFpOk5z5iqLZ1UfT7tLgiXsZO/ITUN3j2UKthMjbV8PW/3oLSPK4NLxfzvsvyhr4PNnNjE72HvA5kAdYKfvwD6R43zmCb6TB2OAMIVGlaAlD8t4GWDVR+JDsrq9bNxdIODe6vNi0lkM1ncF9scwrGEa8izYEnyrDrqVakq+t3h9ZuenjwKYX3f1+CwSZlyl1HsSLmC8JKs4PS3ImaXCMktCS+64xFUHelx0IwgyFWRQz8oAFYa9itMYoF0aCVcds1tp3tBVAwkRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3Z8EmdV3TYSnCzVLZrOlwvWTU5Y2oF0SBO+jK+Cz94=;
 b=PI+C7BruRBwweQa9beyopKHbedLrsOtNqFO4M5Uzp/CHfYUisWfM9uL65T8/Eh47a+B++XyWz2PZMmWnVfRJoeyM4P9LK2akw08L491maYL8DJKWzX04hWzbsa9rUZ0wDgbSJ4JIvJTjWJ0Tg2WQQXX3IdAt2mZ6rlm2Y3VVO/YJju3uTv9wLzvM74z772IP4om4Jy9h0H1YPX1i6be6y7Jt+q7AEwWL2y40ajBb9Q5eWqfy0JFwKc7SfNGqxK1AA73O7YQ0s3np8W1Xklc2CVKc+Zna4nGCWxDDwgaKiynS5IFu8MRrIXA4N5mGvSVRrDRinrchgQobz7xqd+Yr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Wed, 22 May
 2024 07:58:42 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 07:58:42 +0000
Message-ID: <7a7008b4-09b2-468f-ac90-271214c90dc6@intel.com>
Date: Wed, 22 May 2024 13:28:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Anshuman Gupta <anshuman.gupta@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
References: <20240520183519.227167-1-rodrigo.vivi@intel.com>
 <20240520183519.227167-5-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240520183519.227167-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::12) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW6PR11MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 730609bd-e177-4338-8d13-08dc7a34ff19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEIwSXBnMHF3eG9qMDhTVitLR3ZWUlgyUm9ycm40MFNZRkhYZFVVWWl6Nk5i?=
 =?utf-8?B?QUZKaWpYamlxNnMrOU9pdVE2NUZ0bC9Sdm40Um9ERUZJUWxNbG9UZUhFdGdp?=
 =?utf-8?B?ZDdLUXpCaFZXcmFWVEhCRU9NNWJoeHp4aDYxSTFnT2VZL2gySnRoNGpBWGdX?=
 =?utf-8?B?QllZOS9oOWtldkxZbitmN01TV1hUS2ZHOVg2b1FOY0NTeGZGb0FiSkIwNE84?=
 =?utf-8?B?ckJ4VzJXcU44Tmx3am5CM1pBcHoxMXJ1THdwYURGYU9KeWIweExva2RsdzJX?=
 =?utf-8?B?eHpZRFptV0pBdEVqcW40UzRwanJ5Y3d2K0I5QUU3czRRTDBrYVQrQW0yRkw2?=
 =?utf-8?B?UGh6b0xhWm5UNTY1Nmt6UlE4RThEU29oQ3NOWjlFZGY2aE0rVzhweklmbmdZ?=
 =?utf-8?B?ank2djRKL1hzMytVNW5ZSVJpYjBjRmYzSFErWDVmOGpYQ202OWVnbDdlRlpD?=
 =?utf-8?B?bGw2U1Y5eWtBTE5HTkxZdWhVZTNJWk4vV21FUFFlTVp0dE5UT3hNdlBUUExy?=
 =?utf-8?B?TUsxYXhSeHQzMk9mMWlTWTZyeVplOXRORnlLcVFPWSsrRXVGMWhhQmVtRjZO?=
 =?utf-8?B?b1FuazBhb3lxMHlXRlk2cDVvOVdudUFQVFZySXZ2UHU1YXp1WXRqOGNFMnlK?=
 =?utf-8?B?WUhqUWtkV3JpUERDaGR4WFNvTVhWeGZPeEVDeG4vd0hid2lHdkd4WUlRU2Vl?=
 =?utf-8?B?YjBuZFNhL284WVJQdjk4Y01WMGVIK2JnYjJtWWNFN2ZDOXVOazErUDhaa3ZR?=
 =?utf-8?B?ZXZoTW9ZbGtwQTdsR3I4NUgxUG42M2I1bzRkUUphbXV6Ni8rYytVc1BkREFt?=
 =?utf-8?B?cVU4N1pMQ1NPMkNpSmZydW9lZG1rYU1TK2JTWnI4M2VJZUIwYWVKdjRPVWUr?=
 =?utf-8?B?M2ZQRWU2b2N1cXBSaEtLNUo4ZHNUa1E2c0dsQ0E5T2FxQW1IR29ldmFkSllF?=
 =?utf-8?B?ZFRrWDVya3lpdUh4UzJ3ck1OK3Y0Zno0R1hkSWVLalBYOTNZUXNiZFlpM3dj?=
 =?utf-8?B?cDN2SFZQcGhjQ1NKOGdieVdIYWZEMklJMktrdGJCdURraVpyK1d2Y09tYWZS?=
 =?utf-8?B?ejBlVFQxbWNOWXR5Yks5UUh4L1JLNU1sZkdCZmtza2YxQWpEQjdoWWNHWGxa?=
 =?utf-8?B?MDhsckRGTGNFL2ZkRkxWY053ZWNINTNHc1dmY0lJTHdqRkZ6Qk5JSW5jcG1r?=
 =?utf-8?B?ZWUyM2h0emt3YmU3RkwxaEFSM3lCUmVqSTc2TmpoN1JnT3pidEVJZEpYSi9Q?=
 =?utf-8?B?TW13Sm5rb3B0VUhOZXVkQ0xYRVU3Q0dIcGljVUszWEp3MXdRWGdmbVZGZjVJ?=
 =?utf-8?B?WG9OUEpTdkdkc1c1TWNIU0FDYXA2dFIxVmpWVEdjQUNMZXpjd2tqSHgreU9y?=
 =?utf-8?B?SSs2ZVJoVlZiTzdGTUZ3RDA0RklScVErR1RSOXI0UmtBSnpackhDOVBDL3JG?=
 =?utf-8?B?QWNTdGIvZjI4MDhZYUhHWGF1ZjBkK05XTHJienkxcmxVOUlQblNoUjI2V212?=
 =?utf-8?B?cWg3YmRrY3pnQXhOOUVSV1liYzh5ZEtyMlh1L0dYREw1WFVyY3dVaGtQKzQx?=
 =?utf-8?B?aVV3Z2VNOGlZTWdzSzk3YzFCV1M1MnhuUkdwb3VOMDlSUUdqTlg1T3MwdUZV?=
 =?utf-8?B?ZVFuUk4yMjhVclRrSWpRQ0FMYkw2a0xoYWcrbjFYRUVVc3Vob2dLdmhFTzIy?=
 =?utf-8?B?d0hOeHFFL3VOSmwyU0pNdjBoRkpscFBzY2VJaCt1eTFGcWZsR3VFQVl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmI3OWNNR1hNR0ttMnAvZDgycEZXQm9kNkRpMFlWUW9jc1JvcGQwMS9WWE1J?=
 =?utf-8?B?T0YxTm1QR2dadms1V2pvWkxaVDdyUTlZQmRWU29uZ0w1bDEyMG1CTnY2cDRP?=
 =?utf-8?B?QTNjQzhEdHZLQi9zdmxGendDaE1tZDZSS2haQzJvSC84bGpheHpxOEtXTlN3?=
 =?utf-8?B?SWh3QWVXQXNrcmU5NUlUcjd4MzZiN3ZZQUhZL1VKQkRHbmpHYXlQei9Ub1g3?=
 =?utf-8?B?RzdwZjd0TUFQU2drRnlyeEprdFkrUnBlSXpibk4wUWxEcldMRnM5aUM1ZnRB?=
 =?utf-8?B?dmFzcjNSY3lJaVhkSTVnbHQ3NW1MSThLaVlkNXFHZ2tVSmVsYkJibE53N3Bh?=
 =?utf-8?B?NXNRS1BKK2l2SGdINGlGTkJ1RnRTMFJsNkxaaGdaeXZ6V1FobVpqZVFWaEd2?=
 =?utf-8?B?NUU0MmczVGd0L3BpTmtBUmhIUWhvQkNOeHptSDY5aWVKMXlkdzZxV1ZzMFVj?=
 =?utf-8?B?RG5ZNHZyRVg4Y2E4ZE0rWStPb05OczU3c0lBQ0FoVGFpUmZJbEptVjhwdXRa?=
 =?utf-8?B?bzZzNGtHK1F4SzE1U3lnT2ZTa1kyeFk5eEJBa2h0ZE1pbCtoK3VuNHZvRWZ1?=
 =?utf-8?B?aExxT054bzRtZENYNTVhV3NObnplZi9ya0hIV01wU3VRVnJjZGZvNDI4NjJz?=
 =?utf-8?B?aHFCZkEyUUZnRVdtSEFsYlZDWEw4VXdKUHl4dERYRjZhZHBnbXZobFZab3ZO?=
 =?utf-8?B?MWZrbk52UUhSd3BhTGJCa1VjamhDN3NLaVI0MWJ2OFRNV0xaQXVLcHJHU0l6?=
 =?utf-8?B?ZU1XM3BUUzkwRFI2MU5sUEx4SzRmeks1R2tLY3FzVFdVZTREMERvWko0RUw2?=
 =?utf-8?B?bldJbldmTHREQVpTdE9MRUZmSHVhZzFYS2JieFhTenRLdCt1bWlZWlRBNVRu?=
 =?utf-8?B?dHkyN1k3ellqc3Y5YUZxZlJhLzZwYXRsalpmSWZNUUVXOEgzUW5tK2lzN0sw?=
 =?utf-8?B?dXg3R3UzN080RzNvTUFMUkpqM1J1MGZxS1loVGpzOXZWcTFNd2hxaC9BbDhs?=
 =?utf-8?B?a0FNWnlUS2REL0tFa3J3azA4aC9rN0c1eWR2QzBSVkxSUy9sUmNDQW0wVUtT?=
 =?utf-8?B?SVROL012SmVPemNsSUdETytjZTV0d0VRUDAwcUxZZE45ZURYa0ZmRTV3SlJV?=
 =?utf-8?B?VHJaNnZxL2JOOEJ3OUNGc24yT2hLNDNUVG41RkVlS1paOVpxT3NWOS96QTdM?=
 =?utf-8?B?Z2tJaVJoM0p4NTAyeTZEUENmS0dmTCtxcFBzamw3d1RCOFFxNGgxUjRwc0Ro?=
 =?utf-8?B?ODhINlk3ZWE2UFdiMHNMeWlRWVpxb3BhdmVKY1dqR093NXE1ME5McHRYWERv?=
 =?utf-8?B?OXpzSWxWVW5RWDFtWmlCU2w2VXd6clJRSURiNFF5anNmbHEwa3NHejJmVlpp?=
 =?utf-8?B?VHk3SjQxdEFXRFJhZVhSbjl2MWVDWFc2UzFnY2tlNWpMd2g4NEtSeTJsb2dS?=
 =?utf-8?B?MGJ0cHZWZWsxTDlTckhuOTlORXNTZCtodzBLYk5nZ1BPVHE2KzFIU3lmQk9E?=
 =?utf-8?B?Q3lSZmh1dlp6bTVsUVpwbWZMeTBYd3E1S2YvckF5L0RnMUgrM2UwZHlqam11?=
 =?utf-8?B?UmU2UDJzRklVcGF1dUZ5WlErSk45ZGJhZys0MjROOWgyZEtJUm5oQzBia3RI?=
 =?utf-8?B?MHR3UGVIV0N0Y29hODRiUE1xQTRDSzZwL204dHNtUDkwVVlxSzdGczFrOE0v?=
 =?utf-8?B?VXhaN05xRGlKMHR2Z2d2eGVWUloxOFJPUGJQRzN5bitLM1E1RUFVWk0zK0Z0?=
 =?utf-8?B?bUdpcGNKUGlFbWIzUEV3eXhjVGllVWxweXhJNGlzcnJmQ1NXSXJrZjRBdEtq?=
 =?utf-8?B?WkJuNUd2Sk9GbTMwRHVJU0RtVVRSS0dtRHd4Vm9aWThrMElEdnhRMWlsd0lS?=
 =?utf-8?B?b1JVS3Q0L3lMdXZHdmlFR3lGbWhEV3pQS2VOMityb29mdDladWhLRGExRlZv?=
 =?utf-8?B?RzNhQWVXSW52OG1ydkZ6cnoyakNJVlFnUHhiaVl6Y0NEakYzZFpEQkpCZlNV?=
 =?utf-8?B?bWRPbUxxSUtVd2t4VDNDdHNNMElWeWtuakFLUS83dWZsNldhQkFocHpjNks5?=
 =?utf-8?B?dUo5NEY0bmNkVVJHajRtOTlRUEF0RUc4b2hlaURZWi9sRGJlWm84OWxSYWFh?=
 =?utf-8?B?VjJTbkI2MFA1VlRNSGtpZ0dXUlJZU08xZUdjc0hmY0xoT290Ly9iMUJaYVM1?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 730609bd-e177-4338-8d13-08dc7a34ff19
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 07:58:42.0017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APixPRpn4kdnqNM/DSwGqSWf8ebXBXGarYqR7cWE713jw3qoC2oSSaPTQjcOYDkcmj85qnPvgnRh+9BctCiZdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
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



On 21-05-2024 00:05, Rodrigo Vivi wrote:
> Standardize d3 setup and ensure that it tests with D3cold and
> D3hot.
> 
> v2: rebased
> v3: rebase and fix description arguments (Francois)
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_pm.c | 82 ++++++++++++++++++++++++---------------------
>   1 file changed, 43 insertions(+), 39 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index ced983d6c..90050207f 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -516,19 +516,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   }
>   
>   /**
> - * SUBTEST: d3-mmap-%s
> + * SUBTEST: %s-mmap-%s
>    * Description:
> - *	Validate mmap memory mapping with d3 state, for %arg[1] region,
> + *	Validate mmap memory mapping with %arg[1] state, for %arg[2] region,
>    *	if supported by device.
> + *
>    * arg[1]:
>    *
> + * @d3hot:	d3hot
> + * @d3cold:	d3cold
> + *
> + * arg[2]:
> + *
>    * @vram:	vram region
>    * @system:	system region
>    *
>    * Functionality: pm-d3
>    */
>   static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
> -		      enum mem_op first_op)
> +		      enum mem_op first_op, enum igt_acpi_d_state d_state)
>   {
>   	size_t bo_size = 8192;
>   	uint32_t *map = NULL;
> @@ -537,7 +543,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>   
>   	igt_require_f(placement, "Device doesn't support such memory region\n");
>   
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>   	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>   
>   	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
> @@ -563,7 +569,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>   	close(fw_handle);
>   	sleep(1);
>   
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>   	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>   
>   	for (i = 0; i < bo_size / sizeof(*map); i++) {
> @@ -578,7 +584,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>   		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
>   			   active_time);
>   
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>   	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>   
>   	for (i = 0; i < bo_size / sizeof(*map); i++) {
> @@ -588,7 +594,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
>   			igt_assert(map[i] == MAGIC_2);
>   	}
>   
> -	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	igt_assert(in_d3(device, d_state));
>   
>   	/* Runtime resume and check the pattern */
>   	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> @@ -783,6 +789,36 @@ igt_main
>   					  NO_SUSPEND, d->state, 0);
>   			cleanup_d3(device);
>   		}
> +
> +		igt_describe_f("Validate mmap memory mappings with system region,"
> +			       "when device along with parent bridge in %s", d->name);
> +		igt_subtest_f("%s-mmap-system", d->name) {
> +			igt_assert(setup_d3(device, d->state));
> +			test_mmap(device, system_memory(device.fd_xe), 0,
> +				  READ, d->state);
> +			test_mmap(device, system_memory(device.fd_xe), 0,
> +				  WRITE, d->state);
> +			cleanup_d3(device);
> +		}
> +
> +		igt_describe_f("Validate mmap memory mappings with vram region,"
> +			     "when device along with parent bridge in %s", d->name);
> +		igt_subtest_f("%s-mmap-vram", d->name) {
> +			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
> +
> +			/* Give some auto suspend delay to validate rpm active during page fault */
> +			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
> +			igt_assert(setup_d3(device, d->state));
> +			test_mmap(device, vram_memory(device.fd_xe, 0),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				  READ, d->state);
> +			test_mmap(device, vram_memory(device.fd_xe, 0),
> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				  WRITE, d->state);
> +			cleanup_d3(device);
> +
> +			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
> +		}
>   	}
LGTM
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>   
>   	igt_subtest_group {
> @@ -798,38 +834,6 @@ igt_main
>   			test_vram_d3cold_threshold(device, sysfs_fd);
>   		}
>   
> -		igt_describe("Validate mmap memory mappings with system region,"
> -			     "when device along with parent bridge in d3");
> -		igt_subtest("d3-mmap-system") {
> -			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -			test_mmap(device, system_memory(device.fd_xe), 0, READ);
> -			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
> -			dpms_on_off(device, DRM_MODE_DPMS_ON);
> -		}
> -
> -		igt_describe("Validate mmap memory mappings with vram region,"
> -			     "when device along with parent bridge in d3");
> -		igt_subtest("d3-mmap-vram") {
> -			int delay_ms;
> -
> -			if (device.pci_root != device.pci_xe) {
> -				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
> -				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
> -			}
> -
> -			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
> -
> -			/* Give some auto suspend delay to validate rpm active during page fault */
> -			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
> -			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -			test_mmap(device, vram_memory(device.fd_xe, 0),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
> -			test_mmap(device, vram_memory(device.fd_xe, 0),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
> -			dpms_on_off(device, DRM_MODE_DPMS_ON);
> -			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
> -		}
> -
>   		igt_subtest("mocs-rpm") {
>   			dpms_on_off(device, DRM_MODE_DPMS_OFF);
>   			test_mocs_suspend_resume(device, NO_SUSPEND);
