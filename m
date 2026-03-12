Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D033A103E2F4
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 02:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE8F10E940;
	Thu, 12 Mar 2026 02:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UU6hMmDR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0A610E940
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 02:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773283937; x=1804819937;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wJ5JUtzqH/H/WKHHtMtcdFsez+y1zb5LmyrbzNsp/os=;
 b=UU6hMmDR4EslXk8GeiKh7s/HXmcl9TUb/9fPyQFxM1ATeMc50xHyKnD+
 vM8K0gNagil48pPDJ4pkI0/hQ+nyv/EzOS6GyBjEykPZ0XbOxm05/SNDB
 Zf1KwWbIrau302wkic8tDwmTwP25MgdON14Dc63zn10L0GzUcaQa9sQSL
 t+jqmh7U+a55F2Dpiib7uBmdojdScNcJ2LVpKcOrCTOnntvue362uYI4K
 Em8BcQg/xQZztrF38n19va7/IeyVzHWHHPaB2R1NNYQ2ZL0/NWqEeOqLk
 d0+C3temfSEY0IJ/QFWtn79FhOkq8Te34o2rxTYsGJXNeyUqBAaSrAjaa A==;
X-CSE-ConnectionGUID: IarcYt79RIGQs7uK2TVvug==
X-CSE-MsgGUID: AZoxF3Z1RfOuVmUBJGXIWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74557389"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74557389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 19:52:17 -0700
X-CSE-ConnectionGUID: TWg3ovgIS+yzq2iq3aCs1w==
X-CSE-MsgGUID: NlG6YJ3qQPafA+zLexH0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="224813666"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 19:52:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 19:52:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 19:52:16 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 19:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N04tsEC36JzDJ5l4mAXQExTUb3PgVYfe2/AXTE6IKxZKQyN7CjOiUlCVbra1LWD1YESYa26CAItQuUfMtmmyMZU/RV7joAbWDjkQ17Z0teYStTmh6GLGUQ1gIcUB7NAVh9NjNWppNdcxaRIOisIT6FLCYxySO6CuLO9gzGXBRbgBN9VTa8eW92M0T3dIB7EEJvT3Ojl8/gEnjmdZKbrAq0IQDezEhxotCz5B0X2QgVu3LFqDU+kU/hql01OY27Tc1mDWjqzluPrcI5mx7g7/rxIwdKQeuBSBzJkIk5wcrfifbHLbNnD5FhVT8Ms1W4ObvFivadwgrnKQFqDyVW5oEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ/irmPyyfT0hcm7ZaNJc3Poh9Q7FQqbkAiEHJJ9h80=;
 b=XY7uGf62r5XPhwsS/0gO6qpUDfcVG0odJrC1krM0Pygl6a81aHTWKU6hQXQiAaIKFCOskLxp4fOtaztNFJvb2JijQDHZetg8AK0jN/NvPQP2bjw1vsR+EXsCozVBAT3ViWsFgmkJhTaWyAz7PGeDiPyKe9PEl2V4W2e3Z89ysEzZXZUeOpEyp59aIWip40UshdO24SHeYhyw3+ruyiDO9v5/ia9hxm0ciS9wMD8C8o8YU98iHx3rCfmyNj3y+MI/YZW8aglnyZNLaYVKfq9RwnVk983dSuGOCi3Zb5EJcZX05U/uCHHwVzbvlrmKi5ueaeFdfr1pdPVQJ7H7EI5qRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 02:52:13 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 02:52:13 +0000
Message-ID: <1608323c-8c18-499e-a7e4-0baa00ba74eb@intel.com>
Date: Thu, 12 Mar 2026 08:22:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/igt_kms: Fix joiner force debugfs entry and
 expected value
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260311105033.220652-1-ramanaidu.naladala@intel.com>
 <20260311174001.224347-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260311174001.224347-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0035.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 76763fa2-2fa1-4d82-4c8a-08de7fe25c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: zJIozShYAN9X4DvQcjHJ5kutCTpCKC2iqiZ/vli10K3EVDltCFgxJyvj4UiSLeL28M2fW5uOdn8Msr4QbBp8ZGP5muohfjPADPFvMhkfRElaCyo9yAfn9uC7HmIqT6dgRLyl+a4VLjNpgUSQ2r3kLx4xjqFFGtKmnyNTp4XNmOsM4LkFMAnFyU04zTeo1Xp3VgNg35eVzJHUUSgFPOXmWSyw/bq9cXv5TsxkNzeI9E7IjnySfYOvZuMh/9x76p1M3rE25PpjpCi7+UkVdnYOz3Chn1v+G9/gQ+luy4FD4nckAY4enGtr48QALzaDgYaEzcwpchvQjT7AFYY1GJ8fMzGcD31MnvnPsaUmJmOV9Xykrgb6r2f+sEWQzB1s9j2TUGV1A6molmAxRirj6FKKgdHvP/JCGfCTp1Fr93LP+OJtRP9PUWLyrtc9Avt+5ibEoWGC+4NI6Q8PXkf4yWw+wJFFB0Emhn608Dd3k5kvQqbjNgmOrXsbj6Nql3LfRGF8JU8ZXDkiihdmb1WRrYK4WCxdPey7hfPjbk7phPqoe09sY41ZlKnTmor7h2T1zu7bnsJRt0hBDVeFlUd9bDeJ91O5VQNtHf4OvW72ps/+3Q3HO1wVAC0MIkkmdEInJLBGkCbhvUbT5KuDG/IojKpiXHtjmp09k8quuyp0ItSSIK0/j9zLgEWqrgpg5YJgayBcSv6yahBNCLB65MBAGcOSVVNjblTEr4stNVK1XYQRE3uanS0H2CHwXAVAVwxNJMh8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGo4T0pBODVpdE9pYlYwVGx2Q2hHRkN3c2JRU1pSbnE3UDB0VXZUaTNnck15?=
 =?utf-8?B?djZJVFVQbWdjTSs4TUR2REcvZmNkd1NkWVRxWVZjd3VqRWhPM2JLUGFIK28w?=
 =?utf-8?B?WXFWR0RCL2JqUnZ0V0E3Y3JlUU1ZYmV5VTMyMW9mSlNZakVFRllzZjJHMGlD?=
 =?utf-8?B?UndvV3ZvUzNCV2dHQmRVVVpueUpLbUxsbC9OSkhKVEdpYmVBREg0dWh5S0VS?=
 =?utf-8?B?dWtZTGxHc0xaaVE2Sm5UN1lVUkRlV2N6QmRoRWlpcHBncUxveTd3eVBhYXM0?=
 =?utf-8?B?eUk2TEx0eksvMFREeUx3ZFpRcFpkVG9mc0tla2VBdVg4dEVWaGE2aHNVWGxx?=
 =?utf-8?B?UHNSYkp5ZkZtZWQyVU9EYkV1L2NIZVp6MXpIblNHYXdHanBXaGZBa0sxUjJO?=
 =?utf-8?B?eU8zajRDNGFoRWF3Y0UzU1FMak9NY1EyQ2RFSVl5cHp6cmJlZ0pLWnA3alNR?=
 =?utf-8?B?akdSaUhGNlFBM2x5dVpNSWZLUms4MjBlRlZieG1ITjE4MjJnWnp1ZXJTRnJn?=
 =?utf-8?B?bWd1SG5YQktLNUM1aG90Z0dkcjUvTDl0QnNWMndOdUQxalYwWDlMaGc1YW52?=
 =?utf-8?B?TTJndjFNeFhoM1BtVk9MY01pRk1zR2pmb2FYYWJOR29xajY1bFRlc2t3MTRk?=
 =?utf-8?B?Qmozdnc1TDF3R2U3S1grZjBuSEpkenNaT1ducm9TTmR6cnJtWTRjeXRTbVFu?=
 =?utf-8?B?a1hESktpb2VYZTFpOW85Y295WFNXU2lralF1YmpGbGpOSGZpUENyaWFSTmU5?=
 =?utf-8?B?THJtTEI3ZE5oc3NJQ001NUQvanVFTVZDQjBlQzlzUWJublVYV2g1aDZhcGM5?=
 =?utf-8?B?RXdqblRaNGdKejM2VzhvbHdNQ3F4djFOUFk5eTVxTHlLN3EyQVIvRWowOExj?=
 =?utf-8?B?SC9FZ0dnTUNiSW1XWEF2QkVlVmk0UHpGVENoYjZEa0RBZ3l4WGorUlVFS3Zq?=
 =?utf-8?B?ekVFcFdKME9UOEtGZGJiR3FpWGpIdGhnZnhTZ2hkSkNhMVhibmtDbEhCOTAw?=
 =?utf-8?B?MXJucFZ2Q1ZFaW1iTFRnMlo0K2VzYmxFeW1NTTUzWTdSR0FBSmRTWU0yMzV6?=
 =?utf-8?B?eGdXdjdCOUlOZVZVc0pJQzQrMnNHc1B6SHIzaVpoTmZldmxtRnYyNm9hWnRm?=
 =?utf-8?B?VnI0dGN6dExhaDBCRmFuVTlhTDhhdHpWMG5xeHZJWloxd0s2TFRwS2I0YjZN?=
 =?utf-8?B?NXI0aGk5Q3M0MjNVOG1Fd1ZaekdrZW1ZbU9aN0JVNE84TUxHTFU2YVhBQ2R2?=
 =?utf-8?B?OGo0ODloblQxeU5EOWF3WFVUeGtJMUQxZWszUVBjbHhqZ3pxMUxaNjN5MjRt?=
 =?utf-8?B?a3RocFNoTU5ZWUlMOGlTeTIzS2JibGkxYXZSU2k1RGNJUTA5eExDeEtnVy8z?=
 =?utf-8?B?a1pPMkRCQjRNS1JsMHBZUGVMTktMaG1yWU4yNUxaUkFRQkEzek9nYU9KQktq?=
 =?utf-8?B?emxJTlZZM0lUZUhvV1FyK2xjLzZWN09WYStidVhycG00M2pjS2E0bWRSWi9Z?=
 =?utf-8?B?enZPbkdKT1JWOXlwcllCWFZ2Z2JmYTZRd2NkOUtXY083cVp4bGJQSC8yRnJ4?=
 =?utf-8?B?anJRdk1lMDM2UkVaZHRsajF3d1VKUmZhS2NZMkVVMVo1Ri9TeUJmQUx3K0xR?=
 =?utf-8?B?R1FVNC9pVUhqR2RWM1B3Vmc0Riticm14WkJkOU9GS3l1SHRQTzhQb1hnWFVY?=
 =?utf-8?B?UkM5WWZTTSswejZERm8wN2Fjc2xiVXBmSHVsOU00QUM0c0IyTEl4cE93K1lF?=
 =?utf-8?B?bGgzOEZVZkpLVVEzeWFtT092anU3bDhQM3loMFJ3cVdQcm0yWm9zRDNlc2dv?=
 =?utf-8?B?WExWeVh1QlJ3cXcrczFkalhPK25LNS9hb3AyV3FEc0dwYWR6Mk1hek9WYVY1?=
 =?utf-8?B?L2IwY2pkNVBHTnlPZG9rdXdaRzJoNkpZZ3RjTmdsditHTHBFbkprTjZZYXZH?=
 =?utf-8?B?WXUvQkZRWTdXUXI5M3A4bUVEOGcyUUlEUTB0Qm1hQ0x4d2tyb1dvVDU5R3lx?=
 =?utf-8?B?QlJacHRPYnhReGNFWXQrRDljd3FjT0hMS0N0NklnVmJiOXBMRFhjSW9USEhY?=
 =?utf-8?B?ZnJBaG1GbitON0VlazRoVmJtaFdtWVR5WDh1dFBwWWJVblhEbEFtMlhhWis3?=
 =?utf-8?B?NnExUnoyOGVCU3FGcGJrYk5raHhoU1Q4NnhHMnJXc2VFQnVhbTRjaDVxd3Uv?=
 =?utf-8?B?VGdNK291MHNRYisxdExCZUg2alJlWUM1RGg3M0FXR3BBdG5wc2JiWDNiQkdj?=
 =?utf-8?B?VlQrcm9pZ1E3RlhmVFV3WWFXRmNXM1dUVVlhcCtESGZBcWxEejByVGZxWTZ6?=
 =?utf-8?B?dHM3OU8zODNBSmkrOGp3bDZRcmFqZGV3ZW9XVjdjQ2k4cW1DL1ZTMEZjSTMr?=
 =?utf-8?Q?AmpfYZav8pnDGdFw=3D?=
X-Exchange-RoutingPolicyChecked: N0PfAVVj6y/S2c85hq6s+45OU1sSCdGx40IYFW1XH2MJAzGokwxRaXq92S7fAjKaZElXlJJ09/PpnBUUPI/Ls2/LLLsrPCIhTF7nE2Vt1isxCBrKXf1VA5b+jxNen7pt01KlGwPqtvjWL4g6ikjI12x5nEspjkXfLwQEY4mYuEAqTW8g12bXzA9iePGuPOQEqhuv729oAg+oGOhhhJ+b8c5Il2KsM33vRXaQH9U5tIjUItBoqJmHtQ5kGaP3sDBGZD1GR9pXJIkGQP3UxjALn1OvYN77G7Y94N2IsHuvlWob4mxFSqGpAHWdsro1Mf5GOXHCuQ2Esk5MSGG+IZQnjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 76763fa2-2fa1-4d82-4c8a-08de7fe25c87
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 02:52:12.9389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqEZtnSzUVffM/ym9FjOA+mLdXRFWgZDmdEtr9+u1NDqKy7DseNkGSnqjLlGty1SZWz63sSt8EsNDAR7GXoCXi+4EL7OZ/Xq7frmczVOhfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
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


On 3/11/2026 11:10 PM, Naladala Ramanaidu wrote:
> Change the debugfs entry and use the number of pipes in IGT as
> introduced in KMD.
>
> v2: Update return logic and commit message. (Ankit)
>
> Link: https://lore.kernel.org/all/20240927083831.3913645-4-ankit.k.nautiyal@intel.com/

You can use commit instead of the patchwork link.

commit : a47df3335a22 ("drm/i915/display: Modify debugfs for joiner to 
force n pipes")


Regards,

Ankit

>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   lib/igt_kms.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0b05ddd72..58dd25697 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7138,7 +7138,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
>   		return false;
>   	}
>   
> -	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
>   	close(debugfs_fd);
>   
>   	if (ret < 0) {
> @@ -7146,7 +7146,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
>   		return false;
>   	}
>   
> -	return strstr(buf, "Y");
> +	return (atoi(buf) > 1);
>   }
>   
>   /**
