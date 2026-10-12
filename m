Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FA3CA9ED1
	for <igt-dev@archiver.kernel.org>; Mon, 12 Oct 2026 09:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB6510E484;
	Mon, 12 Oct 2026 09:15:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBAE10E4CF
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2026 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791796491; x=1823332491;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6sh33g5EUWuUjwvZGvKLbGxFw3uG5Gy4jzots8N6v34=;
 b=EmRU3LHskHqXE7lWhCwxBsPMxPVe4GEcKEzHgw1jKqaNCMCKjEGR6kAy
 EfOCo0kyKugvaB6Efg/Me1v0jsA290NVGoUYI98Otz9PQRuJkdZNjUM2+
 IYG1HG4FtL9njOsKdhhIyhCsP8zVnkUmAu+O3sYM9rm1gc7tbfrAywHZ0
 BOGQntCuu5DJ4Xns2P04Ack2DxkZlVpu5G0IjjJOAgBeX7/zlWQYiDtAA
 quLjs2m2PcVZ22s4dpT4s2XpH5DbwAkwGQc3KtAFdtCXToxXYnwy0/u0g
 1gQWAo4wp2cWSPKm2bnxhl9CeyH8EvYKEqIYQJIHVvQCkEqHnRNWpu6tL Q==;
X-CSE-ConnectionGUID: EhXKADKtSVu4E20pSztjeQ==
X-CSE-MsgGUID: pXrWiTgjRxeOP0QTCFna1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="373958"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="373958"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:14:51 -0700
X-CSE-ConnectionGUID: GlMGi0CYSAqZwZNOKNBVEQ==
X-CSE-MsgGUID: LMDa17csRuW+NjxoxADrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="950096"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:14:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 02:14:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 02:14:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 02:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S06IAzwz1VbETpXYRBv4kW+NQOACjPgeP/MYRU32f+O+ue3+i4M5mXtvIjau/cSp7OW5QqlMZ/GQt/VvX68oiB6fmIs8ImCHQCu/eC1lw1N+DgbqoKaXIWkukMXi/9XkCrCUAxvRWFIgkihI02XaPHjEX05v/iAXMZLk6S5gV2JViCimjohdNZu93IvzJ+AdqiyKaRFqGZoIEBoezaXMgCOq3vqwxiTDOKpKnahhdaJfqcPl+5ib+KiOSvWsNb9qBDS6xvC4aNRvwPzBucGmho0EcfNDz8CH9E/3kF5jiQF5PcxmvZJ0Xg2QG3KSdHgJF6yPIz8fr2wokj1HZlE2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIXk/al6ldVQpxYzJWiUGGlAaHzPwF4a5IhHjeLpq1o=;
 b=gOF88lN3OVdgOzBl6ZllFH3dCcVeItYA15heAilpI/M9v4jFQeM77vjQv+JdJvv25BCESxlvuLNRhC9Mc04aypGFxxAvMyCaFXxPN2nLRnIrfn9f6FaV2lFE+0IhK1rWi4CE2RFImJdftD9fs2pLE8gSQ3j+cBBuiQFWwQi8nsN9LHT6eEGEZqPuFAtat8eeMud9JeCB/esCZ4wblj+4yVyONGc5HJJYM63dg09/ro6NTq33HdEhFEtevYKz7YnLK9PT21rq5rv34LPwRaGPZ+J6/z/N9IldF92oNOk28U8wFA1g1tJvsfSCrRcb6HBfDGJ0NkwEX0z4IE/7zHn/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MN2PR11MB4549.namprd11.prod.outlook.com (2603:10b6:208:26d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 09:14:46 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0496.019; Mon, 12 Oct 2026
 09:14:46 +0000
Message-ID: <c6a567d0-3f8a-4a94-ad1f-0f02a9c0e54f@intel.com>
Date: Mon, 12 Oct 2026 14:44:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_wedged: Add cold-reset wedge test
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>
References: <20261012081719.3961358-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261012081719.3961358-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0135.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MN2PR11MB4549:EE_
X-MS-Office365-Filtering-Correlation-Id: 426da362-ed17-4920-35a2-08df2841427d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ml7X3FwAaiA7U65nFolOUThiauwNz+G7oXe1Xj0ZCH+iSZgBhyhlfXelMH6FGZ/tkbC5k6UvbBJCqEFm0ymgiBWWhy0jU05nnbeYrGST4jCa5HMefc/5lbAh1OM4zRTWCX54u59n3H4/NOlyXyhdoR2F9CvUurV0yffu0BOayE2/cpQgsRhIYuaKDyA5AmQm1fNikgaRZ3G4ATqf/+tJ2iQLUcArZgTS9O+w249TpNMvEdzdrFY3afFohRQ/eU7gQm7ufs80JTSNJBPWEDnvlq6H7gofYEZEERycu1I4lNhpbOwwYfesYKTYcgfdx4ovqy9HyhXhe54z9fP7Av3DVlk3K1dHva87r2UcRe27mCyhtQM+OkiSZRSm5wK0tgY/HB7JIRqBmq6HaWHnZ3Uza5V2g1BSZzNdJd1kvmHP1Z1+Y68wGos/oUQwe7Tmh/QulN0QnBzwuSzTmLlkKKv2i5t4n6Fp4jqkl0BJMXSPJZ5sSzq66XedcHBwwlIldcA+bzqQMh86hcA47L3MDOCQYqbDQSLqYVonhKm+yZC89H4lYTCgQly1rMGwC+ualRfoNaU5j2mxx799g4B0XHc4p7A8YdmQsQI3zaP2SY+loFaOHvAEllMQm8cxRKVMMT+t8o863cXgxQX1r8lDC340FRFv8whekF6BqnZ1hMXmWnE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUZINGY1YWV3ZXV1cmJrd0lEeFBlWDU5dHVSbDI5c1RLMWd0TU56czJTOThQ?=
 =?utf-8?B?MDdjK3VJOGhJam1VdVUzQ2UyTXY0cnFzWTVqaHE3ODJXZGtrOUlMbllaVEc0?=
 =?utf-8?B?VjZ6QWNXTTg3VjJ2RkZnMUhjdlVSSWpJR0htcUZUcXhpeEhaRVN3UVNQNW42?=
 =?utf-8?B?SVN2cllTZmpzQkFDcGlYNmdFNkNGbUh0OWx4RFFjUXAxVlVDOFNKYWhPUFBu?=
 =?utf-8?B?UWZCR1o2TExQOHd6Nm9lQTJPcjZoam9WV2ZkalFFbXlrQ0wyWGJZUnNIdzVE?=
 =?utf-8?B?YTdTdjdWcGtGc0ZSTHYxNlh3bDFEcGlDby8veGVCQklieVlpaHoxUEgzbnc3?=
 =?utf-8?B?U3VnVk13MmM0QWovSzVhUURnRm0wTHJ2YUwySFFyVnVacTVaYmFQNDBSbm5D?=
 =?utf-8?B?b1Y0TlhWVnFzOGJSczBxcjNxckkyc1dzbk50cS9IMlgrdWV1bWc0cTFIY0k3?=
 =?utf-8?B?Q280NEgzOUtjalJ2bHd0STlCTEJMbjNtbVY1SS9WTnZzbGdCYXRZcWJzWVMx?=
 =?utf-8?B?TGp6V0pDUmFmU3lhQitpY3lKcVhYMThDTEttRkNUM09rK28wVFVKeDB4RS8r?=
 =?utf-8?B?emNER2U5Sk1ZYnZaRkU1YlNmZzNPQ3FZUkhDNThPZHAyT0IxRVkzTlhsVjN6?=
 =?utf-8?B?V2VCcXN6NlcxZmhHKzIvSXhWaEwzbEN0ZFlZZGdtNDBvdWthcmJKMHZ1cUFm?=
 =?utf-8?B?Rm85UW9pWmFaUTFPNmh1WFlUMEp5cmJONWwySk9xcU94cnVwNC9CN2R2Y0JM?=
 =?utf-8?B?ZDArZ2NWSGFTMlBlck1YRUo1bStxcWZaV1MwL3NzemRPWW9iZm0ybXJjR1dR?=
 =?utf-8?B?cTREd011ZGZwR2JyQXJtVWRqWTI4UUZ6amdzemptdU9vOUdWRlRQdDZHeWw0?=
 =?utf-8?B?NUJoTHNiaTN0VHVlSUhJSXc4eG9IZVVMSFhqbG5oMmovbE1DT3NIdjVwcU5I?=
 =?utf-8?B?b2lxL2RPUkFWeVZEV2RqTTdESUNlYWozMHkvL3FtWGcya29ZYVBUckV6N0x4?=
 =?utf-8?B?dkZhTTcyQmhFMTNSUVBPOFFvM0w1MUpEdjhGM0JjbHhtQXVpN1QxWlEzT1pV?=
 =?utf-8?B?djF6dkhyQ3p6a09ST00zMGtjOXJqeGJMcnlmaTR3bnFpR3NqOE54ejBhNGZN?=
 =?utf-8?B?MWNZZ0pOTTNxNVFLdG8rWHlzb0RNeTNhK3gwZkxwUmtBY2doREJDeW05bFgv?=
 =?utf-8?B?MGVJZlhqVitmb2tDVTdoeERRUUp1Nm1TazlGYlRSempvWE5ibXloWkRFbzNw?=
 =?utf-8?B?Q2pBNmMzZWdyQ1hhd2YvemlrZWIwd3JmNEJnZ3B0MjdqSE5GRnlrNDBNSXM5?=
 =?utf-8?B?SGJ2TEpNWVFoYjk3eWw5T24xRUtiWUdOOEVDT0NCYWduZHh3ZzkvMldGbTJk?=
 =?utf-8?B?bG1CNGRGZWRTUTBXUjZvOWxzeFBPYW5VU2hpRmJ1ZUhTc1YxQTJqb0kvemha?=
 =?utf-8?B?bmp0ckhmYXM3cFBWUGxlQkpUZkQwYkQ4d1BOandkODVUWkpGQnpTVm83a2Z6?=
 =?utf-8?B?Nnp4L3J4cFdTZkVYa1Z1QVVMWmFWdXlOYWxyVHJjdTcrODY3ajdKRWFIUGND?=
 =?utf-8?B?d081RDNhT3V6ZzEwNHJNTmFhd25tdU5zSXZmNVRCelhhMXF3SmdoUmFpc0g1?=
 =?utf-8?B?d1lZSkJ6ZUdPd2FnS2xnN2Yrc2VWdThYU25OOXlEaUMzSVJUMW1GaHdXaVpP?=
 =?utf-8?B?aXBLRmZZTFlmR2ozc1AzVjErd3ZZT0N5OGgvQzdTQTVkN2NwUUgxSVMxSmJK?=
 =?utf-8?B?cFVkREpTd3QxUFd2MkNFQzJzWUFZNXg1bVVkUm51Zk85UjNha2Z2aTFQckRZ?=
 =?utf-8?B?bFRWV1QxYW55eHVTRVJydVlwVm4vRGFNWG1yNUUvNXRGSUNpQVhxcUcwczlM?=
 =?utf-8?B?VzN4ZGovZ1JiWXdGYjgreXpoSS80YTRhSkx4VnZ4RW5wWW4wUWw5OVM3WEVK?=
 =?utf-8?B?bllvSTlOby85Y2ZzZ29WNkdmbjV5L0FGcWp0a04wNjNtWGVmcXoydFEvc0RW?=
 =?utf-8?B?RytIdVNBcUFvQmFsZXpxODdaVzdtSy8wdVNYVkpiUWdkclpRaVBGenhXNDYw?=
 =?utf-8?B?R3pId05UQUt4cEx4UEtlcjFUYlVON2RhRmU5Y2VIbDAwWWZ6eGc5b2JUbmh1?=
 =?utf-8?B?aXoyZmsydjlYV25ZM0VScWNTUTh1Uk9jSkl2MGZITDl6cmR1bGZVdzBNYkxQ?=
 =?utf-8?B?dmZaY2UwWGVQcysvOW1MZ2dsaWRUZkhPOWVUcTNONmVJZzBnUjZGU1Y3N05j?=
 =?utf-8?B?UHowZysvVlVpTlpMRklxNGM1ZzJqQW5qbHErcERySDBPK2srWVlReC9wVXlI?=
 =?utf-8?B?WHY5WnRMZ3RoMG0ybmJMMStMRnBINWlzYWo4OTBFVGR0dUg2Qjh3akwycXM1?=
 =?utf-8?Q?Q+ARwN12v3hojO9E=3D?=
X-Exchange-RoutingPolicyChecked: jw7akYtVOisePedzoUF1RmYck+ipR1/xkcY4bS+aJ6eCpVi9qMDRZ+vmACCPHm9wxy4hvMn5bGs7mQ0dfeQ7iHkWmrbe8F6i6MVmy+OKB5FH59nUaumJAOjlrUEbzem0z750WMs1l+2yk4Wv9rXYOE/4pbUCM+eMchFJ+2C+N2GQTP3hIcl9dKWa1CKhiJWflr5+YJ5/u/Za4rQI6pMdkM4THCFJ161QEgTooB/SoptEmaNtW7SiA79G38HeFTy14Yq9K0/h51o0St5nnIoFl8GdHDmaqkYcr9dx2yeScICzav1e2Zi1QANRMgMuYcPIb7FoA2yQ7YCpDs3QXIL++g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 426da362-ed17-4920-35a2-08df2841427d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:14:46.6834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyangRDt+pH1ZcLXvf48wxZ4P+D8Xi9pJyKEsdAB4KDl1em0lmLipU4UHUr2czS6BGP2MbsvHC/WSzUV9tjatJhzOf3GNCgmX04ze4vrd2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4549
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


On 12-10-2026 01:47 pm, Sk Anirban wrote:
> Inject cold-reset at probe, validate the WEDGED=cold-reset
> notification, and verify the device is functional after driver
> recovery/rebinding.
>
> v2: Fix restore flow (Mallesh)
>      Cosmetic changes (Mallesh)
>
> Tested-by: Sk Anirban <sk.anirban@intel.com>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   tests/intel/xe_wedged.c | 113 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 111 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 8c3c8bd36..7ef68b433 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -14,6 +14,8 @@
>   
>   #include <limits.h>
>   #include <dirent.h>
> +#include <libudev.h>
> +#include <poll.h>
>   
>   #include "igt.h"
>   #include "igt_device.h"
> @@ -28,6 +30,24 @@
>   #include "xe/xe_query.h"
>   #include "xe/xe_spin.h"
>   
> +static char pci_slot[NAME_MAX];
> +
> +static void cold_reset_restore(int sig)
> +{
> +	char path[PATH_MAX];
> +	int dir;
> +
> +	snprintf(path, sizeof(path), "/sys/kernel/debug/dri/%s", pci_slot);
> +	dir = open(path, O_RDONLY);
> +	if (dir >= 0) {
> +		igt_sysfs_write(dir, "wedge_cold_reset/probability", "0", 1);
> +		igt_sysfs_write(dir, "wedge_cold_reset/times", "1", 1);
> +		close(dir);
> +	}
> +
> +	igt_kmod_rebind("xe", pci_slot);
> +}
> +
>   static void ignore_wedged_in_dmesg(void)
>   {
>   	/*
> @@ -51,7 +71,13 @@ static void ignore_wedged_in_dmesg(void)
>   				    "|EngineInstance: [0-9]+"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
> -				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
> +				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+"
> +				    "|cold-reset wedge injected"
> +				    "|GT[0-9]+: GuC CT communication channel stopped"
> +				    "|device wedged, needs recovery"
> +				    "|IOCTLs and executions are now blocked"
> +				    "|SIGID=[0-9]+ .*GT: reset failed"
> +				    "|SIGID=102");
>   }
>   
>   static void force_wedged(int fd)
> @@ -63,6 +89,60 @@ static void force_wedged(int fd)
>   	sleep(1);
>   }
>   
> +static void wait_for_wedged_uevent(struct udev_monitor *mon)
> +{
> +	struct udev_device *dev;
> +	const char *prop_val;
> +	const char *dev_path;
> +	struct pollfd poll_fd = {
> +		.fd = udev_monitor_get_fd(mon),
> +		.events = POLLIN
> +	};
> +	bool event_received = false;
> +	int timeout_secs = 30;
> +
> +	igt_until_timeout(timeout_secs) {
> +		if (poll(&poll_fd, 1, 1000) <= 0)
> +			continue;
> +
> +		dev = udev_monitor_receive_device(mon);
> +		if (!dev)
> +			continue;
> +
> +		prop_val = udev_device_get_property_value(dev, "WEDGED");
> +		dev_path = udev_device_get_property_value(dev, "DEVPATH");
> +
> +		if (prop_val && !strcmp(prop_val, "cold-reset")) {
> +			event_received = true;
> +			igt_assert_f(dev_path && strstr(dev_path, pci_slot),
> +				     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +				     pci_slot, dev_path);
> +			udev_device_unref(dev);
> +			break;
> +		}
> +
> +		udev_device_unref(dev);
> +	}
> +
> +	igt_cleanup_uevents(mon);
> +
> +	igt_assert_f(event_received,
> +		     "Timeout waiting for cold-reset-wedged event after %d seconds",
> +		     timeout_secs);
> +}
> +
> +static void test_spinner_after_recovery(int fd)
> +{
> +	uint64_t ahnd;
> +	igt_spin_t *spin;
> +
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd);
> +
> +	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
> +}
> +
>   static int simple_ioctl(int fd)
>   {
>   	int ret;
> @@ -225,11 +305,14 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>    * SUBTEST: basic-wedged-read
>    * Description: Read wedged_mode debugfs
>    */
> +/**
> + * SUBTEST: cold-reset-wedged
> + * Description: Inject a cold reset wedge and validate cold-reset uevent
> + */
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
>   	int fd;
> -	char pci_slot[NAME_MAX];
>   
>   	igt_fixture() {
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -326,12 +409,38 @@ int igt_main()
>   		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
>   	}
>   
> +	igt_subtest_f("cold-reset-wedged") {
> +		struct udev_monitor *mon;
> +
> +		igt_require(igt_debugfs_exists(fd, "wedge_cold_reset/probability",
> +					       O_RDWR));
> +		igt_install_exit_handler(cold_reset_restore);
> +
> +		igt_debugfs_write(fd, "wedge_cold_reset/probability", "100");
> +		igt_debugfs_write(fd, "wedge_cold_reset/times", "1");
> +
> +		ignore_wedged_in_dmesg();
> +		mon = igt_watch_uevents();
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		wait_for_wedged_uevent(mon);
> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +		test_spinner_after_recovery(fd);
> +	}
> +
>   	igt_fixture() {
>   		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>   			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
>   			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
>   		}
>   
> +		if (igt_debugfs_exists(fd, "wedge_cold_reset/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "wedge_cold_reset/probability", "0");
> +			igt_debugfs_write(fd, "wedge_cold_reset/times", "1");
> +		}
> +
>   		/* Tests might have failed, force a rebind before exiting */
>   		drm_close_driver(fd);
>   		igt_kmod_rebind("xe", pci_slot);
