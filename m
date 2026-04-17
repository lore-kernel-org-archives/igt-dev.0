Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF8CF8E49D
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 07:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862B810E291;
	Fri, 17 Apr 2026 07:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RapzwtfG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6EC10E291
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776409243; x=1807945243;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=ImX/I5nza8PdRq+/FKdUpjTrOp3seVyO0sNlW1PrTek=;
 b=RapzwtfGcMuslFFjoEs+YRPMuHuEcs58D4Y6WpqTgb3O3JQGdITocEdy
 ktdTtXzmGxCPOGM80AG+B0o6R1Uns+J0kqoV77ljmf4zO4dgEa0Qkc8Y+
 LEDaHz4xeCNdleJmElswoQ6Q7ezhPtEC9d3vUS3qGB5Lr6EUMkEx4+FoE
 qdfI4GKJXBS9OD+cB/LDZw34ojZEXChnT949GjzPWdpTl4IGjs6YX0XGl
 TAgbv3eLagU2dvzPaZhONyOSLxhhuyS/kLoS1/tSKMEDEyhMeQiupHUxI
 zUfjKdVpGTfPWZ/gQ7uPI/izNWZ2Qe8X8zGqBOpLm2r/YO9Dv1cGBKopI A==;
X-CSE-ConnectionGUID: n/VwcWRrQc6t3IMgml7DEA==
X-CSE-MsgGUID: jb1VWpLQTkm6DnuUHRxrvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88040890"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208,217";a="88040890"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:00:42 -0700
X-CSE-ConnectionGUID: h+He97+ZTDCHz21lAqq9Kg==
X-CSE-MsgGUID: W/35txcNRc6r6ASPNgCgPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
 d="scan'208,217";a="261361697"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:00:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 00:00:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 00:00:41 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 00:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2F0MnURipGDB4UQ+NiqZtl3+5bPZQGonivBl8Ywcr5cr5eeIP6b5nuNy6u8dEiPmE4WglewI+y8een2dqOWWaCFdtla+s5anW0kLYMIaRpoBUVzPJ8o0ddnP8sGzB1PCRR38HfM+4fSnS/7lEGtGwre/5BpFwIijOK3k2o8zqNhiB0Urj7ZKlajVutDsmMGth6qK+c/xXbpObA6oa+ZAEQ8W/m/NIWw8PEcmoMbYbKL8Mr+C2knRiUw3hUEcDScvt6IuabUWLgM/h2wc/EoQrLfGkBTZS5PbYPT0J1Te8M1e2P+Opvwh2zpQ8jiq9aYQp3Hn2qOu+0RXjeGAF2phQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Rkr3n483GiU7xRTYnPUFSjYu9gyJu0aoFq01qWVvdw=;
 b=Y5aIX4QnNofFgcRpwL4esKBPoXcFEn13CaVsmh1fcremXC1BZ6nGwZHeoAMWSIC7Qjktp/s+E0Q9O/qolCHoNp+WeZFliIf/PCfKeXOuGTzNLs/UUDbTIZZkDQ+lIGKqGvm8T3hVg/K7J0QzeIzblsTSKytFzAV+tn9R5Q1Vb0yx4nvtO93cbp3jWzhHsiZf8oFVllTI6AGh2s+8fNBHiT52sCXdFcIWZ8cXugT1Sh2FTGGtRk8RcPPyfKR1wuvhCuyo7+d7TQBnR5nn8QFYZKt7xDY2sKxTe+7+6PZBj4FTT7/xHtuZo1dTVoOWmUMX0kpTZaXcoUDMBjZT4THN4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SAWPR11MB9548.namprd11.prod.outlook.com (2603:10b6:806:4e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 07:00:36 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 07:00:36 +0000
Content-Type: multipart/alternative;
 boundary="------------MGAJeSdNfRvIJkr7M87DrvV0"
Message-ID: <4ee172ac-1f0f-4204-ae5c-0c963b28255f@intel.com>
Date: Fri, 17 Apr 2026 12:30:29 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciB0ZXN0cy94ZTog?=
 =?UTF-8?Q?Add_purgeable_memory_madvise_tests_for_system_allocator_=28rev10?=
 =?UTF-8?Q?=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260414061703.2604112-1-arvind.yadav@intel.com>
 <177616025988.460527.8894426077576221835@a3b018990fe9>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <177616025988.460527.8894426077576221835@a3b018990fe9>
X-ClientProxiedBy: MA5P287CA0051.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::16) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SAWPR11MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f081e9-84fa-4bed-e98e-08de9c4f0696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rp3OTEgL1fULq9tYOGWEqjwguhltImVy7S9ssWpd8er+6E+p1yNCSAyqCXsSAP+yWsN6YWSMExzfbLjKlX+zLhySyLCMMRicMe3x4VO57Ztv1Q+NagyoHroAL5KOMTjmYesWssyNdeq9XrkLA1PVA4RIa72ZQGMtVc4gdbZaKOS2XgnC3w5lGA3RZOahkNGlbKTtHTCRmmOAmqL13EH5DI2w4bmassbgKJBHTzuMmw0R4UA7uYaBICGPZHSfKPrDfjA8VdwhBYuA+mIcXqGiriNjXzImn8W5aqNa+5Q+6Bqo5T3FZ7uZBOZCx7/6WozsYJEkRWoSibDFmXnKAMDQfSz9W7okx+Bwch/jn3Pvdlsf5cv4ryK7fkZFjb2tj4fmSgDAsaZaKTe1Dx8jF77SSx4T9IYHX9Idw5Qqr+/3XbC7YVidTTylwKNwgq+JIM4Ts/jVERjX9nE3QseqGho/tDe8rrIGvDK6wV3TyBKbUn3b0GvP4c0t44Gybqqs3p7r32crXMyeAvdmAj4qbo6+ApgPq0R0f28TK9JDsqh5Fp9xy2biZqPjOoe8bwIcJ7DTZefwUzBPrvO+aFxrBUS2qEfJ7MmBD2ZwndQA+WUosfU+O3S4Zpa+CVHoWrELc3HHZxSOaK3V+mWZgO7gtieyEjKCcNxsIe9zNKKk4g8gDC5URA3qgvCz1R+BV3GHTKj6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NWWnQ3dzByUXhzT01MNHdnMXVqRkpjeFg4a0o5OGQvNDZOcUx3dVpLdmpl?=
 =?utf-8?B?SzlxUnB3ZWdUNUN6S0hwUGhZaWpmN2pHK1d0SnNBOTdRZk9EclpCNWJhZjFa?=
 =?utf-8?B?ejNoUnVUWTc0M0dtNldrOThRNTN5WC9RblBMMjM2MXpEMTZwbjVQRHVjNHZo?=
 =?utf-8?B?TEQ4L3JOUmxRQ01ocEg1eWVuQUJkcEZPWDBCTWtYd1VWWVo4ZEFPVGp4amk2?=
 =?utf-8?B?VFdpYkpKS1VEZUpaQnFQM1hXZUg4YmI4Tml2ZjRIVDVvcXY0TmlraFJZbXNi?=
 =?utf-8?B?c0tDaFM5VUUzeThhcnp3TW1QNDlaaUg3K1daSS9hZnhEMlhyMXVlRXF0YVls?=
 =?utf-8?B?RXN5QzlkK1NJR2k4ZHdQSTYzU09hWFlxWC83Slh6SURwZjhJYXB6Y3hNYWt1?=
 =?utf-8?B?bi9lb2kzTk5PbFZuZVB5VVlqOWNQc3hLUWVlZ2loRjlVdlVkR3J0MWgxQm9Q?=
 =?utf-8?B?ZHI1OG83U3d3bmpCeVpvalB4akFjdmhoK2pETmVDMlJraFRMeEcraDNKTzBF?=
 =?utf-8?B?SWNtbTUvS1RVNFp2MzIxblA1RitPNGllamg5cmhIQ1Rnd3pMSjJYV1JkUmx1?=
 =?utf-8?B?bnpuZjBlTVdyd2hPRDVNaStWU3RYNjJtVHFreHhORTl0dzV1V0gwNGNvN24v?=
 =?utf-8?B?VW83Q0FNeUl2ajZYZE82ZXVoRER5WTlQWkl2c01ieFIzVmJqRVBoV1hNVlR1?=
 =?utf-8?B?eXFTNUwvUTlHOWdEa1h4cWNDT0pYM0FMREhUbHFyVFNRa2ViNjFEWVhMc2V6?=
 =?utf-8?B?VzhiZmNCQ3Z3V1RmV3NCcUZjZU90RzRidmdOelBFL3BsakRDRG90U1h0ZWRI?=
 =?utf-8?B?OWVkdWlZZElWQmNqSDNlOTBXTTB5elNTU1hEYWZzS0hSNVJUdlNjTUttTC9F?=
 =?utf-8?B?MzZKWlNSeHpvTFNONmRkZzhFdnd6TWM3MEtnbFdhYW5pTy9MVFRaVHZNRkVn?=
 =?utf-8?B?djk5UFVkckNIcm9GNTZzRDRubTB4aElCUWI4LzV0VjJIU3VUWURBQkxkcWM2?=
 =?utf-8?B?bzVQVVAzWWFySjltcElqaENjM01DTmV2NmxwM2VSbERPTkhsUnprazdPcnVN?=
 =?utf-8?B?RWg0Yi9iTHczQmVEWHVhWFA5MHc5bHJ5dFA1QnNHVVhSK3JycXpZVGlkS05G?=
 =?utf-8?B?MGtaa1k2T1JJaFR3eGZOTUlVVTBXRGhGR0pBL3ZSMGZGMmFrclJLV1BHQnh2?=
 =?utf-8?B?SzYvK1k4MUR4VUlhR3dBZEduQ0l1WGRjaVdTS1lJYnFuSitRd08wdGZ1bldx?=
 =?utf-8?B?UHUvMHRBRWtWOFlqdXd3Z2FIRmVLU0dPRVBrMUFGdURMOUZ3TjB1U1RiV05D?=
 =?utf-8?B?TU5ZSldpMUsxM0hpQkpVd2FTbXdpNjJUekhIV0RnVUZCU3FkVS81aHVpbXpx?=
 =?utf-8?B?SDUvQU8wYjdDMWpxRHp0WXNTcFZUWVZGdHpoeUxJbVg0QXdQL0psWFBrTWpw?=
 =?utf-8?B?dGxTenFKSkhZRnpadThTRmV0TkowT0pFMGdZTk5iZGhYQ09Wd3dLc0hJVlEx?=
 =?utf-8?B?TkVzWjd6WlAvbVZvSWZLaitGSzFCbVIzRUs3ZXc4c0RFWDhXM1FZclY0RG5J?=
 =?utf-8?B?L3hsaStvSXdSVmV0NkF5aldWbWNPcWJCN3h0VXBlWjBZclFsVWxoaDMwMHBh?=
 =?utf-8?B?UE1oRmpLR1VSN2FMS2hUdU0rQjRILzZXQ3VZZytaWThic2tTc2ZmZ1M5TXFH?=
 =?utf-8?B?UDVIc2dkT1ZaNnc2TzQwaXZFQ0pSam9YRmhPTVJ5c2pHZW9McEtPaW1iN2RS?=
 =?utf-8?B?SWY4SjNzWk4vWUcwTTkxWjdxcjRpV0hHTmNKQSs5MVJ4YzhpYmIrb2oyT1p6?=
 =?utf-8?B?aGV0Q01TOC9hZVFXeFQybzFQcm1KMzNXUlMzdXpydmJJZCtJeE5acGZzWldF?=
 =?utf-8?B?MUxIeFRLQVZlQzJwdUZXdkZlcVN1ZTkwV2FrZ3RlTGYwZ0haSjZOSE1OK0RS?=
 =?utf-8?B?YnNNRXdyQlJLekRsRVNwaU5MYUxnK1FtTG1qZXhoKzcrRzJjbUw3M1JYMTVo?=
 =?utf-8?B?RkhCc3M4dGluNFNrbUdwaVNYTS96TEtsOVpXYnVTNk8rQURWUkpTbWliVnEr?=
 =?utf-8?B?VzVWcVpDUHNWSXd6ZHVrUVpnWkRRc0tER2xOTEliT1lCZms1cVhVTDhLVHFF?=
 =?utf-8?B?RktheUdzNkFyd0o1MmZhWUF2RHdBRDBqeG9oQ0lDSzVtVUpuRmRrdEVKMWMv?=
 =?utf-8?B?MVhNMmFvcHMwMkp2dXg5ZDJHT29Gb0phczRNOThxMWVnMy9wZXB0VktKc1pF?=
 =?utf-8?B?aTFqUEFBbDkwYVV4V1NFazJCcEtDTVhxS0Z6R1BZeVVmL2lnaVdpbGM4UDBG?=
 =?utf-8?B?WTlhVCtBbjllVkhqOUJuK3ZPRmlBOGtSQlFRVG1tcjl3YXI5dlo1Zz09?=
X-Exchange-RoutingPolicyChecked: lxoGMaMmVJM7aqaAOQSjDRkhRhIn3SCC55BNmnlZGkzsDKbQvH59czvpU+k0YBO0WYbIPwQm4/cgzaBN8tHrH3DmWO3SArZDMVXkovxvWtz5qOBLhEPuieWvbgvH1lP+4OU+2/8cAjbAc3A5eI/JQ31sO6LqAXWZ7L+ro/JwcDBO5iB9z/TyOFPCeFDOyBuugQLXCpK/RV6KttNMaWbGYhubxvkIUWfbsPpKGrn4Hr/+GjZOxxKD0s+6YoZlOSKmlhpHmcLmBlXNkV+CbAl59ypNPzlveb9hdRe8D0DTKTR07XmDNXAFiHtrZ3GFvx9kfKmmZM2BbBjVCAunQz4cOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f081e9-84fa-4bed-e98e-08de9c4f0696
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:00:36.6570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG++F2hrp7D57IhWBZjM+vY7OUiDu5ksB4FfZxnlWeQeNa5jSdrQ09H32XEBVYg2xH7v8HTYgZ3t2KriD7ulbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9548
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

--------------MGAJeSdNfRvIJkr7M87DrvV0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This failure is not related to my changes.

Thanks,
Arvind

On 14-04-2026 15:20, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe: Add purgeable memory madvise tests for system 
> allocator (rev10)
> *URL:* 	https://patchwork.freedesktop.org/series/160333/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/index.html
>
>
>   CI Bug Log - changes from XEIGT_8855_FULL -> XEIGTPW_14978_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14978_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14978_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14978_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_exec_system_allocator@eu-fault-64k-range-device-host:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_exec_system_allocator@eu-fault-64k-range-device-host.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_exec_system_allocator@eu-fault-64k-range-device-host.html>
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8855_FULL and 
> XEIGTPW_14978_FULL:
>
>
>       New IGT tests (7)
>
>  *
>
>     igt@xe_madvise@dontneed-after-exec:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.27, 7.33] s
>  *
>
>     igt@xe_madvise@dontneed-after-mmap:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.34] s
>  *
>
>     igt@xe_madvise@dontneed-before-exec:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [1.26, 8.52] s
>  *
>
>     igt@xe_madvise@dontneed-before-mmap:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.00] s
>  *
>
>     igt@xe_madvise@per-vma-protection:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.23, 14.95] s
>  *
>
>     igt@xe_madvise@per-vma-tracking:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.18, 7.51] s
>  *
>
>     igt@xe_madvise@purged-mmap-blocked:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.27, 7.48] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_14978_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#6652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652>)
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#7621
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#7621
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367> /
>         Intel XE#7354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1
>         other test skip
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724> /
>         Intel XE#7449
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> /
>         Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304> /
>         Intel XE#7374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_content_protection@type1.html>
>         (Intel XE#7642
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@kms_content_protection@uevent.html>
>         (Intel XE#6707
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707> /
>         Intel XE#7439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286> /
>         Intel XE#6035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#2350
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350> /
>         Intel XE#7503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503>)
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#7308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1
>         other test skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html>
>         (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021> /
>         Intel XE#7377
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +4
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#7340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340>)
>  *
>
>     igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4
>         other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387> /
>         Intel XE#7429
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429>)
>  *
>
>     igt@kms_psr@psr2-sprite-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +3
>         other tests skip
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>  *
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) +2
>         other tests fail
>  *
>
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-10/igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_vrr@flip-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +5
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-null-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nomemset:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nomemset.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nomemset.html>
>         (Intel XE#6652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652>)
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-free-nomemset.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +15 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@twice-mmap-free-madvise:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-3/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +130 other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +4
>         other tests skip
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html>
>         (Intel XE#7578
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-atomic-op-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +2
>         other tests skip
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> /
>         Intel XE#7590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590>)
>  *
>
>     igt@xe_peer2peer@write:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_peer2peer@write.html>
>         (Intel XE#2427
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427> /
>         Intel XE#6953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953> /
>         Intel XE#7326
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326> /
>         Intel XE#7353
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353>)
>  *
>
>     igt@xe_pxp@pxp-termination-key-update-post-rpm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-rpm.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733> /
>         Intel XE#7417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417>)
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>
>
>         Possible fixes
>
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#7571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#2233
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#2370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#2328
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328> /
>         Intel XE#7367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-128x42:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321> /
>         Intel XE#7355
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286> /
>         Intel XE#6035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#6126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126> /
>         Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#2374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374> /
>         Intel XE#6128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +6
>         other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_psr@pr-primary-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@kms_psr@pr-primary-blt.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_psr@pr-primary-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330> /
>         Intel XE#5813
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_sharpness_filter@filter-scaler-downscale:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_sharpness_filter@filter-scaler-downscale.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509> /
>         Intel XE#7437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>  *
>
>     igt@xe_eudebug@attach-debug-metadata:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@xe_eudebug@attach-debug-metadata.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_eudebug@attach-debug-metadata.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_exec_multi_queue@two-queues-userptr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-userptr.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_media_fill@media-fill:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-3/igt@xe_media_fill@media-fill.html>
>         (Intel XE#2459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459> /
>         Intel XE#2596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596> /
>         Intel XE#7321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321> /
>         Intel XE#7453
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_media_fill@media-fill.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-8/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-10/igt@xe_module_load@load.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-6/igt@xe_module_load@load.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457> /
>         Intel XE#7405
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405> /
>         Intel XE#7725
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725>) ->
>         (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-10/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457> /
>         Intel XE#7405
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579> /
>         Intel XE#7329
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329> /
>         Intel XE#7517
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733> /
>         Intel XE#7417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>
>
>     Build changes
>
>   * IGT: IGT_8855 -> IGTPW_14978
>
> IGTPW_14978: d929a21ab87ac544117ea61c8628d2529721c715 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8855: 3c05ee1076cee44a2bc3c176ec21e651f6eca600 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4897-c8bad7becc008716c8475847328c549e178c813c: 
> c8bad7becc008716c8475847328c549e178c813c
>
--------------MGAJeSdNfRvIJkr7M87DrvV0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi,<br>
      <br>
      This failure is not related to my changes.<br>
      <br>
      Thanks,<br>
      Arvind</p>
    <div class=3D"moz-cite-prefix">On 14-04-2026 15:20, Patchwork wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:177616025988.460527.8894426077576=
221835@a3b018990fe9">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe: Add purgeable memory madvise tests for system
              allocator (rev10)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/160333/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/160333/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14978/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8855_FULL -&gt;
        XEIGTPW_14978_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14978_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14978_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14978_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_exec_system_allocator@eu-fault-64k-range-device-host:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-9/igt@xe_exec_system_allocator@eu-fault-64k-range-d=
evice-host.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_exec_syst=
em_allocator@eu-fault-64k-range-device-host.html" moz-do-not-send=3D"true">=
FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8855_FULL and
        XEIGTPW_14978_FULL:</p>
      <h3>New IGT tests (7)</h3>
      <ul>
        <li>
          <p>igt@xe_madvise@dontneed-after-exec:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.27, 7.33] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_madvise@dontneed-after-mmap:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.34] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_madvise@dontneed-before-exec:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [1.26, 8.52] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_madvise@dontneed-before-mmap:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_madvise@per-vma-protection:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.23, 14.95] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_madvise@per-vma-tracking:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.18, 7.51] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_madvise@purged-mmap-blocked:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.27, 7.48] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_14978_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_big_fb@4-tiled-m=
ax-hw-stride-64bpp-rotate-0.html" moz-do-not-send=3D"true">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652" moz-do=
-not-send=3D"true">Intel XE#6652</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotat=
e-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#=
2327</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#=
1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-256=
0x1440p.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_bw@connecte=
d-linear-tiling-1-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621" mo=
z-do-not-send=3D"true">Intel XE#7621</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621" moz-do-not-send=
=3D"true">Intel XE#7621</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_bw@linear-tiling-2-displa=
ys-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7354" moz-do-not-send=3D"true">Intel XE#7354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">=
Intel XE#2887</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"tru=
e">Intel XE#3432</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@kms_cdclk@plane-scaling.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2724" moz-do-not-send=3D"true">Intel XE#2724</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449" moz-do=
-not-send=3D"true">Intel XE#7449</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-=
each-pipe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel=
 XE#2252</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_content_protection@dp-mst=
-type-1-suspend-resume.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974" moz-do-not-send=
=3D"true">Intel XE#6974</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_content_protection@legacy=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" =
moz-do-not-send=3D"true">Intel XE#3304</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7374" moz-do-not-send=3D"true">Intel XE#73=
74</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_content_protection@type1.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7642" moz-do-not-send=3D"true">Intel XE#7642</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@kms_content_protection@uevent=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6707" moz-do-not-send=3D"true">Intel XE#6707<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439" =
moz-do-not-send=3D"true">Intel XE#7439</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding=
-32x10.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel XE=
#2320</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" mo=
z-do-not-send=3D"true">Intel XE#2286</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6035" moz-do-not-send=3D"true">Intel XE#6035=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-u=
pscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-upscaling.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" mo=
z-do-not-send=3D"true">Intel XE#7178</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7351" moz-do-not-send=3D"true">Intel XE#7351=
</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-=
send=3D"true">Intel XE#4141</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-=
blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-=
not-send=3D"true">Intel XE#2311</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:<=
/p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-argb161616f-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-s=
end=3D"true">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7356" moz-do-not-send=3D"true">Intel XE#7356</a>) +4 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onof=
f:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-cur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-no=
t-send=3D"true">Intel XE#2313</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2350" moz-do-not-send=3D"true">Intel=
 XE#2350</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7503" moz-do-not-send=3D"true">Intel XE#7503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html" moz-do-not=
-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14978/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7308" moz-do-not-send=3D"true">Intel XE#7308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-=
clamping:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-modifier-source-clamping.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" mo=
z-do-not-send=3D"true">Intel XE#7283</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-=
yf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5021" moz-do-not-send=3D"true">Intel XE#502=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377=
" moz-do-not-send=3D"true">Intel XE#7377</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-fac=
tor-0-5:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz=
-do-not-send=3D"true">Intel XE#2763</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6886" moz-do-not-send=3D"true">Intel XE#6886<=
/a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send=3D"t=
rue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14978/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send=3D"true"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
340" moz-do-not-send=3D"true">Intel XE#7340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-s=
f-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Inte=
l XE#1489</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-3/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2387" moz-do-not-send=3D"true">Intel XE#23=
87</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/742=
9" moz-do-not-send=3D"true">Intel XE#7429</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do=
-not-send=3D"true">Intel XE#2850</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send=3D"true">I=
ntel XE#2413</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14978/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html" =
moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6361" moz-do-not-send=3D"true">Intel XE#6361</a>) +2=
 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-10/igt@kms_setmode@invalid-clone-ex=
clusive-crtc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">In=
tel XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_vrr@flip-basic.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499</a>) +1 oth=
er test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufen=
ce.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7636" moz-do-not-send=3D"true">Intel XE#763=
6</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@xe_evict@evict-beng-mixed-man=
y-threads-small.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send=3D=
"true">Intel XE#6321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"true">Inte=
l XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7372" moz-do-not-send=3D"true">Intel XE#7372</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_fault_mode@many-userp=
tr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6557" moz-do-not-send=3D"true">Intel XE#655=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_exec_fault_mode@once-multi=
-queue-rebind-imm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send=3D"tru=
e">Intel XE#7136</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-prio=
rity:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-fault-dyn-priority.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do=
-not-send=3D"true">Intel XE#6874</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-large-execqueues-mma=
p-new-madvise:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-e=
xecqueues-mmap-new-madvise.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/=
igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-madvise=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6557" moz-do-not-send=3D"true">Intel XE#6557<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" =
moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-large-execqueues-fre=
e-race-nomemset:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-e=
xecqueues-free-race-nomemset.html" moz-do-not-send=3D"true">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-=
2/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-race-nome=
mset.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6652" moz-do-not-send=3D"true">Inte=
l XE#6652</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-fre=
e-nomemset:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-free-nomemset.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" =
moz-do-not-send=3D"true">Intel XE#6703</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@twice-mmap-free-madvise:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-3/igt@xe_exec_system_allocator@twice-mmap-free-madv=
ise.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_system_allo=
cator@twice-mmap-free-madvise.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not=
-send=3D"true">Intel XE#6703</a>) +130 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_threads@threads-multi=
-queue-fd-userptr-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-se=
nd=3D"true">Intel XE#7138</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_rela=
y_init:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_guc_relay_init.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@x=
e_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html" moz-d=
o-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7578" moz-do-not-send=3D"true">Intel XE#7578</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-o=
p-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send=3D"true">Intel X=
E#6964</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1420" moz-do-not-send=3D"true">Intel XE#1420</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590" moz-do-=
not-send=3D"true">Intel XE#7590</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_peer2peer@write.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2427" moz-do-not-send=3D"true">Intel XE#2427</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953" moz-do-not-=
send=3D"true">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7326" moz-do-not-send=3D"true">Intel XE#7326</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353" moz-do-n=
ot-send=3D"true">Intel XE#7353</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@xe_pxp@pxp-termination-key-up=
date-post-rpm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">I=
ntel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7417" moz-do-not-send=3D"true">Intel XE#7417</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_query@multigpu-query-engin=
es.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#944<=
/a>) +1 other test
              skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@kms_cursor_legacy@flip-vs-cursor-atomic:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"=
 moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7571" moz-do-not-send=3D"true">Intel XE#7571</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard=
-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send=3D=
"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2233" moz-do-not-send=3D"true">Intel XE#2233</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/=
shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing=
-internal-panels:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing-internal-panels.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370" moz-do-not=
-send=3D"true">Intel XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-270.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#2327</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-=
2/igt@kms_big_fb@linear-64bpp-rotate-270.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
 moz-do-not-send=3D"true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2328" moz-do-not-send=3D"true">Intel XE#2328</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7367" moz-do-not-send=3D"tr=
ue">Intel XE#7367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14978/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:<=
/p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotat=
e-180-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14978/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-=
180-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel=
 XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-9/igt@kms_bw@connected-linear-tiling-2-displays-216=
0x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7679" moz-do-not-send=3D"true">Intel X=
E#7679</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14978/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440=
p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-cc=
s.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">Intel XE#2887=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1497=
8/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +2 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2325" moz-do-not-send=3D"true">Intel XE#2325</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358" moz-do-not=
-send=3D"true">Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_chamelium_color@ctm-red-t=
o-blue.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE=
#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp=
14.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6974" moz-do-not-send=3D"true">Intel XE#697=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_149=
78/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-128x42.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel XE#2320</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-b=
mg-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel XE#2321</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355" m=
oz-do-not-send=3D"true">Intel XE#7355</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_cursor_crc@curso=
r-rapid-movement-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-se=
nd=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-d=
o-not-send=3D"true">Intel XE#2286</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6035" moz-do-not-send=3D"true">Intel XE#6035</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/s=
hard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-trans=
itions-varying-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"t=
rue">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-9/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6126" moz-do-not-send=3D"true">Intel XE#6126</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/776" moz-do-not-send=3D"tr=
ue">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14978/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-2/igt@kms_feature_discovery@psr2.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2374" moz-do-not-send=3D"true">Intel XE#2374</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6128" moz-do-not-send=3D"=
true">Intel XE#6128</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_feature_discovery@psr2.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upsc=
aling:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64b=
pp-yftile-upscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" moz-do-not-send=3D"t=
rue">Intel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7351" moz-do-not-send=3D"true">Intel XE#7351</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@=
kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-ren=
der.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
978/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +6=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indf=
b-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"true">In=
tel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14978/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb=
-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Int=
el XE#6703</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-=
draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send=3D"true">In=
tel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7356" moz-do-not-send=3D"true">Intel XE#7356</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-ind=
fb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">I=
ntel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14978/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indf=
b-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">In=
tel XE#6703</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@k=
ms_hdr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-se=
nd=3D"true">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-=
modifier.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send=3D"true">Intel =
XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14978/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modif=
ier.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#67=
03</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-e=
xceed-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel =
XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14978/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed=
-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#67=
03</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-primary-blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-1/igt@kms_psr@pr-primary-blt.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2234" moz-do-not-send=3D"true">Intel XE#2234</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"tru=
e">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14978/shard-bmg-2/igt@kms_psr@pr-primary-blt.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-7/igt@kms_psr@psr2-primary-render.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@k=
ms_psr@psr2-primary-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-se=
nd=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-tiling:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3904" moz-do-not-send=3D"true">Intel XE#3904</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7342" moz-do-not-send=3D=
"true">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_rotation_crc@bad-tiling.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-1=
80.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2330" moz-do-not-send=3D"true">Intel XE#233=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813=
" moz-do-not-send=3D"true">Intel XE#5813</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@kms_rotation_crc@=
primary-yf-tiled-reflect-x-180.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-no=
t-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6503" moz-do-not-send=3D"true">Intel XE#6503</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/=
shard-bmg-2/igt@kms_sharpness_filter@filter-scaler-downscale.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-cha=
melium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2509" moz-do-not-send=3D"true">Intel XE=
#2509</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7437" moz-do-not-send=3D"true">Intel XE#7437</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@kms_tiled_dis=
play@basic-test-pattern-with-chamelium.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" m=
oz-do-not-send=3D"true">Intel XE#2426</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5848" moz-do-not-send=3D"true">Intel XE#584=
8</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@attach-debug-metadata:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-2/igt@xe_eudebug@attach-debug-metadata.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7636" moz-do-not-send=3D"true">Intel XE#7636</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/=
igt@xe_eudebug@attach-debug-metadata.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz=
-do-not-send=3D"true">Intel XE#6703</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-userptr-invali=
date.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"true">Intel XE#2=
322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
72" moz-do-not-send=3D"true">Intel XE#7372</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_exec_basic@m=
ultigpu-no-exec-userptr-invalidate.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-d=
o-not-send=3D"true">Intel XE#6703</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-=
prefetch.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send=3D"true">Intel =
XE#7136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14978/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-prefet=
ch.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#670=
3</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@two-queues-userptr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6874" moz-do-not-send=3D"true">Intel XE#6874</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-=
bmg-2/igt@xe_exec_multi_queue@two-queues-userptr.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:<=
/p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-use=
rptr-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-send=3D"true">Int=
el XE#7138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14978/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-userp=
tr-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel=
 XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_media_fill@media-fill:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-3/igt@xe_media_fill@media-fill.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2459" moz-do-not-send=3D"true">Intel XE#2459</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2596" moz-do-not-send=3D"tr=
ue">Intel XE#2596</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7321" moz-do-not-send=3D"true">Intel XE#7321</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7453" moz-do-not-send=3D=
"true">Intel XE#7453</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_media_fill@media-fill.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-bmg: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8855/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
855/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-b=
mg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8855/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_885=
5/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg=
-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-5/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-3/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-7/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8855/shard-bmg-10/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8855/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8855/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shar=
d-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg=
-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-3/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-2/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-1/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8855/shard-bmg-10/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8855/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"tr=
ue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855=
/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-=
4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8855/shard-bmg-9/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true=
">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7405" moz-do-not-send=3D"true">Intel XE#7405</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7725" moz-do-not-send=3D"t=
rue">Intel XE#7725</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14978/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14978/shard-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4978/shard-bmg-7/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/sha=
rd-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-7/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-6/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14978/shard-bmg-1/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14978/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14978/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1497=
8/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-=
bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-9/igt@xe_module_load=
@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-10/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14978/shard-bmg-10/igt@xe_module_load@load.html" mo=
z-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14978/shard-bmg-9/igt@xe_module_load@load.html" moz-do-not=
-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14978/shard-bmg-9/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14978/shard-bmg-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/s=
hard-bmg-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg=
-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-5/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true">Int=
el XE#2457</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7405" moz-do-not-send=3D"true">Intel XE#7405</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/579" moz-do-not-send=3D"true">Intel XE#579</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7329" moz-do-not-send=3D"t=
rue">Intel XE#7329</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7517" moz-do-not-send=3D"true">Intel XE#7517</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@=
xe_pm@vram-d3cold-threshold.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-s=
end=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8855/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Intel XE#4733<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417" =
moz-do-not-send=3D"true">Intel XE#7417</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14978/shard-bmg-2/igt@xe_pxp@pxp-stale-bo=
-bind-post-termination-irq.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-se=
nd=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8855 -&gt; IGTPW_14978</li>
      </ul>
      <p>IGTPW_14978: d929a21ab87ac544117ea61c8628d2529721c715 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_8855: 3c05ee1076cee44a2bc3c176ec21e651f6eca600 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-4897-c8bad7becc008716c8475847328c549e178c813c:
        c8bad7becc008716c8475847328c549e178c813c</p>
    </blockquote>
  </body>
</html>

--------------MGAJeSdNfRvIJkr7M87DrvV0--
