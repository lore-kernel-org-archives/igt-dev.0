Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12B5C282C5
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 06:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B0310E209;
	Mon,  3 Mar 2025 06:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YON4+Wt5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B28410E209
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 06:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740982254; x=1772518254;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NCqXuCp1FeqCQFzR3B01oivFRjYmmdKLlC7T8KOcPdM=;
 b=YON4+Wt5ibmewc0C/wGaoZsOsEm8lnRCbeYWaKQkIe40tMnNOLn2KiPM
 uoByhqmzJ2bBHngCdMj58moVdk9r/WibPksMw51NCWFFcbpV+4E1+EQwd
 bY5eQ9rd1oJPueMmctdTO9swHQAuxzD1voPTjhMyEC5UyYq/q/btiy6PW
 KCQJpzCXwmTqWr4kNS+p7ELfabKOx1joPeBGc4hWoE867PZhBK2qBo92V
 RNnwRZEpaJkP0F2m9bXqveJBB0SA28jfCKWv7uEj7B9/GRDwvfG8riye5
 lINfSF86hTsn/tlppbn7ySrLzsaXnuH/c0a2weVPmiCMugi4SIPAEHZlU A==;
X-CSE-ConnectionGUID: hx+B+jJxSUCogIg1Bz5NOQ==
X-CSE-MsgGUID: 3I/mjkOqRdGWYG+QeISQVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41545901"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41545901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 22:10:54 -0800
X-CSE-ConnectionGUID: EFVcjAP1TkGVBYwDqElRDQ==
X-CSE-MsgGUID: Zobg4rbxQ2GUO8MoMWEVTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; d="scan'208";a="122914886"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Mar 2025 21:42:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Mar 2025 21:42:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 2 Mar 2025 21:42:33 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 21:42:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLaN8O01goKorx9Bv6oSYJnBASRY9LWQGqExP30QlKqlH17eL74MgmcEvlBUtPusS1aqpWqZHpaqMHOVALig/IezjKnYsRZxETvexHcthayGvGKjbYnBELUH4SfVr8iBX0ZDHjqIWOEcO4nXaOOR6yumDu9AhO5TAXjcBsM9YCfkf+eb+Ruwc2r3460gMMQLQILVu6LMk5w5ViIlc1m3xs9IRnjkQpPcg0ee3saAOgzg7Lhx80XoTlRFlcv8KqsSNVoXFPonXsiXMFW9orDg5qSHigi/DPduOGkXOFN5WsdX/PHsf6HJJnRGjV2p8/qDBVkWM4vXSSUHnfZ4TUpU7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeLYu3R1EMYPZ/U9JtP0TxHeKJ26tz4/N+4C22VXZtI=;
 b=gloHoS/qdOIgPFUie07LwBUqwmK9V8zWg6Fnf00RGImSCTyDcR02j6yFgmv+3LFNhQkjK+jB7qU3EZaSGt4Q7j4YdLZQfi22n3IYzg0JqCy5mN0y7TYPqINoCfAm3fa+0NmdPEORpJCw2uV3Y0o7/hAYvicIcTpHJ74Dmdz1fjYIo5DMin+ZAqTRICBG7JSVfKZLcUHj3gqvtJus+GDobeyT2RPnOXBTKv6qV/cysEcdXEny7/kRQECYizHtawBrWiGn9rPtaGw+gNB/QvPSDG8H+qYI4+tP6oY7Lep0oglpRgOlvVZVBAyD7xpox14l42HuD2kY+wwTZ1/oyJMoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 DM4PR11MB6358.namprd11.prod.outlook.com (2603:10b6:8:b7::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.28; Mon, 3 Mar 2025 05:42:31 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::ce44:a4c6:b3a7:8341]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::ce44:a4c6:b3a7:8341%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 05:42:30 +0000
Message-ID: <748b7023-c0c1-47c8-9231-2ce066b49164@intel.com>
Date: Mon, 3 Mar 2025 11:12:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Inject errors
 during observation IOCTL
To: <nakshtra.goyal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
CC: <francois.dugast@intel.com>
References: <20250226232055.2835226-1-nakshtra.goyal@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250226232055.2835226-1-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::17) To DM6PR11MB3243.namprd11.prod.outlook.com
 (2603:10b6:5:e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3243:EE_|DM4PR11MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c2a6aa-e12b-46b9-b0c7-08dd5a163056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzdTSnNwWEp6bTRYN29wazJzNUluNllJTnFkZ0RyWjVwUVl3b0tpd2V6S09B?=
 =?utf-8?B?eVNnMlFoV1lHU3Y5R3puaW1VR295aDliWi9WNGZtTnk5ZnFCYlFuYTBMMnpa?=
 =?utf-8?B?MFUxcWJ1aEhyRGdlNmtCb2xlcHdEaU1aQnhUWW44aWxLZXNlQWhqVDVZeStE?=
 =?utf-8?B?M2U0WS9YRFlXQnNBWkdhNmVlcVpBNXpZQjRRQUNBMXp3UlRla3BPNVA1QnlO?=
 =?utf-8?B?WG5aSGl4Q1RBU25HSEt6c2Zqb3NpcGM5bmJBTGFoNVZZdWtlaXh1TXB2QXpD?=
 =?utf-8?B?b2pldERnWEtBeHhpYTcyWTV6MGNwbFcvUThtZEp6M3M1ZWlkQVpZamxVUmlq?=
 =?utf-8?B?alpNZjVtb2wrTVNNazdUbzRkNEZocG5pRG5vWlh6T1ZDa0dOTUVOZ2JoYWU4?=
 =?utf-8?B?RklQNEdQWkJ2NWExRXpjZWg0dThQS1Zyd1IvcHBtMm53S0FpZkExOEg3TnlJ?=
 =?utf-8?B?NmdEdDRyZU5sckUwMWRIQzUyVWlvaER3K0lYRlZZcFVnNW8xWVFzOUlaQUF2?=
 =?utf-8?B?RThLN2thcWJBNERJS1lKWnI5SWY2K2loNkJnTng4RnR4czZManZQZ0FoRjlU?=
 =?utf-8?B?TGdCNW1EYTJ5QVFqc1U5WmV5ZlVMYTNvaVM4SXAzVXhjZGFpYUNHMG1BcGUv?=
 =?utf-8?B?VHluM0R4NTFNSUNYbGIySXdOOGRUelRZNGo1RlRSYWdxbjNDTW04amczeWQ1?=
 =?utf-8?B?ZUJlZENTakxIeld0MTlNWGdqWHQ4L3k3RlRXcFgrUFc5YWllQnEyODJQakdG?=
 =?utf-8?B?TVZWTUpReURQZklKUjRFMHVpVzR1bWZNQWNGcWg4ZjdmelhFSzQzRy8vQ2Fo?=
 =?utf-8?B?TlYvUllXNjVweUx5TWxnd0pxY2R1R2c2TDh1dzZ1RUk2MWZvQzBWaUhUVmIw?=
 =?utf-8?B?bDhNT3NRRUhVc3RlNVliMC9hOE9HODRldGxWTVNpZjltYTRmai82emR2RDBS?=
 =?utf-8?B?OWcxTTJ4MmpSRmpLd1MwSTF5bjBuNFA1QzZPVkhiLzR6STVXblQraGFtNjdW?=
 =?utf-8?B?cExsVmZQWVZCM0FTRFJRblp1Sll5eUxnOTRxZERKN1VJUGppSDhTOG9QaXJF?=
 =?utf-8?B?ZzJ5bWNmU0RPL0RwQ1JINElUY2VpTENNVWQ4VlhvTmFpdWt5NGpXS1B1MENs?=
 =?utf-8?B?VGl3N0crUlEyS1FYQ3B0b3dIOTFqQm9kWVBmdlJFdVp1UUR3ZUErcjhEejBW?=
 =?utf-8?B?OFpVWElUZXJTV3VBaHIvTzNaS2QrcGYzWGJzMXl2NzhQb3dYZ0hSTzV5Nm5L?=
 =?utf-8?B?WXRrdXRuZ2c5WTJCZmVGbEM4NHVnZVJPZ2crMnR6Y3gxL2xpNWlTaUx6K3Jy?=
 =?utf-8?B?WnpzSVpFNTlhbys0bGZkWUl1VnpmK2xlUFUxaHhEbFdtVUpPZmlJN0pQZnpR?=
 =?utf-8?B?bnliQzNSWFJEYWhBN29jQ1lIUG9vUi9hZGNhZzNMaDVCMDg2dVVtMmRacTll?=
 =?utf-8?B?WUVWTTJuT004TTFwZmgzaGp1emMyTld5dzV5SnA5dEkyelFuVGF4d2JFZnZJ?=
 =?utf-8?B?OUJNYkJ5UVBDTXVnM2crMkhMbFhhWU43dFllcXF4TG5Ja3RwZG1QS0dlMDM5?=
 =?utf-8?B?QU1EUVEzRng2U1oyUmpHSkRwck5VQVVQWFZnSzZCNTIxMmpraHR0QlhHeExK?=
 =?utf-8?B?Y2h1RGJweGY3TDhENHhHZmFnZkN3RmVOVzJ6UFdERjdCVFlPa0h1VUg1YUdi?=
 =?utf-8?B?aUo4bk9CemdjZFZETEpGT1haSUhTWnY4NzVKUHNIVW04NlFIbmhtR245MVJu?=
 =?utf-8?B?cmxleDQvMC9JQTJuaTFucEFGSVFLeGxDemdDZWNUN0tvS0QzK2ZKUmN5UG1T?=
 =?utf-8?B?N1NzY0RQdmdxMi9UNklYWDNOQW1uUi8xN3NObGVHd1ZpbXpvK3VSakNJQVFD?=
 =?utf-8?Q?lJCJJZeXwg2M4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEFueVN1WlVjVVVjeXMzTk5jV3V2bEZ1RVRaYml2ZUh2RU5CaXBSWXJnVE1P?=
 =?utf-8?B?TjdhZHBGYzFxOXNmdXRNR1ArSTZKRlZLaTZGR1dxSW1JNW8zV0RtUGh5akRi?=
 =?utf-8?B?SStxblRvTGtqT0pRdWRSZTdnVmN1MkNLTnh5WTRqYjVZSDAySkpYNW1OV3FT?=
 =?utf-8?B?ejU1WEJWMmxzaUg0bDEzRitiL2RUN05pRmxPVExIRzhiT0pLb2wwM0VQWmdP?=
 =?utf-8?B?SmhHVTZ0ZGlTTURqNDdTcVp0dDJka2tVbVBNTmNRYi9QQ3NkZVJyTFBGdW15?=
 =?utf-8?B?WnlMdXpPR2Z5eGI3ZGJ0YVVoelJxSmNkZ3h5Y3p4aktkT0MyTjZsTWx0Ulh5?=
 =?utf-8?B?a1NBeVdDdCtsaWJjVkdzaW0wVUtiWW9FaEhCMUZrWjM1cXFUdm9wZEtvVitN?=
 =?utf-8?B?cmtkQmhPdlZKZ2p3NW15MHpubnB1RHUyWGdJb1hVMHJ3cGZ4QUtqRjFEcUk1?=
 =?utf-8?B?NVhDQ1JYSVBmMElTWG41T21rS0h2dFFRVUw1MXo1MjBTYXFTWmV2eStJZ3A0?=
 =?utf-8?B?bTFSRkFmaE93YkdqenNmNUxmb0dNMzYzQVZCdG9CKzZNR2kyVFovMkhsM09o?=
 =?utf-8?B?bVBoeUZxYndTc2ZUMkhTemxvZ0VjSThQMnZNcEUzUzFZS3pvVlNJaHo4anNB?=
 =?utf-8?B?RUFsNkVJT05GZkZZbENDM0dMeE9NbTVZMlh6bkc0Qkl2ajJabm9RR1VROFVj?=
 =?utf-8?B?NDAzMkFKQkN0eFZEVnhWTzBad3lyQkV4c1UxbWlhdDhGb3llTGsrOWgvR3d2?=
 =?utf-8?B?RnF5VGFwTWZBV0hWYjNsb1MvMytObDZMYzNBVHJsSUpuQnBlTDBzckVsSno3?=
 =?utf-8?B?NmZiRWRLV2NkM2dwa1ZSZXI0UjBQUWEvQTJuMVFyTXBFN0N4eDBXOElOSStB?=
 =?utf-8?B?NStkTEJjV2dPa0wvT3R4dmRXVnN3SXNBeUlkb2hKSlpPOEtBdjhaSGcvSVZF?=
 =?utf-8?B?aVdZTS9vZHZDbEdxWi9aUG9wR3B6QzBsNjF1K2d2T0cvcDdvWVA4NUNYSXNC?=
 =?utf-8?B?MzU5c0MxbGFSZHpVTU8walk4TEEvSWptL2RhTXl5aUdMNURzTThmZkVSVmYz?=
 =?utf-8?B?WUpkdXVuK0lxN3ZiSDhNWG5VZXo5UUVQS1dUM0Q5b3FTY1pTbmE3RGZwa3d5?=
 =?utf-8?B?ZWpnd1dNYW81QVR2WmNBQXdMeWRXODdkSEFvRllhYlltL0RSOUJhbUhkaWY3?=
 =?utf-8?B?SlBCVnZTNEVJT2kwUS96WThIcndDcVFTV2dkNVE4TitUVWc0cjFnOTFDMUxx?=
 =?utf-8?B?M2JqbHdnWmhtcEYvWk1mV0JlMEVwejBUeU9HYUJFMFZsZmdNMWtLelZnTHVD?=
 =?utf-8?B?djQ5MGg1ZVBFMHp4UmxqK3lscDVOK21LYlhqb2hXUFNsRVBISXhMRkN2K2o1?=
 =?utf-8?B?Yk9Qd2wvWmxCUWp5aXUyYWswZlhCU3NyQ1BYdG9tZHBqbzd2KzJ5V2RIWUhT?=
 =?utf-8?B?aEVWNFdCSVlyWEVOOGtXQmg1czFveW5PWmNsTVFHK2l4eFltUTYvbEs0R0ZT?=
 =?utf-8?B?cCsvOUlNb2J3L0p1R3RBSmZaVDRqakQrSThaVUxidUdDODdla2hzelErVGEv?=
 =?utf-8?B?akdFNzVYVUtWQ0U4bG9KeHNkSzFBSVdZMUl3d0IvSngvSjFGSmxDQllDQ3F4?=
 =?utf-8?B?MHMwSXdjZG5IdVlySzlKWnBoL0xIc1RKbUVpaGpsckx5VTY1WWRTV0V6QTZG?=
 =?utf-8?B?MXJCOEw0cjRNQm5MTW9uZUdTN25WdVpNNWptTUczUjcwdFk0dThKdk1tb1RI?=
 =?utf-8?B?dVF5c3FIZ1I5RW1OaUd1STVHek5xZk1SWDNmL3kzeHpXQ2h6eXFQUnM0Y0Zw?=
 =?utf-8?B?Z0VrSFZvckhpbVl6TWdtZzBEbGY5enZGR0xJN2hreG5lR2tuZDZ2OUd3OUdh?=
 =?utf-8?B?WEEzbjlFbENKWXJmSXprSUJUMSs4UHczMzVxYk5LSjFlVG5DeDZGTDIwdm0v?=
 =?utf-8?B?T3krREZvQWFPZ1YrQk04MUJPSzhKVGIxY1ZyZHVYK0crekJ3cWlEQS9XWHNi?=
 =?utf-8?B?cnF3MWRjOTQ3QjEwNWJlbG1oK05wMTcwTUp4M2hYeDlwNzlQaWtHcm93Rk1l?=
 =?utf-8?B?R3VNRHpTRjRDaG9DdTRWL1RsV1hWaDQyRndiNUV5UzVEUHU0eXh0bFd5RW05?=
 =?utf-8?B?YUFCdThtbkRZT2diRitSMVZ4dGhBNTg4VWxpWmwvMlpQemFuUjBCUWs4UUp0?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c2a6aa-e12b-46b9-b0c7-08dd5a163056
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 05:42:30.8063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avC9d9fzlG92rRuRkUNZDoYp24SpPtrKo8XjD6rd74x6ZKKyx/bF7v9az/tUGyDi/VvjR4ywlUmvWnLr8erv6ciF1AJRR5Jq+CYHHcZzW6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6358
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

On 27-02-2025 04:50, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Use the fault injection infrastructure to make targeted internal KMD
> functions fail when executing xe_observation_ioctl()
> so that more code paths are tested, such as error handling and unwinding.
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 54 +++++++++++++++++++++++++++++++-
>   tests/meson.build                |  1 +
>   2 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index ede483535..09792bc34 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -20,6 +20,7 @@
>   #include "lib/igt_syncobj.h"
>   #include "lib/intel_pat.h"
>   #include "xe/xe_ioctl.h"
> +#include "xe/xe_oa.h"
>   #include "xe/xe_query.h"
>   
>   #define INJECT_ERRNO	-ENOMEM
> @@ -281,9 +282,49 @@ vm_bind_fail(int fd, const char function_name[])
>   	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>   }
>   
> +/**
> + * SUBTEST: oa-add-config-fail-%s
> + * Description: inject an error in function %arg[1] used in oa add config IOCTL to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_oa_alloc_regs:		xe_oa_alloc_regs
> + */
> +static void
> +oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
> +{
> +	char path[512];
> +	uint64_t config_id;
> +#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
> +			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
> +
> +	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
> +	struct drm_xe_oa_config config;
> +	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
> +
> +	memset(&config, 0, sizeof(config));
> +	memcpy(config.uuid, uuid, sizeof(config.uuid));
> +	config.n_regs = 1;
> +	config.regs_ptr = to_user_pointer(mux_regs);
> +	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
> +
> +	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
> +	if (igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1)

What if this sysfs read fails for some reason?
I think we can do an igt_assert(igt_sysfs_scanf(sysfs, path, "%"PRIu64, 
&config_id) == 1) instead of an if here so that the test doesn't 
progress further if the sysfs read fails.

> +		igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));

I think we should clean up the config by calling 
DRM_XE_OBSERVATION_OP_REMOVE_CONFIG here as well as done above.

Thank You
Sai Teja

> +}
> +
>   igt_main
>   {
> -	int fd;
> +	int fd, sysfs;
> +	static uint32_t devid;
>   	char pci_slot[NAME_MAX];
>   	const struct section {
>   		const char *name;
> @@ -319,10 +360,16 @@ igt_main
>   		{ "xe_sync_entry_parse" },
>   		{ }
>   	};
> +	const struct section oa_add_config_fail_functions[] = {
> +		{ "xe_oa_alloc_regs"},
> +		{ }
> +	};
>   
>   	igt_fixture {
>   		igt_require(fail_function_injection_enabled());
>   		fd = drm_open_driver(DRIVER_XE);
> +		devid = intel_get_drm_devid(fd);
> +		sysfs = igt_sysfs_open(fd);
>   		igt_device_get_pci_slot_name(fd, pci_slot);
>   		setup_injection_fault();
>   	}
> @@ -335,6 +382,10 @@ igt_main
>   		igt_subtest_f("vm-bind-fail-%s", s->name)
>   			vm_bind_fail(fd, s->name);
>   
> +	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
> +		igt_subtest_f("oa-add-config-fail-%s", s->name)
> +			oa_add_config_fail(fd, sysfs, devid, s->name);
> +
>   	igt_fixture {
>   		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>   	}
> @@ -344,6 +395,7 @@ igt_main
>   			inject_fault_probe(fd, pci_slot, s->name);
>   
>   	igt_fixture {
> +		close(sysfs);
>   		drm_close_driver(fd);
>   		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
>   	}
> diff --git a/tests/meson.build b/tests/meson.build
> index a0f984b34..ca5565c21 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -398,6 +398,7 @@ extra_dependencies = {
>   	'perf_pmu':  [ lib_igt_perf ],
>   	'sw_sync': [ libatomic ],
>   	'xe_oa': [ lib_igt_xe_oa ],
> +	'xe_fault_injection': [ lib_igt_xe_oa ],
>   }
>   
>   test_executables = []
