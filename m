Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B1AC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 10:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4907889ABE;
	Fri, 16 May 2025 10:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q1G1RfQy";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E92189ABE
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 10:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sarDun1/gvaZgRXrLUnEAoxB92I74cktvew1UGhdHrJUi98b7OBCiDeA1VApFFJ5QKnkglGoCoyZPl2LkSVqXRMp7OsMHQA45qWllMxKlhD+wX/CT7jvFpMiETamGnStpnAf5qNtF4A0j3niBqfRtH4B/DDu/XW5K7udrm07jUnlS5wVGzgj/vw3+wmk76ZmuSvoPG6KRHbBqjSGzP2ZcYsvWj55lFhddbuH7EhsDGzKHkypH0hRmUPgjhvC/COkli+npRv/mEankqBSfDIxdbO+/AQ5nhoeYyXomHnbaCJ9RpNp46xAW+HxR1ShY1FYBd+k5FWCvhT7yLUgLW5IwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORnNzOtPW/ydN8nvvy1VYIs8eS+mT1jaxnxFpV74W4E=;
 b=sm6wWlVv0h9LFDvol+J6yD5ZHNKM4X4oD5tRZDRm1wnXdvpjfzaC71Jly8C9Igu8yGl1yzrkqzjn5KL67eVQ/zDRtvRjGY1EOwucup6TMs2vNYZVwgaratPsnloU1VyqkAjQnTi+uxgkoZDNvLeYuiHOAZp82ZsXFzFzMySdrs4A/iWb/fu8v/WisFhpRLI87OfI1GS+fM6Z+4CS8eMRv7PkdLcH/aH/mFwwvy8W8ddV99cWUY5kdyz9nq56HpKVLenJwvdFIZ0h8NKslHHPfLwFuu+K1vopr6KM5HVfa2Vj+FEr/zYa2IKCUSedCS7J/HfQUGacuzZyOinnAUF2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORnNzOtPW/ydN8nvvy1VYIs8eS+mT1jaxnxFpV74W4E=;
 b=q1G1RfQyyn5gg1TTSMlhl/clNT8LjEGHZqhWRai+0jYqUIkLfeECUoi0XLTfVoV9GgiMNLud6mts+fiLApcHTW8QLYoUru3f/Ltr8czS3iL23Bc03+oSjWC0nfQTt7w09Yt5gXjCwIO+CurJzJUjxvA1Pm329zjy9DXDHunALZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SA5PPFAB8DFE4E8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8db) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 16 May
 2025 10:38:55 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 10:38:55 +0000
Content-Type: multipart/alternative;
 boundary="------------1fdqtVJQiqT3oZK9T0MKZeg1"
Message-ID: <1aeadca9-2060-4881-9d8d-7b20047aa7e0@amd.com>
Date: Fri, 16 May 2025 16:08:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu: userq skip waiting for signal
 fence
From: "Khatri, Sunil" <sukhatri@amd.com>
To: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <PH7PR12MB663304D0B79D9251B8660EA0FF90A@PH7PR12MB6633.namprd12.prod.outlook.com>
 <4628ecc6-9303-4c8a-9e30-0f504307ebfa@amd.com>
 <PH7PR12MB6633234BEAD5CA70DA8E35DEFF93A@PH7PR12MB6633.namprd12.prod.outlook.com>
 <3fe3dd07-7946-4c9c-88ce-bd6b30c4f452@amd.com>
Content-Language: en-US
Cc: jesse.zhang@amd.com
In-Reply-To: <3fe3dd07-7946-4c9c-88ce-bd6b30c4f452@amd.com>
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SA5PPFAB8DFE4E8:EE_
X-MS-Office365-Filtering-Correlation-Id: 81fd262b-1fa1-4a08-991b-08dd9465db6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGh3cytIN1NpS0hDSzVjWXBmRmZLYklqMklLYTFxc2plUkhQdTdUWVhJZnJQ?=
 =?utf-8?B?blA1d2oyYWNyb2R3ZXF2RldCL0hZUU1uNUlDcVRERWNvZG9QdWlVZHVUbEpM?=
 =?utf-8?B?bUdDNEk1cGhWOURSdjAvZitIRFJjaHhhd1lXTmZRTWpKdUtlVEtmNE5OOU5D?=
 =?utf-8?B?OWNTYmJPU2gxalJzQlRvMWVUcG5pV0hqWWcxWWFxRU5OamZzb0NLbU1zY0dm?=
 =?utf-8?B?L1h0SGswUjFDRDZKeXJycVh1TlIwL1J0U3JqekF5eUpIRS9GeVJldGxGNEMv?=
 =?utf-8?B?WU5rek1PajNXVFZGMGE0SGZUWGorTVcwREs5eWFGekpGUHlDY0w2T3U3MUJj?=
 =?utf-8?B?NkpvWjFRVkVacmVsREtla1dKZ2xLYVovUm1KdkpDS0tMWFJBRDJ4ZHhnTlJQ?=
 =?utf-8?B?eUlqQjRTNTNEL3F3aWFnR1dOZk5RYjFJK210em1lZW4yQUQ0LzJ4OG1NeS8y?=
 =?utf-8?B?QkF0U2h3bVVxb0l1MUdYYndaU01MZ0FFYm5DbC81RHNHYjRnQ0J2bjBWWnFs?=
 =?utf-8?B?U3F0ZGJzN0h2NEQrNEd5VFp0NTFQUWRFREZpSDMrOVJWclNHREF6TU5XSStP?=
 =?utf-8?B?clU4eUVSYVBFSHhBdTdrR3VneHp5R3FPeDJvNnplUzFMdXBodjVvM3J6YzdS?=
 =?utf-8?B?K3UrT2VyNHpGUGxVcGEyWFYzcE9LV2dpTFcrYm9icnVnQlVSb0RTRkQvWitR?=
 =?utf-8?B?cTVFZmdBV1YxWFVoUjBRdFZyYWhONjU2NjdjMk1BM0dMbzJEbzhsZjJRMUx0?=
 =?utf-8?B?VVh6cWZtaUFLYk95Q3AreW5VQVhpbHhVUlRDT0I2ckVlbVNQcVcxZDRGVUNU?=
 =?utf-8?B?dXVKeFp5NFdJa3ZPdGIyblNtU3o3Y1dvaUI2VWhJYXhSTFVlTW5HWWkwNzZC?=
 =?utf-8?B?cGVMRVdZRWFteTkxNUgyVGhJL3FxY1V5c0loQi80Mi9raDVlS09vcm0wKytL?=
 =?utf-8?B?Syt2MTBmWWVuMEZSUGFrZVdQV05LOTlray9pb1JsQXd4ZW13SHlXT2RWS0hC?=
 =?utf-8?B?cHdkdHlDTTUvdEdTaXh5VUFXUXdBVVA2NnlWRzJFUFU4TndrZjVvL0hNNS92?=
 =?utf-8?B?T0ZEa1VyU2hzNGU2MmkzSndQU0ErLzk4Zk9NMEtvM1lEMm9ORkFnTk9mVUdm?=
 =?utf-8?B?OGY3RVRKeEFnTDNYMEZjOXhSUGkyT2NCbGoxTFhudHhxQzVuSjJSblBWbEZj?=
 =?utf-8?B?Q29Qb2dSbW8yd3dkcHUrQXIvY1Jmd09XOTZZRDFDVlJKbExkQmNSL2lqWXB6?=
 =?utf-8?B?SEZjUy90N0lmaW1jQUZKelExK3VUTHRHNHZDNDBtQ2Z5T09EVzVmY2VmR215?=
 =?utf-8?B?cTVVRmJ6Z3hLUER5cHpta1luSDdReXhzTkxnb2R4cGdYZ0o2UU5BdWpGMjVl?=
 =?utf-8?B?ajgwNVdqbTd4TS9qc1VHb1ZMamEvdXQ4WUl4LzVZNEhQQmt1bE12QXhnRU5m?=
 =?utf-8?B?ZzdETG1kdEZ2SVg0czlDeUJFLy9YZkQ3NUx0Q3NtMko4QjlpaThmaE5lSi9o?=
 =?utf-8?B?NVMrSjBNb1I2dUdjTHNkTzRoMXI5RzlMTHQ2RFJ2UFJqbmFKQUxrZG96Zng2?=
 =?utf-8?B?M09FVG4wWDBvbjZYcENSbW1vWmxDUExubDlQbkJkQnQySm9lTUJvODZ1c0w1?=
 =?utf-8?B?ZHhJaUZRYlZzWXBMTEorVks5eHFZSDhsYUpVa3NqMXcwbjJFYi96MWNnNDdX?=
 =?utf-8?B?bHpTVmphbVFMaGRzSVhUb2VFVWVvb2hOekRxMGRxbnpENXNFZnFPVlZaU2FK?=
 =?utf-8?B?MGtJamJhVXJ3YXk1M0xxV1pBdzByMm9OSTVsRTZIMGVrVlJ4SnZMdEdZcHZR?=
 =?utf-8?B?SkNUTk5qNkV6NkorS05xdEJ2eDN5RGhKaHZ5RWh3V0ZrT21yK1hjRTJZVjdr?=
 =?utf-8?B?UVAxeENmb2hGcGgvNGQyUWRTQTdUR20yYWR3UldrdWFPeTlSNStPQVc1YzZV?=
 =?utf-8?Q?R62iutN13CU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmFNTGRJZkY5azhyYW5seFZHblhIaVhqWjZ0V1diUnF5eWJ2RHdoazZuZndh?=
 =?utf-8?B?U2Q2V2dPOEtNaks3Mzl6N2ExU3ZKSXM1a0dTMXRzYXhjUXlabzd2UTlSakRY?=
 =?utf-8?B?UWlHTXF0YmJlK1NKRUhoaG4yVTJtbHRTM0xEcDRlVll4aGxwSUZJL1BoWGNj?=
 =?utf-8?B?MnVEWGVpTTI3cVFTeFkzV25tN0xCTjFaa0lqRmhUd0hDRzZmRStOMHVlcFNk?=
 =?utf-8?B?OWRnaEVwUXJyY044cFZ2UmR4eVpJdWhLeEpZRlJjeTFkZDJ0WkRFNTJKVE5s?=
 =?utf-8?B?ZW9VR3kvOEYzZjR1TDQvVGRXdmZIV3ZkZTBkNmVZTHRWcS96bHVDVjRWTVcx?=
 =?utf-8?B?N3lXTkc0aTZQcDJrNS9EWlZOYmF1RWxpdnpEK0ZJMXFzK212ekxqVG5icGNU?=
 =?utf-8?B?TytxQStIN1pLcy9OQ1hzMjFZV3k5S05sVU83L0RnYkN6VjlxS0pDSHE0VWpR?=
 =?utf-8?B?a3pnWGRualdDSk1IKzdlOFpnMGdlOCt2NnByaXBydjBJQnRxNTFtdUJFWnlN?=
 =?utf-8?B?MTM1UWR5ZmZXK0YyaWR0T1h4TjZLM2RWdVdkZHkyNWNORzdxS25FS3lPYWNM?=
 =?utf-8?B?Q3VJWEdlZW91a0xoQ2w1Ymt1MHZ0aXVMcGRXWWlZQ3dvKzBncXFqUS9Wam9p?=
 =?utf-8?B?TEZWd0Z3eWRVczEvTEVVN3hQbjFpKzRRL055VEJ0MW9MT2g4MnpjbUlKWVEw?=
 =?utf-8?B?QU9kYVo4ODJ3a2VQbC9JbVQwV2s3dHE2STFkT3ZZQXl1QitjeE13QmZ2K3VN?=
 =?utf-8?B?UFJvZnJQRHhtbDY0WGxDRVdOODk2VjVQZ1hUdnNYZ21mTjVvaDlZeG4ydmZw?=
 =?utf-8?B?Yit2WTB3OE5NZFpLQkNjSTN3Zks2Ykt5NFNJb3RJMjNlR2F2a3N2REI0WDFY?=
 =?utf-8?B?eXRrWTZ1TThTZ1pkeVJjRzVaZHR3MkpJaVRJbWtIR2cveXowMXo3bityT3V6?=
 =?utf-8?B?OVc2Rnh0NnF2b1NrVlFCNW1OTllwSlpVcVNaU285dVh5dENvaTcrenJwVFRM?=
 =?utf-8?B?bXNvN3NRZmppVnMzWlAzUnRUbHJjT0ZTOGoyald2eGpId2RMYVhRTUtWaDQx?=
 =?utf-8?B?Wk5JODB0RTFidlZQV1d3b2ZZVzdMQ2lZemcyQVVYYVlvdm1zdFhOUi85cllo?=
 =?utf-8?B?REk5RjR5ODh3eUg0VEJHeSt5UDVWSk9OTEVvSzYxamVQS3pyUE41cVpOekVl?=
 =?utf-8?B?bG8rWmVrajNaWWNRVVZRWGdYN0tJWHhTV2tpOHBKTk9jRmlkR3FPVStCTVFu?=
 =?utf-8?B?T29zVTVYSXVEQnFYVG9yM3BDaW01ZFFkOVl5TzdLd0EwSDVCWXNXZklzMEJi?=
 =?utf-8?B?VG9ZdnhSL1VpSTNkM2xQaGljaTJIMmV1Zk1KbFBBNEpnNDg4d05vOW84UlZ1?=
 =?utf-8?B?aHordWd2c1QyRmRGKy9DanA3cVVqOUxEQ3FmWldiTWc2YkZWTmFFeENRdWFq?=
 =?utf-8?B?TnVRbzlkQW9yS0MrKzBQLzZIeUhSd0FWelNZSHZrcFlKcW80Q2g3di9IOTFT?=
 =?utf-8?B?U0ZvTm9Qb21Yd3NCT0dGUCtqTUR0YmdmYTFSamtiSWsrLzQxays5RHdIbHJJ?=
 =?utf-8?B?RGdCRUpCYjVYU3NXZ29HNU8zODgxT0ZHRFlvZkxoYndYRUZzNzdYVUtiMWZN?=
 =?utf-8?B?clFYMlRaMEk0VitzbzFEK2tRcGlzRzJIQ1pleUpqdFd0VCtwQ0JPWmRGdllT?=
 =?utf-8?B?dmpTZTczR2VFNVgyYmsvMW1lNFluak81TUdkL2pnZnlxQTlYTUM3Q3hiY3Ni?=
 =?utf-8?B?Y21SVXFGMzZhb2I5bGpCVXc2cW1JMnhqeC9JQWRxWUFrTm5TWm9WQXZDaUZD?=
 =?utf-8?B?dzVaNzMwZGNjOGhoUUNhTk95UzhLTE1sWWhCY1FxZ1RUMzJVcVBzeEV6cFFr?=
 =?utf-8?B?UFFBMFF4ZnZ1UXZjMXV3VEhQRGh3NE02WGg3UWU5NHdCWkh5MEpGZzZBMXRS?=
 =?utf-8?B?WHpHaGpSb3RrdDRzaGRWWlpkcG5SYVViaXZSUjFhNExJNk9KTEFiZ00vZE5i?=
 =?utf-8?B?RjlWd3BFODM0QmdlZndoTGwrUDBuQ0tJQm5paWNwSThwNEZISEJYUmVIcCtE?=
 =?utf-8?B?N3RTeFpmdVZsNlh4VEd1STFRV0VQVXlXT2J6YVlpNyt2bWNpK0JXRmRkaHFP?=
 =?utf-8?Q?SFOXoEbTM8olVWZw3wqYCBIOL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fd262b-1fa1-4a08-991b-08dd9465db6d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 10:38:55.4117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2r817oNhm1rzsQS58/VI1moniUj3P7HI2r2/OMq14JRbmkHq0RMsQRqvFCLqQFe65s7LcOF+fuE/u3tGDr/7hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFAB8DFE4E8
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

--------------1fdqtVJQiqT3oZK9T0MKZeg1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/16/2025 3:47 PM, Khatri, Sunil wrote:
>
>
> On 5/16/2025 3:33 PM, Mohan Marimuthu, Yogesh wrote:
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>>
>> Hi Sunil,
>>
>> I did not test with true as logically the code flow does not change 
>> if skip_signal is true.
>> The indentation is off because of the editor I had used. I will fix 
>> in the next patch update.
>
> If you are planning to use this in a new test case then we should 
> handle/declare the test as success on failure as this is a negative 
> test case. So this needs to be handled while writing a new test case.
>
Also here i am not sure what we are achieving with this test case. What 
is observed here till now is if we skip the amdgpu_cs_syncobj_wait 
function then test always fail because when we check the memory the 
values expected are not written in memory. cpu execution is faster that 
gpu writing in memory and we read the memory before gpu has written it 
and we declare the test as fail.

If this is a negative test case where expectation is failure but and 
assert will be triggered here and test will be failed eventually but for 
negative test the test eventually should be reported as pass. That part 
isnt handled here.


@Jesse

Have you validated with a different timeout value because when i wrote 
it at first place i observed that with some decent timeout values we get 
timeout hit before we get the signal due to fence signal and thats why 
we gave this big value to make sure the value is written as per 
expectations.


Regards
Sunil Khatri

>
> Regards
> Sunil Khatri
>
>>
>> Thank you,
>> Yogesh
>>
>> ------------------------------------------------------------------------
>> *From:* Khatri, Sunil <Sunil.Khatri@amd.com>
>> *Sent:* Friday, May 16, 2025 11:12 AM
>> *To:* Mohan Marimuthu, Yogesh <Yogesh.Mohanmarimuthu@amd.com>; 
>> igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
>> *Subject:* Re: [PATCH i-g-t 1/2] tests/amdgpu: userq skip waiting for 
>> signal fence
>>
>> @yogesh
>>
>> Functionally code looks good to me but i have a question,
>>
>> Have you validated the any test case with the skip flag set to true. 
>> Test should not fail with that as its a negative test.
>> How the igt test work here is that when you return from the 
>> amdgpu_user_queue_submit function the next function checks the value 
>> written in the memory and test might fail if the values dont match.
>>
>>
>> Also, Indentation seems little off to me.
>>
>>
>> On 5/15/2025 12:13 PM, Mohan Marimuthu, Yogesh wrote:
>>
>>     [Public]
>>
>>
>>     [Public]
>>
>>
>>     For negative test cases where the job will not complete need to
>>     skip signal fence. Pass a flag to amdgpu_user_queue_submit() to
>>     skip signal fence wait.
>>
>>     Signed-off-by: Yogesh Mohan Marimuthu
>>     <yogesh.mohanmarimuthu@amd.com>
>>     <mailto:yogesh.mohanmarimuthu@amd.com>
>>     ---
>>      lib/amdgpu/amd_command_submission.c |  2 +-
>>      lib/amdgpu/amd_compute.c            |  2 +-
>>      lib/amdgpu/amd_userq.c              | 36
>>     +++++++++++++++--------------
>>      lib/amdgpu/amd_userq.h              |  2 +-
>>      tests/amdgpu/amd_basic.c            |  4 ++--
>>      tests/amdgpu/amd_cs_nop.c           |  2 +-
>>      6 files changed, 25 insertions(+), 23 deletions(-)
>>
>>     diff --git a/lib/amdgpu/amd_command_submission.c
>>     b/lib/amdgpu/amd_command_submission.c
>>     index 80d03a498..74091da5a 100644
>>     --- a/lib/amdgpu/amd_command_submission.c
>>     +++ b/lib/amdgpu/amd_command_submission.c
>>     @@ -68,7 +68,7 @@ int
>>     amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned
>>     int ip_type
>>           memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw *
>>     sizeof(*ring_context->pm4));
>>           if (user_queue)
>>     -           amdgpu_user_queue_submit(device, ring_context,
>>     ip_type, ib_result_mc_address);
>>     +           amdgpu_user_queue_submit(device, ring_context,
>>     ip_type, ib_result_mc_address, false);
>>
>> Indentation here
>>
>>           else {
>>                 ring_context->ib_info.ib_mc_address =
>>     ib_result_mc_address;
>>                 ring_context->ib_info.size = ring_context->pm4_dw;
>>     diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
>>     index 95bfa53aa..008186049 100644
>>     --- a/lib/amdgpu/amd_compute.c
>>     +++ b/lib/amdgpu/amd_compute.c
>>     @@ -91,7 +91,7 @@ void
>>     amdgpu_command_submission_compute_nop(amdgpu_device_handle
>>     device, bool use
>>                 if (user_queue) {
>>                       amdgpu_user_queue_submit(device, ring_context,
>>     AMD_IP_COMPUTE,
>>     -                                    ib_result_mc_address);
>>     +                                    ib_result_mc_address, false);
>>                 } else {
>>                       memset(&ib_info, 0, sizeof(struct
>>     amdgpu_cs_ib_info));
>>                       ib_info.ib_mc_address = ib_result_mc_address;
>>     diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
>>     index 50d058609..727df8222 100644
>>     --- a/lib/amdgpu/amd_userq.c
>>     +++ b/lib/amdgpu/amd_userq.c
>>     @@ -127,7 +127,7 @@ int
>>     amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
>>      }
>>      void amdgpu_user_queue_submit(amdgpu_device_handle device,
>>     struct amdgpu_ring_context *ring_context,
>>     -                       unsigned int ip_type, uint64_t mc_address)
>>     +                       unsigned int ip_type, uint64_t
>>     mc_address, bool skip_signal)
>>
>> Indentation here too.
>>
>>      {
>>           int r;
>>           uint32_t control = ring_context->pm4_dw;
>>     @@ -166,22 +166,24 @@ void
>>     amdgpu_user_queue_submit(amdgpu_device_handle device, struct
>>     amdgpu_ring_co
>>           /* Update the door bell */
>>           ring_context->doorbell_cpu[DOORBELL_INDEX] =
>>     *ring_context->wptr_cpu;
>>     -     /* Add a fence packet for signal */
>>     -     syncarray[0] = ring_context->timeline_syncobj_handle;
>>     -     signal_data.queue_id = ring_context->queue_id;
>>     -     signal_data.syncobj_handles = (uintptr_t)syncarray;
>>     -     signal_data.num_syncobj_handles = 1;
>>     -     signal_data.bo_read_handles = 0;
>>     -     signal_data.bo_write_handles = 0;
>>     -     signal_data.num_bo_read_handles = 0;
>>     -     signal_data.num_bo_write_handles = 0;
>>     -
>>     -     r = amdgpu_userq_signal(device, &signal_data);
>>     -     igt_assert_eq(r, 0);
>>     +     if (!skip_signal) {
>>     +           /* Add a fence packet for signal */
>>     +           syncarray[0] = ring_context->timeline_syncobj_handle;
>>     +           signal_data.queue_id = ring_context->queue_id;
>>     +           signal_data.syncobj_handles = (uintptr_t)syncarray;
>>     +           signal_data.num_syncobj_handles = 1;
>>     +           signal_data.bo_read_handles = 0;
>>     +           signal_data.bo_write_handles = 0;
>>     +           signal_data.num_bo_read_handles = 0;
>>     +           signal_data.num_bo_write_handles = 0;
>>     +
>>     +           r = amdgpu_userq_signal(device, &signal_data);
>>     +           igt_assert_eq(r, 0);
>>     -     r = amdgpu_cs_syncobj_wait(device,
>>     &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
>>     -                        DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
>>     -     igt_assert_eq(r, 0);
>>     +           r = amdgpu_cs_syncobj_wait(device,
>>     &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
>>     +                                                                 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL,
>>     NULL);
>>
>> Indentation.
>>
>>     +           igt_assert_eq(r, 0);
>>     +     }
>>      }
>>      void amdgpu_user_queue_destroy(amdgpu_device_handle
>>     device_handle, struct amdgpu_ring_context *ctxt,
>>     @@ -456,7 +458,7 @@ int
>>     amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
>>      }
>>      void amdgpu_user_queue_submit(amdgpu_device_handle device,
>>     struct amdgpu_ring_context *ring_context,
>>     -     unsigned int ip_type, uint64_t mc_address)
>>     +     unsigned int ip_type, uint64_t mc_address, bool skip_signal)
>>      {
>>      }
>>     diff --git a/lib/amdgpu/amd_userq.h b/lib/amdgpu/amd_userq.h
>>     index b29e97ccf..dc39c1ca4 100644
>>     --- a/lib/amdgpu/amd_userq.h
>>     +++ b/lib/amdgpu/amd_userq.h
>>     @@ -50,6 +50,6 @@ void
>>     amdgpu_user_queue_destroy(amdgpu_device_handle device_handle,
>>     struct amdgpu
>>                              unsigned int ip_type);
>>      void amdgpu_user_queue_submit(amdgpu_device_handle device,
>>     struct amdgpu_ring_context *ring_context,
>>     -                       unsigned int ip_type, uint64_t mc_address);
>>     +                       unsigned int ip_type, uint64_t
>>     mc_address, bool skip_signal);
>>      #endif
>>     diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
>>     index 97a08a9a3..914d27909 100644
>>     --- a/tests/amdgpu/amd_basic.c
>>     +++ b/tests/amdgpu/amd_basic.c
>>     @@ -607,7 +607,7 @@
>>     amdgpu_sync_dependency_test(amdgpu_device_handle device_handle,
>>     bool user_queue)
>>           if (user_queue) {
>>                 ring_context->pm4_dw = ib_info.size;
>>                 amdgpu_user_queue_submit(device_handle, ring_context,
>>     ip_block->type,
>>     -                              ib_result_mc_address);
>>     +                              ib_result_mc_address, false);
>>           } else {
>>                 r = amdgpu_cs_submit(context_handle[1], 0,
>>     &ibs_request, 1);
>>           }
>>     @@ -647,7 +647,7 @@
>>     amdgpu_sync_dependency_test(amdgpu_device_handle device_handle,
>>     bool user_queue)
>>           if (user_queue) {
>>                 ring_context->pm4_dw = ib_info.size;
>>                 amdgpu_user_queue_submit(device_handle, ring_context,
>>     ip_block->type,
>>     -                             ib_info.ib_mc_address);
>>     +                              ib_info.ib_mc_address, false);
>>           } else {
>>                 r = amdgpu_cs_submit(context_handle[0], 0,
>>     &ibs_request, 1);
>>                 igt_assert_eq(r, 0);
>>     diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
>>     index 268bc9201..658c8d050 100644
>>     --- a/tests/amdgpu/amd_cs_nop.c
>>     +++ b/tests/amdgpu/amd_cs_nop.c
>>     @@ -108,7 +108,7 @@ static void nop_cs(amdgpu_device_handle device,
>>                       if (user_queue) {
>>                             ring_context->pm4_dw = ib_info.size;
>>                             amdgpu_user_queue_submit(device,
>>     ring_context, ip_type,
>>     -                                          ib_info.ib_mc_address);
>>     +                                          ib_info.ib_mc_address,
>>     false);
>>
>> Not sure if its the mail editor or what i see its shifted by one. But 
>> make sure indentation is correct and you run checkpatch.pl.
>>
>>                             igt_assert_eq(r, 0);
>>                       } else {
>>                             r = amdgpu_cs_submit(context, 0,
>>     &ibs_request, 1);
>>     -- 
>>     2.43.0
>>
>>
--------------1fdqtVJQiqT3oZK9T0MKZeg1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/16/2025 3:47 PM, Khatri, Sunil
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3fe3dd07-7946-4c9c-88ce-bd6b30c4f452@amd.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 5/16/2025 3:33 PM, Mohan
        Marimuthu, Yogesh wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:PH7PR12MB6633234BEAD5CA70DA8E35DEFF93A@PH7PR12MB6633.namprd12.prod.outlook.com">
        <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
        <p style="font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;font-style:normal;font-weight:normal;text-decoration:none;" align="Left"> [AMD Official Use Only - AMD Internal
          Distribution Only]<br>
        </p>
        <br>
        <div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            Hi Sunil,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            I did not test with true as logically the code flow does not
            change if skip_signal is true.</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            The indentation is off because of the editor I had used. I
            will fix in the next patch update.</div>
        </div>
      </blockquote>
      <p>If you are planning to use this in a new test case then we
        should handle/declare the test as success on failure as this is
        a negative test case. So this needs to be handled while writing
        a new test case.</p>
    </blockquote>
    <p>Also here i am not sure what we are achieving with this test
      case. What is observed here till now is if we skip the
      amdgpu_cs_syncobj_wait function then test always fail because when
      we check the memory the values expected are not written in memory.
      cpu execution is faster that gpu writing in memory and we read the
      memory before gpu has written it and we declare the test as fail.<br>
      <br>
      If this is a negative test case where expectation is failure but
      and assert will be triggered here and test will be failed
      eventually but for negative test the test eventually should be
      reported as pass. That part isnt handled here.<br>
    </p>
    <p><br>
    </p>
    <p>@Jesse</p>
    <p>Have you validated with a different timeout value because when i
      wrote it at first place i observed that with some decent timeout
      values we get timeout hit before we get the signal due to fence
      signal and thats why we gave this big value to make sure the value
      is written as per expectations.</p>
    <p><br>
    </p>
    <p>Regards<br>
      Sunil Khatri<br>
    </p>
    <blockquote type="cite" cite="mid:3fe3dd07-7946-4c9c-88ce-bd6b30c4f452@amd.com">
      <p><br>
      </p>
      <p>Regards<br>
        Sunil Khatri <br>
      </p>
      <blockquote type="cite" cite="mid:PH7PR12MB6633234BEAD5CA70DA8E35DEFF93A@PH7PR12MB6633.namprd12.prod.outlook.com">
        <div>
          <div><br>
          </div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            Thank you,</div>
          <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            Yogesh</div>
          <div style="font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
          <hr style="display: inline-block; width: 98%;">
          <div style="font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <b>From:</b>&nbsp;Khatri, Sunil <a class="moz-txt-link-rfc2396E" href="mailto:Sunil.Khatri@amd.com" moz-do-not-send="true">&lt;Sunil.Khatri@amd.com&gt;</a><br>
            <b>Sent:</b>&nbsp;Friday, May 16, 2025 11:12 AM<br>
            <b>To:</b>&nbsp;Mohan Marimuthu, Yogesh <a class="moz-txt-link-rfc2396E" href="mailto:Yogesh.Mohanmarimuthu@amd.com" moz-do-not-send="true">&lt;Yogesh.Mohanmarimuthu@amd.com&gt;</a>;
            <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:igt-dev@lists.freedesktop.org" moz-do-not-send="true">igt-dev@lists.freedesktop.org</a> <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev@lists.freedesktop.org" moz-do-not-send="true">&lt;igt-dev@lists.freedesktop.org&gt;</a><br>
            <b>Subject:</b>&nbsp;Re: [PATCH i-g-t 1/2] tests/amdgpu: userq
            skip waiting for signal fence </div>
          <div style="font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
            <br>
          </div>
          <div style="background-color: white;">
            <p>@yogesh<br>
              <br>
              Functionally code looks good to me but i have a question,<br>
            </p>
            <p>Have you validated the any test case with the skip flag
              set to true. Test should not fail with that as its a
              negative test.<br>
              How the igt test work here is that when you return from
              the amdgpu_user_queue_submit function the next function
              checks the value written in the memory and test might fail
              if the values dont match.<br>
            </p>
            <p><br>
            </p>
            <p>Also, Indentation seems little off to me.</p>
            <p><br>
            </p>
            <div>On 5/15/2025 12:13 PM, Mohan Marimuthu, Yogesh wrote:<br>
            </div>
            <blockquote>
              <p align="left" style="margin: 5pt; font-family: Calibri; font-size: 10pt; color: green;">
                [Public]<br>
              </p>
              <div><br>
              </div>
              <p align="left" style="margin: 5pt; font-family: Calibri; font-size: 10pt; color: green;">
                [Public]<br>
              </p>
              <div><br>
              </div>
              <div><span style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">For
                  negative test cases where the job will not complete
                  need to</span> </div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                skip signal fence. Pass a flag to
                amdgpu_user_queue_submit() to</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                skip signal fence wait.</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                <br>
              </div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                Signed-off-by: Yogesh Mohan Marimuthu <a href="mailto:yogesh.mohanmarimuthu@amd.com" id="OWAb0ecdee4-a6f2-5efd-4c07-fa3f32380eff" class="OWAAutoLink" moz-do-not-send="true">
                  &lt;yogesh.mohanmarimuthu@amd.com&gt;</a></div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                ---</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;lib/amdgpu/amd_command_submission.c | &nbsp;2 +-</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;lib/amdgpu/amd_compute.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;2 +-</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;lib/amdgpu/amd_userq.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 36
                +++++++++++++++--------------</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;lib/amdgpu/amd_userq.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;2 +-</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;tests/amdgpu/amd_basic.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;4 ++--</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;tests/amdgpu/amd_cs_nop.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 +-</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;6 files changed, 25 insertions(+), 23 deletions(-)</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                <br>
              </div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                diff --git a/lib/amdgpu/amd_command_submission.c
                b/lib/amdgpu/amd_command_submission.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                index 80d03a498..74091da5a 100644</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                --- a/lib/amdgpu/amd_command_submission.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +++ b/lib/amdgpu/amd_command_submission.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                @@ -68,7 +68,7 @@ int
                amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
                unsigned int ip_type</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     memcpy(ring_ptr, ring_context-&gt;pm4,
                ring_context-&gt;pm4_dw *
                sizeof(*ring_context-&gt;pm4));</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     if (user_queue)</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -           amdgpu_user_queue_submit(device,
                ring_context, ip_type, ib_result_mc_address);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           amdgpu_user_queue_submit(device,
                ring_context, ip_type, ib_result_mc_address, false);</div>
            </blockquote>
            <div>Indentation here<br>
            </div>
            <blockquote>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     else {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           ring_context-&gt;ib_info.ib_mc_address =
                ib_result_mc_address;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           ring_context-&gt;ib_info.size =
                ring_context-&gt;pm4_dw;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                diff --git a/lib/amdgpu/amd_compute.c
                b/lib/amdgpu/amd_compute.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                index 95bfa53aa..008186049 100644</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                --- a/lib/amdgpu/amd_compute.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +++ b/lib/amdgpu/amd_compute.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                @@ -91,7 +91,7 @@ void
                amdgpu_command_submission_compute_nop(amdgpu_device_handle
                device, bool use</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           if (user_queue) {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                 amdgpu_user_queue_submit(device,
                ring_context, AMD_IP_COMPUTE,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -                                   
                ib_result_mc_address);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +                                   
                ib_result_mc_address, false);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           } else {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                 memset(&amp;ib_info, 0, sizeof(struct
                amdgpu_cs_ib_info));</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                 ib_info.ib_mc_address =
                ib_result_mc_address;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                diff --git a/lib/amdgpu/amd_userq.c
                b/lib/amdgpu/amd_userq.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                index 50d058609..727df8222 100644</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                --- a/lib/amdgpu/amd_userq.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +++ b/lib/amdgpu/amd_userq.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                @@ -127,7 +127,7 @@ int
                amdgpu_timeline_syncobj_wait(amdgpu_device_handle
                device_handle,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;}</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;void amdgpu_user_queue_submit(amdgpu_device_handle
                device, struct amdgpu_ring_context *ring_context,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
                mc_address)</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
                mc_address, bool skip_signal)</div>
            </blockquote>
            <div>Indentation here too.<br>
            </div>
            <blockquote>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;{</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     int r;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     uint32_t control = ring_context-&gt;pm4_dw;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                @@ -166,22 +166,24 @@ void
                amdgpu_user_queue_submit(amdgpu_device_handle device,
                struct amdgpu_ring_co</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     /* Update the door bell */</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     ring_context-&gt;doorbell_cpu[DOORBELL_INDEX] =
                *ring_context-&gt;wptr_cpu;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     /* Add a fence packet for signal */</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     syncarray[0] =
                ring_context-&gt;timeline_syncobj_handle;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     signal_data.queue_id = ring_context-&gt;queue_id;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     signal_data.syncobj_handles =
                (uintptr_t)syncarray;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     signal_data.num_syncobj_handles = 1;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     signal_data.bo_read_handles = 0;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     signal_data.bo_write_handles = 0;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     signal_data.num_bo_read_handles = 0;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     signal_data.num_bo_write_handles = 0;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     r = amdgpu_userq_signal(device, &amp;signal_data);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     igt_assert_eq(r, 0);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +     if (!skip_signal) {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           /* Add a fence packet for signal */</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           syncarray[0] =
                ring_context-&gt;timeline_syncobj_handle;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           signal_data.queue_id =
                ring_context-&gt;queue_id;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           signal_data.syncobj_handles =
                (uintptr_t)syncarray;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           signal_data.num_syncobj_handles = 1;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           signal_data.bo_read_handles = 0;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           signal_data.bo_write_handles = 0;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           signal_data.num_bo_read_handles = 0;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           signal_data.num_bo_write_handles = 0;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           r = amdgpu_userq_signal(device,
                &amp;signal_data);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           igt_assert_eq(r, 0);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     r = amdgpu_cs_syncobj_wait(device,
                &amp;ring_context-&gt;timeline_syncobj_handle, 1,
                INT64_MAX,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -                        &nbsp;
                DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     igt_assert_eq(r, 0);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           r = amdgpu_cs_syncobj_wait(device,
                &amp;ring_context-&gt;timeline_syncobj_handle, 1,
                INT64_MAX,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
+                                                                 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL,
                NULL);</div>
            </blockquote>
            <div>Indentation.<br>
            </div>
            <blockquote>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +           igt_assert_eq(r, 0);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +     }</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;}</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;void amdgpu_user_queue_destroy(amdgpu_device_handle
                device_handle, struct amdgpu_ring_context *ctxt,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                @@ -456,7 +458,7 @@ int
                amdgpu_timeline_syncobj_wait(amdgpu_device_handle
                device_handle,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;}</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;void amdgpu_user_queue_submit(amdgpu_device_handle
                device, struct amdgpu_ring_context *ring_context,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -     unsigned int ip_type, uint64_t mc_address)</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +     unsigned int ip_type, uint64_t mc_address, bool
                skip_signal)</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;{</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;}</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                diff --git a/lib/amdgpu/amd_userq.h
                b/lib/amdgpu/amd_userq.h</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                index b29e97ccf..dc39c1ca4 100644</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                --- a/lib/amdgpu/amd_userq.h</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +++ b/lib/amdgpu/amd_userq.h</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                @@ -50,6 +50,6 @@ void
                amdgpu_user_queue_destroy(amdgpu_device_handle
                device_handle, struct amdgpu</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                  &nbsp; &nbsp; &nbsp; unsigned int ip_type);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;void amdgpu_user_queue_submit(amdgpu_device_handle
                device, struct amdgpu_ring_context *ring_context,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
                mc_address);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +                  &nbsp; &nbsp; &nbsp;unsigned int ip_type, uint64_t
                mc_address, bool skip_signal);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;#endif</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                diff --git a/tests/amdgpu/amd_basic.c
                b/tests/amdgpu/amd_basic.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                index 97a08a9a3..914d27909 100644</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                --- a/tests/amdgpu/amd_basic.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +++ b/tests/amdgpu/amd_basic.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                @@ -607,7 +607,7 @@
                amdgpu_sync_dependency_test(amdgpu_device_handle
                device_handle, bool user_queue)</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     if (user_queue) {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           ring_context-&gt;pm4_dw = ib_info.size;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           amdgpu_user_queue_submit(device_handle,
                ring_context, ip_block-&gt;type,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -                              ib_result_mc_address);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +                              ib_result_mc_address,
                false);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     } else {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           r = amdgpu_cs_submit(context_handle[1], 0,
                &amp;ibs_request, 1);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     }</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                @@ -647,7 +647,7 @@
                amdgpu_sync_dependency_test(amdgpu_device_handle
                device_handle, bool user_queue)</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     if (user_queue) {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           ring_context-&gt;pm4_dw = ib_info.size;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           amdgpu_user_queue_submit(device_handle,
                ring_context, ip_block-&gt;type,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -                             ib_info.ib_mc_address);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +                              ib_info.ib_mc_address,
                false);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;     } else {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           r = amdgpu_cs_submit(context_handle[0], 0,
                &amp;ibs_request, 1);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;           igt_assert_eq(r, 0);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                diff --git a/tests/amdgpu/amd_cs_nop.c
                b/tests/amdgpu/amd_cs_nop.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                index 268bc9201..658c8d050 100644</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                --- a/tests/amdgpu/amd_cs_nop.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +++ b/tests/amdgpu/amd_cs_nop.c</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                @@ -108,7 +108,7 @@ static void
                nop_cs(amdgpu_device_handle device,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                 if (user_queue) {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                       ring_context-&gt;pm4_dw =
                ib_info.size;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                       amdgpu_user_queue_submit(device,
                ring_context, ip_type,</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                -                                         
                ib_info.ib_mc_address);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                +                                         
                ib_info.ib_mc_address, false);</div>
            </blockquote>
            <div>Not sure if its the mail editor or what i see its
              shifted by one. But make sure indentation is correct and
              you run checkpatch.pl.<br>
            </div>
            <blockquote>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                       igt_assert_eq(r, 0);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                 } else {</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                &nbsp;                       r = amdgpu_cs_submit(context, 0,
                &amp;ibs_request, 1);</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                --&nbsp;</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                2.43.0</div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                <br>
              </div>
              <div style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: black;">
                <br>
              </div>
            </blockquote>
          </div>
        </div>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------1fdqtVJQiqT3oZK9T0MKZeg1--
