Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A43FC4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 07:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123DE10E70F;
	Tue, 21 Jul 2026 07:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGsYeQt8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD8210E2F1
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 07:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784620275; x=1816156275;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F+qWY3NPkog0u7JQppOcds4JaTUTWLwiSPVXDxtMCuk=;
 b=JGsYeQt8a0xAm4dB/lI9+rB4+lDYV6tJ9DxdpFD3UPMN2WXx955HatKr
 PmeGZnL8oPBG819BiuDnGjbvJ/xBC/556wfxFrTFHs69Z9/umwuuDSpOH
 0mTcifBsKnRWwuz4XI8gw351H2v364CHLQzl75F8I/1LKdS69dvLjLDft
 cOaAkp/XhgpnQkEcGifGrgIdN2jramEr/I5sQNfn6ZZqJZbWHf37uH09x
 T6NaoYDktRs950O5LIUEK3/ko0G9g52PV9WavOFS04pxYRS29+5nhBV+i
 TQn/UpvG0B8fStwmxaXqPYIA7rWqX7ObgVLVAGGoXV72a/CMaqYk0tpMS A==;
X-CSE-ConnectionGUID: Fie8wunYQPaqy3CGrPKTsQ==
X-CSE-MsgGUID: iGyxfrHpTsqj8vWHFbKgIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85089112"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85089112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:51:14 -0700
X-CSE-ConnectionGUID: 07MA7q7uSkGd0l4Qr+RUyA==
X-CSE-MsgGUID: 4OrcBng2Szq6st9k/cBp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="259673168"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 00:51:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:51:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 00:51:13 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 00:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSKL2Vp6Ku8mynZXDwzSeXtVMC9iPmLHZLsuR/HM2Bs3i1u9wC+mTiYsWO8oL+6x90/91MY+dbhZ/iHMDbxL3aAycP9VlC2CiGuoubTUqCnhm46b0P/G61MOtzaVQT+wlJJu44vOU8btIu43ltaCYTGmMUrR5cWBONCGmJnUB2gOX3ho044iEBZOFBjNh3ndDCrAIuG4SSF5bw51WXYF+wyYP1sgJnw4NkqmArUeP97SlSYTPAhp17+5OjmUUmWgiEl3AloPPz9q8jr9izuIJpwme3r9cUljCY3Wo5q9MCNqNOc/GP6qYQmhu1n7P8j4ESlXw14Kb8C+lbfd/zS6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWpYP3LPpq9tMcl4CXUwWfFcdflUP/OukFC+gkCdPsA=;
 b=HDeXKqOt+Bbj5YX0qt0ikg7we0k3WZHt6aiUFJAXcP9jMhKRCtY+J4ATZRcGy9ZyyOo51TVYU7Yv9MbyZ8Bj4d0j/1izIphtvbYhOgdU+qZXFeTVEzq0x7xQwKgTqcSbFpV0HpEQ+SgB3tWgeefgAINa583TDbso9Y5faevu3jb8EvECoPXw+j3km44LFvCsx19rFiehcxGzl18czg5tTYgvpLzCQq4KsiaEwl/dviDQsRyOb/H/rE92UM59jXJ5fqjaBPS1uxo4D/GJzF1iT3/K2FfE6Ar0Vv8kXuIS6V0km3uEg3aMBbsmBwIgMS4ujn3z/oiIKa+pbg2xE+ALAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ5PPF524F3F9FA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::829) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:51:06 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 07:51:06 +0000
Date: Tue, 21 Jul 2026 07:50:54 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 31/31] tools/lsgpu: link with minimal
 sub-libraries
Message-ID: <ws6btku2syw43h3hoie6mflo2slrlfbzxiczhrmu3hfnefz4my@pldxsm3qdweq>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <be7357fc0ffbe85e2157ac919360193e40dd8961.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <be7357fc0ffbe85e2157ac919360193e40dd8961.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0019.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::14) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ5PPF524F3F9FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 065974ab-9b58-472c-06a7-08dee6fcd222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xEy8SkeYBa77YTetPqblTQOtHbCUTLfRs6QLODNzcoF7Am6XzzNwh8R40ebVFkNjMtPXBmNaYeitku1b+ih88bXaHCClp5WQMfBOR0RiHnjMvg5LXVNmgy3+0IA2h0OTB1H6BUssn1uOOEWeqcE8YzHcGDQjGOpqweRNHPAYTk/wzhJKGHLItbfI6QPd8djSHR/GK5GoXfY9E9m33gbnOUQROjvc+sevpO2yAXDWrveqUY9G2uWzPBvVv5DwDbMV2wTvu8jQhlFVcIWAfWEVaPqHurSPxa/eijyP5G/3wMefcx29mmakGJ3ek0T7+UA1mbEhAkE/W4sxfyc4LtrEtr6R9jSqh+/kI02OFzd3NVUBN5fwxsN1XDzPrrNvPoxvfU2Xypxok/dM8vJLBoyaun/lXc41FvOVyHaaGpx+3+3QC3ClDruSe8SN7BFCv5hWC3nS4rIQi7wpKtm4rESEhxoqw+/fBXkyXYWYaEB4zjkbp7WHIXB3QRqFS4RF44p4kw+Of+49wvgwu8QFISMga80J7KGoi3/51fyatiPujRN/cJOpImqGHqf874JSnm4Hud4YL2JFXXPnv/u9Njg0OKPJhFSnPmlzvwvz2rm8Hb1UqlPR5OGNeRP1yfy7lS84H8799PaE10WJjp8mZJdNRwevZGg2GbU4aJx+IkUp9FI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFE2b2ZLYUlLRUE3YktxbU9Ebk5zNXFTUWFPMFg4b1pNak5Cc2tFQlJwcnM3?=
 =?utf-8?B?ZCtlbEtMSG1UcE1IZVd4UzlPQ2JtVjVnM2FHczBETG82ZFY1WlJWeVpTcElT?=
 =?utf-8?B?SUpXZ2FWcVRHZyt2Y3pSMlBKdytUd0V1eXAvOUEyUW1GalR5amtCaWpNcm80?=
 =?utf-8?B?T2svRktPNjhLMzQ3aUx2OFQ4Z0U3S3ZNb1d4RUprODFhS1ZVR29JZGR5UmFW?=
 =?utf-8?B?Wk52Ylh3d3lNRGZFaTRwaTM3aHRMNnBCbldjRnU0RFBNSWNzWWFtTThIb2pa?=
 =?utf-8?B?a0kyOHFPRFI5VUdTdjJidkI0NlltalpqV3Q5TEJXYlNRU0FmMFZJMDIyTmoy?=
 =?utf-8?B?em55WlhYMGx1QW42K2JWZGNCS0RzMlljVDY5eUl3anVUNERyU1lmaFZ5T3E1?=
 =?utf-8?B?ZzRUT1g3RDlZSkZTZWRrL3dUVVJobE5sdFliMktwc2h0VlY4aFIrcUErUmRx?=
 =?utf-8?B?cW1GSENkUU1OWWNLZ1JuY1MzbElveVZKZkgzQVh4M1QyWFBkcy9mWTdDWkM4?=
 =?utf-8?B?aklIUkRrMTVqY3l2N3BSZ3psVENpR2xaelRiYml0bFdPZ2lYakIySnhxUE9B?=
 =?utf-8?B?NjMrMzQ4cHdJaURzL3U4Mkt5aFhKbHlud0o0ekd0T2ZscWIxT0ZMSTlDbFdH?=
 =?utf-8?B?WW1iLy8wTENoUFNHSHVKcVpOejVLeWpQVkV6VFRvZFZRZ2txQnZzUFJ3RjM2?=
 =?utf-8?B?VVBTWWtiRUYzV2VzYnExczArSkpyQkk1a2VtRk5UUWd1UnZqUnBYMEJBUzYy?=
 =?utf-8?B?RXFQaWJaeGJOa3FZSXAzdGljS2lGR0V4V0hydkNqOHptZW9ObHBSMHA5SjBE?=
 =?utf-8?B?eVZPdDdhbjRkYlRsdUQrd3EzQ3ZwN0RWZDBmRnkzU1Y2SkI1cXVvN3BzSThO?=
 =?utf-8?B?QnJvcCs1VWxKRU9CZ25DUStvaHlYY0JpMHZpcHVkc2JoZmdDcjJwK25FY3VJ?=
 =?utf-8?B?SmRoeUdrWWJGOWlZRlhxNmNOQ2xheThKZHhybWV6U0JBZmNDZUZTQnl6ZC9t?=
 =?utf-8?B?WlB4Ynk0M1g5UnJFL25INWNPSXB3MDJlV2F6SlJ3TnFBdGtJRy9vQ3NJVTJ5?=
 =?utf-8?B?Z3A4dFRDS3Fsby9QcWwwbnZIMFkyQk1UNVV3WkYraVJTZy9oTzhRSnljRm5C?=
 =?utf-8?B?QUg3YVhQUk1Vd2lIRFYyaXJpZnJQVXpkdDhPV2JHSXU0Mk9hSm5Eekt6TUFP?=
 =?utf-8?B?aGl5cUVKeXViWm9JRitQSWdqS0xlcG1kRjkvOFRuZENRT1NXazJlazZwWDlL?=
 =?utf-8?B?OXRBa0QrVU9PT0FIWHQrY25XMXJ3RGRWUFRYcFBvNHU5bDY2eWtQOFRHSDRL?=
 =?utf-8?B?V1NuY3A3bDAyUGE2V2x6K2tDYzdJWUVOMWxZUGM1V2RscmdDQmhITllIUFdq?=
 =?utf-8?B?TUU5eEp1YjhGenFLSm5sOUMxOHZaSERpYVlZQTlmVkx6ZU5hQkx0STFjdjMw?=
 =?utf-8?B?NmN3SE5iSEluQ2FtUDlIbnFIeEIrblZJMXo1bWk5eEVPdkl6TnBYMzlKZkZW?=
 =?utf-8?B?cS9BaHNEQ2p3ZDRBbnRES21LSVF1Rk5zQ083NTlQVzc1eTFpMWtneEp6VW1o?=
 =?utf-8?B?NEJYcE1ScndLYlVoTE9LSklPa0d3bGlOdVQ3SkZRdVBPQlVRclJBLys2NEEz?=
 =?utf-8?B?Q05semdYZFB1NGhLaFdjTWVNNTdoQk80b29ZWjMwQ0tYK2RBZ0NlVWcvWlBS?=
 =?utf-8?B?aDlBMFc3MWcycTVQU3MxNUpaV1p5S2J3TmQ1SGx0akFjOUNJcEw2aHUyWkRy?=
 =?utf-8?B?VU1kQkx0dUVNWE1CeWE4OXBTdHNKN2d2Qlg1RDZNNEorWG9lZGllZmpPd3JN?=
 =?utf-8?B?cXFrOS9qVVBucDA5bFplQjkxd0FrcnV3YlovOW4yakM5NjZWWTc2eEEvSHha?=
 =?utf-8?B?S1U3WFNZRTBROHJMNTZTc3o1eFBFMktDMXVNZWh2ZmhWL0tDdUFDSmZCNkNB?=
 =?utf-8?B?bTl1dFNsVytDYkJBWlBITm1lNTVmN0FPUzV4K3Y3K3l6RjFZdEg5bWNGVHVi?=
 =?utf-8?B?bittK1BaN1BOSUNFSGx0di91WVZXNWtsTXZHRU9rTFRlMVlEZW0zak5Ibita?=
 =?utf-8?B?dHBKYlExZmNRMHd1Qk5OOVp4QjU5Mlk3QUUwM09DbUdWZC9jdzVjT3NrTlN4?=
 =?utf-8?B?aFJsa2RQTlh6MDU1M1AxRnNmVTJUS3FDOS83MUdBMGhXSElEclNOc0hGQnF0?=
 =?utf-8?B?WHdQVUovUzJWL0QyZjk1Tkh1Y2ZVWWs4cTlTZnlPMXhuQnpJUkR1OTVCazdI?=
 =?utf-8?B?cnI3MllCaFhkNVk1UkJjWVRJcTdLNGpnZTRvUFVBdU9iQnVrU0thWkdRRExN?=
 =?utf-8?B?OE1vUzBqOXRZYVMyeXVZNDY2VjE2cVBoclBWUEdLMEZmMWlSS2lVdnRPdW5y?=
 =?utf-8?Q?Uv9ILvFDWtH/ks3c=3D?=
X-Exchange-RoutingPolicyChecked: nrRUMLWZiyukR1VzT3tCmm7e1OV+hpgKACcrtQyqxnay72uqQCmm7CWhTUgiRodiZb8mnjtQ/9uikmi2fs9vLOoAZGxUoULyeTL06gFgmE72k7Pmtg7KW3/08HNcZO9ZxK5B7oRc6C7IVPfEdekBmUAPoM4IuvgrbgHjYLNrG4Kulpt5Hq4M7WMuBmIswvQVkjS/GZF0cS3kOu7R+cV1DZzqCzFp4paryEYAFTQuELzjkp6t4YnvYVlonme80u9C4QEiS2Wfrn2IxwAwrIZlayAtdY/1+er1wCFHe3W+EGgTZt+G3GZDT74xN4jywu4N9/1+zxHBJ/re97ZBnuUQpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 065974ab-9b58-472c-06a7-08dee6fcd222
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:51:06.5811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIJpNHX8Uy6JH2eI3s/FtUo0Xo+v4sFoBzjAzercgzfwlcYnNojCmMXeraC2PXmkOjzCk4YK9NbOD2mBeNuYG1dZtt4DwS8XXLK+qKajbL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF524F3F9FA
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

Hi,

On 2026-07-15 at 14:15:41 +0200, Sebastian Brzezinka wrote:
> lsgpu only needs device enumeration and the lightweight tool stubs.
> Replace #include "igt.h" with the minimal header set and stop linking
> against libigt.so.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   8  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/lsgpu.c     | 2 +-
>  tools/meson.build | 7 ++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index 935371dea..7d6b70b9b 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -34,7 +34,7 @@
>  #include <signal.h>
>  #include <sys/ioctl.h>
>  
> -#include "igt.h"
> +#include "igt_core.h"
>  #include "igt_device_scan.h"
>  
>  /**
> diff --git a/tools/meson.build b/tools/meson.build
> index 6e694164f..fbc6c0a00 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -27,7 +27,6 @@ tools_progs = [
>  	'intel_tiling_detect',
>  	'intel_gem_info',
>  	'dpcd_reg',
> -	'lsgpu',
>  ]
>  tool_deps = igt_deps
>  tool_deps += zlib
> @@ -172,6 +171,12 @@ install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bindir)
>  
>  install_subdir('registers', install_dir : datadir)
>  
> +executable('lsgpu', 'lsgpu.c',
> +	   dependencies : [lib_igt_device_scan, lib_igt_tools_stub,
> +	                    lib_igt_drm_stub, glib, libudev, libpci],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  executable('intel_gpu_top', 'intel_gpu_top.c',
>  	   install : true,
>  	   install_rpath : bindir_rpathdir,
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
