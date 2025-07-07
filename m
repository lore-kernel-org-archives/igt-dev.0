Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E301CC8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 16:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9865B10E4F2;
	Mon,  7 Jul 2025 16:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEbNbS5a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B937710E4F2
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751907434; x=1783443434;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RTHRSiEVqzLeXDEOdioGK6YzNvQs8ry73VlVcyR9vOM=;
 b=GEbNbS5aP29VDWZglR1Q1znjqQ837dG6RebWvoHG5DWS+z5XV8zAlWFX
 WbEjt9yN6nb86Ocs39/W1IAskFDnT3lufkifs0a0cdegl1Pn4T5/6PiUn
 Dqc+bCfMFtTlNK+ylPLyfPgN05Xoi6k8ovRbQR6vfQrmoo7d1DqgryJi8
 riTdKxL3JfBkVgM5oYbnFuAxN/iU/lFKqdoQ/3KVXERjLvQifu4aL7fOo
 Bpz+32ow/Bo3b5f+OePA0e7eGfTryiPnoXCtALp/Nu3qzyRqcRX3srZjr
 Z9vO4UEtsiDPCulJW2hR8nq44rDUb7eJ47spoBIR0eBcaBwqXP8fCMoVR Q==;
X-CSE-ConnectionGUID: +H7Mls0uSnu+AfDmMG43fA==
X-CSE-MsgGUID: x6lStTc0Sb2iOmJGwxXWvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54106849"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="54106849"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:57:13 -0700
X-CSE-ConnectionGUID: YNZ14W2CT4WHolR8HrdOyg==
X-CSE-MsgGUID: UiIW0aHoTPe8rB9kwdC/FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159596456"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:57:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:57:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 09:57:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KicVgwzkbE1+p0GjyLfqxlBL6ktt4NrPr5fzqdQSIOvx1M53IshzAa5OeA4YgkL0HtS+dyjPrFKb5qb/pHdWL4aA3W17mm8/KOCE403nllaADIJ1p66zPRJFjawsh8bKnjuZ7fF3DjaOVP3ap7Gzasv9bpYzrf/q09sYqpYQ4sDDkafHm7gVwynydPGfA89F5eX8SJ69Wu0rkGEW/lUGL+BIezVgXH7c41dO5gSb4a3/rz9vV9K7/gydZQ7YCM5AdgEzBMpcKL/M8jQiLbPcf+vqGHKe16BDGUDtHGaeonEuc3e6cJMRfgAMa59XdBS6f1YFXcth/C9XsS4eATzKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0GW7vTbrLlENV1Nxi6K5qjZJrCSNkWm+SRAGjZRxWc=;
 b=Rgv1TRGmUPnTG87dVgjpGFcfxnQephCh7hVrcfhzmnh2hOcsZi7lNP/P/3S8XNxcLuYQPz0bKc1uGURR/Fmoe9g74iQDQKwMDPVmhBvWmWBeceM0WnYRhUlyt52RhGkew2IbTSbeuKq35cm+GI2YAf9RS6p+qRPkXjlr+frIVrTZ5oPH5Tphfv9t69/wDssqAqy5PbkoSofStf9OSPXBOhoE/Xtg3Sb3OycFmoyJpD5eq1FADQ6Z4vVpM/RKnaB7yFU8ZlgFkcWa02s7zjZeKK9xn0TkqbdtJFP8igmZptQjiGIX6Ck4AmOpgZe/WNoJQYLmK7Jo16iTO8h99r+KWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by BL3PR11MB6484.namprd11.prod.outlook.com
 (2603:10b6:208:3bf::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 16:56:57 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 16:56:56 +0000
Message-ID: <0a1fcb63-98ec-4779-ae74-b7adb6d1d1f9@intel.com>
Date: Mon, 7 Jul 2025 18:56:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] lib/gpgpu_shader: add function for computing max
 number of threads per tg
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <gwan-gyeong.mun@intel.com>
References: <20250701135307.68147-1-jan.maslak@intel.com>
 <20250701135307.68147-3-jan.maslak@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250701135307.68147-3-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|BL3PR11MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c1ff6a-d6df-42c1-64c2-08ddbd7747c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTNqbHJ3QVhod0RBOElJQ3ZTdnFZV3Rqa3RWVDl0UUQ5UmREMDhQaDFheUZ0?=
 =?utf-8?B?aGpWa0ZmQk15enNwRHgvWEg4TXVYVm5Xd3VDQVl1N2gyU0xqNjlibFBwalVF?=
 =?utf-8?B?SUp0TW43L2pWSjI0NmVxOCtodEgycWx4ckhPSDY3NjUxaTlSZVJzeHp5NXRP?=
 =?utf-8?B?ZWxzNmRLR01DaXZMNmY0QTc3U3VwNDdvMGZuTW1Rb1ZhMVpNWnRBU0F2RXZ3?=
 =?utf-8?B?Q1M1RkduaG1HWDF4R05BZ0dpY3RXS1dCWEhqNDByTWJxN2NiNGVHZzFFcmRo?=
 =?utf-8?B?OTF4YWVraXNHdXRKenlST2VWdjMzMHpBdmhocFRIMGNJMWU2TE9pdHp3M05H?=
 =?utf-8?B?Q0FFZEdndWQ4NXZTRy9yM0l6bm1FOGFEY3h6VlRHT2J2VnZTTW56R2xqQVdr?=
 =?utf-8?B?bFBPNGpxR1R0MGE1VXk3U3UyVDFxTjgxTndVR3N1bzhLM2xlNzVQaGxhY0I4?=
 =?utf-8?B?ZmZ4QVBieDFxRWhVdnVZbHY1MkQxTGJzTkhmK2ZRZ0dDRHpBbUR3SDVQM3dR?=
 =?utf-8?B?SUtFTnVQYkthKzlpWWNzbENKc3ZLUEFML1pKL0U0LzVzY1Ewa010QW8yWERm?=
 =?utf-8?B?blNkNUxHZnFHS1c4alcwSjk4WWtBKzJwTllSR0NrUXh5TzZ1ZkFUeWsxZHdE?=
 =?utf-8?B?dC9TWTNIWFpERnFKb2l0dWd5SlpHQmJ6N2hyLzlsNmZKR2UrQzNDYk5TYkhm?=
 =?utf-8?B?M0VUS0QyVDJibExkNWdWakdyaVR4c0hjNG5MZ2g3SzNsUENIaVMwaUpwR09o?=
 =?utf-8?B?MkdCNDEvRDJBWlJQNkplSFlUQ1JDZncxQUlaam52Q1ovU3JrcW5iUTErMEJY?=
 =?utf-8?B?WTBKd3dqNTEvN1RvQWlleS9Vb2w4QmVQQTVLRkNxRkhGaFRVRkF3RXduY0Rn?=
 =?utf-8?B?YXF1dFZnejJTaG1vNlNJY1JoaWdENVBKbzVad1hhQlV1NTEweEMxZ1Y0a0xK?=
 =?utf-8?B?TzR5VjVBay9QcmMrSkJvNlNnTmJGeTFMengyUzI4T3RSdWpONmdScUlOMG54?=
 =?utf-8?B?ajBac0tlblpxVkhNWjVXRVB4blpRaGo5aGJLWVQveVVHcEdjV1NITVhRQ0ox?=
 =?utf-8?B?eFhVamNXOFFjSTNJdGRVemRoYkZnYm9UZng2bkJENFU2TjdyMWt6UmJ6eHY5?=
 =?utf-8?B?cnU0V2g2dkpkQVU0WEwvSnFjT3NSYmZSYnJxRTYydjRrRlFUU29uSEsramI2?=
 =?utf-8?B?b3ZUQVBBY3hOZldsVm5FOEw0c092NEhuSS9KQ0NmRHNLUkdCaDFoc0RMR3NQ?=
 =?utf-8?B?MkdMS2kyUDlqdlNEVGFnK0Y0dlVHQVVNM3FKd2NGejdRSUFsK0ZMOGtheGZn?=
 =?utf-8?B?ZWZQTmxMeDNubUY4TEZnZW45SndXdWdheEdyWWU3S3lEQnliLzBLQU01WnA3?=
 =?utf-8?B?RnV6Ukd3R0NabDllUjhwcVVHZnExNkFjbVZSM1JSVWlyb2NlNVkzMjBZU252?=
 =?utf-8?B?Y0UzVVg5MkxNWlYrck5PL1RzWWh2VDF1QTZaTVlvcXBrV2pxN0crQWY1NGxh?=
 =?utf-8?B?MlZRU2k0VERhMnowYmJMY25RdEdwT3RMMk9WcjBIVkE3b3FiSUpITmZtdHcv?=
 =?utf-8?B?c2JtR2NkVDBCeEwwT3BvdXhoeDd2ZzRBUlovZjF2amZpUG80L25LWURtRFhY?=
 =?utf-8?B?M0MvdDZyRFZIQnBzUFYrckFiRTF2VmRydFVmVldDM09rbHMySjVTOXFYL3dC?=
 =?utf-8?B?Zm1PTjd2QmM3YzVWM1d6WXBVUHY2OHE1Tnk4MTcrZU9BVmFHRUlqcDNTekNW?=
 =?utf-8?B?ZExTZnV5NEY5dk9sK29scFBKb010YzZNMmVVNnRxYzRQTUVNdzZ0SUNUSXUy?=
 =?utf-8?B?anBQNzJQU0xOZlpvTXZLQnh6SDF6Wk80Tld4QThpNjgrQWJTanhPVXVwUzF5?=
 =?utf-8?B?ZHJ4Z1lhTDhZUnhTZEJRSk1kOThvYk5TeXFOV2h0RzJZb0ozVkNJRWFVdjhV?=
 =?utf-8?Q?2gDUkv3M8tg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmRINXZmRkxxcFdCVDRteTNNMDBFREtKYzFERU1OcG5paVFOTG45NEEvelZa?=
 =?utf-8?B?N1RuakpRYnk0VElpSEs2dE1kWnF1bTE3RS9pMTRVeUZBY09MbW0rMGFjaEVt?=
 =?utf-8?B?N0ZZZG1OdXMxRUg2UGZ6bFF1Z0JWYVZrb2pHVkNIRUNDMm1vcVdqbDQ5Q3Zx?=
 =?utf-8?B?RjBUR09UR0ZzQUZOblBGUW0rZXBnY1VCZE1vWFNnMHZaSmxNcHBnZHpiaisy?=
 =?utf-8?B?Ylhud3R4bXJuZXVnUzlDVEl1a3B0M0xTb2QzZ1BCS1ViOXdZYzZUSFJtcVhP?=
 =?utf-8?B?WlFUNC94cms5YWJKT2g2QnRqdytFMW5ZVnJmb1FLVXByMEhSVElNUGFjcFBx?=
 =?utf-8?B?M3lHeHZuam1QL0pkcFhWRzVNem1IYnY0YTl2a1QwRGZUclRONjFGaG1SMW05?=
 =?utf-8?B?Vm1yQmtuWEpQWE8rYlZ5WFBYcW9VdzhLT2ZhTk1xKzY0SldiaEFEUmh0SmhD?=
 =?utf-8?B?MkROalVqZVhQWEFuclFXTHo5bTBpZ05DNnB6Z3poUWM3NkVwS1dxS2k0b2RN?=
 =?utf-8?B?d1B3dnpHWllHdE5BNnh2SlZkcGQ2c25iWTl1SkNJUTl0MWpCWi94SVdtRWt1?=
 =?utf-8?B?YWRTWW0xZm1rRlFxVVFPRExYeUhINy9FVFdJQUdMMVRNWjZZMjVIbnlKQjJo?=
 =?utf-8?B?NnprUitpWUJlVzBJQ3FCcXFoeWdKeE5scTFVLy90bUdGK1R2Wm44Ni9NdW5x?=
 =?utf-8?B?SWdYOWJvNmcwdzRxRDF5cUpzLzZVS1NzeUVBYXpIbXp2SkdjbTNVZGo3QnRD?=
 =?utf-8?B?TCs3OU1XeWk0UE1sVjFOY0JabXRmZC9wUTZ1Q0lUK3FnM3dJd2d1S2o1TG1P?=
 =?utf-8?B?b0ZOYWZMMGxUTW1oaFZBNE5uQzFUZkFjbkU4RVZFNm5CQmFFNmNzZmp4K2ZF?=
 =?utf-8?B?bmtLWjV5c1QvS2YwUWZwVHdWclJBRUJOYlNDblUyTWlUdTdHMWdQZ0VRUmJk?=
 =?utf-8?B?cHpCbHFSTnU2dzZpSE5IUS9ENk44K2s5a1hxc0o2Q0hBSXdYTm5zb3VBRTlQ?=
 =?utf-8?B?WnNpMU9rM2FDeUkxZk1DQ0RRK0pyeGFpWXVOS3F2aVVHUmxZUHprdmdKbDYv?=
 =?utf-8?B?S2xtNWJ0YmNRYWFXWE4rV0g2R0E3S3dKTDhpbFJYTlVhb3BJYWJKbUY1NUJ4?=
 =?utf-8?B?Mk1QeDc4R2tQRmRzbjlXWkIzdU5yNythZDIzM29SVmFpTmdLb0NGdDY1c090?=
 =?utf-8?B?RzVnY3piR0ZhcU1DSDBiT3RxRHVrOGk0L2NJQzJYMnU2YkFyYlVGbXFzeDF4?=
 =?utf-8?B?NC9mSFJTTzBRcExIMEc1MUlDczJYbFpyVjFNdWpzSzJaTlJzODdydXh1ZUI4?=
 =?utf-8?B?M01jbk1zVXdEY3Z3d1lSRHpoY3hqUmVMVlJKaHBzM05qNWhlcFRnQ0wwY1l0?=
 =?utf-8?B?QitTeTd1ZVZtTmFsaUFSWFhmei9STUhtcHZwM29RNU12cUtDOWhUWFRPZ3JH?=
 =?utf-8?B?MVJrU3BGMllhVDB5dTEzRXA0RUx0clJzUDJHekMwbGhsY0wxNkd2Vk5uSXMy?=
 =?utf-8?B?dWZBc2xhUWZYR1lFRWlvV2FlVGl1aXUzUU9VNmdvSU1RL1dWRzJ5WW9aM3Bw?=
 =?utf-8?B?eGpaNkIwVW56d1dWREVUWWRSK0lsdlJ6cWpPQkFSWDh5eTMyc3VUTWkrTlZI?=
 =?utf-8?B?ZlJCbmluVTBNcUVZaGhtQWd6SGphV1N3amI1bDJBWDZNZGFPY2dnV0hBYUFX?=
 =?utf-8?B?c2crc2p2ZVNEQ3Nxb1dYWUxCazYvWitmTHBZNVRjWW4yV3lKQXN3anJRRUt6?=
 =?utf-8?B?elUzb1JJcFNCUk5ZNFUxUE1pc2h5MTB2R21yQm5vZ252UFJvVkpnVDNKUEJY?=
 =?utf-8?B?V1hFcVFGVkltKzBjY3U5azFscTJ3aDJiTVVxZjZPNnEyTVdyaFZBQzBUeTRx?=
 =?utf-8?B?YW9pRyt4cjVoU2lYa2c0TWJoSTVFNlFxdkdsZGhWWkhiRmE1RXZKemNQS0JP?=
 =?utf-8?B?NVUvVE8zQU5FUTZreTVLdDQzRm55RHlsZnhMdDU0UitlalkzVk1BbFdrYVhs?=
 =?utf-8?B?VFNoYlRsVTFuQU5XbTZrMDd2YXdvTCt0NzFVKzVuSXQyMjN6dFNUT0JrRXRU?=
 =?utf-8?B?RHdacDIyZjNBRFlaVENXRExnRnp3Mk9WYyt1aDJENTRvSUl6QmFKRFdCckRu?=
 =?utf-8?Q?55KynBD885r2/JAiLkMsn8GFn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c1ff6a-d6df-42c1-64c2-08ddbd7747c2
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:56:56.2415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: piV581NXRBobXU18Qe0O0a0FQ+9NxB7zsylSTc0wvVmVlErxOcY5ooQv1sE95BppGOGOwKXEZpyDHhz6qHNEig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
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


W dniu 01.07.2025 o 15:53, Jan Maslak pisze:
> Adds function compute_max_threads_per_tg() that computes the maximum
> allowed amount of threads in a thread group for XE2-3 platforms.
>
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   lib/gpgpu_shader.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
>   lib/gpgpu_shader.h |  9 +++++++
>   2 files changed, 73 insertions(+)
>
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index b83e645e3..7e1d73d72 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -919,3 +919,67 @@ void gpgpu_shader__read_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
>   #endif										\n\
>   	", lower_32_bits(addr), upper_32_bits(addr));
>   }
> +
> +static uint32_t compute_max_threads_in_tg_no_vrt(bool large_grf_mode,
> +						 uint32_t simd_size)
> +{
> +	if (large_grf_mode) {
> +		return 32;
> +	} else {
> +		if (simd_size == 16)
> +			return 64;
> +		else if (simd_size == 32)
> +			return 32;
> +	}
> +
> +	igt_warn("Unsupported SIMD size %d\n", simd_size);
> +	return 1;
> +}
> +
> +static uint32_t compute_max_threads_in_tg_vrt(enum gpgpu_shader_vrt_modes vrt,
> +					      uint32_t simd_size,
> +					      bool hw_local_id_generation)
> +{
> +	if (vrt <= VRT_128) {
> +		if (simd_size == 16)
> +			return 64;
> +		else if (simd_size == 32) {
> +			if (hw_local_id_generation)
> +				return 32;
> +			else
> +				return 64;
> +		}
> +	} else if (vrt == VRT_160) {
> +		if (simd_size == 16)
> +			return 48;
> +		else if (simd_size == 32) {
> +			if (hw_local_id_generation)
> +				return 32;
> +			else
> +				return 48;
> +		}
> +	} else if (vrt == VRT_192) {
> +		if (simd_size == 16)
> +			return 40;
> +		else if (simd_size == 32) {
> +			if (hw_local_id_generation)
> +				return 32;
> +			else
> +				return 40;
> +		}
> +	}

Quite complicated logic, could you document it with bspec number.


> +
> +	igt_warn("Unsupported VRT mode %d or SIMD size %d\n", vrt, simd_size);
> +	return 1;
> +}
> +
> +uint32_t compute_max_threads_in_tg(enum gpgpu_shader_vrt_modes vrt, bool large_grf_mode,
> +				   uint32_t simd_size, bool local_id_generation)
> +{
> +	if (vrt == VRT_DISABLED) {
> +		return compute_max_threads_in_tg_no_vrt(large_grf_mode, simd_size);
> +	} else {
> +		return compute_max_threads_in_tg_vrt(vrt, simd_size,
> +						     local_id_generation);
> +	}
> +}
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 411ad6292..b4db48b32 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -14,7 +14,12 @@ struct intel_bb;
>   struct intel_buf;
>   
>   enum gpgpu_shader_vrt_modes {
> +	VRT_32 = 0x0,
> +	VRT_64 = 0x1,
>   	VRT_96 = 0x2,
> +	VRT_128 = 0x3,
> +	VRT_160 = 0x4,
> +	VRT_192 = 0x5,
>   	VRT_DISABLED,
>   };
>   
> @@ -103,4 +108,8 @@ void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
>   			    uint32_t dw_offset, uint32_t value);
>   void gpgpu_shader__loop_begin(struct gpgpu_shader *shdr, int label_id);
>   void gpgpu_shader__loop_end(struct gpgpu_shader *shdr, int label_id, uint32_t iter);
> +
> +uint32_t compute_max_threads_in_tg(enum gpgpu_shader_vrt_modes vrt, bool large_grf_mode,
> +				   uint32_t simd_size, bool local_id_generation);

I wonder if it wouldn't be better to pass shader as parameter and put 
all parameters into struct gpgpu_shader?

Also for public function please add prefix, maybe: 
gpgpu_shader_get_max_threads_in_tg(struct gpgpu_shader shader);


Regards

Andrzej



> +
>   #endif /* GPGPU_SHADER_H */
