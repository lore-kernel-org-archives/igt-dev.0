Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A964CD8CB9
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 17:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E808010E594;
	Tue,  9 Jun 2026 17:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6TuM3UU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCDB10E594
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 17:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781027481; x=1812563481;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zJB54zuLRM/yCu3YJwBB9Pk9+hoKTyJAzpeWrNQYfkk=;
 b=J6TuM3UUnWe/r8kx544eI+bOBm957yxz2xrLLaRfvlh056dy/m4QQrov
 sST8bWfHXb3mBOQgTs5sAXOyn+1J1BGgCVDzt+dP1xk+HIY5+OznqTj3F
 W5U+qftd/xRHCSdSua5QGOnybSZD3VHAnCngR9GqQeqmKacroTvpxAneO
 oiBBMcHpsj7uV2bIjQ9N7wLOl7Jf4SP059HPK9ztnDxDMhg+N3jflhi13
 RnCrebgZbQYCC/ejyrGrRnTEoHvi6bSWACuoFsxl3yndnWdUan34VX3Y2
 DyQ5LHQF8/sE7ro/H8fXezEMVDQwyEEVpFrVm5TDm147uvd/mMvUN/j6h w==;
X-CSE-ConnectionGUID: WxfOd4U+SyKga64Mkm3JrA==
X-CSE-MsgGUID: gKtc0hG8RbysaEsqVO16bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85691131"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="85691131"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 10:51:20 -0700
X-CSE-ConnectionGUID: Z5ok1I3iT7mI2Vh8E2U/bA==
X-CSE-MsgGUID: f4KjKovYTOC/FdPFEoLVpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="243462996"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 10:51:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 10:51:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 10:51:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 10:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqmy2n4gIYE1YBnTn8sRyZ3nBC4KV3m2qnrtarPnbZWPPi1bkA5cf5BX05+Stv2wYhi+m8dkJqQc6f8Dv2SLCraxbS/jev+LvEcV65SXKt/UQ7wpSlZaA/OS2Fn8KUt6p0IeNJFPZGCJ8WdRTyS6AiUBISrCa1KfqYRrsO96NFt98CueHNU/j5piKXzAlhRhagkYhaXDO63uFuZhZNoFqjQA/tMWybMS4L7hK5KWrz2zb2TOOS9q2DSoc1EEYBXAo38eD4EZab9DwnkfvGkPjSKqIoRJEjkPWjv8I9lPAg6lzcVEtKUVKJ2WrYJDuFEIqnCI/uk/jQkSHRlXKioB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em1Ya0rLTnNFL6vWNVmSVHF1ftbtIoPzOj2sHLqrwco=;
 b=zV6xCzj3JfmRRYOJUeV4XztwiVS7xpsXmHL0llNkPO+vWww8m3pwkr9waaR9rmV8YsxByyixW1uBreyF9mlYgqqAGk/O2Lq9zx/f5fPtd3muDz9QkutSGp9CYqeQd9SybnmRbqRUxrBVrkT5mdR0wvR1v8p/IA4VVVnA0sThnfnNx0Ypvc8nKd2l94CP6vnZuf5gczbP3WMDNMfBcvVrm1n+PkU4BJlmWJhI9ptRXvzanjd4pr/lOWk7gnIHRbU3/P9rPNc4wo+P/0Qy1VPWXsZdmxzlJ52iP8sgMBcCj808/7ELQwMoaaE5tccg43YpzvY2i3LS9a6anBY39FcRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by MN7PR11MB170846.namprd11.prod.outlook.com
 (2603:10b6:208:5f0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 17:51:16 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963%8]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 17:51:16 +0000
Message-ID: <18325ddb-1d87-4bec-bcd0-64686805d231@intel.com>
Date: Tue, 9 Jun 2026 10:51:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: replace libprocps/libproc2 with /proc-based process
 enumeration
To: Jia Yao <jia.yao@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260603182801.900747-1-jia.yao@intel.com>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <20260603182801.900747-1-jia.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|MN7PR11MB170846:EE_
X-MS-Office365-Filtering-Correlation-Id: eba70fe8-1f27-424c-0954-08dec64fb413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: hOZ9Z0wRgpcPXTOXZiFR5UxY/8gdrDE6Fmk8/CtIby3o0y+YP525mP3Z2+z9PWnvdJHJTsXYGQjsBzlsc4j/a9xERY6EdiQNQon7XYu2TJAFAVkF3INhPjCbTrQOtBOYGobwY93CgxV1zjX6xDZo8oPjsRguvZHGFbR6BbOoumWpIhCWKp8SnRU/0FKqcr4ShJVWHCYoZyvy/pC8iHjba6qH96kET+ZwpvMTl7YcEov2R4uva+fZyj4gNEz4ghZladI7kp1RpRfMVPBktYl+ghZw3ZjcIEZA39eEHjec5pT0j2+H6kOh43mW6agcZdljtGNSsjMF7unkD6/BIx1mcvo1KCHb+SGh/silKElWYfO52sAQB+56vPgBazVJkoNqrsdvm+zhCNx2NO1A8cOECLMuqVfEn4Chebgs2zwVmwxasTRymqiEBYutK1AQqybu7aMV/R8Dwa+iUii/rADDC7JkUImIbs+05pGtv0u23wRjwkJoZIW7IiF4kfvlevYSffOSUTNaLeBqXZK03m6jGulYIGrvWqjOgSBx/ZBH6TkSluaTLEZkXmselfSSSmSkAodLnXe9jnOKGzQ82DHwo9x5mY+HYzNuDTVcZ3UPLYa2J9IB7MunMrTjyLvfuWiy6M1ZOr7g6YIm4Ha7TFfqHhAreMFhEf07lXnjiImbpWi0qvOLaVtwYuJ63tN5xmqI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkFyM1lQVjVQNTEzQ3NtQmJtN2FveEkzdHR0TVVPTEw5c2lCWGhidVkwRTdQ?=
 =?utf-8?B?eCtQcTcxUFdlaHpWWTNrY1h2R251ZXNzNUNjeUluVTA2cGRZbEZpcGkxc1JO?=
 =?utf-8?B?QTVsMVRBUCs4Z0pvcnlQaGE0bGFpTnJCdDlORU5OYWJLM2lEeVhDblpOSy9k?=
 =?utf-8?B?LzBOWkdPdXhHOEw3cHdLbUQ5MjhTeXVHcXNnRWdYTnNibjMrWUVKZG1nQ25O?=
 =?utf-8?B?Qzd0VFVzQXBTSUdVNHNwckZseHl5eWp3SHQ5T2M0bExHNTA0ellWaU1TRXgw?=
 =?utf-8?B?YnB6QlBDRmdaZ0NUeTFPOHcySGRYa0EzaGxrVDRMZnNrMXJnUnkwU3hJQ0c3?=
 =?utf-8?B?bWd6dGgyMGNaaXArVjlSb1N0azJrYXpJbVZmTWNDZERORkkrT1RPSlh1SGJw?=
 =?utf-8?B?TFd3dkZZT001bXMwb0VwcG81TG9CdVV3d1RuaEZoRlZBREJ3R2xnQmZiSTNX?=
 =?utf-8?B?cVo1S1RFdW1pUHRLakNFRDJMVEtqZ1FKMTRpdHBiY244ZHlhU0hRc1FpTDFC?=
 =?utf-8?B?YStTSnkxeHFiTU54d3BlM3AxeHNLckUzZkVScjdKVnBDUWtKUXQyakNiK1dX?=
 =?utf-8?B?QncwaHRwdWpIaUxxMGVWQVZmbDZKN3dra0tPTEI3cEJtVEpYenREb3BnVXlj?=
 =?utf-8?B?M0NESW5iNDAzRW1MS1NOdk03VG5HbzljWWNYQXVJNEtQbUo5NlJBWXdOS21O?=
 =?utf-8?B?bGZ5RU8zaExYQ3pMRGtqVzFTQzl2MnphRUtRelpSeFowZ2V6Z3UwTFRvanJy?=
 =?utf-8?B?NEQrVXNKa3FnQTdDU2MyT29iVjRHV2twZ0QzVXplbW8wdDRtZ2d0NTBtRmR0?=
 =?utf-8?B?N1llZ3U5dlpTTmc0TDNsQ3U1YXE5N1BMeUVrRzNITVZpT1NFZ0NHbytTQ2ZW?=
 =?utf-8?B?UWFHR2lxV3V1aWh0UnV6bWt5N0FQdW5WSlQzdDhzZGlneWViQ2pyNlNGMjlW?=
 =?utf-8?B?UXNNK0orZTVncHNENHpRVmV4NUozRDMwYnBYaElJeFdNdzYxaXFoYUpOTlZy?=
 =?utf-8?B?dWdyT0dkdU1TcEx3Z3c2QUhnU0o3Y0hZK0RoY3NybHhOMzdscjdyOC85c0hk?=
 =?utf-8?B?VjFrVisrcFJycVo4QXYzeVNlaWpuT0JiRzF4SXhEZTNQRzNXUFJqREpmSlBG?=
 =?utf-8?B?Wm96REk3ai9YblJSTnp6clpSOTJ1eHAyekNYVExqNktwWWdxM1ZjMWF5Wlpw?=
 =?utf-8?B?VVdFV1JoNWdaNU5oaHhFM2dNRThXMkdJTVUwbExtL2FycjU3K2ZqU0J3QTA5?=
 =?utf-8?B?NUtrcG94VDUxcXpVVit3L2ZsUklid05YUGYwdWFpWW5pZXhoRzNyWkNsbGdl?=
 =?utf-8?B?dWpWKzAwbHdZN0VIN0d5aVE5ZDlwZzUydU5WQVVHZ0t3WXUrdTRCb3JMZmNy?=
 =?utf-8?B?cnlrT25qNlFBbzNheWJINWRZdm1JL2ZWSVdpQVVYK0lQRWZITmE1N1E2amR4?=
 =?utf-8?B?blZKWEZaNXJ3M0J3eWpkRVUwb3RoUWVibE8wK1VmVzFEc1VZZWh0MVJkbmJl?=
 =?utf-8?B?ZzN4Q1ZWNVhMQ1cxcGZNcXpXbExhMjltYTYzYjA4djNEOFJVeUFyRnRrUG02?=
 =?utf-8?B?T05CYWlQbDV4SUN2Y1pqWFVxT29SK056b0ZLNDB3bW00ektDTUV0bXJhYXB3?=
 =?utf-8?B?Wk5FbGdrWkpXK2dXSGVzZzV2aVB0Y2xERkRSSWE3RlQzRmh3OFRVWVZ6QWlO?=
 =?utf-8?B?SFp6Nnh0UjRlczlyQWIyRVNhMHVsNE54aFRGY29SY3FWd2laSkdNdlU0OFR1?=
 =?utf-8?B?VXVNR09UNGpyMTgwSHNFL0Z0bEVTVUIrUGlTRWNhS0ovUmpLQWxQdXFQN0wv?=
 =?utf-8?B?cG53MFdJSFFiR0dzeWRvMlpFSllRRXQ0bVpRS2hhWlpibnEwZ0o2WGo2SHQx?=
 =?utf-8?B?OSs1eDVmaW1WenBReVBSMDJoK1R3RWwvMjFMVDhSSUwwTXJIZGdiMzl5T3NR?=
 =?utf-8?B?SGl4RVFSQ3JOa1ZQMkhUT01UZm1Ga0cxTlc2MFllTGZBc0MyL0E4Y2dJTkRl?=
 =?utf-8?B?OXVKekRjR0ZNWkNhZ0x0M1E5YjhJUDZJOHBEb0c0MTdqNlNkS2FvTXo1cHBY?=
 =?utf-8?B?Qnk1MmZUbE92ckE1WlUrMzJYN0YxcU5Gd0JjN2ExSzVteXdncGtuS1dZNlBi?=
 =?utf-8?B?NE0vOEdGY1F5SHRIenplSDQ2aDRhT21SZFFKeE9Raytnc1Zqenl1ZkVDMVdj?=
 =?utf-8?B?YmpRd25vOEIxTG1QS2tKMlpTUlFnMmJQYUppdXhLOHBEUWFDeEl3MEF3c3BY?=
 =?utf-8?B?QnFwWTluUU1HUGk5Wk1GMWZmWEViZWFPSmc5b1ZOVzQ4Sk1WNi93RW5VWGtu?=
 =?utf-8?B?ekFRcGVnL0JDcXpjNlI4MHZJYzN5MkUrdiszcFVrQjhYUzI3Y3VEQT09?=
X-Exchange-RoutingPolicyChecked: W74qL4AT5XMGowrxG51qWZ/ZBMJxoElVl2JcN+hXCLqDzskOjAdwD9ks4RTDIdfxpYHn0b77ZsxGXXVWTRPTwqu2gY2TklT+zzvFBOqUkiKUj1t9EFLzGjj6TX0M7Q7xXqN08MWJGrwYXuDobU+8+8DqmhLECXSbv0vQH/R7WQbQMlOJmgpRjWH3SC3FQtLrtbgAiNCJADPsoMJYne5dE01K2EYk2tnivKfyDuKau1GZXMHwwOjUmUCywhVx89frA7r3m2o1edj4tt9h4SptbQuiUV/oUbPpxTi6AM7Qr1et7hIIB28ZWHkEGs6t/HkMv3D0jl9jjNsXIaqOujArgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: eba70fe8-1f27-424c-0954-08dec64fb413
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 17:51:16.0773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/Q13E6bwS3LAw3U4dBi78QC6pEMasoeg/Bwu3nhNCtF/5dhfVBo4qwg1ChovR2BCNVQ32fmJ6JZWQ8WGlFCGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB170846
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

Hi Jia,

LGTM

  Reviewed-by: Zongyao Bai <zongyao.bai@intel.com>


On 6/3/2026 11:28 AM, Jia Yao wrote:
> The previous code used compile-time #ifdef HAVE_LIBPROCPS / HAVE_LIBPROC2
> to select between two incompatible APIs, requiring separate builds for
> Ubuntu 22.04 (libprocps) and Ubuntu 24.04 (libproc2).
> Replace the platform-specific code with internal static helpers in
> igt_aux.c that read /proc/<pid>/status directly, requiring no external
> library and working identically across distro versions.
> The libprocps/libproc2 meson dependencies have been removed entirely.
>
> Cc: Zongyao Bai <zongyao.bai@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   lib/igt_aux.c   | 203 +++++++++++++++++++++++++++++++-----------------
>   lib/meson.build |   6 --
>   meson.build     |  13 +---
>   3 files changed, 131 insertions(+), 91 deletions(-)
>
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 87c0593a4..0d250ae2f 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -53,12 +53,6 @@
>   #include <assert.h>
>   #include <grp.h>
>   
> -#ifdef HAVE_LIBPROCPS
> -#  include <proc/readproc.h>
> -#elif HAVE_LIBPROC2
> -#  include <libproc2/pids.h>
> -#endif
> -
>   #include <dirent.h>
>   #ifdef __linux__
>   #  include <libudev.h>
> @@ -1285,93 +1279,156 @@ void igt_unlock_mem(void)
>   	locked_mem = NULL;
>   }
>   
> +/*
> + * Internal /proc-based process iterator.  Reads /proc/<pid>/status directly
> + * so there is no dependency on libprocps or libproc2.
> + *
> + * /proc/<pid>/status fields used:
> + *   Name:  <comm>  - command name (kernel escapes spaces, so %s is safe)
> + *   Pid:   <pid>
> + *   Uid:   ruid euid suid fsuid
> + *   Gid:   rgid egid sgid fsgid
> + */
> +struct procps_iter {
> +	DIR   *procdir;
> +	char   comm[64];
> +	pid_t  tid;
> +	uid_t  euid;
> +	gid_t  egid;
> +};
> +
> +static struct procps_iter *procps_open(void)
> +{
> +	struct procps_iter *iter = calloc(1, sizeof(*iter));
> +
> +	if (!iter)
> +		return NULL;
> +
> +	iter->procdir = opendir("/proc");
> +	if (!iter->procdir) {
> +		free(iter);
> +		return NULL;
> +	}
> +
> +	return iter;
> +}
> +
> +static bool procps_next(struct procps_iter *iter,
> +			pid_t *tid, uid_t *euid, gid_t *egid,
> +			const char **comm)
> +{
> +	struct dirent *ent;
> +
> +	if (!iter || !iter->procdir)
> +		return false;
> +
> +	while ((ent = readdir(iter->procdir))) {
> +		char path[64];
> +		FILE *f;
> +		pid_t _tid = 0;
> +		uid_t _euid = 0;
> +		gid_t _egid = 0;
> +		char _comm[64] = "";
> +		int fields = 0;   /* bit 0=Name, 1=Pid, 2=Uid, 3=Gid */
> +		char line[256];
> +
> +		if (ent->d_name[0] < '1' || ent->d_name[0] > '9')
> +			continue;
> +
> +		snprintf(path, sizeof(path), "/proc/%.20s/status", ent->d_name);
> +
> +		f = fopen(path, "r");
> +		if (!f)
> +			continue;
> +
> +		while (fields != 0xf && fgets(line, sizeof(line), f)) {
> +			if (!(fields & 0x1) && strncmp(line, "Name:", 5) == 0) {
> +				if (sscanf(line + 5, " %63s", _comm) == 1)
> +					fields |= 0x1;
> +			} else if (!(fields & 0x2) && strncmp(line, "Pid:", 4) == 0) {
> +				if (sscanf(line + 4, " %d", &_tid) == 1)
> +					fields |= 0x2;
> +			} else if (!(fields & 0x4) && strncmp(line, "Uid:", 4) == 0) {
> +				/* skip ruid, read euid */
> +				unsigned int _e;
> +
> +				if (sscanf(line + 4, " %*u %u", &_e) == 1) {
> +					_euid = (uid_t)_e;
> +					fields |= 0x4;
> +				}
> +			} else if (!(fields & 0x8) && strncmp(line, "Gid:", 4) == 0) {
> +				/* skip rgid, read egid */
> +				unsigned int _e;
> +
> +				if (sscanf(line + 4, " %*u %u", &_e) == 1) {
> +					_egid = (gid_t)_e;
> +					fields |= 0x8;
> +				}
> +			}
> +		}
> +
> +		fclose(f);
> +
> +		if (_tid <= 0)
> +			continue;
> +
> +		iter->tid  = _tid;
> +		iter->euid = _euid;
> +		iter->egid = _egid;
> +		snprintf(iter->comm, sizeof(iter->comm), "%s", _comm);
> +
> +		*tid  = iter->tid;
> +		*euid = iter->euid;
> +		*egid = iter->egid;
> +		*comm = iter->comm;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void procps_close(struct procps_iter *iter)
> +{
> +	if (!iter)
> +		return;
> +
> +	if (iter->procdir)
> +		closedir(iter->procdir);
> +
> +	free(iter);
> +}
> +
>   struct igt_process {
> -#ifdef HAVE_LIBPROCPS
> -	PROCTAB * proc;
> -	proc_t *proc_info;
> -#elif HAVE_LIBPROC2
> -	struct pids_info *info;
> -	struct pids_stack *stack;
> -#endif
> +	struct procps_iter *iter;
>   	pid_t tid;
> -	pid_t euid;
> -	pid_t egid;
> -	char *comm;
> +	uid_t euid;
> +	gid_t egid;
> +	const char *comm;
>   };
>   
>   static void open_process(struct igt_process *prcs)
>   {
> -#ifdef HAVE_LIBPROCPS
> -	prcs->proc = openproc(PROC_FILLCOM | PROC_FILLSTAT | PROC_FILLARG);
> -	igt_assert_f(prcs->proc != NULL, "procps open failed\n");
> -	prcs->proc_info = NULL;
> -#elif HAVE_LIBPROC2
> -	enum pids_item Items[] = { PIDS_ID_PID, PIDS_ID_EUID, PIDS_ID_EGID, PIDS_CMD };
> -	int err;
> -
> -	prcs->info = NULL;
> -	err = procps_pids_new(&prcs->info, Items, 4);
> -	igt_assert_f(err >= 0, "procps-ng open failed\n");
> -	prcs->stack = NULL;
> -#endif
> +	prcs->iter = procps_open();
> +	igt_assert_f(prcs->iter, "procps open failed (no /proc filesystem?)\n");
>   	prcs->tid = 0;
>   	prcs->comm = NULL;
>   }
>   
>   static void close_process(struct igt_process *prcs)
>   {
> -#ifdef HAVE_LIBPROCPS
> -	if (prcs->proc_info)
> -		freeproc(prcs->proc_info);
> -
> -	closeproc(prcs->proc);
> -	prcs->proc_info = NULL;
> -	prcs->proc = NULL;
> -#elif HAVE_LIBPROC2
> -	procps_pids_unref(&prcs->info);
> -	prcs->info = NULL;
> -#endif
> +	procps_close(prcs->iter);
> +	prcs->iter = NULL;
>   	prcs->tid = 0;
>   	prcs->comm = NULL;
>   }
>   
>   static bool get_process_ids(struct igt_process *prcs)
>   {
> -#ifdef HAVE_LIBPROCPS
> -	if (prcs->proc_info)
> -		freeproc(prcs->proc_info);
> -
> -	prcs->tid = 0;
> -	prcs->comm = NULL;
> -	prcs->proc_info = readproc(prcs->proc, NULL);
> -
> -	if (prcs->proc_info) {
> -		prcs->tid = prcs->proc_info->tid;
> -		prcs->euid = prcs->proc_info->euid;
> -		prcs->egid = prcs->proc_info->egid;
> -		prcs->comm = prcs->proc_info->cmd;
> -	}
> -#elif HAVE_LIBPROC2
> -	enum rel_items { EU_PID, EU_EUID, EU_EGID, EU_CMD }; // order at open
> -
>   	prcs->tid = 0;
>   	prcs->comm = NULL;
> -	prcs->stack = procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
> -	if (prcs->stack) {
> -#if defined(HAVE_LIBPROC2_POST_4_0_5_API)
> -		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack);
> -		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack);
> -		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack);
> -		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack);
> -#else
> -		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
> -		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
> -		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
> -		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
> -#endif
> -	}
> -#endif
> -	return prcs->tid != 0;
> +	return procps_next(prcs->iter,
> +			   &prcs->tid, &prcs->euid, &prcs->egid,
> +			   &prcs->comm);
>   }
>   
>   /**
> diff --git a/lib/meson.build b/lib/meson.build
> index a8d6566ae..f25ecd8b2 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -257,12 +257,6 @@ if build_xe_eudebug
>   	lib_sources += 'xe/xe_eudebug.c'
>   endif
>   
> -if libprocps.found()
> -	lib_deps += libprocps
> -else
> -	lib_deps += libproc2
> -endif
> -
>   if get_option('srcdir') != ''
>       srcdir = join_paths(get_option('srcdir'), 'tests')
>   else
> diff --git a/meson.build b/meson.build
> index e750f7a51..4def24cbc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -133,18 +133,7 @@ build_info += 'With libdrm: ' + ','.join(libdrm_info)
>   
>   pciaccess = dependency('pciaccess', version : '>=0.10')
>   libkmod = dependency('libkmod')
> -libprocps = dependency('libprocps', required : false)
> -libproc2 = dependency('libproc2', required : false)
> -if libprocps.found()
> -  config.set('HAVE_LIBPROCPS', 1)
> -elif libproc2.found()
> -  config.set('HAVE_LIBPROC2', 1)
> -  if libproc2.version().version_compare('>= 4.0.5')
> -    config.set('HAVE_LIBPROC2_POST_4_0_5_API', 1)
> -  endif
> -else
> -  error('Either libprocps or libproc2 is required')
> -endif
> +# igt_procps.c reads /proc directly; libprocps and libproc2 are not needed.
>   
>   libunwind = dependency('libunwind', required : get_option('libunwind'))
>   if libunwind.found()
