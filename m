Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7524FC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 13:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2476010F074;
	Fri, 26 Apr 2024 13:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+oA+B3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC5010F074
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714137261; x=1745673261;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/g2tohNHr3AjqvBiIUETqN3fuFVNT/Zv8GtBWvimVCg=;
 b=n+oA+B3IBQZFrK82adeXYCo551Fvi9QX7KoBV3IpBFu6vX7/TPIb+a18
 gUB96VD5ljkG2Nzj8uHaXhANnvAxvjWPFKmzib9dor/Cg/e775KCU4KkC
 CVnr+ctyASpVJ29QST9mCCCoCDFmljjWquXjmsnjAVJD0ytVSPJXm+LOr
 nHYgV2Newi+aEYj5YtuOx0wQHrQoxV+rHRUxZ3hm2FU+AJ/pZcN/swAEX
 2xxePAriGV6WyWlzW//mG5Rm/xK0Sh8gikaeXKT5bhzB7gNgydyCM0Yqo
 qb4qfYcAwEbMwW6kiRMqGgeE8qljcHhOL42nQ4SxmqHgtvt9+FtPz3hlx A==;
X-CSE-ConnectionGUID: xqPLNBlpTBmsFwmltlfmaQ==
X-CSE-MsgGUID: Fhnnu/wJRfKqo6UT0t0Gnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27325186"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="27325186"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:14:20 -0700
X-CSE-ConnectionGUID: WrIqrajHQFC6rDDtdqTxLg==
X-CSE-MsgGUID: DtXgvLeLTrmSknXzEmqZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25382994"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 06:14:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 06:14:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 06:14:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 06:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYYIFd+Cg0akuYqmeStUCK3P6K36pUpHwo+CId4JISkEndCSDCPaSk3jf9FJHsjS3JBS7DGHm8LqOTYSKXRWxKka/yxs33+oLG0d5oNPl/fJFzhgleVtjroKRQcPNK4XlPrbhBO4cbMzlZOItivG1ozZAc/O/I4KEAzQip08xqESUOluFOLgkO3ZgIZ9wL3V0kL1VlIQympSQHFtSSn79FvEri9OKYhGM5Da2llADKzcjHF0c7KNxHf7mMopq3FTKF0PqPFDJ/NHBoeh1U+yfMAd67/LoO2LjbM+M2FbujeRX0SfekaxmMP8cULwI10wTUC1YoE0rAbfFDBu83ntXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILZ6h7z+wiGyY2gSX+VOxN3U08/rVh6jXoR+R97kQgs=;
 b=LrpuSc/+tTGTcEo7I1d9/LHWXtuD9VC7dSF5sZF27n7oG+NHAH9E9rHPJUg4NrCZ/gr5Tt8MuHQPoGMNGsDmbeOZ5QHmQPW29pcWigjMaqsQBkzvPcoJGvCKsjnZCeuhPVcZNTc6TcfJy82b5dWXBdAg9aewDuEe85w3xgFQtPpDNFHibdTuWPhZWwhP6odI1gJdu5OV/gPP4BVG5UwiZUrqE4NbPMF/HvfkOzmofHkxogTpAHlcIVJaJJ4Cl/lIxsOXnfOQpcrJnspILnsjet3nWprJf0HSyIelpw72q/Xr7NMQd4HymiXN3rSUeNwu/f+PGDaObdP75aC9vRwDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 13:14:12 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 13:14:12 +0000
Message-ID: <028c9697-63bc-4cb0-9b5b-6ca5d07199c9@intel.com>
Date: Fri, 26 Apr 2024 15:14:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 07/10] lib/intel_cmds_info: Define tiling macros
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
 <20240426090117.78060-8-zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240426090117.78060-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0321.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::21) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|IA1PR11MB6347:EE_
X-MS-Office365-Filtering-Correlation-Id: 21066c7e-0fb7-4715-bd4a-08dc65f2c391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHVuRm9QSlVyZE9icytrOHBGVUZMazRINzVwcDlJVDhiZnFHWWRGa3RCbEJC?=
 =?utf-8?B?ZDNKaHlsZmdMTlovdHJXRkdma3IyVHVUaWFWaXBTNW9uZ1VLVEYyMFlSSWs2?=
 =?utf-8?B?NEh0WW1JcjFiU1YxeGN4bXFrdGcrYnBCT05iOW4rUmxLV2N4Y3JQWjRMMkFD?=
 =?utf-8?B?T3pGb3U1YWRJdEhrTmVKTVZITTl1Ynk3U2k2UDZReGsxM3ZreW1iNjNTZnBM?=
 =?utf-8?B?MitYdW9FSGUrUGN4QjFhNGc0ZUNzUVdDTlRTMFFFN21LSDF6aXdiclR1anQ5?=
 =?utf-8?B?VUJuL2xiWS95V2N6V3l0TTN3dVZ4SlBVeVluMkwyWmxKTTRMY3I3UFJ3aUpk?=
 =?utf-8?B?YlhxaHBlcGdZTExkZEdoc1N1STl4UDEvd2tnbVEzZmZGNTNiOFEvRlZvZks3?=
 =?utf-8?B?THdCdDYyVm9xd3R0U21pMTdWc3ZqcTNFVENORTVTbFNiRlZlM2FBOG40ZktL?=
 =?utf-8?B?elpRSzhsbDRjdWkxdTVBT1FTdWJkczEyTHN0dnpBOXR3Nk9xOU1FWnFONEMx?=
 =?utf-8?B?QkMvYzBTbFFoM25YUUxoblpKMERNYVhhVzNIeGRBVlluM0puQnlETVJDTHp2?=
 =?utf-8?B?QWpiWVJtQ1J0MWNQdWN2R2ZlWGZHbFJTY1VKZHpYWEFPUWhvRzlEbDQ0MUc5?=
 =?utf-8?B?ZjROK0hyNkZLVmxGMWhYa2hJeTJnTUdkRnk0aFI2L3U5RzBmcjlhZlRzSlFP?=
 =?utf-8?B?U1VLNzM0eEYzc3hDMHQxOGVweEV5TGN4LzVIT3hIblJUcTVuUmhucnFkQ2Jz?=
 =?utf-8?B?d0x2eFpLcGNyQStVVE5DMlVUYnFYQ051djRieVpTeURjL1VSd29zbHdjV1FT?=
 =?utf-8?B?bHJjWWtKaE9rVXV1bitxSWg5SU13YlkzWEdWZ2NySUwxeHNHUnhaSHB1a1V3?=
 =?utf-8?B?SkF0NU0zdU9FRTdja1BwUHkxcGpGTC83Rko5dU51RDkxanBVRVEvdjBCS0hH?=
 =?utf-8?B?N3pOWVo0bUtEWDRQOEtuWURuQmxHWjYxTG5tU01wVDVrNm1iVC9VRDY0eXNZ?=
 =?utf-8?B?NXZES2RBRUVOcWRZZkF5RnFLZGF6czJaUk9VTmVSV1FCejdsdlJESVRLTXRl?=
 =?utf-8?B?V1dpRitub0kwVENyT2k5clJMR0VrbFY3RkNud1hVZDk5a1VMVnU5enVpaGMw?=
 =?utf-8?B?a0JpcnVjUFozbCtzS2J0eE9veUdTamNCd0FkRmxzOTlLYXNQY3RBUVBRSEpq?=
 =?utf-8?B?OWZwNUhKRXBsM2t3QTU3a0FtNnc3bTd4ZFFKWFhzejQrN3ltWDVQVEhUL2Fh?=
 =?utf-8?B?VGw2djFtUHVaVUlJYkdvNUpZQmFuRW90MDI0S3B3RE45cWdEOGpuV2lyRmJT?=
 =?utf-8?B?SFMvVW9ZSFZ3c0NDL1l4cC9XR05kbU5ibng3ZmpUY3BtOVB1cGFRVFdjdTk5?=
 =?utf-8?B?N2xBT3h5a3pycnpQWTY1am01KzZMZVdOelpsSXZObkZBMEx5UFpEYWppMkpP?=
 =?utf-8?B?aEVJeGxhSnBySTY3aWhLQnNldkpsbXNVUnhMbUhBY24vNll2RE96a3JYK2hP?=
 =?utf-8?B?RmVOdW95NG5QbjNSY3BDMjJURXdjS3dJZlBjd00zUm04VmlGMU9yYVlJbURi?=
 =?utf-8?B?YXZxOXpRQ1JQZzNmVUtOQ0xSbGNOdHFVL3JOSmhJSHFnSVdDVm43THhXSXo3?=
 =?utf-8?B?TXpiNVNVYTBpK0pFamJ3WTQ2L1ByeVoyK05hbE1kdjBBQXl6YWRnZGk3SXhJ?=
 =?utf-8?B?WWdzZlhiVENNdC9aTEJEaHVieUFQUTBGSWdSb0VnOXR2VVlUcFcyb3ZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1p1YXJRK3o3aDJCZjdFT3hIaitWYVFxOFk2QVBTMHNtdXdGSCtoMWxxS0pD?=
 =?utf-8?B?bHJrS2ZjN2hQT1pCajY0WTJFM3UyTDJFNGJkTSs0ZXV4TGgzZTJVYWNyVU9U?=
 =?utf-8?B?d1hIR3pIc1dzRkJlUjRRZXdmelJNUW1yZVdmV2t0UXVKcGhsMXRmUU9GYnl2?=
 =?utf-8?B?czhLWldxOEJSV3RjK2tzSERDV040bzFOeWpBNTNuQVllcVU5aU5Fb0lEU0VI?=
 =?utf-8?B?b0p6c3BhRXNPamlpSnBzV0xvYUFDWW1CUkRndTFDWEM2ai9jRXNNWmtkTHRP?=
 =?utf-8?B?Vm9XbHdRMzFVOHM5a21OdnlZZU9aUnc1d0Rma1NTTGFjNTQzallUVW5lczNG?=
 =?utf-8?B?eXlzUkhNU204dFdGdlRRamFFQSt4MDVqaVlYNWY5dGQvRTM4bStCOTNNZjVl?=
 =?utf-8?B?Z3ZDRzVDOStHcng0clpPM1E2N2tvQTRSa0VXTG5wNFN3QXVXYmpLVGcyOGFv?=
 =?utf-8?B?VUp5TkpWUEtsd1NqcWZWU2RtVVpmTVo3dDFodVpTTDZQbTNMekpxT0ZDU1Q5?=
 =?utf-8?B?ODJCekM4MTNZNFRDZUw5U2JQdVBXaFRnYm10am5oMEdaMXd5alo5bTlhcHNk?=
 =?utf-8?B?SHNoQW1OelNFc0laZ0lSd2FjMVlJbHNtY1FBUXFSRHBwTTNZVE1XNzQ1Z0ti?=
 =?utf-8?B?VGlOakcwOXduZVVLVFErWk5JM0lxaU4xcjBlZHQrc0dTM1VrTkRDMTBJcmh6?=
 =?utf-8?B?Z1VnWnJZMTMzUTFoeXFBa1I2ZWkyK1RkendRN2x6K0dlUCtocXZ1SVdHTjFy?=
 =?utf-8?B?Y3JkQU14TVNCSGs3akd1eGZhZ3RPM0h4RXp4STExRVUvMlg3YXp2MDUrUlJh?=
 =?utf-8?B?T2JGcUN1YlUxbWY1R29zZ2ZUQ1lGdjhVWEFoVmIyZHlMdUd5UXdGWW1jUDdO?=
 =?utf-8?B?azNUeSt2aURLcUtNNmFoVEk4WG9WZkRmbHpPampDZ3JJMzA4a0RwN0ZEL2F3?=
 =?utf-8?B?MDZmak5ZWGtlSEp4QXVDY3cwUndlaHdSVHlDMlA1ekZLbk96VmxQdlY3TzRm?=
 =?utf-8?B?R1VVT1A5bVZIbE5QV1ZoYnd6OEJKNi90dW5SR0hlc2hJNFRqN3J6TER6c1hB?=
 =?utf-8?B?WU9zSEQzU0ltSWp0ajd6a09LdThKQktsaXlaTm5jU3BwaFI3VkJWVGtaZ1Ew?=
 =?utf-8?B?a290dXk5RzI5dFl1TW9YREloT2plT0EyVlJtaVl5K2QwSisrREpVRUpacVlU?=
 =?utf-8?B?VVdHd1dIQkxKcnNoZ0tEN2t1WEw1b1AvWVJxbkVxWGxKMzRnWW4wbVNLMVJn?=
 =?utf-8?B?eWtKYmJZVGxWRUVhQm1TSFhYMEtqYTNORkIzWDVXZlg1TEJSa3NCUEhlT3BX?=
 =?utf-8?B?bTF1bXRoMnFlZ0FDZXc0cVh4KzZIa2ZjeTRCOWJLUkVFMmJPOHBBN21uMDZl?=
 =?utf-8?B?RmxNemIxWGVmbkdKVlRuU1JleXpNN3h3d3dscWtHVTRiYmFlcXp5c0cxTERD?=
 =?utf-8?B?Rm4yU3UrbHIvalRod2xDNVVVVFBKRXdGQWdWVnk2QXBwUjFZSDVTcnJCM1Vi?=
 =?utf-8?B?L1RLRzM0U01JNE1yd1ZVNjR1RExqOFd0VHJLSVBLN0Z3c3U5M25KME1FK3Nv?=
 =?utf-8?B?ZFZXK1hvSEEvTk9LQXMxL21ldXpuam1tby9JZ0tmY0FveUEyWUNUeVJEekpP?=
 =?utf-8?B?ajdhWVh0SFA2S0V6bkRrdkhyanNESUw0UWRmK2ZZYjdwN0dhYURoOWdnZ0po?=
 =?utf-8?B?eXN1Ny9lVmYweTI4RmIxQkNlaTV2V1N5WnNsQXB6YmtWcFIyZjdScEs1MkRj?=
 =?utf-8?B?TjRPUFNhUzFUNmlyMVFhdmtXdmc3RE1OUEhaaW0zTTVpOXgvSGJHR0FOaUNY?=
 =?utf-8?B?OHBtM2tpbndZbGRqZ3hUY3poQ0FseWwrRnZhbTd5elJveGF4dWFBRWVNUFNI?=
 =?utf-8?B?cy9jWmEveDQwN2RXV2NPdStYU0NxSjdTZ2ZxdmxhNWZaSmRCSFEvcjFlU1dn?=
 =?utf-8?B?Q0Zma3JHOThDNU5sa05Pbm5iMUtQT3RZN3Z4UlBzckdjK0ZNNDJVODMvWDRC?=
 =?utf-8?B?SzIyNUZYc05jbEN2T3l2QU42L25ZNXRTYmZVOEJuR0dIc3lGQzRTdUdXdjMy?=
 =?utf-8?B?V0JKRGloSzF3N2ZJU2xsSGF4NGRJSmcxaXlDK2VvcXFKK2NWYklyd1I0UkJQ?=
 =?utf-8?B?UlQvbU5JQ2J5U3ZOTWpObUJtNlQ3MS93eUEycFBCUnkrRW1uMGZ4SVJqMEd6?=
 =?utf-8?B?Ymo3bWpJWHhMT1A2VSsySkttTUZ3RWw0TFR3a3B2TFBEejlzU0ZiN1BCTjB5?=
 =?utf-8?B?cGZrQkxIb1ovck1kMDNqSkgrUm1BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21066c7e-0fb7-4715-bd4a-08dc65f2c391
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 13:14:11.9791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4YcK1pLNBUKiPa4lZHGapoq3EwrKb6LtbOtQKi0c0ExVM5Me1LTvfpZy2SnG13R+45C4XpLhA2sabuMohYJGc2OpzFVkmr3pJ6ozt1hilg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6347
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

On 26.04.2024 11:01, Zbigniew Kempczyński wrote:
> Blitter tilings don't always matches supported render tilings so
> it is necessary to add separate fields for this purpose. To avoid
> multiple lines where supported tiling is glued with BIT(tiling)
> it is worth to predefine them, especially they will be used in next
> patch related to supported render copy tilings.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_cmds_info.c | 107 +++++++++++++++++-------------------------
>   1 file changed, 42 insertions(+), 65 deletions(-)
> 
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 669d3e5006..2baac54c28 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -20,75 +20,56 @@
>   		.flags = _flags, \
>   	}
>   
> -static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
> -static const struct blt_cmd_info
> -		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
> -						BIT(T_LINEAR) |
> -						BIT(T_XMAJOR));
> -static const struct blt_cmd_info
> -		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
> -					    BIT(T_LINEAR) |
> -					    BIT(T_XMAJOR) |
> -					    BIT(T_YMAJOR));
> -static const struct blt_cmd_info
> -		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> -					      BIT(T_LINEAR)  |
> -					      BIT(T_YMAJOR)  |
> -					      BIT(T_YFMAJOR) |
> -					      BIT(T_TILE64));
> -static const struct blt_cmd_info
> -		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> -					      BIT(T_LINEAR) |
> -					      BIT(T_YMAJOR) |
> -					      BIT(T_TILE4)  |
> -					      BIT(T_TILE64));
> -static const struct blt_cmd_info
> -		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> -					    BIT(T_LINEAR) |
> -					    BIT(T_XMAJOR) |
> -					    BIT(T_TILE4)  |
> -					    BIT(T_TILE64));
> -static const struct blt_cmd_info
> -		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
> -					    BIT(T_LINEAR) |
> -					    BIT(T_TILE4)  |
> -					    BIT(T_TILE64));
> -
> -static const struct blt_cmd_info
> -		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
> -					       BIT(T_LINEAR) |
> -					       BIT(T_YMAJOR));
> -static const struct blt_cmd_info
> -		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_XMAJOR) |
> -						 BIT(T_TILE4)  |
> -						 BIT(T_TILE64),
> +#define TILE_4		(BIT(T_TILE4))
> +#define TILE_4_64	(BIT(T_TILE4) | BIT(T_TILE64))
> +#define TILE_L		(BIT(T_LINEAR))
> +#define TILE_L_4_64	(BIT(T_LINEAR) | BIT(T_TILE4) | BIT(T_TILE64))
> +#define TILE_L_X	(BIT(T_LINEAR) | BIT(T_XMAJOR))
> +#define TILE_L_X_4	(BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_TILE4))
> +#define TILE_L_Y	(BIT(T_LINEAR) | BIT(T_YMAJOR))
> +#define TILE_L_X_Y	(BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_YMAJOR))
> +#define TILE_L_X_4_64	(BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_TILE4) | BIT(T_TILE64))
> +#define TILE_L_Y_4_64	(BIT(T_LINEAR) | BIT(T_YMAJOR) | BIT(T_TILE4) | BIT(T_TILE64))
> +#define TILE_L_Y_Yf_64	(BIT(T_LINEAR) | BIT(T_YMAJOR) | BIT(T_YFMAJOR) | BIT(T_TILE64))

Nit: I'd define simplest macros first and then follow with more complex
definitions (i.e., TILE_4, TILE_L, TILE_4_64...)

I'm not sure what to think about these defines. On one hand, they are
nice and tidy, on the other they can't be reused or coupled together.
Ideally, we'd have smaller pairings that come together and are used as
puzzles when defining render/blt info, but probably would take some time
to implement it nicely, so I don't push for it (...too much)

Also:

TILE_4_64 and TILE_L_X_4 are not used until patch 08/10, so I wouldn't
define them here, but later on.

All the best,
Karolina

> +
> +static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, TILE_L);
> +static const struct blt_cmd_info
> +		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X);
> +
> +static const struct blt_cmd_info
> +		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X_Y);
> +
> +static const struct blt_cmd_info
> +		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_Yf_64);
> +
> +static const struct blt_cmd_info
> +		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_4_64);
> +
> +static const struct blt_cmd_info
> +		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_X_4_64);
> +
> +static const struct blt_cmd_info
> +		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_4_64);
> +
> +static const struct blt_cmd_info
> +		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY, TILE_L_Y);
> +
> +static const struct blt_cmd_info
> +		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>   						 BLT_CMD_EXTENDED |
>   						 BLT_CMD_SUPPORTS_COMPRESSION);
>   
>   static const struct blt_cmd_info
> -		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_XMAJOR) |
> -						 BIT(T_TILE4)  |
> -						 BIT(T_TILE64),
> +		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>   						 BLT_CMD_EXTENDED |
>   						 BLT_CMD_SUPPORTS_COMPRESSION);
>   
>   static const struct blt_cmd_info
> -		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_XMAJOR) |
> -						 BIT(T_TILE4)  |
> -						 BIT(T_TILE64),
> +		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>   						 BLT_CMD_EXTENDED);
>   
>   static const struct blt_cmd_info
> -		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_TILE4)  |
> -						 BIT(T_TILE64),
> +		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_4_64,
>   						 BLT_CMD_EXTENDED);
>   
>   static const struct blt_cmd_info
> @@ -102,17 +83,13 @@ static const struct blt_cmd_info
>   				       BIT(M_MATRIX));
>   
>   static const struct blt_cmd_info
> -		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_XMAJOR));
> +		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT, TILE_L_X);
>   
>   static const struct blt_cmd_info
> -		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT,
> -						 BIT(T_LINEAR) |
> -						 BIT(T_YMAJOR) |
> -						 BIT(T_XMAJOR),
> +		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT, TILE_L_X_Y,
>   						 BLT_CMD_EXTENDED);
>   
> +
>   const struct intel_cmds_info pre_gen6_cmds_info = {
>   	.blt_cmds = {
>   		[SRC_COPY] = &src_copy,
