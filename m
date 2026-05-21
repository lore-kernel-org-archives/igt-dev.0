Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81C9CD4F5E
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 08:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B1210F250;
	Thu, 21 May 2026 08:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlG3QWOr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7B110F24F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779350465; x=1810886465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wj0rNjNj9ZTVffrXWJHbon1n00/lYQQGVBpfd3l/8/8=;
 b=WlG3QWOrqHa125/tv/+AGhLHJHogO+8aYccZX9hZMl8YSDCb9h2fj+6K
 rLu4pa/nk2m3rffJR+1Std31okpDW79Iat8w+dVA4r2T3+BHiowQxpnOY
 CxHwjddGaptBFJYBheTS99SKpwhnX/RE1sIp/rqJCtCQ1s2u2JrKSwu9d
 1+nVg4ps1Mk1FaVctFo2EpryhXMGsgWcOBhc0x7BymmuKD8Uuo18VgYaA
 wgkzwRWu2ysY2EI4GzkOrHmFgEqrO/YQqKWaKW9QvaJqYTmGBdZIciNx3
 soE1QSLDmfl9PcG6r1mtToTjJWKkJ+tGrWfHWdJjdUhNNxMz8fI8beco0 A==;
X-CSE-ConnectionGUID: Sm4WQU8tTsGho9gPtLKJVA==
X-CSE-MsgGUID: O6OnySPOTY2jyYkUYtYnsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80297158"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80297158"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 01:01:05 -0700
X-CSE-ConnectionGUID: Aiyh+YhVQ/GOgUHc0Zl3lw==
X-CSE-MsgGUID: Y87o3TilSemCW3HxLXi8ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="245449126"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 01:01:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 01:01:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 01:01:03 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 01:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8bk5+a9XNc45HS6nTZxIkgqKUhK/rCiay4KpJgQQ3AcFaIMtf5fQ50tgXzhokCcZ8dplFFCdj9t6agQirctzPIguyM119dzOr4N1w5LrSar4gQycXXKNAT5ixTDqTrXTMpcoO1KpOPsIu0PWyxyAmLtYXLsX/o3DRhfK6+yGi9ZexinC8jGD4SW34CU21QN006dBGT2jh+Q5IFlymCrbbIhxPkiOaEBcqPbptBKns6BJQRh5HP5EJ3xrwnXYR/dq0t+hpJhl21Yb7EYXh011sWMOshG6sQRV1fXcoL2l/Sz3Wq+1NuUrerCMHSv1Q0AyGC+rUBU/lqbcZXhOzKH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSxYMeR8M+URUPqdl4mWSblf3rIUW9NhoLllE/Z7GwM=;
 b=XxeSqOs5RSJjcn3A0Xgyo7OET8CLdDDnsyz7BOiJtu2wjOEGoWUqX/08G3egDpyauNi11jNL0aaGiSl3C/ZIvAbF8jdL5+Kg6MOPT8hpp7S98Tl/Js9FCMYq0oTdmlCvUs41P73r0L+SaIUxRkCH2Yb4nYRyud7xJPNFBxYwgE/mUQskUVNdLvqauwmWT/LgT1abnL45iNkl7afvzwcUGDdVyNDhC/RL1u1clWP/0vvzrt2xRGi4DTeLh4AUWzWGN9ZuoHXUptnNSGFirAL/bDBpWmsR0pUScYSdVscZyDVrXfqUnMAl/qfZ+m2Vgxlvs5m2cBAYFZOZn4Z5aN2tZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CO1PR11MB4978.namprd11.prod.outlook.com
 (2603:10b6:303:91::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 08:00:58 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%5]) with mapi id 15.20.9913.009; Thu, 21 May 2026
 08:00:58 +0000
Message-ID: <36ff37c6-2880-4f57-9913-525fa5fc7f7a@intel.com>
Date: Thu, 21 May 2026 10:00:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] lib/intel_batchbuffer: intel bb copy data improvements
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::20)
 To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a7fd9a-7e47-4882-d919-08deb70f179a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 2Dy8K4AyR1sPYyh9cowJsvqWrniDUswMzpD+/A5ZwnFf1adKj0SJdfTyr3bMaZMzBm9gAowfLjscz2ZABaRa5p+Y4tUhDP7T/HxgU8tlsJ3yJTimzDKvHrhOF6brKEzdtV3QhrJKYLZWK7t3zNQXHN8EeO+2vMkfpGlm0Iz9WMjY/HW3omC0/mbW0viavbLwJrTBdz2Dgn/thu7hDj+tl20NgUhsCWwQMFo1yaU2MmwjmIqnE8nA6xXnD9jPNctMgQTNveCMFaDoTA4I9/MHwDwpK8OnL/NPesHkqSkMVQvP3k22iH/Yk/oYIZ4jKbz/qzMjvN83WB7MRpDe5bfX20EfWqCzFBnEIqG01JL4xUwYvqfkx97IPbCwkV2xQpsLJuCEWXDjiouihJkTPXSZlSp4PjarymH2qivo359EogECjrbqBXxFF0WqiFgldkvwAfYh1YgEoTxOr4tZDhoYsCXmxw28dwjYRewmljH7D+1VaLGm05cepHCGH7YsEuQnSnCgvMGCd2dWYo1u1hHJR7DtbKWyOuAZpCZDyyPMcToedMNtbXIGyhbHPNi7HuiYMnQP1SIPXI2OqKfTXjgnUP8vRa0d992CEV7mFC2QGnkSWgWxmho90jyAwye2vAiAmlPqAopXiaum8i/26TR3Ly0lLkAgllTE506/zr/NKJS3Pww8zJr2mtsBl9nN4teG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHAyK1V4ajVwU2tGcWFVVTdkWW92d3dVelZvQzgwak5CSDJjOEVYRkNqU0Ur?=
 =?utf-8?B?ZU9UZFJDY09OSmhBTVF3SkFJbldMUy9UWC9uNnljaTNuek96aGF6bjZvUHRw?=
 =?utf-8?B?ZkxqU3J5TzFHVzEySGJkUDdJalk5cGU0WW51TW1ubzlzSm9NVkVwZFVYUVJG?=
 =?utf-8?B?dlBxVC9BOFdPL21VVEVDa0FaQmxrbEw1TUMweWVZNy9NTmhsTjg1TEo4T1FC?=
 =?utf-8?B?MmRIRnFueWNNVVNTWFAyVU9lTkZVWWxlNE5KNFBFZkJTWkl3TEZERXV6OStR?=
 =?utf-8?B?K3EvL1VKSHZPK2JKQTZrWVpReEs5Qys4cVlGb0RYRmM4S3JNb210Z0FXUjdZ?=
 =?utf-8?B?V3pjMmVPWTFIQ2wzVWpLWkJQZU9GR0tYSDd2dkVYZjB0bnVHRWNmR2ZNZUpl?=
 =?utf-8?B?NFRnYzIvUER1bGswQnh6UXprU2psUG01ZDl2RlJZVHN6QjZ6R043VXNPSzhi?=
 =?utf-8?B?OE5oLysvQTd0bE9XR3kwYUE0bVZrbnd0aFpHd0hWMXR6ZnJyOHdla2pFelVT?=
 =?utf-8?B?d0o3QkRSSzJhMzhMd0x1YWJyL3ZOczJHL2tZYXUrejNRL1NwbngvbFBteWxh?=
 =?utf-8?B?OGJMa0dyMnBLaEFla1owWVozUHRJdnh6bE03eHcvMzFwSUlyUUdGc1N6Y0hW?=
 =?utf-8?B?ZjNsYkdJMWZGYzJGWlRiVEFPN2dSdzIyaFQrcWxyV0dVeW5Sc0pWTW5JL3VL?=
 =?utf-8?B?UjlOU29VVXVWNERBRmxkYUxhNDhVM0w1cmhFSERud1dETDBpenlrcFBSZDU3?=
 =?utf-8?B?RkZFOGhkZzExQjlsMDlkemx1aHg0dnRCUUJxaFlnUVVKUEgwV1EyNS9uMGUz?=
 =?utf-8?B?STJybWFWb0hjb3BvdkpPVmJ6Ui91QUtMWkEzWU1tRzk0OUlSRDBOZElCeUFy?=
 =?utf-8?B?dzgyb3IxZlVKVjdQWk1kWDJkVWJZNmlhMFdDeGk4KzBBQjB2N3J0MEZmbTRZ?=
 =?utf-8?B?djlKNWRsSDdONUFsNWl3R1JTa0F1RysxYlE0MmxNZzhlUzV2dHd6UmdzMU8z?=
 =?utf-8?B?cU5oV1RTZkthK2h1UDE5WURvNnNyVjd6R3orMU54OTFSN3QvWVhrbUV2Tm1Q?=
 =?utf-8?B?VTJ6SkROVkNpRDJRNVBpdllvbkQvQUZLZnZqWWJrOEVEVGdKbGtNQ2xIcFBs?=
 =?utf-8?B?NXl0TnFleFdldzRaT1hwMEtYaHR6RGZ5cW5Mb212bWhuZHc1MjhGYjV2SmxR?=
 =?utf-8?B?N3JTeEphblpXTTBFK0NJc2pPbTJneGdPbEhlNU1PT1BseXNUR1dWeWFmSmVs?=
 =?utf-8?B?MnUwT0sydUtRNDRrUW1mVHRHOHliR05hSnBFczhubUxOakNoV1d4MXpNaCtV?=
 =?utf-8?B?cmEwSndMNzE4QmJORGUxQlhOSFFWR25lTHI2UzYvU01ZR1VwMkRxWklEZWpG?=
 =?utf-8?B?ZEllc3JUbEU3Zm1WaWo2alZ4SXN1VGtocUwzNE1pMVBIS0drc2dBcG9KYzM2?=
 =?utf-8?B?OEdQNk95cnV3RmFlc21xRjRpaVdicmxac1FDV2lOd1J3cHRra29aMWJNcDht?=
 =?utf-8?B?WXlWak5IbUljeENmNURIU2VhUmQ0anVpTHZaazRFS3RWZVdEUXlwTiszY2R5?=
 =?utf-8?B?L3ZjRGVFWlBJSjRYNDEvVHgzVDluYXJ5S3c0Q01meXZwMnB2dHc0WC9OcEtU?=
 =?utf-8?B?YTF6ZGxzWGxLWlVJVlFtZVlHMC8yYXJoOE1JNWpQUks4Tmk0Z0cxelZyR0J4?=
 =?utf-8?B?SzZyOE9YczdhaE1hNUx5cHFRb20wcWNmUW81RUZnSEJTODJRekhoUVQrZkhC?=
 =?utf-8?B?MjFVejY2cHVpNWdmVzRVLy9xZEVjMGZOa1JsR2ljV0x4cnkyOXIxNFcvejNh?=
 =?utf-8?B?MEx1YWNHNlFGY2hFOGdZUjZUWStjb2xSMlllMndUTFNMYm9UK0FDcEliYlVV?=
 =?utf-8?B?RG5CRlZzZm1mblN5Q29Sb3BNM0UvMU44ek9iRFdjSWY0TFZvY241akFlOVVl?=
 =?utf-8?B?djZiWU9TaU1yRWdXSGUrUVJXeFQ3NjRoLzdCY1dDTGY5LzBnbmJSVzdyTENG?=
 =?utf-8?B?MDNobHMzWDNJbEFFUnJXSmIrUVI4UlIxcTQwQzlSOHNjUWRiMllGT2NtRUNt?=
 =?utf-8?B?cUJwd016L0RMQlFxREVJcjNTdnNLNEFqYXhhbHhXaE9raElSUnBMN2dMN1cz?=
 =?utf-8?B?dmRqbEt2Y3didk9GTHBKRU9sQjJuVnVrT0hhWEQycVpHUjFBUUpKU3BRTThB?=
 =?utf-8?B?OWIxQWF3YzFVTk8xTEFvUFJZclBQRnlRVDYzeTBYdFg2VXlsMVhyaTVISEYy?=
 =?utf-8?B?L1NYV29uNXdNSUh5eWU0aGxabEsxRU1LZitYTE8vSkcwZDltN3ZXbUNjNmFY?=
 =?utf-8?B?bzc5RldoNDYwQWNkR1NlL0V3bU8xMGhNdVovZkFaMEJlL21MenZOdz09?=
X-Exchange-RoutingPolicyChecked: Ue/x0MK/5JS0hK0akbUBjuUDmyg8h12a8IGeYAfMERuvgFUxYX50Yj8hRFApsJKsaEXQyB0ZQWpN16rg5LGGlINp3bHbBRMd65Djwh3ATC1V2uzveaZ0qJp1u7v7oXCz4oHpD7KHcYa6LagxpCnOHFS4bxyHIZr2Bip/E/ieFjcBsDTxLRYK9QIXe+gvJSazWixIb+BPw7Q/+7dkVKw3WfK3nDY7WAevEyHC+/DkTlcTn+WOQzKoy2YoYasMY2zdgJhTXw44JjYcH2+SICobuYqwB6JBenCmYXpu8nVsPh4PErPIX0/EDRzWEhoMpu8HgHKuWioq5aMYbyGU5pq0kw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a7fd9a-7e47-4882-d919-08deb70f179a
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 08:00:58.4653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkQ5QlzxNXIDRlWEB4mMMf6Gg9JvJdlJfgTQ2u4b3ieKyYzHkd1/FsEVnpBJbb0YX4AnZHSCbE+unexj7hs41g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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

W dniu 20.05.2026 o 11:56, Andrzej Hajda pisze:
> GPU code misses batchbuffer overflow checks in some cases.
> We can fix it just by using proper helpers.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Merged,

Thx Zbyszek and Jonathan for R-B.

Andrzej

> ---
> Andrzej Hajda (3):
>        lib/gpu_cmds: replace open coded ibb data copy with helper
>        lib/gpgpu_shader: replace open coded ibb data copy with helper
>        lib/intel_batchbuffer: log overflow size in case there is no place in ibb
> 
>   lib/gpgpu_shader.c      | 13 +------------
>   lib/gpu_cmds.c          | 13 +------------
>   lib/intel_batchbuffer.c |  2 +-
>   3 files changed, 3 insertions(+), 25 deletions(-)
> ---
> base-commit: 6b305d78c65768c09cc7c0e902273bf409bbd218
> change-id: 20260520-ibb_fixes-891d4b8cbfc7
> 
> Best regards,
> --
> Andrzej Hajda <andrzej.hajda@intel.com>
> 

