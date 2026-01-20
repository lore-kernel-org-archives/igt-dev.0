Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1EFD2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02F810E187;
	Tue, 20 Jan 2026 04:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gC9dH8tt";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422E210E187
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:35:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4q0H+lf76uatu3Av/ZVfDs037BVE86g7afoNIzncD9UUhOWeeBDTU6/sj6u+/Wxsr46ANGVaiMYDpjcD3YxI3x8kHyGWQzu2GJs42lYc4Nx4Mu0Sr78p+R+hpc5O9ZJjVoJur02WLPRRcHLOuue2loz5nXLfuDzcbSTBrpdAJPHN2Hn35oMOBtVO/xi3oB6oQbsj8OCWnVBnDx/+QLOyv9vYV6v1f6u8kYy8MXUe1b5TgpCh9NP3PdQY/SfelExGxtJr3IXC8q3j6K6QYX46V/FXv9g4K1MeGxub207fo+yZ9oS1TgaM8DjSNSpmyWxXHolhV0odLKutfiSzjzqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VcOFUsO376gummHGaY4bHorc7Z71yl3uhPGIQ1xu34=;
 b=pOkNzxR7Um1LoEwhZd1uAY6i4esAoAOslSmkOND8P86rT+hMOJiWQeP8vQg9SSwSYs0unclHZ+1W/GzHfj3oUYd7Qgt+ulr8MreMatze/ePflYSdvwE1P33FfTrsut1r4ASd5PeoLo1nHd1FBgr6af1oA+umur2CiCJmt4e/KXO+wOwdPi6X310VNW/MFxSlR7MbPHKmYKZAQIbj/8cI2RmIZiC7JtvGAQ1mw9Q5QwwKXi/W0EUTKWNL/5V+RBpP3XH/scw/qWlyte1KgSwO/0d4EJKSqRNASgJVznuNA1piaBQBusUgoJvoYK9kzn0ebqVSl8Z5u5i4H99J49WAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VcOFUsO376gummHGaY4bHorc7Z71yl3uhPGIQ1xu34=;
 b=gC9dH8ttd6mk92GLTR5CLOT+8mlsFvMlSr7OGtxIGT0n2eTUf5UKgVM9vASsjaYiHHVC0YpscswOjg1ZG+jJwmEchiXiCMYivACGzmpDWNzrc9SkYaFXLwTeBKxsz5yIrZE+AKNo69h/5WpnfKxl6vOZeV12HNj3aKtU2WBSOZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 04:35:05 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 04:35:05 +0000
Message-ID: <8663b642-1ec0-49f5-a8e6-c50a37f8bd9a@amd.com>
Date: Mon, 19 Jan 2026 21:35:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
References: <20260119224237.561000-1-alex.hung@amd.com>
 <DM3PPF208195D8DF69335A6195C2064A37CE389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <126dc573-e29d-4982-9803-857763d6b343@amd.com>
 <DM3PPF208195D8D70C9BE60D8ABF0011C17E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <DM3PPF208195D8D70C9BE60D8ABF0011C17E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:303:b6::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: 0984bb01-207d-434a-a33b-08de57dd48e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmpuRm9YOWlVS2VDYllsOU55Rjlrc3RpTjNLM0NVL2NTVGNnSlZVd3JpSnVW?=
 =?utf-8?B?S1p3VWd3Z0RGNEZ0dkdWYjQvRXNlQ204VWR0Y0tUamN1NXpTR1RoOThrTDJ0?=
 =?utf-8?B?czd0c21Gd0YzT1U1VWV4bytra0FaVTl4TTQyZG5yTzBoYVh0SlRPZlU2OUVm?=
 =?utf-8?B?Z3dqSFFPMDluRWM5Q2JrSWsrUDIwRFcwZ091U1lVK0g2QXRIMXFzdm5haTgw?=
 =?utf-8?B?R3dXRXVzMkxaa3p0ZDFqdGo5VCttK01uZW5zTUZCaGY3a2hDcHc2VXY1dE15?=
 =?utf-8?B?YTZqTmxKZnlOZ1FuZElCeDlPRU9xOW5UWDlCVFIyYVA5bVppMEJpUWhHUlpr?=
 =?utf-8?B?eGtJRkVYUmhDeWE4ZlNPMDNLR3A3NmlVZkFMNmV3ZExNN0hJMEIwK21TWjB5?=
 =?utf-8?B?WjV5NGFCZVFEUkYzVzUrVWxxMDg3ZWs5Wi9tTnUwZHF0K3BGbXp2WGw4ak9Z?=
 =?utf-8?B?UjRNTXhoM00zN3RuZDdVTmpFaE53Rlc1dk5vQ3RobWNEVm55ankvVGxVbGhs?=
 =?utf-8?B?WE9TMlRUSHd0RUtjZW55bGNtQnFJYnZuMCtXK0tCQURCZzFkb3lrL2JIcDRB?=
 =?utf-8?B?Ri9uVzFkQkFFZ04wZFp2UDMxRXZuZkgzZC81MXFxbDJleUsvelZOaEhXOHdp?=
 =?utf-8?B?SlJUQXNXUzdWRkluRTgzVFd2dFMyWEVtWWFBY0ZDcm82VEpqSXZrUWd3RVVr?=
 =?utf-8?B?dEFlWnE2TkZNcWIrdHdBd3dmcUk0cHFyYVl4ZlVxWncxcnc3MFdLZzE3OWZB?=
 =?utf-8?B?WTFsbTV4MTl4WkQ2SjZjVXJ2WGszYzFQaFpYZ2UxNU5XUUdQdjFwdDJRUHk1?=
 =?utf-8?B?bVlzN1pjWjRpYnduMnRuOVNKWGh3anF2dDFiS1NveiswZS9sZnV4SnpMbGlU?=
 =?utf-8?B?eVBvSm1BUWVzcmxtRUR0VWVOZThzYisxUjc2WmlYaTlJa0t0RkFqc0tsWHhh?=
 =?utf-8?B?UFRhN1QwRE1WQytuR2hxUklvRkxCWmtLVHovWVJKUFJTQVp0TmQ0NlNwc296?=
 =?utf-8?B?RHh1bktSbkNjYitWaUJ3dUFrR1hacDM1ei9Qc29ZL2EzbWVFcGh3SVhWZGxJ?=
 =?utf-8?B?YXdldmdRMG55eGR0OFVOSEREY2pOZDc0azFPSmhQQmNFZG1MR3BGMVFZdnV4?=
 =?utf-8?B?UGFRU2JnckZJVjJlRndPcFZjdnAzdERUdlBBTFJDNmNqaUVvNEtaelJnQVc1?=
 =?utf-8?B?SStBcDNrdS9vRU5OS01RanJSU2kzYWtNbzVkV1hPc09XK0dsbzhlU3FEeTRQ?=
 =?utf-8?B?TjVLWDJjbXNLWFNMcnRvK0NENnZEVXRSQU9PbkUrUUk1VEhLdnpRb1ZqYU9M?=
 =?utf-8?B?VGU2ZmdLbDN3U2tteWRKZjBzd3ZrRWNnOHZZYWIwdm1KTlAyQ3A5bDhtQ1Zw?=
 =?utf-8?B?RmtORHRKVkQ4dm9Wb2t0bHJUWFVMTmJ4SHQ2bytlTmJBU1ZFeFFwQ0FCaVFp?=
 =?utf-8?B?d2xNcG92K0Fka1ErOGE4dHVaRUY5bWlRTDhqVDVIM1RlbVJQNFJzeXlXRk1h?=
 =?utf-8?B?MkR6SVk2OTI3NUNsZHB0SFhhM0NjODY0UVlOUmRSU09wR1kvNmU1bHpPQXJX?=
 =?utf-8?B?eXNqQmxoaUZLMmRmekhEaFNxaEwwc29IUmVIalhXTGZVanRRRUNCeCs3UWZq?=
 =?utf-8?B?YmRWWE1tenlwR2t4REtNTXo4NkcyczlQSnB1ZTd6VmJkb1Eya0NrTmJlNGxD?=
 =?utf-8?B?SUJBMzZ5N3pzMWxBS1UxSHl0ZUFuRDNpSUlZRHFZMXdkZld3T2tJNzlybFVx?=
 =?utf-8?B?VVZyUVIyaVp2ejUvZEFaUVJUbUVXMTVhZGFzbmt6SFQwV0dvSVQxSmJGMW10?=
 =?utf-8?B?YmtlK2h5Zm8wV1drMlU4WWxFRlJGb0hkNWUyRkc2U0FySXVlODZTaUd5TTdj?=
 =?utf-8?B?OFBTeGhWeWtJaG1HRlVXKzZULzdDa1c5MzQ5OGdIUEJHbk9XS29KSjJxZ1cr?=
 =?utf-8?B?WHFoVnlvVzVyWkJwR3JwbmVxTDY0ZjFnUkJwNzlDOVJrWTE4bi9YMitLbEty?=
 =?utf-8?B?WFRyWTYrV2cyU2ljQmo2c0lkME9VS3dHbFc5bGFyS29rRG9QOGtqS0RpeXNa?=
 =?utf-8?B?Y1ZPdWViQis1YVl3TEplSzFKMHJWVmwxZTRlZ2ZnT05rNlA2KzFYbzlxRXBD?=
 =?utf-8?Q?7oEQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0JmT1RsWS9XWWFIcU9oSWZWNFJKK1JlWG9GN1VyeE5nRGRrL0NSZGhBcUY5?=
 =?utf-8?B?dUgyUFhwZW9ZV1VyUlRCZEJBdnBBSC8yY2lRZkZ4dGw5MGRJeERwUVlaTmpJ?=
 =?utf-8?B?QjBQdnVGRCt1eHdiUk9qSU44b0E0SGxwLzZ2M3J6Z25oNmREQzFqS2EzVnhv?=
 =?utf-8?B?RHhpRk8xV0hJaFAveUgzRnJlVWdmVDZrdEdvT1NVWmVLOXc2K0M1UmJ4cnpP?=
 =?utf-8?B?Q1hsM243SkRRakJHY2djOTRoUHFvblVyQTlFUzVIZHE1MGNRdlpzQm41SUg0?=
 =?utf-8?B?Vzh1RlR2c1UyWU9WTzZzMGt0WVBBbGR3eHFmOFRLNVBNTUpBL0ZCMmN4QjY0?=
 =?utf-8?B?Z3NwSW53d0I0b0kxYm9wVzNYZHlsMHBWakphR004MUQwMUg3TWFUdlpqc2Fu?=
 =?utf-8?B?K2R4b2NCMkR5SGFuN0VsY1AzYW9Xak84eVVKZnJkWDNWTE10TVdBaGdPcGZp?=
 =?utf-8?B?K2xWOGRsdDNYS0RWWmkwVTVVVVlPMGhHcHJWQ1RYQmtJK08xN2VRaTV5KzRu?=
 =?utf-8?B?VllZMFljTklFVDVYQlg4ZDhUY0NRUUtERXhlMjhQZnRGc0VrYjZaczlZS05l?=
 =?utf-8?B?Q1lVbjN6aFlZblJzSGlybmtkTmxDOTEvekpIT3dNL216K2V2MllpUEpLZDh1?=
 =?utf-8?B?RHFNVDA5ZU1WSWZPUFFya2U3b0lRUmdHRjR6VzZSZ2JYZUFZTWZDdlVPeWhn?=
 =?utf-8?B?UmxoS0VmblZYa2I0SW9hT3FreEVYMWNjVWNPL2R0ay94MkFVSWc5ZytUV3U3?=
 =?utf-8?B?LzMwK2Y0YyswaTA1bXI5Z3ZOMlBiRnJyeXBETGRmemxFb1hCenVWZFY4ckNN?=
 =?utf-8?B?TWtDTUgyaVZNS2ZaU01jak9TaE43Nm04RGU3N0hFNDdOV2tVcHJGeE4xaFJu?=
 =?utf-8?B?UmptR1V5eHNMMHRrOWEwSWZLTDdPL3lHbXdqYlN3MHJMamhXYlI2RTIvdU05?=
 =?utf-8?B?b0UxZVNUbmpFUFZlK0pTck9MQnQzdThYc0txeldpZ1ZGTy83UGMrem5paVR5?=
 =?utf-8?B?WHdKZDUxR1IxU25KZDl4d2VlUXFyWVNJWXM5Uzl6OHY0QWJBTnZ6WDduOHUv?=
 =?utf-8?B?WVJBVVNDR2RNM2Q1Z3dOeGhkQW1VN2c0LzRqSkhPNkVCemU5YWFKV203Zkho?=
 =?utf-8?B?UFdmM1hFWkUrMmt5ZWJKY3BkYzJEb04veGtmRlFkc3k3bWZSMjMyRzdGWTBV?=
 =?utf-8?B?empmKzlRWHZHRHpKT05EdnVkLzc0aTNzNk5WTnkzc0RiNGZhQUxIc1I3NnNY?=
 =?utf-8?B?WXQ2aVRqb3lGeGZ1UVVNTlR2dGluTUdGang2WVhHK293UHR4M3d6MWtyT3da?=
 =?utf-8?B?WEZwZ2p5dUFrek9EVGdiMGg1SnJVMlJ1WDFhWXRjNEdaQXFjZmh3QTFEbFlu?=
 =?utf-8?B?eHN5Z0lpVzlrOHV2ZC8vV3cyVktSaUJmOGNkSEI3OFhNR3ZnaERxRlRvNnpH?=
 =?utf-8?B?c1ZrMlpueFFTcVhpNkY4elRuN3JCQThxcVZoN2xobGVnNGdYUk9XOUxiMnlW?=
 =?utf-8?B?aXN1L1lKaDlYdlJqQmZtYmQrYSs1TkpFL3QyKzNiWkdVbzc2d3dSc2c0SW03?=
 =?utf-8?B?MGU4dndhSlNGTHN0ZWhEaGlKbjBKWnZKT2VBU0J3b0pFSDNxeVZZb3RyeTNB?=
 =?utf-8?B?eUJPYUJRSWIyQ0lhMlk1bDFNbS84bWVTT0dWZ24vSUk2L3R6QWkyNmZxbVgy?=
 =?utf-8?B?RUtSTUZOV0tTZGtCYkt0MFUxOFlUSDBQUHlBbXJIajVQa003V2dlcHB6eTdp?=
 =?utf-8?B?YVJOVXZUOURxUGtKbjI5RUVaTmZBV2E2MG9lM1BlVGxpbnd4bVZXdzJtQmR5?=
 =?utf-8?B?Vjhtd2NpLzVnSkdLNjg2cG43QVNpclNxcUVVOHVMalY0WTNzeElNTzkrSWRO?=
 =?utf-8?B?Y09XRlcyVEZrZm9mTk1kRytsSk9sSEltVHlwb243NFFWa1F6S0VhRDAwcCtz?=
 =?utf-8?B?cE9Xcmc3ck9ydnE2VndtWXQ1RHkzZ1JjYVBEczRuUDJmUzdUaVRXdmRsY3Qw?=
 =?utf-8?B?NjZ5Rk9pcmFuNUJaUWt0b08xVVE4aTRvekhRcGhuQmFHQnBGQVVDUno1ODND?=
 =?utf-8?B?cThKR2JDazdGU0RBODVRcm9SZkxXMnlaMGo2VGozNVIxVlp5MXVwbzNDcVFs?=
 =?utf-8?B?cGp6cGNXVS9zcDh0YzNKcHMrN1M3QTV2OVpZRi9jRmppUnpTMjJrQ2tMNWpG?=
 =?utf-8?B?cU1VVEtVZXBMdHdoZjNremVIKzIyZ2xRS1pLR3V4NzRDbTBya3VNR1U1Ui9K?=
 =?utf-8?B?cWRScWUxQ0JGNS9xaHJiT0Z1Tk9mWUp4MjREOUwzSzRETEZDSDZ5eHd0VU5R?=
 =?utf-8?B?YXlpSEs0VDB4OHFhbkZtZys1YnhiOWFPZTVSL2FzZUcyZHhNdmZyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0984bb01-207d-434a-a33b-08de57dd48e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 04:35:05.6781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7AYOeeRfzYS7fXguHyFHHkWKs90KvWLNXbShixDDoVjZq4Ah1YbqfTV7I8EqGVNkrWLMYbkmAxoJklAPL5NXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
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



On 1/19/26 21:33, Kandpal, Suraj wrote:
>> Subject: Re: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
>>
>>
>>
>> On 1/19/26 20:02, Kandpal, Suraj wrote:
>>>> Subject: [PATCH 1/2] lib/igt_kms: Increase MAX_NUM_COLOROPS
>>>>
>>>> MAX_NUM_COLOROPS = 128 is too small for some hardware and it stops
>>>> kms_writeback from running.
>>>
>>> How does that stop from kms writeback from running needs to be
>> mentioned in the commit message here.
>>> Also curious myself ?
>>
>> There is an assert from "igt_assert(display->n_colorops <
>> MAX_NUM_COLOROPS)" as below
>>
>> (kms_colorop:3233) igt_kms-DEBUG: Test requirement passed:
>> resources->count_crtcs <= IGT_MAX_PIPES
>> (kms_colorop:3233) igt_kms-CRITICAL: Test assertion failure function
>> igt_fill_plane_color_pipelines, file ../lib/igt_kms.c:877:
>> (kms_colorop:3233) igt_kms-CRITICAL: Failed assertion:
>> display->n_colorops < MAX_NUM_COLOROPS
>> (kms_colorop:3233) igt_kms-CRITICAL: Last errno: 95, Operation not
>> supported
>> (kms_colorop:3233) igt_core-INFO: Stack trace: not implemented
>>
> 
> So this stops kms_colorops from running not kms_writeback as you stated maybe that needs to be fixed

Yes that was a typo. I will fix that too. Thanks for catching this.

> 
> Regards,
> Suraj Kandpal
> 
>>>
>>> Regards,
>>> Suraj Kandpal
>>>
>>>>
>>>> Double MAX_NUM_COLOROPS to 256 to avoid future frequent changes.
>>>>
>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>> ---
>>>>    lib/igt_kms.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 77b3ae2af..dfdebb83f
>>>> 100644
>>>> --- a/lib/igt_kms.c
>>>> +++ b/lib/igt_kms.c
>>>> @@ -92,7 +92,7 @@
>>>>    #define MAX_CONNECTORS 32
>>>>    #define MAX_EDID 2
>>>>    #define DISPLAY_TILE_BLOCK 0x12
>>>> -#define MAX_NUM_COLOROPS 128
>>>> +#define MAX_NUM_COLOROPS 256
>>>>
>>>>    typedef bool (*igt_connector_attr_set)(int dir, const char *attr,
>>>> const char *value);
>>>>
>>>> --
>>>> 2.43.0
>>>
> 

