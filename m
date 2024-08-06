Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF60FC52D70
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 18:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA28610E3E0;
	Tue,  6 Aug 2024 18:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="borKsO/U";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF6D10E0FB
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 18:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrMhPXyQY4q/LqIYXP2Sn9Tu1HWJKLMcRz3sqhWIOJObVLKSjsrup0yXf5IoaOFtengLfx3ENxV4/3IoIbZtBB5qegWMe5gnGNvuF8mA/slA0EtU3doi+ah8qqs7dJd3GWKT3ep26xoJ0RwvHAv4MSSByt9AZi6FXVP/7fnWuSC1GJMpPuoUq6YLseLgjTNaxCI4MH6IkhTKiiXf4tfObztmopJYbJJa8JZ8XGcpN252RfXoT+ugU6oy3oJZw6/wwnGNpoPH1eNhmmQO8cGjg7RyAg5STjL3S6c8vjdm3MpiUWRLPSZA9Z5shgRGkV6TQY4csmRHJCLCSxy9qXljIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEViQzv3sA6agO0P4SwtpGlELeBTcEbPRavGt1wXE5U=;
 b=rjGftmiJ/ffJgOKY1mjM8u1IVTwUFHWH6++rGEF7jFeFxxxeJC0mUIchlAWwILJLrbn+Yf7IM8C8eNSqBTw0hGJuuy0c9vWTcu5d4+jZVbNnPDf6Ovg7YERc9XmtluO9cx0ZooOZvL/8ItUjnKmPSuOjZNOLEjrVY0/SkGOGxTBtYnZDXBWm5swTYmT31vf93n/dILCaJfxQJz93aiMI6earCsDiicBg3rZVnf2hGYfzNQCQChREbHYvtTcFQkv7yaBFRjEVMsR2Lz4OAYKbkJu6dA6ZSKJV5xFtQVrfdeYejNdepYTFKXUI7u6VOGAkbB9n+lhvCCL5Ka80Fk2SUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEViQzv3sA6agO0P4SwtpGlELeBTcEbPRavGt1wXE5U=;
 b=borKsO/UnXyNqeK0OcUBuUfK6ljIaeqqNMzffovLE+CKU3fRFOrWLIuX2acMsZwB8bq+YQAhpMb1VVJEyuA4vNXdmBUQNWYunxaHyTlQ9x51RCMKqoTjL1/ty1PnfE4MCYZ3H6NZAyXY4k9wCGnUZCmtqGf0hIrJBQd97ABF4W4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 18:09:26 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%3]) with mapi id 15.20.7849.008; Tue, 6 Aug 2024
 18:09:26 +0000
Message-ID: <d53ee49a-fe6d-48e7-aaa7-6d7dd8f82151@amd.com>
Date: Tue, 6 Aug 2024 14:09:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4] tests/amdgpu/amd_replay: Add amd_replay IGT test
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, alex.hung@amd.com, hamza.mahfooz@amd.com
References: <20240730100007.2243-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240730100007.2243-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0326.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::14) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 399b5717-8e9a-4d0f-11ea-08dcb642e81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1d3VGt0SHA5Z3I2S0pnTnh4T1ZhYThaa1NkcGJFeXpWK0J5VGNnUStIVTdZ?=
 =?utf-8?B?ZmN1Y3F4a20xUTJmRHo4SHVLZFpVcVVYbEcwOHhpUkZUeWZDM0pWN3RuRmlG?=
 =?utf-8?B?V2oyYlNTUDNvS1NXcE9PK1prTFJTdy95OUlhbEIvSldnMjcycFJSWEE1dFBv?=
 =?utf-8?B?R2tqQ2dQbUgrUWhFRythQ0NGUC9CamhYVkxsQVhEbDBCanc4VERLd2NxK08x?=
 =?utf-8?B?RmxLTXJhbzhqTTBZbTFsbUM2ZEs3S2piZ01YYnNtZ3ZoYkhMZnB2VjJsaXZC?=
 =?utf-8?B?OXF0TWFCYzZ5R1MrN0lDU0JRcFdWSVl2VG5TYlE2amErQk9pYnNRZ3E5Uzcx?=
 =?utf-8?B?VmNhMW1rYnhxS2hLQzFidFNGR0Q5dGpsYy82azlIMkZqMUFXRVlWczJmeDU0?=
 =?utf-8?B?dkhEZ3FPVERtQitxbXUyRkdjSnA2NXJzR1VNR2xUZ0d4OThqbmxHVEsya0RS?=
 =?utf-8?B?aGExdjNuTW4yY2pTd1Jldy9meG4vUkt2MDBUMFZ0ZEVIT2hvNmdhblJCTGxl?=
 =?utf-8?B?aWVYQkdFVXcrS1ovSFFaSFMwSU5SR1dFSy9QYlRFeGZHdW92RXA1dVNocTRP?=
 =?utf-8?B?alRIUTBocmJlOVdNQnBESWFabVdCaWZqVjQ5d2R5N0NoWUdEQkZiRVJQSlZr?=
 =?utf-8?B?V1BXSGhXYUhhMXZFcTlsTmRRUWFpUkFiUCtoOHZKZUc2QmdTYUV6OEFRSXVG?=
 =?utf-8?B?S1JDK1R1UXJaT1JXNVdkZm9QK0NSalFuZzNOZ2lia2s0TWdrVzg1TUZreE4z?=
 =?utf-8?B?b2RSZkNQTis5MGp6Skp6REQxVm5zT1NxMS9mOGoyRGNscEtzamw2dG9KZFFr?=
 =?utf-8?B?WklIMytBME95aHRCcjFNdUJ3SnlZMVNPSTZIUGJYZEVHK3NYdWZYRE4vdXJq?=
 =?utf-8?B?UEg1ci9HcUhmck80QjFyeDNFalhkUXh0eUV3b1hOVVpPdG5Rc0hmditEZ0dy?=
 =?utf-8?B?UUZYNWdlZVF2YTJpYllmTUpRK28yY1FxbCsyZXZiajUwMmZGaUF6a0krRnl0?=
 =?utf-8?B?SVJPWFhoTG92Snc4cWZmZGlNcjk2WFhSVmlVSUk1YWoyRHh2WlpwK0hjbkEz?=
 =?utf-8?B?OXZVM1FMRnJld0RNbTg2YzJFWFl5MnpEeVM2cC95WFVJaEszODh0d2laWGVY?=
 =?utf-8?B?b2JaVXlXam0zMWJUOVhiMmkwb3FUTkxOOHZnOWFWazhJK09aamY2amNMZ2tN?=
 =?utf-8?B?VXdiQVJWWWR1dk5Ta2RlaFBnNzNvWS9yU2FrZXF3ZWRmWGV4dWxnb0VzRktC?=
 =?utf-8?B?MU02bFlENm9pMEVHNE94T25iV2RhWlBBYjNjT0xjaG4vcXZKc1I2bWt6SUlx?=
 =?utf-8?B?M2IrR3VnM29pSTZVVUtIOTVvZ2ZLOVV6RGhKMjFlU2dLZFVKS3RDbnhWY2Fu?=
 =?utf-8?B?by9vZnJaNEdyVThicnN5VG44ZVB0RjlLZGJrcVUwRm9UL1dacjBzREtSRWpj?=
 =?utf-8?B?eVBrWi9mK3FndmVwbmVGdVZ6SnRBWStsN01zZ202Uit2ZEVxTmM5YVUxNGdV?=
 =?utf-8?B?dTdwRU5aRTlEdXkreElDSkxCQnlmUnhZbkV0T2JhSlVTMFNBaC9oZEZyeE55?=
 =?utf-8?B?KzlYbjZUVmw1RW9hd0JXTkVReW1EM2QxYmhVYkZFWTQxNEJ0VG51RXVWc0kr?=
 =?utf-8?B?RXJZNXh2M1paN05kRE9XYXRrVWNySFFWdHNOZEV0TlRRS0pyQXh0emF1VTBP?=
 =?utf-8?B?MklPZFZDeXdzelMyc3dmZmJmNi8yL3FKYm5jV2U5UEhaVWc0bHdCZjhNRnoz?=
 =?utf-8?B?cUNxM092UWRTY3d5UG1zT1hBbmRzWHJJMUdnRVBEazhmNVphTUpJbFdhSGZ0?=
 =?utf-8?B?a2twTVlncDljbnY5bjF3UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEo3b3RaNFZXd2FFbEN2NnBxTEdvOGFucEE1L1hXaW9Hdm5hcGNkcERmd2pE?=
 =?utf-8?B?bGF5R084bkhhRVlZSTArZDZYQVRpRTNXMDZLZmw4NS9KS2NWQStHZFRVOXln?=
 =?utf-8?B?amhCQkNybTJMNXNqYVhHNVNFUGpqVGNDZ2JIc0pPYnlHbGRZZ0d0VTNuNnRv?=
 =?utf-8?B?OENOZEMydW8wOHZabUg5WU1UQzFJNDJUY0JTSTlOM0Rsc284M29qTmJZQkYw?=
 =?utf-8?B?MTNTUFRmZ1phc1c1S2ZOY2dhZXMvMTU1VTBpK1JSVG9mNnBYMUZGYmtxdVBC?=
 =?utf-8?B?UVJRT3ZlZnJaMXJOVEJmbXg1WlMzSlZjczdOb002dUdYaThOdE5tdWowWjFx?=
 =?utf-8?B?VXJOdWYycHQ0OWRJRy9LandqNlM2S0RtbitaQW03QURSa2xHVGNNMW1HSExF?=
 =?utf-8?B?REJ5TzlUdDkxU1BFRE14ajhXR3piM04yNmtuRmk4YjhTTW9aT3J0a3VnR2RT?=
 =?utf-8?B?MEt2VjhBT3Y0STZDTnIyYzUzQi9ZRGFQVGtTaDhONjdHbmlEUmJxbDFhMldz?=
 =?utf-8?B?YVlYaEJpUEJvS1NFY0JEWXV2VGtXYk1MbTNaZ1RPenZnSlNIQVpCMDNRZkhl?=
 =?utf-8?B?MXI3dGNXMkEyU1JxV1NPd2IvZnNGY3BsTTBPVUR6UjYyT0VOeXhZalZjNDlP?=
 =?utf-8?B?K280UVg5cm5sQW13QmtQTVdqYWhlRVhEbkxQYnVQcm9vbjYwZmxTS2lXL3Yz?=
 =?utf-8?B?RU56bjhaVFYrOVo0b0JPVXZCWkZHQnhJQ3F5M0M2SGRmMlFHSEVxRjJGcFVG?=
 =?utf-8?B?SHhYOUE3VWs3OGRlRnE1MjFGWlJ1dFNmKzB1c0dmYXlwVjhndkVKRVp6QW8z?=
 =?utf-8?B?VWw2S2NKdmF5QVZ3U3JFb3huR2RWZmRNaFlRaXBjQ1pEUUJFTzJ3REhDa1pi?=
 =?utf-8?B?bFlDMEJaUy9tMnU2ZGZ3N3JKS1pVNExJU0RJaVpOWW9kc3BtY2lUSTRIMVZl?=
 =?utf-8?B?Zm9MRFBURXBaRTRlbExBQTVodXVadk5UbXF5cjFuekpMMEllN2Q0YUVlbFRZ?=
 =?utf-8?B?bnJqZllBSmxxV2RObEtoclpBTk5Ic1E1M3NZN00raWxJQ09TZWNMdGswM2tZ?=
 =?utf-8?B?SUZrblpPOXhnZnJ3Y1UxWWYwNTNTVStvd2E0ejVOL3pjWDJnL3dHNUdmb0My?=
 =?utf-8?B?TzlJSFRtaUhMUjJYMC9Xd0RiNkkxVEtWVWZGa09iN1RsR29zUWg3cHQ5ZHFB?=
 =?utf-8?B?RHhUakZldkxRdjdPc2NkSXYveUkwMXFvUnQ4V0hsN2lQMlBWSThmcGgxMUJx?=
 =?utf-8?B?dGNKRXd1WkZGYWM4dDR5QXFNSWZCbHp1WlNnNGc2QjlwZDVzQTZnTS9zNW5l?=
 =?utf-8?B?eDBDNk5DbWJwbUlKQ2R6RFRneVZvNWlpc2VYMXZnNTM4eDQ4dWNLV1E2MGNx?=
 =?utf-8?B?YzBzQmNYM0UvbFN1R3lkWjBSTGZGUE5URDE1Tm0yN0tpaDJLb2tmUk1sNkk2?=
 =?utf-8?B?Z0Vsa2NhUXlhQ1hwWVpYcU5MdE5JcDBhNExrV1g2ZDdNdFdrTU5ubHZ4VHl5?=
 =?utf-8?B?T0FWT3JZZTlZUnlOTHQ4dVNlSGRWZlVtWDRvQVhvdUIxSzBtYU1UTDZwWXhr?=
 =?utf-8?B?MWVnZHFHSmQ2RkMwT1FCYVhtM1ZrTWZKcHIxbTgzSThXZWt1ZXhoUUFzZmNw?=
 =?utf-8?B?UkRGRzhOTXE0alVSamtSdTZLZUNnV0c1WDI5SXgzcUJJZmdabkJrMjFiQ0ww?=
 =?utf-8?B?Y2w3cGNSM3lFVnhnT1hXNWZPaSszN0xxOHNuTk0zM05oWjZ4MlJIZFNLc3Ji?=
 =?utf-8?B?L3kzRGQza3p3ZG9iREZlUjh6ekZuVWgrQXFhNUhsbWE3VXdzWmpUdDdKT20r?=
 =?utf-8?B?dStPS2poOGw2Smxob1RmbERWOS9IOUo1WnFVa0NhcFJEZVdxNHhoZ2pNOXU1?=
 =?utf-8?B?NjRaakFNVXVvRFBpSkJLYnlmbXBxVlNhR1Z5dFFVZmJHMjl5eTU5WkZ0b01h?=
 =?utf-8?B?dm5BTDhMTmtTak1VekxsZVRCRWhsVVRXU3dzZlBGbjFHbG9WT2xqUjV3TGxL?=
 =?utf-8?B?c0Q1V0tUaEI3MGZ5K2ZVUHZwbStoNXZib2w2TGg4dWdCTDZTRytJbitXeHhV?=
 =?utf-8?B?NkFCdmcyazFDaTZZUDdSY1Uwb0hLejg1QnFhc3N5S1dscUk1ejNFSDIrT3g0?=
 =?utf-8?Q?v8j0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399b5717-8e9a-4d0f-11ea-08dcb642e81c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 18:09:25.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8/LPf8pwDOe/ECOm0FIyFSdP2zWuNmJzKpAvQlpPCTx5GfylSwx/cXJ0T5G6fTi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045
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



On 2024-07-30 06:00, Tom Chung wrote:
> [why]
> Add a basic IGT test for panel replay feature.
> 
> [how]
> Subtest case
> 
> a. static screen
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Stop video flip and wait for a while.
>     4. Check if replay state is in Replay mode.
> 
> b. Live mode (intermittent)
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Check if replay state is in Live mode.
>     4. Stop video flip and wait for a while.
>     5. Check if replay state is in Replay mode.
>     6. Repaet 2 to 5.
> 
> c. Live mode (constant)
>     1. Check if system support panel replay.
>     2. Start video flip for a while.
>     3. Check if replay state is in Live mode.
> 
> d. Resume from Suspend
>     1. Suspend the system and resume
>     2. Start video flip for a while.
>     3. Stop video flip and wait for a while.
>     4. Check if replay state is in Replay mode.
> 
> Cc: Leo Li <sunpeng.li@amd.com>
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
> v2: Modify the include header files in tests/amdgpu/amd_replay.c
> v3: Fix some coding style issues. Add a new subtest case.
> v4: 1. Update enum replay_state and include file.
>      2. Modify the return value of igt_amd_read_replay_state()
>      3. Add a page_flip_test() to simplify the test function
> 
>   lib/igt_amd.c             | 163 ++++++++++++++
>   lib/igt_amd.h             |  41 +++-
>   tests/amdgpu/amd_replay.c | 458 ++++++++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build  |   1 +
>   4 files changed, 662 insertions(+), 1 deletion(-)
>   create mode 100644 tests/amdgpu/amd_replay.c
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 149af5151..99d6f105a 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1014,6 +1014,169 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
>   	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);
>   }
>   
> +/**
> + * igt_amd_output_has_replay_cap: check if eDP connector has replay_capability debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_CAP);
> +}
> +
> +/**
> + * igt_amd_replay_support_sink: check if sink device support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		 DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Sink support: yes");
> +}
> +
> +/**
> + * igt_amd_replay_support_drv: check if driver support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);
> +
> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		 DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Driver support: yes");
> +}
> +
> +/**
> + * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_STATE);
> +}
> +
> +/*
> + * Convert raw panel replay state to emum panel replay state.
> + */
> +static enum replay_state convert_replay_state(uint32_t raw_state)
> +{
> +	switch (raw_state) {
> +	case 0:
> +		return REPLAY_STATE_0;
> +	case 0x10:
> +		return REPLAY_STATE_1;
> +	case 0x11:
> +		return REPLAY_STATE_1A;
> +	case 0x20:
> +		return REPLAY_STATE_2;
> +	case 0x21:
> +		return REPLAY_STATE_2A;
> +	case 0x30:
> +		return REPLAY_STATE_3;
> +	case 0x31:
> +		return REPLAY_STATE_3INIT;
> +	case 0x40:
> +		return REPLAY_STATE_4;
> +	case 0x41:
> +		return REPLAY_STATE_4A;
> +	case 0x42:
> +		return REPLAY_STATE_4B;
> +	case 0x43:
> +		return REPLAY_STATE_4C;
> +	case 0x44:
> +		return REPLAY_STATE_4D;
> +	case 0x45:
> +		return REPLAY_STATE_4E;
> +	case 0x4A:
> +		return REPLAY_STATE_4B_LOCKED;
> +	case 0x4B:
> +		return REPLAY_STATE_4C_UNLOCKED;
> +	case 0x50:
> +		return REPLAY_STATE_5;
> +	case 0x51:
> +		return REPLAY_STATE_5A;
> +	case 0x52:
> +		return REPLAY_STATE_5B;
> +	case 0x5A:
> +		return REPLAY_STATE_5A_LOCKED;
> +	case 0x5B:
> +		return REPLAY_STATE_5B_UNLOCKED;
> +	case 0x60:
> +		return REPLAY_STATE_6;
> +	case 0x61:
> +		return REPLAY_STATE_6A;
> +	case 0x62:
> +		return REPLAY_STATE_6B;
> +	default:
> +		return REPLAY_STATE_INVALID;
> +	}
> +}
> +
> +/**
> + * @brief Read Panel Replay State from debugfs interface
> + * @param drm_fd DRM file descriptor
> + * @param connector_name The connector's name, on which we're reading the status
> + * @return Panel Replay state
> + */
> +enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret, raw_state;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);
> +
> +		return -1;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_STATE, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		 DEBUGFS_EDP_REPLAY_STATE, connector_name);
> +
> +	raw_state = strtol(buf, NULL, 10);
> +	return convert_replay_state(raw_state);
> +}
> +
>   /**
>    * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
>    * @drm_fd: DRM file descriptor
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 6780b99de..bce4657cb 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -47,6 +47,8 @@
>   #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
>   #define MAX_SUPPORTED_ILR 8
>   #define MULTIPLIER_TO_LR 270000
> +#define DEBUGFS_EDP_REPLAY_CAP "replay_capability"
> +#define DEBUGFS_EDP_REPLAY_STATE "replay_state"
>   #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
>   #define DEBUGFS_EDP_PSR_STATE	"psr_state"
>   #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
> @@ -100,6 +102,37 @@ enum dc_link_training_type {
>   	LINK_TRAINING_NO_PATTERN
>   };
>   
> +/*
> + * enumeration of REPLAY STATE below should be aligned to the upstreamed
> + * amdgpu kernel driver 'enum replay_state' in dmub_cmd.h
> + */
> +enum replay_state {
> +	REPLAY_STATE_0 = 0x0,
> +	REPLAY_STATE_1 = 0x10,
> +	REPLAY_STATE_1A = 0x11,
> +	REPLAY_STATE_2 = 0x20,
> +	REPLAY_STATE_2A = 0x21,
> +	REPLAY_STATE_3 = 0x30,
> +	REPLAY_STATE_3INIT = 0x31,
> +	REPLAY_STATE_4 = 0x40,
> +	REPLAY_STATE_4A = 0x41,
> +	REPLAY_STATE_4B = 0x42,
> +	REPLAY_STATE_4C = 0x43,
> +	REPLAY_STATE_4D = 0x44,
> +	REPLAY_STATE_4E = 0x45,
> +	REPLAY_STATE_4B_LOCKED = 0x4A,
> +	REPLAY_STATE_4C_UNLOCKED = 0x4B,
> +	REPLAY_STATE_5 = 0x50,
> +	REPLAY_STATE_5A = 0x51,
> +	REPLAY_STATE_5B = 0x52,
> +	REPLAY_STATE_5A_LOCKED = 0x5A,
> +	REPLAY_STATE_5B_UNLOCKED = 0x5B,
> +	REPLAY_STATE_6 = 0x60,
> +	REPLAY_STATE_6A = 0x61,
> +	REPLAY_STATE_6B = 0x62,
> +	REPLAY_STATE_INVALID = 0xFF
> +};
> +
>   /*
>    * enumeration of PSR STATE below should be aligned to the upstreamed
>    * amdgpu kernel driver 'enum dc_psr_state' in dc_type.h
> @@ -135,7 +168,8 @@ enum amdgpu_debug_visual_confirm {
>   	VISUAL_CONFIRM_HDR	= 2,
>   	VISUAL_CONFIRM_MPCTREE	= 4,
>   	VISUAL_CONFIRM_PSR	= 5,
> -	VISUAL_CONFIRM_SWIZZLE	= 9
> +	VISUAL_CONFIRM_SWIZZLE  = 9,
> +	VISUAL_CONFIRM_REPLAY = 12
>   };
>   
>   uint32_t igt_amd_create_bo(int fd, uint64_t size);
> @@ -189,6 +223,11 @@ void igt_amd_write_ilr_setting(
>   	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
>   	uint8_t link_rate_set);
>   bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
> +enum replay_state igt_amd_read_replay_state(int drm_fd, char *connector_name);
>   bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
>   bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
>   bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> new file mode 100644
> index 000000000..799ac5229
> --- /dev/null
> +++ b/tests/amdgpu/amd_replay.c
> @@ -0,0 +1,458 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +
> +#include "igt_amd.h"
> +
> +/* hardware requirements:
> + * eDP panel that supports Panel Replay
> + */
> +IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
> +
> +#define REPLAY_SETTLE_DELAY 10
> +
> +/* Common test data. */
> +struct test_data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_pipe_t *pipe;
> +	drmModeModeInfo *mode;
> +	igt_fb_t ref_fb;
> +	igt_fb_t ref_fb2;
> +	igt_fb_t *flip_fb;
> +	enum pipe pipe_id;
> +	int fd;
> +	int debugfs_fd;
> +	int w, h;
> +};
> +
> +struct {
> +	bool visual_confirm;
> +} opt = {
> +	.visual_confirm = false,	/* visual confirm debug option */
> +};
> +
> +const char *help_str =
> +"  --visual-confirm           Panel Replay visual confirm debug option enable\n";
> +
> +struct option long_options[] = {
> +	{"visual-confirm",	required_argument, NULL, 'v'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +enum test_mode {
> +	TEST_MODE_STATIC_SCREEN = 0,
> +	TEST_MODE_INTERMITTENT_LIVE,
> +	TEST_MODE_CONSTANT_LIVE,
> +	TEST_MODE_SUSPEND,
> +	TEST_MODE_COUNT
> +};
> +
> +/* Common test setup. */
> +static void test_init(struct test_data *data)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	/* It doesn't matter which pipe we choose on amdpgu. */
> +	data->pipe_id = PIPE_A;
> +	data->pipe = &data->display.pipes[data->pipe_id];
> +
> +	igt_display_reset(display);
> +
> +	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
> +	igt_require(data->output);
> +	igt_info("output %s\n", data->output->name);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +	kmstest_dump_mode(data->mode);
> +
> +	data->primary =
> +		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	data->w = data->mode->hdisplay;
> +	data->h = data->mode->vdisplay;
> +
> +	data->ref_fb.fb_id = 0;
> +	data->ref_fb2.fb_id = 0;
> +
> +	if (opt.visual_confirm) {
> +		/**
> +		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
> +		 * to have Panel Replay visual confirm enable take effect. DPMS off -> ON transition
> +		 * is one of many approaches.
> +		 */
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +			 DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +			 DRM_MODE_DPMS_ON);
> +	}
> +}
> +
> +/* Common test cleanup. */
> +static void test_fini(struct test_data *data)
> +{
> +		igt_display_t *display = &data->display;
> +
> +		igt_display_reset(display);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +}
> +
> +static int check_conn_type(struct test_data *data, uint32_t type)
> +{
> +	int i;
> +
> +	for (i = 0; i < data->display.n_outputs; i++) {
> +		uint32_t conn_type = data->display.outputs[i].config.connector->connector_type;
> +
> +		if (conn_type == type)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static bool replay_mode_supported(struct test_data *data)
> +{
> +	/* run Panel Replay test if eDP panel support Panel Replay */
> +	if (!igt_amd_output_has_replay_cap(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_CAP);
> +
> +		return false;
> +	}
> +
> +	if (!igt_amd_output_has_replay_state(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_STATE);
> +
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_sink(data->fd, data->output->name)) {
> +		igt_warn(" output %s not support Panel Replay mode\n", data->output->name);
> +
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_drv(data->fd, data->output->name)) {
> +		igt_warn(" kernel driver not support Panel Replay mode\n");
> +
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* Read from /dev/drm_dp_aux
> + * addr: DPCD offset
> + * val:  Read value of DPCD register
> + */
> +static bool dpcd_read_byte(int drm_fd,
> +	drmModeConnector *connector, uint32_t addr, uint8_t *val)
> +{
> +	DIR *dir;
> +	int dir_fd;
> +	uint8_t buf[16] = {0};
> +	*val = 0;
> +
> +	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
> +	igt_assert(dir_fd >= 0);
> +
> +	dir = fdopendir(dir_fd);
> +	igt_assert(dir);
> +
> +	for (;;) {
> +		struct dirent *ent;
> +		char path[5 + sizeof(ent->d_name)];
> +		int fd, ret, i, j, k;
> +
> +		ent = readdir(dir);
> +		if (!ent)
> +			break;
> +
> +		if (strncmp(ent->d_name, "drm_dp_aux", 10))
> +			continue;
> +
> +		snprintf(path, sizeof(path), "/dev/%s", ent->d_name);
> +
> +		fd = open(path, O_RDONLY);
> +		igt_assert(fd >= 0);
> +
> +		k = (addr / 16) + 1;
> +		j = addr % 16;
> +
> +		/* read 16 bytes each loop */
> +		for (i = 0; i < k; i++) {
> +			ret = read(fd, buf, sizeof(buf));
> +			if (ret < 0)
> +				break;
> +			if (ret != sizeof(buf))
> +				break;
> +		}
> +
> +		close(fd);
> +
> +		closedir(dir);
> +		close(dir_fd);
> +
> +		if (ret > 0)
> +			*val = buf[j];
> +
> +		return (ret > 0);
> +	}
> +
> +	closedir(dir);
> +	close(dir_fd);
> +
> +	return false;
> +}
> +
> +static bool page_flip_test(struct test_data *data, igt_output_t *output,
> +						 enum test_mode test_mode, uint32_t frame_num)
> +{
> +	int ret, frame_count;
> +	enum replay_state replay_state;
> +	uint8_t panel_dpcd = 0;
> +
> +	if (!data || data->ref_fb.fb_id == 0 || data->ref_fb2.fb_id == 0
> +	    || frame_num <= 5) {
> +		return false;

Would returning void, and igt_skip() here rather than in the caller, be simpler?

Otherwise, lgtm.

- Leo

> +	}
> +
> +	data->flip_fb = &data->ref_fb;
> +
> +	for (frame_count = 0; frame_count <= frame_num; frame_count++) {
> +		ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +				data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		igt_require(ret == 0);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
> +				&& frame_count > 5) {
> +			/* Panel Replay state needs few frame to enter the live mode */
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +			igt_debug("replay_state live mode = 0x%X\n", replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> +					"State should be REPLAY_STATE_4 (Active with single frame update)\n");
> +			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +		}
> +
> +		if (frame_count % 2 == 0)
> +			data->flip_fb = &data->ref_fb2;
> +		else
> +			data->flip_fb = &data->ref_fb;
> +	}
> +
> +	return true;
> +}
> +
> +static void run_check_replay(struct test_data *data, enum test_mode test_mode)
> +{
> +	int edp_idx;
> +	enum replay_state replay_state;
> +	igt_output_t *output;
> +	uint8_t panel_dpcd = 0;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP support Panel Replay. */
> +	igt_skip_on(!replay_mode_supported(data));
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &data->ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &data->ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &data->ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +		data->flip_fb = &data->ref_fb;
> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		/* Panel Replay state takes some time to settle its value on static screen */
> +		sleep(REPLAY_SETTLE_DELAY);
> +
> +		/* Check Panel Replay state */
> +		replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
> +		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
> +		igt_fail_on_f(replay_state < REPLAY_STATE_2,
> +			 "Panel Replay was not enabled for connector %s\n", output->name);
> +
> +		/* Do some page flip and let the replay go into live mode */
> +		igt_skip_on_f(!page_flip_test(data, output, test_mode, 20), "page flip failed\n");
> +
> +		/* Check Panel Replay state in static screen */
> +		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +			igt_debug("replay_state static mode = 0x%X\n", replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +				 "State should be REPLAY_STATE_3 (Active)\n");
> +			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +		}
> +
> +		/* Do another page flip if we do the replay_intermittent_live test */
> +		if (test_mode == TEST_MODE_INTERMITTENT_LIVE) {
> +			igt_skip_on_f(!page_flip_test(data, output, test_mode, 30), "page flip failed\n");
> +
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
> +				 replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +				 "State should be REPLAY_STATE_3 (Active)\n");
> +			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +		}
> +
> +		igt_remove_fb(data->fd, &data->ref_fb);
> +		igt_remove_fb(data->fd, &data->ref_fb2);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +static void run_check_replay_suspend(struct test_data *data)
> +{
> +	int edp_idx;
> +	enum replay_state replay_state;
> +	igt_output_t *output;
> +	uint8_t panel_dpcd = 0;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP support Panel Replay. */
> +	igt_skip_on(!replay_mode_supported(data));
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6, 0.6, 0.6, &data->ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +			 data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0, 0.4, 0.14, &data->ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &data->ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +		data->flip_fb = &data->ref_fb;
> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		/* Suspend and Resume */
> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +
> +		/* Do some page flip and let the replay go into live mode */
> +		igt_skip_on_f(!page_flip_test(data, output, TEST_MODE_SUSPEND, 10), "page flip failed\n");
> +
> +		/* Panel Replay state takes some time to settle its value on static screen */
> +		sleep(REPLAY_SETTLE_DELAY);
> +
> +		replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +		dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
> +		igt_debug("replay_state static mode = 0x%X\n", replay_state);
> +		igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +			 "State should be REPLAY_STATE_3 (Active)\n");
> +		igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +
> +		igt_remove_fb(data->fd, &data->ref_fb);
> +		igt_remove_fb(data->fd, &data->ref_fb2);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +static int opt_handler(int option, int option_index, void *data)
> +{
> +	switch (option) {
> +	case 'v':
> +		opt.visual_confirm = strtol(optarg, NULL, 0);
> +		igt_info("Panel Replay Visual Confirm %s\n",
> +			 opt.visual_confirm ? "enabled" : "disabled");
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> +{
> +	struct test_data data;
> +
> +	igt_skip_on_simulation();
> +	memset(&data, 0, sizeof(data));
> +
> +	igt_fixture
> +	{
> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +
> +		if (data.fd == -1)
> +			igt_skip("Not an amdgpu driver.\n");
> +
> +		data.debugfs_fd = igt_debugfs_dir(data.fd);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(&data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +
> +		/* check if visual confirm option available */
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_skip_on_f(!igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_REPLAY),
> +				 "set Panel Replay visual confirm failed\n");
> +		}
> +	}
> +
> +	igt_describe("Test whether Panel Replay can be enabled with static screen");
> +	igt_subtest("replay_static_screen") run_check_replay(&data, TEST_MODE_STATIC_SCREEN);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with intermittent live mdoe");
> +	igt_subtest("replay_intermittent_live") run_check_replay(&data, TEST_MODE_INTERMITTENT_LIVE);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with constant live mdoe");
> +	igt_subtest("replay_constant_live") run_check_replay(&data, TEST_MODE_CONSTANT_LIVE);
> +
> +	igt_describe("Test whether Panel Replay can be enabled after resume from suspend");
> +	igt_subtest("replay_suspend") run_check_replay_suspend(&data);
> +
> +	igt_fixture
> +	{
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
> +				 "reset Panel Replay visual confirm failed\n");
> +		}
> +		close(data.debugfs_fd);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 3982a665f..69706fa70 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -30,6 +30,7 @@ if libdrm_amdgpu.found()
>   			  'amd_prime',
>   			  'amd_psr',
>   			  'amd_ras',
> +			  'amd_replay',
>   			  'amd_security',
>   			  'amd_uvd_dec',
>   			  'amd_uvd_enc',
