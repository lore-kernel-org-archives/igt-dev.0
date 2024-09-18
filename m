Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA224CCD1A3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CEF10E237;
	Wed, 18 Sep 2024 12:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLjbuNfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCA610E237
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661260; x=1758197260;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ab55bpgk80C971EOivx3OsrNJEhkgPIiaj17aGioCxg=;
 b=CLjbuNfhQT0s495HEV7hafOA5ro4Kt9D6aklHpUIsVekXwmarunW5Us6
 IhsGbIbQ4z3F3raAkZ5fG2/KeH1JwhsSj4GSCXFOBBcSSIJ7WlHWWJ7Fk
 9xBBpTKPzGByiRSs4yE/N0g3O+AC7DLn/tB5rhjzxmz13zsM2FobT3RFB
 j98MczNTAqhh+amy9ScOO/z6yLANy/58TO2NguIvmiCJ4C8FISjqPRrTj
 nQYmgQ3tZLYoAABJRGkpeBNYF7sZgtT7wzWPALN427PLZdth37d2Nt1DG
 tGVHgBrSzbIM3JUdpc81uDRfHHBGSkm7yHQaD6LgZ67BbuN1VaC4fGBOr w==;
X-CSE-ConnectionGUID: VFUBPNWnRySikP0rEFm8NA==
X-CSE-MsgGUID: DE6FqBVjSG+Lm6FbjRuTmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36928747"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="36928747"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:07:40 -0700
X-CSE-ConnectionGUID: YUtdqp7mT4WaiUDJRCwZiw==
X-CSE-MsgGUID: tJIEQ9cqSwCGqaOUumRjMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="70346427"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 05:07:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 05:07:39 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 05:07:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 05:07:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 05:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzF3IJ2Zlk1p9LH07B/vkNkxulxF3ra6zHup26kzaYcN1blsN5X/o/F/rhzkdRx/G9zwsKDYlQ+Znkyw9XsoZpmik8nW99/MwrczgE2tNhybbXRqbQUg28xe5DBSOGNtCgyDVmNHgjp+1kkDEDegUemrt2Aov+mNio4YS6orbQIzNesQqmLPwHu5xNwg3WhHmiTOZh4jjDg5PH7dO5HW0nkmGogDfneeVhR/BmZpdBtlMB26r0w2iRYx+p6+/Hi+SVBO4sk7DFZyUXfB2jPttvMfoqJpl3GnuV20SoSu4heV4gNLX7hPNcMsVol2CImK99TRmm8LyOqUzFQeLF92OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9gG71ljHC1IfdUTTm5//mzOZzzWJBDgnEVInsD/fBY=;
 b=gFU6DNrlPPfgg4ua8gLMrMbqYJ3e+MsSyYK4YECubhQW6Q9krPy0VpPqkLOZxLOTq9UfVB4uD+03H2x2E6d2IMTtceqWNbDpJUgv1He47ylf5iELuhW9F3etS3tNj0IukfOrKYYfVukniGLM7nCAMzmFgdHvOE5AZiwp93z82PyQ7pi9IUMP/zM7W1lhG4xkJr5iT64errPO5SKcYSP9Kdt+d/+EUBzgiyEh5iOOsFkCrTGkZp7ahhrhiDLBfDEtV4m+XdhBwizome6qzqkXCh4xz2HqSadq+I9b3OW3n3lR4CPCMGrsgRQ5VCKN7vtU4OssxOfMFmODTj3v0gvVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by IA1PR11MB6123.namprd11.prod.outlook.com (2603:10b6:208:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 12:07:36 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 12:07:35 +0000
Message-ID: <0986cec3-65de-41b5-8a46-29f5aa25e728@intel.com>
Date: Wed, 18 Sep 2024 17:37:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf
 test
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20240905134259.1155164-1-pranay.samala@intel.com>
 <6b195d7c-caaf-4dcc-b179-f0de7d7b2562@intel.com>
 <PH7PR11MB6053BC8D42C3E6FD4C27FED6E7622@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <PH7PR11MB6053BC8D42C3E6FD4C27FED6E7622@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::17) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|IA1PR11MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 55dbb350-b38c-4db4-7e64-08dcd7da7b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnEyVDNpcjZ1WUpkd1ozUHJNRlE3b2wrM0xsNWFocllmS3JTbG5KaWZNZUxu?=
 =?utf-8?B?RHBycitZNjZyakNkbkJhTDBXZEdZN2ZoeXJJNFE4UTFLVEg2LzZHNzc2dmh4?=
 =?utf-8?B?RUxDU2s4ak9IWjlWRTBraUx2ckVOdFZCd2U0a1RMbksyTG4wUHZCRC9sQXFS?=
 =?utf-8?B?WVEvUVdtYWNXUGlzcjVtVkFEcnRBaXIrQmU1MU5HekNLcGdWUnhkZ0lwK2Vx?=
 =?utf-8?B?VE54Z0hzMkZaZ2NMdmpSck5OcHl5d1ZiVzN5S3BNWlBVZ3k1QkdwaDhNSW8v?=
 =?utf-8?B?Nmk1bEVBSlhyUElWRE0wQWZBdENGekU3OUFybUlqam9aL3ZKUVpuK0VJbXlV?=
 =?utf-8?B?anFhWjkrTG96YUdtbkhPZEkyNEw0NXVLK2F1L2UyQmN3cmJXWi9ZeEowRG1o?=
 =?utf-8?B?b1JocnltWmlvL0dqNCs2L3VKNnlyektOcW1vN1hpZklQRFBsVG9zZEJ4RGh1?=
 =?utf-8?B?VVVjM1R5U2F4MU5DVmk5QjdNUUtpTlMwclZoL1liOUViTFRuUWJ1T3I1ZlNk?=
 =?utf-8?B?YkY2blhvb3FxeFgwVGxRdi9qVjJhS0l1WWNCQjExbkdISUh3YS9Oa1BrcFYz?=
 =?utf-8?B?bjF6bXplQlp0blkyZ2dzTDZkc3BQN2RTdTNHSXhJKzZWS0xMRGxKT3p2citq?=
 =?utf-8?B?NXd3UGlxazNrbDB6a213Nld4YlZJblExdmtTQks4c3Qra0pFYUdNdWd4cnZU?=
 =?utf-8?B?UG9JbEgrUGcwWXlmWC90Wmp4eE1vM0Z5ODdZUWR4MTloUEg2Vnpod2VydzRT?=
 =?utf-8?B?WG5uNVc0czNmYjFqdXc1OUVYUFV4dkdCaDFLNDRkUXBmZ05iWXl3TVo3U0s5?=
 =?utf-8?B?MUxST1M4ZHZoTGZ6K29FOEZHc0dSNEhialZ6ZFduVlFQZHFxVnd6MmVyK1Y0?=
 =?utf-8?B?eC9hZHU4Q01xK2VKYjdaNGdwMDZKOGsxSnhRcFYyZmFEc3phd0JVZlo2QVV3?=
 =?utf-8?B?dVFUckZIVlE1MXM2Z0dsZ09Ga3dqT3pVOGtEZXVDRVNrZUFnRys5SmMwaGVz?=
 =?utf-8?B?aS9iYjdvTjJTT2QwbjZGUnA0OUxZdnZ5SDR6T25lWUZ3WUd1Q01JT2dSbnhp?=
 =?utf-8?B?d3V5cTljWU50bUFQUW5yd3IrMTlsMEpRZExwakExRmt0Yk9ONEFjNGFSN01z?=
 =?utf-8?B?UTBVRW9tVllKT3BtRVlOQmVEOTdjc3AySngvUnE1eDhGZU9DOWVsclh6Umlo?=
 =?utf-8?B?dnlzR052SWp0NUprRmJOcXNnZFdxMXZKZHdFcVRLSEV1eVRaQmk3VHh0b21Q?=
 =?utf-8?B?Q055dFYwVkppZGE2d2M2U0JoWWhjYTF0S3ViVjN0NjBXMm9UUTZrSlkxeHNa?=
 =?utf-8?B?Q2ZQWW9RMXN0U2NHOSttZ1E5VjJveFpPK1VuYzFxcnpVWE94RzJkcm5aK1Fs?=
 =?utf-8?B?ZGhodnBWOFVDckkxZ29RcENiWlRzZ1llblNpNDFteWUwZFFhejhNUnBOeGdW?=
 =?utf-8?B?U3NCanJJTHZhL21jK3hITmErZ1A0dHJOem5BSjV4Sm5MVW5jaXN4OEh2d0lC?=
 =?utf-8?B?ZlhXbWtwQ3F2TGZOQWxqUDJQT290aHZKLzIvYklwTkZBaUhBa0hSS1N3eGps?=
 =?utf-8?B?ZmwxWkNsZTZxS016ZFZtMEIwa2hjbWpLS0xFR3hjTTFRUUxOeHZidWIxVFpv?=
 =?utf-8?B?aWs0Z081WkdXazViYnd3cklYNkpKNVRmRHVvWDBVdG83SDBqUWRqVlliVXQ5?=
 =?utf-8?B?ZlF1RmxQMmdhQk1OelZzU3lhYUxKZmgzeUo4cUtMQzZNWm1idmp4M1NQRFdi?=
 =?utf-8?B?enY1NjZiVXhaYmVOYnNTV3JKRDNNVHBoaE5RazlUNzl0OG9STXdZOWsveHN3?=
 =?utf-8?B?c0tWWHZ1ci92SUI3UGM0dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejh3S21zbkkyZHlxaTNLRzhJVDZqaUZHSUwyMWk2WElBU1AzNkk3N0o1ZlUx?=
 =?utf-8?B?Wi9PcVNRdUMwbitIQ1RDelRkeU9Ma0RuSUhwR1ZKOFlXRU1SNmEvK1AvS3d5?=
 =?utf-8?B?Skx0QVhqaWVaa3pRVUl3a0sweVhBVi9MMGRueG0yTFAwWXNldnJGTU8vQXJx?=
 =?utf-8?B?SnJzd3ZiY3pHQklXTjgvZG9YSmd1TlM3ZXpOa1dFRXNPMmFaeDBpVnF1U3dB?=
 =?utf-8?B?SEt5VG1lQW1OYy95ekRNeDBpNUJrclluY2VVRGZhakYrV3ZBbWRZT2JBNDZT?=
 =?utf-8?B?Rm1OcEFsTGxpZFI5WFhyZmR5VWg4c3Q4b3pMU1pzRWNTaHNrNm5ZRTg4UDVk?=
 =?utf-8?B?M09xUEU0QUhwdzlEbmpVNUlxL0RwNWtXdE5BdmRNTEE1RE4xcHZkZnh4ME1q?=
 =?utf-8?B?RERLMXNZblM0NjExeG9CQ2N5NHcrRG9ra0xhYUpCeW01QjJ3WUtMNDRvVTNJ?=
 =?utf-8?B?eURTdG1KVUNRTDViR0ErODREalBYUy9FeVI2SnRvYUpWaFI4UGdMTFNYYlRV?=
 =?utf-8?B?OFBwL2lsaE9BZkRQYSt0S0QxSllranhqblRSVGRVUkJpZ0xSYmhNUXo4Y1Ri?=
 =?utf-8?B?WktsY3lwallXbmI1YXBDNUZyQlU0M2x0T0djbjlYTVFNbHowUGFLNzRETFM0?=
 =?utf-8?B?WlY3R21HTjNaN1lJcGN0TWNuRkx2UFVHazRTWmxmWjZyczJVbVA0WHM0YU05?=
 =?utf-8?B?Q1VFS01jUzRFamJ5aFB0d0dFdFhENXpQZ0pOQzk1UHpjSXB2L2R1Mno0dDky?=
 =?utf-8?B?alJRSXBtS254eENhVXBYQkdkL3dOZnZHMVBscU5HbVRNekcwME4rV0tyVmVh?=
 =?utf-8?B?MEV2MUp4NjNWSDFxQ0svaFE2STQ5MUF1d3ZTTFYrRWpUUVFZTHp1TkFIQWww?=
 =?utf-8?B?N3E0U3p0YTVEbWEySCtDL2k4am5rbkhpdnRjMTdSdXBpWTU3MFgvL21CRXM4?=
 =?utf-8?B?MmgreEI2V0dyeUFmVGpmbFRxTWk3NzhPQU0vczEwOTFhOGQ2cmozZ240dzc0?=
 =?utf-8?B?eDduVlRLNSsvTWUyenA5TlMyUzdyT2lpcXJhaFBXM0Yyam9yNzk2TlNSY2VT?=
 =?utf-8?B?Ylc0OXFLV25xVjk1WVpJUkQ3ampnQ1NiVEdKSXFmSDR4S3B1b2ZOemVlRGp2?=
 =?utf-8?B?czJFQ1JQVHFXbWtxSXZ5bWRBS2pCMkhydUhVUzdMRVg4M0VoOHpadG1qQWZi?=
 =?utf-8?B?d3ZQYXVtZFBtRXNvZ2JUandyb1lQTzJERlB1ZHRpVENScWhFVDhZQzFxalMw?=
 =?utf-8?B?djlqYXRrdWFmTFMzcXFmb3pkejFCdW9mS3pXL3paRTBXNk1STlplVW9UWGJU?=
 =?utf-8?B?d3hyRVNaNXNldklzcFFmUkp5T2MyWU50WjZMRFJzQkxhdnV1azcwRk5OR1hB?=
 =?utf-8?B?cXZtdko4bHVxbXU4VndzbU9FS3pieXJYRzNKV1VIMHBYTlBGK3NzWElvd0hI?=
 =?utf-8?B?bXJuMUFNczdGNXM2S3R4Rk9IL2FBOVk1ODRqMy9qeC9RYWJZN0huNWl5UXlH?=
 =?utf-8?B?UEJHTW5uS1FEb05RQkpCbWhLT25TTVhtajZqUVB5b2tvRmRMRXZzcDZPeVhO?=
 =?utf-8?B?V3g1ZjJvcVNDck1tQ0hPUzVtekcwWmJaUHZueFJrdGxkaG9oRDFRdjluNi9T?=
 =?utf-8?B?YkZiZmt6bk9FUVhYNjJFR3NQbC9LaEdVTGlYYmkvSlNKYWRVNUowQmpVZzF5?=
 =?utf-8?B?Y2tpSGFoWHJWQ2pnNFlWTk9aeGg2NWdmSWNOeTgrUWxMZE54N3RPV0I2U0VF?=
 =?utf-8?B?bENhcCttWUpxNlZVZzVrQ2JTa2gzTWtUR1ZxYm1kdk1BUXdyaG9MdGhMcFln?=
 =?utf-8?B?c2JwR2N5N2ZVTTJqbmJLaWcxeXFKejg0dzhaWHFOUzBKRTRIbE12ZDM0Mnh1?=
 =?utf-8?B?U2Rab2F6RzhIVEpXNE12VTdaSGhpemRjYWZTT3U5b3duQ1hVeEoyTUY3c3A5?=
 =?utf-8?B?enRvbDZseGdGNEExWHU3Znd1em8xZklVb3FucDRXcFFEQVpzTHBNNEF2Yjh4?=
 =?utf-8?B?emhqUEg1UHJFZ2RSZGY2RmVqM3BLM0tIVTMrcnB6NXFYNlBlM0VvbTVaZEhV?=
 =?utf-8?B?eHByTDFYSEMxKytOcVdUcnc4UUNsdkgxVDlZRU01eXo3TVBPbFBXeUtnNTYw?=
 =?utf-8?B?UjRMaDZCaGFKcVhUS1dST083c290MHdnZWNHYjJJK25IajVKcTh4ZjZLVHpz?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55dbb350-b38c-4db4-7e64-08dcd7da7b90
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 12:07:35.9070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljCpQ7WYSze865g71hN2Sxvq82dnHDc54m2t6ef5gNrGiluQt4XZdsMlX20FMbvYOmswsP/DCk00g+Gj2ikY/6UZPGJ6qtVVBLzfFMCaEJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6123
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

Hello,

On 9/18/2024 5:27 PM, Samala, Pranay wrote:
> 
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Naladala,
>> Ramanaidu
>> Sent: Saturday, September 7, 2024 2:05 AM
>> To: igt-dev@lists.freedesktop.org
>> Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf
>> test
>>
>>
>>
>> On 9/5/2024 7:12 PM, Pranay Samala wrote:
>>> In the current kms_psr2_sf tests, we identify PSR/PR/PR-SF at dynamic
>>> subtest level.
>>> This patch converts the test structure to execute on PSR/PR/PR-SF at
>>> subtest level for easy identification of tests.
>>>
>>> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
>>> ---
>>>    tests/intel/kms_psr2_sf.c | 809 +++++++++++++++++++-------------------
>>>    1 file changed, 407 insertions(+), 402 deletions(-)
>>>
>>> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
>>> index 03ff1cddb..3fd814281 100644
>>> --- a/tests/intel/kms_psr2_sf.c
>>> +++ b/tests/intel/kms_psr2_sf.c
>>> @@ -44,11 +44,20 @@
>>>    #include <string.h>
>>>
>>>    /**
>>> - * SUBTEST: %s-plane-move-continuous-%s
>>> + * SUBTEST: psr2-%s-plane-move-continuous-%s
>>>     * Description: Test that selective fetch works on moving %arg[1] plane
>> %arg[2]
>>>     *              visible area (no update)
>>>     *
>>> - * SUBTEST: fbc-%s-plane-move-continuous-%s
>>> + * SUBTEST: pr-%s-plane-move-continuous-%s
>>> + * Description: Test that selective fetch works on moving %arg[1] plane
>> %arg[2]
>>> + *              visible area (no update)
>>> + *
>>> + * SUBTEST: fbc-psr2-%s-plane-move-continuous-%s
>>> + * Description: Test that fbc with selective fetch works on moving %arg[1]
>> plane %arg[2]
>>> + *              visible area (no update)
>>> + * Functionality: plane, psr2, selective_fetch, fbc
>>> + *
>>> + * SUBTEST: fbc-pr-%s-plane-move-continuous-%s
>>>     * Description: Test that fbc with selective fetch works on moving %arg[1]
>> plane %arg[2]
>>>     *              visible area (no update)
>>>     * Functionality: plane, psr2, selective_fetch, fbc @@ -66,51 +75,98
>>> @@
>>>     */
>>>
>>>    /**
>>> - * SUBTEST: cursor-plane-update-sf
>>> + * SUBTEST: psr2-cursor-plane-update-sf
>>>     * Description: Test that selective fetch works on cursor plane
>>>     *
>>> - * SUBTEST: fbc-cursor-plane-update-sf
>>> + * SUBTEST: pr-cursor-plane-update-sf
>>> + * Description: Test that selective fetch works on cursor plane
>>> + *
>>> + * SUBTEST: fbc-psr2-cursor-plane-update-sf
>>> + * Description: Test that fbc with selective fetch works on cursor
>>> + plane
>>> + * Functionality: plane, psr2, selective_fetch, fbc
>>> + *
>>> + * SUBTEST: fbc-pr-cursor-plane-update-sf
>>>     * Description: Test that fbc with selective fetch works on cursor plane
>>>     * Functionality: plane, psr2, selective_fetch, fbc
>>>     *
>>> - * SUBTEST: overlay-plane-update-continuous-sf
>>> + * SUBTEST: psr2-overlay-plane-update-continuous-sf
>>>     * Description: Test that selective fetch works on overlay plane
>>>     *
>>> - * SUBTEST: fbc-overlay-plane-update-sf-dmg-area
>>> + * SUBTEST: pr-overlay-plane-update-continuous-sf
>>> + * Description: Test that selective fetch works on overlay plane
>>> + *
>>> + * SUBTEST: fbc-psr2-overlay-plane-update-sf-dmg-area
>>> + * Description: Test that fbc with selective fetch works on overlay
>>> + plane
>>> + * Functionality: plane, psr2, selective_fetch, fbc
>>> + *
>>> + * SUBTEST: fbc-pr-overlay-plane-update-sf-dmg-area
>>>     * Description: Test that fbc with selective fetch works on overlay plane
>>>     * Functionality: plane, psr2, selective_fetch, fbc
>>>     *
>>> - * SUBTEST: overlay-plane-update-sf-dmg-area
>>> + * SUBTEST: psr2-overlay-plane-update-sf-dmg-area
>>> + * Description: Test that selective fetch works on overlay plane
>>> + *
>>> + * SUBTEST: pr-overlay-plane-update-sf-dmg-area
>>>     * Description: Test that selective fetch works on overlay plane
>>>     *
>>> - * SUBTEST: fbc-overlay-plane-update-continuous-sf
>>> + * SUBTEST: fbc-psr2-overlay-plane-update-continuous-sf
>>>     * Description: Test that fbc with selective fetch works on overlay plane
>>>     * Functionality: plane, psr2, selective_fetch, fbc
>>>     *
>>> - * SUBTEST: overlay-primary-update-sf-dmg-area
>>> + * SUBTEST: fbc-pr-overlay-plane-update-continuous-sf
>>> + * Description: Test that fbc with selective fetch works on overlay
>>> + plane
>>> + * Functionality: plane, psr2, selective_fetch, fbc
>>> + *
>>> + * SUBTEST: psr2-overlay-primary-update-sf-dmg-area
>>> + * Description: Test that selective fetch works on primary plane with blended
>>> + *              overlay plane
>>> + *
>>> + * SUBTEST: pr-overlay-primary-update-sf-dmg-area
>>>     * Description: Test that selective fetch works on primary plane with blended
>>>     *              overlay plane
>>>     *
>>> - * SUBTEST: fbc-overlay-primary-update-sf-dmg-area
>>> + * SUBTEST: fbc-psr2-overlay-primary-update-sf-dmg-area
>>>     * Description: Test that fbc with selective fetch works on primary plane with
>> blended
>>>     *              overlay plane
>>>     * Functionality: plane, psr2, selective_fetch, fbc
>>>     *
>>> - * SUBTEST: plane-move-sf-dmg-area
>>> + * SUBTEST: fbc-pr-overlay-primary-update-sf-dmg-area
>>> + * Description: Test that fbc with selective fetch works on primary plane with
>> blended
>>> + *              overlay plane
>>> + * Functionality: plane, psr2, selective_fetch, fbc
>>> + *
>>> + * SUBTEST: psr2-plane-move-sf-dmg-area
>>>     * Description: Test that selective fetch works on moving overlay plane
>>>     *
>>> - * SUBTEST: fbc-plane-move-sf-dmg-area
>>> + * SUBTEST: pr-plane-move-sf-dmg-area
>>> + * Description: Test that selective fetch works on moving overlay
>>> + plane
>>> + *
>>> + * SUBTEST: fbc-psr2-plane-move-sf-dmg-area
>>>     * Description: Test that fbc with selective fetch works on moving overlay plane
>>>     * Functionality: plane, psr2, selective_fetch, fbc
>>>     *
>>> - * SUBTEST: primary-plane-update-sf-dmg-area
>>> + * SUBTEST: fbc-pr-plane-move-sf-dmg-area
>>> + * Description: Test that fbc with selective fetch works on moving
>>> + overlay plane
>>> + * Functionality: plane, psr2, selective_fetch, fbc
>>> + *
>>> + * SUBTEST: psr2-primary-plane-update-sf-dmg-area
>>> + * Description: Test that selective fetch works on primary plane
>>> + *
>>> + * SUBTEST: pr-primary-plane-update-sf-dmg-area
>>>     * Description: Test that selective fetch works on primary plane
>>>     *
>>> - * SUBTEST: fbc-primary-plane-update-sf-dmg-area
>>> + * SUBTEST: fbc-psr2-primary-plane-update-sf-dmg-area
>>>     * Description: Test that fbc with selective fetch works on primary plane
>>>     * Functionality: plane, psr2, selective_fetch, fbc
>>>     *
>>> - * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
>>> + * SUBTEST: fbc-pr-primary-plane-update-sf-dmg-area
>>> + * Description: Test that fbc with selective fetch works on primary
>>> + plane
>>> + * Functionality: plane, psr2, selective_fetch, fbc
>>> + *
>>> + * SUBTEST: psr2-primary-plane-update-sf-dmg-area-big-fb
>>> + * Description: Test that selective fetch works on primary plane with
>>> + big fb
>>> + *
>>> + * SUBTEST: pr-primary-plane-update-sf-dmg-area-big-fb
>>>     * Description: Test that selective fetch works on primary plane with big fb
>>>     */
>>>
>>> @@ -216,23 +272,6 @@ static bool set_sel_fetch_mode_for_output(data_t
>> *data)
>>>    	return supported;
>>>    }
>>>
>>> -static const char *get_psr_mode_str_for_output(data_t *data) -{
>>> -	static const char *psr_mode;
>>> -
>>> -	switch (data->psr_mode) {
>>> -	case PSR_MODE_2:
>>> -		psr_mode = "psr2";
>>> -		break;
>>> -	case PR_MODE_SEL_FETCH:
>>> -		psr_mode = "pr";
>>> -		break;
>>> -	default:
>>> -		psr_mode = "";
>>> -	}
>>> -	return psr_mode;
>>> -}
>>> -
>>>    static const char *op_str(enum operations op)
>>>    {
>>>    	static const char * const name[] = { @@ -1045,13 +1084,95 @@
>>> pipe_output_combo_valid(igt_display_t *display,
>>>    	return ret;
>>>    }
>>>
>>> +static bool check_psr_mode_supported(data_t *data, int psr_stat) {
>>> +	if (data->psr_mode == psr_stat)
>>> +		return true;
>>> +	else
>>> +		return false;
>>> +}
>>> +
>>> +static void run_dynamic_test_damage_areas(data_t data, int i, int
>>> +coexist_features[]) {
>>> +	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
>>> +		if (j != FEATURE_NONE && !(coexist_features[i] & j))
>>> +			continue;
>>> +		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
>>> +			      igt_output_name(data.output),
>> coexist_feature_str(j)) {
>>> +			data.coexist_feature = j;
>>> +			for (int k = 1; k <= MAX_DAMAGE_AREAS; k++) {
>>> +				data.damage_area_count = k;
>>> +				prepare(&data);
>>> +				run(&data);
>>> +				cleanup(&data);
>>> +			}
>>> +		}
>>> +	}
>>> +}
>> imho you should split all new functions into different patches.
>>> +
>>> +static void run_dynamic_test(data_t data, int i, int
>>> +coexist_features[]) {
>>> +	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
>>> +		if (j != FEATURE_NONE && !(coexist_features[i] & j))
>>> +			continue;
>>> +		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
>>> +			      igt_output_name(data.output),
>> coexist_feature_str(j)) {
>>> +			data.coexist_feature = j;
>>> +			prepare(&data);
>>> +			run(&data);
>>> +			cleanup(&data);
>>> +		}
>>> +	}
>>> +}
>>> +
>>> +static void run_plane_move(data_t data, int i, int
>>> +coexist_features[]) {
>>> +	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
>>> +		if (j != FEATURE_NONE && !(coexist_features[i] & j))
>>> +			continue;
>>> +		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
>>> +			      igt_output_name(data.output),
>> coexist_feature_str(j)) {
>>> +			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
>>> +			data.coexist_feature = j;
>>> +			for (int k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT;
>> k++) {
>>> +				data.pos = k;
>>> +				prepare(&data);
>>> +				run(&data);
>>> +				cleanup(&data);
>>> +			}
>>> +		}
>>> +	}
>>> +}
>>> +
>>> +static void run_plane_update_continuous(data_t data, int i, int
>>> +coexist_features[]) {
>>> +	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
>>> +		if (j != FEATURE_NONE && !(coexist_features[i] & j))
>>> +			continue;
>>> +		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
>>> +			      igt_output_name(data.output),
>> coexist_feature_str(j)) {
>>> +			data.damage_area_count = 1;
>>> +			if (data.op_fbc_mode == FBC_ENABLED)
>>> +				data.primary_format =
>> DRM_FORMAT_XRGB8888;
>>> +			else
>>> +				data.primary_format = DRM_FORMAT_NV12;
>>> +
>>> +			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
>>> +			data.coexist_feature = j;
>>> +			prepare(&data);
>>> +			run(&data);
>>> +			cleanup(&data);
>>> +		}
>>> +	}
>>> +}
>> I did not find much difference between run_plane_update_continuous and
>> run_dynamic_test. I think the continuous update function loop is missing.
> 
> Continuous plane update is happening inside the run function itself.
> -Pranay

Thanks for the clarification.
LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>


> 
>>> +
>>>    igt_main
>>>    {
>>>    	bool output_supports_pr_psr2_sel_fetch = false;
>>>    	bool pr_psr2_sel_fetch_supported = false;
>>>    	data_t data = {};
>>>    	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
>>> -	int i, j, k, y;
>>> +	int i, y, z;
>>>    	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
>>>    	int n_pipes = 0;
>>>    	int coexist_features[IGT_MAX_PIPES * IGT_MAX_PIPES]; @@ -1061,6
>>> +1182,12 @@ igt_main
>>>    	};
>>>    	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
>>>
>>> +	const char *append_psr_subtest[2] = {
>>> +		"psr2-",
>>> +		"pr-"
>>> +	};
>>> +	int psr_status[] = {PSR_MODE_2, PR_MODE_SEL_FETCH};
>>> +
>>>    	igt_fixture {
>>>    		drmModeResPtr res;
>>>
>>> @@ -1103,430 +1230,308 @@ igt_main
>>>    	}
>>>
>>>    	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
>>> -		data.op = PLANE_UPDATE;
>>> -		data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
>>> -		data.primary_format = DRM_FORMAT_XRGB8888;
>>> -		data.big_fb_test = 0;
>>> -
>>> -		data.op_fbc_mode = fbc_status[y];
>>> -		/* Verify primary plane selective fetch */
>>> -		igt_describe("Test that selective fetch works on primary plane");
>>> -		igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +		for (z = 0; z < ARRAY_SIZE(psr_status); z++) {
>>> +			data.op = PLANE_UPDATE;
>>> +			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
>>> +			data.primary_format = DRM_FORMAT_XRGB8888;
>>> +			data.big_fb_test = 0;
>>> +
>>> +			data.op_fbc_mode = fbc_status[y];
>>> +			data.psr_mode = psr_status[z];
>>> +
>>> +			/* Verify primary plane selective fetch */
>>> +			igt_describe("Test that selective fetch works on primary
>> plane");
>>> +			igt_subtest_with_dynamic_f("%s%sprimary-%s-sf-dmg-
>> area",
>>> +						   append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>>> +						   op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>> outputs[i]))
>>> +						continue;
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> +
>>> +					data.test_plane_id =
>> DRM_PLANE_TYPE_PRIMARY;
>>> +					run_dynamic_test_damage_areas(data,
>> i, coexist_features);
>>> +				}
>>> +			}
>>> +
>>> +			/* Verify primary plane selective fetch with big fb */
>>> +			if (data.op_fbc_mode == FBC_DISABLED) {
>>> +				data.big_fb_test = 1;
>>> +				igt_describe("Test that selective fetch works on
>> primary plane "
>>> +					     "with big fb");
>>> +				igt_subtest_with_dynamic_f("%s%sprimary-%s-
>> sf-dmg-area-big-fb",
>>> +
>> append_fbc_subtest[y],
>>> +
>> append_psr_subtest[z],
>>> +							   op_str(data.op)) {
>>> +					for (i = 0; i < n_pipes; i++) {
>>> +						if
>> (!pipe_output_combo_valid(&data.display,
>>> +
>> pipes[i], outputs[i]))
>>> +							continue;
>>> +						data.pipe = pipes[i];
>>> +						data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +							     "Selective fetch is
>> not supported\n");
>>> +						if
>> (!check_psr_mode_supported(&data, psr_status[z]))
>>> +							continue;
>>> +
>>>    						data.test_plane_id =
>> DRM_PLANE_TYPE_PRIMARY;
>>> -						data.coexist_feature = j;
>>> -						for (k = 1; k <=
>> MAX_DAMAGE_AREAS; k++) {
>>> -
>> 	data.damage_area_count = k;
>>> -							prepare(&data);
>>> -							run(&data);
>>> -							cleanup(&data);
>>> -						}
>>> +
>> 	run_dynamic_test_damage_areas(data, i,
>>> +
>> coexist_features);
>>>    					}
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		/* Verify primary plane selective fetch with big fb */
>>> -		if (data.op_fbc_mode == FBC_DISABLED) {
>>> -			data.big_fb_test = 1;
>>> -			igt_describe("Test that selective fetch works on primary
>> plane with "
>>> -				     "big fb");
>>> -			igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-
>> area-big-fb",
>>> -						   append_fbc_subtest[y],
>> op_str(data.op)) {
>>> +			data.big_fb_test = 0;
>>> +			/* Verify overlay plane selective fetch */
>>> +			igt_describe("Test that selective fetch works on overlay
>> plane");
>>> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf-dmg-
>> area",
>>> +						   append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>>> +						   op_str(data.op)) {
>>>    				for (i = 0; i < n_pipes; i++) {
>>> -					if
>> (!pipe_output_combo_valid(&data.display, pipes[i],
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>>    								     outputs[i]))
>>>    						continue;
>>>    					data.pipe = pipes[i];
>>>    					data.output = outputs[i];
>>>
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -								 "Selective
>> fetch is not supported\n");
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>>
>>> -					for (j = FEATURE_NONE; j <
>> FEATURE_COUNT; j++) {
>>> -						if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> -							continue;
>>> -						igt_dynamic_f("%s-pipe-%s-
>> %s%s",
>>> -
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -
>> coexist_feature_str(j)) {
>>> -							data.test_plane_id =
>> DRM_PLANE_TYPE_PRIMARY;
>>> -							data.coexist_feature =
>> j;
>>> -
>>> -							for (k = 1; k <=
>> MAX_DAMAGE_AREAS; k++) {
>>> -
>> 	data.damage_area_count = k;
>>> -
>> 	prepare(&data);
>>> -								run(&data);
>>> -
>> 	cleanup(&data);
>>> -							}
>>> -						}
>>> -					}
>>> +					data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>> +					run_dynamic_test_damage_areas(data,
>> i, coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		data.big_fb_test = 0;
>>> -		/* Verify overlay plane selective fetch */
>>> -		igt_describe("Test that selective fetch works on overlay plane");
>>> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf-dmg-area",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			data.damage_area_count = 1;
>>> +			/* Verify cursor plane selective fetch */
>>> +			igt_describe("Test that selective fetch works on cursor
>> plane");
>>> +			igt_subtest_with_dynamic_f("%s%scursor-%s-sf",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>> -						data.coexist_feature = j;
>>> -
>>> -						for (k = 1; k <=
>> MAX_DAMAGE_AREAS; k++) {
>>> -
>> 	data.damage_area_count = k;
>>> -							prepare(&data);
>>> -							run(&data);
>>> -							cleanup(&data);
>>> -						}
>>> -					}
>>> -				}
>>> -			}
>>> -		}
>>> -
>>> -		data.damage_area_count = 1;
>>> -		/* Verify cursor plane selective fetch */
>>> -		igt_describe("Test that selective fetch works on cursor plane");
>>> -		igt_subtest_with_dynamic_f("%scursor-%s-sf",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>> -						data.coexist_feature = j;
>>> -						prepare(&data);
>>> -						run(&data);
>>> -						cleanup(&data);
>>> -					}
>>> +
>>> +					data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>> +					run_dynamic_test(data, i,
>> coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		data.op = PLANE_MOVE_CONTINUOUS;
>>> -		igt_describe("Test that selective fetch works on moving cursor
>> plane (no update)");
>>> -		igt_subtest_with_dynamic_f("%scursor-%s-sf",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			data.op = PLANE_MOVE_CONTINUOUS;
>>> +			igt_describe("Test that selective fetch works on "
>>> +				     "moving cursor plane (no update)");
>>> +			igt_subtest_with_dynamic_f("%s%scursor-%s-sf",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>> -						data.coexist_feature = j;
>>> -
>>> -						prepare(&data);
>>> -						run(&data);
>>> -						cleanup(&data);
>>> -					}
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>> +
>>> +					data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>> +					run_dynamic_test(data, i,
>> coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
>>> -		igt_describe("Test that selective fetch works on moving cursor
>> plane exceeding "
>>> -			     "partially visible area (no update)");
>>> -		igt_subtest_with_dynamic_f("%scursor-%s-sf",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
>>> +			igt_describe("Test that selective fetch works on moving
>> cursor "
>>> +				     "plane exceeding partially visible area (no
>> update)");
>>> +			igt_subtest_with_dynamic_f("%s%scursor-%s-sf",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>> -						data.coexist_feature = j;
>>> -						prepare(&data);
>>> -						run(&data);
>>> -						cleanup(&data);
>>> -					}
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>> +
>>> +					data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>> +					run_dynamic_test(data, i,
>> coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
>>> -		igt_describe("Test that selective fetch works on moving cursor
>> plane exceeding "
>>> -			     "fully visible area (no update)");
>>> -		igt_subtest_with_dynamic_f("%scursor-%s-sf",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			data.op =
>> PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
>>> +			igt_describe("Test that selective fetch works on moving
>> cursor plane "
>>> +				     "exceeding fully visible area (no update)");
>>> +			igt_subtest_with_dynamic_f("%s%scursor-%s-sf",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>> -						data.coexist_feature = j;
>>> -						prepare(&data);
>>> -						run(&data);
>>> -						cleanup(&data);
>>> -					}
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>> +
>>> +					data.test_plane_id =
>> DRM_PLANE_TYPE_CURSOR;
>>> +					run_dynamic_test(data, i,
>> coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		/* Only for overlay plane */
>>> -		data.op = PLANE_MOVE;
>>> -		/* Verify overlay plane move selective fetch */
>>> -		igt_describe("Test that selective fetch works on moving overlay
>> plane");
>>> -		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			/* Only for overlay plane */
>>> +			data.op = PLANE_MOVE;
>>> +			/* Verify overlay plane move selective fetch */
>>> +			igt_describe("Test that selective fetch works on moving
>> overlay plane");
>>> +			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>>> -
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>> -						data.coexist_feature = j;
>>> -						for (k = POS_TOP_LEFT; k <=
>> POS_BOTTOM_RIGHT ; k++) {
>>> -							data.pos = k;
>>> -							prepare(&data);
>>> -							run(&data);
>>> -							cleanup(&data);
>>> -						}
>>> -					}
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>> +
>>> +					run_plane_move(data, i,
>> coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		data.op = PLANE_MOVE_CONTINUOUS;
>>> -		igt_describe("Test that selective fetch works on moving overlay
>> plane (no update)");
>>> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			data.op = PLANE_MOVE_CONTINUOUS;
>>> +			igt_describe("Test that selective fetch works on moving
>> overlay "
>>> +				     "plane (no update)");
>>> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>> +
>>>    					data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>> -					data.coexist_feature = j;
>>> -					prepare(&data);
>>> -					run(&data);
>>> -					cleanup(&data);
>>> -					}
>>> +					run_dynamic_test(data, i,
>> coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
>>> -		igt_describe("Test that selective fetch works on moving overlay
>> plane partially "
>>> -			     "exceeding visible area (no update)");
>>> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
>>> +			igt_describe("Test that selective fetch works on moving
>> overlay "
>>> +				     "plane partially exceeding visible area (no
>> update)");
>>> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>> -						data.coexist_feature = j;
>>> -						prepare(&data);
>>> -						run(&data);
>>> -						cleanup(&data);
>>> -					}
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>> +
>>> +					data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>> +					run_dynamic_test(data, i,
>> coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
>>> -		igt_describe("Test that selective fetch works on moving overlay
>> plane fully "
>>> -			     "exceeding visible area (no update)");
>>> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			data.op =
>> PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
>>> +			igt_describe("Test that selective fetch works on moving
>> overlay plane "
>>> +				     "fully exceeding visible area (no update)");
>>> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display, pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>> -						data.coexist_feature = j;
>>> -						prepare(&data);
>>> -						run(&data);
>>> -						cleanup(&data);
>>> -					}
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>> +
>>> +					data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>> +					run_dynamic_test(data, i,
>> coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		/* Verify primary plane selective fetch with overplay plane
>> blended */
>>> -		data.op = OVERLAY_PRIM_UPDATE;
>>> -		igt_describe("Test that selective fetch works on primary plane "
>>> -			     "with blended overlay plane");
>>> -		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			/* Verify primary plane selective fetch with overplay
>> plane blended */
>>> +			data.op = OVERLAY_PRIM_UPDATE;
>>> +			igt_describe("Test that selective fetch works on primary
>> plane "
>>> +				     "with blended overlay plane");
>>> +			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> kmstest_pipe_name(pipes[i]),
>>> -
>> get_psr_mode_str_for_output(&data),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						for (k = 1; k <=
>> MAX_DAMAGE_AREAS; k++) {
>>> -
>> 	data.damage_area_count = k;
>>> -							data.test_plane_id =
>> DRM_PLANE_TYPE_PRIMARY;
>>> -							data.coexist_feature =
>> j;
>>> -
>>> -							prepare(&data);
>>> -							run(&data);
>>> -							cleanup(&data);
>>> -						}
>>> -					}
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>> +
>>> +					data.test_plane_id =
>> DRM_PLANE_TYPE_PRIMARY;
>>> +					run_dynamic_test_damage_areas(data,
>> i, coexist_features);
>>>    				}
>>>    			}
>>> -		}
>>>
>>> -		/*
>>> -		 * Verify overlay plane selective fetch using NV12 primary
>>> -		 * plane and continuous updates.
>>> -		 */
>>> -		data.op = PLANE_UPDATE_CONTINUOUS;
>>> -		igt_describe("Test that selective fetch works on overlay plane");
>>> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf",
>> append_fbc_subtest[y],
>>> -					   op_str(data.op)) {
>>> -			for (i = 0; i < n_pipes; i++) {
>>> -				if (!pipe_output_combo_valid(&data.display,
>> pipes[i], outputs[i]))
>>> -					continue;
>>> -				data.pipe = pipes[i];
>>> -				data.output = outputs[i];
>>> -
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> -							 "Selective fetch is not
>> supported\n");
>>> -
>>> -				for (j = FEATURE_NONE; j < FEATURE_COUNT;
>> j++) {
>>> -					if (j != FEATURE_NONE &&
>> !(coexist_features[i] & j))
>>> +			/*
>>> +			 * Verify overlay plane selective fetch using NV12
>> primary
>>> +			 * plane and continuous updates.
>>> +			 */
>>> +			data.op = PLANE_UPDATE_CONTINUOUS;
>>> +			igt_describe("Test that selective fetch works on overlay
>> plane");
>>> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf",
>> append_fbc_subtest[y],
>>> +						   append_psr_subtest[z],
>> op_str(data.op)) {
>>> +				for (i = 0; i < n_pipes; i++) {
>>> +					if
>> (!pipe_output_combo_valid(&data.display,
>>> +								     pipes[i],
>>> +								     outputs[i]))
>>>    						continue;
>>> -					igt_dynamic_f("%s-pipe-%s-%s%s",
>> get_psr_mode_str_for_output(&data),
>>> -
>> kmstest_pipe_name(pipes[i]),
>>> -
>> igt_output_name(outputs[i]),
>>> -						      coexist_feature_str(j)) {
>>> -						data.damage_area_count = 1;
>>> -						if (data.op_fbc_mode ==
>> FBC_ENABLED)
>>> -							data.primary_format =
>> DRM_FORMAT_XRGB8888;
>>> -						else
>>> -							data.primary_format =
>> DRM_FORMAT_NV12;
>>> -						data.test_plane_id =
>> DRM_PLANE_TYPE_OVERLAY;
>>> -						data.coexist_feature = j;
>>> -						prepare(&data);
>>> -						run(&data);
>>> -						cleanup(&data);
>>> -					}
>>> +					data.pipe = pipes[i];
>>> +					data.output = outputs[i];
>>> +
>> 	igt_assert_f(set_sel_fetch_mode_for_output(&data),
>>> +						     "Selective fetch is not
>> supported\n");
>>> +					if (!check_psr_mode_supported(&data,
>> psr_status[z]))
>>> +						continue;
>>> +
>>> +					run_plane_update_continuous(data, i,
>> coexist_features);
>>>    				}
>>>    			}
>>>    		}
> 

