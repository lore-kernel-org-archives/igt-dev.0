Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF818C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 18:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9457F10E599;
	Mon, 21 Jul 2025 18:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gC0hUfkO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2676910E599
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753121592; x=1784657592;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eIW4/Lqq7yWX36cHiRJWLI9wxmyzcQv7qsEBkIZmvFA=;
 b=gC0hUfkOny92aTDV6nli6MJEs2MmfYvc5BSmMgaFs6oNgg+IAsmmDI9K
 axmKP6U/+9KGmQKcDylP9guKgg/RjmaZWf5acR2NzHlrTUxlyPBUzcjiu
 lht/LRtq8ebagQgX++G9IHTiDCtQni+SB+kA1xoacjxXDu/HGKT02bsaA
 TJeN0KattTaGQYqXTTWWtvgOcMyrRNeGd3k7NGRia2GEa2w2MyDsy+MAK
 F7YFLXQ5eMQWFb/TBLl/bgIOMYKWGdR9GyWVFUVNfCBVV7HbGiPlLxSR+
 cA5dswJOyJYpNLb3HmeeXWbJ8mNNRr0JXfarfBTjQg7oDDVMiqK+p/GnO w==;
X-CSE-ConnectionGUID: SYgnXp2YTGKIBeiIgREZfQ==
X-CSE-MsgGUID: EM5Ad0obSQS7ST2IOeJU2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66035697"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="66035697"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:13:12 -0700
X-CSE-ConnectionGUID: BT3l3/ygRoKRqY0iVSUsUQ==
X-CSE-MsgGUID: rNKmLzTDQYytNbP8ic6XKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="163465138"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:13:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 11:13:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 11:13:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 11:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onOseztunnibWOiCoxhtnEvvTxl6touuiRr8H7gZMUB1OZfCP3Y1R8DAHwgaSXOsq9+bSwoVqL/eoNN9X/NmtOKDnPLFOX16cQX1nkhNf4df6nkiHv2sOAgGxzNfU/WUumhohjzTupIQjRTtgmRFKmgUW4WrN7SmqxjARZI5A7Fm3wh9nGHT2BpIyMzMBemHE1uYNzHpDpxfFQuey9uzu64MgvvnZuprjuZDRitSt20a6dI+Warn3JBQatzLFIIgo8nfwV2Arhl2bYyaMxA0Ls8kd91EKm3Pa8qtIeqbMji37oB4g2OiDlm0mcCeK85KF8UZ0rmsZgIae4UHq2LuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmpjlqCQjaabRxs+GzQ9HkhMDCBwEAWInWMPL6biWfc=;
 b=Hj6dhc+vr/M9afCxbj5ZNC2BNkFCTdrk2ncaQdXABbrT4aTqoNQp7xU8h2P2bpDFv2dF3z13E9nWJwTFUzjtNC7nf+FB+oquq+kkUIKfUxxM7TgvNFex/2VxnHHJX0Kb2fn2Ed575qeVMfxWNj20jUjbgTnAxIxw9/Cey1XU/dnrhigQDxHP0KmIbwFnzn5UIOWD1B2eYIXC6z/OrBCbFtqcYfkY7N3IvDpoIuj+8NXvXd0bJ/yhzKTVU3t9SAoLs2+8AZ55LKHcm5BNfEP1NdcIoPhc+mvMkrwv5z1tkY52Oxm6h7EtQtWMGB+pKyhXzw7ndwPaveuAIUevU5p3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 18:12:25 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 18:12:24 +0000
Message-ID: <ff0b3b95-9048-4fb6-8527-8214722f9260@intel.com>
Date: Mon, 21 Jul 2025 23:42:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/1] tests/kms_cursor_legacy: don't inhibit pipe
 CRC calculation
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250715123623.832027-1-michal.grzelak@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250715123623.832027-1-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e71da89-70c4-41d3-dac0-08ddc88224d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkFmRm11SUZ2NmM0dEtuMDZkRXVObG9pM1gxRlUrWmlxcWd6WVBnVjVOZVVO?=
 =?utf-8?B?RmNBRnZTelBNbDF2NDJ3MzcvYVRJZEc4dDZ6dy9GZWtJZnRpZkF2aGl0OGZu?=
 =?utf-8?B?a3pNYmV2RXAyMzFHUUR2c2JKRmpQU3l6bHZXWVJ1U09yZ0ZqZ3hmN29GZG9D?=
 =?utf-8?B?OWdRdS9YL1VKdU1wWGlhY1VjVFhWdjQ3NElLNzNpVzJmTjlFMTROWHNUeVR1?=
 =?utf-8?B?Y0dma01PeHdKbnFSdWhEVDMyNTJmNHhzVVJjbmVPY0pVckJ5M0pIR0JHOElV?=
 =?utf-8?B?T1JzSGNkRlJrbEZpS1ZkS3BKMGJ2MCtDWUxHUHlSaUZrMzVpY2VHWGJydEIv?=
 =?utf-8?B?bm0rMVZQWXdEVkFCak4yUkx1T3RLc3FSdWhDd1lYMDdsdDNLUmRMenllQUVz?=
 =?utf-8?B?TWFHd1phaEVubFJpOGhnRi9BUjFaYWhVOU1qVUE5bEJiOTFGYmNrd2ZEUnNH?=
 =?utf-8?B?VDZqbGVZOWZCSUZGKzJGY2cyS0R0Z1FURUNJR3V4bFpWTEdZV0hpcmNabTEz?=
 =?utf-8?B?NWkxUzNoaHRiZ05OQkpEbU5hcWpyVU5UdDYrWGhQZndUZ2VKUHB4NWRTN25w?=
 =?utf-8?B?YXZMMG5TSHo2QXdtYmJjcm1ZV240T0g0U3Y0Uk9qVXRUNlg5ZHJKYXNNYUZ3?=
 =?utf-8?B?ek9nSFgwVGNLUGw2TTd5S09MTWhrNG1JbWFtd1A4RHROczgxdFFxbEY4VEl5?=
 =?utf-8?B?NkNYbk5HaXJESTBabmltREl0UTZ6bHFEZEtyREZ6enF6SlEzMndtb1lCT2dP?=
 =?utf-8?B?REtiOFBDTUZkekVJUWh6ZUJPRWo3Z0FxUnFuOU5NdUZSV2NyWDdMa0tNVjdi?=
 =?utf-8?B?aUgrS0pna2wvRkQwRG1JYmZaWS9POGJMdE84N1ZOY0NBNnVyZmsyTmtxUHk0?=
 =?utf-8?B?UWozTDhjR3BHdFYvUi9pMG5iNEVwVmQ1VGIzZXovd1FOa3FXaHg3d0Nlck5i?=
 =?utf-8?B?NTZiVkdPSzRHSnhzaG1Wc2I0NnRhS1RaNHdtWFJDWEVFYzhaOFZiVEQrYVpM?=
 =?utf-8?B?NHVRZDE5VXNHcHUzcC8rd0FaUW43R1ZBVUNuTDFVM1pCRmpYbkVBWGVmMXNS?=
 =?utf-8?B?cjF5TlhuWFlUM0Nwb1l2UDMvOG1BdFRCTy9qMVVwNm5uQWhmNEJXcnFoT2hh?=
 =?utf-8?B?OHNReVBsWmo0ZE4vTzBlRWdqNlpnS0NVSE0zbVdtdkVqaEZ2cXdpSm5ZaEVW?=
 =?utf-8?B?ZDF6WFI5eDNxNDhnRENPRWhMQUxqZGViNjFwM1hoVVlFeG12ampzamxvRVlP?=
 =?utf-8?B?c3JQV1AvUEkzUXZpL1Yvc2U1ZGkzaHlIQWxxTmhRaEw0TU5XMjNCdHVmWThr?=
 =?utf-8?B?R1hxeDJjeEJ4UUt0SVB6S0NjN29hdW5FdVc4OUIwL3k4ZHhvWUZMRnBmMHZS?=
 =?utf-8?B?L2tjcXhDR2R1bExxTHZvWkJ1VC9Nb3M2RDFoVjVuOXYwaFZuWkhudTFEMnlX?=
 =?utf-8?B?cU1JaEpNSXNFTTJyVTBxN0t2L0lEVkVnd0ZUeVZkYWRwNmt2RmFjQkhaWHpJ?=
 =?utf-8?B?RTFMaVFTVkVOMnZZalBHK2UvZ2RzNHRUUlJsa2dFaXh2c29hQzZyN0RqUXBK?=
 =?utf-8?B?K01lVTVodVJUQjRLOUFGZWwwT0FuSGVwcjV6SFF2WUdnTnpaVVZ0a0NsQ2J4?=
 =?utf-8?B?UjEzVUJKQlZRTytkVVUxV05jS1ljdllTNm1QNmJSc0ZNZElzMmJGZ3NQQjYz?=
 =?utf-8?B?RWFyeVBzcFh2bGNsQU9pUEExaUppQUhGeHpjVzlGcDMrb2pmR0VNajBJaWx5?=
 =?utf-8?B?STRFSldLL2d5ZWRsV1pFTnFzY1A4TnRxcWhjRXRUWVR2L1VKbkQ2aWNualVR?=
 =?utf-8?B?c1AvbjFIdVV3TEt5MEFHdXlUNTV6QlIrZGY3MzZiRkFwODlYanVqT2k0dW9B?=
 =?utf-8?B?bHhtV1NwVjN0V0oyS3JtS2JQTE1nZEhwVDdpNmJhbVBiR1J2U0x5WlNlQlRP?=
 =?utf-8?Q?9wlZNIdZj3g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFI0aHZqeW9lT3VjZ1NZQlNtZVVtVFZCR2tpNHBnQVF4enZRcFV4Ums4Lzd3?=
 =?utf-8?B?TmIzbkhCVG5iWFhjYjZmMm5kN01yMm52WG5QNDJPL0pzcmJtbE80WUxDdWRD?=
 =?utf-8?B?WGd3VjFNNW83dVVBaThWZUFaLyttUU41ZE0yVDhSeHFhR0xMdEJiVmpaaVFF?=
 =?utf-8?B?dFJObnhGKzlXaFZKOUtvM2hGN0JiVnBMVHJoMy9NU3JKbG9VNlpPMlpOR0Fa?=
 =?utf-8?B?QmY4WUh1L1hsSDlQUVJVbU5HR2hkTGtPd0syTldIdnRqUUlDR0c0OU90cGNt?=
 =?utf-8?B?V2p5TTZXNEdXY2V5Y29hdGZLU3BNc0RWTmJiWjJKRUUzVlBBR0xGU0psSFFw?=
 =?utf-8?B?d1FZR3N3dDhod2Y2R1JqWWF5UmIwelZPbzF1N1h0ZURQZmdxcnhMUDJsNC9V?=
 =?utf-8?B?L05DR2JXRHVNeUhKdWJ0a1RPOVd3NmJZdGFYYlVTWkR3Ykd2ZDZDdDdxVG1w?=
 =?utf-8?B?LzJDRElDUFJyNnZUb2crWm9PMHBhUnRBT0NPS3JYN3gzMGs4MGV5cXlheGRp?=
 =?utf-8?B?bjZWMjlkeXhEcURPMWRGa2pGL3NIY3djTDc3KzR0OXdISTBIZkJGdjJGZnQ5?=
 =?utf-8?B?OG9vTWk4MmRBeXR5NC9Ja0VHMlh3U1RKVHJXNEdCejVHNWhCUTFPc3VGSWdw?=
 =?utf-8?B?bWw3bStyQ1FHRW95bmhGdTROd2psMW1VSUFNVjcvZi93d0F1eXg5YnRSUEJE?=
 =?utf-8?B?WGhhVGZ6aEFEWng1b0VYeUdYd3RsT2ZiZXBpd0U2bEJkM0dLbHI4M25hZnpF?=
 =?utf-8?B?N1hhM3pWVnRSNHdhMC85YW9hU1J2TDJMenRQcEhJcHN1MTNsYUZzNkcvbEpv?=
 =?utf-8?B?REYvaWxIVjluWkttZllPQUdBVzVMTGVaWDZ1Q2lRcVZmWHNBNm9ha01vbElt?=
 =?utf-8?B?TitEaFBHK1o5RWxFRWdvQ1NJZU5MSkFGbnBlM0JLUklyMGtmaGRXYzBxaG1t?=
 =?utf-8?B?bzNjL3M1OE5MNXR3ZjhQREk5VDNhcXRBNUVMT1JOams2c2NLVHNzSHJZQXc2?=
 =?utf-8?B?QlVxS2llNGFYZ0xoU0NxR0dvNXJ4aUZxTGpzREIvSlhGMTE2SzdWSlFrRHFT?=
 =?utf-8?B?Qzg2R1dmR3QvbGtqL0lkMDJZeW5vZWJvMW1Pdm5WMGFxMm44ZUs2LzV4NzEy?=
 =?utf-8?B?Tkw3SVlHWHZRajJEY3FsWmhtaGdscUEvaWhEQis3bUlSZW1obk94d0t4TnhR?=
 =?utf-8?B?SVlHN2VFbm1ialpTbE5TNGptMzc0YTJ4ZFBqdm5oc1YyWWRnVHBsMGliTllM?=
 =?utf-8?B?ZFBXeUFBSVBxeGhLL0NBeEc4Nmp3Y2t3N2toZWEwbnJRdXJkRGZ4ZVdaRmhF?=
 =?utf-8?B?NXhHTUh2aUVIeGh2MThjMlo3b2s5c0dEamxjek9SbnB0N0p1c09VS21iN0wr?=
 =?utf-8?B?ZUdiTEpLK3A1akJObVhqdEVIaGJaTEh6YUhiRFoxbDYvL01CSzlUcmVtYitC?=
 =?utf-8?B?bVdHTmJvYmVLbFc5R293M1grMENEUlJlMmRwU01xY3F6NHBtdFh3eExmNm15?=
 =?utf-8?B?L0g0dkJLTTNveXNaR3UvYTF2aUdYMkNTeEVIT3Jtempxa2lNR2RwUVpGMWJa?=
 =?utf-8?B?QW85WVovdDZ3WUs1dGJZTTIzTEppNThpZUgzQ2RLWSsxd05kNEdDcDlHY1c0?=
 =?utf-8?B?UDNwczZQZjZTRWVwMTVNeGNDQjh3WWhzMElIV2kydldtckNiWnpGNVVHcnBN?=
 =?utf-8?B?Mm9VOHpXSFhoRU5rTXF0cGhIdW4wQlRxZDZYYndUeVdXYUFyM0dqVWI3SXJM?=
 =?utf-8?B?ejJYbGdHbkdqSU1IQXQ3R3RLYjRYeXdFMmNJdkFWNHNDbHpVS2F3cXV3N0Nv?=
 =?utf-8?B?NVdWdm11SWVKLzJWdUJNMFE4TEhrbk5YTjRTaEJCVHFkLzZXenFyMFhIQW4w?=
 =?utf-8?B?V3lKQ1NRelREOXVwSUUwMGcxckRXNEZIdE1hSmJiN3h3dDdoNzNwcFlJM1lP?=
 =?utf-8?B?NzZoVkl6WGFyMVk0NVp5dzhmaUFxdHdhOTJ4RXNjblVzQThJeklUaGtGZXcw?=
 =?utf-8?B?dWdDTjY3WWlUKy9SQXdmTmFaOTRwRDczUmlwZmhFZHdtcjdRbWhMQTRoMEJG?=
 =?utf-8?B?RlRSYUNrYjY2NVpVQ2g2cEhFOEQwSFIzWjM0TkJSLzNXZmt3TFhOZ0ZWZzAy?=
 =?utf-8?B?M25Xa001UE00NzJvTkhCRG03azk3ZkVqam1NYjZtQXNJU2Jpc3YrbUFFQlpV?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e71da89-70c4-41d3-dac0-08ddc88224d6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 18:12:24.9117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAHX1FLZHVMVjkf8SF8r/dtQcIbPfqeV7D2JNoqBxBPoOtvAnla66uOuaVYWe5qOm8X4ndkZQYc3cZXYOTWYBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
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

Hi Michal,

On 15-07-2025 06:06 pm, Michał Grzelak wrote:
> Running either flip-vs-cursor-busy-crc-(legacy|atomic) subtest from
> kms_cursor_legacy results in entering PSR1 after the test. Even with
> PSR2 enabled panel, it is impossible to switch to PSR2 via
> i915_edp_psr_debug. Kernel does so because it prevents inhibiting pipe
> CRC calculation which is allowed in PSR1 but prohibited in PSR2.
> Therefore subtests from kms_psr testing PSR2 feature (e.g. psr2-no-drrs,
> psr2-primary-blt etc.) are failing after running any of those
> kms_cursor_legacy subtests.
>
> Restore enabling Panel Replay Selective Update by cleaning pipe CRC
> calculation after running the subtest.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 9f6e644e1..2ef9690ea 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1751,7 +1751,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
>   	/* Clean-up */
>   	igt_plane_set_fb(plane_primary, NULL);
>   	igt_plane_set_fb(cursor, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_set_pipe(output, pipe);
During clean-up we set PIPE_NONE. This is standard clean-up process.
>   	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	igt_pipe_crc_stop(pipe_crc);
Can you re-order? Put crc_stop() first, followed by cleanup? Check if it 
helps.

