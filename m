Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B741D60074
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 07:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE4E10E13C;
	Tue, 19 Nov 2024 07:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMzddQFP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C0010E13C
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 07:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732002241; x=1763538241;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p7T+izwCJTHt09iPSZzvLhkEEAAw0WL/zW8pU16sWS0=;
 b=FMzddQFPlGQ5AN+cE/tMGeDG3TMsrcXXQmQuAn7kcDV5cGwqP7diG+kD
 x9O2rzC8ZQjnN8wowk5Qrr0tedRWfz+SXzinYTS6Ey1GgFboqfylJjKl6
 uz+A4D9ok9W9KfpFPB7qY+EbphVMwRpzM4Zfm4MtAOkXPgvCzoxPRxvP2
 KlXnZyOMDDWprJsna7ja2raQmVA6kjrv4jZFRGUIHJax2fBPFdy1P6r54
 RSVI5vM9fxu9npvEd0RBUqBZk//DvYIhIfipQS952PcExmOU6wXLqrgBb
 MuqHS7HZLoeLr6tA1l8HD78TytrK0rc1P11XceH/uanwSaO2Bi+H9pPB8 w==;
X-CSE-ConnectionGUID: 1PRZYJCIQVSqNjyyWNYFCw==
X-CSE-MsgGUID: n7wW8a/sRwaPuCO2X0EI+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35759615"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="35759615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 23:44:01 -0800
X-CSE-ConnectionGUID: uhd22YvTQ0Sv26tDg1/WlQ==
X-CSE-MsgGUID: 0jDjEE8KSiyPQTCKgT+E/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89862439"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 23:44:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 23:44:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 23:44:00 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 23:44:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2CeK0lCvJ5VmNR+jtA+wKDAhGhrvt+gd9B6ddr7A/o+VsvXuRka1pKXLaU3md1740/YLVhd8i1LcjQFkZKpCtfeO/GVQ+E0klM1PY+8JubOdcy57gOyDdT6xaA6dv2DRowDqWFQ0bqQKvcqf4PKGovlrET2uZHxvCur8Ed/J7Nev9VUkKAv7FQcEYButbSGHQG5xajoDBL3ZskINI0m7dBrX3VcGqyjOuzsg5OyH0i3WN2+i6cMFOhg68r+TroXnlQHTzhDLGExWVHmtGm+AMPLqJKFAsgUjEOR6pmu3+j1m2RpXiGk1vIf+FmqxXLhP68Ldxg4VQ02E/vR93Suww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWyWTJNVQn0+M6lZuUsMKSeX6X96ECl/FRma5TA1HxY=;
 b=urE+4AC3wQL2QGDJOk6C6YG1c3/MAC9Zi9g7IhKVG5IkwiBgN+TwC4YQe6z5THwGYybMUpMCQ7K7rUXPMkBI/Oi7TifvlTfnJiA81FnI59EIuMar9iE6csqSyDMnlsEkHn2+NL+IyZaSnt2EjFQe9ybZ94367wn+nmF2WEnMrAcVsT+C546x5qkE4fyNHhbGjqJcJuyN3I23PAuXmTKKePGVHZ6N2hdQ6ilp+CVDjFi8B/oian8suUNIa8UA3KFYK9zjg85DDUlwka/Vz8TzsUePQZXsB3Ug/+sgHm11JECp4vfwbgp4TD02jWprCOq8SKcudVLMFHj+klS7Qd4N4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 07:28:41 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 07:28:41 +0000
Message-ID: <1066dda3-0697-43de-bbe3-edcf53cc802e@intel.com>
Date: Tue, 19 Nov 2024 12:58:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_oa: Replace hardcoded OA buffer
 size assumptions
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20241118063223.3974722-1-sai.teja.pottumuttu@intel.com>
 <20241118063223.3974722-3-sai.teja.pottumuttu@intel.com>
 <85v7wkwar3.wl-ashutosh.dixit@intel.com>
 <8096edaa-6b95-4436-9938-cf0e92821320@intel.com>
 <8534jn7koq.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <8534jn7koq.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::14) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|DM4PR11MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 64cc6150-ec92-46e0-20dc-08dd086bca89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUd3UXhkUHY2c0F0NW5kbEdVRHpHdUhaY1lGRUpzWmRZOEc3eDFxcGhQT3A4?=
 =?utf-8?B?b2FaTkxiMGRiQy9qU2pyNGxwdXpaOHVVY0dJMitQUU5ZMDYyZUppVWp2NHJw?=
 =?utf-8?B?Nmt1ajBUd3FTZWk5bnk5NGlnaUlCZzhESFZDSWRFejNoenRWLy9oOHkyTWtr?=
 =?utf-8?B?K3ZFbm1XdHlPdmxQT09FbU1TcUtYUmVUQURSRVVkLzJYOFkyRWprWUsxNDBm?=
 =?utf-8?B?QjFTUHhGd0t2USttcVdxbzFTWncxa3hIMS81NWRkOFVaMFBsbUNhenJsUnBV?=
 =?utf-8?B?RzhqbmZvK3VSR0JmNWh2czRTcTEwTEtwYk9KemMrb2NBVkdycHdEd3hpOTAy?=
 =?utf-8?B?YTZYWE9PYjhZandzdVRGck9PU2VjbEgvalNWZEgvQ015WmtnRTR3ZnU1enZJ?=
 =?utf-8?B?NnZlWkh2enR0c0xFN2d2cTlQWHlXMlVMd0lEdXhCeGY1ZVlLZlJ4TlJpaXUv?=
 =?utf-8?B?OWFiUHIxVi9CRHhyWG5KNUhubmE0YTQ2WmFGTENybCt6YU1wRTg2ZUpGK0FY?=
 =?utf-8?B?MlRiVG1RRC90aExzM1VhekZjeGEyQnNKYXFkUGxOM081WnArT1FPdGpVMTdU?=
 =?utf-8?B?Rml4VXVBV1lOV2xyVUlzTVBOUW16a2FHTVQzamxzWWN6UGh4S2J1VGdHak1u?=
 =?utf-8?B?Q3d4MzBHdStKQjZsTllUS0F6c2I4Z2w4MnVySWc3OVVub0F6YzFBOFFwQlJx?=
 =?utf-8?B?eEtaS2dSd3NIYjFIUWF0Wm5yYjRCamMxUGd1QlNhcEFCZ1dnL3BrYzBDeHRl?=
 =?utf-8?B?enlma08rUG5xSUF0RksxMDJZTmlOclBtTFdKUDJNQjZtcC9QTHZyNmFwTmwv?=
 =?utf-8?B?dklBVzZ0UmJsN1M3RXZTMnRIdVZlaU5oWGlWOFlmWGlvdUFPWUEydWJqZERI?=
 =?utf-8?B?U2hSVDIxM0E5ZkM3VFAvK2hkUnJIRGVVekl0ODZIMzU3NEhpUnIydm5UNGNa?=
 =?utf-8?B?MEt3VVBYbElLOEd5bHRlK2VYVmlzWHN0R251bEFPRnhrTjhlTTRkc2NpOVV1?=
 =?utf-8?B?VkRqVnhCWVQ2ci84VWR4WUNnY2IvMVVVOVpKeC9yOFYxYXd1cnhGUkoxMkVW?=
 =?utf-8?B?WC8zUmE5bFRYamRvWlF0VW9rYS9UZTR1T1dwZXp0NlpUdzNmV3FqOUp6MzM4?=
 =?utf-8?B?Y3dwcGtFTDBtMlY4eHZacWs1SDF3dVE5UDM4T1hqa3crUDNtVzJwMnJwTjV3?=
 =?utf-8?B?Y3E5Yy9Ia2ttclFmMGJ4Y08wM1doK3VQM0hXallzekdZdHY4VTQ4L3BRdGth?=
 =?utf-8?B?WGVnZnhpQ3U2WE85bVBKTnRJWlNxbi84R3crUjhPaXQySUwvckN3TGNxajBm?=
 =?utf-8?B?RCt3d1VrZmhDblpCQ3d5dkJNc2NsMGVUTVQzbWFZck4vQUZzRzY5NkxyNWVo?=
 =?utf-8?B?ZkdYN1lyUEZyaUQ5WjNPRWVESFhxZTBTRlM3cWJNajdMMVUvTWVIMm5rSUp4?=
 =?utf-8?B?TENIenpKUjMzRXpxRXp3VzdRd0RaS09JcEY2TWF1NVM5a2tFaWhZVkIra29p?=
 =?utf-8?B?RGgraWdpV1U1clhTS0twc1d0Wm0zSTV5RjZSSW9ZVDdSOEdkdWJoVXVZWmdT?=
 =?utf-8?B?dE9kRnk1MDdJUWpySGJlK2ZsbVdFWnhHenN6SkVoQ3M4VVJudnpEZFlvd0tN?=
 =?utf-8?B?Z01hVWwrbkVWOFRFYWxLcGsxU2V3N2dOOER4M3dudVdyWElUcERCTi9PTWxL?=
 =?utf-8?B?anlEeCtpUGlHTGU4Rmo1cWhXRjBBUm9ibDE5RlFRMlNaN3pwRHNSOG95a09K?=
 =?utf-8?Q?x/SCGgSXD3SisFoH84yABa9mRrr14c8zPuRE3iH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVZlUFYycVl5ZXpXN1VPdHlDUmtTVHJ6REh3KzNsWi9oNEdnWlZrUXk3L2ZO?=
 =?utf-8?B?ZnlZK05LWWpEMUZkZUNWNlNKVy8vdVRVVlZyeENlcWc1bm0yZlgrMlk4WTZ5?=
 =?utf-8?B?SU9ndEpidmdDYXc3TVc4ZSszTHpOUW9ZWW9kM1ltWDJDeXB4b2kxcTJNZ3FU?=
 =?utf-8?B?UllkbHN6MXZKQ3NKOWlDdnB3ejlGWEJqRTA0b00wQUxnV01yamUycXV5RWJY?=
 =?utf-8?B?bzRPUkZEMWRTR2dJYXBYaFpxakFzL3RVd1Y3QmJBdm9zMlFLYVpBOTk4Mzdi?=
 =?utf-8?B?Nmk0S0o2aUdnQ1hNdkhOQXZtVWgrOHFobk83NGJlT3RCWXNBYUNmdEVUcUdF?=
 =?utf-8?B?VVA5dVc1S1RuUjhaU2FTVkh3MVNsaHhHWGttUkJrbkpzS0wvQjVLQkNlUytk?=
 =?utf-8?B?Tjk0SVNCK2RONkM1MkJ5ZUkyWFI5L01TT1U5N1N4NGZLNk53SFhycUF2eUgw?=
 =?utf-8?B?WG54ZndSSjNmbHdPY0poRUkyUjE0ZmNTcVl6dlFZYnhWRjg5WWpqeFZXWDEx?=
 =?utf-8?B?RVNMSXg4QTFBMmdkU1A1SmtpY0c1SU9RRXR2V0RyMEFPOS8vdXdGeXhRZEs0?=
 =?utf-8?B?c05tTlo5QVFiQnh3ZXhzME8ra3N0dXpvZGRycE55MG4zcVkrQ2ppQzFRVjN1?=
 =?utf-8?B?dDRFQXRUMnl1cGpBVDdRLzRXS2VJQUYvdHdqMzVqN1VsdHBreGhhZWR1UnVS?=
 =?utf-8?B?bE5lYXNYVEM3RG8zTTMzMzkvN1NCVWk1cmI3bk5ieW9xVmgzVmVpL1ZxWCt5?=
 =?utf-8?B?Qi8xeitwd3p6WWdwcTZZaC9qUGczVCthNHo5V3JoNENFdlJSdXh2UFJkcUEy?=
 =?utf-8?B?YU12c04vQjcxTHRScWhaZjVmaHR4dGFqRWlMSkNJQ2w4S095VzFDVnZHcjhU?=
 =?utf-8?B?RnFtaElKMFY0NHhHTnE0TlVMV3NVVDliNHBKS2dpWnhsY0ZITEVEWFhacytR?=
 =?utf-8?B?TW5JbS9NMU5hYmN6K3V6U1hmUnVCRVFuYVpsNjJkWlhpNWtzZjJBTjFlTndY?=
 =?utf-8?B?NEtzVnphSU5YRHRBQmdKRXE3UWFJVDI2bVRyeTM4WDdPTW5uaHdCNERFUUg1?=
 =?utf-8?B?aFN0b1JNdWdjVkxIS3hia2MvZ1pvUldhQkl5MFRmTWtKaGNKdURGaWpZcnJD?=
 =?utf-8?B?TXowOE1tVzlTUFRtc21NcXE5ZEp1dER3VVdBYkgzLzNQVmFPS1hxdnBhdmp3?=
 =?utf-8?B?Zis5UG9WUHFNZml6TWpmeUJLa0xDdkJHVHdQY0Fkek5LQ3dLSmpFM0lNWG9L?=
 =?utf-8?B?TVZVcHhLZE9VUXhtdThseXU0MEdJNTNKQ3NOd2YrZUJ1Ykh3WURQakNHN3RE?=
 =?utf-8?B?R29uOWgzRGdoT3ZIc0tkSGdOSVh2c0ZGMXZueU9tRmRrT2VMbzNwNFJQc3No?=
 =?utf-8?B?V2JCdnczcEdBK3JPaUVJOThSSWtiOGdIOEIyd3hKR3RCaCtUMVNFRlF3aTJ6?=
 =?utf-8?B?NTMzcWxGb3RES2g1UkpOQU9HbE4zd1hsVDdtMEJoTmNTYjRsVXpXclNtTmlX?=
 =?utf-8?B?R2ZvNzc2WEQ3ZUJBNFN1TVU5bXJ5ckI3UFUxZFBNbTJ3WHdueHZGY0ZZanQ2?=
 =?utf-8?B?N2lkNlFsWEkwcUg1MDlXOURlRC95V1N5eVdXb2U2eDBRQnpxbytObDNuSjZ1?=
 =?utf-8?B?UnB0RHVKTWZCc3lITkNIaTVHT1piZGFPVldqQ2FHcm5aV2lEbHluTGpiTmdV?=
 =?utf-8?B?V0hzeDJNMEpZWlZYQ0JWbisxT21lV0c2NmYwSjExOE1iUXBzT1ZDazc5dUdo?=
 =?utf-8?B?VjQ1end3ai9Ud1BreTZXSmJPL1AzQUhyQmRFNDVWUzZHSFQ3WHpVMUdMem9y?=
 =?utf-8?B?Y2FFQVh6bnprSTFNZ2wwQzJiNUgrUXZocktsMlA4OFZBTlFJOG1hSlQ4bTBm?=
 =?utf-8?B?N1A0MFJXWXA4SGZPMFJ2ZmtGTzdTbkFDLzJONHhub3hLOXJUZVNkVGJvM090?=
 =?utf-8?B?T1dOV3U2T1J3WWszOTBvU1Z1cnY0OEl3YkZvTkhNSnc0dTJJdGwxSThCbkZY?=
 =?utf-8?B?ZVhZdmF1Zi9EVGg2NzJ1VTFudXN6VlNsU1RSTE9zSEJiRU1oKzVIL21Sa0JF?=
 =?utf-8?B?Z2hKaUllNy9SajUxcjErV1ErYlhORis2UlN2V2w0dnJtS1F5NUZSYmhvYW1U?=
 =?utf-8?B?UHFGbTNCTENDaGlYVkpCTnJ1UVdwTXBLRzVEVXRBVkt3MDlQTnVveEJqOENP?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cc6150-ec92-46e0-20dc-08dd086bca89
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 07:28:41.1080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwNCLBkqp1MqPh8eidUbK0ZVACE1ydrpWnVqv+DzJTMSeFJi+kr+U4AAAVpugRhbx8POrJivla30apPzcRVZvPwsQn8DZzygG9vrUKL+26c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
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

On 19-11-2024 12:51, Dixit, Ashutosh wrote:
> On Mon, 18 Nov 2024 23:01:50 -0800, Pottumuttu, Sai Teja wrote:
>>
>> On 19-11-2024 01:54, Dixit, Ashutosh wrote:
>>> On Sun, 17 Nov 2024 22:32:23 -0800, Sai Teja Pottumuttu wrote:
>>>>
>>>> A few xe_oa tests assumed that the default OA buffer size is 16MB
>>>> and had calculations around it. These would fail if the default
>>>> buffer size is changed on the kernel side.
>>>>
>>>
>>> I don't think this is correct. buf_size below refers to the size of the
>>> user's buffer, not the size of the kernel OA buffer.
>>>
>>> You also seem to be assuming that '65536 * report_size == oa_buffer_size'
>>> (65536 * 256 == 16 MB) but report size is not only 256, Xe2 default report
>>> size is 576 bytes and there are other report sizes too.
>>>
>>> Maybe ok to do what this patch is doing for test_buffer_fill and
>>> test_enable_disable, but we need to be careful about test_non_zero_reason
>>> since that test is very useful for testing OA buffer wrap-arounds (and some
>>> corner cases there).
>>>
>>
>> So, my assumption was that in i915 we were trying to do
>>
>> = (oa_buffer_size / report_size) * (report_size + header_size)
>>
>> which we hardcoded like
>>
>> = 65536 * (report_size + header_size)
>>
>> And this was done to get a buffer full of reports and allocate user buffer
>> a little bigger than kernel buffer as we had headers there.
>>
>> I think this translated into just 65536 * report_size in xe as we don't
>> have headers separately here.
>>
>> Am I correct with this assumption?
> 
> Yes.
> 
>>
>> 1. If yes, replacing it with oa_buffer_size is fine for atleast
>> test_buffer_fill and test_enable_disable right? As we were essentially
>> trying to allocate a user buffer which can take all the reports which would
>> fit in a kernel oa buffer. Am I missing something?
>>
>> If that's correct, as we are already at it, maybe we can keep the change
>> for these two tests?
> 
> But even here, why would we link the kernel internal OA buffer size with
> the user buffer size? User buffer size can be independent of the OA buffer
> size.

If we want to keep it separate then yeah this patch isn't required I think.

I was just trying to make it dynamic so that we completely get rid of 
hardcoded oa buffer sizes.

I will drop this patch in next revision.

Thanks
- Sai Teja

> 
>> 2. For test_non_zero_reason I think I get your point that with the current
>> sizing greater than 3 * oa_buffer_size, probably we could catch more
>> issues. So, we can keep it as it is probably.
>>
>> Thanks
>> - Sai Teja
>>
>>> I'd say let's drop this patch for now and revisit later if needed.
>>>
>>>> Replace such assumptions with the OA buffer size we get from
>>>> DRM_XE_OBSERVATION_IOCTL_INFO ioctl
>>>>
>>>> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>>>> ---
>>>>    tests/intel/xe_oa.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>>>> index 4e4d0fabc..3b65212ae 100644
>>>> --- a/tests/intel/xe_oa.c
>>>> +++ b/tests/intel/xe_oa.c
>>>> @@ -2389,7 +2389,7 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
>>>> 		.properties_ptr = to_user_pointer(properties),
>>>> 	};
>>>> 	size_t report_size = get_oa_format(fmt).size;
>>>> -	int buf_size = 65536 * report_size;
>>>> +	int buf_size = oa_buffer_size;
>>>> 	uint8_t *buf = malloc(buf_size);
>>>> 	int len;
>>>> 	size_t oa_buf_size = oa_buffer_size;
>>>> @@ -2533,7 +2533,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
>>>> 		.num_properties = ARRAY_SIZE(properties) / 2,
>>>> 		.properties_ptr = to_user_pointer(properties),
>>>> 	};
>>>> -	uint32_t buf_size = 3 * 65536 * report_size;
>>>> +	uint32_t buf_size = 3 * oa_buffer_size;
>>>> 	uint8_t *buf = malloc(buf_size);
>>>> 	uint32_t total_len = 0;
>>>> 	const uint32_t *last_report;
>>>> @@ -2615,7 +2615,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
>>>> 		.properties_ptr = to_user_pointer(properties),
>>>> 	};
>>>> 	size_t report_size = get_oa_format(fmt).size;
>>>> -	int buf_size = 65536 * report_size;
>>>> +	int buf_size = oa_buffer_size;
>>>> 	uint8_t *buf = malloc(buf_size);
>>>> 	size_t oa_buf_size = oa_buffer_size;
>>>> 	int n_full_oa_reports = oa_buf_size / report_size;
>>>> --
>>>> 2.34.1
>>>>
>>>
>>> Thanks.
>>> --
>>> Ashutosh
