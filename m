Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8522FCCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 19:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2124D10E2FE;
	Wed,  5 Nov 2025 19:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CwZOXJFe";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013041.outbound.protection.outlook.com
 [40.107.201.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB3A10E2FE
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 19:54:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkGnfZNN3RfsGf2RubS8V70If/YtFv0l9mtOP3FeOjCkgMmjVDjvcDwAGE91icU7IruD3ZclpEhNCMQxpab0/4VgID03p4Rt8of7QeS98ORzrsfzbD7YDp0jmou1rXm+ARMPKhspSxz+X9i/2u8YIZsn0IxvqwnLJrxymQBTUcBVhMrveU9tk8uy9S49WTGediz7lFnjdoNrimnAm4/icq1i1W5MXBreMcVCjJZl1S0h0M4Mrqq4rP6tTVZFUZTRalnY6Q4GywleOU6BKv+LOuaNYAxiZDh8z8uRUjlnOCeq3nxCaCscZ4gq4lCTqfjZbfTZ3+TQ2jY1a6cl+R4q6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7OYSVvSXd8rcbwxlZRYXEiu6UcvddDh05EstjMH3w8=;
 b=HuTB1M5it2lpkOSruiNGTjCE+nP03zVS7VkRnwGT46BAYD1s6arMIGJ1ld6SIFA9FRmK4Gk7nPf1WtTZz/5DiiEa12gkmhWM6pRQYwyV0UqgwiwkPiVdY6VEvWDJpB7w9HChiCOSP6cDNH6yvoKbhA3A9Llb3Lc5r2/1c9+4mndj9DX8AnUSaEaWSM56a/gBpjwFiaJNUZGF2gBif7LeC5/K9WMVa1rNggapu0pDtHvSBdjbb8lK0FDp7gdbsqZtnYMwro0S/nmU1yUCd7BQJT01yXyH0r/jR0tBH/nnIFLR+CtFWlPvtEaU7sivSt4qVz1/UO5mVXCDtJKmD17raw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7OYSVvSXd8rcbwxlZRYXEiu6UcvddDh05EstjMH3w8=;
 b=CwZOXJFeESasDUIP0oEwDBG8mxpzablq20xMxKVMsaeR8ckUSsCk969S69bhuRxoeRx2oPMY0LThQrzc5/nhGpeI+F/ScGKfOccla6sQFV+OcQqcH+Fbq9KTZ0hEtmgA8CoTOgWXDlDi/Jfwct1vEKlS4th94B4B543IKvvvZA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 19:54:47 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 19:54:47 +0000
Message-ID: <0fafc468-14f8-4ebd-b72b-7c71c993c1dc@amd.com>
Date: Wed, 5 Nov 2025 12:54:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 20/32] lib/igt_color: Add PQ variants for 0-1 and
 0-125 range
To: Leo Li <sunpeng.li@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-21-alex.hung@amd.com>
 <ac2f9737-f6d8-48ae-a310-c267f92b880f@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <ac2f9737-f6d8-48ae-a310-c267f92b880f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 58706b73-e9b4-45af-f471-08de1ca52c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDdQdWQ3Y1NQRXpvOS9uWFBsUHRKc3ZsZTkraEMySWk2T3VYaS8xQ3JueVBk?=
 =?utf-8?B?SjBJY25JSi8wamVYaU5YS1krUDNvQUFsN3pKUzB2Rk91L05sQ2NGOGZjQWpP?=
 =?utf-8?B?WDE5SEZkV0RwTXR2WjRJSmhhbGsxemNzWm5zM0doWEhpS1YzUWVMTVh4N0Vw?=
 =?utf-8?B?d2d4SFp1b0I4b2VMWmxRaFJqN085aC9EOEpEZEdpb1M0QkFNSVR2elhJSExo?=
 =?utf-8?B?MHgxMmhGaVJiaDhIZSszTDErd2xJbVRtUEk1KzBva3ZEeEdxbmUzZ1VzSXJG?=
 =?utf-8?B?UzYxQll6QitWKzFYeGpFWHBNMDJvOWVUNmE1NXVtK0R0TWltcW0yQTRDT2h3?=
 =?utf-8?B?aWdxTE8yVlRRRmUvTkJDZC9qcHVUdDhocnBDRW5uMmR3WUFvQ0UzSWJvVGdD?=
 =?utf-8?B?b09Ya1YxcTNGbDh3RHNFNHdkSnk5aVlRdFhQQkNzZUhYTGtOK3M4U2Y4TXZO?=
 =?utf-8?B?RHV1UEZTQTRYYVBydTZxVzdwZ0psSFZCcGRFdXlobDdoTG9oNjF1anVIbm5F?=
 =?utf-8?B?WWwxZXNvRFRyb0s3Mnlqdm1PYlRnNyt6dXg4U0c2eGUrZUtEREFnOWJKUWo0?=
 =?utf-8?B?VWtPbTczTDZTcDBBTDVvb2tjcEU5VEJQSHlsdlhTY0hDazF6Q1ZMb3lXV3Jz?=
 =?utf-8?B?MlVvMW1PRWNjSWZGUXN6bENtWld0UDI1UFptZlJEWnErSjh0TWNGc01aR3cv?=
 =?utf-8?B?OWhFT3N3NzBUMWtQdHdjWDJBTnNFYnlUMHB0N0twVkhHTlFEZlVwSmRMSnF1?=
 =?utf-8?B?YUEvMVM5TEVQaVMyUjV4KzI0ZmNicm1xSXhrMHFqaVExRzM0djZwSldMUWMz?=
 =?utf-8?B?aUVjU3dpSW56VDZySEFGZVd6K1dybnc3dVJ5U2svcUJPVVRUdVVCOVIvNUpZ?=
 =?utf-8?B?eDRHVkpHMFQ3OGRuR2hNUUU5SzRIc1JmQ29BWk12WHQrMFBXeWVaZm5MU2p4?=
 =?utf-8?B?TUVKYlZLTm85Vkt2Q2RzeUV5d1lGQW95SUpWdHNudmdpVG54aUhNOFQxdDNr?=
 =?utf-8?B?R3lyY2FLbzRmU2hpWHNRVWJXT3pPUHVrejFySWcxY3RNS0h2ZlA0cGZSOGo4?=
 =?utf-8?B?ZjgvL1RmUmZhT1FuRFJhemQvYzlDa0FETFFFSVdqMUs5M0U5S0hPbHRFK2dH?=
 =?utf-8?B?VXhXWFhJdmpjbzBqLzVkNDBhdVYxdjJFc1pIamZZRHVGUkhTMGU1OUl2cjk4?=
 =?utf-8?B?TUI5SFJZb3NhWTJ6OWg0QlFJc2FIaEY4UTRyOXpidzdBcmg2bjlURW1ibDdQ?=
 =?utf-8?B?MVJ4eXBuL1hEVkpzczlPbllMclRuOElNV0h2aVM4YXdSc2wxM3V3SDlnck0w?=
 =?utf-8?B?czFSYkpvSzh0ZmcraFVieXVCZHIvVDJOT0V1NEJqSHRVUURpdWNjRDVZL0dG?=
 =?utf-8?B?SWFNaFFMY3hudTdBUXV6Z0U0RjZQT25iRzYwWEJWN1ViUUlCQ1VCNXVEWitp?=
 =?utf-8?B?dmNFd3l4YkowSDZ4djdKWG1iV2N2aXpZSHZMTkdVaXJGRG93UlVvVmpIZy9D?=
 =?utf-8?B?YjZtc2VZb0RjRFhpaUx6cndoUTBORTVHaW04ZzVobnpjS2E1ZEt6a0VEdHRP?=
 =?utf-8?B?blQ3Rnk1cDRGYzhxMVdHSFJkeVpmUnNHaUgxNEw2MTlrUm1oMVBIYmxsTk81?=
 =?utf-8?B?L2xVMGpmWm9Rb3NzUzZ4K2ljN01pcFg2S0dUc0xXcDlEOWN1SkJJUjVQUmR4?=
 =?utf-8?B?SVlwZ2l6Wmc1bE44cXhZWUlqT29xSjBPdDB6VEVaRmN6NkZXekhEVTN0L1dN?=
 =?utf-8?B?N21Rekt4T1Z5ZU9sRHJZMGZEcHpvUmxmR3pNMHV6ejd2Y1gyTjRiL3BJZm1n?=
 =?utf-8?B?NGl0YXRoaGh1blpLUm54aWNFbG00akJBcHRPWWxWMGlsVlhtbUc4LzBQdkVC?=
 =?utf-8?B?Sjc2em1lUWdWOFZhejczRERLRS9YaUVvZElxWmc0enA5cDk2VFpaNTJkd1Fm?=
 =?utf-8?Q?DYyPwr6yuQedlqk5qtHyuotArYv6sWHP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?allZck5QQnFOVFdUcmMyY2lWdTN5VWdienVOVzhpRzM4K0Y4STdDZ1B0Y3dr?=
 =?utf-8?B?bTlzU2xSNFdTbnVxdjQxSXY5THVQdU5MTVhiVjNPVU5uRndNZVYyTytBb1Bh?=
 =?utf-8?B?Q3Zsa3RtOXZ4dWd4YVc3YU02NnNDY2FpVUR1cWF0Ym9OVlFpOW54alN1VTBn?=
 =?utf-8?B?UlFSYnFDSFdsZDJsSmgrcll4ZHBqc0lvZGxUdEdFc1VyZ25yak5CbTZYUzZG?=
 =?utf-8?B?TUhoZnBZcTROMXBjelVRVUpFRWhOSEFLVTk3TjA1YkNmcmVMU2hMUVhBU1Vu?=
 =?utf-8?B?QjFUbkVXSktzc2hVTXlLZ1E1WnZRL1hCeHBoOTdWaEI2ZXNUSjhYR0p1TEZP?=
 =?utf-8?B?L2hNa3A3WitGaklhaE5TUWhyaHY5bEZLVGdBaExabVhJaHhHOGJSKzJpQ1FY?=
 =?utf-8?B?b1BHOVNoeWkrdy9GK0lQK1g2VklVOTh3aWJqU1g0a24raTAvaWhaZngwRlhl?=
 =?utf-8?B?MStzc3ZUSS9EcHlvQUNTOTNkWkFXQ1ZrWG5YUVdMNDdqbVRsaUJhS01UVno3?=
 =?utf-8?B?UHd2c1lUaFV3LzhzSmlGSG1vejA1SWh6bU1LRkF1eHhWUWhYMUFXRDlCcUFw?=
 =?utf-8?B?Y2NzbENvVU50NGtYR2ozTEF3YXNMNTl6WU1Ba2l1czJsQUlYTkNsMXZEcnor?=
 =?utf-8?B?aGY3d0E2SVo1SmY4Y2dkRU9oK253MXI5OFVPT1NGV0NwRUY1eTRIYWhvMURQ?=
 =?utf-8?B?RDZhWUN4YTdsL0JsNHNLTHF6NHo2Y0pqUWpWazI0NFhaQ2xqbjdLYUVUQkhE?=
 =?utf-8?B?NlBrNVVFT2t1dW43QXJUeXdQWHExaW5aeU83dXhvbmtWNllzWmxrVWh4UCsz?=
 =?utf-8?B?YnBrMDhJVDBnSGUzNDVUeENuaUo3L2lOM0U3dlp6K0t2eGIxUjRvYytxcXE1?=
 =?utf-8?B?UE5reE9qYzVWNmgvcWNMUEVXOTNaZWNDYWZsdi9KOWVheTVWa3doSHJUUU1p?=
 =?utf-8?B?empQZHdwR0NvS3E5a1Babk93VGI1RFRzYXNlNGFNVTZnd3ZoWnJSU3UreEIr?=
 =?utf-8?B?TzRkb3I3SS9SV3BFbTQvVzFibmdJZHBsR1Y0TWxYQnl0SnZxMVJrYk5MUGZh?=
 =?utf-8?B?ejN4Yk4rdGFjUDEwcmZiOHFIM2pzQzArN1UvZER0a2RqSjd1R0dYWEJrTy9y?=
 =?utf-8?B?VG5ScjFybnl1N1RRd2VDTVExTkhKL2JiQlFyd3RWcjNITkNoOUUyMjhrejZ4?=
 =?utf-8?B?d1hsdW9sdDE4RVhiL2FUS0hMUUNRdnh5TFhCYi9wV3RKbHZGSWVOUzBmY1FK?=
 =?utf-8?B?c0l2cjdWQWV4RmZnQkpJN2Z4Y0pmSTRlQWNlNjg5U3ZUUi9JWndHdld5T1Fz?=
 =?utf-8?B?bERGWHkzb0pvZlA5aXlQTVpha3cvYlBtOWJ0dkJ1SzJsQXBCdDkvc3p0RTFV?=
 =?utf-8?B?RGtMNEJQV2hjdlhVSFE3d1BLczJVT0ZUMElweEM1WDZGY3RpWkYrZ2lYMnBR?=
 =?utf-8?B?WWduT2RaMVBrZ0xYKzQ5V1JlL1cvNjhDc2I2YjIrVXZ2Wi9tRThGV01yZzBu?=
 =?utf-8?B?RkxYMnROcHQ1L1pXTEJ3dmFNMHJwOVZUZDRsbUtReWlLV3FXQXRSVExRWlI5?=
 =?utf-8?B?ZWJxU1BDSG5zRTJ3VHBpN0dSdmt0U1ZCaDJldDZFUmV2Tjl0V04wVnV0TldX?=
 =?utf-8?B?WVpOT1Zldnl3NytncUh3SWk4b0Z3cm4rVTVhMGJ4NlF3disyMWVvWmYwdXdC?=
 =?utf-8?B?MnhkRk55UmpnVUR3b2NybmdIZm5MMmNkd1pqR3RCeTBYTFduczl5cEhBRVZP?=
 =?utf-8?B?ODM1dW8wNlhMdktuVjFHZGIySllFemhxMFJXWmcydDVBblp5MzZoSHg5Zk9m?=
 =?utf-8?B?Y3BabzdLVEoza1duc1BkMHF0TjVTRWpEcldCM3M1L0UvMTV3UHRuN2xiNFZl?=
 =?utf-8?B?RlRac3FIRjdIQTdGekxGUGhiVy9iVjJPbm5wVVZyKzd2WlR1NVVhdW9vYmVV?=
 =?utf-8?B?UUZpSTA5Ti9vUTZaYngySFNVTTJDNzROSzhTUmlEaGFRdnZWQ3RJM2lsaEJU?=
 =?utf-8?B?VHZnelhHdnAyd2VubU5mTXVuMWZuKzY2cTVPY2doN2MwOStTZVNsQnNhd0R2?=
 =?utf-8?B?V3MrcktwTTJ6TWNiS3lrek9iOEkvUWpZVWFpT3VHUEZsQ0l1Z0hzZ2tyUkht?=
 =?utf-8?Q?os5KKRzppisxyiAWki4HREILb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58706b73-e9b4-45af-f471-08de1ca52c68
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 19:54:47.5081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOBZsoCYE1vNt015FYxpm11p5CFV0AmuegMezBw8tZnOxThP7xCa0uDJvr8zPbqitYlnqyGblvc6CEGRbQeGmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941
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



On 11/5/25 11:30, Leo Li wrote:
>> +void igt_color_pq_inv_eotf(igt_pixel_t *pixel)
>> +{
>> +	struct igt_color_tf_pq inv;
>> +
>> +	pq_inv(&inv);
> Not a blocker for merging; for optimization, it might be better to define pq_inv as a static matrix instead of recalculating it for every pixel.
> - Leo

Thanks Leo.

I created a pq_inv_eotf to replace pq_inv() as below, and tested it with
"Subtest plane-XR30-XR30-pq_125_inv_eotf: SUCCESS (0.789s)", and the 
time difference is literally negligible (all ranged from 0.802s to 
0.775s). I guess CPUs are way too fast.

I'd suggest to keep what it is since there are no visible improvement.

==================
void igt_color_pq_inv_eotf(igt_pixel_t *pixel)
  {
-       struct igt_color_tf_pq inv;
-
-       pq_inv(&inv);
-       tf_pq(pixel, &inv);
+       tf_pq(pixel, &pq_inv_eotf);
  }


  const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 
2413/128.0f, -2392/128.0f, 8192/1305.0f };
+const struct igt_color_tf_pq pq_inv_eotf = {-pq_eotf.A, pq_eotf.D, 1.0f 
/ pq_eotf.F, pq_eotf.B, -pq_eotf.E, 1.0f / pq_eotf.C };
==================


