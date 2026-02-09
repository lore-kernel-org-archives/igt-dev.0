Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B4CE7E0C0
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B11810E3BC;
	Mon,  9 Feb 2026 10:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWDXOCcs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3B310E3BC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632278; x=1802168278;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N6ROJEqJ9zDumN9haeaFIT95smsok5R+NpAz15zbMGk=;
 b=LWDXOCcsdzIXWu4nsYz+apbrP88fkpQTK6aOJ+d3lbd6kTMd4gAfYGR5
 in5dh36vY7h2pGL+9hguL28WXgQeDEmiChRLoZaM+JTC/yFNgdlxkNaji
 D3Q+BpTBSZevqqiIZccrzoW2ohPzFZFzYjAOD8HP3HcOqC8+xqC8odrEO
 Tm7TOqgUOYxNEfSXXm7e+tIVTpSRqfh5+peD89g7tzNRIMH2MRVtg7Zxh
 R9ojnoWfU0lmOblOoCRFXfiTRmMrbTJT5CdjdWqHtloHQdk7UgobSZxGO
 GCdfuxucY7keJp8PQBTAN3UFnvGLUjZR9zRQW1pFzKyAfi9fG9PrRyRmL A==;
X-CSE-ConnectionGUID: IE7zRNsnTRarTz0neNvNMQ==
X-CSE-MsgGUID: wjRVyuA6TuKzVajd6dTc3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="59306735"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="59306735"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:17:57 -0800
X-CSE-ConnectionGUID: RWsMoSwETECSqP22iSsSFQ==
X-CSE-MsgGUID: CGEeD+EUTOmOsOfcuNX9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211271077"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:17:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:17:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:17:57 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:17:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bun7lx/wBqComlxe3r1XYdPTw5sWU9OdC45X8u6lgzpHi+gdnM6VW91uD/IR3/Z/Tc4kJNORZHUoD6M4PFD0wXdxrr5rDQTPn8YvRZr4VwTonDQ+4YCM24TYwK1QlnZM73O+yz6VkDX/F6duJxBR/1M09uvl/B/z8Gl7Ef9I6DXbw1GyjmcXNCaX4e+i+ppRPB7697XcIY9u3II/a+0GSP9XH0l0S7yeICkQD1kuTdas2g67MasoO58rmKnmM4QzZi9KMnqwXFNJ0mKbb5HKDiQvkQZHaHqVjZNjmNN3Nxw4XoIoJOQUsScFescJqp29nfJj1lEWkWK3mVrn9d959Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwP9zh+NYwb3aOXi8SO5yXpdCTHiiGyZcLkCM95sFXY=;
 b=lbUNs7uT54Scd9H0z+Wm8Qseal9wB4JPuwlh+U9BJUBs5amQhDLWfupWyENUDH60FA3BeHNs7bWPNcYLKjYiiWOJIyMY2DXToM5ZUr6rWCEDanSUK7Z1L/Iwj9FrS/T1kiYVIvjwzXD85fyOI9UW+bMUWNW0wQlCrMReJQ9t3PQU22FEZKDK+jARLobRvzs168VZ9EP4ZikZ/afU/iu4KZ4V4U2uFbtgl6X7Xx855tAZipJzgGWxftZ156UMULukYOBy0rrS9A5PiOpZRAdbV39dpRieBJvrrr+cqYF3lOpDuH1EkT8NDpRXhfcMrqCq8k2G6uqguCCx+8W7TkVKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:17:55 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9587.013; Mon, 9 Feb 2026
 10:17:55 +0000
Message-ID: <4d112e94-a54a-46b0-8545-6bce858e6c34@intel.com>
Date: Mon, 9 Feb 2026 11:17:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 3/7] tests/intel/xe_sriov_flr: Attach VFs to
 xe-vfio-pci before initiating FLR
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Adam
 Miszczak" <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
 <20260204163217.121305-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260204163217.121305-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0036.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::9) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d732b44-59a8-4880-8de3-08de67c47d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUlqZGxFRTExaVRkWHFTVkw4QjkvVnl6endIOXY5MnU0RFNESHg0SVhFMUdV?=
 =?utf-8?B?WG8zbkpUNndjSEdYa3JFcUtlWFlPeTZ0eUEva0d6VHBZSzRrdXA1bm9pVTlm?=
 =?utf-8?B?OW5uTzE4MGhnV0FiYnRNNSszWUI5NlRyb1R1cEs1NUFnN0U3eUtFekFXNENv?=
 =?utf-8?B?UlpFdGJkTmhzQ2FqUWV1bW5vREhRZ1VDMkc3cVdpcEYxenY4cEczdDNST0hp?=
 =?utf-8?B?WVNJZk8zNUlsM3ZNN0pRV1cyV1U2K0lVSVphY0V1NVdmSVZOd3dlMUNkMTVT?=
 =?utf-8?B?aGpXQmV6SUwrckRrYUpIdVpjdEM2ekw2UmNQQmR4MkNIZStJNklieHFVQkdW?=
 =?utf-8?B?cURFSHpiVWh4QTF4UUt5NWIveHBvWW1CQ1Fza2xtbXlzNFhiV3dVRUh5eTlC?=
 =?utf-8?B?cmNhTlNGMHNaTG5tS0hXSWFZZlY1ZDdmMnMzZkhmNTJJK1Q1Sml0SEpzTHJW?=
 =?utf-8?B?dVBVRUk2S1J4MnA0b3RFVEVGRFQ2ZS8rNS96YlpvU1dteE9VZ2l2czZIMm9F?=
 =?utf-8?B?ak9FTm9Mdi9SUEV6OFZoRXNiWjhCa3FiU2VqbVFDaWdYY25zOTZ6bWJsRTFY?=
 =?utf-8?B?ai9SRUdmWjFyT3JhK3Q3MWI0M29lYm9CUjBjTVlvbmdJY1B4TStLTnV6YUty?=
 =?utf-8?B?SXA0d2pyeG9jOWNkSzZ2RysxQ016NEVvRmFNTUFkUnU4YzU3MTFmR092T2M4?=
 =?utf-8?B?TWFqdGFHb3h0aU9nUjR3bTdKcW1yOVNJdGNXUkYrNmFxZzZPb0tvZ0R3eWNt?=
 =?utf-8?B?V25EZk04T29PZ1MvcTJDTnFjNkM2bURLR2tydEFOd1gwV281ODVLT0tJckFU?=
 =?utf-8?B?ajVaRHFTR01rSFBaNURubERKVVZoQVNoSWdtTVNjRFdHMG0wZ2xUZnVKb0J3?=
 =?utf-8?B?WENNMHNRNEJLOHIvemNiQnFmTXZieXFONXBJaEFJUUlBQlptekhRejVqc3gv?=
 =?utf-8?B?ZHpWbXV0cEZXQUxCMnNrN05BZ003V0pRMDJSc3lmYVVScUZlOWJjc2JyT2RP?=
 =?utf-8?B?ZFpuVjErS2laUWFGc1F4bWJwek05ZmRsNE8xc3hpdjZlcjhieTU0UnFsVVJ5?=
 =?utf-8?B?UUs4Qm9qTWxHWGtLdjhFNjRvVEpic2h6ZUhVN3B1UTRvUjZuVmVoY2toa0Uw?=
 =?utf-8?B?ZktwUVNkTmMrbkhYUGlBa3J5VUxrS0lKV0dKSTNCbDhBZTA0UU1XZDFWUVpn?=
 =?utf-8?B?U0hXZ0tRUmJzVG1QeTF5aDlhbFlJUjRiY05ST0hFQWZvOU9scWV6TFFpUzdV?=
 =?utf-8?B?Zi80SXRiNUNNTVNCemR3K0pqSWxDV3p2Y2dBNmdEcHovQk1XSDRQVzQvZFZF?=
 =?utf-8?B?NmdNMDhIN0YxbEVhVWltMCt3RjVKeXhGaGFMMStCMHhmdW5LWXFJWnJmUElx?=
 =?utf-8?B?VUJoMkZleGpEVzRvZHJOQ1FZanI3VFpSdHViLzBYOUhTUlhGWG1zNzVnS2Rs?=
 =?utf-8?B?YlZncHJ2d0FJQ3NDT3dBeURTem11N29HdzBrZTBLdm1KMGpBSVVKZkVKbDU2?=
 =?utf-8?B?eEtFbFcxQnNZb3NVVjJ4LzV2UUkxdURyZEprWGxLK2JWdmthQWxseDM0Um9i?=
 =?utf-8?B?TWxnVCtYTE8zNE4xT25zYkF6cUJtbzdZbUYrc2JabHdianUwS0dFdnlXUWFy?=
 =?utf-8?B?dWFXN1RtWEhLLzV5dkVEaFU4dWQ3RldYVGV4T3plUmJHQnZmK2NiWEZnNlhm?=
 =?utf-8?B?cFJrVlBQVzl5U1R4NCt6SWFka3BzajhZSU1MUjUxckpnTUU3bWhWeGRQVEZN?=
 =?utf-8?B?elNwb3JkVnNBRWRKczJTSWIxSTg0YS90SWVBeGR6NjBVN2N6dmptaUdacUVL?=
 =?utf-8?B?ZnU0OG5sbGRkeitWRUlSUEppdENSWGZKZUUzWnlxS25DS0tQejZ3NHp1d0tr?=
 =?utf-8?B?TStVUWcwa3YyMVd6SitxazIrQzNSQjR1YnIrS1VQNzQyYXFFbW8vdU5PY2JP?=
 =?utf-8?B?YzRxc01LUVh5V2dhMVNGa0V1ZFo3ZjRjRDF0b3FqWE5oaGJTYTM1eWxuVDVM?=
 =?utf-8?B?elF0MG1vSlRBWjdWYUk5d0RIa0x5dEUwWWFxb2VyU2gwZmJsV1p6OFc3MWFQ?=
 =?utf-8?B?cnlCVW9SWjVWTG9JN1Z0YTc0eFBTVE1JRFRBcnNCTDNXMTNrZU1pWnN6ZGVp?=
 =?utf-8?Q?Z8sA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm96Zm9DcDBrZkdVUWhkNXJxNGpOdXdPbUdqYkdOMW11SlU2VGhhVzBiZXJy?=
 =?utf-8?B?NXFrcC9aUlpJUGZSVFdCRFdnRENtcjhJMU00ekF5RlZqMDkyWWNDRHdGQ3ZO?=
 =?utf-8?B?SEIzd2VlWGZWRUxmZjh0WVJyN0RXUDZzTmpXTEdQK3hHcTEwa2szNWxLaG96?=
 =?utf-8?B?WHF1bkRBUFVYaDZORW50ZkdKSlhLMm5HTFdBRHF4M25ILzQ3NWVPMlRrMzM3?=
 =?utf-8?B?bnNET09FenhtWTlwazEwYkp4SDc3NnpCV3F5aTlWc3kvd2s5SEVRektRQWhu?=
 =?utf-8?B?cDR1S05mVDI0UDZydjJVWEZSUFloYzR2bzRTTDRaOVZYeTVzSUpDaEV3ZkNQ?=
 =?utf-8?B?OHVxcmZrMmdHT0lBczl0TWlDeTJsK1dvdCsrZGtFM3hwczJLaUhRb0VQZmli?=
 =?utf-8?B?dFE0SDhabC9FS2F2TFh1TVIxSC9Pa1U0UnNpVnpOY1gyK3FENnE4M245SE83?=
 =?utf-8?B?OTlnUnlGRlU0NGJnN1d5RzN4cFU0aDdnd1lmaEVmYlZpU3VGS0pYcUdaVGdn?=
 =?utf-8?B?L0tWdXlyVTdneTZBMjdBWmxmUVAvZzJVNGtRMk95YWNMQ09PZks4WGlScU40?=
 =?utf-8?B?QWxlY1luR05kMmVZTWlHYnhrS3NPQXUyRWFRVXpFbzRVL1ZSUWZOWWZWbkll?=
 =?utf-8?B?cGg2Qkd1N0lFQkJOelBWNzJmaDJGQlBMT3ZpRE1hRndDYjJvMXBsZzUrWm9r?=
 =?utf-8?B?bFl6QXpwbWcxTUZoclM3aWZqMnVXRm1TOVF0a09wQlFiVU5EVFZQV3NYbzBJ?=
 =?utf-8?B?TDIrbWdGdXBOT0lSS1ZWY0p1T3NFNEVranVhbUthYzcxaENqcHhaWEdCcGE5?=
 =?utf-8?B?KzI2NDdyaHZoU0IrUGZRVDZ2SEFhZHY0ZmhjZ0FWdFFnQ2tLSCswWE91Ly8z?=
 =?utf-8?B?bGw4M1NkeDYrMTAzMkdYNWl5TDlIcWdQY2R4cWtuWHB5aVo4dlZ2Q09pSXBY?=
 =?utf-8?B?LzMydmN4RGNscTVSanRUcC9GajhpUEczeTduZ2t0MTdjbStzdUJqVDN5dEsr?=
 =?utf-8?B?a051YjcwRVYzOXVjemhCV2JudDIzM0d1RSszQndkZ3FYUjJ5emNNb1FaZjdk?=
 =?utf-8?B?QTR2RDk1R1l4NU9DR1Q1T1RVV05xUnM5TU55aVdadFlhSk5sUk1uNDgwVHdn?=
 =?utf-8?B?bWNTcU5WdlpTdElUa1N2endSL1JGS0RsVzh3dlJXeDlNaEx3Y0t1MVVMZzZE?=
 =?utf-8?B?ZUtHaGhDTU9QTkkxNmVxZkd1MGl5NHZVUzROazRVVU5qVjJSdExOMGtiN1lk?=
 =?utf-8?B?TlF4MHM1cnJSaTdXeTlhbTExWmRhTTNVcG9qbmdqSVpDeW5FNkhHak9kNWhT?=
 =?utf-8?B?ZkNETlM0bEdtczBjanp2UHFTK0N0KzJBSzRIRGlGdmdwZGtoTmwxdmxwcTN1?=
 =?utf-8?B?V0VDQkhNUk1nTVc5N1RqbDVwU2VrWTJya3FqVkZGdTlSVVJNREhWZFVGdWNu?=
 =?utf-8?B?elNJdjFnbFNuM0FBRUcrM3R2V1RKMmw5UWdQWEpiL1NPVFM2azIrSHkrd2p0?=
 =?utf-8?B?SFd3T0VFRnEvZnVUaTRkR0JNMzl1RG9FWXUvTjhGenpwQTZINm9DSHQrODB0?=
 =?utf-8?B?UXJOVzRBTk0rdm1DSWxaa2lJOTdha0FtMENFYWtJWDI3Z1huNHFUWkNjbnFx?=
 =?utf-8?B?aWRyZ2hhbTNkN0pWSlB6YnBVR0dTbkp2aml0U2ltTWc2cy9sVXdnUERkc1h1?=
 =?utf-8?B?eEx6c0NjTnorMkRjaDExYW5wYW5PMFhCN3ZXelEwc1N5UUhvM0Z2VE1kQXZH?=
 =?utf-8?B?Z05iNm40QmZNZ3J5eHE3RzZhL0h2WXNlR29GVWZ0Mk1LNWgzdmNjaGpBdmVr?=
 =?utf-8?B?Q3FEVkU5RWcwejhmUk1xL0xKUGc2ejdqY09UL0s1NVFaL1A0NHdVb0N4MUZN?=
 =?utf-8?B?NUtsa2srS2tqOGcrSmswMFZONmppcXVRWC9DdmdPUHVjYlB2UFZUQUZlVGVz?=
 =?utf-8?B?RXhwTjUycWhQN1Y5WUFtZXl4VlhweEwrZStVOEJoVEJ3VUtUbGFDZGd1ZWFX?=
 =?utf-8?B?NEtJbVZsbTBpNXRCb3lISjZnbE95K0tOOXlhcktwQmFReSs1RGFhSWd1R01x?=
 =?utf-8?B?N0V5cCs3aTJVTjdHWm9SZjhiOGpYOHV5T1dxSWlYanVQaENSVnFvcjIvOWtC?=
 =?utf-8?B?L0hVZDM0czZ1b1lzMU1DTFk2Q2g2OG0xOVNRWUpIZE5EZ2ZXUlhjdFdnc01l?=
 =?utf-8?B?ZnZWa3NaWHRqVDAwKzc2Y1ZJcDJuT3EvU2twV1hEM2dUZUJZb1BVTW1FOGFP?=
 =?utf-8?B?SThqTzNZbWFRS2c3dTFPY1QrVHdRUHoyM2w4Y0lFcjFITnRBcFA1R0NaM0lM?=
 =?utf-8?B?bG1pdnQ3TkNXZHZ1ZHlIbGdwMHRzSzJ0R2kxc1RrMHZrcTFnT1JIZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d732b44-59a8-4880-8de3-08de67c47d99
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:17:55.3313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zx8zxVqOLbGoRx00HfjNIgRWgrLy5XbEriGHkMTb+m0OQD8mzJEzHuLto+RqZsbKuECuqQNCrqSarkOL2axCmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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


On 2/4/2026 17:32, Marcin Bernatowicz wrote:
> Attach all VFs to the xe-vfio-pci driver before running the FLR scenario.
> This allows the test to rely on xe-vfio-pci’s FLR wait handling, which is
> triggered when writing to the VF reset sysfs attribute.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Suggested-by: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

>
> ---
> v2:
> - Unbind VFs only if they were successfully bound.
>
> ---
>   tests/intel/xe_sriov_flr.c | 65 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 12989d0f5..2f6b24cf0 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -9,6 +9,8 @@
>   #include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_device.h"
> +#include "igt_kmod.h"
> +#include "igt_pci.h"
>   #include "igt_sriov_device.h"
>   #include "intel_chipset.h"
>   #include "intel_vram.h"
> @@ -57,6 +59,8 @@ static const char STOP_REASON_ABORT[] = "ABORT";
>   static const char STOP_REASON_FAIL[]  = "FAIL";
>   static const char STOP_REASON_SKIP[]  = "SKIP";
>   
> +#define DRIVER_OVERRIDE_TIMEOUT_MS 200
> +
>   static struct g_mmio {
>   	struct xe_mmio *mmio;
>   	unsigned int num_vfs;
> @@ -276,6 +280,47 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
>   	igt_skip_on(skips == num_checks);
>   }
>   
> +static bool vf_bind_driver_override(int pf_fd, unsigned int vf_id,
> +				    const char *driver)
> +{
> +	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
> +	int ret;
> +	char bound[64] = "none";
> +	int bound_ret;
> +
> +	igt_assert(slot);
> +	igt_assert(driver);
> +
> +	ret = igt_pci_bind_driver_override(slot, driver, DRIVER_OVERRIDE_TIMEOUT_MS);
> +	if (ret < 0) {
> +		bound_ret = igt_pci_get_bound_driver_name(slot, bound, sizeof(bound));
> +		if (bound_ret <= 0)
> +			snprintf(bound, sizeof(bound), "%s", "none");
> +
> +		igt_warn_on_f(true,
> +			      "bind %s (VF%u) to %s ret=%d (currently bound: %s)\n",
> +			      slot, vf_id, driver, ret, bound);
> +	}
> +
> +	free(slot);
> +
> +	return ret >= 0;
> +}
> +
> +static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
> +{
> +	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
> +	int ret;
> +
> +	igt_assert(slot);
> +
> +	ret = igt_pci_unbind_driver_override(slot, DRIVER_OVERRIDE_TIMEOUT_MS);
> +	igt_warn_on_f(ret < 0, "unbind %s (VF%u) driver_override ret=%d\n",
> +		      slot, vf_id, ret);
> +
> +	free(slot);
> +}
> +
>   /**
>    * flr_exec_strategy - Function pointer for FLR execution strategy
>    * @pf_fd: File descriptor for the Physical Function (PF).
> @@ -325,6 +370,8 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   {
>   	const int wait_flr_ms = 200;
>   	int i, vf_id, flr_vf_id = -1;
> +	bool xe_vfio_loaded;
> +	bool *vf_bound = NULL;
>   
>   	igt_sriov_disable_driver_autoprobe(pf_fd);
>   	igt_sriov_enable_vfs(pf_fd, num_vfs);
> @@ -335,6 +382,16 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>   	if (igt_warn_on(igt_pci_system_reinit()))
>   		goto disable_vfs;
>   
> +	xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
> +	if (xe_vfio_loaded) {
> +		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
> +		igt_assert(vf_bound);
> +
> +		igt_sriov_enable_driver_autoprobe(pf_fd);
> +		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
> +			vf_bound[vf_id] = vf_bind_driver_override(pf_fd, vf_id, "xe-vfio-pci");
> +	}
> +
>   	init_mmio(pf_fd, num_vfs);
>   
>   	for (i = 0; i < num_checks; ++i)
> @@ -357,6 +414,14 @@ cleanup:
>   
>   	cleanup_mmio();
>   
> +	if (xe_vfio_loaded) {
> +		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
> +			if (vf_bound && vf_bound[vf_id])
> +				vf_unbind_driver_override(pf_fd, vf_id);
> +	}
> +
> +	free(vf_bound);
> +
>   disable_vfs:
>   	igt_sriov_disable_vfs(pf_fd);
>   
