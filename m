Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FB9C4451B
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 06:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1DB10E698;
	Mon, 20 Jul 2026 06:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ge01tEzI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9854710E129
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 06:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784528407; x=1816064407;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yy3zFApNSPJ59d9lZ87TI3EUPNy2Ez4TJSVjDZK0bvc=;
 b=ge01tEzI99amCZg4i3PWRK5no9b121Bf+uSiliHDvG9uHvAATvKdzLXl
 lV4ZuqcBGoh5qvsqWeox7wOYjhsXse7FojXw4tvlFVjaREwNKTaiU4heX
 WQPVymg6aDuTPkeJehMIPfHrPT+9vgzDHnQSif8PIThj/ABMTc3OzNqi7
 3Rj+hdEj69/0I59LQKWtW/VRAF/akhWjPBaKJCFxMD6Pj6ufCCFzZBFvb
 xf/3wCJRGxLX4eZwcigQwCxOUyAdcYbtIcWgyb45lkWxeaMXJRd1YD71C
 azQ265PDcxAep10noFAoNMDVhVnhigsTgUOfqOjw9QY7rdAUYAC05060X g==;
X-CSE-ConnectionGUID: +wzcCIErTR6INhuHIo1AQA==
X-CSE-MsgGUID: +3S7AUO3Qj6QC2wPxdtgnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="107889609"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="107889609"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:20:07 -0700
X-CSE-ConnectionGUID: kMuaL97nTZev6+Is/nZP9A==
X-CSE-MsgGUID: KK/cg7UmR5e+MitUEZN2tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="280643505"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:20:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:20:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 23:20:06 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.15)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:20:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDL5KF78aKcsIsDbNQjS6IDZMG9d0Gk1jworKp/EhU9jZLI6CU0AZB+cvwz9Dij/PpeVNbYEW5ImeSj6UZI0PIHbkFe0jTIPyLbSSZ78fjsRHJUFiM4f/j63hFmhl3rp+OYtNV1zzT4SS566wXCW9KJpsrjm5cCo7gaD8Y8VWvrsllP6utBjjM+eUxUvsEA6RrcvtExShfs9WAK21ZlFq6g9kQfVpnRKtv1/uvgF8K+ryzzyxGhW0052Yo5zmyJAG4y91Sz9NZ4kUuxL90znmCWLDkNlTNKfp3x04GL+lq5Z8Xgx8usv+xliYqt7Q6+o50XRYeJ3JHqvf73QaPi6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSYSGH2mtmKWM+m6EoHU2abLRgkVfdRyKR0/E29251U=;
 b=dYPPQjBTaN9IC6WT5wdF/RoiJN5qpKLrv/6B8HPpIXdpjz1teQM21FgII4Z45e78yafSqGns7nPdqqMAxSwK4x+dK20s47hGidwTcgGGU865IcNVnoGPguOGl94kb8VNsYkIwWbe/xRmHpfcjCjYoguvdRcRaTnAs1k1QlO/ShNSpiOCbNTFNdfKoQ2JREiK5BB1KPoFWzcUBXZ5LRxzDNB2bXP3Wgf5NQWu/9pHsVkT8rZKwyScpz+eSVvvvcjFdQ/Rlwm/vQVP+nhQ/xyvUbu24RE+hS5szGtQWhIu/toR94Tcyt/zow5ypcdJ9Dl9zf4btwIGmz9jzf8GwrBbzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB5152.namprd11.prod.outlook.com (2603:10b6:a03:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 06:20:03 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Mon, 20 Jul 2026
 06:20:03 +0000
Date: Mon, 20 Jul 2026 06:19:52 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 15/31] tools/intel_gtt: link with minimal
 sub-libraries
Message-ID: <y5h4yfs6zvc6lw5gljgf54m6rvbipw36fnnsff4337pqgkldvp@age6qsiijk5l>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <aec7b4d0d953275932e033af10e875e6f361a705.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aec7b4d0d953275932e033af10e875e6f361a705.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL0P290CA0006.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::9)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: bbba0b6c-274e-4af3-6338-08dee626ef08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: AzHDeHiVsVN0QW5RfnLXvgCMcSpKGiDZRVJSVJhJ6cs1ATqyMG/NenfhG6T+rhzwjtV7M7Yz4kCnQLN+cFPdUDkQEgiOuzLVyYhVrt8GJuHsPO0fsjHGTaGyv8sItuUkHX9wx/D2LMO/1xdho9elSrEWkn43MrY84s3WJ+pDPt7heeCcgNgYlYQrnIJ8+j1EsZryrUawh6j7XfXtoZQMm86dtHyme9bcYOO/i5pMIxSKFJWIotr0hVk+6vgbbMoKfvKDD4Lp/CwO/JuDZoYEOSKjZb2nwYp+WQdHr0badmSkvwyMq5gdbykMQliIWb2XAeVwXJVShZPLJDvwiBqoWpBW2a7bqJlS7B7204Mxbr3D+H43dz4hmpEsoBgeu0yPySJONTxqpYa5LooxR4AmS3qSCbePpCK0qDo9dLZ+QJzOZVFM5QtzEkYpkvgs5ouKNDQuGNAHKp+HH/Q/8UvqSk6ZnxeXzdGKfi2uKL8uBUx2Wp6EA4SqN74S1ndD6CyX0W8Mzo5MaO2+isBlaiwH/BJv5hyFe1fNGq0vr0XWqwKtfy6A6bbwPxLwnzjmdBZIg1su0PVTdlfA6t86Rm4DECbFhTAKYKuqLyCUfWeTjFpMO0UmoP3S4yQFF7843s8U2Pzlae5c5bQDDpNAhwTk3duDgFb0uDrJB8T/zOftcFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTcyZDFCaXI3YkxLT1R2ZUFMZEtTYm5wTXpjVmZ1d1l4MzdJbDZiQzdVaVBw?=
 =?utf-8?B?eHBWV1R3WUNBUFlJbkdBN1hMeFY5RGR1czdKOWRmNWp2cXpJVk8vbk10bEV2?=
 =?utf-8?B?UGt3VG1YbWZNNUx0RXdqZW11dDZDZnlJV014NkZuQTBaQklXR1U3aExrYkFQ?=
 =?utf-8?B?Q2dFSG1xbUROeWVkbFJhejZpbmRzUktsU2RYMFFFSkQ5YURCcHNVQ3VBcU9K?=
 =?utf-8?B?VHFKT2h1anNJb0dOOUhXZEkwVVN5UjI3NFR1NEJVOUNUdW9CSE01Z0k3MTJK?=
 =?utf-8?B?ZTJZSjd3bGdsS29mNkdXNEhlRmJHcTdPc05nR2szTW9ha0FxOXRlU2tqeFR4?=
 =?utf-8?B?MkZwcENwTzBsWHVIaitVR0JPT3pWREkralNlTTJaTkpaS2VjVldYOTJGc04y?=
 =?utf-8?B?dWdpS05NVVh4dnBtY09CTGJJUjVxSXlCdkZFczRrVWxrSWszNGhIanloM1M1?=
 =?utf-8?B?cjMzV0p5cHlwWnRHYUhLalJyMngxS1NrdDdVQzgveEh6WEdLY3JSZnF0ZTVT?=
 =?utf-8?B?Rm5xd0xjajRuL0E2UHVyaHF3aUMvT0F3SVMwRUczNU1WeURxc0tQWDUvVkU5?=
 =?utf-8?B?MUxCZmZHQVg0TmZUcFA0SEtGYWFyZkhhUWEwSXJCMUtadjlUQU84LytBMUFh?=
 =?utf-8?B?V0ZxcHNLbHNlT0ZXTXgyVTB2T0R4VHZRR0RPbmw0enRseXFKd3FKOVIydEZw?=
 =?utf-8?B?ZEJyMVAzSmxMbHZ6ZVFXRG52cGYyUTRMVzFCWmZFZDVzL2twRkI2cTlqdUtW?=
 =?utf-8?B?NzVmTkZuc2p4bi9qd0dFTUVOZ2J0Nm9VSU5pNW9tbHVLQVVUNzdJSTFXYzRI?=
 =?utf-8?B?VHhWTEdnalNIVmhLQ0gyWk9pa25zUndaTksyUE8rU0J0MUtqSllQWGtCTFlG?=
 =?utf-8?B?VEZFMklQNEJQaWxjWnJhWHhSWWRoOW1Ob2RPNjF1UlEwd1pBaHh1cENmcFFz?=
 =?utf-8?B?cG9TMjEzYXg3MUlkdlp0MUlrV0Z6U0MwSDJmVjRjTVdJL0hQTWxET0xDeE94?=
 =?utf-8?B?VHYzUGU2b1hRSkJjRGtoc3Awc3Q5bXZQbnRvVFhwbTYwa05DZFhnaWxEZnUx?=
 =?utf-8?B?WG5oc1hsYVlqa2tBWi9rN3FmVUxZNlUzdDlTd0ZTQ2ZuNmhJSUY4bkRqZ1RF?=
 =?utf-8?B?Vlg3OUEyRGpmYTh5eVk1N3VTMVc0TUF6cEo0TG43S3pOUjhYVVFPZFNUQXND?=
 =?utf-8?B?alkwU2U1QnU0T2FFckF5M2padjBRZzh6TUZGL0tTTForMCtyZkNnVEp1WmVu?=
 =?utf-8?B?dkZSNXdiNmxaMVc4T2QzYXBiVXd1STBoTGxCSEwvYk9oTno1TTBwOHFkaTE4?=
 =?utf-8?B?SkJoZTJCcVI2TlMwS3JXazFTVkpaNUdLUHIvbno3UGtSQ04yd1ROSHlQLzJ6?=
 =?utf-8?B?YVlXMGZvTk5LQnlDR04vZlRsUFhMOWJOc1BFUzFpd3MybDk2anFTWXd3T0lC?=
 =?utf-8?B?RmR6N2E3NWFZQnROdVNweGFjSks4VmtEUW1mbmUwYXhnVDByVHo4SEozYVU3?=
 =?utf-8?B?T0JOdnRSQjRrOFMvYnVGVG1IYTIzZlhFcURDR0hWZ002cFV2WExDcjBQbFhE?=
 =?utf-8?B?SHV4RGRKWjMyTVlpTjNyU3FjSElpanI1VXh1TnM5aFZ4aTgrVjA3S3A1RUlx?=
 =?utf-8?B?MEhYMzcwa00ySjlFN01RbFNvL1YzUHhxQjBkSWdxZnZaTEl4Qi9JMFFKUXd2?=
 =?utf-8?B?dFA5TzdNSDlTY0lKNVdQWUtBeWViYnVFanFyRm91Mlh1QjJPeTBoYm1jVllN?=
 =?utf-8?B?Ti9pSDM3RHJmWUNNY0Q0emt4U1cwWUo2MmozaUZ5QU9CUnloTEczU0YrTDlO?=
 =?utf-8?B?YVFPV0l6dVhiLzJ0Y2ZycUw1WldrdGV1NjFmSzJWYzRwTVdKci92UHBLaWdJ?=
 =?utf-8?B?ZWlYT2dWVWFaa1NKemFxTmJ6VDZGNkZEdHY4Sms1T01yYVNQQVhYUVV0a1ZS?=
 =?utf-8?B?WERybjQ0UDdpcVNLT0UySTU4cmUySU1xSHczdk5oMThnZFNKZFk1V2lXOTg4?=
 =?utf-8?B?VzhvbzVZbnhuZzZoVUdQR0hJcURONUcydnE5SGJCSmZKdEdSZHRtcjlXdHls?=
 =?utf-8?B?SjJVZmVHSUV5U1I2OGZRZUdjTGJTZGtBSTJLU3Npd21DQUh0ODhpZGdEeFIw?=
 =?utf-8?B?b3VMZE11L05zeU5nQ3lTUUIydEFYVGhyUGI0UkFXMkh2dGdZd0M5WVkrMzh5?=
 =?utf-8?B?RjdYY3VPVnJtMW1vaTd5VVdvQ0xOVVZQNXRMdVZpL0VGMEk0WFJJMEtxMndh?=
 =?utf-8?B?dGg1QnNJWkNyWnJNcVdGcnk5eVBad05NQ0Z5SVRCd0FwZERlSkt4Q0gyRXhx?=
 =?utf-8?B?VTQxRnkrMTE1b21hT2g1aStXVTZPdFBUeHhiM1NPQi9TSm9wQkt0TmZLLzBl?=
 =?utf-8?Q?tpb9Qv2o3LpqSO84=3D?=
X-Exchange-RoutingPolicyChecked: NN2VAN3VxMMFk1oB50jfEe1GdaBUN5f8uANDuEhvoij2lCRV6128/Lh8UgJ4NAxmvjbjE2z9rop7lGhawdf+llAge2YWK6nNqUOFMbcx4OTJF0yi+xJ8LLJF0ns799tLk49jhJp1Snx+gymQ47oBIo1SZPpPDvKzYGCtNNak+6EqHXxxjaJx9Ss+NzN2TF6kFa4LiFPcWtqdgtx2mP2TqqhhX2uC12XyTqChFNBtyKLhCazLee2sdKg5EZgqfP1/CNG1Z+KFiZRNnf/h/zIbadC+FwbXkezGuxiUQFDBGBPGiD5dNwcFp1XdXMmHLBJXJSMWjX70QoOmgXjDsvzR4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbba0b6c-274e-4af3-6338-08dee626ef08
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:20:02.8064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRHITUVfsEaI6GtK0YBiHStPmFTpiBH12TwfgPqWG2YC8AXvp6siGId5w+8XT5fTMenJvpARIzqxzrmgHalkQWBfhluF3RKwT3bVatC9wS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
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

On 2026-07-15 at 14:15:25 +0200, Sebastian Brzezinka wrote:
> intel_gtt only needs the chipset helpers plus the small tool stubs they
> rely on. The full libigt.so dependency chain is unnecessary.
> 
> Switch to linking against lib_igt_chipset, lib_igt_tools_stub,
> lib_igt_drm_stub, pciaccess and libdrm.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 8eb346321..a3fef87a9 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -25,7 +25,6 @@ tools_progs = [
>  	'intel_forcewaked',
>  	'intel_framebuffer_dump',
>  	'intel_gpu_time',
> -	'intel_gtt',
>  	'intel_guc_logger',
>  	'intel_hdcp',
>  	'intel_infoframes',
> @@ -75,6 +74,12 @@ executable('intel_stepping', 'intel_stepping.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_gtt', 'intel_gtt.c',
> +	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
> +	                    pciaccess, libdrm],
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
