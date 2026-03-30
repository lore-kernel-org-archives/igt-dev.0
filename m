Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7C31061B18
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 17:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E6510E48C;
	Mon, 30 Mar 2026 17:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGO++mk4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF7110E48C
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 17:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774893556; x=1806429556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=abNWGmbHuA1kxQob1iE5ys52Vw/bxzCgm6ZIYKHjxNM=;
 b=lGO++mk4LxQk5vVJvG3YMiHVua9jjlBL9EkUVoxzuoFMPwR5zIX7At+H
 dgQG7ckqKrx6Xu4jgwtoD5tE+7gnQPotMVEPLYl62oiF9udR6pQ2p1FKm
 sIMC/e2r/CJC5ImKQHkb1qKRYIEDBtZJ8xT5eTa77DEgy4X8vt/EqOO9O
 oU1DGPwLI9veArP3haU473aC9McnP3DRsTLp9xcDu2wKGqBbZ4zHHPbkX
 PGl86lZCTSFpU8j4lU94OetSZ2TVvcPk5xi6z3CZC8cVwe1wNabeXqstj
 xGSq0wFMEmjpK8Q825uJuIIwwDey0mBVURMnUFF9KhjPp9XejYU2GIUQR Q==;
X-CSE-ConnectionGUID: ixVRKGtyRDeCvvtPQqR9EQ==
X-CSE-MsgGUID: JBu0wFOITt+4o6Yf7BVHLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79496483"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="79496483"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 10:59:09 -0700
X-CSE-ConnectionGUID: kti3tFHtSL2saCZ8eAw5gA==
X-CSE-MsgGUID: dq/jXw0eQEW/x1HR+pd52Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="227737508"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 10:59:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 10:59:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 10:59:05 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 10:59:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSCzaQ/bSq3FOc0Cx/66bxiZ/tyQfJfNFb12jOK35rv2yKIMYIj+eWelv18rtM6OAK85B3zZp23ztTByg6iVx/mbRVwBUd+9obOSiE8ZnCzp4GB1zez//NfuKq6D9M1wlmxbdWfAdJkIZ7pa1w99sxePhOSbZd4q4lFvxa9RJ/wHldArLpiA5SujW4AuJKMs0spBzJznJF6oFbaCYAzU/F8LC7SDyXMDKK6/hyhL4EVRvET4KIs25cU4fyMF3WTsg7emOsOQ5EPHVuFzKOQWcPkU4xEtFot0Gsl7iUYg6JT5MCH+DAqhRjdiGzt7IiWvvRJa7By6LcZKQkyS+UYrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZ9A6mQb5d4qnGCXd72m65OBjXZkuGgJx6wBMkSAHaY=;
 b=JzjWPrWP4Gpxh1sPrPiD5oBKe6Sk7DzXUyKyfzjHHA4Mrsq+WL7qQVaCMr1cW1w7hYSgCGj3R8Tq4fqi02+WxJdReifykzAoF1JgeZB5sN02aBZc9dyf9XgacvWyecWjZQgt2jgGhOE6yHFS7l9aUVBjqHb/gWg/4UU8DGwphSbw7ehHpTXmTidk5+7sgF5oxUlOuzve7BIHwElVFXUWYtE2jBZbqLiL+UVqMubN+gTXIz2XhKCnzqxIvTPYYDmTY0mcsB2yYA03bIzvSf7QYmkRF0kfKmNQIdqHHeWQbVB28Mys6TSAaOEGKUC7T5d6ZbpN3yJwQvWDEIA2/Nqi9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB7351.namprd11.prod.outlook.com (2603:10b6:8:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 17:59:02 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 17:59:02 +0000
Date: Mon, 30 Mar 2026 10:58:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Extend enable-disable to read
 after disabling stream
Message-ID: <acq54YO/p+vH/cY3@soc-5CG1426VCC.clients.intel.com>
References: <20260317223910.3539034-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260317223910.3539034-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff225cc-3596-48b7-b31e-08de8e8606a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: SmS8sJs+r6sdn6rjvLm/l/RR5E73uT6kYzGVOtXEze60/zcEa2r4LkRpeFVLypQ5iEv9NIC7gaRWqhCDR0txy1EonmbdzT1VIP6B/0ntFiNMQrG/rONLWFDAD2nOWgovACkobWqBkcWz+yRwMVByGYS0j+30azMEzLaTQEQmz6dk9C2O+6DI/w81cWKt6L9SonVZrHRD3fGRjTVPpDQbOvQtHk3cVwmr8WFb8VG0WOnu6NltwcBFDxpCGPlWLplCxXg7OsGWqOTMoZVT5Z6JWjllX6ZyJwNHVEvPWxUlsibT4LAd84CnKgGFlLTCZlVn0IC3JPHF1pV9YCWHGYi9+4fhrABqhDBaCv9ZAvOC1aDnWU7rhIdtayQnM+ei2OfJj19zyyPCmmDtNwNGkoOLfEexRzTn0yJ2bHdG6l8A/YXwCAXZ7UY9a4u1cmwOvnMdM32JwZGSusStSVKmc4Aa7pxD4IbhEdfGxs4Dh9efTWIhzfNfjZ4Ita1aaqPuKP4h0fYwO/HXIjSaPcHzOWoE4KQbm2QvMwUl2UuCpkcH4qazr1PV3BSWauJr6IEwM2CtlO6vDjRzPsioJLe4GNDbbwur6Qv2AEv8YySugmsje0UIIt3WqRnV+GLIuRoBSts3v69XBj8OBS1krhlLtOl464kDuPtoiLGEgT8kKfP4/loPwW5FKCxngysqOOzVFIpyZYAzAu5PXacPuvb4gdqOJVe8CIsjIfaEwDANH/6r+mQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjlkYTVzNkxGTlk2b0dxNmdXSGE5UDR6SWdYeTN4aXJETVF5dEFRR3N6SlVj?=
 =?utf-8?B?eG9wRUZxeEVmL0I2NmRxanJyTE8xbXlwakJuVnJQakZTU0dKeGpTTDhQUkZS?=
 =?utf-8?B?MzBWa1FKVm9nUlEzZ0dKK0VpK3ZUZ3lDQ244SXRYc2lkSXRJYlovNzllRStT?=
 =?utf-8?B?REVSQ1FOWjE3bHhCNzdwM1habmJaejNUREdWSkdSQks5UUx6WDAvTWpZQUw2?=
 =?utf-8?B?ODNyT1d0SWZMMjBlMzNwMXQyV3g1SjJpaG9EQTFrMjNjMjU2d2x1STlOWXFN?=
 =?utf-8?B?anpveThWZ2VmUGloRmRCMzM2SE1QU0JwQU9JWmI1RTMxdUNmVmh2dVpoemcx?=
 =?utf-8?B?U0hEWW4zKzZ6d0grazg3TkV3dDZjaCtGRFFPNWpKVU9FTVlFRFNiN3hnRUJ4?=
 =?utf-8?B?TmYvU1d5VFJXS2hhcDAyTVhuRWdva2grUVVZVXNDOFVmU3c4cnVYam1zTG1k?=
 =?utf-8?B?RVcvdml0ZGVrenZidE1jMkRPd2ZaOXNKL0p2NmpWTSs4VUxsMG9JMHdqa2RJ?=
 =?utf-8?B?K3lZZjJkdnljbnQwLzZsK3ZldDNuNlJ4M2FscGVuYXpaSW0yTExDLzlzU0VC?=
 =?utf-8?B?RWs5OENJWndwdS96aUM2c3EvME1WNXMxUGxiMExnWGVwbnUzcjB2dDFNcjFZ?=
 =?utf-8?B?SVFYZkpoSVpCZm4rWkhGRWdla0c3clZ6R3JibXVuYWdYQzNVNmVUOVFwa042?=
 =?utf-8?B?MUJha3draVlSV2hpMURlYzQ3ekl1cldCOGRQVzRMUFBjN08zNUljbW94eUxP?=
 =?utf-8?B?TkpVWFQ5OWE3NjZmQ3NWcTNlNWw2VkVSaVpNTmkwWThTaFVTSStlZzZHNEJk?=
 =?utf-8?B?b2RvZGpPMEJPeWJLOEdPNFlQbjY1TGVxQ3dmcVdmZC9FSDhLazdicjlhR3BK?=
 =?utf-8?B?Mk9oUU1BaGtXclhFZ3JjeHNvaHVsSzhONzNwaDJQcThaM3ZHeDM3ZHQ2VzQw?=
 =?utf-8?B?ZFVkNEJML3FiT2Z1SkNhSzQ5MnhacE54c3UxVThxSmREUVdGTWdVSi9Hd2d6?=
 =?utf-8?B?a2pWdVlQZ0NyaW1kRERtajhadUFsV3hPTzE0T3NRSmVBSW5COVFXOEVDZG1K?=
 =?utf-8?B?b2Z5VGQyT3dSMHNDZ21HZXJnbitBSzlIVjhpOVdaMEduNEhJVWV0dUJyZW8v?=
 =?utf-8?B?bGxTbDEraXZzR0NYVDBXTUUyWVJMNG5kQmtJSWZZSGdBTHR0NWZsSy9HZEQy?=
 =?utf-8?B?bmxWVlRuL1Y2NDdtd0dPa0JvZ3U2RzNicWFjYTVHeXR6Mk5aMmJPa2syTVJ2?=
 =?utf-8?B?TVN3RzJuMTFmVmFueDRKQWFhK0l3YzlsVVg3bjg1eG1haGF5UWNudXIrRENu?=
 =?utf-8?B?UkttbUovZkJkSVZVTUdhVGVPQnRKa28rZ0Vic1hKS25ZNnVaL3NZYXdsYUFv?=
 =?utf-8?B?U09LaUlhRGwyL1VKa3dTMmVOampuR0lnWjd5TlBjNmRsaXl5NlMzalBGdEZY?=
 =?utf-8?B?NUI5Nkp3cDlQUVdCQUdTd0xMVmt3YWpOUTJQWmJEaEdjRG9PNVBPTm9FbEQ5?=
 =?utf-8?B?aU84R092a2JpZTVCNGkyaG0xSENNTTUwcWo3M21aSTJBOEJkRkRHV3pTMy9v?=
 =?utf-8?B?dlVzbkIrcVpaZURTd1RVT2tUdktSR0dyRDJWRDVoZEJYay9sUDhYVmhuS2h5?=
 =?utf-8?B?SkFMUG1kWFJ1c1RYelJRUE1CRmIvcXFGT3NUQkkzTTNJaFVyby92TkFqblpL?=
 =?utf-8?B?SGhreUVLM1VwdklkMnpTUEN5ZVdxdmhna1MwNHNZVFRBRHdFbkVCLzFpeXI1?=
 =?utf-8?B?ZWpPRjFlMVZQMTMyYWJjd0dKZDd4TXpRZlBlaFYwNEdWN0M2UGV6bjBsemNW?=
 =?utf-8?B?eWFIKzdzYmJDeS9XK2F5UjZQQTZ1R3VzVkFYZ0drUnlRRFB5ZVJvc2l5bVBk?=
 =?utf-8?B?TU4rbHZwVmhhUG1KMDBQUnZBYnN1aHAxdTN4THlYUzRUNVRNdjhteE1JN3NN?=
 =?utf-8?B?WFBHQ1p6N293ZnlXUE5xbTJHcm9zRER3c1VQd1FDNlVsRXhnS2E5TmFFWERn?=
 =?utf-8?B?WmdkR2NFSDBDRUxzVFpGMFdmS3BhNjd2TDlZNlBRZVhuSXZheUovTmNTL012?=
 =?utf-8?B?ZjREVHlOYmUzUDFmK1dIaVdienhsTm1HSnhuYnRlZW5wa2xzbE5xNGNIVFJ6?=
 =?utf-8?B?Sko5U2NpaVNJMFN6eDMzK2VEUWIwVEtZYW1Vc1o4YlRxdTc4VmduLzU4N0Nk?=
 =?utf-8?B?Y0ZJR3djSlBIUTF4QVBBTW02L28yaGdhQ2Nad2RLNDdQZEovUzg2VzdhVGsz?=
 =?utf-8?B?eTFBS252RG9DUFN1S0JEQVYrcTl5Um5jVnRtM3JrQUYwamJQYTdyZGxmRUFn?=
 =?utf-8?B?MFZnaHFOSy9qM1RURVdHc1g0aUNsSEZiM2NSYWd6ZE0yVENLQlBhMXo1c2Rh?=
 =?utf-8?Q?PptXnyrig4pjgrdpUkaJQWGIyBFP06B3bPkrd?=
X-Exchange-RoutingPolicyChecked: j+sClgf1ZfpuIPFzpGVNHNvokmXzWWZ1XFqjOyL1vbngqC6WzOgba9SZwhFf13Y01heGlwsxdVOvmCZjLc/MxNoIyjWaXw64KheGW9VA+az/NYooY6tRQcNZG0CdBcYCl3dDSqhQxYnDeuXRa08nw+S+UheiMjJfdKbAuF0kuJKgGkxkVVU8MYGPe92Rs2+aGZlROnZkap2AUCGLjr6eQfKrNQXqc8Jnl/2R62/8I8uxSQNoLzp0yXmB04gf1dn/cRtd3M9B7fFw5OhkUxrfLI2QU3uPQP0C6nLVe5DCha0KeUMoi5FMWl9WjNWnGFHTRk2y9dQbJfrA9YnBTEeOPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff225cc-3596-48b7-b31e-08de8e8606a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 17:59:02.3375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcH4owTdTBS5Affv0zFwNZA1gs8tsCxFwHGkVNCtbOHoxNi3ZxB++4fNf2QQrfwSbobwhvbWSEmC6Cv3Yaa94nY2PabY5gCP/BcfvgpeWCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7351
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

On Tue, Mar 17, 2026 at 03:39:10PM -0700, Ashutosh Dixit wrote:
>Extend enable-disable subtest to validate the new feature of reading after
>disabling OA stream.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> tests/intel/xe_oa.c | 25 +++++++++++++++++++++++++
> 1 file changed, 25 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 387f29535e..6a602a014c 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -2774,6 +2774,31 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
> 	get_stream_status(stream_fd);
> 	igt_assert_eq(ret, sizeof(buf));
>
>+	/*
>+	 * Wait again for number of reports specified in
>+	 * DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS
>+	 */
>+	pollfd.fd = stream_fd;
>+	pollfd.events = POLLIN;
>+	poll(&pollfd, 1, -1);
>+	igt_assert(pollfd.revents & POLLIN);
>+
>+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
>+
>+	/* Ensure num_reports can be read even with disabled stream */
>+	while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 && errno == EINTR)
>+		;
>+	get_stream_status(stream_fd);
>+	igt_assert_eq(ret, sizeof(buf));
>+
>+	/* In non-blocking mode read till we see a -EAGAIN, signifying all available data is read */
>+	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
>+	while ((ret = read(stream_fd, buf, sizeof(buf))) > 0 ||
>+	       (ret == -1 && (errno == EINTR || errno == EIO)))
>+		;
>+	igt_assert_eq(ret, -1);
>+	igt_assert_eq(errno, EAGAIN);
>+
> 	__perf_close(stream_fd);
> }
>
>-- 
>2.48.1
>
