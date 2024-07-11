Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC2CC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 12:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293E810E2C7;
	Thu, 11 Jul 2024 12:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0N9UFV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9269110E2C7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720701990; x=1752237990;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=35XUYmBGqrnkIJyt2z56SwVG3X9iC7kGFU/8pzMDOok=;
 b=T0N9UFV0TZQe2nqaXlxyCglgYx5KR5F2havbNu66dt9b4afRK5FPciLY
 sD+zYLYHY/I8HUC1VS/PvM9mkbsFZmR+f2S+NE7fIvXLpm8Zi3ISHTwDN
 7G9QNQ6C892kvlHCMD0Zwkho8DdKcBZI8s0Taq0TbT2zUa2i4vEXGYMQW
 ysHBI241E/SFDGLglD2pxBtDvI3Ah6HllxPriTFrKI7A1oyT/KO8wbsQM
 kiuop3Yn5EgDTrGnDpzYgyZUlxRLzCB9EyMlcNwzgpW3VFkjnniOZmghR
 tj0FmL9stkqfsZFNJ9sU19iHd4VybCDsM5hvt1ZBgMfR3k5chgnpqY18+ A==;
X-CSE-ConnectionGUID: ajl7lXwqR6C4rke1wlh+gQ==
X-CSE-MsgGUID: Tb3JPcSbRF6gPP11ddKoeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29471327"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29471327"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 05:46:30 -0700
X-CSE-ConnectionGUID: EtWn8fVkRgmHL9utcyEZKQ==
X-CSE-MsgGUID: LUHl9zJsTHC4z9988yU6Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48444233"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 05:46:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 05:46:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 05:46:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 05:46:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gx3zu2xYNqCyjKKxzdAEmXWEpyUzf9EFi/4IysGf92GQ019PqxbmU9AZseTuJuVCak1b4QzUap8HWu5B0f0Cu87wx+V6u2KNgGks/t6NrN6T6Re+zRYYhLVb8WfJrA+kkpiVEx0guaTFaArvsFCv9vlqDrYVSk/e7mKHg3xUMfEcPg2FhNzi6uDRQrDTvQH0mqYIftZN14kX2raEOtZIpCuFRBnc2n/UoEiRWc7IMpIHoqXBwf2XbWi+jiCQwUEldoKwztNBp1tZ+q8bc+Vjv1ho4BnCHXvrGCwlOCJPn7Bbpg+eQahUz8IUmbIwnOOO6w4DySxbeBVqWAi+jiz7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx0wwUsb4Xujmg3mZ6ZkJ7PTS6+mxgx+otS+I+rtImU=;
 b=vpwxry24IayWte8aBpOipmerhQH7NL+3+k2+BICT4Us57zZncqN1/1Qu71RrKhaUJKt17pnG42UTuWzg223JZULKX468zwYq0z8UR7lOMqLruNcGfNF9y37XuZGOTPY/1t6Mg07KO4X6zajtVlacDcNa3IFyR5wrUy2OdW+qpnVx0QSaK3eMv9AxfNJyBMy6AtRXmx2ZSOnJ/HS+X9oW2TOSXur02bON6dwkuEF9/1wszjSYLwxzU36rR4Ur4ixgXmSun2GzK2n9Nrn5E4A1JiZtyXxua/95k9ibZvdTGnBpVuqsZSdDb2rmpKKhwPCR8x6nrGPJjl+PAZuh2PqeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8153.namprd11.prod.outlook.com (2603:10b6:610:163::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 12:46:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 12:46:25 +0000
Date: Thu, 11 Jul 2024 07:46:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t v2 04/10] tests/intel/xe_drm_fdinfo: Add helpers
 for spinning batches
Message-ID: <o73rxaucq4ul5cuyl4j3r6dynatc6rt7npip3npxna4ffeangn@nzr3um54pt5v>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703002532.3156277-5-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR04CA0274.namprd04.prod.outlook.com
 (2603:10b6:303:89::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9455b0-ee51-4609-34e0-08dca1a779c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTVmbDVPd3dEUXlPQ1MwbE1BMnhsWFFOR1dXd3hOOW5ZdmQweHdMaXB2c2lQ?=
 =?utf-8?B?RkpjNEZmREJxMGRNS3FORUZSM01mbHpOYnJKVTY5RjZmZVViOWtieTVPWERL?=
 =?utf-8?B?ZFBlb2FQWDI0SVpQcEVIZ0ZjK3JZNUtkdlJkdDhnTTFLVXBSOGt3MUJmSGlW?=
 =?utf-8?B?ak1odDBaL2FuUldFdUptbVAxZmlLTVBzTWhTMk1HLzkwbnptNVNvQWpLcTV3?=
 =?utf-8?B?RXpGdnpmdFdZaWZCS0FJYXlGYjlXYVpMR3NtTGxtNlFyNEdHWUJFbUM5U3Bs?=
 =?utf-8?B?c0dscVk1QW92ZThjRFVncnZyRDJMVkwxRXpabkFITVA1ZzRqUjVXcS9oMTRW?=
 =?utf-8?B?SEdZUlY4MFA1a3BpUHY3eUR4cm9rZHpvTW1oR0VOblY5bXM2OGdPbDNiNjRL?=
 =?utf-8?B?ek5wSFBYV2dQOEFPckE4R0FPamN0MGYvY3hMM1pHQTBscnFNTFVSeGhZWmNJ?=
 =?utf-8?B?VmpxVGVwVk5FcDV1b0trYUVIMU1rYTNNcVFiRXVkOEhTSVBPL0FGdUUvdFF0?=
 =?utf-8?B?ZjAzOGZOWktDdkdld05wcmZFb2NLTHlhb2EvZnl0OE5wVHZiQUE1MEhqdGdl?=
 =?utf-8?B?ZEZhSzJGTGZDZEtRWldSa01rVlE3ekppTW9hU2lwLzRzaUZjY1dDQ2dQdTh2?=
 =?utf-8?B?aU11LzkyUVNrVVRENUtYeEs3c1dSMjVTaVQ1UWc0MjFPb041akdKVFQxb280?=
 =?utf-8?B?QXVKWVEwMUVyVTA4VEk4UmtaNU1xb1lqVW0wSU9GM1UvejJTTmwyYTMyOGRQ?=
 =?utf-8?B?Ymg1WHFNQXJsQ0lJM2p6VU1vOUtxZ203Rk4vV0o0cUFBcGdFdlhnQ2IrdlVs?=
 =?utf-8?B?TUo0aFN5VjlzelpET1BsNG5xdkZuU3ZxYVJsclJvWVY2NURyaTcwM2pCOFox?=
 =?utf-8?B?Z2hvTHByKzFza1Ztajd4NmlFY0dkR2wxV1kvRHNjZjVJT2tiVlpaM0llbXpG?=
 =?utf-8?B?eU16MlRLeEVOU2RaRUFxTlVNaDJXdE9xV2pjc0YyVWJURDdhMUpqVWdSNFhC?=
 =?utf-8?B?UkR5TVV0anJSUWZVdHBHZklmajlYV3dqRjdqb0w0bUIvQjBkN3BZcDJldVhs?=
 =?utf-8?B?OWdrU1VFcFB5YmxmK0U0TmlQVGR0TGczeW5jL09UUU8xaWgvV3l4NlF6ckpz?=
 =?utf-8?B?NUpBTm5aNkY5Wko0WFg4bmFqZHVEcHhUR1hnbXc0a2RMcS9iMDNYVGlydmRk?=
 =?utf-8?B?Z3lRM2t1dllTUWl3MjdmRkpyQlBWZWViQlNlUy9xb2sxZUlkUGJJcWtXb2Z4?=
 =?utf-8?B?OVZTcHdsd0pTUE5ZWkFTMkdFeUJ0QnRSeUNMTXhEcGl6RlViakd0TVJLWkwx?=
 =?utf-8?B?dzZZZ0htc3NGaWFaKzUycGNoZzlWZ2pndVk1cHBseTFVdldVTHBsUWY1WFcr?=
 =?utf-8?B?d3R6cU5iVk5VbFNzQkMxaEFuQWxWRWwvUFQzVkFvYWhhaDRpZkgyVkJJSXRw?=
 =?utf-8?B?TFlKcUxyS3MvTzVjcnE4QXpiUkFVeWhheUlYNHFZWTBqNVlnZmRucGsxSU9l?=
 =?utf-8?B?V3EveTlTNDRpS2Q4VWxlUzlVbkpiOC8zMlNCSmNvSFY3UEVCQjM2WmhORnZF?=
 =?utf-8?B?Sml5SlNNS1dtcnEzd0w3WmxJNFJnY3dqZ1lGWXZ2aGtYUnQwc2NjYmdIR1Vt?=
 =?utf-8?B?OGNnNzNteHVBcEIwcUlIRFlnalJUWG1tKzliS0tyQUdndzdOMEhXcmFyR3ZM?=
 =?utf-8?B?SHJ1dGNIdlh2UjhOcXRXMWczNWF6d1EvTTYxZm5XZDZKMmc2dHJTd1d0YnZx?=
 =?utf-8?B?eWFOVzQ1YzhpcEFCUW54NFZ4ZVFUWGFUOEEzaVpra1dvcktoZnBldkVUa1Va?=
 =?utf-8?B?Z3NDSHZmWTBXVm12L3M0Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEVsV3FSOXpwZjBOd1Q0enpnNjJNTk5mU3p0SzNmcWVheW5nZVlZRzg3WUhZ?=
 =?utf-8?B?N3RWNWcvK1ZVa0VINTlicHF2QlV3bU12Qi9CcnV5ckxtR0RxZFNrNDNLZ1Rr?=
 =?utf-8?B?OXF2UEtZbUUyVGw5Z2o4T1ZKVEpWTisyUWxTaWlWc0hNWnlleGEyNUpHNHRS?=
 =?utf-8?B?L3pXL00wZmVzU0VFdktSKzJZNVRRbFhTcU1Gd09PNy9JM1RlZkVCdFYzd210?=
 =?utf-8?B?TEEvU1ZreWNvU2N6c0xYN3RoRElLbFROdm40alpidWZ6Zkc2VUVHV1J3VXZk?=
 =?utf-8?B?Ly95YXlIcHgvMWduY1I5cjhQZUNVZXUrT00rZlRQLzZJL1FyMGprdFRTbHRE?=
 =?utf-8?B?V1FKVUM0WTBMS2U4VmlRbWVBdDV4cXFnbFNtbHprZ0pwendVV3AvY1VsRysv?=
 =?utf-8?B?WDh3OW5xVmlTWEdZdnJVb0NuWklJVlBYdzJla0pJTnNaRUxpVlYzOWtQNlFE?=
 =?utf-8?B?RWJyZ25KOHgyVGhvS1MvOGR2N1V6RFhaSExsMVN4dVUwUkZGZU1MakovNXYz?=
 =?utf-8?B?TVBkU0wySGx6U0xNZWoyRVlWckpJaE1NNnBKUCtvR2pPcHNZQWxBb2FJTFJL?=
 =?utf-8?B?TklRYjFReW9Lc1lSVksxUWNQRWtSUTh0RW9RTWkyWnUzbG03anV1ZllpYk5N?=
 =?utf-8?B?TFo3RnJuM0ZjYkRKYjJaT0hJb1VyU0dXR2gxTENkSHkxK29jVTdkeXJTZ2VM?=
 =?utf-8?B?dzVtVzRIWjlCU2VVMXVlK1dFZUVscXJKUlhyVUdZR2NyOEpJODRFQitJSnA2?=
 =?utf-8?B?bTB3dURqNmx2ZGJHNFRORGs5K3NnbG1LRFlPTWZsbEJkSXNvNzA5Uy9kbHpV?=
 =?utf-8?B?eTRuVzZRQWNwVkg4Qk5lUXFuNXpWWG9QZzh3TmlteCtXQTNhRFFzT2FwUE5l?=
 =?utf-8?B?Sk01a1l2ZWxLZEdyLy9CeXJWVHhIYitKVlNRY3dIaE81WDlrbFcrOEhBUHRM?=
 =?utf-8?B?QzBsaEEreTdITzBLM0VjcWpFZVRucTFwNEZsbmNOcHBvdDhuTGlkWFdkVDJq?=
 =?utf-8?B?UWhFODBSU2xualNnVVEvdmhETnRDSmZkMDFCUjU0TjhEN0x2dCtrZi81eTI2?=
 =?utf-8?B?em9qcjdZNnhiMlkzcFFJUGdVOElsYWtWdnF2akZLc1d6dXRUTERNTE9nNEp1?=
 =?utf-8?B?Ym8raFROWk9HVi84ZW9kQzZhVE9ZSjJ6RksvVXc1S245V3pPRUJHb2p5MGli?=
 =?utf-8?B?LytRN01CTGhqamE3Mk82bGhFUVBZZmRxM2RPMkV6cWlXVVRPK3crU1ZlUHV6?=
 =?utf-8?B?a2RBbHZuVmd5ZDFsWmRtVEVnbFMrUVAvRUNFZWJLeHp6dHMwemYvT0xJVWN6?=
 =?utf-8?B?ZUtJMWljTm1RQzZTNEtUdTcrQXBjRUtpSllwSVFkakFDbkhlTkF0QzVzWTdS?=
 =?utf-8?B?bFpIVVQzTlhWeS9DR2tZeTdITUtqeHREMjUyNnh0RHA5RTRISFdFaFR3OFQw?=
 =?utf-8?B?VEgrVXFPa3pzUnp0N0lqY0UreUw5Ky9qaXVQSGZoUndVWjJmVWpUUlRrOGV1?=
 =?utf-8?B?T0RlZDNJL3NPczhpUmpCcU5vUHpxOUZaRVZHbUlIK0krMVVCbXd2UERxYm0y?=
 =?utf-8?B?OUczSmZZQnZHbUFDb2Z0d0N5dDUxUUs0YWw0eDNzbitHOW1iY3ROaFdsRUxp?=
 =?utf-8?B?cFFFM2dpdkg4NTlzVDVpeG5MS3g2NHJYWFRHY2dXQk9qZm1QWXJGNjhaVFFH?=
 =?utf-8?B?U2M0R0REZ0hsaXJyYU14WDdEK0xmRzVsa3JCK3JJSnVKTjBOY0RSaTQyZzNM?=
 =?utf-8?B?VWFTRERHNWwvMElIQVd0Wnhad2FkWUZNMkYrQitHSDZpSVNFTFlBamFFOW16?=
 =?utf-8?B?OWhtK2g2dGhETi9oenpaZk1LU2ptRjN1bm5FdCtPaWpFZFdXK1poc21EaUNQ?=
 =?utf-8?B?NFM3SWRFTkhycU15Qk9mOHJiNGNiU1A4Rm0xSTFoRTBVWFE5Wnp4MHpibCti?=
 =?utf-8?B?dVdJYzNQaW9xa0JLdkw1QWh1UTJoRzJOZ29SRTFrK1lZN0VtSFR4NG8vWmt4?=
 =?utf-8?B?ZUlNaTZXTVk5bkRpV3lLY0NtNHBUQ0pyRlJ3UmlOdWNmamJHMTA2UFllUTVT?=
 =?utf-8?B?YzZEdUVCUldlNkxocnJNeDNqMEdtenpyRWJkaWFsNDBkL0d0ZVdsZUdBdW1H?=
 =?utf-8?B?d21ja2Iyb1pBd2pUOWRLazFrb2lvRzNRVW4wOVRGWVc1eUFhcVpPK0l3dFJ5?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9455b0-ee51-4609-34e0-08dca1a779c1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 12:46:25.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxXpTA/V1CKiUXX373y3cVoi2FL5VDaA3fLKebKwqdJWtb2bqPKngrgYSBUmphMm35c3kfVqJ2Jxeutt3BmPWg0eWJ+W5sptgsz7JpkvbRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8153
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

On Tue, Jul 02, 2024 at 05:25:26PM GMT, Umesh Nerlige Ramappa wrote:
>Add helpers for submitting batches and waiting for them to start.
>
>v2: Remove xe prefixes from the structures and helpers (Lucas)
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 135 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 135 insertions(+)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index c697f3e53..037f25e53 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -54,6 +54,17 @@ static const char *engine_map[] = {
> 	"vecs",
> 	"ccs",
> };
>+
>+static const uint64_t batch_addr[] = {
>+	0x170000,
>+	0x180000,
>+	0x190000,
>+	0x1a0000,
>+	0x1b0000,
>+	0x1c0000,
>+	0x1d0000,
>+	0x1e0000,
>+};

where are these numbers coming from? I'm looking at
tests/intel/xe_spin_batch.c and the lib/xe/xe_spin.c implementation and
I don't understand why we need to add so many helpers and handcrafted
things in this particular test.

+Matt Brost, +Zbigniew Kempczyński to help help here


Lucas De Marchi

> static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
> {
> 	struct drm_client_fdinfo info = { };
>@@ -329,6 +340,130 @@ static void basic_engine_utilization(int xe)
> 	igt_require(info.num_engines);
> }
>
>+#define MAX_PARALLEL 8
>+struct spin_ctx {
>+	uint32_t vm;
>+	uint64_t addr[MAX_PARALLEL];
>+	struct drm_xe_sync sync[2];
>+	struct drm_xe_exec exec;
>+	uint32_t exec_queue;
>+	size_t bo_size;
>+	uint32_t bo;
>+	struct xe_spin *spin;
>+	struct xe_spin_opts spin_opts;
>+	bool ended;
>+	uint16_t class;
>+	uint16_t width;
>+	uint16_t num_placements;
>+};
>+
>+static struct spin_ctx *
>+spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
>+	      uint16_t width, uint16_t num_placements)
>+{
>+	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
>+
>+	igt_assert(width && num_placements &&
>+		   (width == 1 || num_placements == 1));
>+
>+	igt_assert(width <= MAX_PARALLEL);
>+
>+	ctx->class = hwe->engine_class;
>+	ctx->width = width;
>+	ctx->num_placements = num_placements;
>+	ctx->vm = vm;
>+	for (int i = 0; i < ctx->width; i++)
>+		ctx->addr[i] = batch_addr[hwe->engine_class];
>+
>+	ctx->exec.num_batch_buffer = width;
>+	ctx->exec.num_syncs = 2;
>+	ctx->exec.syncs = to_user_pointer(ctx->sync);
>+
>+	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>+	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>+	ctx->sync[0].handle = syncobj_create(fd, 0);
>+
>+	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>+	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>+	ctx->sync[1].handle = syncobj_create(fd, 0);
>+
>+	ctx->bo_size = sizeof(struct xe_spin);
>+	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
>+	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
>+			       vram_if_possible(fd, hwe->gt_id),
>+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>+
>+	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>+					     hwe, 0, &ctx->exec_queue), 0);
>+
>+	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>+			 ctx->sync, 1);
>+
>+	return ctx;
>+}
>+
>+static void
>+spin_sync_start(int fd, struct spin_ctx *ctx)
>+{
>+	if (!ctx)
>+		return;
>+
>+	ctx->spin_opts.addr = ctx->addr[0];
>+	ctx->spin_opts.preempt = true;
>+	xe_spin_init(ctx->spin, &ctx->spin_opts);
>+
>+	/* re-use sync[0] for exec */
>+	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>+
>+	ctx->exec.exec_queue_id = ctx->exec_queue;
>+	if (ctx->width > 1)
>+		ctx->exec.address = to_user_pointer(ctx->addr);
>+	else
>+		ctx->exec.address = ctx->addr[0];
>+	xe_exec(fd, &ctx->exec);
>+
>+	xe_spin_wait_started(ctx->spin);
>+	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
>+
>+	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
>+}
>+
>+static void
>+spin_sync_end(int fd, struct spin_ctx *ctx)
>+{
>+	if (!ctx || ctx->ended)
>+		return;
>+
>+	xe_spin_end(ctx->spin);
>+
>+	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
>+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>+
>+	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>+	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
>+	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>+
>+	ctx->ended = true;
>+	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
>+}
>+
>+static void
>+spin_ctx_destroy(int fd, struct spin_ctx *ctx)
>+{
>+	if (!ctx)
>+		return;
>+
>+	syncobj_destroy(fd, ctx->sync[0].handle);
>+	syncobj_destroy(fd, ctx->sync[1].handle);
>+	xe_exec_queue_destroy(fd, ctx->exec_queue);
>+
>+	munmap(ctx->spin, ctx->bo_size);
>+	gem_close(fd, ctx->bo);
>+
>+	free(ctx);
>+}
>+
> igt_main
> {
> 	int xe;
>-- 
>2.38.1
>
