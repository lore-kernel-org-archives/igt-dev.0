Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B9ECD0429
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 00:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC4610E1C5;
	Tue,  6 Jan 2026 00:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Kf5RK0iB";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011010.outbound.protection.outlook.com [40.107.208.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B63610E1C5
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 00:54:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dph3Xe+d81IsbS1wx8CazFlBNFJf7KPHRPbeLxWFbEOXY+AoYjTHkEPj5T2g2DeiYc2kfsUyGtghTRYxBOkp6CKj42KXCjxeChjI/Kq6LiPhdovK6qbahs6ifysNzhX+F266jAxdTaks1Ll9L2/ZKbt+nzmQGvxwdAot8iz0o49URwz5bOC63adCIm/1zYVAfvxmcf5bdpOnPMoccTsQdmW4ImVugaLo/zEVUcV1zQTEt9WeKDpu1e2lnKOTqBOo81DsZaOFI5x6k6KqaOfW4UoYh7P/jpYEqZgh1IbdFPArVyb5H5OcGDQ5DFUvRkeedsjuiQqoVnBd9l6zHRzx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p2C0GgLYr49NClsqKaxskuAbdz+gAtbTl1x+cSvYys=;
 b=uQmJng0Kkp/Fmpfp3XdGAn8w2rXiISPgtiAVcSq8BpO2eBZ2RCNFKrki2aDsNn9z1RKQODbeVoIPm79B0uQWZVJao39ofLqMVx9csx8bZRFWuSfish7JcNvMZsRLfxAlW/7gtvV1PoKQe5q4uvGv3GRpVhSRDIn7HCbvOHnWTEF//e02Zdvb0IKnTmg8cwLDb/WX3h/9LBO0iBKLf17smVawIWdftf4lid4vU3R+sRujdTGR6hjYmdeFwabGWVf9Zx6lTXMTuXGl0DT25jR6M9vXIkaC87MBZKJWaNvCJ3e55qLGX4YqlLsb2NQcRIu9zbMNcnsqswLiGzX9zowH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p2C0GgLYr49NClsqKaxskuAbdz+gAtbTl1x+cSvYys=;
 b=Kf5RK0iBOrc0NS04uPP+N4XIRdMQdKjMKmkApFrd3WtAxOm6yag8zWDm53UFGNBEqfZbffJ+hTQrFlTzjMYAWk6zTqmSkcKUW8embxBq8UCAplH8llCtymkJKdY3oISQl7HQVefzOCi2ezDsie6KTI5GF89zrQsaI3UMSt2juWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 00:54:12 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 00:54:12 +0000
Message-ID: <52e2d0cc-6aae-48be-b864-c7eca78eced0@amd.com>
Date: Mon, 5 Jan 2026 17:54:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v9 3/5] tests/kms_colorop_helper: Cast pixel values
 to double
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20260105210603.62170-1-swati2.sharma@intel.com>
 <20260105210603.62170-4-swati2.sharma@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260105210603.62170-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::29) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 537136fb-6f30-4891-7d1c-08de4cbe1ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGI0bWI4YkQvV29tZXNrcUhjYm5Ed3c4RGFkVThNM3RjUkt5cW9xUHNjRURT?=
 =?utf-8?B?cHhuWEh6Z2JWbDRoZDcrU2VLdlFqZmFZZTJhdEVtaVhTTmY2ck5WOW9yeStN?=
 =?utf-8?B?QUFkRGozZUNhejBCblArYnlEM0FtWUtzMGtPblZNR3ROMVQ0cXZWWXVieFhJ?=
 =?utf-8?B?QklrSnJxY0NxdzR1a1lzRFFVTkFnZ1lKMkRzT2dJdHgxdVErT0pKeHhrNXY5?=
 =?utf-8?B?T0hDUVk3azZyT0lKVC9qT1QwNktaeWduQkRBcWp2ZFBpMHVJYUxIMXFsR2tI?=
 =?utf-8?B?Mi80M2k5NjF3RlV2VXBVcDNvSFNlOGRVMXRjaFdnNXc0Sm5IVmxUYWxqVnBh?=
 =?utf-8?B?dTl1TmMzdnhRMVNNNDBUT25uVHVaZC9ZSktZS2ZGYUZ2U1VvT29RbWRQOTYv?=
 =?utf-8?B?UGdRWFFHaDZsaTJnMmZmdDBLdHBzUDUwcGFGdWVrSEtQdVRJcFhuWlZZYVZV?=
 =?utf-8?B?aVJOVmJXNEg4VHV1N042R1VuVG50VG40NnoyUHhHYitXR3ZOUzJKT1p5WEMv?=
 =?utf-8?B?UzRyTSt0QXQwNlJabjg4NHJpVGdjcW0rUjY1dENxTzR1b3FzNFJJenZCL1RC?=
 =?utf-8?B?ZW1LN05CakZFTFpZdGZLMTMzcnpjR2c2T0ZNMm1vdEQxeGRXbjBkV1k3VHdU?=
 =?utf-8?B?elZYMUJJTElnZUwyU2tBd2FsdG5zQTUvRWNSMTVmVnRwL3Q0ZEl1SEJRTGV3?=
 =?utf-8?B?TDMzUG5tMFEzSnlmbGhwR0lUNVlQOVdjVU1OMUllK2t2MXhJNkJ3MVlmcjUw?=
 =?utf-8?B?UWFhcVFXM2hkWEZEcFRkaXBaU0Z0aVEzR0tlS21FSDBJMG4zc0svclMxcGpi?=
 =?utf-8?B?YjArbW9nMDh3WjlpWDVtVUFCbERuMUZ5a3plbythaWVMRVBsL2pxTkxreXpV?=
 =?utf-8?B?bWZtSEtTNjBLcDl1RzVwYW1EQTFvNHZLcHZPbVBra0RWQlBONFhUSm55WGhR?=
 =?utf-8?B?cCtqakpqRk5ycFZwV2FtWWEwSStyL09LYzB6ZEk2UWUvRkZPbGRqK2Z1aHIy?=
 =?utf-8?B?dXFXd0NWNVliaGFFdm1mNEl6bVBORm5xTnkxS2oxODRQVTdzR2dwNC9RMERO?=
 =?utf-8?B?cEYvQUxTRkpJYUxrQVBVSEgvRXVaQTJMbEFid0tWL3BqVDdIcG5qa2lFbTRO?=
 =?utf-8?B?QWp1ZFFmYkdJTzlTbXRRa3g2N1luY21wdHVmWFBJWCtjNWhmWDQ4SVF5RklF?=
 =?utf-8?B?N2dvN053a1c4L3RqVHZOOUNLaXdxQ1E1d2pOL0tYRkdTa1g3S25lcHJ4WTMx?=
 =?utf-8?B?WmwzMGFsUE5wUjExc1FHb1VCRGJYOGVwenA0RjdxZXpzRk1ZUHVEbENyeDNE?=
 =?utf-8?B?QlZXQktqSUd1L2RuQUFSYUlESFRYN1ZIa0gvdHZmdjVXbFVUOXFIUlRxakdV?=
 =?utf-8?B?ODdpY0I4Mm96RytIbUpSL29qcGxCcEZ2bnRHTW55VXM0eXNIajZUVktrY3k5?=
 =?utf-8?B?MmF0cUxBcWxmV1h0Vk95ZVIwWDRlVmRvTnFxakNCcEJMb1IyNVVWSndkUkRy?=
 =?utf-8?B?UWtMZFBnOXpnWTFSWk5FUEQ2YTN3clFLc3YxNEJKNHplNlI0a0dUWXU5dnRD?=
 =?utf-8?B?NUdLK1RzaVA0NnBKV2JnT2d3bHgybndQNU9mWHdtY0c0cGRCZVhkMjVzZ2VO?=
 =?utf-8?B?cXpER3dwanVkeGhsblFOQ21tTm02YXM0RkEwQVkzRFN2TFZGWnJveThwbjVN?=
 =?utf-8?B?UWpxTTVyUGJTWnQzNXVqTStzWnRWM3RRTXpVTENxUzQwYUdRaE1ETEc3Q3RN?=
 =?utf-8?B?ZkE1NVM3Mm94QWpMWk9URzJNTlY0cyt4aEozUlpGZmZEOUhMOHREYzZHbDE0?=
 =?utf-8?B?NHJ6d3JONDJBQ0NLTjhJYm1WbjYvNWdnalVkUHFHQnBHUklBbWdPWlJDMS9h?=
 =?utf-8?B?QThWNytKWkN3MkxsNThrMEkxZzFaai8wemEvSmdRaHUvbVpCNE1yQW5lYUxm?=
 =?utf-8?Q?TyGOjLlypujY8abuOSZ9COyvBdKtdcz9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGJoT2g5TUdXV24rYjkxZlJNeVZTTlZrb0FhNVNhNUZRQmFWZGhkQ2RGVzg4?=
 =?utf-8?B?aFlpK01HWUgyYXVoaU9TemtYbEF1ZUpFRUpVeWtFa2xZcUJLSTlDM1pUKzA3?=
 =?utf-8?B?ZXRNMUl1eVE2K0FSYm9RenZ4REY0clpYSUUyRmFqbUdERVRFempHd2NiT3Fj?=
 =?utf-8?B?SklocnBWZjhKME9xM05XV0U1RzEzL2daQTJwQXRoM0MweFJlaEh5RUgwSkFn?=
 =?utf-8?B?bkplVTNyODlNcXJycEV5b09PQjNScldoRmFyTENJajMyUVJJOFR2eWlQRzVQ?=
 =?utf-8?B?SE5ERjQ3T1NIMnpHVzFuUEMrQXJiSmJQUVQ2UTVSYndoWk5ROFczazFMZ0t0?=
 =?utf-8?B?UmpDY0ZERmdjVXdKTFArbUdhT3ZZdmRiT21rRVRvU25vMURiSlU0aThMNXBx?=
 =?utf-8?B?K01IMGVyby9ReTZsaGp1UmVtOU9RN0c1U3RlSWZlTjQ4dVNPV0lHcE1LNFkx?=
 =?utf-8?B?dU9qVGwzSmJvRFZYQmlVKy96R1Y1SktrTkpDVDdYQ1pGWmVEaUZGOVQwRDho?=
 =?utf-8?B?UEpmWDMwK2J5K3M5YXRVaWRPU2x5N1MzbnI1SFJLRmZCMGdSNjBGdWhmRUZI?=
 =?utf-8?B?R25iV3dxanZWRFp2Mk40WFo5ZmtDb2wvc21YUk5NWE5QQWdFVWo0bGdUZEUw?=
 =?utf-8?B?TDlrektVcVZkdHl4QXFwK2Q1am91L2pLMVI0ZjN5Q2Jma0xIWTJEU1ZzeG9Y?=
 =?utf-8?B?emY0azMyQWlGSW4rSlM0V0tXb1dBTmtIR0doSUhWRlZrTnNOVG5EbjcvQTFS?=
 =?utf-8?B?bHNDdkFoNGdGai94WVp4WXNSZHRDWDRYRDhqb2pRU0VBUGF1dVJMdEt2d0NH?=
 =?utf-8?B?L3JJZlI2RnpRUHc5QTNXaWRmUlJ2bFE4N2pXUExKWjk0RGQwcFphclYyMkk5?=
 =?utf-8?B?V0NscGxrbDZFTWZFb3d3NENBU3A0ZUdjVWQwTWtmSllZaFRjaGQvUFFBQ0Ev?=
 =?utf-8?B?TnhJWU9vZTNBVEsyOFNHVEJFK3JoTnJCcDVOYzlPcjB4WUdXbDBvYkJsN3h3?=
 =?utf-8?B?Y3lyaWt3MHhKTllrNVF0ek5xYWZHcWdxS1JDanU1eW5heTVrUk9rSWgyV3M0?=
 =?utf-8?B?bW5WVE1IZFFsUVluZk1QbWVIbkJNNlhsS1YyRnN3WFk3S0FuL2lhUnFpSWdq?=
 =?utf-8?B?dDAwcy9JMGxVWEVlNzY5SGFrQldGWlBJMjVGSFZXWE83dWY3eVBnbU94QUs1?=
 =?utf-8?B?ZDJ3M05iNENodzN0VVdoTHhNSmxNVVNOZFVrZGoveHBKQyszSDA4R1l5SDFF?=
 =?utf-8?B?VFFHN0hJNEp2VEV0TWVUWERsRzg1OVVLY2VmNzNjTElmNTQ5VVAxdlVnTHNS?=
 =?utf-8?B?c2tnM0pXQlkvcDJna3FLT2RjdVMrcWVjMWJlUndrRTArREdHWHU0dTV6dWZT?=
 =?utf-8?B?MHZLcXdtMGp4a01sT3EzNHpoYnVnays3NkhkaEsyamtEU3JtZkU1V1Y1RmRk?=
 =?utf-8?B?RjA3N29IOHhyVFhtVnpiNGdTMytNMkJRWU42ZmZFalZMTCtHTnMreFpLYmtl?=
 =?utf-8?B?NzdsNWUvS3g0ZkhiNkVwRzVGV3VBR0ozNXhhN1V3VFJBZWJ4eXV0Vkcrak9Z?=
 =?utf-8?B?K0dPWlZtVGZsKzlCMUJZR0lpa0F0dm9LanlRSmp0UGI3V3BDcjZVdDJ3MzNJ?=
 =?utf-8?B?dlBrcUpjYzJMSkl3WEdpTFMySXMwVVJXcThraGhsZ2FLaGNzcnlMMEljZ2Qy?=
 =?utf-8?B?RUhsSXRuTmJlTnVKZmg2b056aU45NE9BTFJRa09TZHVERUN0a2Z2NXpOT2VF?=
 =?utf-8?B?R0UvTzByTXczSm92QUxVaUNUTVU3cEtyTisra0M0KzBlQi84a1dCUldEaHF4?=
 =?utf-8?B?Ym81V0Vyek5SbmN6SEFXWHdlT2pkVS9RWEJCNUJmeHVYeXZiWWVYWEUrWHV2?=
 =?utf-8?B?OGRvUHVMQURGYzlvWG1ROHdoS3Z6aDk3Y1BBajdXbUhGUGswRnBQb3ptODJu?=
 =?utf-8?B?ZzdBQUFzaGEzSSs2OEpicC8vd0tBNTdDcmZEb2FPczdwUnArNG9pM084L0pL?=
 =?utf-8?B?Zkx3Mm9XZ3FiSDJ2NC85N1phcVFCbkFMUUgxc1dGSmhNK0R5SUxqU2ZhWkti?=
 =?utf-8?B?cE5IWEVjZU5rU0kwcU0wRGpYQWZHNWMrUWVKWHh4Nnlvbm5uNlFFNGdhQjNp?=
 =?utf-8?B?MG9oQWgvODZBVG5iTWJCYnhBUE10NEJ5RnFrb1VCd2l0QUEzSFpmZ2QrTkR2?=
 =?utf-8?B?UVBPdWd2Q24vSkxaOVYwT2h5NkYwQlgvR1IvZitGb09hMUxVdmpaTnNpNXZt?=
 =?utf-8?B?QlhxVGF3Z2dEOCtmUEYrUVF4VlpFMG5KdEJBOGwzVDltVmhEUDlLbUJSQU9W?=
 =?utf-8?B?c281VHdTdjRaUGRNUS9ORmZlMThNZVdlWW1kMEpLdzFoU3MwZk12QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 537136fb-6f30-4891-7d1c-08de4cbe1ba6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 00:54:12.5601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6g70wCj6Hw+ZLFn0fMN5gVCpVnJiyYWTaGu2JAaHl/Uz6pX0DKmT+xNdEftyLpwXyur16rStpb4XrqqApBdfEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 1/5/26 14:06, Swati Sharma wrote:
> Explicitly cast transformed pixel channel values to double before
> scaling by UINT_MAX to avoid overflows for values approaching 1.0.
> 
> v2: -improve commit message (Chaitanya)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_colorop_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index 76728b47b..152e90f26 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -300,9 +300,9 @@ static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
>   
>   		colorop->transform(&pixel);
>   
> -		colorop->lut1d->lut[i].red = pixel.r * UINT_MAX;
> -		colorop->lut1d->lut[i].green = pixel.g * UINT_MAX;
> -		colorop->lut1d->lut[i].blue = pixel.b * UINT_MAX;
> +		colorop->lut1d->lut[i].red = (double)pixel.r * UINT_MAX;
> +		colorop->lut1d->lut[i].green = (double)pixel.g * UINT_MAX;
> +		colorop->lut1d->lut[i].blue = (double)pixel.b * UINT_MAX;
>   	}
>   }
>   

