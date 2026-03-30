Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01838F3D5E8
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 08:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB6E10E4E9;
	Mon, 30 Mar 2026 08:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k91rrudd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4302C10E4E5
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774859319; x=1806395319;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ryrw354gMhSrcQ6DG4/Z/BgWD6Zc6b9JYzcqcs69GdY=;
 b=k91rruddc72OZ2g8f3ykxATEajGTo0WWC26jPq8P61/3HuIutCuxGIWy
 3Ca+hiyhaEVF/HnD0OGdyQXQ/mKGxBqVzm1hJ1VPxHG/zLmClZqiEjXTk
 Bvwu/z2UEYY0tXvsSJ+XBTvG7b1RRUBZOVFM2+ZpydaM977FC4exZWr/x
 8u3TIAu4rNoZl/EJHMPgBAgMOIcg8bvJiElZLa556NYjV+59Nbt3VRM6h
 m/omPqg/lF1le2jqRKZ+sLO+wZDL1ygIrNPFo67PDk7l20fHIYM6KJREQ
 7dcsX1rvOu9rLKnK0JJsxEAootpIr+U2ZNRj1ql2V2VC+9qkMk2/bqYTc A==;
X-CSE-ConnectionGUID: IbjsHHijTu6rBsXPBwypSA==
X-CSE-MsgGUID: 8NMccjb0QWakXw5NuxBb/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="74878410"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="74878410"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:28:38 -0700
X-CSE-ConnectionGUID: j3qUlMD1RdWfy+LeB5Uk0A==
X-CSE-MsgGUID: fKuQIjJiQimKud8Bm0rq3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="219340556"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:28:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:28:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 01:28:38 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:28:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXfnYqPFnaS/x0GHWyxTh6prngHHY25dUezfAmsOlq/xFSb1hsIgXuvq5IHu1fRtGOrM8fedvFSHwNMCbZvsYTIe1JXnw2D/wghAtkZAwIhKt24nfRnvLn/s5IUsfojH469J/dk5Jn6T6eVLVKKgl6MtkOQq6dqtxJpcyQhZTcwAlQSfF1v7tuXRrTXrZxhxzQPl0OakgUyA4wrdxgnCQZzxN9xuLH9Y05Er2BXJ9zsBNQbUai7/CrLJqC1RnsctGE8FVbT+4T0wSp8hcflG7sAsnG8IJNMgAyZ25VWPSHYjkatbS+St5c0YuLDCP9bOOmQhUWFE+v5wm+GM/ZURpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6xAHln11A1W9fLAU5WKjSGw3m9f2NMfU4k67OwfWDc=;
 b=d/z/CbS/vO1uh1CYNsmg8VJbqM1PXFUdekMuILkTK5CHxlTp6DSoZ9eQa3248OOJY5AltIpjAxw8PObzdbQ5lN3dDEdtWQB+oM1y0o0vyFjAs/f6CR1nL5OeZKZPGey2zzgBADiUPGxqosYxq1Jw2HCqHv8R8GcajipVsPBy3DG8gNy0KqOdVnCOHDjdolYSP8wCQrnwhLj0100/Rmkrc2vMesXG57fVczAYGhKTLuDe4pUa312IxLIBymZY0nOyAYElMrafPGiS3tKuf06a5GVyOIofwgVFO0yw7sBJIzwl/NAoq/qBphQMB6Qwys/YpHM7y/GgQzM3lo+xYjwZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 08:28:32 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 08:28:32 +0000
Date: Mon, 30 Mar 2026 08:28:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 6/6] runner: Add hook-exec-allowlist to execute
 hooks selectively
Message-ID: <k7mtyxkvf6t2arghrxkj4gi5uyqju7xsvvp4cxn6emvfbynjvo@b4s4ipkzlowr>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-14-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324131235.712916-14-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: DU7PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::28) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY8PR11MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c549de4-47c8-4710-c048-08de8e3653fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: JzZQVH0lNdTHYRvQoU7rr4/jteJ1TTrZOk9wP18mEMSbfmXHck2Kj1B9CHneO3W99fdC3xXMLNnPZkKgyTzi0b3wU+tjQlNZNfgBNjS7s/3pJVJb3b4hfwFR6oNGrl485pk//gQbLbojeuOs1toyBekpFouKsuVRkpHlmgf0Rjg8dyphfENh5Y6wS6/ccoSrrpuD0HtbE+MWlANGdoYXgkmEpuEbb6sVYUHmIC3qeDLarpm6qMl5cCoYBg3UlhwAPloe3PDf7EWzYW29GwDxcy0xXfRcV82yrVu3ostmdEns5OJ5M4/dkdCC9qj4fQNKDY1M3EZTTtSO6ijTPV1eNoQrdPIEN3CnR1YNeZyiA4u9zjGwtz/elEU69rlRzCxAEb1hF7EN6DFBLHefmD+jkQStDJKzv0v8aTJ5LzMcv9Yl5aqNzSJXYpdce19jhHcFz4L61z445npw4wQlbnEeo3qmvDt2odHNu5shGlfokIIIBjT3gYlLf8XSzX2bQ9CSi+2qBhwp3usFpNTCo577d2JCTUi5aMBylFu+C3ENxKspfWZtaHDjNt+WXbWl0uIAkw+/5mluxFPrnTUUJ7+WzgdIkDLKGPZ4Iz+jtgtZiQCOVfaHD2BB5OCVtbK4/7ie/IOw0mnSd3J2GMHQ0qlH02+/Jw3Rs7vao5iiBxna4hoOifjTJleInnD5aIOKf0Ad0wt3jYPEodO15CbQZvWDFtdLS/qJwSGc4KlW5Yl1Lwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkpiVzIxQnVEK1NsVWdUaXJod0l1QmJmdTVONlV5cWpoRmd1QUFmSFEzbTVm?=
 =?utf-8?B?TXlsUkF3WndTMHRPMFYybGxUUGVtTm52ako4WUVpNi9PUzdZWDExN0NaVjYy?=
 =?utf-8?B?ZjgwT0dxT1hPSGFQeDJZU2JyT1FhSXp1bER2VE1EZnZTaGlVUHhtaklGTjl1?=
 =?utf-8?B?bG9nOWMybFJLSUxSZnBmUVMxN3dndXY2UjJmaU8yMWpzdjViQU84d2VpWlZO?=
 =?utf-8?B?bVZxaEdVL00reTVuM2grRUxpL0JaZFQrUFZCVjF4SElDQ3RPbGtUWHlZTVdG?=
 =?utf-8?B?NjIxZSt2L0pRQUM3TDN3UkFsTHFIMWROc0V0bGw4U2UwYStQM25lVjhqRGk5?=
 =?utf-8?B?SVRXYTJ6eFJ4MEhsZWpZRWk5L1JHa3ZDTXhlVkdXZFJXd1ZqNmdtaGFScVNN?=
 =?utf-8?B?QUJlRjBYV3BUNVVZMXdEcHNMRmR3LzUwZzVDblp4MHVZVUEwME9VakZ3d1Ir?=
 =?utf-8?B?Tlh0SFcyc0JKYnVJZ3RDNU1NUEFBYml2VDFDdUlXTmtWUzZleWpXQlVZUkVv?=
 =?utf-8?B?NE50WmVYRzh5Q1dPblBFS25wVlNVcEFybENYamJyNHZPWVJ4ck9kZ2g4cnJH?=
 =?utf-8?B?NFhmL2ZCNFhXVDc4Y2Zsb1VxRWptOVdySU1lQUtlR2c4blVPTDFVcUJ5Qno5?=
 =?utf-8?B?cmpIVFpnUDQ0TTFPT1pYcUJTSHlVT08xR2wvZFJpdk1BVWhQK0E0OVB6TG5w?=
 =?utf-8?B?dWxzZ09uRDljamI3S1JiM2F5WFZoanFGRVJ5SVVjdlBnTG1RQUIweVgyajc0?=
 =?utf-8?B?U0Qzd2UrSTU0WUtIUjBGM2YvY1pCRDJEVE0xbGNSd1EwcFBWYnovSUFtclZJ?=
 =?utf-8?B?aXFPeE5UU1VCQ0hWSDR0NmNpaWJRNW5YSHJtRmtNUGpjSVlxZ3BSRHFDSG43?=
 =?utf-8?B?Wmh1UEZlWWtHUHNFRUtpRkxUTWJQcVY5WVVUdUEvV3ZPTHMwNzZQY3pxTDFQ?=
 =?utf-8?B?N2EzM0RaWmxiQVMzOWc1VGRpTlpEdThKZytqbFNjc1Y3U0tvWDRCak9WbE9L?=
 =?utf-8?B?czFJVkVsTU5XWFRQR0lwYkpQYllleE4vRyt2bm5yQXBKZU9nUkxxOFh0Q2Q2?=
 =?utf-8?B?QWZZVVhkK3l0aDVNYXhhY0k1RzR3bW9GeHZrU3J5WC9yNER2VDhrNHFYd0dE?=
 =?utf-8?B?NU5UMWRVaEpPRUdYWUZEekZ4MmduNDVRNmRQTWswdXQ0WHVmRWh2aVhKZU1E?=
 =?utf-8?B?TFBYbFpGQVRRTHFXUVV3eHkxY0QvN2I3NDRVV0lCOEQyUUhCNkpERFJXbVZx?=
 =?utf-8?B?VDQ4NlduYXZwd2tBYnJTVHFEN2U4WHo2VEdXdUdoZ0Z4UkJ1RW16VTRjNE5u?=
 =?utf-8?B?b01GUzNncHRuaDQ2SU45dnRJRkVoSVpiREFkMmlnM2xDdGltL3VwRTBQNncy?=
 =?utf-8?B?b3lrY00rT3pJK1JzckVwMElsVDFtZFJaK0JYNkNhb21PT2Q4aGwvLzUzOEE2?=
 =?utf-8?B?RkVMdDA2NEI4Ty9sWmFwQmhGOTRRdnVlMXBJTkpVRE83c0FDM0NFRXk4YzFm?=
 =?utf-8?B?Y3UyQys2MWdXR2ZxRnl2VkpOdUxXb2tlVUVpTnlDTGlDZEFNL093REs5a3Fv?=
 =?utf-8?B?TGxSN2s5aTFDZ0xOenkvMVU1bW5XMVdRc1p1OG9UWUxjWGcxNkU3eWxLcXRi?=
 =?utf-8?B?MTVRZ0tsVWdHTTNkdW5IWC9UUFZ3ak1OSXlwMmphYm9RZWc2SWVwZHVCYVB4?=
 =?utf-8?B?TjIrU3Q4dGhQWXZ0ZW9nMEZLTURvSFhZeEQ3alNiaEVMK1VWemRaNFJWMWpJ?=
 =?utf-8?B?alZHaW4xZmRUTU5uTGpEN0VyS1dTSE9mWDZWak5zOUJXckRpemtOS1JIU3FG?=
 =?utf-8?B?dWN3YVBGWjBpUld1QWxlbTdlT09YR1Q1dWYzOTlrUUhROHF0NWdKdUVGWXJy?=
 =?utf-8?B?dWZ0U05Ua203NjNMbkxtMFNtb2ZacGppbWJDbEJqQUJQRTRBUVlJZ1E2Y0cz?=
 =?utf-8?B?ZjIvZU1wbHdlZ29sUUJ3cVhZMGtXMkpsbDVvUm05YWg1OHBYOC9KQ0ZtOC9w?=
 =?utf-8?B?UFhHVlBSOXBrdGNBSlV3dVRMempwWjh0NWpwbUVGQU9kT1RiTVE3OW15bkIv?=
 =?utf-8?B?TCtVcnJRWkZobHFKbEJSQ1JOMDRWMjhjbHRCako0U1AzTVIvWGg1NGdtUmZK?=
 =?utf-8?B?UXFXUi9wUnBNTmZoT3lVVkowOVc4dWpvUVlFVnUvYk9XVmtROXp5cUVkdVdy?=
 =?utf-8?B?RDZtZFlPVjJDUWF1YzlDUkFOSGxRWnVKOEkyODVacG4xMFkwQjU4Y2h4dWZl?=
 =?utf-8?B?QlovT0RyckRhZ1VWbVZMSDdMaTN2YjlOc3hDVXFVT0VTRW1jZ0xoZUt5RHU0?=
 =?utf-8?B?Qlk4K2Vua0xSQ1JuVUhLeHVrcTRRUElDcWdzaFR4bU9jVWhBYUV5Sm5vOExr?=
 =?utf-8?Q?dE6yAIc87+qfKqwA=3D?=
X-Exchange-RoutingPolicyChecked: hBVqLohz5McG3c5P/pB4EuI+qunu/F+5F8LD0SWvk1nptM2EW+TXJVOEJ6D1mxaAQtMeURvCLE3wZgL5OfWJ/B8uOjGXvURjNstEImdAlpF5XrYx68OvGHfkm+EDjaNxOUWu7XGaXj8mAWDPret26n0MGkej+l5V/U5NVFQfc3Yw/MW3Ulsn3JLWyjz/bVg6XKXb5A9hyeOBPKuSueJNarPJ8YF5x+muvn68IV5V0fQRhl8kGsDDl9N0EoHnFJ9+ZsMsa/EzUCUSorAn6V5OK7fzJVNQDBMkWdhzEMgjDf429i70s+fCJH5vqiwAyIdn9+c67cVPElbCyMHIwgnclQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c549de4-47c8-4710-c048-08de8e3653fe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:28:32.2621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qP2jKdPea/SEe39uMZMDIffWocYKlp6nKyCVhmpSovih2qSztHjso77nThLrnsy5qDd2knhXZRHd/DGns294gCZNHTsAtrEMZYGYu6S81Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
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

Hi Zbigniew,

> Hook scripts like GuC log copy takes few seconds to complete. This would
> lead to large increase of CI execution time.  Add -a/--hook-exec-allowlist
> argument to igt_runner to pass file with regexps which matched will
> allow executing hook scripts. Syntax of this file is same to blocklists.
> 
> Some limitation of this code is hooks will be executed with subtest
> granularity - if multiple_mode is used regexp will compare only first
> subtest so all subtest in group will call hooks. This is likely not
> a big problem as CI executes each subtest individually (without
> multiple_mode).
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---

[...]

> diff --git a/runner/settings.h b/runner/settings.h
> index 6c58c3282c..b81f6adc6d 100644
> --- a/runner/settings.h
> +++ b/runner/settings.h
> @@ -59,6 +59,8 @@ struct settings {
>  	bool allow_non_root;
>  	struct regex_list include_regexes;
>  	struct regex_list exclude_regexes;
> +	struct regex_list hook_allow_regexes;
This name was confusing to me: keyword "allow" seems like this
would be a boolean flag, but I think it represents regexes from
hook allowlist. You could rename it to
"hook_allowlist_regexes" or even "hook_regexes" would be
sufficient and less confusing.

> +	bool use_hook_allow_regexes;
>  	struct igt_list_head env_vars;
>  	struct igt_vec hook_strs;
>  	bool facts;
> -- 
> 2.43.0
> 

-- 
Best Regards,
Krzysztof
