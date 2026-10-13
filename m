Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20A1CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 22:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9165C10FA2D;
	Tue, 13 Oct 2026 22:58:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2381810FA2B
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 22:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791932235; x=1823468235;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=46QqYvvZ9Pbd55rsQRprgSPuWWlbZKwqW2pJsVXJyc0=;
 b=KJ7G0zcy3/Ob7U/8LrwUjpUJbOuIc2M2lYo5GBG483E2hLO9ZucbfLc4
 GVrwT+VPdPI/rYJyL4NcKs4QA03YwAGf/b0ib8yZV5Ecq5CnMG//JJYkJ
 +TEb6DhpUOaT7fzLkz6sVlvkQhIs0BoloeyzY+KTlVAwEUmRe/TYMvcRH
 KNtEp5pabb88K5OGDpTB5glOP236H079NQUfh+xFIAPS2+ejH5FPNZEvy
 XMqvV4FpmsgXDdMVZvlR7F31Y2dcII0KGAo94aShAs2mPg86EVkMb37MR
 SJ1oGFx6mcrh6Wxx3Aupr1AwElbYKss/cP8MhtwQl2sIaWlEqKze7YNbY Q==;
X-CSE-ConnectionGUID: jTl12ZucSdaq9jygHHDNmQ==
X-CSE-MsgGUID: 9d8c01UBRuqTzv1Ox8T7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="678692"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="678692"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:57:15 -0700
X-CSE-ConnectionGUID: XuDnSehpTWiwXaWOyL9c8A==
X-CSE-MsgGUID: hJtqfT4NSWelgeJakA8SYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1599060"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:57:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 15:57:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 15:57:14 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 15:57:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7Ot2FNk3eITOQ/PSeTYmoVhW8QhxSbnSn8LSTk9pG0AJ62MSkp89vsOcsbf5K7Ai8jmfkDo9MPr9scMIPRQLjUiMmrE2szrB+HabPBdYkNVkQqGtOwCYSANCc67m7ItklA71ebeOinUTm+omwOy+n51nYvqSdDnVbmQundmA0LsbG0DqsZQunkv56doN3gi3WCYaE8KwtSAoxOGrtAy91UdeAwVBLLSRbH8I5zcqXmSGFbhyhqTa0BGH653RWTAPTt4YkjceDofnlmbiTx6+JP+j5cPKc/zphUms8sZPRxqEexZ4Y6gLoeu1Nsasg875HjJvWQ1939v0qYuH53u3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IyKuZzfG/K+0W8PxpY8dXDNti6j5Ok0tvHGsgtujgo=;
 b=GYkIrJZ0e2U5uw6UHs5cz0RFAOLwMkOVURnyeRurF8/cJIPeWYCVVw5r7u0PGbgo2OtcnhSzewVmEfbXVaJ4fMbr/vgZzzLIemwLg6ct4d+JIUf9gk3jT32iJ+3h3qher5VCtgH3GhzIDF1w2tcubw0a32KxynisYdYI7mSMBKVzRCOJHP11PPsSBfupaWpmRb+bWoib/xbNTicwp9i2fpFs3OfwPqPy6N7NoztH4fqTQ8IuGpjVblOz7tf7ywWj4lhAMIoZXEzhT5fsgqcwT3v06aBPjBY1HibycNHEyg4WXGO2scDvNSJbgi0cgfpK493aNVOVqdkkV/EAfNN78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by LV2PR11MB9540.namprd11.prod.outlook.com (2603:10b6:408:378::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 22:57:07 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%5]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 22:57:07 +0000
Message-ID: <62138680-4a60-493f-acbd-06b7bc7a00e3@intel.com>
Date: Tue, 13 Oct 2026 15:57:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 0/2] Fix igt_runner hang and resource leak
 associated with pw-reserve
To: Gustavo Sousa <gustavo.sousa@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::25) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|LV2PR11MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: fc985a21-8a16-4fe8-bdcc-08df297d4e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|22082099003|18002099003|3023799007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 73grK6b0zjj3c5i0H0od59sSDhQAqBs2z8LtodoHjLshSA0AigXbVzbygLYPpgBO8//oyF4MGdGlQuuMbgrXPo9Tq59JeyGAUeYnwy8cVXgnM3OtSJMm9hTftxsCuh5e10XaMEOd4b1ymweDBOnJcNjbHAs0CnYozmkr+SdXzfPbWEHdNrKatdM7+kRK32CPqmny6zJsGybO3aKMD9iDB25niYzY/1HQYVgeKQQoT9CJRnto2CiVNYkuIPlOZYDpZ2f/MafG6uI/xaJ0HHMtVZipPeyivAiKA9zgcs+0GyaQ3PdsNtX89xXRAFh5lubITti8FSwifvgCrRxImH1iRpq8yFS4lPMN9dKkhpbj+fFAEV/CiPnfreqDx0WMXbga1EjgrXFeej18Fzja54ZgRaKbHl9WUH7nq34Y/u+e/2KrIdCbir+HwGcHlMQEK0lwDH4ksYInVOG/IW8+BxiJyE48PBoJMfz6jniRP523mwdni+/KfxqHzuLWv2OLfhD0SKeQlPAGW2z3VCRbAGkJJaM49tA0aSkqZuW+kWSM4DhOX8Nqxj2zCNDR3C8cfXeoWbtM70xaSdZD7PkdjbTQ9pijxz+4XGMNpnvDHsSpSkbLQQcXaTNmjapYuSUHeYMm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(3023799007)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDM5R3NOdGZwSFUrZDEzTUl3UHM2Y3E4ejcyUHJDUHE2eVFrRjBEVjhHeU1m?=
 =?utf-8?B?M3dHYmdDck5zMjhUaTJoQ3Bkc2JDU0ZMYXpzNGZsU0NWaUVLMzNpZ2VzTjRQ?=
 =?utf-8?B?Y1hXR2pPLy9NTURibXJDSXllNy9LN2E1eGJFcitEcVhBMUJEQU9kNi85b09u?=
 =?utf-8?B?VVRKS0JtTFoyb0NUVzd1dFJOcUFMR1VpZG1wRklPOEVwb1RLMUUycC90L3lW?=
 =?utf-8?B?MVo1M2NTVmdFR1pUaHBJd2RwRDlRUVNXQzNrZ0p2dENJcGFqWDdhTjlkL0NZ?=
 =?utf-8?B?cjNEZEVFcTkwUHQ5ZWRxQzlzK0w2bldkZkdjTlp4REJZWjRWcXFleGVsTmhz?=
 =?utf-8?B?ajNkRlp3cWlydGFYSm0vTzlmSzU4QVBQektaMFZIenMwZFZtTkxlZWdDaUYy?=
 =?utf-8?B?RVc2andDUXc1MTY0MkNVNHVyUVJEMGw4R1I0M2JmN3ZhSmJCV2pDLzJEWUJT?=
 =?utf-8?B?WEZ3RTJjWHVDVzBRRWxvN2RjQm0wWXhmOUJGb0Q1d2NCa1lSbmE5ZEh5T0pW?=
 =?utf-8?B?OXZQTjBmODlFTFpTRHNwVGtVSzJsTFBsVG1vclVhT0RoVDJqYnRpOUY0eWxu?=
 =?utf-8?B?WGZBQlp3UzJjQ1dEKytNNWtqMFpwRHVibDI5ZVlXN0tFV3R3amtVSURPalJx?=
 =?utf-8?B?SzJSUmtOc3lkS2JwRmszckk1OUI4aUdHN21YYkNvVy9obFpPTEhDZDBPRFFS?=
 =?utf-8?B?TkVTZmYzcG1jUC9Nc0pjWG5VUWY0VTRheUtrWmdzVjhBVFc0NVIzVnk4bUFq?=
 =?utf-8?B?TjFvV3J1RUlXbVliRDZMaXRFNU9IVTBPeFZzd05OQi81T2ZkaGR6cEt3WGcr?=
 =?utf-8?B?Szc5UjZYWmJDSkZyVVQwWlplbUtkVGxnSDM2REN4cytoOTNleDl0TG1HWHhI?=
 =?utf-8?B?M3pLTVJSeUpCY0w5UVpHczdIeGJGZjdZN2RXdlgvRkU1QVFJWm5TR2RSb25n?=
 =?utf-8?B?cjI4TmVLT2VxQkVMd3hrNDJQVGZCMnpxUmlKd0dxYitVa0RYNGZLMHVOeEFB?=
 =?utf-8?B?L0gyZ2FBZXc1Q3RqNGRXWWxsZHVWSUZFSFJ4b2hTcTRYL0pFUExtUjQrOE83?=
 =?utf-8?B?OXpmSGJwSS8xRHQ1WEhEVklrdFpyeWtqTU1WbFA2YUNtL0NtMTRtV2pzcDd0?=
 =?utf-8?B?ZHE1REJDMWJ2R0Y0N0VKdGFJWEZ1S2lhalNPSm1zODY3YkZqRXJObm0yL1Js?=
 =?utf-8?B?MU9SOGV6WjVLbDBzSzlBQzZZdGorVkREN1d1dk0rNDdKOGg1SEJ4NjJyanBk?=
 =?utf-8?B?Snc2UXZxU0ppaFlQYittbnY0aGY4UU5DWHZiRFlidGFsRnEwVVVUYy8xZGdp?=
 =?utf-8?B?L1ZQR3VZWmQxRUVrVVNUVHc1ZzhlZDgzWDlYdW54S2dSbU03V1k2Z010bkZB?=
 =?utf-8?B?TGdLRWlhdFlDbG1saUN3Ym9VOTlSY3dyS2FrTkY3RFJNMGQ1TlM3VW1HK2NG?=
 =?utf-8?B?bWxobFVIallwMWc2TURKY0V3ZkU3YmtraWNIekRMOXdvK256a2REektkZjB0?=
 =?utf-8?B?ZmNmUHdIRzV6TW40TGFhRHo1Q1FhYkNrRjE5eVhyOWo2d09XUzV6SEd1ZnJv?=
 =?utf-8?B?R3IweFgwaXZ6VWR1MlN5U25XOGVUY1ROSUpSWUN5RmZwTW1zZHRqaUlUMVpF?=
 =?utf-8?B?dml3RGZaRThES3Rhdmh1Q0xHMDJJU29oQ2I1bEJkQzRiZWxJN2p2dFJMVXBx?=
 =?utf-8?B?d0RXYnIrdlhoZTE2bnZJNEtVNlFic214V255c3JvY2RWSjFzRnpYTTVndGwz?=
 =?utf-8?B?OXN4MWlXb1BLMXJpKzMvTXFncjVyTkxSWHZ2aHAvcTV5S3owVkw0TkhMMzZO?=
 =?utf-8?B?K3luZm8zaFczY3F5NFJlTTN4dndPMVRwTFU5NU5JNEJxc1FVaUZnazlqYlVZ?=
 =?utf-8?B?cDlQMG1odE1MNWFscW45M0pua0M2dkh2U0xvdTVFMWFRMU1ZaFJCY3JLaHFp?=
 =?utf-8?B?dTJHZmJ2eFFrN1kzRmtlNDZwSDVLK1NoOXV3NFprZjB5T1RFWGxIUTEzb0cw?=
 =?utf-8?B?OGVvN1Z2TWMxdnljaU1zYkNqdTZUcGxhZVhrb2tHdzk5cDNpUTRnSjBQV2hH?=
 =?utf-8?B?MlNtQlhaaExncWxKRFpaakRaa0F4ZGtic3pPUXZNak9GSHQ5ZjN6UmlSTUZm?=
 =?utf-8?B?cjlXenk3TkVuS0VINGdaQ2duQU42N3pqRVRtSStZSGhLZU5udWMvVzkxQzhv?=
 =?utf-8?B?bFE0emJDeFRFVXh5MUdNSm1RWGtKV1Y1dGxUUEd2SC9JQ3V5dFVFVkwwYjA0?=
 =?utf-8?B?RDhtdm1MTjdrMzZpQjhiTHVZTEJZTGZueXVLSXh4bDJvamE1SHJRV3hleE5y?=
 =?utf-8?B?NVBCNGR6ell5ekhzbVFRcURBOFBiV0xNUkJsUmZKcFhSM3ZOWDExdz09?=
X-Exchange-RoutingPolicyChecked: m76/W0S5ce9gJPVMbq/4ZYtf9VvGaoW9C1Ncl6r5KhGbSy7Xj7XAlQI0Wzcz6FMdVyxo1opQUQvTPLDwqqQXLm42oCBvMHsu+kG+vDjsLFlHLrvkg7/6D6OIBMOHr8R0FJz2oAR1K7VLOf7h/f857PnIBQXdV6G3VchF5PRqNM/JMnfvxfBLlVrSUVH6PsI1kzgZbSo0wxOpnOSDhlfnRAWjyl3JvVcCLG2jG+QpFz//iKXsCoCOEErhR5sT3Cg8DHEelMgzewEQmWul3T/WPgXKOBG5bsXlAHBrQVq8qE6b26A8+ljxqPRJdQ5FKq2DP3XUoAm0ctNfpAqGySBSGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc985a21-8a16-4fe8-bdcc-08df297d4e05
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 22:57:07.1836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbba+8CiQljh/XkpF5qro2RWPXlGoR9rOtSOZ6eu2W3r3565eVUShz3dyz4swfRW/46KmJOANB8cSQXJqiSnVi/mzTPov3lQYy3iuqIP6tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9540
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


On 10/13/2026 3:23 PM, Gustavo Sousa wrote:
> When running igt_runner on an interactive SSH session we realized that
> the runner would hang when testlists contained test cases that would
> unbind/rebind (or unload/reload) the driver multiple times.
>
> Some debugging revealed that the hangs were caused by pw-reserve
> processes created by IGT not being properly terminated.  Let's fix
> that.

v2 LGTM

Reviewed-by:Daniel Charles <daniel.charles@intel.com>

>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
> Changes in v2:
> - Incorporate review feedback (see patch changelog for details).
> - Link to v1: https://patch.msgid.link/20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com
>
> ---
> Gustavo Sousa (2):
>        lib/igt_core: Check if helper proc was alive before kill()
>        lib/igt_aux: Call pw-reserve with execlp()
>
>   lib/igt_aux.c  | 11 ++++-------
>   lib/igt_core.c | 21 +++++++++------------
>   2 files changed, 13 insertions(+), 19 deletions(-)
> ---
> base-commit: aada5ae74aa135d2b448e25ec417f4f0dee9439c
> change-id: 20261006-stop-pw-reserve-ae63047af2d4
>
> Best regards,
> --
> Gustavo Sousa <gustavo.sousa@intel.com>
