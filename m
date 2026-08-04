Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55FAC55822
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 06:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CD210E861;
	Tue,  4 Aug 2026 06:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TP91VEV7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDC810E85F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 06:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785823363; x=1817359363;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6cvKK6XQGiNYmnIGziEvPx3VU/L9x71q8+vhLZB74yQ=;
 b=TP91VEV7wWgg2xaSQCUkqwbCJAjn1D7RHBTlfks82sKmuKKOCex4KcQE
 yILYIS3HLEKZIMFEnF/oLXZ+k4vqUJkakOq3SL6552FZ6CNkZB5hhgJZm
 0SKBsrIJwS8vNLWjDw/YlpQ3Pn7abDAaR54Lism4YdiYa7eG/UwjzRET1
 UPTdyH4fD0gvhK6ePXAtB+AtIYkeibO2amyYRyIjxxIh0ABOZbywYNtCT
 A9hiLji5mHs3/nNDBv9T25TZ9H1qHSqsh6VMkfl1Dg0mFfy1s6aBpTKhw
 /pOWhP7/PuhGN4ylT838g+AToorNRbeWQQn8fA8IZSFxWJ+T4wF2Dxv5/ A==;
X-CSE-ConnectionGUID: ntUlUbstQDml8zGHA0L53A==
X-CSE-MsgGUID: QT3YUjBISKSNPgK4Q2Am3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86219666"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86219666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:02:36 -0700
X-CSE-ConnectionGUID: zlZy9Lk7Q6Gx5NLBPMEHPA==
X-CSE-MsgGUID: uxPTotOSSESnAXR6V8D4mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="266537582"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 23:00:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:00:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 23:00:49 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 23:00:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0opZXAuztkJrA6NczaRf0cYb97mE4FQFlr1glhWtCD5H5KuhYDTSqsadUt2xV6hlrNy+b8rsMSnfMcwxgtSZbyz95CozMSdTnPbOFgAfJxEYuRcsr2ceIMGiXdhGeeB9hPZwJnbuE7fve9fJUnPPEZPoSUgzsu35DGqfnipApaZOq2LrSvi8CBM5UDi//D0tb+sfrGSaaPIouXGYuO3LmtyDntkgttZMhSP2BC4FaH88esk2aaIyWDd574ghnbgauH3+EuWs95lPiaKbVx1Uyt26/qBXT4DoOt53Sq4k97d+Knd2UegPINsrpZAxbwVbSdmIwSqR+PRivJmaBi2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPv34nf08J0mryj/tPmZV7ZnIg/q8e68YDUTe6GzdhI=;
 b=ctnzI23OFVAvYL8eI5+EZNHlrJ0bQioA/JJI0w5I+p7I/i16llQDtYNjPzsgSLoGBx7FEUyue20nhj9Puvzv2Z2pd39Ud+XyfIhc7FI2sjOu5lYshjp5HyhljGbHiO4ZwJiZ+2AwgNUxD9f6KctsGSFn4Fry8+rPHegupQrhznQO/p5UBbzBt3nY6lViyzS5nw2Qh+wZz9Uye2kEiyc2m66ZRGIYWXk9Rtp5cl67wL/yvmlQQy3XT47d0EME70nWYPA7y4qtXVae88Y1jwfMvS9xAK+YeK+TKcVWNRbpT8e3a3/RWoJjUHE7aDcb2+MmoffZB4vvKaYJu+l2t6/S0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DS4PR11MB275037.namprd11.prod.outlook.com (2603:10b6:8:509::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.18; Tue, 4 Aug 2026 06:00:42 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 06:00:42 +0000
Message-ID: <58c1c884-1d08-44b6-9947-ad3a0a3079b6@intel.com>
Date: Tue, 4 Aug 2026 11:30:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_kms: Add platform-specific joiner
 exception mode handling
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260728060003.392870-1-sowmiya.s@intel.com>
 <20260728060003.392870-2-sowmiya.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260728060003.392870-2-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::10) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DS4PR11MB275037:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c2b6c1-3e8b-4219-7a38-08def1edb79d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|4143699003|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: T/vX5oZ7j+HjsGWdedxsC6JFqz+xlVEy4WWUYhRV+OjnqomV7G0dV8kMJt4/iBuOpONabHJbW+tMxy6xlsjo9/o7RE7EEPbrvGVaVVoTvj99EchnFugvb/h3OdNehMiWIY+UP9hZ7ZrQe8BVTgapa8V8xIDDuBalxCQyF8On8k0fsxabatqIhEsZKyIw+jWzzd9xiaGTKKEAF6CQyHNEj7xw6ukW1XzF3b/HLUphns8dL9gf/LS4uhXQT4yWZjiYfrrUlCmX9/VVPDnpyFY1EqQQY1wgErHabkv3eLY1dHqM0Z9Kzh4F6z02oIQAno1lJ6GsIVay2f8B9XuEzW7ba0zFSefwhDT210FMDB1LkXY4RthcBcwMzNFZPOaY29KAmLUuHznHJWjzQ3N1PxdxGQh8m/itEwcH/6vEO9WU6IJ0lHVD3yZRvT7XvV+pGbRUhgq36b2WL6BJO6pRiwLUVDrPv3ty2zuCJvTh/EyhxZOJOoOYcqTlHkomP8uWtLGpxQScW+tsEISRaKoXTbezsp/iqp90nfhMsn5+gPprfbmmrAYnkknUqb7NsQHLvogX4BEbzkg61w5c146vFaaOywrFEtufZ6fI1kozQd4rEHT0W+cGCVo677j1h61S2dcWKSIwrcexeJsZ7UI5gOPTqkxbtoH1jQO8babvLj4mubs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJYUXQvSnNCNlF0SDBHc2p4enZOek02dWRjcGV4T01hNHc0RzFyS2MvSjNX?=
 =?utf-8?B?aC9DbkZYQWk5LzMzNlNxQzZXRnJmb1V0ZVkrMWhPZVJSTUdpbk84U0YzbEsr?=
 =?utf-8?B?NVk3dGlUcWlMN1EzNzRSY3laVnNqUGRYbFYxalJtNlR2UWMzTzY2TDJ0bTdr?=
 =?utf-8?B?T3pEaXRkZjVycDdSZXpyYXZQU2dNTEFBY3BybUQ5MmpIZ3k0UHpmNnJFYlZS?=
 =?utf-8?B?Yjh3dHBycjVxbXZ1SzIwUVB2aFcvSitBczRTR3N2V1FjTTZaTEpUeWhiNjBY?=
 =?utf-8?B?ekpiOGZSczNicjZQMTdpd3VHdndYbW5JUmorQUdQR2FaS2FreExZWFg5TEx6?=
 =?utf-8?B?M1hpUktJcnVXMUxjTWsrY2g1L0ZSd3RrSDhmWXBCNlNpOTZ1WDZ2aXVpRFRo?=
 =?utf-8?B?eitjV1pJTTVuZnQ4dWhqQ2lKSDRQQno3S1NxRFY2N2dDdnFrZ2lId2lBeDFl?=
 =?utf-8?B?SWlJaWcvcE5BZEVGbGdjdENnOVJTS2F1UVJjRXZVcHhLd1Bkd1VDRjNQV0VK?=
 =?utf-8?B?K3VkUEdiM0pUZnVocWx6U1NpUEJrVUQyT29icUpxMERZam1sZnVGelVORXAy?=
 =?utf-8?B?OHhFQkVweDdFdWVCZlVOb3NmMml6SGk0bEFjaEdjNGZzYm9BZGorRTZQTWFz?=
 =?utf-8?B?VEtjQ3lOeVlaeWgvNjZJZGdLVmVLaGhKaXF0b2pnd1pVUUlWR3dUS2gwOXdW?=
 =?utf-8?B?OUhRdEo3VlB5SzhYandKcXhDSlRXQ1Irajlyd2VhQXV0R0d0RFpiS2ZFOFl4?=
 =?utf-8?B?bDREUmxsQzN4clJjTXQwSlhLUHkzUXpLdzhxOHEzUS9UdHBCRWpCaWQ3b2Yw?=
 =?utf-8?B?a2tHdXFhKzErdVZzY1JPZCtuVlQrQ244TW4xcFRpbEJ1Yy91cnJMRUJwNzlh?=
 =?utf-8?B?NWRVRUVCUFRLQkFFWVc4bTQvS2JPTGZ5VGxPQjNFaWZSQzY4N1B0NW5wN1J4?=
 =?utf-8?B?aGpBbzVsdUZBbXJ1a2hsM1FhaUc3QkVJT1ZUNEhueUZlMUY4T1pTVDNrSURl?=
 =?utf-8?B?QSs4V1N4NDVFVStzYlFtODlPSzBVSXc2TlhaRHVEZGFGcmpMTXI5SHhsQTQy?=
 =?utf-8?B?S3p4WEROMENUcWo0eU1Vdk1kVXVZWm5Tc0V3K3RQcDh2Mm1oOEV1dWwvMkJY?=
 =?utf-8?B?U1Zwb2VKMU1pNElhMTJ2VzF1WnNYQ1ljZzdWc1Y5Q0tUcnduUUtiMmdONEdN?=
 =?utf-8?B?S0NwWCtzY2h6dUpOOFI5TVBrdkVOYjVtOGI2c2FXZ25IcmxaOFlGYm5leVBU?=
 =?utf-8?B?Z2VUa1FMNjA3VWJIdTY4a2JDNGNUT0tEQjloN2Y3eVdhOUtOdGFzZFBWMkx1?=
 =?utf-8?B?SkNCei8rTERndmxuY3g5T1RzNW5UZGFlcnlvd09wNTU1aHlNSzBLd3o2cHRr?=
 =?utf-8?B?WmdUeUprUmI2VTBMV2ZET1hSODBtZFlCNG1jZjBGWWZ1bWVDanZkOFlXNEdL?=
 =?utf-8?B?bXNheW81YVFzbGVSWm1qbUsrK3lySkxveElrc2oxc21IOVo0Uzc0SzdHR2pu?=
 =?utf-8?B?Qm5QNXFZMSs0c2dzRzRNQ3BCOC9pVDdualp3YWhqQkpzTVZEc1VHWVprcit1?=
 =?utf-8?B?MGlIYjhic2Y4ZGlXWUdPd2hPa3c2d1ErakpkWlBGZmJ2T0RDcy8rekRzL2Nv?=
 =?utf-8?B?WndzS0o3anlTYytKTnhxc2l1V0dKQ0I0Mjk3OTNoTWJQUlRucksrdWRBV3Uz?=
 =?utf-8?B?THdoSnFUOTdLYmZ3V1hOV1ozQ2pkSlc5ZnF6N2ZPdGZpdTd4UEFtWENraE9K?=
 =?utf-8?B?K2tTc2FuZnNQK2p3amZ2eGNGTjVtUDVxaUdjREc2V3pRSWh1ZjNydE50bFZ4?=
 =?utf-8?B?TDUyeHg1bytmbWNaWWQyakhSeEVEN3BtTHdlY25GZFpxVGh0dkhubUowMkpj?=
 =?utf-8?B?YjdhMXB3TXdDd1cvdzRqaEExR1Z0Y2ZsY25OcFN5QlpFWnBXK1MwWHB4N1Nj?=
 =?utf-8?B?R2tXaWpNWEp5ck5hNlRNZVhTUnp5RGpHSDBjR25FN0VKaFkyZGN3UnJLd0tO?=
 =?utf-8?B?c2I0ZkFvZURXYmIybTlBWEcwTGlYdGdWUHlTRWxiS2JiZVZPUmVuRUxZVEs2?=
 =?utf-8?B?Zi9zamRsV2hWOGgyUElTMktyUkNtejNIZ1JaSCtCZjNKY0VIaXlQYm5zbDNE?=
 =?utf-8?B?RmhEeG1oZWdHamd0cUltaWxwSUVpNkxaUk9lckVHeVV4OE8vSHA3RnRBS0NH?=
 =?utf-8?B?czdYK1FRYlFVbGtCd0Z2dGduZksyOU90VlpGbVJqZGRDOU9BdUdQVkFoZ2w5?=
 =?utf-8?B?cm9GTDAreEtsT0lZM2tmUGNGZW5heHZQY0w3QXpsTFFpcWxhYnpnbngzdlIr?=
 =?utf-8?B?N2R0dTlPQUhyNEFBOFR5YURjUWtVdS9VbjRFNGZmUnVEMDlTQTRHUXd3UE1D?=
 =?utf-8?Q?cdGYz/2v6auGYWa8=3D?=
X-Exchange-RoutingPolicyChecked: UeRqA2NhZjY014SF/utvlAQN54GaXcmyz8bnY3qbAdMUWvFq2q9dCqVBMa8rv/1pSrLKUgFJ2c8imWVv7Xn1v2f0Q0+0DQb7o/74yiWf7LGvmFl/iZQDOhEt09CJ1gcvEIjKOw8FCmXJQi+VjCTGUo0tDGheSPYzAS9pjWJPqVgsuEPjelSoB3TrCOt5sBxc67qi2AUMia/SMc0Hau1hjldbB8xhDMJfkI/ZotlU0mJhUSHa5/Mf528fyqqhiDV8KItZRED9Nwp2TCGkU3t6nrpocJ6N1ifTbMCo4GiefIABmpO5MU3BWoSGgTZHv3dIFwbVKMN1QzURboYTGD1gHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c2b6c1-3e8b-4219-7a38-08def1edb79d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 06:00:42.5698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8t/OgyJOJrKh05FM2DTHh+GyLJmXF5x8NxNnElmWtE0SFVKc0vgDkIJ9QKT+vdmQod8bnLPEFHnGAZDZK+R4Q5Fkr0ezXLHdUnPVyxQHoATJXa5XSlf4PzRVRpQY1VgE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB275037
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

Hi Sowmiya,

On 28-07-2026 11:30, Sowmiya S wrote:
> On NVL (display_ver=35), a higher max_dotclock causes modes like
> 6144x3456@60 to pass the standard igt_bigjoiner_possible() checks,
> yet the kernel still enables joiner for them. Introduce per-platform
> exception mode lists (e.g. nvl_joiner_exception_modes[]) dispatched
> via novalake check in a new mode_needs_joiner_exception() helper, and
> wire it into igt_bigjoiner_possible().
> 
> v2: Replace with display version and add FIXME comments (Santhosh)

Replace FIXME here with TODO.>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   lib/igt_kms.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5dd4b0c14..d591e696d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7065,6 +7065,60 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
>   						   HDISPLAY_5K_PER_PIPE;
>   }
>   
> +struct joiner_mode_exception {
> +	uint16_t hdisplay, vdisplay;
> +	uint32_t clock;
> +};
> +
> +static bool match_joiner_exception(drmModeModeInfo *mode,
> +				   const struct joiner_mode_exception *list,
> +				   int count)
> +{
> +	for (int i = 0; i < count; i++) {
> +		if (mode->hdisplay == list[i].hdisplay &&
> +		    mode->vdisplay == list[i].vdisplay &&
> +		    mode->clock == list[i].clock)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/*
> + * TODO: IGT cannot compute the DSC bubble overhead the driver adds to the
> + * effective pixel rate, since it cannot estimate the DSC parameters -
> + * whether DSC is used and how many slices. On NVL this lets modes like
> + * 6144x3456@60 pass igt_bigjoiner_possible()'s clock/hdisplay checks,
> + * yet the kernel still enables bigjoiner for them.
> + *
> + * Add mode_needs_joiner_exception() as a stopgap.
> + */
> +static const struct joiner_mode_exception nvl_joiner_exception_modes[] = {
> +	{ 6144, 3456, 1413390 }, /* 6144x3456@60Hz */
> +};
> +
> +/*
> + * mode_needs_joiner_exception - check if a mode requires joiner via explicit exception
> + * @drm_fd: drm file descriptor
> + * @mode: libdrm mode
> + *
> + * On some platforms, a higher max_dotclock means certain modes won't trigger
> + * the standard clock or hdisplay checks even though the kernel enables joiner
> + * for them. Each platform has its own exception list.
> + *
> + * Returns: True if the mode is a known joiner exception, else False.
> + */
> +static bool mode_needs_joiner_exception(int drm_fd, drmModeModeInfo *mode)
> +{
> +	unsigned int disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
> +
> +	if (disp_ver == 35) /* NVL */

nit /* NVL * / can be removed as disp_ver is self explanatory.
Rest LGTM. This can be changed during merge.
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> +		return match_joiner_exception(mode, nvl_joiner_exception_modes,
> +					      ARRAY_SIZE(nvl_joiner_exception_modes));
> +
> +	return false;
> +}
> +
>   /**
>    * igt_bigjoiner_possible:
>    * @drm_fd: drm file descriptor
> @@ -7079,7 +7133,12 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
>    */
>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
> +	/**
> +	 * FIXME: remove mode_needs_joiner_exception() once IGT can estimate
> +	 * DSC parameters accurately
> +	 */
> +	return (mode_needs_joiner_exception(drm_fd, mode) ||
> +		mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
>   		mode->clock > max_dotclock);
>   }
>   

