Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA2BD358DF
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 08:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6779110E7FC;
	Thu, 29 Jan 2026 08:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeezPyvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC1610E7FC
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769674878; x=1801210878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aGyL7Prp6SJbv8pBEabLNmmf9gxaH9H7kol06qYi/sw=;
 b=eeezPyvbKjL2cBmW/0EsSISezfHIl9PEboHI1ctdYGBkgQyCQlxFkPiJ
 UBaZVnYef5DvEEGELju0WqF9hMxa2PIwv6kxUo/fxaISLpxQLzRw6vulL
 zujc+u3SsjPOoW+8R2Yiou2n+Zv/9UqBa+XQNprP18U9lGtzrobP4cvPx
 rUe9/pkcu1aaJp0rn8cNgOLmTWujhOfjiAF9dDdRe6028IwwIQlstl7LO
 NJKyMZ7TE/Z4KIX9F4u8UAE9iXLXvCQJ9Csi0AdPgskX3DI57Qdrshw3c
 m5v1XFU4TttHThcqZLAWqZyB046+S1IBev7Gp7vF0/9aFHF583uDgXJg4 w==;
X-CSE-ConnectionGUID: 6plGTEEUQ4Csg7QU0YiIoA==
X-CSE-MsgGUID: 00LlGcgAR5mbwegnHsO8/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82272599"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="82272599"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:21:18 -0800
X-CSE-ConnectionGUID: DXyy6P9XR0CO46RAfkqFoA==
X-CSE-MsgGUID: i+c3HuSGSyyQgcJ1rVHadw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208404979"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:21:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:21:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 00:21:17 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:21:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4cw/Ef5C04OG7VQQuUiC/piSgAaKuc388oe/NLs0T500EbVKA319gK6oMJ29NOQ91LUKeVeYb2rxIiUbafz1OaETkwcHvygD2Wx/zt6P3wD0Ftm0qN9k0EMmyWuESy1cHE8ISc3C35ZJuHOtgF/IoI34AaoUIWzj27QrAywxa4yXCvn0i3U8eW01lopFJZ2uvgucKORFM55DEgWSL0l/QVGgs2Ado9NMO1hQcjvuspZRs6jZoymKvijF2VBu31iRbGUHncFV0ZbUT0VRJd/YEOd9kV3UI+aaYLR3WOwk+Da5XHXuqvOOi2dqxzY95UzivS6ZuT4RffpG1sjy0+92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mk5cMS9eNHVhq/u5Jp3adfbAa39Qu/qJ+e7R0KL0E/w=;
 b=Wa0EmnTcU00a15VSwEJDqTQMSmzvxZRJMaeQqzB52zxBYlIup5ePjqWtsYXNyqC2H1YUpsPhsF7Tj5uoZNO0TDUzA+VKlQcBxiq7r/jWtNP9Vqg4Ehm25tG8ynIk9s06Zeldm7p70GL7RP6BdfMQ8InQ07GXeadLQmZxd9PZchsB2KJpefNNyGevV8k35PscWc4T7esAUPwjAR2IOQOY51voNbLQf5SRri7foVUCN9ozZxEPBlU3yhz94FBpY/W4zk1pihRxanhhDhyDKEJEKgrvAQ3gXZG/42SUhxrc/q66mLt8QMTMN5IbLVKjQvvq402Q8jk5Or5/ynJ0aqN44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA3PR11MB9087.namprd11.prod.outlook.com (2603:10b6:208:57f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 08:21:15 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 08:21:15 +0000
Message-ID: <9cfecdad-0853-479d-b63c-e02a9c59658a@intel.com>
Date: Thu, 29 Jan 2026 09:21:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 06/10] lib/xe/xe_sriov_admin: Add SR-IOV admin
 sysfs accessors
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
 <20260128180819.1373376-7-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20260128180819.1373376-7-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0053.eurprd03.prod.outlook.com
 (2603:10a6:803:50::24) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA3PR11MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 911957ae-f0f8-4465-242f-08de5f0f5e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTFja2NTMlVHYjNRcUJLZXMvT1lucERGazI0azZObkNCNysxVWhWWWpwcHM0?=
 =?utf-8?B?a3Q3MStpQ0ZXRlpPL3JIdTNxdlJSenBSSTRzQlhZK2VhK3ArTUs3RkdHdHRG?=
 =?utf-8?B?LzIyZ3RBTE02WjZXYk9kKzI3cFJiU2Q2SC9LeUg0NnM3V1ZZT2gwZm12WkE0?=
 =?utf-8?B?V2xVQkRBTkRJaHN3TGlVSEFBL1BWN09KejBOYWdxNDhYVENidUxhTGJhbjN5?=
 =?utf-8?B?ZnpzNkswUXY1eTUvWTc5aEpVVGN4bllzY1YyVEdOcmdwcUhhQnFKV253V0NE?=
 =?utf-8?B?RWdJRTRxN0FZZkxQWnpSNUJzY2s1ZzczelZnSDJlRmQvY3h5Um9Ha1YyWkVy?=
 =?utf-8?B?WWpKYk92OTc3UUhVWGkxLytlWUtZeWhTQkdFRlA2TU93Ukhha1RMQS81VHpO?=
 =?utf-8?B?L01hOXVQVGYwVkJVemx0Z3FsL3dmcHJhcW5aRGplRXB0ZklHN3FVSWdZTERN?=
 =?utf-8?B?QjFGdHVPUTdndjhUWVA3dkZWYVJPcXVrWncwYnVSWDVxUE9XNHZ4QTcvS3B3?=
 =?utf-8?B?NXh4ZUVzOVQ1bzQvbTFrTmczdS8vTUVmVU9HL2haUFlNM1hwQnZXNTV5M1JU?=
 =?utf-8?B?MzdoaU1IZmVLektaM2wxRGVRbHpqM3JTV3NNTFh1Tmk5cFRaQVI5NE13MTZO?=
 =?utf-8?B?SVBKWGxXOGtQbk0wRFc4MVNabEpvZkl5M1Z1MWFlZG0vcWJQNGVRL2xKQmJh?=
 =?utf-8?B?U0FtWTRoY3FmMEVnazQ1QUppVTltZTJza1hKTU1nM3NVMUxXS0ErVzNVVlVz?=
 =?utf-8?B?Y1ZRcm5nZHJTbEZFMmh1dE9McVpDdmx0cE1lSHBucitwQmRsSUEyeEJHMlhj?=
 =?utf-8?B?azYzQUV2T2dJa1F3RkluZG1MLy9GbHJwWmZqMDMyTHAyWHZBUElPbDAwdE5K?=
 =?utf-8?B?dGdQSWxEV0NPOVV0REh3N081Q1d4N2liRThPOFpZcE9Xd1ZwU20xSU83RWph?=
 =?utf-8?B?WHovaHR0WDd5V2lENk40WFRDTTF4dnY2ZS94UVFqa292ekd4K24vT3UwZUND?=
 =?utf-8?B?R21Sd1hHYndRdkR6VU5JRzdjaFdzNmE5aGtaYlAwQ0ptOTdmVkFrc0YxM1lG?=
 =?utf-8?B?Ui9rZWcybDRuWkg5Mklmd3B3SmROUFlQVlJQcVJPb281NXF4bHM1RUkxK0d0?=
 =?utf-8?B?ZTBuKzZXR2xJREhRU1JjeW9BOXd1K3pYUnJPeEo0b1I3SkNrZUlrVlA2a1hp?=
 =?utf-8?B?U1V2N3Yzbmt2TEl2dkVkRnUyS2JqdmVNY29haUhMZytoRnh4SXlrdlYrazBu?=
 =?utf-8?B?OUd4QXRPN29aQlVmbHhaWkN6VTUzVklwNExPR0J1M3dDRXA5UTF1YThoZXdk?=
 =?utf-8?B?ZWoxQ2o3aFhyQVVqNkVHeDZhZk9FeVVVZGU5ZzZJYWVteGR2MmZHSEJjY1FC?=
 =?utf-8?B?YnYzK2k3NmFPNXAvWU1ZdVdyN3Y2U1ZOTGFCUEhaaGQ5aG1vQUFVUCtBaG5n?=
 =?utf-8?B?QWI0b21iTTRzVE5aaWEyNHNZa0xVZlBHMzBQYmtVWHBtWUE4QU1YLzlsOFBt?=
 =?utf-8?B?VFVpM0FSMk5tdVlXVGNPdmNGVEZkazB0WE9MVVh1TEZYUHloTGpXOUNkaitD?=
 =?utf-8?B?Q2tUajBqM3VwOVFYYTVYcnRyc0VuOVpRaHFIRWFMQ3YyU2F0QkZRZVQwRENi?=
 =?utf-8?B?WmdBVi84bTJoVXJqVVZsdXN6S3p3UnM4OEM1M2c2R3BGc3FPaEYva2tMZnhD?=
 =?utf-8?B?Qk9PbmxMa2dQNUZoSUZTdEs0dWtmRkU4S0dZM3o5d2VYak0yMEpQeEVURTdy?=
 =?utf-8?B?UEJjQmVMYlFwbEpYdFdRbzZ1bHo2Q0lDZ2FBSU5xTyt6blhObkxVTFc0UE5P?=
 =?utf-8?B?ZGh4MGI2a0JSbXdCd3dldnp6ZkJYamh5YUVDVnZ2blFyTGNRVktTQi9BUEI2?=
 =?utf-8?B?T0ovbEJscjY2b1R4QWhHV21xMDZzMGN6bzVjUDRMU2E1eE41QnJ0N0VJT1Fp?=
 =?utf-8?B?ZncyWFlCV0ZFbXlMeUROUmhCUWEvTFJhTjhKOFc2eEdRNlJ1dnNRWlhSK0p0?=
 =?utf-8?B?T0tMN1R3cFBmZER4S1ZtUVZ4QXMvVUloUWMwdHRDREI5b0FmQVVpb0FkcXhQ?=
 =?utf-8?B?N3lRMVVHZTFXV0Ivb2wrajUzY3pwTFF1eWdRTUJtN1pQTmZKaGFvcWdTYytm?=
 =?utf-8?Q?1HAA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEJNVjNuMzVMWTMyVmh1M2c4SEhkdExFOVVDQTZIcy9IUk9kWHdJeUxoS216?=
 =?utf-8?B?bWY0TnJORWIwblVyT0hEQ29VbU9yb1VRTHQvVm12RzhqQVJEeS9LZTFDejlz?=
 =?utf-8?B?N3ZvQmptTjljYzZSVVpiNy9RK0JyVGZPKzJxVjluV1k4QkpUYXdWcndZVkhW?=
 =?utf-8?B?VTUwK2pqTnBicXBROHkzV2xtaUMyaW5scW9YZjh3cW1JYkxVYVp6eUxKN1BH?=
 =?utf-8?B?VVBMQm5wZm5Tczc0NnBDUnBKd0x4S2R1ZGJqeGtzc1lTc0kvZ2RFT0p6NTN2?=
 =?utf-8?B?QzNsYUIrUXNXNkhWcGMrV0ZEY2JRS3VxeVRFRGJkRGVoUkNZQnhBU0s0bzF6?=
 =?utf-8?B?WnlCUnVjYmJLcmpOYnJiVnR4VVRwbk1RRnMwMkhVTGovU1JtODZvbUg1alNC?=
 =?utf-8?B?UVRmSUVjaG9WdDF3QUdRb1RJVDBVTmlvRXBwQXgwckJIQWd3TWZtNVRYS1JG?=
 =?utf-8?B?Q0dTVHlqeElJK2tJbGtuVUxkbkthazg4V2FrSTY2Q2dMNzEvYkx2Z21vUGdm?=
 =?utf-8?B?VlA3UnNIRXlwUG10QVdBY1FWR3JId0RuNkZoazc4cnEvSHNKVWNBR3R5T3I2?=
 =?utf-8?B?U01SWS8rY2llN0ZIMEsvNVJybm9mOVVXUUxtUG52MXpLSlFZenIrWFl4bjhi?=
 =?utf-8?B?TFlST2FBbzA4T3Bham8zeTlBQWhBcTBKVld3TXdnZk1XekRFWkFSeU84RGpn?=
 =?utf-8?B?QkNRT1BjL3RDMjRaV29URE1ha2huTitSeW55ZFY0N3Z4M2pnaDlML1lFeGpl?=
 =?utf-8?B?TXc1akhvaHVXQmFVeG5GMW9CVkRDZis3YUR5UnVzYjZRYXJHOUpjRXJKaVlU?=
 =?utf-8?B?THZXS2RqamwzT3VxT1RoeENMYVo2MjFLdFp4a1JHNnp5QUh1UW42eDMvV0dW?=
 =?utf-8?B?NVFiVG1pY1Ivd05NMnpNMHlZcEJzVk1jZVZrbTBQeXJqYXRoaVovNUIvUWZZ?=
 =?utf-8?B?TGNEblJZaFVETmk5TmVjRVBnOTdCRDJJM2RHelJiakZha09Ycm9zVUw5Q3lR?=
 =?utf-8?B?bWV3WFVsV3pyYnpXU3dXSFFIY3VhWnIxTm9ZUVYwOXFTbTlDMXUxL1lqYzNW?=
 =?utf-8?B?L2xVM1I1c3l6WmNtRXY0TFI0T1gxOTZsTDltS2R6MG56TWwxcnV2eWtaVENw?=
 =?utf-8?B?SFhzN2xHdDBnRXZZMGdtNnF5Ui9vZjlwZlJpUEwzS0hEbmw5QzBlOU1uVjZ3?=
 =?utf-8?B?dGs4OEx0QWZVclVGSVJQN2l6WkxLeVBmbFpwYy9Nd2djRU4zQWZ4M3FLanla?=
 =?utf-8?B?bE1rNWtzQ0tBbVJMZll2QTJOUWVCakhoNUV6VTI3RmxJV25wQlJGbVV2OC9S?=
 =?utf-8?B?SEI2bTQzTFlIcEs0Z2FFc2kxSnpZeklsZkdPNVNwazNDS2RVbExiWjU5dUI5?=
 =?utf-8?B?bEVhTmFVSzFYM1g0MHVqZVhoSHlWdnZoSERnTnJscURkMzh1RjJGek9GQXdS?=
 =?utf-8?B?a0pRb3dOMnF4NkxvQ1lwSlV0b2hneCszbkRJMXNlaE1HYm9mcnJZVTQ4U2VI?=
 =?utf-8?B?S3Q3WVVWbkpYSHB6YmJZaWpRR051N0pCamRYZVJ3UE05ZzM2RFVJQkxrMmZG?=
 =?utf-8?B?S1hMYy9WY0c1bVJTZWVJTSt1Q2ZVLzZVQzcrc2tCTXJMYXQwTTVCejVUVjRO?=
 =?utf-8?B?OXhPa3lrYVJ6cnNyT2QvS01CSXFBT1BnenhVS2V0NGJCOFdHRHNGMEhTYlFW?=
 =?utf-8?B?QWd0UG1jSlJmbGhYWllPcVcrS3l3QmJjRGRzakxPOVJFbmhIR3drMDZkWS9x?=
 =?utf-8?B?bGw3TmxoNit3S0NFNjFkYXJDVG5GNlUveGhuWEtaN0YrWXhXRTR0cnRCMXFQ?=
 =?utf-8?B?Q2tOVFVMbEFoQXV1YVJqbEt5Q2dLRnJwL2ZkMTlYRUZ3ZWdhNWZlVllDOFRv?=
 =?utf-8?B?U0pmSTFVWVlaTWlsWHRWMUt2cE5IcXFBdVVyRXFvWTY3dWI4QnFlbUppRE9K?=
 =?utf-8?B?bnRrd1JPVE8wUTZGb2lrai9LNnFhbks4WFRvaFZPMnpSMU5pR2NHYUtaWWNH?=
 =?utf-8?B?L0lORWRReEhBSkZDa3pKekkyNytwWHpnd3ZRRTZjVXVhU1pjQklzWkNnOXVv?=
 =?utf-8?B?RmJhaTk5SG9oNjMzNTFLTkFkeFFSL1REcXhUdlRtSC8zNndySzVreUZRUnpv?=
 =?utf-8?B?QkVxcUlKOTh2QjBFR3g5RWlTWnBCSG9Zdm8yQUlpUk1oOGl5c2FWa2tqRkRC?=
 =?utf-8?B?ay9OZytMMTZka3BDSHh5SHM0Vmx2b3FGLzZpakx6dkJhOEhGZG1hZkNiaG9k?=
 =?utf-8?B?NVY0WU0zMStzSlBhK0FBNTd3RGJUaVNtSjJiRFd4UzNnRXFLbXNWakVSQk44?=
 =?utf-8?B?NkhXa01ZdnpDdDlGbXVKVkc2ZXBKdXJYNDhWR2FWb3dLcXdnVEFlQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 911957ae-f0f8-4465-242f-08de5f0f5e90
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:21:15.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GGnpX+8ktSptm1ho0/2F339hwib+N5DtQ0Zf6j69XmZ4TKNa0Lc8IodAjjedC/va3tTco1icAbRt1Wm+eJKJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9087
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


On 1/28/2026 19:08, Marcin Bernatowicz wrote:
> Reflect recent kernel changes and expose SR-IOV admin sysfs helpers for
> scheduling control. Add per-VF and bulk accessors for execution quantum,
> preemption timeout, scheduling priority, VF stop and restoring defaults.
>
> Link: https://lore.kernel.org/intel-xe/20251030222348.186658-1-michal.wajdeczko@intel.com/
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> ---
> v2:
> - Correct __xe_sriov_profile_set_exec_quantum_ms return code
>    on igt_sysfs_open() fail.
> - Correct formatting.
> - Rename helpers to consistent __xe_sriov_admin_*/xe_sriov_admin_*
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/meson.build         |   1 +
>   lib/xe/xe_sriov_admin.c | 625 ++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_admin.h |  60 ++++
>   3 files changed, 686 insertions(+)
>   create mode 100644 lib/xe/xe_sriov_admin.c
>   create mode 100644 lib/xe/xe_sriov_admin.h
>
> diff --git a/lib/meson.build b/lib/meson.build
> index 83569e8d2..d851029e0 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -128,6 +128,7 @@ lib_sources = [
>   	'xe/xe_mmio.c',
>   	'xe/xe_query.c',
>   	'xe/xe_spin.c',
> +	'xe/xe_sriov_admin.c',
>   	'xe/xe_sriov_debugfs.c',
>   	'xe/xe_sriov_provisioning.c',
>   	'xe/xe_util.c',
> diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
> new file mode 100644
> index 000000000..f3be70db8
> --- /dev/null
> +++ b/lib/xe/xe_sriov_admin.c
> @@ -0,0 +1,625 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2025 Intel Corporation. All rights reserved.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include "igt.h"
> +#include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
> +#include "igt_sysfs_choice.h"
> +#include "xe_sriov_admin.h"
> +
> +static const char SRIOV_ADMIN[] = "device/sriov_admin";
> +
> +static int fmt_profile_rel_path(char *buf, size_t sz, unsigned int vf_num,
> +				const char *attr)
> +{
> +	igt_assert(buf && attr && sz);
> +
> +	return snprintf(buf, sz, "%s/%s/%s", SRIOV_ADMIN, igt_sriov_func_str(vf_num), attr);
> +}
> +
> +static int fmt_bulk_rel_path(char *buf, size_t sz, const char *attr)
> +{
> +	igt_assert(buf && attr && sz);
> +
> +	return snprintf(buf, sz, "%s/.bulk_profile/%s", SRIOV_ADMIN, attr);
> +}
> +
> +static int ret_from_printf(int ret)
> +{
> +	return ret > 0 ? 0 : ret;
> +}
> +
> +static int ret_from_scanf_items(int ret, int want_items)
> +{
> +	/* igt_sysfs_scanf: returns number of assigned items, or <0 on -errno */
> +	if (ret < 0)
> +		return ret;
> +	return (ret == want_items) ? 0 : -EIO;
> +}
> +
> +/**
> + * xe_sriov_admin_is_present - Check if SR-IOV admin sysfs interface is available
> + * @pf_fd: PF device file descriptor.
> + *
> + * Returns: true if the PF exposes the SR-IOV admin tree, false otherwise.
> + */
> +bool xe_sriov_admin_is_present(int pf_fd)
> +{
> +	int sysfs;
> +	bool ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return -1;
> +
> +	ret = igt_sysfs_has_attr(sysfs, SRIOV_ADMIN);
> +	close(sysfs);
> +	return ret;
> +}
> +
> +/**
> + * __xe_sriov_admin_set_exec_quantum_ms - Set execution quantum for a VF
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @eq_ms:   Execution quantum in milliseconds.
> + *
> + * Writes the new execution quantum to sysfs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_set_exec_quantum_ms(int pf_fd, unsigned int vf_num,
> +					 uint32_t eq_ms)
> +{
> +	char path[PATH_MAX];
> +	int sysfs;
> +	bool ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/exec_quantum_ms");
> +	ret = igt_sysfs_printf(sysfs, path, "%u", eq_ms);
> +	close(sysfs);
> +
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_admin_set_exec_quantum_ms - Assert wrapper for setting VF execution quantum
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @eq_ms:   Execution quantum in milliseconds.
> + *
> + * Calls __xe_sriov_admin_set_exec_quantum_ms() and asserts on error.
> + */
> +void xe_sriov_admin_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_set_exec_quantum_ms(pf_fd, vf_num, eq_ms));
> +}
> +
> +/**
> + * __xe_sriov_admin_get_exec_quantum_ms - Read execution quantum for a VF
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @eq_ms:   Output pointer for the execution quantum (ms).
> + *
> + * Reads current VF execution quantum from sysfs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_get_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t *eq_ms)
> +{
> +	char path[PATH_MAX];
> +	unsigned int val = 0;
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/exec_quantum_ms");
> +	ret = igt_sysfs_scanf(sysfs, path, "%u", &val);
> +	close(sysfs);
> +
> +	ret = ret_from_scanf_items(ret, 1);
> +	if (ret)
> +		return ret;
> +
> +	*eq_ms = val;
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_admin_get_exec_quantum_ms - Assert wrapper for reading VF execution quantum
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + *
> + * Returns: execution quantum (ms); asserts on error.
> + */
> +uint32_t xe_sriov_admin_get_exec_quantum_ms(int pf_fd, unsigned int vf_num)
> +{
> +	uint32_t v = 0;
> +
> +	igt_assert_eq(0, __xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_num, &v));
> +
> +	return v;
> +}
> +
> +/**
> + * __xe_sriov_admin_set_preempt_timeout_us - Set preemption timeout for a VF
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @pt_us:   Preemption timeout in microseconds.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/preempt_timeout_us");
> +	ret = igt_sysfs_printf(sysfs, path, "%u", pt_us);
> +	close(sysfs);
> +
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_admin_set_preempt_timeout_us - Assert wrapper for setting VF preemption timeout
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @pt_us:   Preemption timeout in microseconds.
> + */
> +void xe_sriov_admin_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_set_preempt_timeout_us(pf_fd, vf_num, pt_us));
> +}
> +
> +/**
> + * __xe_sriov_admin_get_preempt_timeout_us - Read preemption timeout for a VF
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @pt_us:   Output pointer for preemption timeout (µs).
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_get_preempt_timeout_us(int pf_fd, unsigned int vf_num,
> +					    uint32_t *pt_us)
> +{
> +	char path[PATH_MAX];
> +	unsigned int val = 0;
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num,
> +			     "profile/preempt_timeout_us");
> +	ret = igt_sysfs_scanf(sysfs, path, "%u", &val);
> +	close(sysfs);
> +
> +	ret = ret_from_scanf_items(ret, 1);
> +	if (ret)
> +		return ret;
> +	*pt_us = val;
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_admin_get_preempt_timeout_us - Assert wrapper for reading VF preemption timeout
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + *
> + * Returns: preemption timeout (µs); asserts on error.
> + */
> +uint32_t xe_sriov_admin_get_preempt_timeout_us(int pf_fd, unsigned int vf_num)
> +{
> +	uint32_t v = 0;
> +
> +	igt_assert_eq(0, __xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_num, &v));
> +	return v;
> +}
> +
> +/**
> + * __xe_sriov_admin_set_sched_priority_string - Set VF priority from string
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @prio:    String value ("low", "normal", "high").
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_set_sched_priority_string(int pf_fd, unsigned int vf_num,
> +					       const char *prio)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	if (!prio)
> +		return -EINVAL;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num,
> +			     "profile/sched_priority");
> +	ret = igt_sysfs_printf(sysfs, path, "%s", prio);
> +	close(sysfs);
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * __xe_sriov_admin_set_sched_priority - Set VF scheduling priority
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @prio:    Priority enum value.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_set_sched_priority(int pf_fd, unsigned int vf_num,
> +					enum xe_sriov_sched_priority prio)
> +{
> +	const char *p = xe_sriov_sched_priority_to_string(prio);
> +
> +	return __xe_sriov_admin_set_sched_priority_string(pf_fd, vf_num, p);
> +}
> +
> +/**
> + * xe_sriov_admin_set_sched_priority - Assert wrapper for setting VF priority
> + * @pf_fd:   PF device file descriptor.
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @prio:    Priority enum value.
> + */
> +void xe_sriov_admin_set_sched_priority(int pf_fd, unsigned int vf_num,
> +				       enum xe_sriov_sched_priority prio)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_set_sched_priority(pf_fd, vf_num, prio));
> +}
> +
> +/**
> + * __xe_sriov_admin_get_sched_priority_choice - Read sched_priority tokens
> + * @pf_fd:   PF device file descriptor
> + * @vf_num:  VF index (0 for PF, >0 for VFs).
> + * @choice:  Output choice structure with parsed tokens and selected index
> + *
> + * Reads the sched_priority sysfs attribute for the given PF/VF and parses it
> + * into an igt_sysfs_choice.
> + *
> + * Returns: 0 on success or a negative errno code.
> + */
> +int __xe_sriov_admin_get_sched_priority_choice(int pf_fd, unsigned int vf_num,
> +					       struct igt_sysfs_choice *choice)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "profile/sched_priority");
> +	ret = igt_sysfs_choice_read(sysfs, path, choice);
> +	close(sysfs);
> +
> +	return ret;
> +}
> +
> +/**
> + * __xe_sriov_admin_get_sched_priority - Read VF scheduling priority + mask
> + * @pf_fd:     PF device file descriptor.
> + * @vf_num:    VF index (0 for PF, >0 for VFs).
> + * @prio:      Output pointer for the effective priority.
> + * @prio_mask: Output mask of allowed priorities.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_get_sched_priority(int pf_fd, unsigned int vf_num,
> +					enum xe_sriov_sched_priority *prio,
> +					unsigned int *prio_mask)
> +{
> +	struct igt_sysfs_choice prio_ch = {};
> +	int ret;
> +
> +	ret = __xe_sriov_admin_get_sched_priority_choice(pf_fd, vf_num, &prio_ch);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_sriov_sched_priority_from_string(prio_ch.tokens[prio_ch.selected], prio);
> +	if (igt_debug_on_f(ret, "unknown selected value '%s' (err=%d)\n",
> +			   prio_ch.tokens[prio_ch.selected], ret))
> +		return ret;
> +
> +	if (prio_mask) {
> +		ret = xe_sriov_sched_priority_choice_to_mask(&prio_ch, prio_mask, NULL);
> +		if (igt_debug_on_f(ret, "mask conversion failed (err=%d)\n", ret))
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_admin_get_sched_priority - Assert wrapper for reading VF priority
> + * @pf_fd:     PF device file descriptor.
> + * @vf_num:    VF index (0 for PF, >0 for VFs).
> + * @prio_mask: Output mask of supported priorities.
> + *
> + * Returns: effective priority; asserts on error.
> + */
> +enum xe_sriov_sched_priority
> +xe_sriov_admin_get_sched_priority(int pf_fd, unsigned int vf_num,
> +				  unsigned int *prio_mask)
> +{
> +	enum xe_sriov_sched_priority cur_prio;
> +
> +	igt_assert_eq(0,
> +		      __xe_sriov_admin_get_sched_priority(pf_fd, vf_num, &cur_prio, prio_mask));
> +
> +	return cur_prio;
> +}
> +
> +/**
> + * __xe_sriov_admin_bulk_set_exec_quantum_ms - Set execution quantum for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + * @eq_ms: Execution quantum in milliseconds.
> + *
> + * Applies the value to PF and all VFs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_bulk_rel_path(path, sizeof(path), "exec_quantum_ms");
> +	ret = igt_sysfs_printf(sysfs, path, "%u", eq_ms);
> +	close(sysfs);
> +
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_admin_bulk_set_exec_quantum_ms - Assert wrapper for bulk execution quantum update
> + * @pf_fd: PF device file descriptor.
> + * @eq_ms: Execution quantum in milliseconds.
> + */
> +void xe_sriov_admin_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, eq_ms));
> +}
> +
> +/**
> + * __xe_sriov_admin_bulk_set_preempt_timeout_us - Set preemption timeout for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + * @pt_us: Preemption timeout in microseconds.
> + *
> + * Applies the value to PF and all VFs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_bulk_rel_path(path, sizeof(path), "preempt_timeout_us");
> +	ret = igt_sysfs_printf(sysfs, path, "%u", pt_us);
> +	close(sysfs);
> +
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_admin_bulk_set_preempt_timeout_us - Assert wrapper for bulk preemption timeout update
> + * @pf_fd: PF device file descriptor.
> + * @pt_us: Preemption timeout in microseconds.
> + */
> +void xe_sriov_admin_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_bulk_set_preempt_timeout_us(pf_fd, pt_us));
> +}
> +
> +/**
> + * __xe_sriov_admin_bulk_set_sched_priority_string - Set scheduling priority for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + * @prio:  String priority ("low", "normal", "high").
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_bulk_set_sched_priority_string(int pf_fd, const char *prio)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_bulk_rel_path(path, sizeof(path), "sched_priority");
> +	ret = igt_sysfs_printf(sysfs, path, "%s", prio);
> +	close(sysfs);
> +
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_admin_bulk_set_sched_priority_string - Assert wrapper for bulk priority update
> + * @pf_fd: PF device file descriptor.
> + * @prio:  String priority.
> + */
> +void xe_sriov_admin_bulk_set_sched_priority_string(int pf_fd, const char *prio)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_bulk_set_sched_priority_string(pf_fd, prio));
> +}
> +
> +/**
> + * __xe_sriov_admin_bulk_set_sched_priority - Set numeric priority for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + * @prio:  Enum priority value.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
> +					     enum xe_sriov_sched_priority prio)
> +{
> +	const char *s = xe_sriov_sched_priority_to_string(prio);
> +
> +	if (!s)
> +		return -EINVAL;
> +	return __xe_sriov_admin_bulk_set_sched_priority_string(pf_fd, s);
> +}
> +
> +/**
> + * xe_sriov_admin_bulk_set_sched_priority - Assert wrapper for bulk priority update
> + * @pf_fd: PF device file descriptor.
> + * @prio:  Enum priority value.
> + */
> +void xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
> +					    enum xe_sriov_sched_priority prio)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_bulk_set_sched_priority(pf_fd, prio));
> +}
> +
> +/**
> + * __xe_sriov_admin_vf_stop - Issue stop command for a VF
> + * @pf_fd:  PF device file descriptor.
> + * @vf_num: VF index.
> + *
> + * Triggers VF stop via sysfs.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num)
> +{
> +	char path[PATH_MAX];
> +	int sysfs, ret;
> +
> +	sysfs = igt_sysfs_open(pf_fd);
> +	if (sysfs < 0)
> +		return sysfs;
> +
> +	fmt_profile_rel_path(path, sizeof(path), vf_num, "stop");
> +	ret = igt_sysfs_printf(sysfs, path, "%u", 1u);
> +	close(sysfs);
> +
> +	return ret_from_printf(ret);
> +}
> +
> +/**
> + * xe_sriov_admin_vf_stop - Assert wrapper for VF stop command
> + * @pf_fd:  PF device file descriptor.
> + * @vf_num: VF index.
> + */
> +void xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_vf_stop(pf_fd, vf_num));
> +}
> +
> +/**
> + * __xe_sriov_admin_restore_defaults - Restore scheduling defaults for a VF
> + * @pf_fd:  PF device file descriptor.
> + * @vf_num: VF index (0 for PF, >0 for VFs).
> + *
> + * Resets execution quantum, preemption timeout, and priority to driver defaults.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num)
> +{
> +	int ret_eq, ret_pt, ret_prio;
> +	int ret = 0;
> +
> +	ret_eq = __xe_sriov_admin_set_exec_quantum_ms(pf_fd, vf_num, 0);
> +	igt_warn_on(ret_eq);
> +	if (!ret)
> +		ret = ret_eq;
> +
> +	ret_pt = __xe_sriov_admin_set_preempt_timeout_us(pf_fd, vf_num, 0);
> +	igt_warn_on(ret_pt);
> +	if (!ret)
> +		ret = ret_pt;
> +
> +	ret_prio = __xe_sriov_admin_set_sched_priority(pf_fd, vf_num,
> +						       XE_SRIOV_SCHED_PRIORITY_LOW);
> +	igt_warn_on(ret_prio);
> +	if (!ret)
> +		ret = ret_prio;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_admin_restore_defaults - Assert wrapper restoring VF defaults
> + * @pf_fd:  PF device file descriptor.
> + * @vf_num: VF index (0 for PF, >0 for VFs).
> + */
> +void xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_restore_defaults(pf_fd, vf_num));
> +}
> +
> +/**
> + * __xe_sriov_admin_bulk_restore_defaults - Restore scheduling defaults for PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + *
> + * Resets PF and all VFs to driver default scheduling parameters.
> + *
> + * Returns: 0 on success or negative errno on error.
> + */
> +int __xe_sriov_admin_bulk_restore_defaults(int pf_fd)
> +{
> +	int ret_eq, ret_pt, ret_prio;
> +	int ret = 0;
> +
> +	ret_eq = __xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, 0);
> +	igt_warn_on(ret_eq);
> +	if (!ret)
> +		ret = ret_eq;
> +
> +	ret_pt = __xe_sriov_admin_bulk_set_preempt_timeout_us(pf_fd, 0);
> +	igt_warn_on(ret_pt);
> +	if (!ret)
> +		ret = ret_pt;
> +
> +	ret_prio = __xe_sriov_admin_bulk_set_sched_priority(pf_fd,
> +							    XE_SRIOV_SCHED_PRIORITY_LOW);
> +	igt_warn_on(ret_prio);
> +	if (!ret)
> +		ret = ret_prio;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_sriov_admin_bulk_restore_defaults - Assert wrapper for restoring defaults on PF and all VFs
> + * @pf_fd: PF device file descriptor.
> + */
> +void xe_sriov_admin_bulk_restore_defaults(int pf_fd)
> +{
> +	igt_assert_eq(0, __xe_sriov_admin_bulk_restore_defaults(pf_fd));
> +}
> diff --git a/lib/xe/xe_sriov_admin.h b/lib/xe/xe_sriov_admin.h
> new file mode 100644
> index 000000000..607e33a86
> --- /dev/null
> +++ b/lib/xe/xe_sriov_admin.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2025 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef __XE_SRIOV_ADMIN_H__
> +#define __XE_SRIOV_ADMIN_H__
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stddef.h>
> +#include "xe_sriov_provisioning.h" /* for enum xe_sriov_sched_priority */
> +
> +struct igt_sysfs_choice;
> +
> +bool xe_sriov_admin_is_present(int pf_fd);
> +
> +int  __xe_sriov_admin_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms);
> +void  xe_sriov_admin_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms);
> +int  __xe_sriov_admin_get_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t *eq_ms);
> +uint32_t xe_sriov_admin_get_exec_quantum_ms(int pf_fd, unsigned int vf_num);
> +int  __xe_sriov_admin_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us);
> +void  xe_sriov_admin_set_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t pt_us);
> +int  __xe_sriov_admin_get_preempt_timeout_us(int pf_fd, unsigned int vf_num, uint32_t *pt_us);
> +uint32_t xe_sriov_admin_get_preempt_timeout_us(int pf_fd, unsigned int vf_num);
> +int __xe_sriov_admin_set_sched_priority_string(int pf_fd, unsigned int vf_num,
> +					       const char *prio);
> +int __xe_sriov_admin_get_sched_priority_choice(int pf_fd, unsigned int vf_num,
> +					       struct igt_sysfs_choice *choice);
> +int __xe_sriov_admin_set_sched_priority(int pf_fd, unsigned int vf_num,
> +					enum xe_sriov_sched_priority prio);
> +void xe_sriov_admin_set_sched_priority(int pf_fd, unsigned int vf_num,
> +				       enum xe_sriov_sched_priority prio);
> +int __xe_sriov_admin_get_sched_priority(int pf_fd, unsigned int vf_num,
> +					enum xe_sriov_sched_priority *prio,
> +					unsigned int *prio_mask);
> +enum xe_sriov_sched_priority
> +xe_sriov_admin_get_sched_priority(int pf_fd, unsigned int vf_num,
> +				  unsigned int *prio_mask);
> +
> +int  __xe_sriov_admin_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms);
> +void  xe_sriov_admin_bulk_set_exec_quantum_ms(int pf_fd, uint32_t eq_ms);
> +int  __xe_sriov_admin_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us);
> +void  xe_sriov_admin_bulk_set_preempt_timeout_us(int pf_fd, uint32_t pt_us);
> +int  __xe_sriov_admin_bulk_set_sched_priority_string(int pf_fd, const char *prio);
> +void  xe_sriov_admin_bulk_set_sched_priority_string(int pf_fd, const char *prio);
> +int __xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
> +					     enum xe_sriov_sched_priority prio);
> +void xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
> +					    enum xe_sriov_sched_priority prio);
> +
> +int  __xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
> +void  xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
> +
> +int  __xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
> +void  xe_sriov_admin_restore_defaults(int pf_fd, unsigned int vf_num);
> +int  __xe_sriov_admin_bulk_restore_defaults(int pf_fd);
> +void  xe_sriov_admin_bulk_restore_defaults(int pf_fd);
> +
> +#endif /* __XE_SRIOV_ADMIN_H__ */
