Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A9EC43458
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 05:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A483710E296;
	Thu, 16 Jul 2026 05:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gv6iTEjM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBF310E296
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 05:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784180778; x=1815716778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=85rw512Kp1NiJ1G8s1nxi6Yu7P2usMbZxFV2qU4wo8k=;
 b=Gv6iTEjMNYf7ngK0FvUOi43Jdy/uGQX36NanaU+GUHUBwSoIaObhzpL8
 TEArVVO3zRtHATBAtoJnp3eSj55IFTUhPcNAjyELdpvEXVWr+VgsrvjdC
 eZDi0G5WoY0Mo/rdn9lQTU8i6TQyU8k2PliOSShOTm0sfaj4KwkCxs2eM
 ZHZGUdCbQn/+6Tp7+6OpqJmxMi/KLhNqPKIoH8VOEVTYueoFcjd0rjlPh
 0hvlPRuQxiiprC+H6Rm8swEIzQkz3H0nbEcDF1tklapG9u0IQYMKpuMt2
 aaDKsAi1Dn2CddU1wO3+I110YVEjAnoob51htRf8r178N27K11T3mM6lO A==;
X-CSE-ConnectionGUID: a587A+HDRsGmPq7NWkaE7Q==
X-CSE-MsgGUID: nIZ7V7hYRk2YlWEc4JZ4+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95183701"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="95183701"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:46:18 -0700
X-CSE-ConnectionGUID: 2ciT8iY3STGTJmPawe9lxA==
X-CSE-MsgGUID: zCfZ7u1mSQKfDjMH0aUmHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="260206832"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:46:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:46:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 22:46:17 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgUS4eZTiOGcHAUocfdsUxyqrEdjyjnGQcO2lwQIoE4kldcJGTAXlB9jDIj06DKr+AMfuv++doDJC1t16ol6lVtcbRHoVogEKTQ2Vr9oUpC1Qm8vd9WB371zc64fSF2D2iGHVpJlCtmARPsYR/YHbfUwrRn8LxXtUNrm8i86LXZ5ioIEylWLHyuOUOULxGb9Xo+NaemDGSu3YL8kzdYBR0ry47m+Dd1qZAgJ24MLr3ld3znQTFOfYNy1OFVEoORbW3fI9MTkQ37q4dnnZpP0EtKm3phCwBxr6qti2EcVBkuyL3kMCwA6jPUviVP5TJazT553ZHZO29163BWK4SDVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlF0eS0N0jQwH+p7pVharXAgUkGCrOrooijn7UHWsd0=;
 b=q2QVW99oFLASVYzOn+D6vZErRyxtlkiAb51KP6KGKppvpjoQCtAHYUOKoG+6exlc7Wi2zHXHvW32mCzokPS9uGnHj6atWQm6mCJhYWhGnr2/iIcyyJ2EBRDene3YHwxe4N+D+iNQGNx2aNtvz3edCL4ajpxal5FhHiqwzVbSoDGV922gi7SFOTX2171P/h90pwGUNXFMgFBng18hZWWR52HVX297z+EQliZ8yhBPkogJoMP05JXsEpH9MGcbPZRJJjwknLdtOopBmuFMX6I1NMjP4CBOgyUjlxvCS9QuK+rYbbh74iZYHdOqe/WZYr6DQfXBGs0uzukH6qIFfAYOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL3PR11MB6434.namprd11.prod.outlook.com (2603:10b6:208:3ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 05:46:10 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 05:46:10 +0000
Message-ID: <940fc145-643a-48fa-864e-a67a729cb3d0@intel.com>
Date: Thu, 16 Jul 2026 11:16:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 01/16] lib/igt_aux: remove typos
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Mohammed Thasleem <mohammed.thasleem@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-2-michal.grzelak@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260713085515.463575-2-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0305.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL3PR11MB6434:EE_
X-MS-Office365-Filtering-Correlation-Id: 314d6ff6-e634-44ab-54a5-08dee2fd89c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|42112799006|376014|56012099006|6133799003|4143699003|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 1ygUEYPhStvzts+Ps+SlzsUXXoWdAE4luWjaWIKmEvuKGaAuEW9WPMUZQi0um9BavK7k502FFlV9DEsfX8n9TOJwawBKRfK1z+DLQx+pgSXrb5u8ORPBzAkHJ9fytITDNFbh7WxCVsHCvJ7uXFn6rDEH7L+ssmdETBKMEN/OegnV/1TaaOrKSJrYtgTa706Wznki8+WFohI4kahsKTG7Vg9QTB3k2K5FNli37hvKa3pnOg9kjskTmVGefk0xQCY/2A6mERp0/dmcuaIC+92U1LHAubbQDHW+PPj7iflgKbEEeA9ozYnnXdhsodSKi7ditRaOP/fJkmIR5BqsTNqIlp2CDcxhwM7VwXKupnsmwLeXbRjTTX/ujsVLUiBex8nVdR8Xf74vHQy/7iAX6Penqk5V5zkKPRJ6ldulApMjf2l3Rjw/YSfygLpMOGWe0ArwUX5lVcQ7eKAt5Vg+Zjee6M6J/I8G3OGjpQ+esuQqHYSV9OpBuKp7gqJghFvkqtDC2yItbjBLuZ4jznlJAK6m0dlsiMCkN7woSfrb66v04PyEhJeTl+VXf4jiOfDrj3LzTOzFkBvibRIY0uDXQVDCcIslXdQ3idLBOQNWkFJktRjQbof8X74lCebeEHaOJn9wqvSajGlUyNLnOw5fVZ7SOut812nxDAD86lWsXTJ2DBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(42112799006)(376014)(56012099006)(6133799003)(4143699003)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEJtWFNQaVNsR2JRdHN1UTc3aFJ5KzdQK3hBalUvQnY2UGFXbWQ3SGY4RW5m?=
 =?utf-8?B?aHhiRm5SbkFpdFNkTzJBd09POC8yWWp0S2NzYVNTK01VOE1STDJ0RTU2ODNh?=
 =?utf-8?B?cWRVMnQzNTdiVkR1WWRpOVoyNVArQ2FFNzd3dnpud3VQRzZHUkhRK3R2N1cr?=
 =?utf-8?B?TWF2RUhrOVNucVY4UnR3Q1dlOHp1dVo2Qk8zS05NbGozVHlBV3JoSHdMR0p6?=
 =?utf-8?B?TkNsUm90UkJjNDlraGNQY2JuUWJOejlvRHBQOTh6cFNpNi9Qa0RUZy9USmRv?=
 =?utf-8?B?ajFvMWNEOW8rNXNFdXpNQTB1NTM1YnZGc1k3ZkI1VC8vZmdIZ3Z1cG51OWFV?=
 =?utf-8?B?ai82UEVGTldEd3lnYXdpYUxZdEtHenh2cWZtejQ3ZmpRdlEzTk1vNjVRbzB5?=
 =?utf-8?B?UnoyOXN1U3FNUWxJSEVBMVFPMm1hbUFEcUxWVDNRVlVaUTl3NzlRYm5sM0d1?=
 =?utf-8?B?YUtpcW9menZVSUxZd3lLMlZsQmdrSVk4TWhjL0JsVjk3dGN4VDYwWkVUeW1X?=
 =?utf-8?B?K1JKZ2phUTF6OVZ6MXd6ZHRFWkoreWtQOU9XVjlnZUlrTEpwem85OUxkRlVm?=
 =?utf-8?B?UTRCa2ZXem1sM0I4V2pCaHFIcHZVMDR2WUhDek1YNjhSMlB5aG9nSFpBWDhW?=
 =?utf-8?B?TE5wTmlpK2FIWHRCZURUOUdYL1U5ZGNXeHpRYTNYL08zcGhneGpoMkZWdE0r?=
 =?utf-8?B?bkZkcFU3MFM3aE1xeWpXeTEzZ215N3JVRGNjVys3YTV3QjBuOTMwK1VwYmZS?=
 =?utf-8?B?YzBBbkZFbUhHTlBZNWt1d001T28wSy9GeERZdklkMktTMmR6MFFhRlJCRlhm?=
 =?utf-8?B?d3puSm9aQzljRFEzT3lZSUluSnY4WDhSUDdKOG9VOFVHSTBtem81cWtZNnlL?=
 =?utf-8?B?N0dldkI0ZmZtYTcvRHB5Snc0Mk9VMUNNdS9pbEdydHZVR3g4V1NaRW56aHpi?=
 =?utf-8?B?ZVc1VWxvc2o5cUZHK29zcVRYV2JTSE92eEl4OG1tNWJCUzdnNDhaYWJUTkNh?=
 =?utf-8?B?eEhLcWc3V3VYaUgxRk9LVFFHeWlCVHMzSTJIVk9mdklyWW0vbFMwMnJQRjVu?=
 =?utf-8?B?dlhDNVFQdFRFQTVFMVlZMXZUajhubC9zWjNMWm9pYmxCK1Jva3lnZEdLMmM1?=
 =?utf-8?B?Q0dWVmlqQlk5cjkyYXpKL201bnVlSGhjVVhwZWx6VlNXNkxCOTlpL0htS2Ny?=
 =?utf-8?B?WlNXQUtQcWpwMld5RmhKQW9VSnNVN3NidGFEaWpici9jR1J5TWcyZ05RWEpE?=
 =?utf-8?B?QVJIRmErUVltSk0xcHMyWjNyaTl4aWdNa0ZORWc0WFU5SGkzYTB5bHBDQm4r?=
 =?utf-8?B?d2xnUXlMQUcva0JGalRwNmplYkZTYWE4SEVqODlTdTIzREI3NXVNMm5aVWd3?=
 =?utf-8?B?L1U1ZzdWWGxkSGN1aUVYenJNQ0dSZUZoZE9vSlR0ZFozK3hnRFlWVlkxV0kz?=
 =?utf-8?B?MTdJS2E5NmQ0UWl4TGlaMlNxa3RzRjRvVy9ycWFDRmFZa2RNbTJVblFUTHlD?=
 =?utf-8?B?OHdUdkhqYVFtdW5tL2VYa3hqYmgxNEV0TVAvZ3FxWitmZE5BcllraWdTTXpz?=
 =?utf-8?B?Q2o4d1A3V3ZvOC9iZEIvZGYwcFlCY01oVXB6a2VjbmhyQ1NKd3BnYTc4ejRX?=
 =?utf-8?B?UitjclZMeHpOdjRvS0x0WnZjcEl0ZXBNVUc3ckVYNWdDZFFRYnA1bDhoQXVT?=
 =?utf-8?B?czFRSERXZHE5Sy96RzM1YVRyVGNqeVNheldjak5ObW9nTXExdW9mUkVTMFZq?=
 =?utf-8?B?YUR5TkpWNDFxMTdzbUNFcDFxK2J6eFpjUlhHNkJqeCs4MTlKOTVPM1RXaDA1?=
 =?utf-8?B?bGRMaUVLdklOWWNnZ1UyaFpDOHNzQ0RZVWo5VW1ONm0zNDBKazM0QWZVaUVM?=
 =?utf-8?B?dmNIYUpkT2ZTdVNGZGJBU1hUOVNYeGM5b2duZEVKbHZuRGhQYWNOQUh6MEtl?=
 =?utf-8?B?ZmJ6L3lyNUw2UDU3cDFuSEhqbmZZcXUxR0tnZ1BucE9tc0tXcG43QTI0QWh0?=
 =?utf-8?B?RWdwN3k2dDQ5QXF0ZC82aFZKbFNLTkU5c2dNZlNBTThpWVBYMG5UU2t5bTM5?=
 =?utf-8?B?enNzUDlpa3c0VjBQeDN3MUh6UVlONitFWGkxY0J0SHlUT3cvbUZpY21xelhK?=
 =?utf-8?B?R3BIWXNmYTFIRUU3MVk0a1NKR2o1OG1qdmVYZFRCbjRlRVU4UjNHR1BmRnc2?=
 =?utf-8?B?UlBGcDkxcXNSK05tTjB5SlpaLzdENlBIT29hWXZqbFNqelhEbnVaQjVvQkps?=
 =?utf-8?B?d25UZkFxcGdTLzNpME1VNjZGQ2ErNE5rbXZyYTZqOURBWThGeUFRblJwOFJt?=
 =?utf-8?B?RUZvc1V5ZHVnSXNoMGVnc2t1Zjgyd0I2Z09Qdy9uclhqMGN1WFpBQT09?=
X-Exchange-RoutingPolicyChecked: YlBxKsjak5x6hW+tcCRKBMcWBWHgTcEPLWxceLV6gToGJ8O04+xEdpK8EYTQDry1UgqmEuCiU+Zg++1n35Idv45hxCT3KTEGOgkNNb1+dUn6o2b+CND7vnLZYLD4UoqwwT/dyxoNXpRA1jQlswlgjM2q55M0ZczLf8oHfxjtNqfOMdN6Pq2hjEElnOoe9g4+PLBKVU9WxdFeYsiJOGyZTB00k9MzkFfNKpHajj9qqA3CaI2lVbOZGHCQCMQrR102+SL4ZCEXTTdPyZV/jn7ZJLdp57sPKdCPWPHUqBuFq89O7rHzqJeNX69sTp8dw10Ge7TtwiA67SK+yZ7xetbPTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 314d6ff6-e634-44ab-54a5-08dee2fd89c7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 05:46:10.3375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZCwjs6VXGr9tcqwKIsoYEN97IhPl1Rtkg70vHkbMeX6DZep7CNGjULzt198riFhuTGLuwyV+IuCUddHPkueMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6434
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


On 7/13/2026 2:25 PM, Michał Grzelak wrote:
> Fix typos found in comments.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_aux.c                          | 2 +-
>   tests/intel/kms_frontbuffer_tracking.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 0d250ae2fe..90efb8a135 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -978,7 +978,7 @@ static void igt_aux_enable_pm_suspend_dbg(int power_dir)
>    *	  cycle
>    *
>    * Execute a system suspend cycle targeting the given @state optionally
> - * completing the cycle at the given @test point and automaically wake up
> + * completing the cycle at the given @test point and automatically wake up
>    * again. Waking up is either achieved using the RTC wake-up alarm for a full
>    * suspend cycle or a kernel timer for a suspend test cycle. The kernel timer
>    * delay for a test cycle can be configured by the suspend.pm_test_delay
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 3adf14bd70..f619f77e72 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -3853,7 +3853,7 @@ static void suspend_subtest(const struct test_mode *t)
>    *   Everything succeeds.
>    *
>    * FAILURES
> - *   If you're getting wrong CRC calulations, then the hardware tracking might
> + *   If you're getting wrong CRC calculations, then the hardware tracking might
>    *   be misconfigured and needs to be checked. If we're failing because FBC is
>    *   disabled and the reason is that there's not enough stolen memory, then the
>    *   Kernel might be calculating the amount of stolen memory needed based on the
