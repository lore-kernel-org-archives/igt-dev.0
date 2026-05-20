Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E1DCD4F5E
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 05:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F5B10E04E;
	Wed, 20 May 2026 05:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DB/eIXzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A5910EEDB
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779253465; x=1810789465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lLMO6GO0g4YAMtaslUCEe02i3FlrlfZUZ+ambAlujo0=;
 b=DB/eIXzdkABFZW+qcIJSBBUS4wkM47BMiqUn4Sp/vGKu5eBh5l5j4+LP
 jX8QCpY+BcKAOFHLTBTrGCjRCR1CissgroWkOFX6kiiwIgvXlOD7RgS43
 g/7cK7BohvgywLNRSBiho7/70V7ABxlEWvgi6ybRyupTUc+VVQzUZeHW0
 ooH5tgJorNGDyoPArOC1JZh25B+osScE5GiOExoUSSQvmDvNmv3CZhWik
 bgHy2qwyaO+OANzTmmOoqjJyLN8Vz3QxAFDQmhzSDDkGIVVukYYeKeclU
 HbTqR+/ngqXfYIcv24jmr0++oE7tdzMxRUIJOga2BuT46OoiXPGGS0it+ A==;
X-CSE-ConnectionGUID: zDZlU+fcT5GwiwbiWdg+AA==
X-CSE-MsgGUID: vjLtrFpdSmG5qHXrAAOycw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91537760"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91537760"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 22:04:25 -0700
X-CSE-ConnectionGUID: TodF297LQ5uv55t2a8wrQA==
X-CSE-MsgGUID: KoVcdZDZSMqOiKLvEPDBrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="240282725"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 22:04:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 22:04:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 22:04:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 22:04:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcUb0Y47/q/6vqyRgfgsPQNElg2OaKTMeu64sb5j3DZenefoGLopXfXgH9StVksfHBEfz3xk2zAgbmzHVKmRXBhswVZSztvXXRhRPoD92L3S52ZEUyPeTwtRkif5eEjZRk2vqgXQwtuLsl9X2n9/wAEO8LRLHdUckLYql5648+Oe8EaRr1K07hn5RdPf2W2TjswT2dY5kVv22dUF8yAIvX63H7owiBy4iCBtzsGeZAI+Q1FRF3qIwE4FXTdw++V2ynpDoeo4BDQ+VnWpwcGs71AWIOtA/XUB0JZq7BH925Q6Zm0ueCa5Bzz8eGbaVSOIzx4kakhCVKyKuphO/S4ElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSevTbzsxKyHCQ/wNEIlOn4CfkqrCaTK9e0I7BOlHII=;
 b=ho6IugL2tINbyuE2E2IC0AahTXnowu2TPO1DHf8QRBpnuSfO/GVjktx3xa6GLihaZtO6Gk2J7xmGYOKSHZ+DxEvWTmJzWowDt8eOPde3RkaIr/1ExEnZ+ol3uRAvvZLiVz352PAFMLN+CbfYGINqt0Wa/+jYOL0wW72zxftCr2ZXGd2aY5N1VN6Y2k+WGorIyVrctH0wIUp3VZL5PC2oYthZXrUy4QUSYqRzjbFo4a7fnr89rZhSzPYSqNyIx20YxDtUEaAg1dmbiNUIVf2lLI1lSCyjYYv8V0O2HigUFiUFMcj7PL4kkR2MQ8CE7ovezxmQANQyvTa/3olzAfq9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CH0PR11MB5236.namprd11.prod.outlook.com (2603:10b6:610:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 05:04:21 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 05:04:20 +0000
Message-ID: <005eb05d-d1df-4e2c-a034-657f608d3809@intel.com>
Date: Wed, 20 May 2026 10:34:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/: Handle max bpc read failures explicitly
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260518040353.212734-1-pranay.samala@intel.com>
 <20260518040353.212734-4-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260518040353.212734-4-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CH0PR11MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb4ac3d-f6e4-4874-7d18-08deb62d4086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|42112799006|18002099003|56012099003|22082099003|4143699003|3023799007|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: 70kxxDwRxAMHfgbQbPZoKx2vf6BBDhGYfSu4p3/bW01TLIA0yC+l1NANCbI8IdhAos9s61qs8sR7GOKGeXcQsREQjRLogs+UFLzH73E/U86MgkyrYSKqnxx8N/W4tiOjg331j4ssu7kS+HrCb1X1Sh1LmhPk0Aw3f9Ko01WNhLMI1z+TCDF4o9lyFr04KCurntH9MUaTGMvA47tlvDH8JGPFS/W/hCsDvtCH8dWTN01dIpq5ziEYSsLD8apzrO8TWiofCFAL0AF9cI9ZtNiiZwhOS725Yon1mECAEyGHy2jVv8laaXlGWuMcTTYtQCOMHUxlIVZNJPQkEOpYeondFsdWfkn1bFQSqGdytBj51tryRmk4eJ2ijvuzWm87yJKTxf4Jt8cf99dN9KuC9GvlINuCebCwZFWXx+pti3gRhYQmvyV7tr90ojdaYgrMpb2D8dvP6BCUkZthR3xlBxbY/udYfvg49jd96ryp9/HuEmulq3P51eXwP2V83q35RKoc8XP4K+fY2vDLB15wxCshsK/KKmOPQyAmIHYuFrZXlm+yoEUujt/QWMs9e+/it9KR6HAYxj7E4VgKNAkBEHt0/gDoxxUNAFutkd8xWdT948j9bBQjisBR/dpO53AJ4Sz1VEr/wQwCmnK10nHKSvUxdyEIJykP8p4ZrH2dgNMO1COJsRVaSwdHyVRxQ+j9RYFT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(18002099003)(56012099003)(22082099003)(4143699003)(3023799007)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTQzNnZiRWtRMjk1TjFVQ2pzNGdqUXI4dURDNTlxWjhSMHR3TktYYW1IVlNK?=
 =?utf-8?B?N1FLRDIxSlEwcWZkT3R2ajl4SkVrUHlQdS9VVFovbWIxakVDbmV3ZmdPd3Fl?=
 =?utf-8?B?dE4rL2tFcnJGdGVKQTROVGFaam8zY0V0eWRQMTFHS2I0M2tkdTY1YjhRWEF5?=
 =?utf-8?B?Uk9LRGNtblJManlkbnBwZXRVODlpY3l2aFZDZ2dsdVpGRXlubVhCYWdVV2Iw?=
 =?utf-8?B?dEtUOTlZaEhWQ0NNb0RTQWdyVHJXNklSY1lhOGxXcEtlOWlIMHFSbk93K2tC?=
 =?utf-8?B?QnNPQ29Nc2NOTE84UE5wbGhic0lic2hkQmJVb0xtYitUdlZ5d1hFa0xyclFu?=
 =?utf-8?B?OFNxM0lHNzYzZXJrN1JZaW5ucWRMMEZRM244V2xseDlNZFh6VHY3cExNOCtI?=
 =?utf-8?B?NkVRcHFRSEpsbFJSbUpXQzU3K3VLRHRRczhRL2ljUUd5elRDam9DR0xaL1Fv?=
 =?utf-8?B?c01NeGpuTmpFTlB6ZzAxTkhFRjZ0TnpsQzg1dy9wLzR2Qk1WTTJrZ1VSWHFS?=
 =?utf-8?B?N09qRUxpOHpEZG01dkRQSHBmc2ZycUxySkJkR3hvK1F5WEltQUZ0TXZ2VkxV?=
 =?utf-8?B?QitZOENXc0J4d3JmSzg4TW9XS1hFTkV2OVpCWmNBSlNwVi9XVk9WQVRDb0Ro?=
 =?utf-8?B?eUYzNCtGMXF6MjlGOVdsSFdPZDBRbFZNOHE5aUpBcWx3L3BsbWE3ekhEdEdL?=
 =?utf-8?B?d3ZVT3VBK3hCRWdRUXhtUTRoQXVNdlMxQ0t3OUhlVEZiVk9aVUR2emtERmR1?=
 =?utf-8?B?RVJWeEZQbjJRMkxOUUErcDdpcHdVS0ZLdFQzVXJtdng2bW4yV1B2ZGF6K1BQ?=
 =?utf-8?B?Z09DaTAySTBpM3NOb0NhalI4cy9JMHVIZTRHQ1A1aXZUUVB5cXdJc3RMeE83?=
 =?utf-8?B?U1F4cURXTEZob0poYmh2bC9sRFN3MStMZFI4bGlmYVZGRU9qU3UzOG5mc25s?=
 =?utf-8?B?ZTdPM0FzSXM5YWhUUFpIQUkvR0pvRCtCN0Jkd055R2dtVitoZ1hFdGU2WWZn?=
 =?utf-8?B?NHVrV3Vwb0hacjNIeEIvRDdDSVVienFyL0RuRm5JZk1SVUpGTk1OYmhSMktP?=
 =?utf-8?B?VmFEbDZKM0ZySnpCTzlyVnhaaW1xZ2graHZKc0kvaysyT0E5OFd0LzV0WlJw?=
 =?utf-8?B?aVh3V0Z6ZndsdHB0d3I2S1NxdUFCVHhuTG1BbXlrMndDQ2F3MzU5NTFDOWUy?=
 =?utf-8?B?eFpRMzIrV25RK2xHWlUwdUpxaERWSkNlclQ1eXFaK2lGMGpPNkowejU3RVE4?=
 =?utf-8?B?R0dQZ1pRQ1ZQb2gyOUlGVEdCY3cxYUM5TWxaamVBTjdWa0xUTHFvd0FKNVBM?=
 =?utf-8?B?dEQ4NUUxbXJKRXcveGFTMHI1Y1I1VVhKQ0JMS3Q0Z1ZBazYyYmtmUEQ0TWI4?=
 =?utf-8?B?TGxoYm1zUytLVytQOEIzNGtMbXU0amtpT1BEa0JaRVdvWkRWOUhtajRSUHd3?=
 =?utf-8?B?eC9hbVV1bGVmTkpsZGJXRmROYjMzQWQzNng5NGlDeXk1azBYQ0ZXcFZCVW5H?=
 =?utf-8?B?NlU3RzVQbVNTWnRDNkZBcStjSythWXNLa0NsNlR1L05LYXVvb2xQZmpaTzNB?=
 =?utf-8?B?b1dtaUtKVDMwRUwzK3U0cHorSlp5WVk2NHRVL2RJK1RPK2NsdzJ0VG1GeW5M?=
 =?utf-8?B?S1BpbmpRWlllR0VTa25SaVF6c01wejc3Z3ViTmtLeS9jV3BZbytoa2FoYSt0?=
 =?utf-8?B?bTBnTVJ4NnIxd3JvNDAxUmhqTldlUWVHYWhMWmJtRjF5TWY4UGxISVkrQ0ZS?=
 =?utf-8?B?VjZoVlppekhqYWM1MHFJTy8vV2tTNWJvWHV5VEgrbnlSc2JRTXJIQTBZQk1K?=
 =?utf-8?B?NXZDNVlUOEZzVmZsbkNYZjBKTkNLbnRQdFhzMHhhY2pTUXRrMmtQbERHVExm?=
 =?utf-8?B?RWZjTlVFNC8xZXlwcmk4Y0g4emxVazl3ajJRUkRKZ2pCRzVrSjdTQS9CTGRC?=
 =?utf-8?B?cGhqVVE3cS9iSTJacStjR0t1Z2Q1VEc1Sk9tVFdJZ3Z0UWpSUjNveXJWdVRE?=
 =?utf-8?B?cDBzcUZVSVdXdUxnaS8xK3ppRTJxOHN1NEVkWUhBOUQxdUtrNUV4S2tDQmRz?=
 =?utf-8?B?OGdwVU8zaFk5akVtY1hDK2ZRZFg1VkF6UjRZSTFReGMrY3dHRGs5WHRQUlMv?=
 =?utf-8?B?UFp1aE1hOTdUOVN2UmpWSjZFaEhmZTByMFlhUXEzT1cxbEUvNEI5OU9xK3pP?=
 =?utf-8?B?eXBNdk40cmRSUUlLc0YyRjB1Vk9zaTc3eW9VQkpTb0pseVpwVHowY0ZJUStk?=
 =?utf-8?B?ME9OcmF6YnlHb3VuOVNIdUVaNXc1d0dHc1JkdlhrU00ycUt4NmZ4eGRQNWtI?=
 =?utf-8?B?eG1SYmtVc2drUU5xMWhTaTgrd3N3bGlUMC9vazB6aUNYaUZ5MUtvdz09?=
X-Exchange-RoutingPolicyChecked: rcsGI0tWgKq5IN0WdWItUiQrrNSMEz229iWGFYI79CtZORwA776cwm+nfXr3uyDTEBj6tdHs0DOOYKpICZs5SJHk+48QY0MVA6Ent7n/DSLYV2lGw/3Wt6nbuGTtNpxBFonD2yWQrwmxe8+l2vdiLcPIKssPTnJ7VTCrzyR0p17bO7N24CdW16Ji8djQBesrBT2b/Pam+/E6qJXysPCV3SiBNe2tF5Eqmyz98y8xB6LytCLkxuGRMR/U4PCxLrFkupMyL2Mgp8OcjRHD3bpuxqQB/cXVjm+vc3lLCyc7XpZfDM7+i1GfDm7cATrKMYzXBuCvFYotUPeaEdOLafJrGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb4ac3d-f6e4-4874-7d18-08deb62d4086
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 05:04:20.9293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlrdlHgloFqOwMxXIrvkDxbzTj7emjxOy/COUsLvm894xZkp1av2F1INeYNG1rWLFURXzyS4j3YmXHnnfarMQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5236
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

Hi Pranay,

+cc Vitaly Prosyak <vitaly.prosyak@amd.com>

@Vitaly: Please take a look from the amd tests POV.

The patch LGTM in general, other than the fact that this patch needs to 
be combined with patch 2 to avoid compilation failure there.

Regards,
Karthik.B.S

On 5/18/2026 9:33 AM, Pranay Samala wrote:
> Update test call sites of igt_get_output_max_bpc() to use the boolean
> return API so each test can decide how to handle max-bpc read failures.
> This separates read/parsing failures from capability checks and allows
> the test to make an explicit skip/continue decision with clearer logging,
> while keeping normal capability validation unchanged when max bpc is
> read successfully.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/amdgpu/amd_bypass.c              |  6 +++++-
>   tests/amdgpu/amd_dp_dsc.c              | 10 +++++++++-
>   tests/intel/kms_dsc.c                  | 13 +++++++++++--
>   tests/intel/kms_frontbuffer_tracking.c | 10 +++++++++-
>   tests/kms_color_helper.c               |  5 ++++-
>   tests/kms_dither.c                     |  9 ++++++++-
>   tests/kms_hdr.c                        | 16 ++++++++++++++--
>   7 files changed, 60 insertions(+), 9 deletions(-)
>
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 3c537ea9e..e59691f16 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -323,6 +323,7 @@ static void bypass_8bpc_test(data_t *data)
>   	igt_display_t *display = &data->display;
>   	igt_fb_t fb;
>   	enum pattern ptn;
> +	unsigned int maximum;
>   
>   	test_init(data);
>   
> @@ -345,7 +346,10 @@ static void bypass_8bpc_test(data_t *data)
>   	 * Rx supports only up to 6bpc, Rx-crc will different from crtc-crc
>   	 * with 8bpc.
>   	 */
> -	igt_skip_on_f(igt_get_output_max_bpc(data->output) <= 6,
> +	igt_skip_on_f(!igt_get_output_max_bpc(data->output, &maximum),
> +		      "Failed to read max bpc for %s\n", igt_output_name(data->output));
> +
> +	igt_skip_on_f(maximum <= 6,
>   		      "check /sys/kernel/debug/dri/0/eDP-1 (connector)/output_bpc\n");
>   
>   	igt_create_fb(data->drm_fd, data->width, data->height,
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index 1742c7df4..dc71e903e 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -480,11 +480,19 @@ static void test_dsc_bpc(data_t *data)
>   
>   	/* Find max supported bpc */
>   	for_each_crtc(&data->display, crtc) {
> +		unsigned int maximum;
> +
>   		output = data->output[crtc->crtc_index];
>   		if (!output || !igt_output_is_connected(output))
>   			continue;
>   		igt_info("Checking bpc support of conn %s\n", output->name);
> -		max_supported_bpc[crtc->crtc_index] = igt_get_output_max_bpc(output);
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("Failed to read max bpc for conn %s\n", output->name);
> +			max_supported_bpc[crtc->crtc_index] = 0;
> +			continue;
> +		}
> +
> +		max_supported_bpc[crtc->crtc_index] = maximum;
>   	}
>   
>   	/* Setup all outputs */
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 605ad2d5c..8008fc045 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -265,6 +265,8 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
>   	for_each_crtc_with_valid_output(display, crtc, output) {
> +		unsigned int maximum;
> +
>   		data->output_format = output_format;
>   		data->plane_format = plane_format;
>   		data->input_bpc = bpc;
> @@ -275,8 +277,15 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
>   			continue;
>   
> -		if (igt_get_output_max_bpc(output) < MIN_DSC_BPC) {
> -			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("Output %s: Failed to read max bpc\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		if (maximum < MIN_DSC_BPC) {
> +			igt_info("Output %s doesn't support min %d-bpc\n",
> +				 igt_output_name(data->output), MIN_DSC_BPC);
>   			continue;
>   		}
>   
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e7bb3fa18..996a67ee6 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2777,6 +2777,8 @@ static void setup_drrs(void)
>   
>   static void setup_hdr(void)
>   {
> +	unsigned int maximum;
> +
>   	if (!igt_output_has_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>   	    !igt_output_get_prop(prim_mode_params.output, IGT_CONNECTOR_MAX_BPC) ||
>   	    !igt_output_supports_hdr(prim_mode_params.output)) {
> @@ -2790,7 +2792,13 @@ static void setup_hdr(void)
>   		return;
>   	}
>   
> -	if (igt_get_output_max_bpc(prim_mode_params.output) < 10) {
> +	if (!igt_get_output_max_bpc(prim_mode_params.output, &maximum)) {
> +		igt_info("Can't test HDR: Failed to read max bpc for %s.\n",
> +			 igt_output_name(prim_mode_params.output));
> +		return;
> +	}
> +
> +	if (maximum < 10) {
>   		igt_info("Can't test HDR: %s doesn't support 10 bpc.\n", igt_output_name(prim_mode_params.output));
>   		return;
>   	}
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index 24663444a..a50ac3a37 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -40,7 +40,10 @@ bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
>   bool
>   panel_supports_deep_color(igt_output_t *output)
>   {
> -	unsigned int maximum = igt_get_output_max_bpc(output);
> +	unsigned int maximum;
> +
> +	if (!igt_get_output_max_bpc(output, &maximum))
> +		return false;
>   
>   	igt_info("Max supported bit depth: %d\n", maximum);
>   
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index ca367db61..236e5c7c0 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -206,6 +206,7 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>   
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
> +		unsigned int maximum;
>   
>   		if (!is_supported(output)) {
>   			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
> @@ -213,7 +214,13 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>   			continue;
>   		}
>   
> -		if (igt_get_output_max_bpc(output) < output_bpc) {
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("Output %s: Failed to read max bpc.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (maximum < output_bpc) {
>   			igt_info("Output %s: Doesn't support %d-bpc.\n",
>   				 igt_output_name(output), output_bpc);
>   			continue;
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index bcc912d15..2f19b3237 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -254,6 +254,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
> +		unsigned int maximum;
>   
>   		if (!has_max_bpc(output)) {
>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> @@ -261,7 +262,12 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> -		if (igt_get_output_max_bpc(output) < 10) {
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (maximum < 10) {
>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>   			continue;
>   		}
> @@ -532,6 +538,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>   
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
> +		unsigned int maximum;
>   
>   		/* To test HDR, 10 bpc is required, so we need to
>   		 * set MAX_BPC property to 10bpc prior to setting
> @@ -556,7 +563,12 @@ static void test_hdr(data_t *data, uint32_t flags)
>   			continue;
>   		}
>   
> -		if (igt_get_output_max_bpc(output) < 10) {
> +		if (!igt_get_output_max_bpc(output, &maximum)) {
> +			igt_info("%s: Failed to read max bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (maximum < 10) {
>   			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
>   			continue;
>   		}
