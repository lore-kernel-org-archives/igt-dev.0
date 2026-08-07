Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13FCC5AD05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 23:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471F610E478;
	Fri,  7 Aug 2026 23:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaqXORw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75EF10E478
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 23:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786144919; x=1817680919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sQvu9Nc3bP1HaBltcwAtNVkyrOouVYhvjUiDNoKY9LQ=;
 b=NaqXORw9lb2aoSGH8OHey6y0VxBJvg7nVoLrBxK99Dl5toovVLCzoRVH
 2+VdHdxVFh47lIt9RfVt2iqRy0gS0jZ8wzmOhxNLjX48T/pawLlvMWmbO
 qxbUE3NIaP5CWqbPb0dm/hNpoLdEbkf/Z8V5cHa5pxGrzNF20sRmnwxwa
 kZfUw+eIKveca2h3QUQioJ8t3xPWGm0qtoBok5wrtjC1rZKuhABco29FB
 16aIMuUGeOn5jtatlRNuGwv4Bpyou7N6SG9U65ZuIuA3piTpdUMajrdMJ
 +bUms9vcbwxvW7j6OSDehZ5QDlN91S36jZLmRStpp1a8YdO82AFdwVvJa g==;
X-CSE-ConnectionGUID: RtAkggpOSiKq8ehF6EZCxg==
X-CSE-MsgGUID: 6vgcr8DZTpeibyFY6kSzlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="98272488"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="98272488"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 16:21:58 -0700
X-CSE-ConnectionGUID: eC+hD95nReeRqyKBfpM3lg==
X-CSE-MsgGUID: GPe5zUmqQneDAzXSlkwgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="265995983"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 16:21:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 16:21:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 16:21:57 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 16:21:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6W+tYoxGE2yjbHM8uSJ4NtRbcouOOfql9S141BZ9e74el4X6geCSQAz541Qe+3TW+Y6Mz1t3+N6aJ0FPD5FwYpAfI3wWzrrlxur4XiJv+xMEs07+1XrrGhoYBkqz0RSpwnWZ2duI6q90JvcxYsvOHNVa+bTXF3ICEZI23GXTsH9ixyBFv11xrAOBn5GMjm6m8aWAMWqywdNiYCnSB0G/7/wDV48OdW5cfa5PvTdPCDCWV32yaflDFYXpgeBsZu4JW3pSrcBB5fs6ohH5ZrKmeCL/gRgOzI9mwIWgcpx2Nxl/9gZAdYs9073EYwUJ0+2kHfL7SyP34RT6XCF1gavrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oadrh7seeizjkXt9C+/whSKim1oE/rlqOezN5Io2Yg=;
 b=NmmqoGIogDk1KHFC7AUcbpeXB3UmNjmOtoTbk1FOejnhveTrC0hZkKyjaCmxn2S9G/PsnEGqaJv65vEKX0b1qql3gJozDi6q5/mnAZhK9ATfdrbWVThN2m9tzV9w0ZQ0sNY+Oh97oxnuBOJDdXpF+dSNjVbEFNsqz9tW2aDzKZQYLl4ljU/PlCGbQ29NxBHso8RV53Hb2h6wcTdRDE/YFEmGZxcIegVe4MdxOPmjhmToG46KCHHiL4nz93gRGewWhL1ZJ7WlX8/Jgw2r530/lI2/iMKutkTCcpY1gu06590D5U/rvlpvBx6REzxjiezJFDly1hvQLGwU1H61xlfsyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA2PR11MB5065.namprd11.prod.outlook.com (2603:10b6:806:115::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 23:21:56 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 23:21:56 +0000
Date: Fri, 7 Aug 2026 16:21:53 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
Subject: Re: [PATCH 4/8] lib/igt_drm_netlink: add set_error_threshold command
 support
Message-ID: <anZokYJr2DxQZjWm@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
 <20260729121959.603890-5-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260729121959.603890-5-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: SJ0PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::27) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA2PR11MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1d22e2-7b43-40a6-f17b-08def4daabea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|10067099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: c0FvPSTbdoI3PYafe2n36xojt/vW6DgWKuJC3VPWPKXcdnMr//Gv9PXF8psUDomHKVtETjlwar9X5Li2fxne5P78UuC1LVe5qRUt/yVTkJtm0vLjAbdKBofZo4SBwldzBFZ7H/nWvdcdrRv6m1UBlKJODQMjTYJ3dZr0dtYmZR130aQ9nwSxRQy3bB6qnJol1LzeuLzoInCIy5iQX2neLXeZTs4CajqkmxJWF9j1UDnOmBgLqD+7ZpEiy0jqdUv7sEeaAwUh8l9QBXbqoVC70ER0Pjc6p4+uqjXhcbLf6dRADxsopWEzp0YBcadj/jRNHvS3VdPzIgi6PMNvSqF8nKCpEJfMhFzEB91JtrlaRsbk0NfgZj+I/wk6XmGZ4RhtWKOjK5MKIlOky8NPCLdvxj7e63FHRxmZdd7YooLliLjJGUQgIMFVnFUipzLliztSoIaRlzQqjzuO2m9tUHvNkV+AUxrVhymOGJCCpvBOHx1j4nmFin91j9l5we2FatKxmrFYnMUN0ie7CQP5f3XhwQX1ozgR4z7vNAL5YCzp0Pz9uU5U6LZnPZ5T4xC/0sP1/cGfZ0inbdr/TcDFlpsr0325UhnIaH++Umh1kq7kxfG9hLfNZAZtbin8rrffoI2z2wewpwydHK0xakVpnQ6KCWMXmXYkUi+knrF+cK+AGp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(10067099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU55YmRBNDhuMlEyc242K1RZNXNGNWJVL0hvU3VKQ3pwbnFYSmQzZ2xlckJL?=
 =?utf-8?B?czY0ZHRTL2NBQ3MwemFKWHZCR256VHVoWXFqSGRUZVBuS1p3blpxYjRxM1g3?=
 =?utf-8?B?V2lqQzBSNTNRVlljOWN4UlJSV0Y4aEVNbndnek9weURmb2dnd2JJMm8vVWRC?=
 =?utf-8?B?am5CNVlZcFFXTmRLTytZVGNoRDlpNHR5ektMdG9nRnBwd3FSK3BIVFIrWDhq?=
 =?utf-8?B?VEh4U1BUajlscytlK3cvWHJndzFDQWN5Yk1CVmNCY1U5ZnhiQWgyMXFCMGMv?=
 =?utf-8?B?OXAvVlpZNmxUZ0puU0pHejN6c0lGVktjT1EvRXJpcHhlR1I5ek43aWhFekd1?=
 =?utf-8?B?bzlKSWowUlJlOVNBc3I4L3A3aGlKR1IvZzFmYklnQzc0YXdzVmIxNkJ1aXgy?=
 =?utf-8?B?Ui9Za2FKM3FRcXBRTDd3bjd2Q1ZWdFhKNjN2VVdBU0lpc2tQWWV0aEhac2d6?=
 =?utf-8?B?NHB0cjVlcDNqK2lFS3FuSWdRbWZ3bk1aQzlXT0R6V0QyL2xZWVFQdVl1bGFS?=
 =?utf-8?B?RTNnSWtTV1NzcE9sT3V0c2lYZ0MwMGtMcno5dWswa1dEZVRYSnVsRy9NQVVZ?=
 =?utf-8?B?aHlRTmZhbTV6TytRS0N6T2t3aWxuSWdnMENES1JUdXJRQVBJWHpWNzRRT0VX?=
 =?utf-8?B?MzlnTDNOSFk5WEF2N3RGL05qbmNjZjc5VkJ2WktQN0ZreS9qc3Q0MkFLelI1?=
 =?utf-8?B?V0ViV0ZjTm91Slg2M3p4a2hrOUFjWk5IWjV2R0pPek05NU1rcnhiRVQxcXVz?=
 =?utf-8?B?QVZLZ3NOenhqc29wQm05b1c2SENxVzlzdUhESUI3R3lrUk10ajcyd0VKc3cy?=
 =?utf-8?B?VUMxV254R29PWDFuNGgxbEtWcTNWWmxLMUMzemVGc0p6NVozMWZEeVdsaGtK?=
 =?utf-8?B?a2E4bklJb2prVER5OU5GOXJCZ05SSHFJelA0eUl3cDRwVWRGelpUSmJIZGJa?=
 =?utf-8?B?aSt5RjNLYjF3Q3RDbXlOYyt1dEl4T045NjE4YzA2M1lzSlBJczR5RUZpMkFN?=
 =?utf-8?B?bXJOZGdoTEs3UjMyWmZDR0NSRldQcmZzS1hFRHl6V0EveHFoNlVlMmxCc01s?=
 =?utf-8?B?T0tDT2dUOEdIL3E1YjZUakptaElybWVKbHlMbGdhUkVqVnFKd21jYkNYZGxp?=
 =?utf-8?B?c1drUUJyL3k1bm8zVGVmOU5YUkNkODNNcHh4NkxNSnhOWERMSEFGVUJ3ckNC?=
 =?utf-8?B?cHArcTZuNm9nRWU0YWZiT0FDVTk2eVM0MEhPUGlvMEwzejc0R3RTeVNHUDNj?=
 =?utf-8?B?bzQ3VXV1Wm02WVU2N040U3l0ZEd4ckdZRW1QWEt0WVpCczNTajFxdGdpRk9o?=
 =?utf-8?B?YzVmaGpRbXk2SDEwZ1VzaVdHazVJRG16Tm9EeVNudGd3ZkFEVzMvMTE4NVRu?=
 =?utf-8?B?b0tXQjFrMDh1QVdLK2NGa011bnpjZ2R0YldpQXRVTXVMWG9pRzNwcmEvd0dH?=
 =?utf-8?B?NEVHWFZ4elVmbDlrR0huaHUrTGEvWWtXZWdwS0didkFQUE45SFI1TWVZRkp6?=
 =?utf-8?B?NXl1cjdxc0NJMVlaSUxrK2dwRmlHTTg5WTRRbXU2Zk16eFRNSDNkZXArVktG?=
 =?utf-8?B?TDNBOEwxWEZ3SmkySUd1YkFhZmdqODIrZzJJWnZYSlVLZXJWY05WM1hYbFcx?=
 =?utf-8?B?eXB2TFRQYlBUOGNUc09jZzBMYU9SOWNLTVlaSE44Z1VVNkJZTS9WeFJ6eGRM?=
 =?utf-8?B?OVFFV3lzTFQ5bFpPTUtocHM2WDVsVUl0NmhIRUphRHhHK29JT3RIRVFSbnZD?=
 =?utf-8?B?ZDVST3VzNC8zNTBYN0FmZU52Zlk2eDJkSVZ0akhEWlgweEc4UmxnRlFLaWkx?=
 =?utf-8?B?d2dzMUhLMmI2c0VvMGlNaE5rRi9rM2h0d1hYcHBQcVZkT3RBU3RLeCtUREZN?=
 =?utf-8?B?T3lTaGVCSkZabXJuTzZGT2FybjN3SVl6T25ha0JZd1g4cEd1S1RCcnRmczE3?=
 =?utf-8?B?M1lSM3ZQMDRuRjNKR3oyaTYxSiswLzlsaEJIamI1UnB3SXdnVTFuUDFYT1o4?=
 =?utf-8?B?eW82RWVFWkNrRkJDd1lHUlRkWUNGaC9lM3Z5YyszVnRKajhWWFdGK3l0TjdP?=
 =?utf-8?B?UWQ0TWdidWxLSVovWUdYTldiREVESEQxWDFGTlIwc1d6bzNIbUxXa3FwYzB6?=
 =?utf-8?B?RVI3c0ZvU3JvYldJMVpqa1dweTY4R2xnK3FiZHF0RjdnRlY3Zzk3QkRmdjc3?=
 =?utf-8?B?RFBkSkg5T3BNNVJrcWExdnJ3djBNMWNVOEZTaUhlN2YxTUZJVkFXZ3c2SEdk?=
 =?utf-8?B?RndzUUFoQis4bVJrZ3hDc2YvQlZHWHE4UW9JNml5K0pwVGx4STRGM3ZxRmJn?=
 =?utf-8?B?SHo5TDRtdHlhbmg5dXZRYUs4ejVBcHZ0WEMxUVZSejVCOWtNbS9TNHhwMGNR?=
 =?utf-8?Q?tQ5s7hMfWptCyGf4=3D?=
X-Exchange-RoutingPolicyChecked: g+2j+C2UHFt4KC+t1offXXUlq8R4mMxHzuGeq28r3w1XswtIph4YEE4YQyBLvgW3YI0l4FLOaWlCfP1zip4vCCaeP6S5U/DFMapJ4f7SyQpWyL+eZ7GwVAhQpLPQfH0YYVxyg+GRjF4yZNWkldATzSY0MD8u1/RJqL3FymHB72BnMVD7NWy4WOlcoVkJEJFU6EjHYT/cqneunw4maBRzY4whuMu5npYSzikDmNf+LnqWlpmr0bwCAXmyd8RXVDES7e6HdbidHXG6X+5s/jLWmrtsej9BetoyV7kWaB/q39AesZz8WXpEcPGB94/jLSmzU58t4W7z9l0fHrKwXQW2sg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1d22e2-7b43-40a6-f17b-08def4daabea
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 23:21:55.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0/1/hRBiFfdvj5+3ZYbtM3eKcwq0x1kXOpW8gP4w53Wrk2EJD7Ql0iqv/GKgE9bMdmQtlUlkzCvS6GKvoCB5EM9bEiyLG8gZIxQTLJkqvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5065
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

On Wed, Jul 29, 2026 at 05:49:55PM +0530, Ravi Kishore Koppuravuri wrote:
> Add support for SET_ERROR_THRESHOLD to set the custom error threshold
> value
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>  lib/igt_drm_netlink.c | 39 +++++++++++++++++++++++++++++++++++++++
>  lib/igt_drm_netlink.h |  1 +
>  2 files changed, 40 insertions(+)
> 
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> index 036660a6a..4738090af 100644
> --- a/lib/igt_drm_netlink.c
> +++ b/lib/igt_drm_netlink.c
> @@ -29,6 +29,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>  	gnlh = nlmsg_data(nlh);
>  
>  	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
The definition of DRM_RAS_CMD_SET_ERROR_THRESHOLD needs to be added in
this patch instead of the previous patch.
> +		break;
>  	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>  		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>  
> @@ -109,6 +111,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>  	}
>  
>  	switch (cmd) {
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>  	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>  	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>  		ret = nla_put_u32(msg,
> @@ -126,6 +129,16 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>  			nlmsg_free(msg);
>  			return ret;
>  		}
> +
> +		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {
> +			ret = nla_put_u32(msg,
> +					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
> +					  ctx->error_threshold);
> +			if (ret < 0) {
> +				nlmsg_free(msg);
> +				return ret;
> +			}
> +		}
>  		break;
>  	default:
>  		nlmsg_free(msg);
> @@ -238,6 +251,14 @@ static int validate_inputs(struct app_context *ctx, uint8_t cmd)
>  		return -EINVAL;
>  	}
>  
> +	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &&
> +	    (ctx->error_threshold < 1 || ctx->error_threshold > 16)) {
> +		igt_warn("Invalid error_threshold (%u) provided. "
> +			 "error_threshold should be >= 1 and <= 16.\n",
> +			 ctx->error_threshold);
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -280,3 +301,21 @@ int get_error_threshold(struct app_context *ctx)
>  
>  	return 0;
>  }
> +
> +int set_error_threshold(struct app_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	igt_debug("Set error threshold: node_id=%u error_id=%u threshold=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> index fae9b0e06..c44486ffa 100644
> --- a/lib/igt_drm_netlink.h
> +++ b/lib/igt_drm_netlink.h
> @@ -33,6 +33,7 @@ void cleanup_nl_socket(struct app_context *ctx);
>  int init_nl_socket(struct app_context *ctx);
>  int get_error_counter(struct app_context *ctx);
>  int get_error_threshold(struct app_context *ctx);
> +int set_error_threshold(struct app_context *ctx);
>  
>  #endif /* IGT_DRM_NETLINK_H */
>  
> -- 
> 2.34.1
> 
