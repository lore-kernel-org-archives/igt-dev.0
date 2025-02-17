Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB15C021A6
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3893410E399;
	Mon, 17 Feb 2025 08:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUQAxpd6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214AA10E392
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739781325; x=1771317325;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TAYdNfSizuygeUi5T+Hf4EtdkrCfg5ojk4t3Q6ZQ86Y=;
 b=kUQAxpd6J9wgazp6K/taEqvZjzSr/kSbxLVpuP8VxaeS0j677r0acJQk
 7p3a/odOksE01DvK+Qu8dX671ZMfo2HhwyNwoU+REkEyrwZMc8gFRI7+P
 Q4b6dvYvQmGzgLWI+pimJkwPPCkUI+PckYIhyLBgwy8JI0ICMroKCoZeO
 /7sE8sBtbV653voKOBmFD2rq+YYtUmTcBEFQ7P8Cvk8cxw7lpfSYrOetU
 ZrvN8Sqm9f9D8GNLoxEe8tdm2i+E1fOOgHuN+U8Ajeg8HPIViq0V5fb9P
 /XYfns+MAS1eo0ty9HHaMIXYPPo24N9hw/YDUH4wMHL/sqQqjsDGi4ztV Q==;
X-CSE-ConnectionGUID: P24daoXUSzOlS48E1OEbHg==
X-CSE-MsgGUID: ub8XWITiRjO74rrb1b3lSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40483676"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40483676"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:35:25 -0800
X-CSE-ConnectionGUID: RyozlGPzTTGZpwNwm5k8bg==
X-CSE-MsgGUID: jbm/hvFlQdyVAkv1acKuhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="113993332"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Feb 2025 00:35:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 00:35:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 00:35:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 00:35:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLpA747USRRxURjQAFsEbg5B63OEe5bOyFGQx1kfGH5JcDxo4uyv5/AqeULPKi+ctf0Jpk7bFhQUnI5arapEzijgyVed21vYu9DnffUSVSXALOich7+PO+2SC9ocF7qxBBrACmXy7vn6XLhwNtLGOoOrE1OUp2CFomTvoqXnm6K73CBSW8SSGtC7eaJHtOghncUhbeEjiU0hn2eISVpSifY/6U0CiNnYRbN4l5HyNn+iwSEB4Jy6IMvFqGDA3Re+PRBngZl/PbVUQVt0bv5Tpn9d5Oanp/7sYw9bb0wCaVRRearo35XFNj8C2jMJr5uHQ6BPPRhYr4MnZsB3wLociA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6qF/CLRhJdpBQnXFrP1+fJiPey6CSZWQDwv9HWwd/0=;
 b=LH99APyx9OnKWJMSZRnjREUuqa47Mi1HidbGQA+LINh+yF4WLTzSyrdDGAOocKS5PDA6xp4NaIghOrbXPpzq4paEOfnJHbvYIiXrJSGsbiOdXaIGXjy8qVz4ntOsw+fMSfC5MLZuFIMeDJzCxRagulH71ZI8rYceTqez/q4ChbSf1/TQeb+nI9YpRisltP9d6zWrEw355Z5HL8k0WKUGY4nrYl5vEzL4TsYG7/xWfZDBLOMg6AKeRgG+d+c2Pa1Dpi4315IAf7oqgeEaqbzlu6hwCY/tmiEhAjeKu84724+E34jab3zpCg/4toXSQzMd3vnfPtG5FNRYT0ElAo/5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.19; Mon, 17 Feb 2025 08:35:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 08:35:06 +0000
Message-ID: <ea65922c-8d71-4b58-8641-0a2048851310@intel.com>
Date: Mon, 17 Feb 2025 14:05:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] lib/igt_kms: Add igt_get_max_cdclk()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250213110814.351186-1-swati2.sharma@intel.com>
 <20250213110814.351186-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250213110814.351186-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f38967-b15a-4751-87cc-08dd4f2dfb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TS80YkFUVUo3cUtuckVJcHVaSzdmQ2xTVWg0ZXZzODI2bUFuV09HNkpqN2hO?=
 =?utf-8?B?Rkt5WU5EdnBXMGlCbFg4c2pVd2U3QzZTR1FLOTQzTFNQeGtBNlJ5c0NRRHBz?=
 =?utf-8?B?K2xFd3JoTmNIczA3Vjd2Q1FCK29VeXhHWjdGUjhyYTI2eld6ZDliZ2NoMVVE?=
 =?utf-8?B?YzJER1ZOOGdQWHFhaVg4THpVaE1RZHR2RGR4cWFoVFM5eGZHV2M2Q2kwUld1?=
 =?utf-8?B?M29FVUh3WkYxOWFYVDVOaFpaMU9Iejc4Lys4NmkweFhyWXBaMU5hMkdCUXFB?=
 =?utf-8?B?MmxwQ2lFd2N2QlNQbG9haDl6VENIRVM0dVpjMGVpZWZSRFN5cFIxcURTc2R3?=
 =?utf-8?B?Rm10WkI4eEFVNmtJWGNqUENpNXkyNi8rOEFLRWhrK0dQVkVFdUNBN0lyQWFI?=
 =?utf-8?B?eDZCcDZQOXQrWDFGUGl0QmFmdUU5R3RPNmd1NUpxUDY1dDQ4L3I5RXB1T0Ru?=
 =?utf-8?B?cGVqWGs3RXl6OHkzaWhERGxoNVNibm9vZGQyaTdPeXdPMmFjMGhWdlBGWnVp?=
 =?utf-8?B?N3duVTR6Nm9nZkRWTm9QbG1LdGN2OVNxcmxhMnpSZ3oyNHI2U3Y2NmV2K1RJ?=
 =?utf-8?B?VnZGbVJ3NVY2QmxXMDErMkNpcjEwdm9IZzRGWTZMNXJ4TGZScGdwdnQzMkR6?=
 =?utf-8?B?Q3lOMWpjTTZBZVpXYTk0NE5vTDdqbUJFR0JRM1NhaFJJbDh5UVZSU2p5THla?=
 =?utf-8?B?aHpRSEtnemwySDdtd2hyaWJOQmdKc1dEUm81angyLzhEbFNVOHFUb1dhV3Zx?=
 =?utf-8?B?azgxVHQzY3A3QlJiN3AwMkt1a255a3NnMGdxcGlrYmQ3TzFVMnhBdTBOUmhs?=
 =?utf-8?B?d0Y4YVZrRDdiVmI5YUo1TjdZQzBCd3VUZ2dBMXlyejJmSDhYVDVrRVpuNzlK?=
 =?utf-8?B?Tjd3N3lPT2FKdnRvTFZEVVRqMEJ3YmVBOElaTUdDSXhsNTNBLzdYc0xuZUpi?=
 =?utf-8?B?QStOamV0ZEY5TWRjL0VSK3FHYU1mMjNWQVh2ZVVUQ0FyN21NMmFQdndEZGg3?=
 =?utf-8?B?MEpDOVFqc2JNSGVhQjVmMjlPWUlndTRqWXNXdXczT0F4cCtld0FkakR5Y0Nv?=
 =?utf-8?B?cm9iRS9BV3pNdFNHL2RvaGE0UmhqL2IxNUE2VjUzeFY2S0Nhd092TFMrMlJS?=
 =?utf-8?B?d3RQNXBwcXdGd0pyM0ozKy90eFdjT0NOcGpWTlRDMXp0Wm51QzNxVjErSlV3?=
 =?utf-8?B?QldaeTNRbUw3cUQ4bDdlVk5jSXJuNjFvUkluYmNQMnJ0d1p4S1lWYlVKTnZq?=
 =?utf-8?B?L2dkdEkzaFhOOFdWdHZaNjdpekRXdzdPc2dmVWthVVg1NHdEWnBueGVYZUw5?=
 =?utf-8?B?Zld1Um5ZeDZpVW5HbUhVYktUdlh1dzdIVEZBOThuQUR0UmtUbkRKbk95U1V0?=
 =?utf-8?B?ZmcxNkdBdFVTWkRjK3NndFR2WXdMNUF6a3ZlL2NncjdSYmlxcExYTXRPK2xk?=
 =?utf-8?B?SUgrcHJoRk9CTEQzdWN4NGJ0bDRHSDZnMnRkeXRKQnBlNTZrWmZWdWdOS1Qx?=
 =?utf-8?B?ejBGYllydmRNTVNNTTJQQ1YvQUdhNllSOEI3c3NOSlFMS0xBRGtkakVQY3hj?=
 =?utf-8?B?aldEOHZTeG9Ob01ZRDR1VkhuTDg2dzFIKzV1dkpjNmx4YmZ3RitxaFNjdGRV?=
 =?utf-8?B?a2Z0OTBNNFBBUW9DNlpXMGFNS1o1Sk1jeWUxOHNVTEtFM3BnNUYrR3BzQW00?=
 =?utf-8?B?bDMwY0wwQzdpSU5FeTBqYVNsSlA5eWRSY1drUG5RbmN2VVFwOExqbmdhN3lU?=
 =?utf-8?B?VUVBUE5iLzZ2QW1tVjRvbXBpQkMyZFVZWEx5R0dzZHRna1g1L3ovZVpKcVFq?=
 =?utf-8?B?OFVXRjVWLzhXUjdwV1cybjZTbllxUnlnc3BJSXlMSmxyYjhjSmU5U210bDZz?=
 =?utf-8?Q?Vv0AlR7xX3bB0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlAwT0NuNnhvYmppN2Q5WmhvWVp0Y3pYOUVDdlhCdjU2T1pBMXJHa3FrclVh?=
 =?utf-8?B?QVhiMThKK0ZETXlDVWw0a2ZjdmovY0I1VUdFeFE3UXUzaHZ3TFE1cE5KakZZ?=
 =?utf-8?B?dWhjaU5PZWxZcDlsTjFRSmZHb0VSNjVlR1Zpd0x3Y255U0tqV1YrZGlGMHd5?=
 =?utf-8?B?YUJFMTdWRHdZNFpRVmc0cmluc01DbTU2azlBM05nYU5XcGc0QUVQYkdpUE5Z?=
 =?utf-8?B?SDdXdjcrenlSUWFJUE5sUWxhU0JqU3dEWlpOeXRMUEUrQ1doT0FNR2pqSDJ5?=
 =?utf-8?B?RzJBRFI2VXZ2c1UwY09uTzExelJIK0cxb2RDbHNXcDY1d2ovMmRSWFplM2pv?=
 =?utf-8?B?U25LYzBqR09YYmg2ek9WMTRPeVkvTGh5bjhuVHJUQzBPRFBSMXIvaUYrVzI5?=
 =?utf-8?B?ZG4veC94bWJOUEFtbGJwTmVaU0tJL2U3NzZkVHhvNUViczl4YUNzcXJhbDk0?=
 =?utf-8?B?Rm9aYWQyOUp6TmtQRUdNS0xORDVXWG1OR2Q2Q2hZT2hGMkc4WWVUT3dwNUM5?=
 =?utf-8?B?ZjdpS1Z2ZHpaQ1h1YTJBejFoU0dET1prMnR4Z1R4YnlnZXdpRDc1ZFpLbWJT?=
 =?utf-8?B?Q2RTN1RtY1E5Qm05TW5yWlV2Rm5xT1FxaUwvY2NxOEJ0T2pNd3BHRFdYcVF2?=
 =?utf-8?B?QXcwdmlRSmlmODJxZFcvWU1TbnZCNUUva3UyUHRXZTdFd0toL3pZVm16Znpj?=
 =?utf-8?B?aE5sT3FRQndCN0R3dVhBNUJGVXFpdE5iMzhvQmRwYU8xY1lGTDdhOFRZRUtO?=
 =?utf-8?B?OFIwcHhMZ0l3eFBNYXI1RnhDR2x1SHNGUzFQYlRGTWkxVjlOZHFZbHdDOFhr?=
 =?utf-8?B?OGlxU1NodE1HUTlYcnNWMkIydVpLaTdFbi9SZ2dVNEwxa3JOa3ozaVBXLzJl?=
 =?utf-8?B?V3RaS1EvanJ1Vk11SHE0enRrb0YyNHBwMng0ZGxJMnZ6U0Y2SXBIQnVVM0JK?=
 =?utf-8?B?MURlT2xQa2xYOThoV3pCMzZLNzNqbGt3QWhCcHo4OVdTWUdlTThXV0tVK3Z6?=
 =?utf-8?B?TWhsY2JEeGNFcUlldlN1blczc2VxbDUvV2FRRjBFZ2hkRUtqWFpEMnV0Q3dS?=
 =?utf-8?B?MVV6TUt2bFFsQWpWbHRyaWdDNDd0K3V5YU5vTHdmZEg5MkE0T0k2bUxuaVlJ?=
 =?utf-8?B?RWtZUTkyYm0ycUczRWVLbncvQm9URnRnbmRPZEVaU3FYZTBacTg5cHo1ZzVr?=
 =?utf-8?B?VGttQWx3Qld4Vi8wMFZSTlVqOTdXNHVSbitLSTkwaGNmYXN3WS91bm9qTGNY?=
 =?utf-8?B?RFFnNEdMdkNpUlBiK1BOQ1MySlUrUUo1K3hsYXJWaWJUK2VwcmRYUGVzNTFY?=
 =?utf-8?B?NnJ6ejIxVy9HamtSVXhkemVTL0U2YVd2UzJBQ0tXRHBJOEN2ZWZocTZWZnBu?=
 =?utf-8?B?cEt6U05xbGNJVmFHMlhBRnlGai9rMFVUZStoN2hLcEtwSmJpeTZCbWVta0Vs?=
 =?utf-8?B?N3pGUFh3MFd2ZCtKQU1vTFV2NEhCbkpEMTdWVWZuemFldnlRRDQ5d21kZDc0?=
 =?utf-8?B?REFlS0o0QnJTMzRwOFA2UkVEQjYrSzV4YXE5TjhqVTBTTFpPN0pPVW5nMHFz?=
 =?utf-8?B?OUVJQW5aUXhka1gya1BVMWp2YXl5UWNVT3czcG4ya1dkS3ZwS1g5R0FuUmNW?=
 =?utf-8?B?blh5YTdoL1RhUTFIZEdnOFVyT2ZKMmU4aHZRQS80bW9RYjc2V1dOVGQvczZY?=
 =?utf-8?B?aUVaOEIyalVXV2lZMzIxd3NaUVNlWTBsUWVOenZ6aGZMR3BrSFhWeE1hNW1J?=
 =?utf-8?B?c09zQkg1dTU5aXZuck4xR3N3ajZDUXA2eXpxd2gyM09oTWdORGhhd0dqckFV?=
 =?utf-8?B?eTR6U1FpcWhib3lsbWtSZDZXYWxjNVRPRnNFbUhBSWFQRzlwRFhDcDdNVGJX?=
 =?utf-8?B?eG13TkVWTnlOVEhNNjlQQU42Y3NvUklUUTR2UUtYMUVYNkhqWnFkN1plSlBz?=
 =?utf-8?B?Z0FlK1ZZTmhZekJRSThvYmpXQk5JTklMa29nZFVkaFJxUjVHb00zYVhtK1lQ?=
 =?utf-8?B?T3lhcjIxby8zcTh6WUpQc3lRSnRpYWtyUlBUQk9KY3MvN0ZKRzlNVkRPN2cv?=
 =?utf-8?B?dlRaY3Q1ZDExaDNSY2I2bWZOdGNJVzVqWnZtcndjOVp3QTNEN3Uzako4OXBz?=
 =?utf-8?B?OVpMR1R0d1RUWnJWOVp2STBGWnBGcG9NZkxrV2pLbEZqRXlvelNDbG1GbHZY?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f38967-b15a-4751-87cc-08dd4f2dfb65
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:35:06.8306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nWecekvqw4E57992XXnlOsk2rVVA0xzEHRZ63QY3SJb+EzPA5dX4flZHYaYEN+X7PPm/PzgdiFu7gi57s6AdTF6j9wN8b1k6IrUc8ZAazU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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


On 2/13/2025 4:38 PM, Swati Sharma wrote:
> Add igt_get_max_cdclk() to return max cdclk frequency.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 50 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 8220cc0eb..aa5dfa8ce 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6390,6 +6390,55 @@ int igt_get_max_dotclock(int fd)
>   	return max_dotclock;
>   }
>   
> +/**
> + * igt_get_max_cdclk:
> + * @fd: A drm file descriptor
> + *
> + * Get the Max CD clock frequency from intel specific debugfs
> + * "i915_frequency_info" (or) "i915_cdclk_info".
> + *
> + * Returns: Max supported CD clock frequency.
> + */
> +int igt_get_max_cdclk(int fd)
> +{
> +	char buf[4096];
> +	char *s;
> +	int dir, res, max_cdclk = 0;
> +	drmModeRes *resources;
> +
> +	if (!is_intel_device(fd))
> +		return max_cdclk;
> +
> +	/* If there is no display, then no point to check for cdclk. */
> +	resources = drmModeGetResources(fd);
> +	if (!resources)
> +		return max_cdclk;
> +
> +	drmModeFreeResources(resources);
> +
> +	dir = igt_debugfs_dir(fd);
> +	igt_require(dir != -1);
> +
> +	/*
> +	 * Display specific clock frequency info is moved to i915_cdclk_info,
> +	 * On older kernels if this debugfs is not found, fallback to read from
> +	 * i915_frequency_info.
> +	 */
> +	res = igt_debugfs_simple_read(dir, "i915_cdclk_info",
> +				      buf, sizeof(buf));
> +	if (res <= 0)
> +		res = igt_debugfs_simple_read(dir, "i915_frequency_info",
> +					      buf, sizeof(buf));
> +	close(dir);
> +
> +	igt_require(res > 0);
> +
> +	igt_assert(s = strstr(buf, "Max CD clock frequency:"));
> +	igt_assert_eq(sscanf(s, "Max CD clock frequency: %d kHz", &max_cdclk), 1);
> +
> +	return max_cdclk;


I think there can be some code that can be re-used between this and 
igt_get_max_dotclock() to read the debugfs.

The search string "Max CD clock frequency" or "Max pixel clock 
frequency" can be passed and it can return the parsed value in Khz.

Regards,

Ankit


> +}
> +
>   /**
>    * igt_bigjoiner_possible:
>    * @drm_fd: drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 5cf0b89d3..e6665abdd 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1244,6 +1244,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   int igt_get_max_dotclock(int fd);
> +int igt_get_max_cdclk(int fd);
>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
