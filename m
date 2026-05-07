Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100CFCD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 09:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FE710E23F;
	Thu,  7 May 2026 09:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dgw2nAif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F99110E23F
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 09:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778145127; x=1809681127;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2lwdl34oAkWHkYk1SJRUqdsn1aYRFjcvilETK0wzq8U=;
 b=Dgw2nAifGGEfJUY6VDV4Msy4CtZY4oVLrNRjNq3t6TEo9lZZBfSoLQwg
 aYiwFIQTp/JYXKielWqMd4Mc530cVxiXNVostHIOYJnlNhM2ICteBh0LD
 xC6ws9mb0dWtDobVvPQKKCz2hf4A0RTbFuJpFUo4B8PPfim/7FCF+lU7I
 NyyD2UD2q2oyHAo67k5eNeu8XO8MjF/uNaHLSDtr4cZXZjRNpWajIe0Mn
 oNEo3+5MOUFsoWoUyT4dcy6XMOn9FhN4dv27VnVolDiJ5LE3PyEn52u8u
 namWWgPodtgZwavxXnkOnQ02PzcCbP34ccx2k6+nsgpEHqII+tMfh4n2+ Q==;
X-CSE-ConnectionGUID: Wp6E1ZHdScuUlmkuX7Aa1g==
X-CSE-MsgGUID: x8TU7FK3TZyJQrsAc/TlVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101765662"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="101765662"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:12:06 -0700
X-CSE-ConnectionGUID: S4AMJszTR1GdrgZHEnMiCQ==
X-CSE-MsgGUID: BOFbucEeTBCg7JvgArsk0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="241407130"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:12:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 02:12:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 02:12:05 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 02:12:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2v+XMoDvLZMdsWJozaZCm/U61BXEvlPmKaXacBTg9EXYqQTKSpujzs8xaDMj0priOu+OJChP8Ruve8Z1f29wXlzxRpzoybslKWI9e5oroBzyMWfWdlJ6dgRapc04sraGBhh0gzFETBgOQrnkjGdYH+X+E+WJCJPUNOZ504iMi2TrCnYnfhigcWMXAIqMjNPuxu82MNF9m9arXG9Op/kXq4UgAfdkUhNX4v/VWCfx9vFMRTte/25cLhVtw12LYytd0PFKYX9rNyBSSedojFyDpBru+XqPnYC184xUwlyuL9biuucYkqn6gKmgOyuItwjxtZaNIb1abgWuUgjDw0Q2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKkn6dVi+nqv1BX1AE/JGSJallbDp2u9+Unh4pXi2PI=;
 b=B1RYtrMTIFqu5BhkhBtQk7EBF+EBAswgdPG7xlXfPB6+YIC86eIc6gqTbREFnp2Cc/2FoFjwjjx+vo94c6pDTKHUGQhkP9Gz+eHnpudqn2p18fZyG6bKLwGRgb0ddkoWF/AzqQcpW34hpLfSlL60BmWKsgCjnlsa8+07VPO8qsnF3uXbWVDdv1Y0qzPoQGrO1bWPUu055c1ea+qiRE6OUbUe94h3+EsHBeEnoXWYGdLiCuRojVmfgzSiRUoCQpq0bT6MRFOQVEh4pjP/I2l8DAFQovo1ibXkWOSmctXVtLIgot4ZgP+dt8P148+NKIlKBINrTEx9IHaJFNza0OJmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:11:56 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 09:11:56 +0000
Message-ID: <50f95966-a5a4-4ef6-a7ae-484ed0272ac3@intel.com>
Date: Thu, 7 May 2026 11:11:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tests/intel/xe_eudebug_online: Fix sporadic failures
 due to unhandled fsync errors
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260304143619.3854871-1-jan.maslak@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260304143619.3854871-1-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0144.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::28) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|PH3PPF4E874A00C:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d30333-20a7-4b1d-dfa8-08deac18aff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: KYcptVjJ5N7eCPXTLqHrCMhlCZxffgV4Jv9qmnTvX4Oh7333iaKId1ORVE0YHz9qCU6iAtTNELSu6cz3Do77pAUduF6qbcdCRLMjfKcTCiS3bxL4wkWLv49+PTj8+6m+bmrgOiGjYksRNyx64e3wehQPcEZc6J4F8N51lE7mO7hPZUMIw2gXHBL+3gWqxbaaAcWf+G2tZJIrJUqYzYPzHlggnnV+1KhjAOq0gTbSfvlgJdjfa3bZVLY/iJj64LRFvZntUiBQ6vqaNr2+BE7Tz1yBV6WrZ9OoONv4rRaV4lAibOMH8ky00H0D3L2GsnNnFPpl58DVkfD3KhUj92RkJvHYAYyd8dQBHRLllnKMsPtji3xG3knipTaQCBAMnNPQkWBZ3RHIJlsNuIiXnexbTTZWaPm5vv/JFvKXwgS14ya8dqmhEqzct3XOiM+fXNHEfhsua2p44UvcyE6QynIUPDzhoDj6NLCY+bGjhvPvZKqMbsAPAbSoGBkf5aYNAgq2zBNZrAIBvmKS1vl3i7wMGFHhI4igIpPaH/W1CxIAlDNt75XwMvFIjkgEtE+G5e9kjtcd8K/KJ1pxy1C7CBmw2L/0cl0A3cnrlGXhGOTSVQ54QyTwauiwrliOl/MugAltfRGKoVOE/J9ym/7gYwA1T3WBMndn2M5vlzBOqyAhoMnQTPNTnfZ829PlCJxCSZ9h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REt4dVd4UnNmRjIxM1Y1NmNJcXZuZGtURnBZdWpoVG9XclRUU1JPSGhQVk1N?=
 =?utf-8?B?WW0yZUVVR0hkR255RUgxZEZrcHNBR0ZqUnlKNWc2UjlCVWdZb2IwQkxVZmlX?=
 =?utf-8?B?NTh5a2hUS25iNkpEQkFWMkdtUUMrWW1UYlRGQkVWRy95UC9KaXVqVWEreFZO?=
 =?utf-8?B?cWtqUUZRNUlUK1RMM214RHhZRUJuMysxc3d1bEo5cmxHYmExelpNNnp1QTE0?=
 =?utf-8?B?Wlk2eTIrTDhzekFHVnAwTGQvWjdCWDJvRDNOUzdxdW1jQWg5Y3JMREY3aVhn?=
 =?utf-8?B?YVNpYWw0RTlKcEp2SUU3Z2k0eFlnMS80eUpyNDdkb0t0U0pOV0JGbnMwYlZs?=
 =?utf-8?B?aGxUbDNHcGxxZ0hvWk1jZ05RelV6dGxXbGl5TFBOTTZyWFlwbTNjZnQ3ZTJa?=
 =?utf-8?B?ZFFzdlBrQU5rOGtORGRHYmRtVEdWU1RFNDRUTU5JT1pEWU1saUhDZW44NHdq?=
 =?utf-8?B?U1lvZ25EbUNQZ3ZJSFNSTUJVTFVsUEROSXh1N2dtcU05MktPNERJajhuYkty?=
 =?utf-8?B?d1FDajRXUG9PdW50SFpKaXNQTVExZy84RWZMeFN0L0xzTUdJTjlNd2ZuQUZV?=
 =?utf-8?B?cldlSzAyemJEYWI1aWhNd25HRnY0bWxUODN0czVFaHduWHJCaWVPRVFEVWk0?=
 =?utf-8?B?cnhWMXFQc2EwazZEWjRXbG1kcjgrbFVtYlRDcGQrOVI3SnZOcFpYMWpCd3Bw?=
 =?utf-8?B?ajRWR0pDVTZibUZYYkFja3lFK1llT0JOOWpQNlVuNG1pRTZNMnNNaDFveXBS?=
 =?utf-8?B?U3MzemF6bmx4aG9sTFp4blZvNS85TFVia3l0RW1KSDNMU1JjU2l3NGYxaEts?=
 =?utf-8?B?WW1tL2VJUUZEN3IvUTArbXBVQkhmempMNlJDVnk4a3EwQ2lkbHAyMEtDSzhW?=
 =?utf-8?B?SC9VdUlMdmcxKytoMWVmT1UxZm5vbGQ4SThoZmFqdkFtQmVNSG9GRXFoRHg2?=
 =?utf-8?B?bWZHUXVkejVtQzgvSEV0U3BjM0k1d1lxSXNPVFVPUzh0Q2g5L28wdHl1YlFH?=
 =?utf-8?B?eTJtZGtDU21MYjFYQUFHRWR5VXk2cjNleml6OWZBWDhLSUhjcTdXSzlhM0Qv?=
 =?utf-8?B?SW12QkhvbTQzZnBvNmk2emZVY2wxTmpjaTVETElYNXlBWGNISjAya2JsOFNR?=
 =?utf-8?B?U3UyQ1YxeVY2MGFkY2hUa3ppNmpHd0hFTEdpSTZsZWRDcm1wSnFIRk9IbnBX?=
 =?utf-8?B?bjBDT05FbzN3VHJlZnpkRi9PNmtVWHFmekUrTEl5ZDZCQSs2b1cvQVJXY2FZ?=
 =?utf-8?B?VXNmYlFVYmkyVER1UGZwd1MwbHVBMVRTc0psMkV0V3dkZ1p2bUM3VEVpa00v?=
 =?utf-8?B?TjVGeGtWYmFlL1B2OTg3T1hxQ2J0OVZhZkFFVUFyQ2x3Nnc4d0FOUEg4Zzc5?=
 =?utf-8?B?c2pmM0hkWnBaU1g5SC9WQUNkT25DWXQ4eENiRHJjMCs1ekZqMTI3TzdOZDVE?=
 =?utf-8?B?UGZjSnZiWURicnY4YXd4Y216RUo5N2pGWDNCbjlNekJnRUZZZUFPMkFaUm0x?=
 =?utf-8?B?WWZhMTZkWTY3RGVlV0dMN3NhQktydE50K21GUDVaOUlpOHFkQnltZWFlQmRt?=
 =?utf-8?B?KzV2WjZoU0dMTDJ2cGlOUVI2WjBzOUhtZ05Gd1Nva2R5Q2g1Qy96YjdyaHlm?=
 =?utf-8?B?TVczSjlvQ0xZUGxtVExZRGZHR2YreFBRa2JFczg3NllFZGt4WWxkd2xMMkhR?=
 =?utf-8?B?ZUVmeE5vL080RGNwWnpwdy9qRHR1Y0RqUjFReXNNMGlBYTNydjRoaU9vSVNH?=
 =?utf-8?B?bHJiT0JxWXNSNXhvOUJwLy9FOHNrU3ZwMERoNmlWR1ZtOWo2Nys3UkM5MkpM?=
 =?utf-8?B?V0VMaDQwTlFucmtqbXFwSU92d3FDKzdSWEZuRWJVR2Y2NE5KMUZEdUMvMHFY?=
 =?utf-8?B?Vy9ETTJWT2hNMVh5bURVbVU5d2pwSG4vZWV5UjZBMEMrRzVLS2xiV2ZSZ2Vj?=
 =?utf-8?B?NUhGMmw4RFZ0cVlla1N5Qmk2U0lEVXZUY2kwMWlWUkFoY3hKdWlZaFVkRmg4?=
 =?utf-8?B?SGlnU1ZaMXhmczliU0JDMDBVakdiSExxOGU5YnkzWm9uTkp2RGc1UDhJa0xR?=
 =?utf-8?B?VDF6d1ZRM0RkU0FKMURIR1lQbStTRFVxS2liOVlnanREOWNBekovQTNHM2pC?=
 =?utf-8?B?Q3JMaGpORURqSDRFVUgzMGh5NDRoemRvcFBMVzA2RkdxODh0WjJ0UlgvOWdz?=
 =?utf-8?B?NG4zZWNJaTZXczd1c1BDbFU1bG4zeXVqTHgwek1sK3ZHd29RQUVCSHJpMytn?=
 =?utf-8?B?SExVRXo2MXNYSWwrdGhvQ0gxTTIwM21WOXJVTEhzZkpaNTdTR0N2bEpFZWxV?=
 =?utf-8?B?cEEwdnBuWElzR05ONnRtaE5WRnlkMlVpd2M4RVdQWnlyS0dwZ051ZDNyNHJo?=
 =?utf-8?Q?MaNHjGxAxgSd3ZJo=3D?=
X-Exchange-RoutingPolicyChecked: WAS5/kBNPfEYRnRyZwEWuOkGkUPs5fCCogFfJUhO8dF/Awe1lzTeKAOQ9QIF3MpBtSOdi+UiHBdh/1JaKKpZsq8bGMkaq9uA2GTRUAWtIbMmYYf8mrw/wpfp4uJ86QjGXM0ytJurQ/BQTIar1Hd2GnTycMZMONDqU6kkpi3mk1YeMQXThgnHwRRf88z2DiPjMkCncJQySpTPR7cS8uX+G/sj0/b4V1enLBcncoumU8O9TaTnvngj+dwEkex7A8VJfDW7RmWykcSG6oDNU/y3iiRTmH31GevtnB92efArmTnRR6jKHb1Hohyp02E7O1OcPJWUQu4JuyPGUTSdB/AkIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d30333-20a7-4b1d-dfa8-08deac18aff1
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:11:56.7471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4GJ12ws0GAZhIhN65BwGehXuR1YosMMOLVqU/mdLcLBnZjBzXjf+iQaZLDhFRlRL3B3/aXNwQMdNa/Vzs8uy+AxSkLCndeIPoBwSSXjjPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4E874A00C
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

On 04/03/2026 15:36, Jan Maslak wrote:

> Fix sporadic failures in xe_eudebug_online pagefault tests caused by
> fsync() on the debugger VM fd silently failing when the GPU cache flush
> hardware is temporarily busy.
>
> v2: Use IGT specific VM_SYNC_TIMEOUT_NS constant instead of
>      DRM_XE_EUDEBUG_VM_SYNC_MAX_TIMEOUT_NSECS.
>
> Jan Maslak (2):
>    tests/intel/xe_eudebug_online: Set timeout for debugger VM fd sync
>    tests/intel/xe_eudebug_online: Assert fsync return on debugger VM fd
>
>   tests/intel/xe_eudebug_online.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
>
Nice one,

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

