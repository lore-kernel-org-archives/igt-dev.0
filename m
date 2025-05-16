Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F67C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 05:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97C010E99F;
	Fri, 16 May 2025 05:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MQCihXXL";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2081.outbound.protection.outlook.com [40.107.212.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745AB10E99F
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 05:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SczBhZSGy9uh0IJR0Xx2UNQiT5ALZzhUMiF8oXfU2+W6LOb6QVPi+aDvk45x+PybJmC/GTdj9pEdnYYejqkkOKyhfe64YXvOv6HpjbdFnRR80hPCb0JuBd91l5ZqcvtRO/wI1vo1bP0UVwon/sxt2CT42gKdRWD6Y3rLDE1AB+VKsyymbaocnQ1ILf5Tg/lp7Q5KP250BJtSc5nT1geDgDd2HyQR2JcAEyYijX4meBvdu3ktkYXMIrwvzhx2OxKNhNcTS7V48eCIyVq8uDPjZXIHRHskWtmkk6ZNLaSdFEAk0fJb3l8R5JqG4n1+S8gbhLRn9isK6uhslikjJqkjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC/KdZvCU5mSdLFOXhB1mehYZgDHlolfJ7bMjHMa3Yw=;
 b=dz3dkshJs7Jxh1Un3v9nyYYnCwMsKAyCnsxprFueM+kjd/Cs5szusbaQCbQeKwwkhQouQc4/m8trAQc738AicZM1CvnTxmFVt/zDisfB0YFF57UTKnOwZDIXiq+V8EoparLhaoDnadq6EDuxQF5iMzH3AX1b+Wo6lUuTIIxCRnyzDEqgJUjir2pyFOWZ5FAfzc42ho6aPULP+VKP7z1kRAlwTmQH+8Jv4jkeYi/XpPeoR4iBvrAF9QZyawSdF7xhin8YC06LY7eVKNpPgCZxoan9AjYBbD/xNlhhHVHmsjYlPvSl2VE8KW1SiYAisfzjVxnQlBH//Hds5IGQTKIc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC/KdZvCU5mSdLFOXhB1mehYZgDHlolfJ7bMjHMa3Yw=;
 b=MQCihXXLjkjwsyAkpwcOmxDDt/0n0RSx7O6WvBHUzXG5Ryi6ffvVvvZq5YYhB6HttHevTeTTSRWLW17rIhRTDlEQWq9nHb+9yvpquhpkXIAtCEK+yBm60PIWfNqZOhRWmKk89atL9C9NIzdS1HAq2P9W+ENsLCgDdp2zH/tgnVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 16 May
 2025 05:51:36 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 05:51:36 +0000
Content-Type: multipart/alternative;
 boundary="------------N6kVWGjOUlRbErCI6ScXQRaT"
Message-ID: <2de8ccf8-6cac-4021-8b21-824040c16ca0@amd.com>
Date: Fri, 16 May 2025 11:21:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/amdgpu: add fwm preemption test case for
 userq
To: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <PH7PR12MB663326AE2280463B9F393B1FFF90A@PH7PR12MB6633.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <PH7PR12MB663326AE2280463B9F393B1FFF90A@PH7PR12MB6633.namprd12.prod.outlook.com>
X-ClientProxiedBy: PN2PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::22) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: 780ee1bf-3a72-452c-6bc0-08dd943db7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmJvZUJnR1VlWnFyNU5FUVpuVXpkdVp3OW5jWmlIK3AvdjkzbVRvQ21GbGU1?=
 =?utf-8?B?NTJLMWFLaFBCM1ZTaHkva2tUVWxiOTdndWc0UC9ZOElVTC9yMDBVRzRUWWc0?=
 =?utf-8?B?Sm1HUDhuL3l5QUNJbkZxVEs5cUtYeUEvTDRyL0dVZFZWcEtXR2M0VDE0cmIy?=
 =?utf-8?B?bmk2WEI1OTc5ZndJWUdtWGlPMXRqb09sTFJ5WXI2blIyWjl2VlltM0pkS2Nw?=
 =?utf-8?B?QWtFRDR2bURuQzBMNzZXRGZwQTJtK2hNbURiM1hGNUFqdysvN3JEa0hPbjQr?=
 =?utf-8?B?WDdkajBRSHprd1hqRmZmOSt5WmJsdXZZSEVWcDRBN1RVT01MaXBya3B4Vk04?=
 =?utf-8?B?L2tPcWhIcnEzYm5RbFdVeDlFY2ZndVBIMExJYVpXR21zSWtCVFhjdlNoQm0w?=
 =?utf-8?B?T1Fla2MvTUxKQ3ZQOXNpdG1wa1pXRXZSU2lWWmlpdGxRa1ZxUTQ3T0drcDZR?=
 =?utf-8?B?eU5TZWphZmVNdnZiM054bXpkVUpZeXp0a2VqTGJiQ01QRU1sbDJmNTZtbDh6?=
 =?utf-8?B?aEJWZ294dFI2SmhIVnRxTktXWFdZdTFpQm5SYmNpallmNnR2clR4RHFYczB4?=
 =?utf-8?B?aG00NEhTcFROZFo0RUF1ZVhRcWs3c3RBUHM0c1ZLWTBGNnh0SlZUSmhSSG15?=
 =?utf-8?B?ME0yTWF3MVU4eW9JQVhNZG93WWpKK1lDNU5qeDYyeDVldWhqWVFtaVRUbWY5?=
 =?utf-8?B?SFAwVU1oNHpDcGk3QlBaVFJiN2tKUml4c09DSFpjWExYelJHbSsvSWpxWUJx?=
 =?utf-8?B?RFlPM2lseUgxWkVZeUNyVTU2cG9TS0l2ZXRqdUhadXpmaVJDWEQvb2drT2J3?=
 =?utf-8?B?czh2SmFYeE1CQmE3TDN6RjJwVFRVRGdtSmVtRFY4NmNxWXhOYkk3a1lKNjB5?=
 =?utf-8?B?WEJQVGx5bjVvQ2dkei9Mc1RNbVdPV0JRN1A1NkZHNXlPRnZvemY0TE5oMEY4?=
 =?utf-8?B?SHhkVWdxOFhGNXp0RDVRc05pS0JXWHlCZmFyTmEyV2MxZG5VQmtTdzBQeUxo?=
 =?utf-8?B?SythSURKN29Bbk12a2t1Y1NpVDNOcWtaSERoT01GaVV6T2hXZDRML3NaMkJu?=
 =?utf-8?B?VVdPclRGc2h6RXNHOVY5MzBXeHU3cDhhT3ByWXVVeDgzNXFBMXUzUHYrYWxX?=
 =?utf-8?B?VEZGSmFlMnZKbHpxQ1c0blJiVkp4czZhc2RGQmwxZW1USDRYelZZMnVJZnVi?=
 =?utf-8?B?cG5SUzMrcnRXcGk2OVF4UWllN3FrZ3JXWWVOQ2I5S3NUeFNWaHdUeVE1UjRI?=
 =?utf-8?B?ZkdCQlk5QVl6SDFKanRRVWFSYStWdExYU0RtK3IwNzEvNnFNMnc2Qk1Zd2E3?=
 =?utf-8?B?L2UxU0lRTHgvSUZ0SzBEQytyRDVPVTU2b1U3Z1ZCM0hZRFpQdzQyS3JFZ2Zq?=
 =?utf-8?B?cE1QeFIzRTdJTUN0dDZYbEszZSsySGpnbXora2ppRmxnazJ2TXI0ZHZiRUF0?=
 =?utf-8?B?enBhOU1oNE5UcEQrRmxNUVdJVDRKN2tnZWpiM2Eydmp0WkcrM0xacjNHcWxM?=
 =?utf-8?B?ZnhYWWQrU3N4ZzdTcWRzVU1zUVA4VEFrWkIwWUpMTDZqS2d6RnU3TUpxSGY5?=
 =?utf-8?B?ODcvQW9Tbzh3d0FzQ3NITTBlZlJrZ0MzclpXWkROSFA2UTNiRTdKWUhRMTMy?=
 =?utf-8?B?L1VpQnpaM1lYSHZJZ1MyYTN3ZGZYckgzYlVSNk1ZeHNxSTFmK1QzU044TnFZ?=
 =?utf-8?B?WUJCTmJISmFrZDFZV0MydldsQ1pxbm8vMkJMRlNzMURRbDVBWkRQb2FCOVpp?=
 =?utf-8?B?ekRnWVFrbFR6aXZJK3VvWUxUbHpRVC9aeWY4U2ZleU1SYUg2d3l1WXI0NkQw?=
 =?utf-8?B?S2cwK05XTDdxMWVIYkVWUTBPbmVqYWl3ZnM0dHArY29vQ1NOM1VINk9kN3No?=
 =?utf-8?B?UWdhNjQyUUJCcExXRGxBT2tOM0dCVGxQUitGZ1JMNDRrdlFWanA2UnFKbWJh?=
 =?utf-8?Q?G+N7Qo12JsA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z05ZRk41OGJONnlLV1M0cVBtSnhTejl5ZzA5bWptUmNRNmRjSUF1cjNsbWdk?=
 =?utf-8?B?T0xhOFVKNnJYRWkxRWhvdHp0czJ0M1NqcFZVSVFFOVN3ZTZJN2hZZlZoUjdm?=
 =?utf-8?B?d09LZEVVTllGdHJpdnhMaXZJZG9qcDdodmtuRDM0djhRTjJYcHBwcWpzcHZH?=
 =?utf-8?B?blIyV1diRjB3bVR0azlxUjhNQ2x6M1VLejM0RTJ6MVpnWmFlVE5IUys0Sm5u?=
 =?utf-8?B?OE5zWFpUaHZERnpzL1Y2eUU0TmdJaUhKdGZQbFk0enpGNmdEMGExV0pGTGlV?=
 =?utf-8?B?UkRMWUxnNlJ5V3hQa2dXTG9oQTViVmRxYlUzSDZFZ1dmc0MxaTJyTGRUYlYy?=
 =?utf-8?B?WnlEeEZmSjVwWkIzWWRrYzVaT00vL3ZRcVd6UUZBTHU3UzBLR2xjVjFuYnc0?=
 =?utf-8?B?MmZwZFJVZlVNalhjK0t4Ujl5clFtU1YrY1ZTYXBBT1luVEQ2VGpWaWwyYkQ2?=
 =?utf-8?B?MVBjWU1YWXdtWDRkcmZVKy9mZmxybHdQRkJqSHdsbmlyaEFLblRWNGN1MGk3?=
 =?utf-8?B?Y0lneWpzUjkzQXM3N2xFTHBnM0xIYW1EMzZNNElVanF4eWw3blorVDZJa3JK?=
 =?utf-8?B?dUtvM0N3N2FRZzRDaWt0WEdKRUVGQTRNRThsVktOOW5wTGhhWEh0TDZkZ2Zi?=
 =?utf-8?B?ajd6ODQweXdXUEtUOUs1TXhDenJMN1Z5QzRxZHhpWjNJR25WMXprZ2pSTkp3?=
 =?utf-8?B?bkJwZWFBem45UjJFa0JvbHBTV3kyUWF2ZnZrV1pLZnlFUFBxWS9sUk8yU2tn?=
 =?utf-8?B?VjY1a041eVJRU3JpdkZYS0d0bWFyWDlkbFBuME5WZnNNdVJjYzdUWFhPTTg3?=
 =?utf-8?B?b0IvR1Y5RVVEU3RYM3YyaHorWXhNQ0FWY1c5clBXQUVWaVdCZ0xickUzeW8z?=
 =?utf-8?B?NWduSm5WVnhVektXbmFkbUVtNmtuZ0xtUGxNejI4QVdqYWx3OVBXckRFSFZY?=
 =?utf-8?B?YzZ0Y1Zib2pQbEVpMnFTclJwKzByMCsxclZpZEszcGhMdVczWXdUSkUwR3Ez?=
 =?utf-8?B?Q05scG1oMUFEOU1MVVFYVUo4aHdOejN6TWVuRjRNMFVMRXhOalB3aFVMK3py?=
 =?utf-8?B?WEViYVhYbzZOQVJxQVUxZWNtZkdGQ24xQjhFTnlkc2dFenlkdVBGQkk2dUND?=
 =?utf-8?B?QU1Ud01SUlZSWSttUG12UmIvQjMzMjAyVTlKd09sY0dqSGZrK1IvOFNTVEZO?=
 =?utf-8?B?cmluREhDcmdROVJFMC9RaEtIa2NCb3pURXIvQWNEN2pGOEh2dWRMOFhicWtL?=
 =?utf-8?B?SllIZ0QyTkdDMkdqSVUrMjlZcFFaS3ZBN0RJOUJ2M2FUNGN5aUVpOHdkZGRZ?=
 =?utf-8?B?UURIMWFUZFNDNzlDMjFKVXZtZVNhN2N1anljUFBNck1uRitxUU9oUGh0eW44?=
 =?utf-8?B?S3ErZmMwcFdhOVhYWERUYzNtQWZORjg2TERYbktFVXZLUHFrZHRQZWdSM0dy?=
 =?utf-8?B?N1U1TDk0eEFadDlMOEJRMUtYdnBnbjB0MjU4MW1ET083WFRjOWVmMVBlSjFa?=
 =?utf-8?B?NXZocldDOWhkcTFXVGhmKzZyNkFxTWloUGJkN2tudHBHQjBZcGZwaUtGdVo5?=
 =?utf-8?B?ZVpQMHFFRVgySGhvUURuVjhKcTNablFpYkFtRXZPaG1Dak9MQVBmL3A2RVV1?=
 =?utf-8?B?ZFduR2dEaWZ1ZXJZY21xR0trdnNkaWorS2JMbDYydHJCZTJKamxiKzh3b2J3?=
 =?utf-8?B?MFFkS0xFazM0bWpVMTNlWU9DL3YyTEpuUFg0T3EzcUhqb1R1KytBQ0NpZkJE?=
 =?utf-8?B?YVg0Y3Fsc1k0MUphZ2t0YkpQNm5MMVhRT1ZFRHhYdk5YQkR5cENia0FYbnBy?=
 =?utf-8?B?Q1E0RTExeUNsUmlwZGczUGRzZVlVay9uSGs3VFNQZnRUdE5DMXl1YitHU1BJ?=
 =?utf-8?B?YWRLM2xOQlJHT2sxMGkwWlBVVlk0MUtKbDVkZU56Z04rdS9XTUNGb2dwQ1dB?=
 =?utf-8?B?eE1POEdpNlpObkhQMUh1NGRjb2hWRG0wOHRZeUQ5OTkyaytzcXJXM3ZqVXlL?=
 =?utf-8?B?ZStjRTRRZzBhYUZCaTZWamNyTFZUZm9MWDRlVTQyT2NTdG5pQ0tTcWhtOGJt?=
 =?utf-8?B?cWl2dlgwQklJRHFXeTh6WjFYbCtUTnlDcTl4ZFV0SkhQMWthR3ViUmpqVnZQ?=
 =?utf-8?Q?aiFT7sISXVddYMWG8JifGhp3v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780ee1bf-3a72-452c-6bc0-08dd943db7f8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 05:51:36.1913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBaNLvR+ur5xELSwKdTbjH74HbdPFVup7spXj5T8yPFMDYe2AxwXeHiQ/7A6JYsNvQxrSC97dAIikGIzS7REJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934
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

--------------N6kVWGjOUlRbErCI6ScXQRaT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Also, just to be sure that we arent arent suing dma/sdma engine as its 
not supporter yet in userq. So i am assuming dma write isnt exactly 
using the sdma engine ?

Other wise code looks god to me. With the above understanding, code is 
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>


On 5/15/2025 12:13 PM, Mohan Marimuthu, Yogesh wrote:
>
> [Public]
>
>
> [Public]
>
>
> The fwm premption is tested using below algorithm,
> 1) create 2 queues
> 2) submit dma write job with unsatisfied fence on both the queues
> 3) if the dma write passes then the test has failed
>
> Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
> ---
>  lib/amdgpu/amd_PM4.h     |  17 ++++
>  tests/amdgpu/amd_basic.c | 178 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 195 insertions(+)
>
> diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
> index 8f59b4223..d6a8446f4 100644
> --- a/lib/amdgpu/amd_PM4.h
> +++ b/lib/amdgpu/amd_PM4.h
> @@ -195,6 +195,23 @@
>  #define PACKET3_INDIRECT_BUFFER 0x3F
>  #define PACKET3_PROTECTED_FENCE_SIGNAL  0xd0
> +#define PACKET3_FENCE_WAIT_MULTI  0xd1
> +#define          FENCE_WAIT_MULTI_PREEMPTABLE(x) ((x) << 1)
> +           /* 0 - no
> +            * 1 - yes
> +            */
> +#define          FENCE_WAIT_MULTI_CACHE_POLICY(x)  ((x) << 2)
> +           /* 0 - LRU
> +            * 1 - Stream
> +            * 2 - noa
> +            * 3 - Bypass
> +            */
> +#define          FENCE_WAIT_MULTI_ENGINE(x)  ((x) << 8)
> +           /* 0 - me
> +            * 1 - pfp
> +            */
> +#define          FENCE_WAIT_MULTI_POLL_INTERVAL(x) ((x) << 16)
> +
>  #define    PACKET3_WRITE_DATA                        0x37
>  #define          WRITE_DATA_DST_SEL(x) ((x) << 8)
>             /* 0 - register
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 914d27909..00651e8a2 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -689,6 +689,176 @@ amdgpu_sync_dependency_test(amdgpu_device_handle 
> device_handle, bool user_queue)
>       free(ring_context);
>  }
> +static void
> +amdgpu_fwm_preempt_test(amdgpu_device_handle device_handle)
> +{
> +     struct amdgpu_ring_context *ring_context_1;
> +     struct amdgpu_ring_context *ring_context_2;
> +     struct amdgpu_cmd_base *cmd_base_1 = get_cmd_base();
> +     struct amdgpu_cmd_base *cmd_base_2 = get_cmd_base();
> +     const struct amdgpu_ip_block_version *ip_block = 
> get_ip_block(device_handle, AMD_IP_GFX);
> +     int r;
> +
> +     ring_context_1 = calloc(1, sizeof(struct amdgpu_ring_context));
> +     igt_assert(ring_context_1);
> +     amdgpu_user_queue_create(device_handle, ring_context_1, 
> ip_block->type);
> +
> +     ring_context_2 = calloc(1, sizeof(struct amdgpu_ring_context));
> +     igt_assert(ring_context_2);
> +     amdgpu_user_queue_create(device_handle, ring_context_2, 
> ip_block->type);
> +
> +     /* allocate bo1 for dma, bo2 for fence and bo3 for ib for render 
> context 1 */
> +     ring_context_1->write_length = 1024;
> +     r = amdgpu_bo_alloc_and_map_sync(device_handle , 
> ring_context_1->write_length, 4096,
> +                              AMDGPU_GEM_DOMAIN_GTT, 
> AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> +                              AMDGPU_VM_MTYPE_UC, &ring_context_1->bo,
> +                              (void **)&ring_context_1->bo_cpu, 
> &ring_context_1->bo_mc,
> +                              &ring_context_1->va_handle,
> +                              ring_context_1->timeline_syncobj_handle,
> +                              ++ring_context_1->point, true);
> +     igt_assert_eq(r, 0);
> +     memset((void *)ring_context_1->bo_cpu, 0, 
> ring_context_1->write_length);
> +
> +     r = amdgpu_bo_alloc_and_map_sync(device_handle, 4096, 4096, 
> AMDGPU_GEM_DOMAIN_GTT,
> +                              AMDGPU_GEM_CREATE_CPU_GTT_USWC, 
> AMDGPU_VM_MTYPE_UC,
> +                              &ring_context_1->bo2, (void 
> **)&ring_context_1->bo2_cpu,
> +                              &ring_context_1->bo_mc2, 
> &ring_context_1->va_handle2,
> +                              ring_context_1->timeline_syncobj_handle,
> +                              ++ring_context_1->point, true);
> +     igt_assert_eq(r, 0);
> +     memset((void *)ring_context_1->bo2_cpu, 0, 4096);
> +
> +     r = amdgpu_bo_alloc_and_map_sync(device_handle, 8192, 4096, 
> AMDGPU_GEM_DOMAIN_GTT,
> +                              AMDGPU_GEM_CREATE_CPU_GTT_USWC, 
> AMDGPU_VM_MTYPE_UC,
> +                              &ring_context_1->bo3, (void 
> **)&ring_context_1->bo3_cpu,
> +                              &ring_context_1->bo_mc3, 
> &ring_context_1->va_handle3,
> +                              ring_context_1->timeline_syncobj_handle,
> +                              ++ring_context_1->point, true);
> +     igt_assert_eq(r, 0);
> +     memset((void *)ring_context_1->bo3_cpu, 0, 4096);
> +
> +     /* allocate bo1 for dma, bo2 for fence and bo3 for ib for render 
> context 2 */
> +     ring_context_2->write_length = 1024;
> +     r = amdgpu_bo_alloc_and_map_sync(device_handle , 
> ring_context_2->write_length, 4096,
> +                              AMDGPU_GEM_DOMAIN_GTT, 
> AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> +                              AMDGPU_VM_MTYPE_UC, &ring_context_2->bo,
> +                              (void **)&ring_context_2->bo_cpu, 
> &ring_context_2->bo_mc,
> +                              &ring_context_2->va_handle,
> +                              ring_context_2->timeline_syncobj_handle,
> +                              ++ring_context_2->point, true);
> +     igt_assert_eq(r, 0);
> +     memset((void *)ring_context_2->bo_cpu, 0, 
> ring_context_2->write_length);
> +
> +     r = amdgpu_bo_alloc_and_map_sync(device_handle, 4096, 4096, 
> AMDGPU_GEM_DOMAIN_GTT,
> +                              AMDGPU_GEM_CREATE_CPU_GTT_USWC, 
> AMDGPU_VM_MTYPE_UC,
> +                              &ring_context_2->bo2, (void 
> **)&ring_context_2->bo2_cpu,
> +                              &ring_context_2->bo_mc2, 
> &ring_context_2->va_handle2,
> +                              ring_context_2->timeline_syncobj_handle,
> +                              ++ring_context_2->point, true);
> +     igt_assert_eq(r, 0);
> +     memset((void *)ring_context_2->bo2_cpu, 0, 4096);
> +
> +     r = amdgpu_bo_alloc_and_map_sync(device_handle, 8192, 4096, 
> AMDGPU_GEM_DOMAIN_GTT,
> +                              AMDGPU_GEM_CREATE_CPU_GTT_USWC, 
> AMDGPU_VM_MTYPE_UC,
> +                              &ring_context_2->bo3, (void 
> **)&ring_context_2->bo3_cpu,
> +                              &ring_context_2->bo_mc3, 
> &ring_context_2->va_handle3,
> +                              ring_context_2->timeline_syncobj_handle,
> +                              ++ring_context_2->point, true);
> +     igt_assert_eq(r, 0);
> +     memset((void *)ring_context_2->bo3_cpu, 0, 4096);
> +
> +
> +     /* wait for gtt mapping to complete */
> +     r = amdgpu_timeline_syncobj_wait(device_handle, 
> ring_context_1->timeline_syncobj_handle,
> +                      ���       ring_context_1->point);
> +     igt_assert_eq(r, 0);
> +     r = amdgpu_timeline_syncobj_wait(device_handle, 
> ring_context_2->timeline_syncobj_handle,
> +                              ring_context_2->point);
> +     igt_assert_eq(r, 0);
> +
> +     /* assign cmd buffer for ring context 1 */
> +     cmd_base_1->attach_buf(cmd_base_1, (void 
> *)ring_context_1->bo3_cpu, 8192);
> +
> +     /* create the ib for ring context 1 */
> +     cmd_base_1->emit(cmd_base_1, PACKET3(PACKET3_FENCE_WAIT_MULTI, 4 
> * 1));
> +     cmd_base_1->emit(cmd_base_1, FENCE_WAIT_MULTI_ENGINE(1) | 
> FENCE_WAIT_MULTI_PREEMPTABLE(1) |
> +                     FENCE_WAIT_MULTI_CACHE_POLICY(3) | 
> FENCE_WAIT_MULTI_POLL_INTERVAL(4));
> +     cmd_base_1->emit(cmd_base_1, ring_context_1->bo_mc2);
> +     cmd_base_1->emit(cmd_base_1, ring_context_1->bo_mc2 >> 32);
> +     cmd_base_1->emit(cmd_base_1, 10); // random incorrect fence value
> +     cmd_base_1->emit(cmd_base_1, 0);
> +
> +     cmd_base_1->emit(cmd_base_1, PACKET3(PACKET3_WRITE_DATA, 3));
> +     cmd_base_1->emit(cmd_base_1, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
> +                     WRITE_DATA_CACHE_POLICY(3));
> +     cmd_base_1->emit(cmd_base_1, 0xfffffffc & ring_context_1->bo_mc);
> +     cmd_base_1->emit(cmd_base_1, (0xffffffff00000000 & 
> ring_context_1->bo_mc) >> 32);
> +     cmd_base_1->emit(cmd_base_1, 0xdead0000);
> +
> +     ring_context_1->pm4_dw = cmd_base_1->cdw;
> +     amdgpu_user_queue_submit(device_handle, ring_context_1, 
> ip_block->type,
> +                        ring_context_1->bo_mc3, true);
> +
> +     /* if fwm packet got skipped by firmware then 0xdead000 will be 
> written */
> +     usleep(1000 * 100);
> +     igt_assert_eq_u32(*ring_context_1->bo_cpu, 0);
> +
> +     /* assign cmd buffer for ring context 2 */
> +     cmd_base_2->attach_buf(cmd_base_2, (void 
> *)ring_context_2->bo3_cpu, 8192);
> +
> +     /* create the ib for ring context 2 */
> +     cmd_base_2->emit(cmd_base_2, PACKET3(PACKET3_FENCE_WAIT_MULTI, 4 
> * 1));
> +     cmd_base_2->emit(cmd_base_2, FENCE_WAIT_MULTI_ENGINE(1) | 
> FENCE_WAIT_MULTI_PREEMPTABLE(1) |
> +                     FENCE_WAIT_MULTI_CACHE_POLICY(3) | 
> FENCE_WAIT_MULTI_POLL_INTERVAL(4));
> +     cmd_base_2->emit(cmd_base_2, ring_context_2->bo_mc2);
> +     cmd_base_2->emit(cmd_base_2, ring_context_2->bo_mc2 >> 32);
> +     cmd_base_2->emit(cmd_base_2, 10); // random incorrect fence value
> +     cmd_base_2->emit(cmd_base_2, 0);
> +
> +     cmd_base_2->emit(cmd_base_2, PACKET3(PACKET3_WRITE_DATA, 3));
> +     cmd_base_2->emit(cmd_base_2, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
> +                     WRITE_DATA_CACHE_POLICY(3));
> +     cmd_base_2->emit(cmd_base_2, 0xfffffffc & ring_context_2->bo_mc);
> +     cmd_base_2->emit(cmd_base_2, (0xffffffff00000000 & 
> ring_context_2->bo_mc) >> 32);
> +     cmd_base_2->emit(cmd_base_2, 0xdead0000);
> +
> +     ring_context_2->pm4_dw = cmd_base_2->cdw;
> +     amdgpu_user_queue_submit(device_handle, ring_context_2, 
> ip_block->type,
> +                        ring_context_2->bo_mc3, true);
> +
> +     /* if fwm packet got skipped by firmware then 0xdead000 will be 
> written */
> +     usleep(1000 * 10);
> +     igt_assert_eq_u32(*ring_context_1->bo_cpu, 0);
> +     igt_assert_eq_u32(*ring_context_2->bo_cpu, 0);
> +
> +     /* set the correct fence value to finish executing the ib */
> +     *ring_context_1->bo2_cpu = 10;
> +     *ring_context_2->bo2_cpu = 10;
> +     usleep(1000 * 10);
> +     igt_assert_eq_u32(*ring_context_1->bo_cpu, 0xdead0000);
> +     igt_assert_eq_u32(*ring_context_2->bo_cpu, 0xdead0000);
> +
> +     amdgpu_user_queue_destroy(device_handle, ring_context_1, 
> ip_block->type);
> +     amdgpu_user_queue_destroy(device_handle, ring_context_2, 
> ip_block->type);
> +
> +     amdgpu_bo_unmap_and_free(ring_context_1->bo, 
> ring_context_1->va_handle,
> +                        ring_context_1->bo_mc, 
> ring_context_1->write_length);
> +     amdgpu_bo_unmap_and_free(ring_context_1->bo2, 
> ring_context_1->va_handle2,
> +                        ring_context_1->bo_mc2, 4096);
> +     amdgpu_bo_unmap_and_free(ring_context_1->bo3, 
> ring_context_1->va_handle3,
> +                        ring_context_1->bo_mc3, 8192);
> +     amdgpu_bo_unmap_and_free(ring_context_2->bo, 
> ring_context_2->va_handle,
> +                        ring_context_2->bo_mc, 
> ring_context_2->write_length);
> +     amdgpu_bo_unmap_and_free(ring_context_2->bo2, 
> ring_context_2->va_handle2,
> +                        ring_context_2->bo_mc2, 4096);
> +     amdgpu_bo_unmap_and_free(ring_context_2->bo3, 
> ring_context_2->va_handle3,
> +                        ring_context_2->bo_mc3, 8192);
> +     free_cmd_base(cmd_base_1);
> +     free_cmd_base(cmd_base_2);
> +     free(ring_context_1);
> +     free(ring_context_2);
> +}
> +
>  igt_main
>  {
>       amdgpu_device_handle device;
> @@ -815,6 +985,14 @@ igt_main
>                   amdgpu_sync_dependency_test(device, true);
>             }
>       }
> +
> +     igt_describe("Check-FWM-preempt-using-GFX-UMQ");
> +     igt_subtest_with_dynamic("fwm-prempt-test-with-IP-GFX-UMQ") {
> +           if (userq_arr_cap[AMD_IP_GFX]) {
> +                 igt_dynamic_f("fwm-preempt-test-with-gfx-umq")
> +                 amdgpu_fwm_preempt_test(device);
> +           }
> +     }
>  #endif
>       igt_fixture {
> -- 
> 2.43.0
>
>
--------------N6kVWGjOUlRbErCI6ScXQRaT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <p>Also, just to be sure that we arent arent suing dma/sdma engine
      as its not supporter yet in userq. So i am assuming dma write isnt
      exactly using the sdma engine ?</p>
    <p>Other wise code looks god to me. With the above understanding,
      code is Reviewed-by:
      Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/15/2025 12:13 PM, Mohan Marimuthu,
      Yogesh wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PH7PR12MB663326AE2280463B9F393B1FFF90A@PH7PR12MB6633.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left">
        [Public]<br>
      </p>
      <br>
      <div>
        <p style="font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left">
          [Public]<br>
        </p>
        <br>
        <div><span style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">The
            fwm premption is tested using below algorithm,</span>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            1) create 2 queues</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            2) submit dma write job with unsatisfied fence on both the
            queues</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            3) if the dma write passes then the test has failed</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            Signed-off-by: Yogesh Mohan Marimuthu
            <a class="moz-txt-link-rfc2396E" href="mailto:yogesh.mohanmarimuthu@amd.com">&lt;yogesh.mohanmarimuthu@amd.com&gt;</a></div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            ---</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;lib/amdgpu/amd_PM4.h &nbsp; &nbsp; | &nbsp;17 ++++</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;tests/amdgpu/amd_basic.c | 178
            +++++++++++++++++++++++++++++++++++++++</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;2 files changed, 195 insertions(+)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            index 8f59b4223..d6a8446f4 100644</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --- a/lib/amdgpu/amd_PM4.h</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +++ b/lib/amdgpu/amd_PM4.h</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -195,6 +195,23 @@</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;#define PACKET3_INDIRECT_BUFFER &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            0x3F</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;#define PACKET3_PROTECTED_FENCE_SIGNAL &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;0xd0</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +#define PACKET3_FENCE_WAIT_MULTI &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;0xd1</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +#define          FENCE_WAIT_MULTI_PREEMPTABLE(x) &nbsp; &nbsp; &nbsp; &nbsp;
            ((x) &lt;&lt; 1)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           /* 0 - no</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +            * 1 - yes</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +            */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +#define          FENCE_WAIT_MULTI_CACHE_POLICY(x) &nbsp; &nbsp; &nbsp;
            &nbsp;((x) &lt;&lt; 2)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           /* 0 - LRU</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +            * 1 - Stream</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +            * 2 - noa</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +            * 3 - Bypass</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +            */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +#define          FENCE_WAIT_MULTI_ENGINE(x) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;((x) &lt;&lt; 8)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           /* 0 - me</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +            * 1 - pfp</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +            */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +#define          FENCE_WAIT_MULTI_POLL_INTERVAL(x) &nbsp; &nbsp; &nbsp;
            ((x) &lt;&lt; 16)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;#define    PACKET3_WRITE_DATA                        0x37</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;#define          WRITE_DATA_DST_SEL(x) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            ((x) &lt;&lt; 8)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           /* 0 - register</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            diff --git a/tests/amdgpu/amd_basic.c
            b/tests/amdgpu/amd_basic.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            index 914d27909..00651e8a2 100644</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --- a/tests/amdgpu/amd_basic.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +++ b/tests/amdgpu/amd_basic.c</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -689,6 +689,176 @@
            amdgpu_sync_dependency_test(amdgpu_device_handle
            device_handle, bool user_queue)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     free(ring_context);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;}</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +static void</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +amdgpu_fwm_preempt_test(amdgpu_device_handle device_handle)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +{</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     struct amdgpu_ring_context *ring_context_1;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     struct amdgpu_ring_context *ring_context_2;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     struct amdgpu_cmd_base *cmd_base_1 = get_cmd_base();</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     struct amdgpu_cmd_base *cmd_base_2 = get_cmd_base();</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     const struct amdgpu_ip_block_version *ip_block =
            get_ip_block(device_handle, AMD_IP_GFX);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     int r;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     ring_context_1 = calloc(1, sizeof(struct
            amdgpu_ring_context));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert(ring_context_1);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_user_queue_create(device_handle,
            ring_context_1, ip_block-&gt;type);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     ring_context_2 = calloc(1, sizeof(struct
            amdgpu_ring_context));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert(ring_context_2);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_user_queue_create(device_handle,
            ring_context_2, ip_block-&gt;type);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* allocate bo1 for dma, bo2 for fence and bo3 for ib
            for render context 1 */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     ring_context_1-&gt;write_length = 1024;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     r = amdgpu_bo_alloc_and_map_sync(device_handle ,
            ring_context_1-&gt;write_length, 4096,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              AMDGPU_GEM_DOMAIN_GTT,
            AMDGPU_GEM_CREATE_CPU_GTT_USWC,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              AMDGPU_VM_MTYPE_UC,
            &amp;ring_context_1-&gt;bo,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              (void
            **)&amp;ring_context_1-&gt;bo_cpu,
            &amp;ring_context_1-&gt;bo_mc,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            &amp;ring_context_1-&gt;va_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            ring_context_1-&gt;timeline_syncobj_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              ++ring_context_1-&gt;point,
            true);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     memset((void *)ring_context_1-&gt;bo_cpu, 0,
            ring_context_1-&gt;write_length);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     r = amdgpu_bo_alloc_and_map_sync(device_handle, 4096,
            4096, AMDGPU_GEM_DOMAIN_GTT,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              &amp;ring_context_1-&gt;bo2,
            (void **)&amp;ring_context_1-&gt;bo2_cpu,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            &amp;ring_context_1-&gt;bo_mc2,
            &amp;ring_context_1-&gt;va_handle2,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            ring_context_1-&gt;timeline_syncobj_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              ++ring_context_1-&gt;point,
            true);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     memset((void *)ring_context_1-&gt;bo2_cpu, 0, 4096);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     r = amdgpu_bo_alloc_and_map_sync(device_handle, 8192,
            4096, AMDGPU_GEM_DOMAIN_GTT,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              &amp;ring_context_1-&gt;bo3,
            (void **)&amp;ring_context_1-&gt;bo3_cpu,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            &amp;ring_context_1-&gt;bo_mc3,
            &amp;ring_context_1-&gt;va_handle3,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            ring_context_1-&gt;timeline_syncobj_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              ++ring_context_1-&gt;point,
            true);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     memset((void *)ring_context_1-&gt;bo3_cpu, 0, 4096);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* allocate bo1 for dma, bo2 for fence and bo3 for ib
            for render context 2 */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     ring_context_2-&gt;write_length = 1024;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     r = amdgpu_bo_alloc_and_map_sync(device_handle ,
            ring_context_2-&gt;write_length, 4096,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              AMDGPU_GEM_DOMAIN_GTT,
            AMDGPU_GEM_CREATE_CPU_GTT_USWC,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              AMDGPU_VM_MTYPE_UC,
            &amp;ring_context_2-&gt;bo,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              (void
            **)&amp;ring_context_2-&gt;bo_cpu,
            &amp;ring_context_2-&gt;bo_mc,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            &amp;ring_context_2-&gt;va_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            ring_context_2-&gt;timeline_syncobj_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              ++ring_context_2-&gt;point,
            true);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     memset((void *)ring_context_2-&gt;bo_cpu, 0,
            ring_context_2-&gt;write_length);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     r = amdgpu_bo_alloc_and_map_sync(device_handle, 4096,
            4096, AMDGPU_GEM_DOMAIN_GTT,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              &amp;ring_context_2-&gt;bo2,
            (void **)&amp;ring_context_2-&gt;bo2_cpu,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            &amp;ring_context_2-&gt;bo_mc2,
            &amp;ring_context_2-&gt;va_handle2,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            ring_context_2-&gt;timeline_syncobj_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              ++ring_context_2-&gt;point,
            true);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     memset((void *)ring_context_2-&gt;bo2_cpu, 0, 4096);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     r = amdgpu_bo_alloc_and_map_sync(device_handle, 8192,
            4096, AMDGPU_GEM_DOMAIN_GTT,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              &amp;ring_context_2-&gt;bo3,
            (void **)&amp;ring_context_2-&gt;bo3_cpu,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            &amp;ring_context_2-&gt;bo_mc3,
            &amp;ring_context_2-&gt;va_handle3,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                             
            ring_context_2-&gt;timeline_syncobj_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              ++ring_context_2-&gt;point,
            true);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     memset((void *)ring_context_2-&gt;bo3_cpu, 0, 4096);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* wait for gtt mapping to complete */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     r = amdgpu_timeline_syncobj_wait(device_handle,
            ring_context_1-&gt;timeline_syncobj_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                      ���       ring_context_1-&gt;point);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     r = amdgpu_timeline_syncobj_wait(device_handle,
            ring_context_2-&gt;timeline_syncobj_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                              ring_context_2-&gt;point);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq(r, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* assign cmd buffer for ring context 1 */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;attach_buf(cmd_base_1, (void
            *)ring_context_1-&gt;bo3_cpu, 8192);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* create the ib for ring context 1 */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1,
            PACKET3(PACKET3_FENCE_WAIT_MULTI, 4 * 1));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1,
            FENCE_WAIT_MULTI_ENGINE(1) | FENCE_WAIT_MULTI_PREEMPTABLE(1)
            |</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                  &nbsp; &nbsp;FENCE_WAIT_MULTI_CACHE_POLICY(3) |
            FENCE_WAIT_MULTI_POLL_INTERVAL(4));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1,
            ring_context_1-&gt;bo_mc2);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1,
            ring_context_1-&gt;bo_mc2 &gt;&gt; 32);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1, 10); // random
            incorrect fence value</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1,
            PACKET3(PACKET3_WRITE_DATA, 3));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1, WRITE_DATA_DST_SEL(5)
            | WR_CONFIRM |</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                  &nbsp; &nbsp;WRITE_DATA_CACHE_POLICY(3));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1, 0xfffffffc &amp;
            ring_context_1-&gt;bo_mc);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1, (0xffffffff00000000
            &amp; ring_context_1-&gt;bo_mc) &gt;&gt; 32);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_1-&gt;emit(cmd_base_1, 0xdead0000);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     ring_context_1-&gt;pm4_dw = cmd_base_1-&gt;cdw;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_user_queue_submit(device_handle,
            ring_context_1, ip_block-&gt;type,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                        ring_context_1-&gt;bo_mc3, true);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* if fwm packet got skipped by firmware then
            0xdead000 will be written */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     usleep(1000 * 100);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq_u32(*ring_context_1-&gt;bo_cpu, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* assign cmd buffer for ring context 2 */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;attach_buf(cmd_base_2, (void
            *)ring_context_2-&gt;bo3_cpu, 8192);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* create the ib for ring context 2 */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2,
            PACKET3(PACKET3_FENCE_WAIT_MULTI, 4 * 1));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2,
            FENCE_WAIT_MULTI_ENGINE(1) | FENCE_WAIT_MULTI_PREEMPTABLE(1)
            |</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                  &nbsp; &nbsp;FENCE_WAIT_MULTI_CACHE_POLICY(3) |
            FENCE_WAIT_MULTI_POLL_INTERVAL(4));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2,
            ring_context_2-&gt;bo_mc2);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2,
            ring_context_2-&gt;bo_mc2 &gt;&gt; 32);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2, 10); // random
            incorrect fence value</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2,
            PACKET3(PACKET3_WRITE_DATA, 3));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2, WRITE_DATA_DST_SEL(5)
            | WR_CONFIRM |</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                  &nbsp; &nbsp;WRITE_DATA_CACHE_POLICY(3));</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2, 0xfffffffc &amp;
            ring_context_2-&gt;bo_mc);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2, (0xffffffff00000000
            &amp; ring_context_2-&gt;bo_mc) &gt;&gt; 32);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     cmd_base_2-&gt;emit(cmd_base_2, 0xdead0000);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     ring_context_2-&gt;pm4_dw = cmd_base_2-&gt;cdw;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_user_queue_submit(device_handle,
            ring_context_2, ip_block-&gt;type,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                        ring_context_2-&gt;bo_mc3, true);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* if fwm packet got skipped by firmware then
            0xdead000 will be written */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     usleep(1000 * 10);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq_u32(*ring_context_1-&gt;bo_cpu, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq_u32(*ring_context_2-&gt;bo_cpu, 0);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     /* set the correct fence value to finish executing the
            ib */</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     *ring_context_1-&gt;bo2_cpu = 10;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     *ring_context_2-&gt;bo2_cpu = 10;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     usleep(1000 * 10);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq_u32(*ring_context_1-&gt;bo_cpu,
            0xdead0000);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_assert_eq_u32(*ring_context_2-&gt;bo_cpu,
            0xdead0000);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_user_queue_destroy(device_handle,
            ring_context_1, ip_block-&gt;type);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_user_queue_destroy(device_handle,
            ring_context_2, ip_block-&gt;type);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_bo_unmap_and_free(ring_context_1-&gt;bo,
            ring_context_1-&gt;va_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                        ring_context_1-&gt;bo_mc,
            ring_context_1-&gt;write_length);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_bo_unmap_and_free(ring_context_1-&gt;bo2,
            ring_context_1-&gt;va_handle2,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                        ring_context_1-&gt;bo_mc2, 4096);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_bo_unmap_and_free(ring_context_1-&gt;bo3,
            ring_context_1-&gt;va_handle3,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                        ring_context_1-&gt;bo_mc3, 8192);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_bo_unmap_and_free(ring_context_2-&gt;bo,
            ring_context_2-&gt;va_handle,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                        ring_context_2-&gt;bo_mc,
            ring_context_2-&gt;write_length);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_bo_unmap_and_free(ring_context_2-&gt;bo2,
            ring_context_2-&gt;va_handle2,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                        ring_context_2-&gt;bo_mc2, 4096);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     amdgpu_bo_unmap_and_free(ring_context_2-&gt;bo3,
            ring_context_2-&gt;va_handle3,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                        ring_context_2-&gt;bo_mc3, 8192);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     free_cmd_base(cmd_base_1);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     free_cmd_base(cmd_base_2);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     free(ring_context_1);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     free(ring_context_2);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +}</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;igt_main</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;{</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     amdgpu_device_handle device;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            @@ -815,6 +985,14 @@ igt_main</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;                 amdgpu_sync_dependency_test(device, true);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;           }</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     }</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     igt_describe(&quot;Check-FWM-preempt-using-GFX-UMQ&quot;);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+     igt_subtest_with_dynamic(&quot;fwm-prempt-test-with-IP-GFX-UMQ&quot;) {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           if (userq_arr_cap[AMD_IP_GFX]) {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+                 igt_dynamic_f(&quot;fwm-preempt-test-with-gfx-umq&quot;)</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +                 amdgpu_fwm_preempt_test(device);</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +           }</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            +     }</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;#endif</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            &nbsp;     igt_fixture {</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            --&nbsp;</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            2.43.0</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------N6kVWGjOUlRbErCI6ScXQRaT--
