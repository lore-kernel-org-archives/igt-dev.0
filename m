Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB00C5AD49
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 16:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C2C10E187;
	Tue, 27 May 2025 16:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mUsgmmEQ";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156DB10E187
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 16:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXJn3dfLz6+ydFwh8DHvRrj8oSzY9SorTwc+ADXQ9Q/d+OKT0mV/76r1KJbwAVMoDeR/h+wZ/tLfhk2U9k6EG4bN/YhHikM3rVHSYkB/k9KHaG3OMAc3arVg3bkIU3g8Z5jYQ2GN409a6ao8D4ZGOFIHY+dosB/UXS0Dnx7ivLj0qfHHwRUXXrsqM9aLobV/QJYcIooLimtMHi5TmEIsB8dsZyOuUwrLhB+7AMqN4ZFJ4StRVBKC3kMkXoPrLLa24xyPVx+X0DKXFzZ5Drf97Or3mtgo7wJNf9cJBBPhJYwO1pmo/3Ulp1i3QIsCNaXkVMm3FLic2TCSBCThYCFD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jocPH77LU14ETNKJ20GV4CHgXKV/+wKdtsjbhyBVqlI=;
 b=zVh9Y0I3PGS19tkkqmge/MusLANvpNoNS9llvcm706K/rrOlSq3SfRq+9efmCnik9QUo0aRZ+qtmzz08BWMtdKQc6MUOTpUVAQ6KWDKCZWNK89I29I62n3UaVS//7Wrxq8/7m3pO5e/jkB0gteDK728xF/ag9LNfT+ApXSvw/SFhYe3o8P+tPKoPskkhiupQxLhMtDlOvSrhrKzCTcx0jINrbwOtdsBRDZ/QsWEylMTAmJ+F8BEU9PhGL7YrFlFIBT1JvFEa8zbZh/seocavgIDS5Jvz6rniUKopLT5CRm64g6PKuGLhXA75CR74XaPzeNEG8/aiZqsMZf5dC43blQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jocPH77LU14ETNKJ20GV4CHgXKV/+wKdtsjbhyBVqlI=;
 b=mUsgmmEQoP23pFCIbfGuMXArROWNobUJc8QYxFGknTgt3oOAk2TdQAECZ/zBXcYtmN9mqFWdth4fpg9HRNPojlXvZHR19oAv4tZItibK8V9RI5mHX8hvoEK0Gq5WVzVWl+o2v7IEEwq7O6rGX9ZhtDIrfZtqqVqa8yn/GecSn64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM4PR12MB9735.namprd12.prod.outlook.com (2603:10b6:8:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 16:29:44 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%6]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 16:29:44 +0000
Message-ID: <8d4eaa0b-cb61-4a3f-8566-ddb020a94421@amd.com>
Date: Tue, 27 May 2025 12:29:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/9] lib/amdgpu: fixup print formatting for files
 in lib
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org,
 George Zhang <george.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
 <20250527120421.79026-2-jan.sokolowski@intel.com>
 <20250527160926.sy57ac3aknt7sgkg@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250527160926.sy57ac3aknt7sgkg@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM4PR12MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a40910-28d4-4d87-e8f2-08dd9d3bb024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0YrY0NTSC8zSkE5Zit0TGZ4eG0wU2M2UG5NU2d1V0hoZVVCZ3hmT0hQRWl5?=
 =?utf-8?B?NGlVc3Y3UENxRHA4RUJ4Yi81bytyT0ZkQW0yanphbURObjAxZjc0S2JMR2NB?=
 =?utf-8?B?OHh0Um1iMVhaTlVnMkphWlMyd1J3dkkreDlGd3BuMnRnV0RiSzZFZE1NeEpy?=
 =?utf-8?B?bm5yUVlHMksxUnJWbU53RUYwMUthQ09wcEo2cFRkOUJLSjRRUkVhZHNaaldh?=
 =?utf-8?B?RFRNR0xKajhDSjlWSHorWDArQWVqR2NrZjljWkZybUdqb0xSTzRnZGFxL0Zw?=
 =?utf-8?B?WWtTVVZleWV6QW5ndEZtRGh3ZXg2Y1VGU0RRS1Y3d1hyRDgzdzdpN2xTVGVI?=
 =?utf-8?B?cVZvVE8xV0E3enp3SG9yQ0hiaURWSk1TWW9LcGtLMlovRE44cXNXU29sUEYx?=
 =?utf-8?B?TXI2VHZQZFZveWVVVzgwK0lPL0Z5Q0czOVh1djFYc3hpL2tsY3YvUDBJVjVl?=
 =?utf-8?B?bTg3ZmdIaXJCbTZiYkNSakZRamdYOG1nSlFyWDI3L2hUL216eFRJZHAvTWdl?=
 =?utf-8?B?N01LSUs1alFadEJqRTVKVTNiSE83NkNWY2Z3bEhSZ09hbm5HSmFtQVM5NThF?=
 =?utf-8?B?R0E3VENhdExhUE5HaGNQNFIvbEpsenFzME5Sd0dnTTIwbEZKbG83TGFEQ0JF?=
 =?utf-8?B?YkJxbWlTK29LeUJISjk4YmY2dEVvSVd0ajhxNlZSRWx4am9DS0NiNGtzcUI0?=
 =?utf-8?B?ayt4eGNsRVh5bUVvM1IwV2dOQ1RtRWJvZlNMTWh1UjBHY0E1RUNxRlIrZG1v?=
 =?utf-8?B?MzYrM1BNck5CWkdYcWZrRnJaRFpYOHViNzNmeThwaUJoLzU3T1ZkZmlDV0Nm?=
 =?utf-8?B?d05NamU3TVdqQ1o0d3ZqLytqK09UL3gzc3lwRzhNcm8yTkYyWWZnVGRPbWI0?=
 =?utf-8?B?dkhjTU9kL1l0VEd2aXZOcDN5TXdvQzdmaGl5dW02aStWTXMxd2YwMFk2TG5Q?=
 =?utf-8?B?SUswbDUvVnBnVzJiNEluNVRMVTgyWi80Z2JlbDA3QUFmMnRZa3RGVDVhTkJH?=
 =?utf-8?B?NEZMVC9FbDR0WElYc3NJTnhKcW8veWVOMHUrR3J5UHdIN1ZqeTdKeUFuUnMx?=
 =?utf-8?B?YlY4VjNSWkpiNlpvMjc5UGNRaTVXOWNFSE1ZY1RlTnJLZlJmbEg2VVZSVGtm?=
 =?utf-8?B?a0QrcWRmWXNTQmZTcVdoa3hUaURaL3BiVzRPQU1mdEVSZXFSL0w4RVVoUTF3?=
 =?utf-8?B?TVJKUEVUT3lYM3V0OGJLK0lWVlAzcWtDaS8rTGFpcnFrdzNtdjVkc2wzYXdH?=
 =?utf-8?B?MmdsMWkyaDhURTB0OVE5OWdhQU1ocDM5ektGbEhnTGhUcHBzK2xNREpTbVUy?=
 =?utf-8?B?Tit1Y3dINGQrNFd5Zk1nREVaWlNTMWxFTWJUQnlBeDIwM2w2M0VWdlduK000?=
 =?utf-8?B?dVhyTHVRcDNhL09ld3JXekgzUWYyNXNrbCtTWGV4NUJtSXBsNjVnVVROYXJQ?=
 =?utf-8?B?Vk4ra3Mwbjk2Sk1KWmpXdXZRSFJ2NHprVGs3dGFLRk8zRXlabzh6M0RDWk5R?=
 =?utf-8?B?cUw4Tm10MlREY2ZmQTJ1ek5MRWMvQTFUZUNVZk5md2VBM2h2RTNPclpjZ2tB?=
 =?utf-8?B?WWFMZVg3eUZmS1ZyeFlGN3pwN1RmT0wwb2p4OVYxalBIN1NnU0MraURyRUhq?=
 =?utf-8?B?NGVaWHRKaEdyaWJLalVNamVUZ2hJR3RWaE5IdS83NXB0RzRNV3c2dG1waXI2?=
 =?utf-8?B?QTg4c25MSExCbUxtTDlyYWEyVk4vK25RM3FKSUtJVnNwYmhjQzNWaS9Hd3N1?=
 =?utf-8?B?dDR4ODhaRXVJaythTEE5MWZUVXpadWEzaGhqWVpRRlRIWEk4RjBtRkVETlJ5?=
 =?utf-8?B?a01ZN1drK2pDZzlTWXRXQ04yMjZXWEt3dXJ6MFhIMksxM0dLeE5YamdpUzcv?=
 =?utf-8?B?d0Q4YisvWXNHZ0h4N1g3MDE3YWRoUXZ0S2diRS9Ka1RuWk1nMFlScVVNd0dL?=
 =?utf-8?Q?qZMGKmZL6y4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDNGd1UyK1pTV0xIc0pIeXh4d3FUR05vc0hWYm5jQzFoem9adTNIQUNXRitJ?=
 =?utf-8?B?VVpvbjUvQTRYbGtTRjVqSHV2aU9CUGVpaW1iWWY1Zy9hZUMzSWx3a3E1OVl1?=
 =?utf-8?B?ZW40OG5MVTBvNWIrNjA5MFFZR3IyU2QrUzVsTzYzODdZTkJ6a2ZjbDVtbWRM?=
 =?utf-8?B?bmt5elArb1VndlhONTVZVGZIY05wcjhMNFM2L21SM1hoQ295VWlrMXNmVkZE?=
 =?utf-8?B?YnRBYU43V1RHMU5NemZWVm4ydFZKaEpXTGNVK1ZYRTBxRHY3dXJVT2tKTm1l?=
 =?utf-8?B?K21PNHhZaWkxS2dvcmdvUlFna29nTVFnRXkrQU8vbGxiU1BrV3BZbGVJZks0?=
 =?utf-8?B?SHh0cG5hT3Fld0tLK0RHTWlOUnRqUXpCMGxWOTcwZktSTS9PQU1RREZuTnF0?=
 =?utf-8?B?N3lWd3ZKNUR6amZaUHJjajRNT2F1TmRXL3BtU3pDaW5aMlZIcTRldXRnRFBm?=
 =?utf-8?B?Sy9ZWGUvYzRWYmxIRGlnRElQZVlJby8yeUNOTjJrRk9pWk05WURnV0FzRk4x?=
 =?utf-8?B?UkhnT2hCWFdFTkpuc01FR1B0ZU1Pd0o1QjNOZ1h2d3hMRDR4dm9pRDRtY0hV?=
 =?utf-8?B?azQ5bGQwYlNVUThIY0RPZU5RdHloZWU4cXA4a0ZYejhIaFhKa240SnBqcWhz?=
 =?utf-8?B?RC8zZExuTU1VeUZhVndpSlB4OEhTaDhQUjIybFRnMEJqRkdBV0FRbUVnRWJ0?=
 =?utf-8?B?cUdsK3pvTjVESVVTMUlMdVNFZUxSR3hkNGRzRWFxTjJWZ2dPcHFMaWo2cEhv?=
 =?utf-8?B?WHNEQ081b3FvbEFMeFBlNmM3a0RCUnJiOWRnWDZHVGg0cCt4RzhzZkUvVjBY?=
 =?utf-8?B?cGV1SU82YXJZYlYvSkpRSVhoREo3OVhhUUxrdy9zb1M5YXhZdzdZbGc5TjhI?=
 =?utf-8?B?eXkzU1BiVytMTHI4emt4TS9qbFV4N043RTdCRU1Hak5QUWphcVE3VHFMTmJR?=
 =?utf-8?B?ZnpkRElnUUFSdUxsUzB2V3FTYjdkU3pUUlNOT0xXWHZYSk5ib2x3dkErMTJK?=
 =?utf-8?B?elBMbDhsaWpFMEs0bGNHNWh2MWFhUzJicXNkV3RUbGJQU3lHUEFlSHRBaVVU?=
 =?utf-8?B?cVgzcm13NVExZUdCNlJUYjl4a3VrbUlWS1hMckNTcG82OWFwUThsMFVQZWFm?=
 =?utf-8?B?RXZtT3IrV0MyODZldnhzRllMK0xVWWsvZnQxeEtSSkNSWWpsdmFNcHdKdVB0?=
 =?utf-8?B?ZjlyUklsd1pEUUQwUWV3QzFlTFNZeVJaVFRxNGFPMHFMV3g4cGVVSTVLeFRS?=
 =?utf-8?B?aVFvUmRlakIybzNxQzQxMjNsUEFVWEVodHlYUnBpSU9VVW9ZblVQbVpxcHFl?=
 =?utf-8?B?THk1Z0lPc3phb1lWQ0FpMzNzdDdYQUJMR0FDcjNZZEZsdWtWMlhCNVFaR3BT?=
 =?utf-8?B?TVlYdVpRWGhlS3hZWjNVOGFkSjBsWXBMcURwYUljRmZSdUI0MFRyY3djTTRE?=
 =?utf-8?B?OFpQV2EvZERzVDJrNmpoUytzcWtGeDNMSkV1Qm5JRzVYZG9YWFNZT2pDekR6?=
 =?utf-8?B?U3BvWlJjWFQzeWlaT2N2NEJDYjFUN2U0T20rVGpmdDRwV2x2RHN5Z0tlVlRq?=
 =?utf-8?B?MzQvNW1KV3RneEJYNUgvK0dZN3BraVlibUhFWHp4MzRCL0xzL1hkUm9xdW1M?=
 =?utf-8?B?N0VCbkwxNTFQeWxsZHh4K0lmUWk4ZzZRY2RPWGNCcTNuOHV4SG5UdmMrVDVH?=
 =?utf-8?B?c0VUQnc0ZnBsTk5Kc0JjZGJtaGI4S3RmMk41Y2FwQ1ZkVVc0Rkk3TGFKUktt?=
 =?utf-8?B?cDB2c0RqRGpBVTRjdkVjZlVraTlLOWM0SzdJMnFQaWNKVVU3NUh1anhYOHhj?=
 =?utf-8?B?N2k2QUFCbENHbEplMDZjQVdkQnlCWXFCRktuWkNaamVKUnIxOThkT2NFT20x?=
 =?utf-8?B?eTh6VWJBWDBVZEhYRlJpOGs4TjBRWXBaSEM5SjMrNnNwenIrWHdrcmtHeHdC?=
 =?utf-8?B?UloxTTNzOWoxVlZyQUhPaXhRRnRzL3FrOHUzM2krc3VsdFpHZ21iU3dWSGUx?=
 =?utf-8?B?dnc4REpxWkdtWDh5c1Uyd0FwekRSTDA3Vy9Wb1BPU2VKQm1PWktsQXFKLzN4?=
 =?utf-8?B?RWlVYk0vNGpmM3ZGdjlSaVFBblVjQlVrWHdiNXdQcVRMYWhYVHNTY1M1NWo5?=
 =?utf-8?Q?BFszZbunqLy+qEMN01Vo1va+9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a40910-28d4-4d87-e8f2-08dd9d3bb024
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:29:44.2845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnzOqFeMvlqyFV0g3RgDvWUekiyqQaAaAynPuURIOiDKVDVYF3xafMWLZQlFAa6mDkuS0tkhy1di4QF5YBFlVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9735
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

Hi Kamil,

Sorry for delay.

On 2025-05-27 12:09, Kamil Konieczny wrote:
> Hi Jan,
> On 2025-05-27 at 12:04:13 +0000, Jan Sokolowski wrote:
>
> one nit about subject
> imho you already have a place/file which you changed, so
> instead of:
> [PATCH i-g-t v4 1/9] lib/amdgpu: fixup print formatting for files in lib
>
> better:
> [PATCH i-g-t v4 1/9] lib/amdgpu: Fix print formatting for 32-bit compilation
>
>> Compiling on other architectures than x86-64 causes a lot
>> of print formatting warnings.
>>
>> Fix formatting by using proper formatters, eg. PRIu64.
>>
>> Cc: George Zhang <george.zhang@amd.com>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
>> Reviewed-by Vitaly Prosyak <vitaly.prosyak at amd.com>
> This is missing ':' and also s/ at /@/
>
> Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Vitaly are you ok with other patch 2/9?
Yes, sure, thanks!
>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
Regards, Vitaly
>> ---
>>  lib/amdgpu/amd_deadlock_helpers.c | 19 ++++++++++---------
>>  1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
>> index 98251061c..3b4822ca0 100644
>> --- a/lib/amdgpu/amd_deadlock_helpers.c
>> +++ b/lib/amdgpu/amd_deadlock_helpers.c
>> @@ -4,6 +4,7 @@
>>   */
>>  
>>  #include <amdgpu.h>
>> +#include <inttypes.h>
>>  #include "amdgpu_drm.h"
>>  #include "amd_PM4.h"
>>  #include "amd_sdma.h"
>> @@ -249,13 +250,13 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>>  			if (support_page) {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  							0x3 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>> +				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>>  				ring_id++;
>>  
>>  			} else {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  							0x1 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
>> +				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
>>  			}
>>  			r = system(cmd);
>>  			igt_assert_eq(r, 0);
>> @@ -266,7 +267,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>>  
>>  	/* recover the sched mask */
>>  	if (sched_mask > 1) {
>> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
>> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
>>  		r = system(cmd);
>>  		igt_assert_eq(r, 0);
>>  	}
>> @@ -523,12 +524,12 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>>  			if (support_page) {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  						0x3 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>> +				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>>  				ring_id++;
>>  			} else {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  						0x1 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
>> +				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
>>  			}
>>  
>>  			r = system(cmd);
>> @@ -540,7 +541,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>>  
>>  	/* recover the sched mask */
>>  	if (sched_mask > 1) {
>> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
>> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
>>  		r = system(cmd);
>>  		igt_assert_eq(r, 0);
>>  	}
>> @@ -592,12 +593,12 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>>  			if (support_page) {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  						0x3 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>> +				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
>>  				ring_id++;
>>  			} else {
>>  				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>>  						0x1 << ring_id, sysfs);
>> -				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
>> +				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
>>  			}
>>  
>>  			r = system(cmd);
>> @@ -609,7 +610,7 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>>  
>>  	/* recover the sched mask */
>>  	if (sched_mask > 1) {
>> -		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
>> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
>>  		r = system(cmd);
>>  		igt_assert_eq(r, 0);
>>  	}
>> -- 
>> 2.34.1
>>
