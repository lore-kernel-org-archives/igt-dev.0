Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC2ACCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 19:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9513110E9BD;
	Thu,  6 Nov 2025 19:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nNQhG3tq";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012026.outbound.protection.outlook.com [40.107.209.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCE710E9BD
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 19:07:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MV+6lnV8lWBOXFSH4GeDzoeeVIIERyaWcXtbtNT8fMB9mSPInK0rbAtM0/iFl1ZjYzZsoZ5mRsPDTjm1U6HrQWt1/gTnwpvrr8jfV6fs+klssEYbgJCpXF2tuGdsNHmCRfAMqi8bAdLIi5ptwk/dy/xhAZ8K1zcMx+Pv9XjPU1U0LGzaubRpfGh4Z0lor/kcv6HHp29p74DiP0oMqvhTxOwGjHO9RxWeUbB3OEg/qaOf14wGrunr+jHPd39gxJsCPgPQjRBfrLT5hyaTqiXLTFjOi79DrU20piVUPDVL9HPDRhaXlkpzQgFh9RWTdXs0GBQSXzQqn19nnRAMz5uAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uf+OuMEe9M5YvSMNKzP86Vu5t1d+n7RUkad+TLBI7Q=;
 b=s0jKhoXmgdbIYBQp0QE5ybJ3ucUSxCe9sKVMBO/1P6nOo1/R9XfXd+RoTP3q0e6jqRRY8aRLX72+kCQ8LUM1RXIbLLrnxtidACEtn15CT/5EBmlh3QvOpjjKmmUe+W4MK+Wz5/dzQjy8dtl5KUkGg/1756x+vvAeysJUEii6eg1+VdDWw+GbslF/sB0txpHU/TRaGiBOZPr0pE67ZplmPCBKK5PlNAAzJ+U1Hia86ri2AbXQCQPnVHCRSF+PlIdHV8FSsnHe6f8a/WyAcWdVILJ2l2ZgdfVnt9MikAC1uFCwkk6pepQ0ryO4PguCj9YRJcZnWlNA2zyfjUK8mrB48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uf+OuMEe9M5YvSMNKzP86Vu5t1d+n7RUkad+TLBI7Q=;
 b=nNQhG3tqvoTcAYz1MNaVQ4qWomWmdXr5yHFu9EShxZ6k/Lyvp/67GOmi8+t4fDH5XPzUYotEG4M4xL9BksSFAp4uZXwDm8F2BpiBtjI0vmw2JB72w6X90rlIwk66KR9k0N8LRkwK3qyVib+QKKEOtJvXjGQXFdx0bVJXl6oHslc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS0PR12MB7852.namprd12.prod.outlook.com (2603:10b6:8:147::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 19:07:01 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 19:07:01 +0000
Message-ID: <722a8707-299e-48f6-bddc-06c0a5335a33@amd.com>
Date: Thu, 6 Nov 2025 12:06:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 32/32] tests/kms_colorop: Add Gamma 2.2 tests for 1D
 Curves
To: Leo Li <sunpeng.li@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-33-alex.hung@amd.com>
 <9c2d8afd-8283-4226-8c7f-b8d4daae530e@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <9c2d8afd-8283-4226-8c7f-b8d4daae530e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:303:dc::28) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS0PR12MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: ff364eb7-6246-4976-0f58-08de1d67aa73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjFLZGN2LzdieHdud3MxcGRURStxVXkvUzdaMFNESXB2RTlLaUE4MW5OTlJV?=
 =?utf-8?B?dmMzQlVOU204d0Jnc01hQlVQQWpyZDlXdGt3Z0QvTXQrbG1rRGswK0x5QXpF?=
 =?utf-8?B?MTdWb3lqczkvd0NuaWNHaHIxUG56TVR3TXhJSFQ3bjVKUHJkNmdvTHBYQW1Q?=
 =?utf-8?B?NHFjTjFyR3Vyck5IYk02ZTNSTHhGUkw4R3hkd0VEOGRBSFBLcmFHSDVLczVp?=
 =?utf-8?B?QlFkNm1IL0Z6RE1KbHk3VFRzd1pidTc4SG5LRUQxZVpYNXYrWVhUdUhGV1hS?=
 =?utf-8?B?OFlzN2NNN21VTUdKYTZMVTduQTBPYncyNmZLTE5CcFhOVXZwcWZuQWZXRndV?=
 =?utf-8?B?QjhYUzZHbUpydk9yaXF6d1lwQjVQN1JDd3VHRHB5QzZYcGpKc1QzOWlSMmpR?=
 =?utf-8?B?WjIwK0hMVExiVlR2ZGYrYnFUUG1CUUo5cGx1TFJzalBlZzVrdEJocnZtQnJI?=
 =?utf-8?B?TmpNK3pkTU85ZEtEMGk2WnVaQUl1ejk2VHNBb3oxNlhWVzc0RzMxU1Fsb1RW?=
 =?utf-8?B?c2JHWXdBOENmMHFLOTRpYlJLYzlzcGV3MDAySGphaEc4UmVrVGpEZ0d3WkRW?=
 =?utf-8?B?TXZpVFpnMHNESExpK1Y1aVZHK3RXMHdnL2tyQXpzdy9ua1lZRGlqUGg1MHBD?=
 =?utf-8?B?VjYxcHZXbURXSERyVTJPa0V3WkI1SkNXZElLcDdhR3pBUFdxVTRrelV5Nzl3?=
 =?utf-8?B?cjUyazJ3S29ZY1NqdHdiQStmdTQ1a1VZbkh1THMvbEh5cVpZYmRicVJYcmU0?=
 =?utf-8?B?c3ZxWjEyZHFWZVdhVnI3Y1BUU0RuUm9sUjhxUXp4bWp2cG9Qa25CR2Z5UHc1?=
 =?utf-8?B?SlB0L0xHa0d2NXRBVlV1U1cvYlR5ZEJmTVV5V0p2RzNzdXJpUUNnR1hIc0tT?=
 =?utf-8?B?VTlLZCt3dEh4TlROMXZ2RmVCd0txK01UQW5jeVpaQm9EclVWSDVaV1J4U25v?=
 =?utf-8?B?OVlOY1dGTEl5RTdDeXhwNFQ5UzRYWERRY21oTjJzcVNPa2V3dGs0OXFwQTND?=
 =?utf-8?B?V3pwWXlJL1J0ZDNBRDJtYXZjVUh2Y1hRdTdDQTUrWFBwelo5M2JHWkoxRm14?=
 =?utf-8?B?VGtDZFBtNTdOSnIvOUk0d1ZOcHVBRW1uY0hHMnpOdlBDTGxOS1ZYQVZxaU9X?=
 =?utf-8?B?c0NoTnJRQUlEUVNNelJERkZOVGRCV0ZBMVptU25Mc2pwQ3dBcWNaSGw2L2s1?=
 =?utf-8?B?VjRZbnl3dmkveFRORkdxcHpwRHJzRzl5RzEzUnVmamIzcUFrU3I0ZzYwbm92?=
 =?utf-8?B?QjNnSUZIcWQ4TnVycUNWbUtLaXZjZGJNZ3JXOUYvQlovZEVXSndPYmxGYTg5?=
 =?utf-8?B?bFJXY2swaWlOWDdLWGNCUkZyVis2TGtQd0hkMFBJUW9qMElYclo3dG5IamNT?=
 =?utf-8?B?QlgxRE5qcnRMdE43aTF1T2hKOHp1Y3RQeEZPcDdMWWpmaXNPREpxSGlpbjla?=
 =?utf-8?B?VlpsNzVTajF6OVFTRm4veEtkQ1VURWUxZGRPZlAyUjVNT0pzdDNUK1l1ellV?=
 =?utf-8?B?VDFBWWFsaGpRQnJJa2ZTK1FPN2d0TUNZdldDSVJZL05vYU5YdzdNUW1iYzVl?=
 =?utf-8?B?YkJKVzVDUFMvZnpJVlJWd3JycHlPdkFXM3pyTmJyNG1HOU5EZGhJNDNqRGdK?=
 =?utf-8?B?Mlh5Slp4bTZWYmFFM0toZ0xqcmhsRFFCN2FZWkdFZm5sSkU0N2lTNEswWUZo?=
 =?utf-8?B?L0ZsSW02ckE3c2MwVEVwV0tzUHkrUlBKanFvbjVJQzBmcjUrZG4wR2tETVlI?=
 =?utf-8?B?WkdBa3BhYXRHdVpBS2dISFgyOGE2Tmk2TlVGZmFyc1hBTDVWZ2g5cEI2cFNy?=
 =?utf-8?B?UGE5UzFRMWs1Mk9HNi91N0c2ZC8zSWE1MFFybGVGMlNJWEZVdlJHNXVBUlll?=
 =?utf-8?B?U2F0TUtSRHN3ZWlKdzFVeU1lVy9hbkp5VDJkTG1kbmdpK1FXeXpKakZETHVX?=
 =?utf-8?Q?Jg6/qnuZ+0o0DGTML9T8kh6aPiWQUAAW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXR4UHcyOVlsUTRVTGl0Y210RWt6VHd0MXZJMlJiR1RDU0dLSG5Lbm9LOGxQ?=
 =?utf-8?B?Zmc0NFNYbkNIaHNaTXNhZFQ4bjFUUXRGVEkzWWJhVi9zZlJWa0ZRRDNXb0Vs?=
 =?utf-8?B?OWNlRlQxd1ViZ3VLZjc0bVAyUFpaVXhpZGdBZzhvT0ljUTR4K1d4MVNDSk9o?=
 =?utf-8?B?OHdKOGwrbVJNeENSdnBrSndibC91cGt3dzNwMHVQOXpzSm1aVkxCcXd1dDZI?=
 =?utf-8?B?Vkk3MVNzaXRCOXRmN1kybDlaL29xYjhuWFNSU3BLU0J0b2thVTdrUzVPaDZ1?=
 =?utf-8?B?aUFROHhHVEVHemRMenZqZisyanlmVG5JVTF4dXd5VTRQemNGVlVLTjR4dlRx?=
 =?utf-8?B?WkRmVGd1Nmxmb28zUVBCVTgzS09qQkpUdGNlZE04a2JsdXdFa3l2SnF6M3ox?=
 =?utf-8?B?WGwwUk4xU0k3ZzBhTDl6QkxyOWljc3QyRGE4NUJYcmJWZzRYUktxYTdYRXF3?=
 =?utf-8?B?WVhORi9qYTJjS2RhRnNzRkxnWVZkWlRGK2cwUS9MMnNyNWt3NTAwbzhqRVJQ?=
 =?utf-8?B?dllnbmtIVjZkdGpIWkVDWVRMM2pjMW1OOUFEMldONXZEWlZxNW9KRTlvM1A1?=
 =?utf-8?B?ZFZJYlFITVl2c01QYkdNTHlhSFc3eGJlR2dMUFJkcEVFamZ2T2hNSytMT0dO?=
 =?utf-8?B?aVE3eW9BbDI5S2ZocnVqY1AwRFpCRVBTdXpNNVl6Yy9ib3JIdk1JOG5OQjZ6?=
 =?utf-8?B?R2xNUHZTdERzTlpseThJbzZrMmdJMVZlcGwwWEYvRmxKdXU0dTRNbVJoMFdm?=
 =?utf-8?B?SkE5Mlg2N1VVTGUvVEJyVExzK09LWlFQN3BBK0dMZFBTeEZVc0ZZMXZzWVI0?=
 =?utf-8?B?ZWYwY3NOY1YybVB4WklDK2dBelFteFROZW1GN2x6QkFiSGs2M0F3NWN6UVFI?=
 =?utf-8?B?Lys1V3lmR3l6dnJpdk1qbVVndlI0L3l6WWdGdkp0eUhSOXFHbElKSitZZGRC?=
 =?utf-8?B?QlVxbDhxMUdQQVN0bFhhT3lFam9lK09rODdOUUNwL09nSGFBNU9NWXFHaW5Z?=
 =?utf-8?B?UmJKM2tDYXBEQXRiRzFUMmdBaTFYL0ZXTmpFRUNzRTNGRWJJWTVodkVUWFRI?=
 =?utf-8?B?d2xYK3dXYUhqbVVldDBkc2N1TGdjYTVEZmNNM1VadVlwSitxbTlsMEVOZnov?=
 =?utf-8?B?ZlBuYWxrbENDZkkvdktSOXJKZzBLVGxSdFBYQWFIWC81bVdhYTNOWjFncVdz?=
 =?utf-8?B?L0JWb2p1NjVublBzencrT21WUER1eGFiaFZ6Y0JmeVloNGMrdWF6OHhLd0dV?=
 =?utf-8?B?V1RPVTREemwzc3BVcjUyRmIxcThFN3hqVk1KQTU1Q04zL2tUVWxYVHYwR1dF?=
 =?utf-8?B?WWlJVk1TbWxVT2pzZkFLOTF4b0dkY3dyMXdYUnZZaTY1enBQUm8vVWp3dGo2?=
 =?utf-8?B?RUhNd0d3ZFRhaC90WTkvakpaT2RXaWdPdzdyNDUzUTV1azUzZjBoNWJtemti?=
 =?utf-8?B?VU41cEh6YkxTMHJ5RXhVZ0FkWXNMZC9DVGJtTDdMWFJqNGJFRWFyZEE0dUgw?=
 =?utf-8?B?Zis5ZkNrOEVSYWt2b0JqanJDLzdiT1lUaGxad0ZOMTd0d1hiR0ZYWXNaZURj?=
 =?utf-8?B?NFh1Mm5kaWV4ZFlHbTAvR1Y3dTJQNG9vRjdvL0NBMmIxRHRTMCtERFNYNTRi?=
 =?utf-8?B?TFluT3ptbkhGQ1JzUThPb0x3eWFRSGZtTGFvdHdKZWxBRXJtY3FFSUFoM041?=
 =?utf-8?B?NkQ4KzVIdmJQOXJPcloxQk54bG9HNWl5QXRzS0NwelQxeHlXaFhtOEcvcTVh?=
 =?utf-8?B?OWl2TWg5Ymo0bXNsd0I3RmZYWEplS2hmM3BYbHNKbTVNNmttb2g2SG1iYlNH?=
 =?utf-8?B?RDlEaHlmQmZESy9vbWNuby9CRzJ0Uk5Zd1NBT3VUK0JWZXFJYkNxOTE5STkw?=
 =?utf-8?B?ekJSc3dqdE9EQTJHTVlMQzZXM2ZkeXVJaXFxRVhoOC9tdUNZSjJyRUdoLytp?=
 =?utf-8?B?clFLTmpqMzlQVUFXbndJaVU1YlkvWjd5c0daak83TS9wSUNqUE9lQUdkNUt3?=
 =?utf-8?B?K0ZmREFtUWc2Ylhsc214UnlmcG9teHQ2MkZmMWV5UkxMNWczRlJPanZ4ZVpi?=
 =?utf-8?B?YmlreTdBajk1RFVuRUdiMmw3d3cxMHBCYUhzWkV0a2pxREN6YzU2cFdIOGZL?=
 =?utf-8?Q?O8SfIj0ME/h1En9QzFCMMuK3i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff364eb7-6246-4976-0f58-08de1d67aa73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 19:07:01.3808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGqMCz84HvdwY93BkosCCAiEz2AQUdt3+dpvCzkXieB93EGqmu2d1WCZOjBShc4ssGZe7xj4g2AjM0J1DUwHAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7852
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



On 11/5/25 15:16, Leo Li wrote:
> 
> 
> On 2025-10-30 00:28, Alex Hung wrote:
>> + * @gamma_2_2_inv: Gamma 2.2 Inverse
>> + * @gamma_2_2_inv-gamma_2_2: Gamma 2.2 Inverse -> Gamma 2.2
>> + * @gamma_2_2_inv-gamma_2_2-gamma_2_2_inv: Gamma 2.2 Inverse -> Gamma 2.2 -> Gamma 2.2 Inverse
> 
> Would it be clearer to denote that these are oetfs in the test name?
> - Leo

Sounds good. I will change tests name to the following and all related ones:

+ * @gamma_2_2_inv_oetf:                        Gamma 2.2 Inverse OETF
+ * @gamma_2_2_inv_oetf-gamma_2_2_oetf: Gamma 2.2 Inverse OETF -> Gamma 
2.2 OETF
+ * @gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf: Gamma 2.2 
Inverse OETF -> Gamma 2.2 OETF -> Gamma 2.2 Inverse OETF

