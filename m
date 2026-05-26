Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E892CD5BB4
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 05:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F33810E203;
	Tue, 26 May 2026 05:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARCU4KsQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1773510E203
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 05:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779773717; x=1811309717;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=IoJ7JufWl75iIDtTcGfP4ithE06tFCbnSuMJ1oeaWdo=;
 b=ARCU4KsQoEa7uNG0iYNDhRT5dJahVzYyGOzx11Dsh3Fz0kw4TqEhS/el
 UmmhNAzeqv11qgfcyfyMw3CizIAJb+5OnYNoFvs0dlH3hLZ4qdinCff+S
 BSJUIm/ERekIHfk7A9JHCw4HIpTCVGp3yWOECv5DKMdl4lgG+VcinPLAC
 79jLPfZVx4EJI4GwSTgM9pTLidUec3pvpXem1UOjRfUT87yMB0GhzPjZc
 u885G3rtE1qQLKQ+JyhICk47oeT4M6PUhaBazY+T/3+rzb0p5XK8WRZKl
 FshWNqIaRusxLvuSxhVL/f1s4mjkc9rSnAfujzDL83nVf/Rd3FMXNljNF Q==;
X-CSE-ConnectionGUID: Nb81TV/WQPOtCZMOz3lwXg==
X-CSE-MsgGUID: qBzSWQ78QYypzBaXanZ58w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79726213"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208,217";a="79726213"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:35:14 -0700
X-CSE-ConnectionGUID: 13BbN4dXRfKNYTFIzGG28g==
X-CSE-MsgGUID: Drc+kFvQThWx6bPpgJ/BVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
 d="scan'208,217";a="235454083"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 22:35:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:35:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 22:35:13 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 22:35:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMowanp1xuMLs//oHSOyXyFy08HTsbWHcS2t00DvkhZatvzTcxYDqNP1Yoeq7YPPYn35duf4uG6gFK6tHcX13oSFaQyp1uMyajI1qc9LrrxyoJhtBz4wfyCp8xbk00aYQKMmiGF8Hmuv09D3pe7AJXqEwfOAwciFxXiJ9gWl/pMpvb57PYlx6HqsZ7vQOLII2giAcfMWmBePrvCgxsjuUdOizixMK+C1iJkmwQzGXYyJZkCRYNst9LlGllv3L4lA1a0jbNVvl2c4h+VmOQ7XCtF5Ke6UfBaXxxFOTjS5dIp3m0tCVykDECd67r03fvR2Ul6sRsnRGHExa1AMf1vuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZ7GlR6r+TWifzwJIjKqQ4RbRqiChm74xCLwD8dZfrY=;
 b=KdVNwE1BOK3UW+JaD1zFgJXs2eIz5N6AENX7WpTuE3yQM/H4tQQSLnu9IuF9UZr2mFJxX8l9hR9IxqaacnuWtRmAqfBobQpJ2Qccsm5sT+YxBYVBs2beCg1XfiE0kuiTscGIyiGw1Nt935C6+MXFLr0dROHrj9Jn9f2Xmv3FNpJ0UT1Jqko5i9/UZzCDrlTsAnsIMGTVtgcdbJlxzsVyvEoDYz+4FbL1HkEdjWu27P6RGNJ2mLFraP1d+m8SfYmJ7krpC8t1N1lF3bIjP/EQGdoEQKBKHrt/pVq14gO6scqsgRap9iVeWW2y16anQGErSMRVRsEuZB+LxZXfZNsPyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 05:35:10 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0048.013; Tue, 26 May 2026
 05:35:09 +0000
Content-Type: multipart/alternative;
 boundary="------------aVqvMPm8p2UPS4efX1mAa0Ul"
Message-ID: <60fc56dc-771b-4107-8b6b-c1aa181289d4@intel.com>
Date: Tue, 26 May 2026 11:05:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/9] lib/intel_batchbuffer: add
 intel_bb_create_with_gt function
To: <igt-dev@lists.freedesktop.org>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
 <20260525163850.3493602-5-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260525163850.3493602-5-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MA5PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::9) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DM3PR11MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b8953d-7b5a-4b13-4f99-08debae88d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|11063799006|4143699003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: MVE1n4sy6uAsHTXAFRpRxtC4uaV2vcOXTwmlFbulscoIOmj/lXrLdSLNHJ4hyPNbmcLU/iIgnSnLdcTNVWqQQkT/iQtV/jocl2/vG/ip36ag0enqjmzZMFsE+HRjVxmXRHrbPj0yka+QNRl2Z3TOeh58rlpXn0RN4guZcLE6jXoJRwMrHo6qs7geDruCrHeWRc0dsZp/k333I+BSJP+KVyBiHIj9aZVvMGYAP0YdD9KJON+9t0l3rj3YypwAav07EmZZSDaOGkEgHXSby8yqYwxgnfKFHDqr3AE5GwU6L33D8jbHV3CXE8HXhCBXkvEOE6xAOVA3sQAxRs3X7/8zS2stmDaQzHMR9W+vkco5Df/xslYsMSj4q0VMRVGuTGROmRXgS70BytDufdjyEwHHGs9fA4nj1w1AIrYfhhh1gCFA+rsFbDuQjARIpE9+nWEJkMnJwXUPHWzwhFSI3n2plmSry31PLELIfXBJn+uvB2gnnd3G6cRqKHoTzbbPkwTgdZT53lukiv7hcBfw2RPPkuCwe5xz0vlZISQv+GCK7clff77TEghbBSmxO1CDsnNaTdFglTF87GcNeq8cTD21K6YYD9jwPQe/2IvFdHXhc+sHgBuXxrSyr5lxGtHXe7oUyrGpax2Ap2FVKBppya7Cz6r+as+oC6UQrUZwzDb8whQqzN97DXbDq37oMEvxXrs9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(11063799006)(4143699003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGRYVjlVWW80SEN5RGFNZzAyZEY5c1Q4WXRRVlJtb2g1TFJWRE8yd3VnVy9S?=
 =?utf-8?B?aEViUXNBdmZhVUp2bXFxSnVaYUVsR1BIVWdVWnRjOHpuK3dLZXJYQ2tWeWdF?=
 =?utf-8?B?TWwvTjhVUGtrajhwaXVYUWxmSU9OUTRiUHUveCtxYk4yOGxRbnpLMUVkc000?=
 =?utf-8?B?bHQ1aUpLM3UxbldGVHIrcXE4dmF2dGFucEREZEhpWElVOVVuR3UyeDJLcWpR?=
 =?utf-8?B?OHdvSVlQVkh1OVhFMTJxMWM1bmM3Zml1RldQU0RBRzZpczRKTlpmZ2ZHUVlN?=
 =?utf-8?B?OWJ4TFNsUStxc0s3bTJrR3B4UFZmRjcyUlNzYWo1aXZQOGRhYjBlVU1Candp?=
 =?utf-8?B?RGFKbmVLRW03Q2dvd1RtSS8rVzFyQkVjcTlOaUJHOXk0LzNZTW5OTHQrQlpT?=
 =?utf-8?B?OEcrY2o1YWd2SzdtZVF4VmFhbnV5YVNDSkIvNk4zZmtsZWlQamFiV3J3Ymww?=
 =?utf-8?B?bDdXOEM3RlZmY3o0L0RhVVN1UG5YZWJWWGxCLzVjdmx6dU5lVmpnd0hhejNW?=
 =?utf-8?B?cnJuVGg4Yjlva3ZxK294QmRSMmZDcjEzSWsvYjQ4MG5aYUYzelpEWEI1MWFW?=
 =?utf-8?B?UUlPQ1E2Zmk3ZTQyZ0tpMCtpUnlsUWdCOW12bzRRdytycWJqS1Z1OFg4UEs4?=
 =?utf-8?B?a3VVNzQ3Sm4vWTBHd0RQa0xJZENDN1ZiemlCVkE0cUgyRnZ5R096TXhEN1hx?=
 =?utf-8?B?YThMRE0vQ3ppNFVlNWl3MGFTN29mSldQbStwNERhNWVxMk5FZVNUL3A5MGgy?=
 =?utf-8?B?S0hoQmEvUS9WQlBCaVpaUDVRT0NYREljSVI2RXdkcHBzejdCNEFIclZoeDV3?=
 =?utf-8?B?YnBTZTBKQWs1OHFydnBLMmNPNnNJQVRsQmw3SnYzY2ZheHUzMklXcGJWWTgv?=
 =?utf-8?B?MDh3UUQ3Mlc4dlJhMThCNnE3SmxQMkVWNzRRYUlxVzZPdWVxZzJjVDBZNWZO?=
 =?utf-8?B?L3RyL0xPbWFiaFBlMGMxYVl6WTZjOEJ5clptcnRrUSttTll3MkZLRmc4S0tm?=
 =?utf-8?B?UVE3ZHlaZ09vY2VBQUNNUEpyL0ExWm90bmhpcExVUE5XYjhvK2ozSkxlTTFB?=
 =?utf-8?B?RWVSK3VuN0hqeWFtSUhwZ0lCbXlicHpwQ0Q3OERycXJsaEFqT0p6em5TeDhy?=
 =?utf-8?B?Qnkyak9yZzhiUXlPWTBCSkhEUk0xcllJUThubEFKSTlGRUJRcFhiTWlBK25p?=
 =?utf-8?B?eHhnSWJxWGloVVZXeXdMajFQL0FPNlJvV2VVSHJ5YkxubWI5MU9ydjlHeUNC?=
 =?utf-8?B?SGJlR3kzdUowQkROQ3BFeDJTbDZJaWpLdmhUUFJuVURXc2RyWXFRajZORkg4?=
 =?utf-8?B?WEpQaVY1a2JLVnpYbFRXS1g4MlFITm5GelBYZi9sR28weTJlc3RVSEQ2WTZZ?=
 =?utf-8?B?ZEpvSTRJNGFTTjQyVVdQc2hKalVWeUVnaGZqUk1IM3NaL0FFVGNneWVzbThu?=
 =?utf-8?B?V3VnZVB1Zzl2QXdxQWZpTC9hbStUWUZEaWM0OWVIN3JWTU1oNWFvVWtqTVpC?=
 =?utf-8?B?UnhRMWUvRXYvNVVMbXJtcGlJa05qWWlKYmFQOFJNeUV1WGljTTZpcGlOMXBk?=
 =?utf-8?B?amhLd0hZdXJhWlc1dTh5OGZHd0Fyc1c4cGEwdXdPY2RqWlNrZmpvWkJtYWJ5?=
 =?utf-8?B?WmNsS1ZjSmZxTXh0bGlRbFUyRzMrbmxkWndJaFJCU2dsQ08zRjZRWXFoVkZB?=
 =?utf-8?B?WHl3c3kzcjRYOUE1UERYYnRFdkNwZVZaSExqWFUrL2tuTGczOFlLaFQ4Qm5J?=
 =?utf-8?B?S3VQdU13Q3drTnExZzRwS1lzbFd1eVYyaDkwelRkakpwU0lKMlRPOGpmUkp0?=
 =?utf-8?B?OEltZndLazZjcVdJR05ZS2Vrb2Q2Mk1oRVVhMU90dVBOMzJMMXZsU2dQMHBE?=
 =?utf-8?B?TFRuZTJrUW9uNXVDendyK0VpcUhtUXl1T2JDcWFZeVB2d1drdXdKSmhpN3ZE?=
 =?utf-8?B?TzdNU2ZSVGhmVXN5eDYwcHN5dVN5Z01kSXBRVkFBU0UveUNXZVFQR1RNSUN5?=
 =?utf-8?B?NnRsb1ZHZ3V0NE1KV2ljR3Q0L05rUTk1WXBacVhaeXlremxRUU5Nek5JZFpY?=
 =?utf-8?B?ajRSTmFtOXJyaHlVN1NwRlRvdkI3L3M3UTQ5c2xXMGI2SU9NOXNEYnkvcjlD?=
 =?utf-8?B?U2g5V0lSTXZyQkI4cFVFZ2V2VHFtTGxEbXF1Q3U1cTkxYkVJN3JlKzY4S3Jz?=
 =?utf-8?B?YnBGT3hPeFpoODVFemJTcnhWUEY0eldkR3FTRmJrOEd3bk9IaXV0WnloeFRD?=
 =?utf-8?B?SEg3WUVVNm5VU2xEZUNWV3F4TlFlWU1acmYvOG9WblVFejcvRU9JSGxub3A2?=
 =?utf-8?B?eUN1Z2pTdWdQL0haOWFMa3lYT0tLRUdQL0FBLzFXYjVLRVJqMS9tblRmL1Jk?=
 =?utf-8?Q?gxxKffvM63Qc7Vac=3D?=
X-Exchange-RoutingPolicyChecked: JC5uWJddjqvNQj++OS+sEwf2NFZc+LEux+OUalRWH1PWz4WdkdKUvwz84ZhIjz+SoQFoB++XmH4Hs6BMsvQ+FM+6ft2r3Af7xAciijqQ0/NNvF6lrJv2aCS0oQka8LVSNgubK4L8XyvfA0h6df0FpCiGOgCu+Wc3fZKTLu8eoEgNHklKqjGhR4XPEDC5QnPoluiblCdTYyws935xjBCaVkVA+WP3zltDiIX/oEj8z+kAheDOqndSvs+tvJDpldkqQZS8O3RTUx9G8wqfGp7cNRol+U6Y0lxe8MXJSE26x4bcpACH5nQMG3KE5F7SmgGmnLamoyc4MHvrOAchpIYMog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b8953d-7b5a-4b13-4f99-08debae88d15
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:35:09.6599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7I+xW9wRvHkIRp/yg1apB4jPv3ur8+oRBp6Q3zBdRgsTuMADDQCW3f0lwW41nvQhLKb/EXbtAhWcwla0y8jkStbvL5gL2ZHlNK4Nw86r/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
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

--------------aVqvMPm8p2UPS4efX1mAa0Ul
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi JP,

On 5/25/2026 10:08 PM, Juha-Pekka Heikkila wrote:
> add possibility to use gt id with batchbuffer when on xe
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_batchbuffer.c | 26 ++++++++++++++++++++++++++
>   lib/intel_batchbuffer.h |  2 ++
>   2 files changed, 28 insertions(+)
>
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 536e8e402..4659b2915 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1165,6 +1165,32 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>   				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
>   }
>   
> +/**
> + * intel_bb_create_with_gt:
> + * @fd: drm fd - i915 or xe
> + * @gt_id: gt id
> + * @vm: for xe vm_id, unused for i915
> + * @size: size of the batchbuffer
> + *
> + * Creates bb with gt id passed in @gt
> + *
> + * Returns:
> + *
> + * Pointer the intel_bb, asserts on failure.
> + */
> +struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm, uint16_t gt_id)
> +{
> +	bool is_i915 = is_i915_device(fd);
> +	bool relocs = is_i915 && gem_has_relocations(fd);
> +
> +	return __intel_bb_create(fd, 0, vm, NULL, size,
> +				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
> +				 INTEL_ALLOCATOR_SIMPLE,
> +				 ALLOC_STRATEGY_HIGH_TO_LOW,
> +				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0),
> +				 gt_id);
> +}
> +
>   /**
>    * intel_bb_create_with_context_in_region:
>    * @fd: drm fd - i915 or xe
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 7049dd2d0..8d54c6590 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -324,6 +324,8 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
>   struct intel_bb *
>   intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
>   			     const intel_ctx_cfg_t *cfg, uint32_t size);
> +struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm,
> +					 uint16_t gt);

Please rename the header parameter also. with this change looks good to me.

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   struct intel_bb *
>   intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
>   				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
--------------aVqvMPm8p2UPS4efX1mAa0Ul
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP,</p>
    <div class="moz-cite-prefix">On 5/25/2026 10:08 PM, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260525163850.3493602-5-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">add possibility to use gt id with batchbuffer when on xe

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 lib/intel_batchbuffer.c | 26 ++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 536e8e402..4659b2915 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1165,6 +1165,32 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
+/**
+ * intel_bb_create_with_gt:
+ * @fd: drm fd - i915 or xe
+ * @gt_id: gt id
+ * @vm: for xe vm_id, unused for i915
+ * @size: size of the batchbuffer
+ *
+ * Creates bb with gt id passed in @gt
+ *
+ * Returns:
+ *
+ * Pointer the intel_bb, asserts on failure.
+ */
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm, uint16_t gt_id)
+{
+	bool is_i915 = is_i915_device(fd);
+	bool relocs = is_i915 &amp;&amp; gem_has_relocations(fd);
+
+	return __intel_bb_create(fd, 0, vm, NULL, size,
+				 relocs &amp;&amp; !aux_needs_softpin(fd), 0, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0),
+				 gt_id);
+}
+
 /**
  * intel_bb_create_with_context_in_region:
  * @fd: drm fd - i915 or xe
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 7049dd2d0..8d54c6590 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -324,6 +324,8 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size);
+struct intel_bb *intel_bb_create_with_gt(int fd, uint32_t size, int vm,
+					 uint16_t gt);</pre>
    </blockquote>
    <p>Please rename the header parameter also. with this change looks
      good to me.&nbsp;</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <p>&nbsp;</p>
    <blockquote type="cite" cite="mid:20260525163850.3493602-5-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
 struct intel_bb *
 intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
</pre>
    </blockquote>
  </body>
</html>

--------------aVqvMPm8p2UPS4efX1mAa0Ul--
