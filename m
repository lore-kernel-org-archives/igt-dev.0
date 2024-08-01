Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050FDC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 06:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DDD10E11B;
	Thu,  1 Aug 2024 06:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="byNt7Vp6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEF310E11B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 06:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722493270; x=1754029270;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wBb5B7w5gV5UOwUftOIm5UNKB4+AfoJcCOGTiegZgxs=;
 b=byNt7Vp6EXXx1c7GVwiK1DiqYvvxJ4iRpEJPdw5QOrsZWYOhZ4K4Vfil
 kb46IxNfx0dI8VB3oUZd3/yzfVEzblKxSFjbBAeDr+y9Mi9HNV73eMor6
 wF6QuRvrqbQYWFyBHFoqird8M+56KqqKNQYcHkeafyCO3ToVRUeUZgjv2
 sRs1vwoj8T19zYHmG8KYGlAUUKpMP5uzm/vX8Tdm6bWAOm3tTib9dXs3D
 9ir+mFjvCOI1yode/Et1GWfwMvlkZXcrxp1gf0TScVo21T75iWqvWDujI
 IP2gpVhGwL28qXGIJbDQvDAPFPWctjUdEJ6bewxMW6Pw+lZrtDxhLbGDC w==;
X-CSE-ConnectionGUID: nEXyaVKPQQ6LqjCvIBjegQ==
X-CSE-MsgGUID: CFxR9n5sS5SD1qUQdEL9Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20237146"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="20237146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:21:09 -0700
X-CSE-ConnectionGUID: BtUHgkolSxKYaI4N/DzkFw==
X-CSE-MsgGUID: gzSDzPzJR1KlxmWJAizmww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="59960159"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 23:21:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 23:21:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 23:21:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 23:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIn/LYk7vpgcqCwq3vgHn3O2baN8vUgMRyejATZDLIouxwTJOipIYS/fXJ/396+/AIeOukDMRwKzR/uRMOaPr1fsd6JK+fsIFX+fXaph8QaYejEuzvtcDX/PywSQ/umso9l5c3ITnlsjwCDps2nwWSPy7jeXJVKkQ/JWyHr7zoVH5cmb1bFk1SemR5VlDnHCJWw0itmxEVtAqqvq9RR9oY1mDild2JYVIpZUbrTN0qhSq/A8yOMeliY/h/GnPC7gn5v3/eL0dRxY2UA82YexZ/lcUITdNNagwArnQusNBBHmQnM9UgVAm/Id1Lt9s0COECA0NuKpbkSsT1maMN+ayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJyL+gjGSucLMVj++7t9FuVLZwBKNPhkifijpus9mYE=;
 b=tjtyHWXlry250bZwaV202PPwsTlm+4bhR8atLdAw9PJ1OQdhQuZ731GdMcTMwGu4VOzn3SfmOGbFPIixZsuuANBQNzEh3z4AAYdqbh8J/ZGtwOY+SYyjA3DmxOVhHWEgHbzdf+7nGHpVvcSQrRtoeP9QUhPsqnsEGnO2iuHDHzzPiwXYxxzsFpQPvO/eIA1hxxspYUV9B/3Fj3g7iZDKwDMfxxESWMtmyYhKrTo3hjUoi2oWYlVPfTqDVrWDK+JnxrcQJe19TW4BMZUO5aXgprw3/DCbXon9tRu9PS8vExCr95pe4T6UevK6v0qXf2gAyqM3asRsEC26x0G9c/W4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DS7PR11MB6224.namprd11.prod.outlook.com (2603:10b6:8:97::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.20; Thu, 1 Aug 2024 06:21:06 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%3]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 06:21:05 +0000
Message-ID: <90a2332e-5920-469b-820c-9c477b59b7c9@intel.com>
Date: Thu, 1 Aug 2024 11:50:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_gt_freq: Add a wait after gt reset
Content-Language: en-GB
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20240730115058.1104767-1-karthik.poosa@intel.com>
 <122f5ae7-9b39-4e8b-9fe5-2ea57f72cc4f@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <122f5ae7-9b39-4e8b-9fe5-2ea57f72cc4f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0156.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::6) To BL3PR11MB5700.namprd11.prod.outlook.com
 (2603:10b6:208:33f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|DS7PR11MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 66108c58-514b-494d-535e-08dcb1f21ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFpIdk12cC9ZbE5ocnFFOURKK3BmdUszTXRaMlorTUp2VytGNzEzcUhsUk5U?=
 =?utf-8?B?OHAyMXBPZXdRa3h2WXRIaStQMUQ3aXQ2V0xGRzZDYWpPelI5d2dDSm9qbEJt?=
 =?utf-8?B?ZkNDQXVmNWpabkVZRTlQQ0ViMDhKZ0o5YVc2Rk1KNFdpUWtoQ0NNa3YxRG5i?=
 =?utf-8?B?TC9Ybkx1NEhtWUIrbHdYcHEySW02cUZlWlk5M0x3eVhXUGpHbkNHQXRmUXhI?=
 =?utf-8?B?U0s2TVV5RGRxUFBEdVEybXdUNFJ1SWk1bWpQNXpiVVV6amd5S04wWTJhRW45?=
 =?utf-8?B?YjNsVjFwbFFGRHZvQzAveWRRcEFHL1dNRFFyZ3RKUjZHNDMwZngvVEdjQnJ4?=
 =?utf-8?B?bU5rSjI4RGFncEpFV1Y3Z043cGU2eGJaSjFNNC9kWnBDMkpGdm15c2tXSTNP?=
 =?utf-8?B?ZTJsc0tIVHpPRXQxVVR2eUM0NVNhVlZtckdkZ3NOdXFjbEpCQ296UFJRSlZ4?=
 =?utf-8?B?bElPQjVnczlONnV6VGRrL3lCQ3hwU1NPb25iZVlneVZPNEIycW5adHo3L002?=
 =?utf-8?B?REtWOUlzTUo5dWlLeW1iZHVzNkpMZDZFbngwR3pmZWZIM09TUTZsbUlWa3cz?=
 =?utf-8?B?eEZENi82azVZTnF0My9aUzVEc1E1TG1oOENyWkN1YVhhcm9BNFRXQndyN3pi?=
 =?utf-8?B?d3BEaUhJbzR2ZmNrcnFyUkFkditlUFlkeDl4aTJCOTFEZzExc3VPTVdaSFVr?=
 =?utf-8?B?UVpnbDhkQ25vblU1Z2VVRGpxTUs4WG1lZkZ0ZG1pZ0NrN0pTakl6d1ZBMzFZ?=
 =?utf-8?B?Y2lhR0NYMS9hOVdNTGpSTzZrRFM3L0VnZDMzNG1FL3hRM0VWOWpjUUxqelZL?=
 =?utf-8?B?UWNUVGRKbjlYY2JBcThVcWxoQmFVd3pVOHQrSEk2NEI5TkpCaC9BZDdZMVFL?=
 =?utf-8?B?KzEzY0RXVitBRkJ2aDVyek8yVzdvbnFBOGxtSzdqQUhMTjJHU0NOVDc0ZTN5?=
 =?utf-8?B?TEZsRmxaSUoveDltbytlN0NDdk1ZNUx3OGxOby80WUN1OENNMG9rREpRZmxC?=
 =?utf-8?B?OTVaaVZVekdwNEpCMEhNVHVyVExHRVRoOFEydm8yNUFCOXU2WUIzb2JyRytN?=
 =?utf-8?B?MDAyU1Y4NkJNZnRIY1d6MzNZdTRVa0N4NGkzOElZOG05anBzMldQQTdaSkUr?=
 =?utf-8?B?VldhR3lvMkxJcS9QQm5kNXN4a2RPUXYvVTBFdVl0Q25SK0ZYS0dNVk1lVnR0?=
 =?utf-8?B?Ukx2NU1mK2FVRkN5RDRVVm9JSkFhSFJWZkVFUjV3c3dYc2QyaHJaRjc4TVYv?=
 =?utf-8?B?TWd2bHV2SHc3QVgzRDRaeG1JN2s5TlRkdWNkeUlsY3JEM2lXKzV4TVlsUEIw?=
 =?utf-8?B?c1d4Z1Ewb3A0YlRzNzZ1U3NyanIrRHNUNDJpeHVXamZiZWJuZkxXVjhmR050?=
 =?utf-8?B?TGRsRVpPaXVLNWRuOVhzbHJkS1lGSmxLanFqVEx4L2daWUJnS1FFT3FvdXhU?=
 =?utf-8?B?SGdsakpadURYVXcvazRuSHQwNldKR1U5YVpnc3hDdWZLUENrZU1sMDJ1UFBa?=
 =?utf-8?B?MVAxc0tYSnJmcTFUTjlwY0tmUzk1R3A1NEJ2SHNseXNRRmdDVDNzQ1lxMTVx?=
 =?utf-8?B?ZWwzUU1STllpNStOd2ZydnVEVVVnVVNmOUQ0VlJUQVMzMm13cDBta1NWRUtx?=
 =?utf-8?B?YndlWUxiOG5BTnpXQUFNUEhudmJMY3h4a3QvekJIS01iZG5va0QyaGNUeHUw?=
 =?utf-8?B?WGdJalpmWStMTkFuTzNRS1JpQmR3SHVSTlFSN1JJTTNraDEzblBENDk0Tndz?=
 =?utf-8?B?VVo4bmlMaDlkZHhHaEFqOGx1NVA4OGg4c1RZamF1NTlzNW9jeHJJSjR0ODMr?=
 =?utf-8?B?YWhnckkrL1NNcjJBSlMrUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmY3eFhSRU8zZjJIbFF5WUhCN2F5cVdKWEdBQzdBb3N1elpFUFdDM0IxZjFw?=
 =?utf-8?B?bzRjZENkaTlCeElNWWM3R21Kc2RwVngyU1ZkeWI5enZrZlQ1VHI1MG9mbS9V?=
 =?utf-8?B?Wi9vM1BqQnZzNVVUVEhucDFvTy9ZRTJRSm5kOC8xSXZsOEJiM1hidG55U3Fh?=
 =?utf-8?B?MkkzM3hSaWUzeDVGMmlMaDQ4YWZ5ZDFoR1hJLzJaZHlyQ0RnRXRKZElIa1lG?=
 =?utf-8?B?Q3A2TXZ3TnB0bVNycmY0bVVBN0dNMDBwOThHSk1va0NCT0J6dW4zZjhDSlht?=
 =?utf-8?B?d0h4d0ZWY3MzNEVxaktabTRhVjVEbVc2OFNLNHNYZFZiZWJWWGFGWG9Da21w?=
 =?utf-8?B?bmNyek0yZHdBTEI3ekhQUWNGT3JmNDJ2MWc3dDdpVVN4VmliMVZ6Yjg5bXgx?=
 =?utf-8?B?MnNlQzQ1djloanYzbDNlRVoxRzMwQTlub1JjY0pCTUZhb0k2bUQ0TUkvUVF3?=
 =?utf-8?B?Y1RmOFpiNVJ1ejFTell1Y2ZwZTB5ZXUxb3pGOXJFSC9LK3ZFRGEyRGNXYWxo?=
 =?utf-8?B?WXM5VzFiUUR5eGV5dDltWFhlZnd3clg2cVpvNW9RbG42SmtneWR2WjZjajU5?=
 =?utf-8?B?anhBb2VZWkRpNXNCSjBPenluL3ZQem02NXVxbXlPSmY5SFpVZW9WSS8vb0pI?=
 =?utf-8?B?WVNXUXVvRXpvdFlLQmRzbUw2OTBRWk96V3MxMTJPMGwzZmpiU0xNb3lHM1NR?=
 =?utf-8?B?czVWQUlSd3Bua2JrQWJLeWJxbkRTNUoyWmJ1SGdTNzJWMEVPQ2FSUEQ3bUFW?=
 =?utf-8?B?NDdTNE16Ni9XbThwOG5oc1BQZDgwc3VmZStTUUU4UjBPRXROZ3R2V3lzR3Bx?=
 =?utf-8?B?Zk9wZ0dza1BRcy9obDRzT0pTVXFybTdHZE9ZVC9XUUNLTkNaSWJTVHBmVWFa?=
 =?utf-8?B?TVkwSGtVbnUzWXRRVEZ2c3JNc21LQnR1YmpWZU1aeGR5dm90Lzh1MHpqb3RG?=
 =?utf-8?B?MTNiemNObEZjcVZDQmU2eXZIRUIycXBKS0hEdHBoL0hyTUdPd0xaTVdvYndR?=
 =?utf-8?B?TWlyejNaL2I2RExiZE9DM0ZlOW41WU51eXBMd0k1bTI1NEwrT3BPRlJKelJH?=
 =?utf-8?B?MHBicTZwS2doaU5WYy9zaktzRE1IZGJtNm5Wd3dUc0Q3RzZ2SEFVTERudjBr?=
 =?utf-8?B?ZnV5WW1LNnRtYTN2ek9WdXp5Zm5RME1mUDg1MC9oc3daRFNIbjBvUytrVDJq?=
 =?utf-8?B?RFdTaUNaR2tXbXJSaFFOcFBJR2hTSk9PNUJxTnNKd1RSeFJWRWlWeklyeDQx?=
 =?utf-8?B?aUk0QzhLRmxHN01oNmxQNStDbUNsd1RDQnU0K3ROcmt6NXRDTlZxTXl0R3ky?=
 =?utf-8?B?VkE0NDlOQk1Tbzd3TjBRYkgzamVmMDBUK3YyMmpLa0FiWkxydXNFbXdKMHp0?=
 =?utf-8?B?bFZLRVA3Wm5hQ21QQk1NTXY0cmQ3TXNjaEN3dTdZdGxjTHF1aXJGb0tWUnNj?=
 =?utf-8?B?UHh3ZGJtbCtVcXlwOUQwSkkxT0FadC9rVitnT3JFUkZhTitsZXhLQ1k4QTg3?=
 =?utf-8?B?WG16NHRQd2VybU4vWCtqNWpWSWJpUk5ELzVXbmF4UGJyb2VKTm81d29ML1NY?=
 =?utf-8?B?OTlBNk0zcGV0WU9TVXVkQWNMVXQvNDA2VFJVZXp6cmt4ZDIwR04wS0I2bGw1?=
 =?utf-8?B?ZmRDVTdYKy82aWhkVHpxd21ERzFJV0daUjRlY1JpTkpoUlluUlNKeVpxTFNY?=
 =?utf-8?B?dERuRG5rcXNYSUZzdFpSRk5mbGxURzJqbHc4U1oyRXJIUlFYZXBvNVFSSDJG?=
 =?utf-8?B?QWZQRDNVTUdOdC9vM2s4aTQ2aldNeUVwOFJTbzhSb2hMZXRtU0VETnRoVFNH?=
 =?utf-8?B?cHZrRmdGRlBZM1N4Um9ybWNESUpTWThwc0JNNGptVUw1R1BRS1ZGRzNwRHdY?=
 =?utf-8?B?Ti9oQkQwajZTdjhXdGgrVHRFdjg5N1BTTzgxTmtMaEk0UVdTNjB2bXJjU3JH?=
 =?utf-8?B?SGpZR1J1WXRVdkhXVTVsUytxb0F6M0N0SGNwY3psOVZ4clVYODNNOHZQWkF3?=
 =?utf-8?B?S2N4MmRLdnlvTldsSVRmSU53aTVsWi90dkkyV3IwK3FyQ2RFTTQ1U3VZWWVW?=
 =?utf-8?B?RWxJV2J5STgrbncyNXlSZHlXbkY0U0E5a3hoQUdKb09PZ2wvU3RUYnQ0L3hn?=
 =?utf-8?B?MURBbGVRT2lqNU9DU3FsLzFrL2UyeFBZK1k1VUM0NnErRXQyaTBrY1RyRXpN?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66108c58-514b-494d-535e-08dcb1f21ee9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5700.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:21:05.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDGix1T2tbZnZWLWSHLgxN56kCAXKzR1YckRdkNxXPAi8+tzEKaZntLef7nWDoRWAYEaDMD1UlKSlsX6s2uCtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6224
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


On 31-07-2024 16:06, Riana Tauro wrote:
> Hi Karthik
>
> On 7/30/2024 5:20 PM, Karthik Poosa wrote:
>> After reset min and max takes sometime to get set to rpn.
>> So add a wait of 100ms after gt reset before reading
>> min and max frequencies.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   tests/intel/xe_gt_freq.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>> index 93ebb5ed0..718f720c0 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -33,6 +33,12 @@
>>    */
>>   #define ACT_FREQ_LATENCY_US 100000
>>   +/*
>> + * After gt reset, min and max freq may take sometime to set to rpn.
>> + * So adding a wait of 100ms after reset.
>> + */
>> +#define GT_RESET_FREQ_LATENCY_US 100000
>
> Both ACT_FREQ_LATENCY_US  and  GT_RESET_FREQ_LATENCY_US  are same values.
>
> Why not rename ACT_FREQ_LATENCY_US to LATENCY_US and use that instead?

ACT_FREQ_LATENCY_US is used between set_freq and get freq without gt 
reset in between.

GT_RESET_FREQ_LATENCY_US is delay after reset, so kept it as a separate 
macro.

>
> Thanks,
> Riana
>> +
>>   static int set_freq(int fd, int gt_id, const char *freq_name, 
>> uint32_t freq)
>>   {
>>       int ret = -EAGAIN;
>> @@ -318,6 +324,7 @@ static void test_reset(int fd, int gt_id, int 
>> cycles)
>>                    "Failed after %d good cycles\n", i);
>>             xe_force_gt_reset_async(fd, gt_id);
>> +        usleep(GT_RESET_FREQ_LATENCY_US);
>>             igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
>>                    "Failed after %d good cycles\n", i);
