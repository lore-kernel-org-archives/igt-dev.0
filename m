Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE2CC28B2E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 22:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75F10E1CE;
	Wed, 12 Mar 2025 22:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZdZCldsa";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE8310E1CE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 22:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ht9p+uyKX0aEp6Qgt+lE0H4HXEGcs64r71pYg8u+xPLTRhpnFwDhF1AN5GVO+IEpm/76QiIXl4SZHTW+7CpcmrX0tiAfJrvJzPusvdHbTrfZB8ncSUVFwD9ynUDqZLzpmkraXo4VUBSztdSojwayV2Ed7t77rXc3QldVEydtUh0tYQxa8hxWChIgsn3ag8SYO6Nup7TkMpxNs5wZCfQfydkzKDnuMIhymk27xQNFg+9SSOSZ83k0wALZbZGtml9o/2z570LVfSMMag1ei/RU4sRWBQ+ZTswpukjhxAF8YOyuhP7bMP/Dd5j4fr49Q0ejaYt7KFg6Pv5ytI7/I0Frkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPGHg73khLloXumwEUaFG5NPlKpXnFQSAeavb6EyoUo=;
 b=ZSC7UphvdK05zjnpJgxYLsQHQXDTe8fWp7FYaNOaXTH020BpCEN/1Ew6l2dKMiBV8a4zVUVGF3n57AXYrK7coVewPk2hW598p8Bj6JF9sC4k7nTpYmzcq7p+jt7HU21x1KymKDmwYch655OAuUhRRy6N29mlON8na0hRC73F9IrqvSF9poYmIdZpxCvRkwEBOZjYNtw6twHOqoaaAv8XFiiNXPpnANp4wzT7wxiVMp8GyJqV4X1U9X09t4WkVWPEFF3dyoL8skSaqVUbjXlfqcLdbOoA/4VQoEqTCVvIhx3hFoIj3gGQVRS5vi0aOPocLX9L5Mgi9nRViBYwuBtfTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPGHg73khLloXumwEUaFG5NPlKpXnFQSAeavb6EyoUo=;
 b=ZdZCldsacAmHvmX2ozSjWMexYRygtLKDeUH2fPJCL9h12tj+lriXlp/mxl5WMAU3xhZVV7LjMfbWlHBVeZTnRbFS5zx9RyyoauacxOQATVbwCPr3XZ/kWDMbFm2tX537UDA668tiaFG7ol4AejE1+xwn1oorZ5aunEh+gINimCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6401.namprd12.prod.outlook.com (2603:10b6:208:3b1::8)
 by PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 22:35:48 +0000
Received: from BL3PR12MB6401.namprd12.prod.outlook.com
 ([fe80::8c97:7b76:6800:ae9e]) by BL3PR12MB6401.namprd12.prod.outlook.com
 ([fe80::8c97:7b76:6800:ae9e%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 22:35:48 +0000
Message-ID: <80b7d4e8-2c1e-4b9c-b662-974cc3926a14@amd.com>
Date: Wed, 12 Mar 2025 18:35:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 i-g-t 3/3] scripts/run-tests.sh: Add support to
 kmemleak and igt_facts
From: vitaly prosyak <vprosyak@amd.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <20250307093426.90479-4-peter.senna@linux.intel.com>
 <0ed20d8c-532f-43f2-ac16-82866b641670@amd.com>
 <58d922a6-d24e-4b2c-a3da-1de97e2b065c@linux.intel.com>
 <7992ba86-f665-469b-907b-89f1057a7238@amd.com>
Content-Language: en-US
In-Reply-To: <7992ba86-f665-469b-907b-89f1057a7238@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::15) To BL3PR12MB6401.namprd12.prod.outlook.com
 (2603:10b6:208:3b1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6401:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beaf5b1-eddb-4f2a-47f2-08dd61b63c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2RIbUVhYjlZSDkwR2VjY2liMEkzUWtqQjNZeEQzNFlOZU5vc1A5bnNWNGxs?=
 =?utf-8?B?NVdNc041Z3o3Yjg1S3hxUUlkdHhzSDdxUVFuYkIyNXA3L0dCZEtOVXZGbEVX?=
 =?utf-8?B?SmMrK2RQY0lpanRoZHE0TmZqblVuWTFGYit5NmpDUFRDNmw5NHhuTUcybEda?=
 =?utf-8?B?K0I2NVVEUzdTcEwxeFQ3Y1FYNWovVldycHRWWHkyS0Vvd29EMXMybDAvM3JI?=
 =?utf-8?B?OW1sVUVJNGwyazlna0U5eUpSWnNkazlUL2M2YUdNS3Ywbm1EZ0VROUZBQjFk?=
 =?utf-8?B?UlVGQlRycWdnekFrdHp6T29MamlYRExZaHlIUCtJaXJucG9LTGtJQlVmOXlJ?=
 =?utf-8?B?ODM2MFZVc0lvOENNRm9LSC8wWTJTZjgwdDRsTmRBK3pMcmtRbjRIWWlhdnY0?=
 =?utf-8?B?b1NPSmpJUURKVm1pS21CK3VWd1cwNjAvK0ZxdysyY1Z6SFBUUFZFTVJNL0tZ?=
 =?utf-8?B?WWxUSXI4azI2aGpOWGVSWW40bXZqR3cwRmo0bWgreTN1SE1uTGVNUUN3cWRk?=
 =?utf-8?B?elN1czZtMkJhK0tLSTdmNzZ2V2RtbGk3VmJhbHVYak1zWmtGTXBOZkdyenp0?=
 =?utf-8?B?NTlXRms0TytwMHc1cHAxL2NSL2lXUlFkWVZRdFZLYzVKckMvQ0g1YXNZOHVC?=
 =?utf-8?B?ZTIzQ0VxSE5scUpzZTBES2QrWjNlRlcxdUZNZC9PT1UwQkN2L3FiS0RFRlFa?=
 =?utf-8?B?VnpabUdYek51Rlk3Y0pvMWIxcGlFcXF2TCtQSXVpSk9WelpjRzNJMGhKOFdo?=
 =?utf-8?B?S3RJMVBjcXB6MFFWYWRCUTlGcDVZbkNLeTF4QUFNc0Rscys3bUlWQTdPRnJt?=
 =?utf-8?B?RXlBVlo1M0hqUlpDUE5HTXI2dTRrTHFLWnBROHY5aHkvZTFmZFpqQVowNHE5?=
 =?utf-8?B?WTVFNzQ0cDMwSzlHZUtlOVNsTEJIYm5EZVNmQVJaYVhEK1d0S090eG16aENt?=
 =?utf-8?B?WVUxdXk0eVlxdytOOXJXd0M0RmZxb1RodXBoVHg3N2xwUEdQVGF0V0xBMDhv?=
 =?utf-8?B?WEZXYjRlSUN6WG81anNMY2U3YWkwdGhEZmtBV2lvK3BvYWVhTTFuMElUWlZU?=
 =?utf-8?B?eUVuOGZOT1hST1pldFdoYmV5WnV1SVhzNVNSdlZPT0NnZHBkUlZuMURlWk1z?=
 =?utf-8?B?YmVyeDlQVzYrZklSczBNVlpoSWc5d25zZWtyNWlvbGdBTUNOMHNHdEtwQmpO?=
 =?utf-8?B?RmZHRzhuUDRUZFIxbVdjaEVod0NaUHlEaTZ3QjlmMDNINFowcWphMkpMRis3?=
 =?utf-8?B?SlFEVjdwSkR4NmwwMm5HZzBJbDR1bnJRLzdDVG13Nkp2ZjhoUkJtUVZFbWJK?=
 =?utf-8?B?V0ZDZU5JckRKT1ZZTEgzWm9WbFFnU3BxYXJkSWtGN3BSMzVGb0I3N0tRUmQv?=
 =?utf-8?B?N09aZ3B5NitYREVUeE41eFIvVlFQcHZtajNFSDdzK3NEdmtPMkJtcHRjYTVo?=
 =?utf-8?B?WXBlcjlmTjVTWll3OXdaZURXL0YrNTVWWk9OZk1rTnBpR0J0ZlYxT3NOeWh1?=
 =?utf-8?B?anlNNGxzYTNwVUhwM1lmVTlicVg1RTNjaGx2YkhzQVVWc1ZmQlUvTEZXb0t1?=
 =?utf-8?B?aDFQQVdrYWdLb01KSlU3V3ZCZFNGZ0JncGNsVk40amptYUV2MGk5NGFwNFVT?=
 =?utf-8?B?VXcrQytaRiswQnVCd0FYOU1hWXNmK2JIU1FXNGFaMTVvbmxoSDN3b1NYdjQ2?=
 =?utf-8?B?amg2ZUJhRUlxL0RWY3k1ZEV5ak52YSsxOGQyQjF4K2QxRzhKYjdjcVRwNDJP?=
 =?utf-8?B?UEFtSS90TlZaeCtDVXMzNGJBSVc5K2dXS1pDTzFVL254U2dONG9wRE5BVjhZ?=
 =?utf-8?B?VVVraHJ5TGVyci9iR2ZhaDNtOUVWaW1yOUFHaGlkOTVqVE9rZExEcjd4MExE?=
 =?utf-8?Q?g36KA5UkoCF1W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTFPNVVaK2RGUUVBMzgrem9OZTh3RzVNb25mY0xMZXFYYTlrZm1haVA5VjRw?=
 =?utf-8?B?OGx1QkliUXI2eS82UWJPTlloQ3g3djNray95TitKQWM0SENRVERqQ3RPcXJy?=
 =?utf-8?B?M0JTZ2phRkNsV1ZqdlQrdzJrVitQWktqUmlNaVAwOVRmQlRrTHJMcFVINnlL?=
 =?utf-8?B?WXRaRjF3MDMxTk9aV0ZYYmlrOGlPRHlJc1FaOFhBcHM1YkpKQ2ZQNCtOZGtM?=
 =?utf-8?B?dDFoSEJsZWhJemxnOFFUd3ZkaTVRKzNyb3l5b0hMT3V2d0grQVVmNHhWaXd1?=
 =?utf-8?B?czJkODFodklXQkFzOEhuRHVaUFRqZjZ6Q3RwTkg5SmNPcUxienQwbkxpRDZy?=
 =?utf-8?B?bmZFYVhMdTNzNmdKYW5FNDBHc2F0R1JxUGJaeTFHcmxaSE9zcVJ0Tjl2bDJy?=
 =?utf-8?B?dFRyRGNhczdQOXREUEFmMzA4QStHV3BBQXM5L3dCaXU4d2ZFNEZzZmQwSE1W?=
 =?utf-8?B?dlhYemhiRG5LaE4vMXdWVlRWZDRIckp1NXBpaXlsWFUrNytTWENwTGhZWE5s?=
 =?utf-8?B?VW4vWU1QS0VscUpCR0ppdTNaQ0gvUUswUHVjTEVyeERXaUJVWWtsMVdVbmFk?=
 =?utf-8?B?eGE2YXN3M3FzL1dLWEg5ME5nVGJla2JubmhKVEMwNWFhSmZzMjlsV0tta3VH?=
 =?utf-8?B?c3VZT2JyRWdvNkMzaEhmRm52MW8yTDI5WDIvZms3alpxYWZBUVR3cFRzWm5K?=
 =?utf-8?B?WVFVTFFCUll0TkIxQ01HeThwTGRXb1N6RHd4RWt0SDVxelFlMDdhYm4zTWov?=
 =?utf-8?B?L2ZJK3NzWno5b1JJcFBNRkRWRU9UaXhyV0owdWdnR1BDOW9udDNmYm9nMEo2?=
 =?utf-8?B?NFkwVGVQTXFJbkFURXo4cnI5Z3ZhOFlKeVVjR3hzUTRVSlpUQjNSRmlKZTFo?=
 =?utf-8?B?NkhMUURUSXZwcWt6TnArMHR0OEs5ZjR0dUljQ2gxaDlMcDlSbmswT2xoc0tK?=
 =?utf-8?B?bnh0Ty9TNDNtRS9jTThKSXBGOHBKRW1VSmcvS0JzTzlsZERVOFZ3L3VhdlZP?=
 =?utf-8?B?SmxxNlErTFFpRDJCOExjZlErZm15THdKUmhwZFp6azFnYkdPWUZFbUtjWFUw?=
 =?utf-8?B?M3BGa21oQ3lhbjFWTm5CK2FadHl5bWI1QXZjeVk4OUhlbW9HRUdYbzFPM0hn?=
 =?utf-8?B?UEVwVTBma01BWWVzNklVb3MycWdFQVFKanVDeHRBMCtWR3FoQTAvZGFIazZw?=
 =?utf-8?B?YlZJM1pJcEk5d1VYNm40ZnBIYVkyWVNDaUZoODh5VFAvRXJrWTg5UFczWEpE?=
 =?utf-8?B?Nm8vM0ZsVW5qSUtHVVppSHlmYWxDUktTd1dXYS84eVk1eDZncVMzNjZPOFJU?=
 =?utf-8?B?enRCYXZqcXp5SzJvWXAvUks2by9qYlRPMm0vdVhCRkJLMlY3QXlEMjRkeTR3?=
 =?utf-8?B?WTdMQWFXZUY5SW1GSzNiMENha0Z3SjRpQ0NmT2U5bmRJYnBzSk5Da1BoTkVP?=
 =?utf-8?B?Zm9HYVFhK3FIZ0xiZjBpbGZmd05jV3dmUExqNDQ3R1JTK0svaDVPanZXVkhl?=
 =?utf-8?B?QXJoM1NDZkppMXBSYnBDVVZTaUxiZXBraEhNYktIblRGcHVTN2luK1dtTkNH?=
 =?utf-8?B?TWJuTDdFb1RwL3czbEJhWUpUOWdtRE9GU0JoaGRDbTAvSEtWNlJ3YTBFMVV2?=
 =?utf-8?B?UlBZMVRrbTBibktVeGV1Tk5zUCt6dFVzSC85Z0w0ZUdoc0dDY2RaVktDcXdT?=
 =?utf-8?B?MGhsN1VId1FGUTBYRTJ2azJvVTB1SXErZkZJelk0RFlnZjZjeEs2c2VnUlB1?=
 =?utf-8?B?UFRwcUh0K3RlT1VxYWtZZWQ1UnpGeVhkL3FWbm1WODJsMUhlbndybnNFc1BD?=
 =?utf-8?B?aXd5VGlOTlVSZkxzL1RHb2t1ZXBPd3pJcG9PRmlVc21vT0JiZGtIM09vdDBX?=
 =?utf-8?B?YldEUW5rWVd5QUtlaHEzY1lvQTd0NEZpOUJoWS9LVmZLU1FtRzRFZktydThw?=
 =?utf-8?B?VnM4RlZYSHl3ZUZ2cEYyYm55aFMramVSRmNuNVl5VW03VVZGd0R3ZG54N25K?=
 =?utf-8?B?bFo0YVFnK1JEdFpsRnNhQ1BYWDJ3U1FSa0VSazFJM2d1T3hic1hsOWhNWDdD?=
 =?utf-8?B?cWFIRk8wQTlCdTZ5cTA3aEgwRmNlTFVwOXM5OXp0RkRNeFd1SVpmNC93ODRa?=
 =?utf-8?Q?f07J8NE0VO3FyTKvhx/AyaKse?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beaf5b1-eddb-4f2a-47f2-08dd61b63c28
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 22:35:48.2981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPrRWhcJoDRvjoEeqDiac+3+VFIJ3qVVHda6v5tsUlj1Y0fQ9cww+Yq6retrYX6bJUwacfRjPoGPKqdgm8AVzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933
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

Hi Peter,

We ran the updated igt-runner in our CI with your merged patches, and the memleak feature is working (using the -keach command). However, we noticed what seems to be false positives related to the ACPI driver. The stack is provided below.

I haven’t had a chance to investigate this further, but I think it would be a good idea to share our findings upstream for memleaks found outside of the AMDGPU or i915 drivers.

Here the stack:

comm "swapper/0", pid 1, jiffies 4294672730

 hex dump (first 32 bytes):

   00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................

   f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............

 backtrace (crc 2df71a7e):

   [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80

   [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370

   [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0

   [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400

   [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60

   [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0

   [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380

   [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0

   [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490

   [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70

   [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0

   [<ffffffff83867799>] acpi_scan_init+0x119/0x290

   [<ffffffff8386711a>] acpi_init+0x23a/0x590

   [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0

   [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680

   [<ffffffff824ca53b>] kernel_init+0x1b/0x170unreferenced object 0xffff888102a2ed18 (size 80):

 comm "swapper/0", pid 1, jiffies 4294672730

 hex dump (first 32 bytes):

   38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....

   f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......

Thanks, Vitaly


On 2025-03-10 16:05, vitaly prosyak wrote:
> Hi Peter and Kamil,
>
> We'll run the tests and I'll follow up on this thread.
>
> Really appreciate you merging this—thank you!
>
> Best,
> Vitaly
>
> On 2025-03-10 03:07, Peter Senna Tschudin wrote:
>> Hi Vitaly,
>>
>> On 10.03.2025 04:07, vitaly prosyak wrote:
>>> Hi Peter,
>>>
>>> Version 8 of your three patches looks good to me. However, I haven't tested them locally.
>>> Let me know if you’d like us to run them locally ( not CI)
>> I ran local tests before sending the patches, so I’m confident there are no major issues.
>> That said, if you’re able to test them locally as well, it would help confirm that
>> everything is working as expected. I’d appreciate it if you could run the tests.
>>
>>> Thanks for the improvements!
>> Thank you for reviewing the patches!
>>
>> Peter
>>
>> [...]
