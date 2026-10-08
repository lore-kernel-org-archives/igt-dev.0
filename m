Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5950DCA600C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 13:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B86C10E8A2;
	Thu,  8 Oct 2026 13:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SP9S6T8Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0176510E853
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467690; x=1823003690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9cJ3nOhh2uHOwkgp9X5S66KvVCMotXDHAK01pZLw/jc=;
 b=SP9S6T8ZGn4KwCV5+SiMm0IvtEJY0KCJxRnCwhFnnZCU1HPdx5fxSyU9
 r6SbZX5yBDn8w1e4+nWZo/B15AK9atjPtj7wdSaioOwZP/SZTEQngPzbq
 Byn8higSnvafYr+y0qViaqKFL7KT4nTTvcs/88igo8CAhDlDH+sdqNdqq
 h9Gd46tZ6Du1eVkEJ0XuOdgPw7FogatTeW5LG7kyEIYtjqA1COHqq8DZF
 KJhBt5smyDp0PqKAcCwYiRKjlV9BSnnBGP8Gj8q/hIwiqxhYcqXPBhxjR
 VswZoi45cpurOanUpZkTmvcg1pr5SRMlF8cNdZ8aqoua+xapGFM/yg7mI g==;
X-CSE-ConnectionGUID: R9ckue3eSaCMYObXD/Gz5g==
X-CSE-MsgGUID: wkegUBfGTEqJpzxMWhxquA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="261012"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="261012"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:54:50 -0700
X-CSE-ConnectionGUID: zXADuY8nRVKVV4i/LVWtzQ==
X-CSE-MsgGUID: K10V0f6iSluDNwztkrN7Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="165663"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:54:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:54:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:54:49 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:54:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udGdoFup1YtCG18lAu+20GkD/8Ru7gBU0Zng0z4kcGzgf5QVf8eyyQV6C95kpMCi79LNjb3zHbV95DRTe5KNO8ndgxpgXXPi1RzGLq1P8BJulN3wY07RHFh/RKlCuN+50zoEyjK27euCLCJ4Qo7GHNdwAvmCd64NQ26DkiTHfxJPxK5T28WGXrnskXGWbxdVa3kVCQfg+6gVz393Pzmv1c2QkJy9WIdKRo+juBl8Mp8o87m20V8fysKKdspTTM7Yv44y0774ynJ3FFd3VmyWHL1syoEyieu33uAAeQElCau982pNkYkT9ytcI3W1jMf4fxCD35yYLW3i4czj0nUdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2Ey0aP6dtnebajR6Y4RjtMi9LMTYanMSkgKYAIDTMI=;
 b=SfXbX+DCnXYveEW/EJieQxNRv9flODLmtZSFJu1cEHGJ/lJzApZYQ4JfPNR1K9wkWXkqhxQjqduWpqMl411lftndZ6Do9yRwjQ8xqp5wrEcXi2n4WBfnMeMMmKter/bMoNS2GWe5wOyCqb7G4OiFRdWp6zFyB/S3mu+ss3NytFACN5Llr3g7AuB5nCx8Z2lZqeywPochc0PAb5GOKKku0ymwdwNXUijnFSfnb+dalAGwniRSS9rScTcO1g1jRq5IWuHVHsxD6pnS6HN9ke4w4mD+D/g8qaF+/do+UmFVUp2N/AlmOEmGjl6yMC45nriYpSQ2yvyyxauRrCXi56TK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB352303.namprd11.prod.outlook.com (2603:10b6:8:50f::18)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 13:54:45 +0000
Received: from DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b]) by DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 13:54:45 +0000
Message-ID: <1beebf8e-a214-41de-8ebf-645c6d618a82@intel.com>
Date: Thu, 8 Oct 2026 15:54:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/igt_platform_filter: Fix musl build
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Bernd Kuhls <bernd@kuhls.net>
References: <20261008111435.25331-1-kamil.konieczny@linux.intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20261008111435.25331-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0117.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:358::10) To DS4PR11MB352303.namprd11.prod.outlook.com
 (2603:10b6:8:50f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB352303:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 18517b1b-dbbf-43af-e354-08df2543b5b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: cn1RjQm1I2KdunT76a844iaWo3OiflRe82u3+jqUCdjsrC1tERkH7GamGTdWlXEoEaAn7DMvKz9q8alqBx9IbZOLdXF2DyNSfgqUv/+nF+RHDMA3ZvuwheDYIRy6qplkBtrzsZWeWQojb5TvlpBj6rALCsB0dZR2qIEuvDL3jfGcGAeelCM0uDNNKVn7A7vQEq4oclSajjvbe5Kpz5iLSlV6CX+/OXLSPPtVieoTNZXvTVOx3dt1wNJg+tadFCz1scMp9EFifyAa4L8tPpk++4gzAJG8K78UhLQ72O+nRkHJmCBbkhSZrgIVHoe7TcG0JFZLhO0ZCSLk45b5jkMtXDvvcFZnXXwk7bV3lI0Q87V+4eQEtSBT6HdRofonPocXZSMQITtV9E274jS0fnstA9A2wCYyMU+Fl/DquCceSVHzYxhzRgeSb1xME6fEY9MvM8a5AAPZ6qZkJJPnpAu0sI50ok8E1D/k1MQi6nbGqaYbL/kOK29WJ82EoMcn58qwZwRWfBaOsMFsGvN6NqzwTIEPht2zqIc9lL/0jc049ts8y8VggZs7dR0F9xooVUy6m7o5wbWGHkwy9wkZquTsTvguD4gT7StkC7reIqGVYZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB352303.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M25TdDZEZ3NnbWdySGx3TjQzRnRYcXNEcjVKVFFicU9SRVZleWxGZlpPVXhO?=
 =?utf-8?B?YzRRMGdVdXZ0elhxNzFSak9SMDR0N3JjVWl3OUVoN2ZISDBETDU5QkJERWdK?=
 =?utf-8?B?QytYMC9pRmNKaHBkS25YU01xR2ZuOG9YV3pQa3FVMWd1RllqUFNEeGkyV1Jo?=
 =?utf-8?B?QTBqYVRBVHRBM3VyRVBhR2hpZkN1S2NGblcxbllNVk82cjMwRzN2VC9oclR5?=
 =?utf-8?B?dUxFTVJNcGNyU3JtZWtvM09jR1RTbnlKNk82SGhzZW9yRU94enpMNERpZ09z?=
 =?utf-8?B?Wit1THl5cGwyN0JJZEQ4cUZMSUVTc3lKVFpBeUYyWFBZNDFXRzhmcXo4K1NC?=
 =?utf-8?B?Wk5NeExjQUJmU1l5UWR5Q0o3RUJPT2thTUQ2STE1YWlPemxjM3pva3B5ZGJs?=
 =?utf-8?B?VHZiOVNZWWlsdmEwVE9ab1pBelpRZkxja0loaUtGN3picFFNRThpNUVzMm5U?=
 =?utf-8?B?UzNiTWhSL25KN0l3bjlLZUhrMXF2RTlrVldPOEgvNGFCT1Brd3NZWm1oT1JN?=
 =?utf-8?B?cG03SStFUDZZTXlicGJNeEdrcWxaNFFXcnlWdUZxODQrandPSGpZOUdoWlhh?=
 =?utf-8?B?NkJIQkQxWmduMytrSjNuMlhJcG9mcXE0blFkTXRzYXdZbXR5cEkrdjFXRHp5?=
 =?utf-8?B?VlFlZ1Q1Y05VYmxQYXY3VnhsUi8ySERhVjNOOEVMRDNUZ1NIT2llVzdoQTMr?=
 =?utf-8?B?V1JkRmJGTnNNNlBpLytOb1I5TmtiMU9JTEZrMUFpemJuZ0Yzb2xyaFNHaTRE?=
 =?utf-8?B?OTAwMG02V2pwN2F2aDdvMFZkNG14STJ0S3Y5b2NMS25hWTAzQXlIRjk1S2pZ?=
 =?utf-8?B?VTdab2lqekQrV29jTWFmNVkreUl6czV4NG1rVFhFV3ZJS3pJbHJWNVlwamx3?=
 =?utf-8?B?UEl0WHd0dy9EWWoxTWpvWDB4clBaN3pnd01QbWFXeFk2azUrODNacEgrakwr?=
 =?utf-8?B?YlRWdFMyM1ZYNTFGaXZjV1EvQm1qNUErL1NHenJaR20ycWZwS1YwOXVnY21F?=
 =?utf-8?B?REt4dVZKZWxSd0dNbU9DbjZDZkM3NngvUXZXalFsSWl3cnRpWldrVzZENmFo?=
 =?utf-8?B?Z25CNm4yZWVKMVYwTlRnVGdYM0FZWmdyQUg0RjFHYUpGTmlQa1psM3VhZGE0?=
 =?utf-8?B?VHZlNHZvcmRHeHcrTm5QMG42ZkNZS3pObWxaYzBiZGN3SXhtMHVyNFQ5aDV6?=
 =?utf-8?B?RUI5N3E4dFllVXorejdCSEQ0NCtRaFJ6RmJvOGNuZ1VhVURZWnYrSDVYU1Vi?=
 =?utf-8?B?UXFsMmJWdWkzWEtFSzRDOTVBdkpxTkViQlluNmQvRi9GU1c2WklhMWRBbUc5?=
 =?utf-8?B?K2FqZkVONmlhbXB4ZzRhamdIT2grZ2Z5Mk1DTWJyYi9heFlCbWxhSjBwT043?=
 =?utf-8?B?c0NZMWtpVGUvMStsSDJ4K2E4czJHNktJczR0ZzVQZWlNNTFFaTdJR3BLTlRm?=
 =?utf-8?B?N2N6QkRiZU5Hbk5vU1QzcHllQVNDV3NoUC80R1dTeUlEMXJwWkh2NkhTdkhr?=
 =?utf-8?B?eldrUitlM1FFMTlZNThxYWJBQ1ZFbTZpYkxXVzNkTlNUSVhOaitJcFREU0gz?=
 =?utf-8?B?b25OMUpvQ1RjSVB4SUxIUE5lNEVCdnRDdnhLWWpHOXd4elFFejZlVWVxSmxL?=
 =?utf-8?B?TGlrNGh5Wng5cU1pVFZxVU1jeVpXZXk2aEdBdENSL2IrYThRZVVqeXNNaVc4?=
 =?utf-8?B?cHhrSW9xbm1DTmw5OVlqWnV6YmpOTFU5M1VwWWk5c3pBODF6TkhOM2VDZnZU?=
 =?utf-8?B?c21oUnNTUEpnZ2tkYzRRSVpvVHZYWFpwYi9FUXZySGRFNTlad2IvTi9FY3FX?=
 =?utf-8?B?dnZtSXAxV2xwT2Y0clFFS3U0amtJR1NOYVN5Zi9SSGJnSTlCTVJBMGRhdVpV?=
 =?utf-8?B?UVl4Qmo3SkdQbEpFcmRmS09KUVRobVljcjA4Z2YyRExzLzVwWmxlSWJYdmx6?=
 =?utf-8?B?MmRCSVpGeHJXM2JuR3FMR0JKSFRLK1VpVkw2ekorZVlsY3VzRUdtVmJtR2xt?=
 =?utf-8?B?SkExb0dqcUNIeW9pU1Y4MHpvbWM0L0MrdXFqMFFwTDQ3RWpwRGx1ZzVjbUJ5?=
 =?utf-8?B?OFY2UUFyK1pqRC9YQ3pRYnZTbmdNbUZxdkN1bUhsMDR6ekxNbG8yeG83NzZs?=
 =?utf-8?B?MWxHQ2VxZ1VqQ3VmRkNZVVJzcXVaMng4SklqYVM3RDZCVm1PQXMyUG9YK1ZI?=
 =?utf-8?B?MllYR2E4dHhNYTFWS0o2d2s2bXJBNHp5R0QzcmNJaitCS1RnNEtScGxoSVBE?=
 =?utf-8?B?eDQ0dFVjWDhWUUhYUlM2UnZsTVBacXVzQ2k3dmxqSHRvK0I0UHRvYUJCdkRx?=
 =?utf-8?B?OTlxQ1VxRGw2VkFmM0Zya3psdk84QndUTzFLeS9ENnNtTUFFeGdQdz09?=
X-Exchange-RoutingPolicyChecked: 0l+tPTlq1FAuG9a2aozDBUVqfVxiRnrgdrIloBw06rC6WxhchITdLtuyGJ9v47CYAaXr77mJnbNaWFX6qjuXX92ugkhZQ/z2CPnmRnSp0sUuS3NzzzLPPjP8HCQ5IZnRqIcoUYwmjabEUtRUMipTFboDzwOVMvW907aBkAnl1sTGScwL78m3w4cOsRcc36vwc6hrRZMSJFVFXQPcHTaS9N1PntDlRaJKmG4IXev8AABukRf6WGuOrKuQmUHJ2zmKuvD087/p+B8DP7i4JHk+kCt0RnZv5KPu9IAeAIiJWQCyhlSnImFwoqXava0lWGb7Z8JLeq4rpKmbpviLy0Okyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18517b1b-dbbf-43af-e354-08df2543b5b4
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB352303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:54:45.2342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: newDw8aBdvJ3kWJzoFRDv+Wxstiq4ZdD/GalXEH6MY1I30U4l1pDYwM5mGKPpylMYtxirs5WyYMLEl1xVQyV1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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

W dniu 8.10.2026 o 13:14, Kamil Konieczny pisze:
> When using musl C libs, stdout/stderr are read-only vars and
> compilation reports errors, for example:
> 
> ../lib/igt_platform_filter.c: In function ‘igt_platform_filter_dump_to_file’:
> ../lib/igt_platform_filter.c:551:16: error: assignment of read-only variable ‘stdout’
>    551 |         stdout = f;
> 
> Also man stdout points out:
> Since the symbols stdin, stdout, and stderr are specified to be
> macros, assigning to them is nonportable.
> 
> As this function do not have any user, just remove it.
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Reported-by: Bernd Kuhls <bernd@kuhls.net>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/211
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

