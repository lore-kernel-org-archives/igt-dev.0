Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A67CC4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 07:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AAF10E033;
	Tue, 21 Jul 2026 07:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPGVisCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32E110E2E2
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 07:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784617367; x=1816153367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=14/NFCpdustIUlRluM5rn725KPw1s5S1dTjs8klu6qE=;
 b=KPGVisCFx+DDv9qi7FZbR8wJbeIKZAaN7NqmiPJEJwhfbLv5ykXVD3Ya
 2KCmizJPLgRQOEC/sjv/D9c/5Gguo323C5A8IPmLn3L9f8w4kEyCMsRvJ
 arajko5jzcOyP6MrwwbHXLicuNmDVL8kddYFW8Xzdr29hr9x4q4j9sG70
 wxSqf45QxC+cXC5YXdZ5dubiSp9bK0b2KCJR2fkpFP+BwRV+RWxPH8maD
 r/6W+ZfJz1+fBJ/NKazzjAuOjB4TFF/21wxYFKPYoki2yP67EZbN3Ryx5
 JVaY8elskJN+gyKTeBrPy7GWyv0F61N2w/nOkxD4BORKPkgVAbHEnRbs+ g==;
X-CSE-ConnectionGUID: vW1LU50XRe2NZYGvXHq1Gg==
X-CSE-MsgGUID: JEAHF/n5RFOP9yn9cwIAfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96717388"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="96717388"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:02:45 -0700
X-CSE-ConnectionGUID: 0aee43KRSjC1Vh5u9WB97A==
X-CSE-MsgGUID: jMhOcEnNQyeObIrn0HNP8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="258320578"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:02:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:02:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 00:02:28 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:01:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hn0O4uvFbc5tq711MMlTvkLzDtH0oMBbdlGQDhPyluQTGjIp8R3q/jezYF/fOitF62TDa4xru7CPIge3r7lwU/1ll5bzfZXgwO4iQCjos4o4jLhgcSy+Yrjt3Qtmwlzr/gr6h4agE4pPy77yAY9qVuA6as/uC7ikxj6P3GlHvF1lWyHBCnxhJPMCQJHJO0eFmmO0e89NeMLuKNn7YHwFwqHzxtvxsU95SXCuYWUgaLf82mcO1FARcv1usqkqbDZxk4y/I2amcGXuUgl/oUGMQ1BnSwN7g7qawx43JWCM2wsZuCrGcYZ+klKgD+hykImWj25fu80wPNgvVPffLIfd+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvRTCLH7j5t+HNoIUFlwgYLoA8DSeFtPVetbHhlunkg=;
 b=I7peVXGfEwFtkl0PUv/wBVvZTHrD03dQL3dUOzOJdpm9Pl4rcGOK92BfOJXP+LADI9/ABBdxKDnFvmOhimsNRWCJwWNQ0HU0Qqfr5jdOqNJdpWqndQ/TlLC5c4+hHb//3Q614bZA2YN1UKvyzX3JFGcAHdA1ws48dmp3LAy0DxIput1djouwlsnvB6jTMgw9Rk88lrkGanDBhuY5nGLbtNi1/G/kTk7GLJj/znZQ6D/XUUPpJ/qIHSt7IrHvjImmtkKSrr6WWxu4aGvbPmsF9QelHdsAAEOLmaj+fv2e14HgOfrgIT0bWw7cJK4VAxgmlUysUjnWwfyUCw5/X/RHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:01:15 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 07:01:15 +0000
Date: Tue, 21 Jul 2026 07:01:05 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 26/31] tools/intel_panel_fitter: link with
 minimal sub-libraries
Message-ID: <xfvjvnuvdb4hqi3gduqoy3oq75tp6gjpzkjh7vf4uzqytltjiz@poogergbubu6>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <539a1e388900fe94b6399bdd713f1cdbb6a81ec4.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <539a1e388900fe94b6399bdd713f1cdbb6a81ec4.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA1PR11MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: a2513607-96b7-4cf5-f1d5-08dee6f5db3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: boiChc2nYaCSc2kse/hYSsi4XnbOr9k+aWwqYbgbQJ7inZXGKv63lTWfozLw3LagW+GL5n8aS2I58tym1w8rPfXcAN333l90JWzT9O79pX6F4dPpCiDgOBc5Ax2oTMJkzCFvZ+btwHPnV3b63wq+2TGXRdQJ8Bqosv9yxGzBvn3eLRfdBkwHQRIPGOp7bwFM4ByG9P/JLXvUr56O/zwbv1/VCWPXC5Gxkw+ByymQ76qFtlEWU4ohBC1aeOWw5eb7jAcxmGQe9XQFMRmq21Ji6VT7mkfX4e9/IAD8iK3TU3Y/2IaJrRTQJXvwMZ2lhN2XReutvFfNy0ec3lEU5nsRReLFhPr4kHOAK/oVSini12RM6eEfGtaM+bAz7GGTzl70/KSq9QCMRJxFaGY5weEROPe0+4Oc7OI6v9/YRQCTAU7+uR4rM+qHleFRd+Y77KB7//GGSOsBtk9mb+0onGlw52PzThrHL2qQJ26EjifwO7WxaPryzdCqTuKjcEMs+q7J4ucJy8aGjbe3FR+sB5y8bJDLzA3/9ne8+utEsZoiGUsnTK9KB5ZW2GF3m2K7do01FuaEJwfzLjo5qZfwW4zkXNqt7XQ8vxfgv5IFAuxcFhdo2RhI22z03R5jc4nAhNhtlCDLu1VZYF+8TnNhSo9dYiRYkL0auj+kAHxULS+/ITA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dStST2tCL0ZyU3R6TGxPWllWRWRxSHlnbzhabmY5MEFLcCtlWmxNUk1hZ3Vu?=
 =?utf-8?B?b1J3QkFMa1ZFemZSZHpjeWpmZzM2T3VtNisrZElMZlo5Z0luRThjRytwVCtu?=
 =?utf-8?B?MUJFMGlGOFRUQjlhTkdvdDBHSzRVSytFS2VhZkFXeTlLekw1dWloVmNFS1h0?=
 =?utf-8?B?bGNyNkkxbzlyOE5wcjZ5WHZUSFZseVIvSWNUd051Y3R1NkVSWmxqRCt0dEtT?=
 =?utf-8?B?UnpCYURoQWxlVTJnYWxBZFJrSmlTWTNCQk1UZEc0bjkzSFdWMUplQlBzdWRa?=
 =?utf-8?B?VnY5dnlldVR6aDdkWDVmSURDK1MrVGJ2S01hbGRpUG1xU2FTelBoaHAwWjdL?=
 =?utf-8?B?WGdSN3IvaWdidFFPdUhUMWZKQXhyeHhCRDBpTzhZTWNkRWpSZVhYbFhXL0Qw?=
 =?utf-8?B?WEsvcmVPRTlQODJTTUN2cUFTV1h5Y3huRFJkSEpGYlJMcm5wUkRUSUs4cGpX?=
 =?utf-8?B?bGdMU3oxQ1lnajBVUzdoYmhVellNWDRMQnRHR1dwWmh1WWM5MG1KSHorWlFh?=
 =?utf-8?B?Um1CckFUYkxKVEhuUUR0WUdRT2ppUFRHLy9UYlhDNmJwVGk2eWpUY2Q2MUdv?=
 =?utf-8?B?c3lWV2xHVUUxUVRaQXBJbTFWVUtYNXJCUGltMktXR2pIb2RRMU9yRVl3ckV0?=
 =?utf-8?B?RW8yRWNJN1BQWmxRWDZtQkdTSWd0dWJiQVNGK3BDcEJFVHdDc3pVc1o2Z0hI?=
 =?utf-8?B?TGJTUzlnR1pxM0FlODgzREZSTk5YOHdxbnFEUjJ4T2wxZTZ1czN5TkZkcjI3?=
 =?utf-8?B?cG52N2FjZUdjNmxLenJGd1VON3I4ekd1djVVRUtsdUxGcUJQK2g5SHlnMlNT?=
 =?utf-8?B?TE53MU1oQ2l3NUZOdDNaSGZPbCt4NFFFTUxPajlnOWdyaHNTeXBzdFJBSzFx?=
 =?utf-8?B?N2JMMHkvVlBUbGxtOFVmazdJTFhRcTNsVkF1SG9CenlvYnNQc0psQ3dtZm9k?=
 =?utf-8?B?UUVmbThoTnRMMVdRWjJuS0ltS1J5aTNZRUkyT1BqdUtNRjJEYjBRNjYzSitv?=
 =?utf-8?B?dUhuWU54UFYvUFR3RFpiM05mZVdxamluR2xnVTZzR1p3V2dYMzdZdmw1WXhh?=
 =?utf-8?B?aDlBbTNMdUJpSks0dEphU282R3ZNdkNWMkxDeTZ2ZEd2dUsvK1RFeml3OEMz?=
 =?utf-8?B?am9uU3N5MkNJNmtJQkdhYmlLY2VFRThYdm52Q1gyaVg4SDRodWF4UkZ4SGla?=
 =?utf-8?B?TFQ2b1RhZXliYUVLRzFSc2tvaHBwQ0tyRWJhR2FCaE1acWtrSXBkS1Yzd3Zw?=
 =?utf-8?B?c3E3VkordGcvWVRReldTeDErVDNjZjFtckZlTTZDemlzYnZTRFcvWDA5QlNW?=
 =?utf-8?B?K29aRVFrVS8xdjlJNE03TzNBMll0c2NhSmZRSU0weUkvSDNIODFzV0EyS25y?=
 =?utf-8?B?SWs3WTh2RGVrUUtDN1Y2T1dxdm91UklJSFUzcGNFMHFYVmJJOVVCUXNDMkxR?=
 =?utf-8?B?YWpISUx5NWc2cGlVS0VqRS85NmdHT05vWmFFVmhLcnVUS1JBM1NsWmwvNjB3?=
 =?utf-8?B?S0ZFQkZUTVlhZWZvL0tJRDZwR2NuNDlLQzhUSXlJbzRTOEtiNkFSRHZZdGdK?=
 =?utf-8?B?MHh1Uk5JNzdPUUd2OUJCSG9MalpXN1ZIdytZdExOaGVVUmJuQVFOK2hFSTJh?=
 =?utf-8?B?ZWVjZERKemVRY1pWM05qWWp1QzBaUVJaQThGVmRmdGF5aE1naUhaZHlxQklp?=
 =?utf-8?B?cmlQRSs1c0E0M1dvZWxXa1ZOSnlpcVBSZVhPbUp5N1VQSnQvZ0p4c2dheDVh?=
 =?utf-8?B?aGFadS9abTVORGNGS1BxNHZEUFdTN1J5R2gxS0duSFAwcTF4TlIrYldENC9B?=
 =?utf-8?B?dE96NzBjMEx3Z0Z0emdpRXVXS2dsQmxYU2hCZzFZWWpjN2o0amNCbks2eUNZ?=
 =?utf-8?B?Smx1L1dUY09WMW5iL3VZWDVTUlFXcU9aOVN6TE9SWlBIVkVudThWSitMVEhj?=
 =?utf-8?B?ZGMwMkxIT0ZkRmtqbHh0aTR0WnowR3FNTnVBZWNEVXNGR0RKQ2lHeGcwOW1w?=
 =?utf-8?B?WXhqaEozb2RLZ0V3QTIyb0J2d0VoUlZoWVF0NGV2NXhhcFJwVUJKdFcxck5w?=
 =?utf-8?B?dGhpdjc1bWxZcU80aG02aGkzQ0syMDZndmIvenhwLzh4VjdFaklSOXFqOTJJ?=
 =?utf-8?B?Qi81dm1WaENpcVlLbXZZdmh2MTEwQzRFRGMxSkIzM1FTSTFpcTVDN3lHOE0z?=
 =?utf-8?B?U1l0YWRLZEV0cHVqVmJtTThBNHI3NHp0OVNQeDZxV0kzNGtVQ0FYaUF4UXlK?=
 =?utf-8?B?b2lJRi9xKzVwVFNsWS9pdFhBNWlCYitKN2tYVmpKdTlJcG5UN2NhTHRIbnEv?=
 =?utf-8?B?Vk1UbERJMFRBZG1LaHJvYndIQnBSdjlxdzlwVW4vTVB5N1g0MDBEbzhJeEJE?=
 =?utf-8?Q?37Y91n/qUl5LYdB4=3D?=
X-Exchange-RoutingPolicyChecked: Tyjn4k6gAU+0tpO7lOcoYgHzLTd0hiK1cBDrKEtlAlGolhmjoGlsA9azLF6pm5Igs58ZorzAJOzED2c31yqYS50QsJzCuMW4F4FJLYXgYuUcpV6NVoGrpPzabw3QyiXWgTBOOCajpup6SL8SYckRGplfWvQZWaxQF1V0XdKgWwub7awzJODVkfBRFFn7xYdAbZ/3E8fMs4j+eqEBoM76uaA8oJIvwkBU/UG4XXA2Co6/dlDOQ9tkh1XkHtC5vvP/Eq4VuuuQ5cP8P3ZW/NhG1FEVaDegFI7XcyMTGBUpc1Yoloy53f2yo8nCSNnpqao29aVizm+9su17McHpzBELsQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2513607-96b7-4cf5-f1d5-08dee6f5db3e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:01:15.5833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yePqK+Ma6ONhD3N21p24eYilnujVwJuqowSWbPS4V4QtSOgUEcss2zjhs0LGiN0LvSBCPAaCBYfOSK1gqBvSnZPIbSU4PYbt+3cKtKssLO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

Hi Sebastian,

On 2026-07-15 at 14:15:36 +0200, Sebastian Brzezinka wrote:
> intel_panel_fitter only needs the register/MMIO helper subset, not the
> full libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index a31b6d0ed..1a4e14ed3 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -21,7 +21,6 @@ tools_progs = [
>  	'intel_framebuffer_dump',
>  	'intel_hdcp',
>  	'intel_opregion_decode',
> -	'intel_panel_fitter',
>  	'intel_perf_counters',
>  	'intel_pm_rpm',
>  	'intel_reg_checker',
> @@ -120,6 +119,11 @@ executable('intel_infoframes', 'intel_infoframes.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_panel_fitter', 'intel_panel_fitter.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
