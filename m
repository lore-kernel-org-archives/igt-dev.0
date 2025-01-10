Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5550FE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 04:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0914710EF94;
	Fri, 10 Jan 2025 04:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFAafA/K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B6A10EF9D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 04:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736484838; x=1768020838;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DIBoJUPnqsi6ahamBHY45/MEnmL2EYHjuamAt9lRXk8=;
 b=dFAafA/K308hAljeCQJUPdjnE3PIZKBI8A57pPZPCDehaeq7rWh/hYiv
 qQvqEAG1YhaKYkaxelH2R5BUsVufnbnic2kz1ndsSvv+UFznPl6VmXYqx
 qFnvcr1k2CTNmuSdf6bqfoFYoqPm0VM8B4od9d0MX1JDD16X3xhuW84z5
 JQdXeXleT/Txl/BQ4587a6P00JNOX+aGONV+vhdMkg70UEBcXrrZwYnNC
 VWfgEkUXbACY2e2VdNXlxjRQHwO/UBvSXpRQA2qDNN2NUuUXpA4kGRVHi
 ovPjjhOJO1CgGmN0IeQxElrL/k/Pw6OTF/6MmSN/JSt5r21JTBES/0PhN Q==;
X-CSE-ConnectionGUID: kajWktg8T6WDai9LsAQRmQ==
X-CSE-MsgGUID: pmRZAZ7ET+yQ4BwbhPAm5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36793363"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36793363"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 20:53:58 -0800
X-CSE-ConnectionGUID: FlIIq1z2SXeEGY1zVvjLUQ==
X-CSE-MsgGUID: RpbDVsUPSU6Msk69QJ10Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103676550"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 20:53:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 20:53:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 20:53:56 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 20:53:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCiwc2GEvFiAhmsIAQZiFB4cjyyuilv3WliB1RKqYhEKtP+zBBTt2LbaLwiZytLCmdEEFNa2dUcUHA+PtDYjdBmE4OcBlZ6hPbSao4WTvMi80ZiGDfExRW3bdL1Vbi2BoiL1IPYQ+uaerKSkhO2/U4Kudz3H6XZlNNBYGhAde1rGX1+0eWuHe/vm5AcNo6fISfprI9/bJl4cGgthNRIK5ccpRLgqRp5Y8hIoTk0PA4bX0fBtfzcC2itwMa5oIPImfgAzbMwSCaJOtRUXZ+ob5q7ew7IRND4cqJfKSBuJK+76YHZZJ/Bn0Bcpxrr41MV2xERVaX3myRPkD6y5ZkqogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pB4nqD5pSTDDvtFL8JcQiywUJ33VKdo0kNaUxWXvhI=;
 b=MdXuu/deSZPLBeZWTWPmEKhf8AFEJWEI0u+SOARSVVFVnfoG3vHKGSKgM+5u79eTC2JFDzPp1No6dUyFdTyc62kcBEG609NMewZ9zJvnqcZZKOV+Ymw9s5RovudoPkdmODYR2kRFT44KoaTljubJVOaE/VYnS4fX/IlS2TOTw6CK6RGuUxI0TZfyeYjgBDcS8pQ0L9bmyhQA+PCg5GSfC8nLHSEHWcLoVGJX5RozkobgE4np3b/tLpEum/sDYcVwocdrIuqd3Rm3Mzp2c9EIM6uN5mZXEkoVQ0y+mKTX4FF/+sakAsUiIcx2p7ZamdfxFGPrwklXdnqXA/adu5twug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 04:53:35 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%5]) with mapi id 15.20.8314.019; Fri, 10 Jan 2025
 04:53:35 +0000
Message-ID: <1b82eddb-3dcb-4295-a4b6-1feeb64d72c4@intel.com>
Date: Fri, 10 Jan 2025 10:23:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_plane_scaling: Add logs to skips
To: <igt-dev@lists.freedesktop.org>
References: <20250109083858.39089-1-pranay.samala@intel.com>
 <SN6PR11MB27047C2A43C1513897388E25DB132@SN6PR11MB2704.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SN6PR11MB27047C2A43C1513897388E25DB132@SN6PR11MB2704.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 443b2ff3-58ed-4c97-fd5f-08dd3132bd2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2hNNzVHdlo5dTgxaXZNelI2R1JCVkZrT3RLZisvTUJ3RDk2RHpEU1BqcWJk?=
 =?utf-8?B?aWFqcHd6T0NNdWI1TmV5Zzk5UVZ1aC9mdWlHYVkzYTRTNUl6cmlqb01iSFhn?=
 =?utf-8?B?eGZCMGVVSEowVGdSNXdzREljbWJKOUtPaWF4Yk9MSjdsTDc2M1gzeTdKZ283?=
 =?utf-8?B?V3hmWndzZzFKUWw5ZnZrQ08wS2pyVzZxUnJZenQ0MVAzMy9ESG9tOWNlakUr?=
 =?utf-8?B?VVNuSUtIVHRtVGgzU3ZrS0daTTVkZ25hL0tMM2I5Vk1MQXZ1OWw2ZHJ1SXlM?=
 =?utf-8?B?cXh1Z05nYTRTajluU1RYWDZ4MUp0a3lMVy9mRWNyYXdWUHNtQk1Vd01uZkdx?=
 =?utf-8?B?N1FwcVVWUDdJa1oxcGh2RXpUaVp6SE1PYThXTHRpOE5oUitTbFo0cUczOVFM?=
 =?utf-8?B?SmN3V1o3WU1JUk5YZ20rZExLL0hhVWVyZ3N0QmlFdmtaWmNLL3kzdjRGRGMz?=
 =?utf-8?B?b1Bad1M1T0oyZXJ4OVRNMU1jVXpWZ2lZSWhzbjBDVWVMamhNV1I2Z3c4TmE5?=
 =?utf-8?B?UkdtK0lMbC8yMCt3WlhVN0paR2plbWp3WCtDZStsQ3E4amZQNG9RcVZRMlE1?=
 =?utf-8?B?R2VmSFkweHNnaXdFVEJiUDllT3ZhMjZUT2xaMURzR056aWpqV3VJaVhqajYz?=
 =?utf-8?B?V1VwNDVPTHBZM3AvQXQ1TlJETzZQSlBhWURyVm94TWVMcGN0b2JwcEhwemxW?=
 =?utf-8?B?d1NpNzgrZnN4cnFrejJFRW5zRUt6cnlBeEVFbWNXMi9ubEUzODhyYXEraDdp?=
 =?utf-8?B?b0NuZWJiZVBqRWJOMWhzSnZRQmxpekI3MEdOci9GamErM2J4Q2c1NCtYYlNs?=
 =?utf-8?B?RDdvak1YRnlmbUdNTW5LZDhmcUZqSFBXQzVwcG8yL09XdEJFUzZrOVRhZCsr?=
 =?utf-8?B?aTVta3gwMml0dXd4Q25abmFoZmFVNG9GUUdlOEJQSHdzNlRuc0NVWitsanFL?=
 =?utf-8?B?aTZrS1Z4elI5VEVOVzYyM0dlQTREak85NW5iTEJNSHFVWHJCcGFScnZPd2ph?=
 =?utf-8?B?MHNoUUZROUVsMkFTV29HMUNLUTE2VEJ6Zi9pTVNjVFZMZWlVNTVhRS9JUU1P?=
 =?utf-8?B?Q1FvazNyelpONS9waklwVXNZNE1LeHBYNFBzT1FOc1RUN0VpczFqQ2hQTElX?=
 =?utf-8?B?Z3lBY0hCMVF1QUJlSExub1h5MVpYdGtIRm11VG5maEpqL1B4YlFnNTNxbWY1?=
 =?utf-8?B?RStIelR6ZGdQck9JY3pOM3RRUjZTa0M3OXZYMFVhOWtjZkhmYVBzUWc1ZXlE?=
 =?utf-8?B?amxzNHJjemtySy9GQjAyekF4QkJ3cDI3L1RQd01sQ2pRVjltZ0g4Rll0S0li?=
 =?utf-8?B?dWRwSlo5YmlSUlFDRWY4RDlzbXorWGEydG5KQ3lWY0lVWTdYYTZYSDI1UzZN?=
 =?utf-8?B?M0dlRWlTalBRWGVad0thZ2gzUWtxTElzbVd2YnpBVERBam9SZEdZVnJNVVlL?=
 =?utf-8?B?QnVTVko4eU1rQW5PbHU1RXBPb0ZxNzBzZ2tUQWtZUzVSdk41NlExS0xYclJq?=
 =?utf-8?B?VmpDVXFFZHdwNnNpZmgwRjdqc3RiUHpsRE9ZaFhiejRvcW5mVUdVUCtkczNs?=
 =?utf-8?B?MXRPVUVWN1lZVkY3Tnd1Y1NKMkFjNUpEUGZGVXFDV1RkUDlZUEEweWZHRXZj?=
 =?utf-8?B?NlBEZExKOThLRmRBZUtWb1hrUzZVS2VLYUVIZ1N3dGFmWEprVFJScmVPdHRJ?=
 =?utf-8?B?M2tROVlBSUhiR1dNZVBOaDJoWkxTZFowOW1tdndCZ3FHM0pHZFFRbG4xNWk0?=
 =?utf-8?B?SU9yMGo5VGUzWnBmeEZWQ1lPZ2cvcnNJOXdRZXJkY2wzNVNiWmdCckpONmo3?=
 =?utf-8?B?Vk1kS2hJYTVsQWxaVFl6UjdycHFwTHQwZUd2dXhnS1FGRFN2bjhGNFdQWHVq?=
 =?utf-8?Q?Hrt8NcOHl+8hO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1NUbHJReGp4ckFxNWJpd2UyT3NSMUJyY0UrMlBQajhsU2NkUnJGUHpjd01q?=
 =?utf-8?B?SWs5ZUxXdWRYN2huTTFxQldPczZYWmZLbUtBYVBldzNpS0NGd1pXTHRxVkRx?=
 =?utf-8?B?ODRJS3c5aW9tU3o2ZHYvQzFLMThjS1Q5VTZhU2w0ay90WGZrVDBpU0t4Qkgr?=
 =?utf-8?B?a0RrZE4vbS9WZEdiL3QzOXowR1piLzRxSTZFenVNQUh2VGJyQ3p0aEVVVi80?=
 =?utf-8?B?ZjBEak5iaUs5TUE0SGVBVnNVd2wwaUtyRWdiTE50SWZGeTlhd0hVY2RZM0Ir?=
 =?utf-8?B?K1ByS2ljSmVFRGErRFRWVWdxOWEzQmVLcGFCS2dpNUppSDhvNHB3NW1IbDhv?=
 =?utf-8?B?bFNsWE5qaFFSdHM1SDEwT0FlR3FkSzB2MUt6UEJGN2lmSnkzUnV6UE1KRC9y?=
 =?utf-8?B?ZzdXTEtldlp4aVBvVjhIY3hxUEk0cjlDQkVBZzJBbVc4ZzdmYnpvS3M4U1l0?=
 =?utf-8?B?bXFCdXdpb3c4QUlaMnhVUHk3OURRUURnTlFxaW9yakh6Tld3bkRERXdWWGcr?=
 =?utf-8?B?VW5BNk1oWTFPL0pLUUFudENrMS90bUpuZzR4SjVya2pKeGFOTkcxelZ5Sm9a?=
 =?utf-8?B?MWk2bDRadFJaTHJDSWVPN0dta2d3RUc4Zm9IeDRUemFSaHJSR2o3d3pvS0pp?=
 =?utf-8?B?NkduR0g0cE1kOXZIemZ2bDdXUWE0VFpzZkJHczNRZlplYW51c1JhdWdvUXho?=
 =?utf-8?B?Nmg4YzRDbGZMbUs4T1FPa3pGQ3dTV0FhUGJQVXFsdkx6V29jVUh4NUg4N2I5?=
 =?utf-8?B?OC93QlRHZE1paDZRTWcveTNEeFIwZzZoelpSL1Q5K241SHphT1ZOS3IvRlQv?=
 =?utf-8?B?dE9xZURZMWJkYTNWUlltNVdSOGwvbFgvNHE5QnBjNXYxQ3Bld3VQVWV3blAr?=
 =?utf-8?B?Yi94L3pMaGtUVHp3WmZoMFJQbnVDZU9KUk1yOUFtK1pNSmFUWngwRDIzTFhm?=
 =?utf-8?B?dUhzUUN4UlhjV3orTkFhenBQQm90Lzg5Wll5SlVpYmdFcFlnOGR0T29raTV0?=
 =?utf-8?B?SkVFckNUYWVqSGY4UUpXK2t5Qzh0YW44cVpKcGlMc1k3c29Oak5hOVI3M2gw?=
 =?utf-8?B?aUxWTkZWRkhRUXZaSlBaVGlCdjNzU3ozamNkd0tLaFJWWHBlS1M0MUg1WDFn?=
 =?utf-8?B?MEJkcFRjQy9pQ2dwejgzdTI5Mkgrek5oUU5Ib25LS2hEeVFBa0ZNN0F3TDYx?=
 =?utf-8?B?UThZQ0lBZU96Rjh3ZUdrNlI5NU5CazkzcTd4dXB2Y28rQmJhRVpHdDJBRjZ0?=
 =?utf-8?B?OFhrcWs3eXliMDh1SFgwcFpPTDFrZGdPQUkyWlgyL0RIenZEeXd5Q3RCZWxp?=
 =?utf-8?B?TWlRM3RJZjJHNVgwem1FU0RzRlI2aytuTTEzbjdHSDh5MUkxQUZtWm00aUV0?=
 =?utf-8?B?b2xtUklKTTRNQ3ptNnVMbkQra1IyODdSZUtMcUc4NVl5ZVBId3dwVlNONnRK?=
 =?utf-8?B?VFJiRlo2KzVlVzhGdjV6cmZvRGhuazNSa0J6TWR0UldjQk9Qd0JDYmpTNW5E?=
 =?utf-8?B?em1MS1B2cmtJelRCRmprMko2SGpQbzVndExDU29NWi9aRHNyNWdwdUZLNFlL?=
 =?utf-8?B?TG83NHdzZXMwZHJucmVGcHo3RS9GYU5Nd2plS2hBbFFhU1JUWDV1YVE2cmlj?=
 =?utf-8?B?NjcvWXd3MWF2MkhLeU9DeURSOWR4bmZTRzQzYndxMUFnMDBMM2l4bjlkd1Zy?=
 =?utf-8?B?NDRFbnFSMEVzaWc5cFlVN3Q0WXNhaHZVUXliUXBGdFlXM2dRUXFucnhlOVpv?=
 =?utf-8?B?OTJIWmtHU2ZsSUVmYS83c3hDWXJWUjVEMXQxK1hjOHVBN0d0U1UwY0s2alU5?=
 =?utf-8?B?M2RSc2U5Mi9pSUxtaUVJaW80cmVXbGgveUJ3aUdVUStKb2RaUzU3V3Mydmtx?=
 =?utf-8?B?MFhpZW5jUlpDaTMzaDRLSzhubmd4dTVVTm43WEhERDZDUUFYdkY2Y0RkZlVi?=
 =?utf-8?B?MitHanR4angvZHlVTDNUdnlPdUV2SnRlZ3drWkRkL0FVM2lzTFFOU0RWOW9p?=
 =?utf-8?B?ZFpSd083VFdrU2tHbVFqNHhEMnZQbnJySTQ1M3FibDdVNWRNR2hISUpXZnVJ?=
 =?utf-8?B?Z2xtaVR5Nkw3b1FTcVp1ZkVzMld2QWNxN3RyRFVtKzVabkZYWHRhSVo2MUM1?=
 =?utf-8?B?dG9sNUMzd2I0Nno4QzVlNEc2VUdPcktDQkJNWmhUbTd5TVZRdGxHQ2xLOU5S?=
 =?utf-8?Q?/7vmbVk0IJOyi9RkD8yPeKY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 443b2ff3-58ed-4c97-fd5f-08dd3132bd2e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 04:53:35.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fH8jpIu92r1ro7SMrX1GysKPb2NmSL/LJIv9ftl++g54r2hGT7cp8iQsrqGqKrs4sk9AGk6FNAgfLmdwjssSiF5Lt55+IdbtPdYJ4vN1xIQy0HulXHPzcaP74CspE858
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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



On 09-01-2025 22:29, Reddy Guddati, Santhosh wrote:
> Hi Pranay,
> 
> ------------------------------------------------------------------------
> *From:* Samala, Pranay <pranay.samala@intel.com>
> *Sent:* Thursday, January 9, 2025 2:08 PM
> *To:* igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> *Cc:* B S, Karthik <karthik.b.s@intel.com>; Reddy Guddati, Santhosh 
> <santhosh.reddy.guddati@intel.com>; Lattannavar, Sameer 
> <sameer.lattannavar@intel.com>; Samala, Pranay <pranay.samala@intel.com>
> *Subject:* [PATCH i-g-t v2] tests/kms_plane_scaling: Add logs to skips
> Having some logs for test failures & skips would
> make debugging much easier.
> 
> v2: Add output/pipe name for detailed message (Santhosh)
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> LGTM
> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> 
> ---
>   tests/kms_plane_scaling.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index c8c9aee31..43f578d55 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1577,6 +1577,12 @@ igt_main_args("", long_opts, help_str, 
> opt_handler, &data)
>                                                                          
> kmstest_pipe_name(pipe), igt_output_name(output))
>                                                                   
> intel_max_source_size_test(&data, pipe, output, mode,
>                                                                                              intel_paramtests[index].planesize);
> +                                               } else {
> +                                                       igt_info("Unable 
> to find the lowest " \
> +                                                                
> "refresh rate mode on output " \
> +                                                                "%s 
> pipe %s\n",
> +                                                                
> igt_output_name(output),
> +                                                                
> kmstest_pipe_name(pipe));
>                                                   }
>                                                   continue;
>                                           }
> --
> 2.34.1
> 

