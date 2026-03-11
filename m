Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC331FCC9B0
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 05:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D56E10E0F6;
	Wed, 11 Mar 2026 05:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5WHcz76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91B410E0B1
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 05:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773206656; x=1804742656;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wfAqzFq1F1TO+JFUzchzX5rRXrdL9GTAJgJhQd06qRQ=;
 b=i5WHcz763vwkSvaeHLsWt6X+5KYCrmSL2gI2Q0uWYvQ0naR7xWxAdzbP
 8+Rm04Bw6MQX+15gJnOMVEXir59rBxs6XA05AEFUj+U+yHJpoYTUVML7U
 /wE2wlSOw7XGP1aTR/vjq1NvPfhLj3l8Y/YWkO0wcPPu8UU8krUaawJ7q
 6/pPdtF4XKyrX6RNfuGQzpdNuSaYp1zbv4MwO3uMK8lEN7+bZIUH+EucW
 y6mzPUy+AWaj0zFvA/o4HWPTbw/jakZKCB8n68f6fCW5szY2VW6X0fI7H
 X0sGC2ru0p7MDf/V2YRKNXni70O0wIHCsepLyuachoxtnpqb0+hKG8U0h A==;
X-CSE-ConnectionGUID: 8Hz+iOPzQY2+Zbfl1DNmTA==
X-CSE-MsgGUID: ssQrn+rfQkSuFlv+T6BXEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91836500"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="91836500"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 22:24:16 -0700
X-CSE-ConnectionGUID: QpWVPXSDTCGtXBLqGm8kWg==
X-CSE-MsgGUID: MpQF+CDfRqeZKx3hujrv1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="217051120"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 22:24:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 22:24:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 22:24:14 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 22:24:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GM8VmYeYVwzdSQx9nc+jodCZas+KjYTjnmcAX0vd8HowrNveMeVPzFlfmDaLIc/emMdPSB1UlH+7zR/4X9h36oKPy4/BW/U5v1y1kPLBUesjR35C2RHZtYGF+/QFDi0jPfu0YCnes6OVxcTpuR045w4yyr+3mmYAjhMhn54Ggjrdy3j+sYZCKjCh6OHmSyMg4mOTY96d+7m6xoCfri5auBdO9fPu7b829+ybH5PCjdNbGu66HVlpU/3XZAonmzFTK9wQ2D02ye6dJPhSLG++yE9BU0VvIyz1/OuS7ve8YRuIAo1xAxgh2hReaITOPzu1TI2krnwKIS5HXpf4WNbA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DHk5QdEOGrjl6ZeTam/Qq+SQJCwb2BXn7stwEYz3M4=;
 b=ahaF9MX61riGK4ZM2FU6TdouvGxAyd1MtFLhdSFYncqyFEZGP5ACEInSYAkiDpZ+Hj/orsvwfGThWT05e03RJrJDLVRbzxPyyWSlcy2g9rK/iD14PG+eHdclZMYW6a+Osk+MTU6lBfs04BRUT9B4GpR/3dOaG0L+YHgQq42Dmp9LrLyvMpZdVfYhcrXdHP2fTFR9qmWGt1SMj3LF5Pw/NgAjj6vDNfs9VrR36gAA6xb7RsFrm11LsT1W+9Qnq9m7FqdC6Zulh/EwZ/l4JXkXSCwYb8R9wdRjZhRGPCJ6haP3jUYWVPScWnoaMhdOFgqTGPPR9oHR954xZ9xpiMYi+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 05:23:11 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:23:11 +0000
Date: Wed, 11 Mar 2026 10:53:03 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_oa: Delete disabled-read-error
 subtest
Message-ID: <abD8N/HJOYwVCusU@soc-5CG1426VCC.clients.intel.com>
References: <20260310225039.2687668-1-ashutosh.dixit@intel.com>
 <20260310225039.2687668-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260310225039.2687668-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MA5P287CA0149.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f3d1d0-040a-4410-3821-08de7f2e4973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Sl2QC7NJZjPECDsqJNjOMzk9tHjnGPXVzssymJxV6nXXm3LXwrxw9Lh2VpaPdbT7yxmbrJetA6jKKrOncXpr/WNbX/jIZmhOpbxTzHoFyQIwl8TeNtX02z3yAmw6fZt/hDw9iZihPXshhTLdj7cZxfJOyes33l5h4/O2/hrGltk+TrvxpnXcVV2K3yq3xDcBI9dh/BY0bQ7MjbchmeEJUxWyCVo2PNOZkBgknaZ7jTMfThU7BzqCz0Q1f22LzvUc6zeMcPrJxYAD4qqdCnFsD0UHRbmARm2TfuNDTPUDeNHTLIlyhw+2ovfbArv2lEV1UCMbBipq2bbU3Dv91evQpRUWoN5ZckrtZuFH0c3VjfE/4Ao0suxvE07pa1hOXeQLwKWy9UrEW/2sOBxTK1WJfusJtWZWI1MVfpPu1tq6T8WJtLOqBZCAYpj+7uQFV5l5TqI+ABf8q5Q1AgkgSbPlbWP5am6NzAoiEhOF99nRxvCl2eFnM/wKsp5KqzctJN3uurRsCMPSOP+WCeep8trKe8zTOefmYzy3EEldq048ATTIOsSRRg5J42Wa3LZLjJl2BN+6uHU+ksZPAX2QjNldWrT4kJbWghAoDD+PVldJPm7G7H06dvNJaILQzOOXKjCHEz23ugEeKaohD5jIX4oKz+VoI9e+Y8DAS5+pgEWzSLM7hHBWshZWjHsg40C5OfHCQnTUyBQqhAoXRtA7ZrQjNoLuaxaVO9MGLts8o1LV1uY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnUvRkJtWXVGMUJQL0RuOFVsZVM1cnZmamx2MVRiS2FQbXBVN3lsampNc2dm?=
 =?utf-8?B?ZkdpVzNZbERqOG9zUHdUMnpySlI4YitQMFRrTGkxS1pRT0JwMmFsdkNpU1pD?=
 =?utf-8?B?eWJzNm9DdjBjNXVWOWdiSFF0RTI0NENka29qYktkaTlCTG5ZTkNuVkZ2dlFs?=
 =?utf-8?B?WndrYnZFR1N1SkVlYnhYNlpFTkEvUUdqV1JBVG5lK3FvcmR6azZyenpEbVRD?=
 =?utf-8?B?YzVaY2NKVjZKWDJpamxXeDVwSll0b2V1VURPNXhkbDZSOHN4TE5Idklud3ZD?=
 =?utf-8?B?Um05YkFlQTZzVFRHRlc5ZmJDR3V5UUUvbU9BdXNzeFViK3gwOEVvMy9rbDlJ?=
 =?utf-8?B?QlZSZUZONUFZWlVxamM3dDlJYk5qRHNXckd0WHBqZ2tOZHZqNnJBUGY1b3E3?=
 =?utf-8?B?Mmt2QXozUXRLd2h0dGk3Sk04U2FRZXlRK1FmdWpwNENpazZXMUNJclV5ak1m?=
 =?utf-8?B?QVJIMm1EeERWblFONnVoK3RYdXc2S1kxZTJFblFMSVZTbjdFWjFNYzNsWXRt?=
 =?utf-8?B?cHVqSy9RTEUwV3lGOWdtLzRFOFhsd3hCSFpBY01BbFRQcmt5VUhOV0YzM29u?=
 =?utf-8?B?dGs0MGFoN3VESERjSEljV1dEcEQ5YTNRSUpIMkFVbldKb3FHYTF6NHoyRlZU?=
 =?utf-8?B?cnRXSnR2RjllMTV4dGpteVFUcHV0N1ZoU3BlajNkcXlyRXNSTG1mRDV2ZFp0?=
 =?utf-8?B?YlRhTjVNcXAra0ZLTVhyemNmbHlWN0ZiZTE1dWcyM0pOekZnQTBySWl3ZXU0?=
 =?utf-8?B?RFdXRGZ5KzV3d2xPZVluRm5hNURpUmZlTXFYUzhMVFM5U3FUT3N3Q0ZBVjhq?=
 =?utf-8?B?UDdDOUUvZjJVSFpFeVFVRVhsV3I3ckdhQnJqUVpQVForK0JCZnkzalNoQlRh?=
 =?utf-8?B?ZXZoTGpuVk44bGxhdEd2N2gycDk1c3d4WHpXNVM4dVRKTFJadHBHK0NvcS9G?=
 =?utf-8?B?UWMrdlJJc0tNaEJpUHE1VFpuc1NuRno2M1kzTkxEMWlySElQTDdZbU9sT0tk?=
 =?utf-8?B?M0tubDJTdTlKc2tQc1lzNy93dGZDdURta0pTWTdqa0NGZlpZVXFBTHY0bFdy?=
 =?utf-8?B?bkJ3dDZBdGZia2NJRk1tQi9wOEkvcGQvQktBeXhDRzlKRGMxNmNEMThZM3E1?=
 =?utf-8?B?VlVycERlQTl5blVmbzcvYmtxc3RLSXptTndWdVdBT0QrMUtIa2tZM3lyNEdx?=
 =?utf-8?B?cEIyUVdjU0ZTUzBUZkZFVkxUUzdvaG9uelQwdXg4T2doR2twa2RTVHV5eDV6?=
 =?utf-8?B?b0kyUnRxUW9ZUUx2cGc1MGJzMWR4V0g1ajUyK0w4VkdHOE5oNW5JL3Q5cmdC?=
 =?utf-8?B?YW92MXVFQXQ4TFB0SlA4QzJjSjJuR2pRNlNWQUVyd0RNR2lhT1JqMEhuNXdC?=
 =?utf-8?B?N25nVklmc0xPTXdrRE5ueWxRUElBb0NveDZCVmhhYlBYRnhlSHpVQk1xNHJz?=
 =?utf-8?B?ZTVHYmk3Nk13WjZ4VmtWUEVxTCs3NHBnODhOS2JWenZxekEvV0sySFg0SVpl?=
 =?utf-8?B?aTFRNVBkeGFrMEM0ZTJmcGJwaTZXQ2NveGxlSkVCcCtOamJ2blJ4T0RyWCtR?=
 =?utf-8?B?ODhGWVpPMlo1cjQ3WGFkcDVXcmVkdjZ0c2pTWG9lMVpram5UU3B6bDlpOVZv?=
 =?utf-8?B?TXVsWVJqdlMxQ2J1aUV5cy9LU2tlYWZUNkRHM1JYa05Mdkw5MkgwY3B3cEhB?=
 =?utf-8?B?eHcwSk9qenQxRm5QMlZCaFRzSTdyRHpQd0JvTkVaWXFPQ1pkZGR1clNmeEZW?=
 =?utf-8?B?QWJlY2lxeVp4UXVYTGtPWEdpdjdZb3BMLzdmOFlmRnBOYjZnY0o1UTZsd3pH?=
 =?utf-8?B?WmowOVU2UStON0JxaUlFc1VuM3dRT1U1WEU2Q2Y1eUorWU9FcjJmTXB1N3ZY?=
 =?utf-8?B?QXVuQ3pxVjcxZEltSEJ1bkkyWDZTeW1nQm4yeURrNjEwNU5BUmRNMEIzWTZU?=
 =?utf-8?B?ZW9yUllFa01UV2ZmUXdYMnJRbm0yQnZUNjFwOVdKd3B5a3ZVOVNRR2pLMUFt?=
 =?utf-8?B?cEFIUjNTR04rankyNWlwS1ZVUDNtOElXVDZHVUk5WUdwR3ZBYmZFV3ZIZUJr?=
 =?utf-8?B?dTl0YTFCd1VFZDM4L1BtNk0zRElPUUpaWWVXYmVkTXNiMFFWVjAvTEhHeEMz?=
 =?utf-8?B?ZzdvN2pkTmZBMGg4V0h3M1JsWHlTbEpNVlRWZW8rQWdLV25WUElKRVE3U05I?=
 =?utf-8?B?UVNhbFEyaFFOdW96MjUwN2Q3Y2xmajZodVhNTk1tV0t2dTRxbXBKVy9WekhU?=
 =?utf-8?B?eWJqTTVxdUJrSFRvT2JXRmEyUEtGZ1h6RE5pN3hXTGdVc0s2MHgwZ0hvVWFy?=
 =?utf-8?B?Z0hrdktBdjYvNEJ5TmFxcTI3WnlsVTVDYkFOdUxEWWFFOGVvRlZHeE13TlVE?=
 =?utf-8?Q?9atchDCu7fuZvu4I=3D?=
X-Exchange-RoutingPolicyChecked: Lvi4WcmbBWwspOV5uYCtk1Ta1x7YXsHHHZZD4v39T+5yeaVdnW2Jndj4spKX5HuxLoUpB7jXp9hH1fe9i1FDn66jQdaYzf6RzDh+LiqV24rtFGCUnpa0oJvgDrE9geU834+nHyQThXIBY0QXnOO1UtiYgf4bDGmLY576JYmDT3vZIbM6utGAx7c6LvLQx6fX6COLyaQMBLNqGXswEm6A3F0ehhUd6jM96w1bwZzTGTvzOBBR01p7aI++EAP7MTjqIEPoBAi3ZQnmoIY5Ruheqm5tWns996MOUv7Cbj/Ngc6vdVFgn+URXT+bLsIq5qx6eTYczoEeAOzn9KvkHwoDzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f3d1d0-040a-4410-3821-08de7f2e4973
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:23:11.2852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUr4lKL3CKhYk9ojW78gAacGb4S/Spc8NWAPD07wsbNNymf8Frl0IEQiOndVntSIzji20LMr4fwHpZKqJZsU3TplmIfYwlphXTwuDKLIhFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
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

On Tue, Mar 10, 2026 at 03:50:39PM -0700, Ashutosh Dixit wrote:
>We are changing OA functionality in the kernel to allow reads even after an
>OA stream is disabled. Delete "disabled-read-error" subtest since it is no
>longer relevant. Also delete the read error check in "enable-disable"
>subtest.
>
>We will add additional coverage for the new functionality in the
>"enable-disable" subtest in the future.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 77 ---------------------------------------------
> 1 file changed, 77 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 927f3f4f20..387f29535e 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -2757,12 +2757,6 @@ test_enable_disable(const struct drm_xe_oa_unit *oau)
> 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
> 	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
>
>-	errno = 0;
>-	ret = read(stream_fd, buf, sizeof(buf));
>-	igt_assert_eq(ret, -1);
>-	get_stream_status(stream_fd);
>-	igt_assert_eq(errno, EINVAL);
>-
> 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>
> 	/*
>@@ -2927,75 +2921,6 @@ test_non_sampling_read_error(void)
> 	__perf_close(stream_fd);
> }
>
>-/**
>- * SUBTEST: disabled-read-error
>- * Description: Test that attempts to read from a stream while it is disable
>- *		will return EINVAL instead of blocking indefinitely
>- */
>-static void
>-test_disabled_read_error(void)
>-{
>-	int oa_exponent = 5; /* 5 micro seconds */
>-	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>-
>-		/* XXX: even without periodic sampling we have to
>-		 * specify at least one sample layout property...
>-		 */
>-		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>-
>-		/* OA unit configuration */
>-		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>-		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>-		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>-	};
>-	struct intel_xe_oa_open_prop param = {
>-		.num_properties = ARRAY_SIZE(properties) / 2,
>-		.properties_ptr = to_user_pointer(properties),
>-	};
>-	uint32_t oa_report0[64];
>-	uint32_t oa_report1[64];
>-	uint32_t buf[128] = { 0 };
>-	int ret;
>-
>-	stream_fd = __perf_open(drm_fd, &param, false);
>-
>-	ret = read(stream_fd, buf, sizeof(buf));
>-	igt_assert_eq(ret, -1);
>-	get_stream_status(stream_fd);
>-	igt_assert_eq(errno, EINVAL);
>-
>-	__perf_close(stream_fd);
>-
>-	properties[ARRAY_SIZE(properties) - 1] = false; /* Set DISABLED to false */
>-	stream_fd = __perf_open(drm_fd, &param, false);
>-        set_fd_flags(stream_fd, O_CLOEXEC);
>-
>-	read_2_oa_reports(default_test_set->perf_oa_format,
>-			  oa_exponent,
>-			  oa_report0,
>-			  oa_report1,
>-			  false); /* not just timer reports */
>-
>-	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
>-
>-	ret = read(stream_fd, buf, sizeof(buf));
>-	igt_assert_eq(ret, -1);
>-	get_stream_status(stream_fd);
>-	igt_assert_eq(errno, EINVAL);
>-
>-	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>-
>-	read_2_oa_reports(default_test_set->perf_oa_format,
>-			  oa_exponent,
>-			  oa_report0,
>-			  oa_report1,
>-			  false); /* not just timer reports */
>-
>-	__perf_close(stream_fd);
>-}
>-
> /**
>  * SUBTEST: mi-rpc
>  * Description: Test OAR/OAC using MI_REPORT_PERF_COUNT
>@@ -5154,8 +5079,6 @@ int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 			test_non_zero_reason(oau, SZ_128K);
> 	}
>
>-	igt_subtest("disabled-read-error")
>-		test_disabled_read_error();
> 	igt_subtest("non-sampling-read-error")
> 		test_non_sampling_read_error();
>
>-- 
>2.48.1
>
