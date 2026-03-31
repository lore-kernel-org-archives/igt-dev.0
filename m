Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2258110F9303
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 21:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52CF10E034;
	Tue, 31 Mar 2026 21:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ct1P/r+/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A5D10E034
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 21:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774992021; x=1806528021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cI+SzETuMJBHZ/h+ZxsT+YDZRqsSZaX57obpIzJu7lw=;
 b=Ct1P/r+/mi2QfIg8sRj93mn3jEidrZWJAK5QVluwegDwd9gAeU4uhciH
 +/sxg5l+HWV2E6wAG9t6u/17+yQVTtoaEK7k9Th44Rg/+fbZHcpH8vl8k
 DOgPK+khxFTl8Sr0hzb83BMcfJU9hqQQkHkHfGU4nhHXSGzJp+Rv0VhUv
 WQmmVlU4eS7G2WJRyH+lfASyciAFRNfnu+lQOHJgfx2Yj0cIySHNu3FAH
 t1kWh9T1QlM11PDkZL4bq9NPsZbL4AmCfQ6eJqpeWG49eEsDA9raPfC8M
 Z1ce3LR9aDHObyT2z9IdEJk0uZdNytAV49/ixidWr+tMaGvUIEZ+59W4w w==;
X-CSE-ConnectionGUID: //FVBiSfTvGkumCWFQIVIw==
X-CSE-MsgGUID: PiNoYie4QdWWGrpQ5x1rNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75905350"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75905350"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 14:20:20 -0700
X-CSE-ConnectionGUID: 3HfwT7j2SVmaZBPaLFNuTA==
X-CSE-MsgGUID: 95xuWv6LQ6+MAQ8ygwacng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="223603268"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 14:20:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 14:20:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 14:20:18 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 14:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVALoAt57nOzs7CR6JJCByzEivOXx+ebiig6Ao4S4DoWwZHMOsT6qmxpJnOmHWyAsJLjPRkRFTwvqbw9Yqt1unq/Cge7mP28Xbd7JZRdR9JCYNA5sI7ueoplhQImP41IpaPYsBA3VuavOqEheT5giRssmxpltzdKz8ITxGF2tnyNQ6SpKFl1FefbX0pz6kS1DXoceniBvMUrgrQog1JMJ6iRpkdOL1wWdwaIoz3mUqIiDqYCvrVA3ikNA2OWzaULsGR7qI+HMDHabQA48lwrDrqzqW0q1/cYjWw2UqUkz5cpX01HkkAXahPHCFCWvWOGXljMHUuT8PconT54z5yt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyW8URzkN84SnB//yofShi2kWmkkPvG8Eb+m07Ta9Lw=;
 b=lUyMIjgSn6rR0nHzm/Tt0r5VEFCVhiZikgv4F82hMSDRijh80Zv4vIcr5lPwkzB0SaQFxvFawCninKxN++S0morZsDd36lxx/pGvMblwLiHusBR58tufYktKlqCK9df83sOKS3SalP0Gqt16e34ZbmOeHNevFBHK5ZNQnEYiLxaw7j2fauNRqbsUFPEWMKNgI7U5Rx79glAYBi1Db/Fm/In9xnaMAN5QY3hmzznAC9hEvy+flh8+5+/QQNX1axxGZF618ouzTT5sG6f7ZQG/4bDfIwzrkw/p4isqN4BwhXLAf6E2xlP2GoeGXmYBCvKMPWJ7tnFytFImpTns8rt6Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH8PR11MB6829.namprd11.prod.outlook.com (2603:10b6:510:22f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 21:20:15 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.015; Tue, 31 Mar 2026
 21:20:15 +0000
Message-ID: <c33f51c3-9dd1-429b-b1d9-d487ffebda95@intel.com>
Date: Tue, 31 Mar 2026 14:20:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 4/4] tests/xe_pat: Verify PAT entries contain
 expected values
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260331140541.2561104-6-zbigniew.kempczynski@intel.com>
 <20260331140541.2561104-10-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260331140541.2561104-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::32) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH8PR11MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 616c4779-f72e-4a8c-93b8-08de8f6b4d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: JXNcPVHvR92rhp1WyRT1SX6haWYEqbHpFuU7VTuL0NFare/WOYaizdR8AzhPqhrs1ppkX50C2+WET5xJtaelaMu8NaCIkkIVRnAP0phN1BuBJ5Elttp5IpmJxUQrR0cZ0RCQhLqQDZ8Qzi4fQRC3kRK9Oqt54Av+ZJHGWbTPSwG0bCuiz1r99IsIbB92LVqhMPaQV7LHpsFZRnQKWNtDuZqIZjxUTsg2M21/2dHxaTFOOLeK7irWnHNFyml5dBaZ66Zexl+sdcZnmdYc7g/haCGLjlvmwHX5jB8tX2c6ziuJ4pbDEQCJ5C24SLRW9ugi5ApO7n6cSt63Bvb6w8n0jUtOVst4BB+0u5icrtxW/AqW2lsUBwpF/iY/fIGNbhr0ScXVbsmexKloID6LNXPiOMmzWdzHw3Hu6B9vLEEdL9YA91LyqhkYwAhxisM0RdZedf1DOic0O+gF1P35ni5gVy1/5/UT80yEzpb+ea+ETC1EbvhBXrEUTQSPCAGgmp5ui9/XHirIaHMhTeG+scD1ChuQixdSYvtoiqvxrEAywHr7lQf/eqeTme5Co1BmBe8g1peEx2L8uH7sxFmRRDbo41N96k3jkoJ2LFAExrpuormHEiSikrA8tIGqc0MgOdmZd4jyU63hipyugq+z7SxOYbkh+xCRIigtQZIexMVwOgbBoc2darUoPpYjTkq9r6CpnZni6kizufPDVCou5LvQEV+OcGkfUWE9Tu5wrBxMwf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkxycFh4MXN1M0pTUTlaZng0RE9UWTdlWW5rb0U4c1FOZ0FBRmZrQ3hYMzRq?=
 =?utf-8?B?V0NaVStoN0t4eXFSTmhuY0xIU2RvakRIODFUejlSR2xLSDBicU5aZmYxU050?=
 =?utf-8?B?d1hVM21PZktDOEowR3hBR0UveHoyaDBCdlZXR0VhWTM1RUd2Vm1OelM5WEIx?=
 =?utf-8?B?Wk5PU3VjR2xVQXZDYzR5ZDM0SWZYcCtKNnY4cDdMU0d0SE5wVWxLaFBsZElP?=
 =?utf-8?B?V0FHaVdlQ0IvR2pQNXlxWm9scW9sbG1iSzdDV2l3Ujh5ajZlS1FRN1Y3RE5n?=
 =?utf-8?B?WENaK1dOV0xzN2VTK3ZUc2M1TnAvY3UzNDJRdWVxS2MyUm1PSURwajM2c0hh?=
 =?utf-8?B?RnBtbWEzakUyc29aZDBNTnA3V1dobHhtZVFybk93WElseU9OVyt5amdSTGZI?=
 =?utf-8?B?Wkpta2lpYnM2QnRRT3RvaTV2Q0F0engzVXhvZTE2amNKdC9JMWdpd2tWWHpl?=
 =?utf-8?B?RDdySm44VnpObi83RmhoTms1dzJHNm85dzlOLzZkaVVYTUtGdmdxdW9WVFRv?=
 =?utf-8?B?Rk02RGtUMjBoQnhJcWtRb25oVC9RQU5yY3VWOXZ1R2pRSDlzcXlnaXJOOUt4?=
 =?utf-8?B?TlpkRHZaanppQWpBSVFIWUNPN012SFFCUGxoNGZqbndBM2xBckxZQjduRWMz?=
 =?utf-8?B?b3ZXenFZbjd1TGkxVHR1NDRlU1crM3dlc0lPeWp4djBWMm5EWnZkWmdjR082?=
 =?utf-8?B?a2xtbDBrd3lhNktCbDFSakVqemMySEpJeFE4YWZYWFdnaG9kRFYvT0JQMjM1?=
 =?utf-8?B?ZDhDRjBKUFhXVEJDaTcweUJQZGU4TGkzVm5rQ3REMWVEcHNYai83NUJNUExm?=
 =?utf-8?B?QmovR2ZULzkwem1nWHRqa0tCUmd1WUIrMDl6bXd2RVFuM3RmeWpvMkZTQW5m?=
 =?utf-8?B?cGZteTV4VSsvSEFHL0gwMzVwMHNHUWl6aWJRRm1jQ1AzRGVmb1ZiUFFWNU5t?=
 =?utf-8?B?YlM1YkhyU05LVzJqa0U0MVdFQ1ZNUTBVU29DSFR2YWFITGFBcmxHSWRPZnQr?=
 =?utf-8?B?eUttUzN4Q3lRVnlQaVp0c3VVZy9UNXBCVm9iNEd1aGVJbG13UDRBV3pYRW5Y?=
 =?utf-8?B?QkdTOW5lWm9qWTU0Y0hxcTlGSTV1Y0ZOT0kzVEt0Z3pOQzhVODZ1RDBpVHJ0?=
 =?utf-8?B?cUR5VWh1QTN4dURsNWFEOHkvSDBZTWZvZ1AwSVN4a3l2N1VkQkdhSi9XU2RO?=
 =?utf-8?B?TWR5OUllMk9BUElOUkJHUWhRcnV6RVNvQjRYdUpyNkxlczdDclZTNGFSMmJQ?=
 =?utf-8?B?UzZLNWMwY2JVY08vdy8zeFlCTEZ4YktUTlhGQno1TDN1U0lXL3UrbVQ0NXFs?=
 =?utf-8?B?eHZMc3ozNFZWRHNVVi9Pek00cE9wWHRJUkF6V3l6U0lCMjBXNzZrbEt2Qkl6?=
 =?utf-8?B?bldoZ2lBbGwvRjJqc1FZMEdzOXF1NWMrTEQ5QUZ1ZEoxTk5uL2lxYUlxek9s?=
 =?utf-8?B?cHQyVXE4SHphSnhsckVuczhpQ0lqMy9KYUl2RnpvUHRMZzRFLzR2Qzc0T0lK?=
 =?utf-8?B?NmRwOXRreU0rWmZPWjU5L05mWTBlYmI5TGpCR0x4QXZPVmtGN0Zwbk1GTExi?=
 =?utf-8?B?c1FscllmZGZ2TWVmL082eithMnYzck13NDVNdDdpQm55QmJsaUJFdmZoZmdh?=
 =?utf-8?B?Yk5sZmlBN1lvaFF0T29WaHpFRStQQ2NoSncwSnp5M216UC9IRzMrNlZIczlN?=
 =?utf-8?B?TFE2cVhLSXVvendlYUxtaXdZSkxsZmxSNmgzVW1qK3BHU0lzaE1Rd3NKM0Fr?=
 =?utf-8?B?RVlhaFJWYmZZQm9WRnB4L091ZVBtNEJneEVSZkZLVmVncEg2N2kwWXVZOGNE?=
 =?utf-8?B?M013ODZjcDhvWVlRV1QxdmFNb3pqaHRVeVhnQlpkMkJmWCt6SWxqcW1PVHBK?=
 =?utf-8?B?a2VWTTVSNUtRM0IvZWVIQUpKU0ZXLzEvTGNNTEdjUk02aWYvcWdWK3A5QUcv?=
 =?utf-8?B?U2F3NmZLYVV5NHpvZDJzdWtnMEFZY2UrU0pKdmhFYjNIK2tlTlR5RW9MNG1a?=
 =?utf-8?B?QzROVjRhZEx3aW5iZ2dyaGNaS1JCK0p3QVN5NWYyVW1lbkM2K05jZHRYRklx?=
 =?utf-8?B?b3NrcGZqOSsrR285U2VJNWh4UFVqN3VucTlTbGsweHJZNWhiMCtkUTQ1aGp1?=
 =?utf-8?B?WEovMmxJREdHNTBsUTJPVnlKV2J3Vm5GS09RRjZHN2xhaXd6QmJmYXlidSs4?=
 =?utf-8?B?YW8yc3RqRDRCYStpQUp3UkVnSWRvTm90cUkvdTdBZkRUNndTaDlhZFdDaDJm?=
 =?utf-8?B?ZGo2SldOaEQwYnYySUFBQ0R3cnYxMjlzakR1Y1JsNEhIdDUzUHJpc1BDZEpK?=
 =?utf-8?Q?18AUNSla9WhpiMPy1U?=
X-Exchange-RoutingPolicyChecked: Q5rErpP+ON2Z4gglkpOK/NlsTOYX0zuWkd9xCGRF6SS4ocrUt3oBXgVCxBARmtoOS9hWk7rZouibxgojGx9tbRCTi6EDJgO4y8edAT5PmC1fWgWcPScpZIVkRSyLR8gq3ldIkHaG3F0M1iI825IzOfki9UsalCwuygC863KNyZtxIjv8Dn2Z2YW6vOI2IUBlL331wWtj4sWVaVzVarrXXt/7xrKZt5AqFPrcAxGL+n71leVTKlNZiULWIMiwhBktXID2/9+VgpObVna6g1JsxYtLltxu/HiMOXXSDt6Jb6D84nP30OKf9SmVVXIIJDbAjGApvmfIdM8b/jWHXdd9EQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 616c4779-f72e-4a8c-93b8-08de8f6b4d51
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 21:20:15.6071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BliyuBsBC5VB6itFRjuaZNHHwAw16RBsG8tNx61K8fQJ3v3f+gLnJx1Xpw/wQl+RWU/tjDU4kZmdfBlMbRJKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6829
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


On 3/31/2026 07:05, Zbigniew Kempczyński wrote:
> Debugfs exposes PAT entries for different GTs so verify they
> contain expected values. Verify they are correct also in reset
> and suspend scenarios.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
> v4: Test is rewritten to support PAT + PTA + ATS entries.
> ---
>   tests/intel/xe_pat.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
>
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 2e2d7e01e7..4fbe2714ad 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -238,6 +238,76 @@ static void pat_sanity(int fd)
>   	}
>   }
>   
> +enum pat_test_opts {
> +	PAT_CHECK = 1,
> +	PAT_RESET_GT = 2,
> +	PAT_SUSPEND = 3,
> +};
> +
> +/**
> + * SUBTEST: pat-sw-hw-compare
> + * Description: verify debugfs 'pat' reflects 'pat_sw_config'
> + *
> + * SUBTEST: pat-sw-hw-reset-compare
> + * Description: verify debugfs 'pat' reflects 'pat_sw_config' after gt reset
> + *
> + * SUBTEST: pat-sw-hw-suspend
> + * Description: verify debugfs 'pat' reflects 'pat_sw_config' after suspend
> + */
> +static void pat_sw_hw_compare(int fd, enum pat_test_opts opts)
> +{
> +	bool matches = true;
> +	int gt;
> +
> +	xe_for_each_gt(fd, gt) {
> +		struct intel_pat_cache pat_hw_config = {};
> +		struct intel_pat_cache pat_sw_config = {};
> +		int hw_entries, sw_entries;
> +
> +		if (opts == PAT_RESET_GT)
> +			xe_force_gt_reset_sync(fd, gt);
> +		else if (opts == PAT_SUSPEND)
> +			igt_system_suspend_autoresume(SUSPEND_STATE_STANDBY, SUSPEND_TEST_NONE);
> +
> +		hw_entries = xe_get_pat_hw_config(fd, &pat_hw_config, gt);
> +		sw_entries = xe_get_pat_sw_config(fd, &pat_sw_config, gt);
> +		igt_assert_eq(hw_entries, sw_entries);
> +
I think there might be two issues with this block:
1. False success on read failure: if an incorrect KMD is used or the
debugfs file fails to read, both hw_entries and sw_entries may return
-1. In that case, igt_assert_eq(hw_entries, sw_entries) would still
pass, silently masking the underlying failure.
2. SRIOV compatibility: when running under SRIOV, hw_entries = -1
since the HW PAT table may not be readable, causing the test to fail
unnecessarily.
Would it make sense to use igt_skip_on_f() when hw_entries returns -1?
That way the test is skipped rather than silently passing or failing
with a potentially misleading result.

Xin
> +		igt_debug("[GT%d] hw_entries: %d, sw_entries: %d\n", gt, hw_entries, sw_entries);
> +
> +		for (int i = 0; i < hw_entries; i++) {
> +			uint32_t hw_pat, sw_pat;
> +
> +			hw_pat = pat_hw_config.entries[i].pat;
> +			sw_pat = pat_sw_config.entries[i].pat;
> +			if (hw_pat != sw_pat) {
> +				igt_debug("[GT%d] Mismatch of pat register vs sw config "
> +					  "- index: %i, entries: %08x <> %08x\n",
> +					  gt, i, hw_pat, sw_pat);
> +				matches = false;
> +			}
> +		}
> +
> +		/* Check PTA if was explicitly programmed */
> +		if (pat_sw_config.pta_mode != UINT32_MAX &&
> +			pat_hw_config.pta_mode != pat_sw_config.pta_mode) {
> +			igt_debug("[GT%d] Mismatch of PTA_MODE - pta: %x, pta expected: %x\n",
> +				  gt, pat_hw_config.pta_mode, pat_sw_config.pta_mode);
> +			matches = false;
> +		}
> +
> +		/* Check ATS if was explicitly programmed */
> +		if (pat_sw_config.pat_ats != UINT32_MAX &&
> +			pat_hw_config.pat_ats != pat_sw_config.pat_ats) {
> +			igt_debug("[GT%d] Mismatch of PAT_ATS - ats: %x, ats expected: %x\n",
> +				  gt, pat_hw_config.pat_ats, pat_sw_config.pat_ats);
> +			matches = false;
> +		}
> +	}
> +
> +	igt_assert_eq(matches, true);
> +}
> +
>   /**
>    * SUBTEST: pat-index-all
>    * Test category: functionality test
> @@ -2152,6 +2222,15 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   	igt_subtest("pat-sanity")
>   		pat_sanity(fd);
>   
> +	igt_subtest("pat-sw-hw-compare")
> +		pat_sw_hw_compare(fd, 0);
> +
> +	igt_subtest("pat-sw-hw-reset-compare")
> +		pat_sw_hw_compare(fd, PAT_RESET_GT);
> +
> +	igt_subtest("pat-sw-hw-suspend")
> +		pat_sw_hw_compare(fd, PAT_SUSPEND);
> +
>   	igt_subtest("pat-index-all")
>   		pat_index_all(fd);
>   
