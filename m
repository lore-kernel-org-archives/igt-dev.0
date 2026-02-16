Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B4DE63F1E
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 05:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5558310E090;
	Mon, 16 Feb 2026 05:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hR+8OgEl";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010033.outbound.protection.outlook.com
 [40.93.198.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB0110E090
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 05:38:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBK2yNZPKMj1AllZmj51BTICvnYqYZXRPLGy0vuUTl13n790i2n0+ydSXgGWH+/kg2vrtSyWcBGyxM6hdqyLBuNGMpk5dNtqqPraYtaCq2d9msFezMnzEvaDxspDCMOHKkeo9/eEdOmzO5FKToCSt6q8ytm0SUIeIyylZ4RR6b/bhFLgdS4Xe9scyvu5SYj6OsFV34ut19zF/ikN9T0dcgXAsyJJoPAJo/gEtP4SJi+aayiHo5PjkfIXTounjYR21N27ViqZAJ00C2u+L/rcLwSYgpw8UQEhhf68dklA4NHpuRVTAUC9hyqmn37DAKdLqsAha58K3geCjmVP3VH+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2hwbsk2OUUK1a66Rh2TbnLRcmwURfRzZ4ZVVlsY0Qs=;
 b=K06vwn/Law+K5xTO2gPVmItfNBam4/NahItL0zSo75LLhZDhkE0pkUgMw8zlhJctRrLXdBYdpy9MML02eQR7SJWZESXupZ+D/lTl/q/uIGfgvk9mQP8cPfG7rS/r6/3fO1gMXs6hIjQtDohRCf5Zp059YdZBwIFENv0izuGWGzQIdipCSx+1un24NXxvF3YwKV2Nwpr6rKMAnrhRUEJ6pEqy6cBghXXz9m67/ELBKGnolnTr49yzuN3UzlF5aam80e/1edE9Nx9oLkp5awwGyH1NTB9FnS5PQ7C7YhHGmiHPvezbrb455e60ADZobwE2ICedorDt7V4GkU50wDin8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2hwbsk2OUUK1a66Rh2TbnLRcmwURfRzZ4ZVVlsY0Qs=;
 b=hR+8OgEl4FeNuqARpKuHDspdKy+sRW03hhTWDvZ1xz4MggS+jCdtVnJTU1MUFGglFgXRURaDfGE+hArP+KA0YpZ6gbTOsI2pvX/5OCes5KfTJOxywFHWVZB+bHFBv4LsTPMq7AzwdkNlBq+DP8Y2NLzYrwg+e7xPIHFq2LSETcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 05:38:51 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 05:38:51 +0000
Content-Type: multipart/alternative;
 boundary="------------59lYYKF1u0BlAopFOpKN603S"
Message-ID: <232f11fe-f4b7-4e0b-a04d-e60a85d9794e@amd.com>
Date: Mon, 16 Feb 2026 00:38:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/amdgpu: support FWM packet in user queue
To: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com
References: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
X-ClientProxiedBy: YQZPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::29) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cff016f-3562-4376-6226-08de6d1daa32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2RGbS9RMXhUZHJBa0pYVkVFbG1TSzhLQXRFdEY0c2daUSt1VGdiOFJOTG5Z?=
 =?utf-8?B?WWQ5QjAvYTZtUFFLU1NhRWpyYVNibDJ5blR2Z05vSlA5U2Fsczl6ZVdsQlc2?=
 =?utf-8?B?QjliYnRtM3BDTDd2bS80QUh5UkFaWTdJbjkyNXhEUkpGVkFtY3Axd2hWUXc4?=
 =?utf-8?B?ZnZTc2xxaU1UL01kL3YzcnB2UVRBWE10UVJidjI2Z3FTa1dNUU5SazJ3N3ZT?=
 =?utf-8?B?WEVwU0w1WTJDZkplTkhLbXpoWG5yeTV3RTIwYzBJa1UvSzI0WUpYQi9BWVNR?=
 =?utf-8?B?cXh5YjduOWdVZGw5ZjgydXVNNnJFWktkazF4b1VLMmVSV2hROWxBRTdtMlBI?=
 =?utf-8?B?eTNuazRpbnB3VDVzb1hMb1kzd3Erd0NsMUY1aVRNL09BZEx5SzB4emNpUWFO?=
 =?utf-8?B?MWtHeDcyU3Z1b1lmWHdBZFQwSU1SMjZQK09EMm1kVXMzcmwyejJUMlArRFJT?=
 =?utf-8?B?ZlR2MnpCMExYeGV5VGtqaHRmVjJta0FuajVJUlpOWmxjZ1o4b3k2b3Qzdmg4?=
 =?utf-8?B?YlZIUlpkMkNVVE5EeVRlMVlCTDdzL0EweTM5d1I0aGh6UXBDTlVBMWFOTXFp?=
 =?utf-8?B?ZFRzQ0pnWWZBUU5NN081aG8wdks3OFdSYURwV3Jiek1IS0VOMzZOVEZNUnQz?=
 =?utf-8?B?TFliaEVidHBTZjdvN0taV2xPK3ltcVhxV3ZobWI2eWV2K3JEQ3Z2SEZkaDVj?=
 =?utf-8?B?T3RRWjJnV3NPQ1czYTRiaWJjU1hWa2ZPdGtpUCtkZGtZMDFocE9aV2JsQU82?=
 =?utf-8?B?cE40MTVkK2ZTMTJ5UXNrZVlTQm11dFd1bHIxaFp3MVlUUUNRREJsNm4xcjJ5?=
 =?utf-8?B?bk9wK05oKzU3QkYwSFNkS0xkMkxSSk03dmV4ZmY1TWo1TFRLcnFpYnVhYmln?=
 =?utf-8?B?V2ZhTk5VTEczcmlLZ1hmVWt0N0ptOENyN3dMM3ZBUkxrZXU4c3BvUTQ5L0Zt?=
 =?utf-8?B?Ris0YTNEK1UrK0FGdjUxbCtZbzZSV3lKSC9vOHZBWkhWN29SeGN4STBjQjYw?=
 =?utf-8?B?WWFpQ1g3a3RYVm5INjZyM1BVM3FFK3NwOTdIWEpQNmZIWWRVRnRIQzRETjRM?=
 =?utf-8?B?aVg5N2Ivb2xucVppc2lia0dFeWI4d0ZsZGFmSEpUODVBZjZsRTNLNURLa2Zx?=
 =?utf-8?B?cllNc3g2bll6Vlc2SXp4MDVNb21sMnlDYzZuWXVnRlAwQUwrRkJPSGZHeFRE?=
 =?utf-8?B?ZUNhd3hvSTcrSUNOdGxRME1Hek9VNzJmOFlGbE1WeEM2cTJNaFNwRnM3UFRW?=
 =?utf-8?B?NURCZ2RRL3VSMEdPUHdIME9PT2Erd2dWTTJaVm5Eczl1YmtZUEducGQxZ2J6?=
 =?utf-8?B?ZWYyanpNVnBwR1BBNDZ2VWNIWDJHVmxYdWV6VjhRVnVnV0N6MURvSks5VERE?=
 =?utf-8?B?SGd1TkcwUEw2QzVUeVMzRUtRZXdvVnNCOE9hRG5OZWZNU3B4VDJmRVRoamlh?=
 =?utf-8?B?RExCZjJaakFuZENDejBGYVBaUkMySk5QcVhuekVBWXpDQVRSWmxaeGNJTW41?=
 =?utf-8?B?ZU5Dd1FYWWhnL05Pc2lOajZtaG9SOTJFQTF2U3FnNzJrcFFvRjg4R0c5aThJ?=
 =?utf-8?B?STl1eVlsdTVER3VMdWhWTWkzd2pJdlNyM1VoNG1xN2E5anZhVy9yQkN4Y09i?=
 =?utf-8?B?SGNYdU1ac29TaXlYVG9zSDBNdXovTzhycUwzclJlUUlzYm8xZW5PUlBtdUg0?=
 =?utf-8?B?ekdkM0VkbmMwZjA4ZURQWXpLQVpTaG1EWUlkQUhwZDhtZjlmT1VhOFdJS2JT?=
 =?utf-8?B?L0J3czNZeVVsdHptbVBzNlFRa2RBMXExWjRCNmpaK0N3aTdMcyswZFMrMnBh?=
 =?utf-8?B?WWUwVGxaQTBIRzVaVVJXUkJCQzZKNWZ4MUFJZTJJVkZ4TVBsa1A3YXVwVFdv?=
 =?utf-8?B?NHJzVUtCR1JsM3M3L3hoQVpJVGVlOS9hSnFpOXNHU1krc0tzZ0RubWJ4S21D?=
 =?utf-8?B?cXBFMklWQnBvRmdhOUlSL3dyNXp3bWEzTjVwQkd2enJoM3dmQ2FvUEZBMVNS?=
 =?utf-8?B?c3FYd0dmVHNPbkwvcCtxVm1keDc2c0pWZDBqU1JZekVoT25BMHpWNEM1S1JV?=
 =?utf-8?B?aE1aOHNPU1RucFRNUWZFallvRkxvL3U2ZTloWkN1NzdzaU94RTlRa2pFQmQr?=
 =?utf-8?Q?WKG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(7142099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1JEZDJJb04rTHdCLzdmZUJGaTF2Y3A2VHpxa01tMG02V2FXSkprU3oyK1FY?=
 =?utf-8?B?VWJKZXJlWGprdW1KWVB0MENIVDF1RlNnU1dTZUFJcmZieEFML3VDM3cvd1lC?=
 =?utf-8?B?SEVqSEJQZE1DdmNaZ212UVd2MWYxaDFQb1F2R2xucVg5N2M3RVd1NFFtRXk5?=
 =?utf-8?B?emZiRkpFenRDL1dXMjFWMENndHp5ckl4V3VTU0hHQkY2TFBnTWxrWGhhV3Bn?=
 =?utf-8?B?VUlWdWEwOTVjamtMdTROV0hCMy9NbjZOcmVIRk91d1ZzajJNdGd5Yy8zdUx0?=
 =?utf-8?B?ZTBSSkFndm1KSkNOVDhMa29wSUJEWnVDZ0wwTnZ0VDc0VzN1YzVWZlhUenV2?=
 =?utf-8?B?WnN1VTJWTUxoV1ZvVCtLWCtNUG9ZL21QNVZpSXlKR0ZoWkpVUS9SVmJJb3h0?=
 =?utf-8?B?SkRzUHNmYlpsVko5TFUyZEI2ZVluY1lmT08reWlRbnE5dEV6NWFVdjdIM3J4?=
 =?utf-8?B?NUdCYjhHYzc3TU1sTHRwTFhsYTNsQUR4b1R6aUhpVlF0TXhEN2gyVEx0UHVX?=
 =?utf-8?B?K2dpbDdJdVhvZ3B3UE0vbUNJdVhOWEppa0FSelppcWZaWm9zb1J5ZEtzZU02?=
 =?utf-8?B?bWtSSDA0NjE1T0RrSUo3S2l3VDVKaTRNTk00ZXRxK0xlQlhNeFpaKy96Skpv?=
 =?utf-8?B?aExpVEdmNkxRSlc2MzBmdTl2OTJQS1NyZUtoSVMxYURwRG9FS0YzU3Q3blQv?=
 =?utf-8?B?MlJnK2lGSExQU283WHo4ZzNyRTdsZHBnMWtkeFBSdUFIV1BVb2IzNEhISFl1?=
 =?utf-8?B?dFJ5NnBySHAyYXJ1REtEWDNPcjFWSUUyS3RVb3BwdE03YlorRnFYeTRncXNx?=
 =?utf-8?B?VGhCaUJwMW5Td2lIYW4rODJ1YlNEL2wxY3ZnNUFqaVRBMFd3M2czS3FnVFQz?=
 =?utf-8?B?NVlicXlYd091Q2hLemR3bjRkaG0wRDlBdTJJb3NOQkcxSnJGdndtam1VejZZ?=
 =?utf-8?B?QTNtZVQ3WnJKTXhBSWdmOVB1bTV5cm5tUjFLYSsvUkVKRGVSUDRCd2R4THRE?=
 =?utf-8?B?LzRxTTh2NktSem1QZDJwSnUvVXovV3RLVUQ1UXg3U29PNEw3dDlxQTRCVStt?=
 =?utf-8?B?ZUkvbjNTZTd0S0R4STNaNU5nNGJiWSs5WXJzcnliOWdhdGJYdXlWOThIY0t3?=
 =?utf-8?B?azZrM0JUZ3NBbXhGWFBMUVpyc0pXcENLN0VUQlkvR2tSRWt1c2Vxcm9iUkZr?=
 =?utf-8?B?MUo3d0h0eCtKWUJLcmJJWk4vcHF3UHFObDZEek9vMGFhV1ZyU09Fd2xHMU9B?=
 =?utf-8?B?aXp3ajJFeWY3THo0NndMUHBNYVMrd0Nad2dpekE0UDg1MmozMjJjd3pUb1lr?=
 =?utf-8?B?bll4MGM5bUlCNk8rRHdJbGJpT2tWejB0bmhhTHhyeHpueWs0Yy9DSTF0NGx4?=
 =?utf-8?B?dWtWQlNpamphWDBCL1p5RlVYQ1dqYWFtU2hoalh6WEVhdXMyZ3BUTTdUZkxD?=
 =?utf-8?B?bU9Fd1BSMzN4VlVueUgxejVBNTByYnIybmFacXhWblBZRk9nWjh0cCt3cHhB?=
 =?utf-8?B?MUhadlM3RjZRKytmSHMxL3lZelBXUkcxU0ROa3FqbmFuK0pCT1JZQkVnVmdH?=
 =?utf-8?B?cW9pd2plcVRtcjRnaW5vRDRKeE9MSzZGZnJTQ2dTNWd0QzFFMTFqZUdIb09l?=
 =?utf-8?B?SlFDWENEdTNJS2U1V0phUUZrclNzVkkvQzM0OUU3YWw2ZzlSSXI0SWo1WlBX?=
 =?utf-8?B?RzEzRmVHSmpKZUc2UEtNOFo0ZlBtZHRyZGxSOEhhaTFSaEZZYUFyTEtuays5?=
 =?utf-8?B?M1FqdjRvS3p4eEpRd0Z1UVRBNFpJT0hoS1NQVUFXcDFZbFFucFJmaTFjTzk2?=
 =?utf-8?B?SDFaeUcvaXM0bUxoRm8rWWlHZjVjQW5ZYTJjVDFTMjM0dmM0LzVhUVVxZ3dj?=
 =?utf-8?B?QW9LS243M0tzUlFKWHhJRFMzYlhlWTd2d3RjeXhPdUVDT3VDbDQzQW5hbzFl?=
 =?utf-8?B?V0JoaVh3VlR5MmU1Yy8xVEdhNzl5RXNhcXJOUjhDSG9IL2tTWEtEaDlrazhs?=
 =?utf-8?B?NUhJUU83M3dXYWxTTVRFODNqSk1uM3BuY2hpN294TWRCZDVSbkZya29aeHRC?=
 =?utf-8?B?RnNPVmNLMEFyYnczRG0rRG1kTlI2NHlncklHcXFQem1wNjhOMEU5c0JWTllF?=
 =?utf-8?B?VnpUZWZGUXRZYWVmVVJmWXI3VUpxNE5oN04vd1hxNGlOTlZmbUM4VHMrc2FN?=
 =?utf-8?B?S3NqK0sveUdxa0I5bzBGYUZkKy9RbDhDVU4xeHQ1Tllkb0IrblVjUWEwLy9s?=
 =?utf-8?B?WGdSdXlrVk10UG5wWVNRaWN1TEN2RWFFVm9SeHdpamwzWDEybndKaGlibnFX?=
 =?utf-8?B?WXUrV0p1S2ZPdGMwREt3NFpIL3NDVGg4aTVMek5IVVNJUzB5RHhJQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cff016f-3562-4376-6226-08de6d1daa32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 05:38:51.1878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/HucSJhrsblOVGsafa8J93VFQSGGApNyjlg5nYHVdEG50Qqa8IAxObYpDCeHxmCi4gMbI9wSKZBa5z2ae4EVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154
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

--------------59lYYKF1u0BlAopFOpKN603S
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 2026-02-11 06:39, Yogesh Mohan Marimuthu wrote:
> Also add WRITE_DATA job start marker packet optionally. This can be used
> to know job has started and make FWM packet negative testing timeout to be
> shorter.

Please expand the FWM abbreviation (“Fence Wait Multi”) and add a more detailed description of what the test does and what it validates (including the negative check: the job must not complete while fences are unsatisfied, and the positive check: it completes once the fences are satisfied

>
> Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
> ---
>  lib/amdgpu/amd_PM4.h                |  6 ++++++
>  lib/amdgpu/amd_command_submission.c |  5 +++++
>  lib/amdgpu/amd_ip_blocks.c          | 27 +++++++++++++++++++++++++++
>  lib/amdgpu/amd_ip_blocks.h          |  5 +++++
>  4 files changed, 43 insertions(+)
>
> diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
> index 8f59b4223..923826656 100644
> --- a/lib/amdgpu/amd_PM4.h
> +++ b/lib/amdgpu/amd_PM4.h
> @@ -224,4 +224,10 @@
>  #define	PACKET3_INCREMENT_CE_COUNTER		0x84
>  #define	PACKET3_WAIT_ON_CE_COUNTER		0x86
>  
> +#define	PACKET3_FENCE_WAIT_MULTI		0xD1
> +#define		FWM_ENGINE_SEL(x)		((x & 1) << 0)
> +#define		FWM_PREEMPTABLE(x)		((x & 1) << 1)
> +#define		FWM_CACHE_POLICY(x)		((x & 3) << 2)
> +#define		FWM_POLL_INTERVAL(x)		((x & 0xFFFF) << 16)
> +
>  #endif
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 52327c69e..399171b44 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -10,6 +10,7 @@
>  #include "lib/amdgpu/amd_sdma.h"
>  #include "lib/amdgpu/amd_PM4.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amdgpu_asic_addr.h"
>  #include "ioctl_wrappers.h"
>  
>  
> @@ -185,6 +186,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
>  		ring_context[ring_id].pm4_size = pm4_dw;
>  		ring_context[ring_id].res_cnt = 1;
>  		ring_context[ring_id].user_queue = user_queue;
> +		if (ip_block->funcs->family_id == FAMILY_GFX1150)
> +			ring_context[ring_id].max_num_fences_fwm = 4;
> +		else
> +			ring_context[ring_id].max_num_fences_fwm = 32;
>  		igt_assert(ring_context[ring_id].pm4);
>  
>  		/* Copy the previously queried HW IP info instead of querying again */
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 12f92a1d5..e8803c6e2 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -659,6 +659,33 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  		amdgpu_sdma_pkt_end();
>  	} else {
>  		amdgpu_pkt_begin();
> +
> +		if (ring_context->job_start_write_data_va_addr) {
> +			amdgpu_pkt_add_dw(PACKET3(PACKET3_WRITE_DATA, 4));
> +			amdgpu_pkt_add_dw(WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3));
> +			amdgpu_pkt_add_dw(ring_context->job_start_write_data_va_addr);
> +			amdgpu_pkt_add_dw(ring_context->job_start_write_data_va_addr >> 32);


Please use lower_32_bits and upper_32_bits  everywhere as it is done into the upper part of the function!


> +			amdgpu_pkt_add_dw(ring_context->job_start_write_data_val);
> +			amdgpu_pkt_add_dw(ring_context->job_start_write_data_val >> 32);
> +		}
> +
> +		if (ring_context->num_fences) {
> +			unsigned num_fences_in_iter;
> +
> +			for (unsigned i = 0; i < ring_context->num_fences; i = i + ring_context->max_num_fences_fwm) {
> +				num_fences_in_iter = (i + ring_context->max_num_fences_fwm > ring_context->num_fences) ?
> +					ring_context->num_fences - i : ring_context->max_num_fences_fwm;
> +				amdgpu_pkt_add_dw(PACKET3(PACKET3_FENCE_WAIT_MULTI, num_fences_in_iter * 4));
> +				amdgpu_pkt_add_dw(FWM_ENGINE_SEL(1) | FWM_POLL_INTERVAL(4));
> +				for (unsigned j = 0; j < num_fences_in_iter; j++) {
Please use lower_32_bits and upper_32_bits macros:
> +					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].va);
> +					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].va >> 32);
> +					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].value);
> +					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].value >> 32);
> +				}
> +			}
> +		}
> +
>  		/* Prepare the Indirect IB to submit the IB to user queue */
>  		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
>  		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 424b3210a..17f94fd5b 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -279,6 +279,11 @@ struct amdgpu_ring_context {
>  	bool user_queue;
>  	uint64_t time_out;
>  	enum uq_submission_mode submit_mode;
> +	uint32_t max_num_fences_fwm;
> +	uint64_t num_fences;
> +	struct drm_amdgpu_userq_fence_info *fence_info;

Please remove these variables and keep the logic local to the function.

We should only add fields to this struct when it’s absolutely necessary. We can’t balloon the struct size just for internal/test-specific logic—this struct is used across all tests.

> +	uint64_t job_start_write_data_va_addr;
> +	uint64_t job_start_write_data_val;
>  
>  	struct drm_amdgpu_info_uq_fw_areas info;
>  };
--------------59lYYKF1u0BlAopFOpKN603S
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-02-11 06:39, Yogesh Mohan
      Marimuthu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com">
      <pre wrap="" class="moz-quote-pre">Also add WRITE_DATA job start marker packet optionally. This can be used
to know job has started and make FWM packet negative testing timeout to be
shorter.</pre>
    </blockquote>
    <br>
    <article class="text-token-text-primary w-full focus:outline-none [--shadow-height:45px] has-data-writing-block:pointer-events-none has-data-writing-block:-mt-(--shadow-height) has-data-writing-block:pt-(--shadow-height) [&amp;:has([data-writing-block])&gt;*]:pointer-events-auto scroll-mt-(--header-height)" tabindex="-1" dir="auto" data-turn-id="e243ef76-06f6-4d89-8379-15ae92ca6e61" data-testid="conversation-turn-15" data-scroll-anchor="false" data-turn="user">
      <div class="text-base my-auto mx-auto pt-12 [--thread-content-margin:--spacing(4)] @w-sm/main:[--thread-content-margin:--spacing(6)] @w-lg/main:[--thread-content-margin:--spacing(16)] px-(--thread-content-margin)">
        <div class="[--thread-content-max-width:40rem] @w-lg/main:[--thread-content-max-width:48rem] mx-auto max-w-(--thread-content-max-width) flex-1 group/turn-messages focus-visible:outline-hidden relative flex w-full min-w-0 flex-col" tabindex="-1">
          <div class="z-0 flex justify-end"></div>
        </div>
      </div>
    </article>
    <article class="text-token-text-primary w-full focus:outline-none [--shadow-height:45px] has-data-writing-block:pointer-events-none has-data-writing-block:-mt-(--shadow-height) has-data-writing-block:pt-(--shadow-height) [&amp;:has([data-writing-block])&gt;*]:pointer-events-auto scroll-mt-[calc(var(--header-height)+min(200px,max(70px,20svh)))]" tabindex="-1" dir="auto" data-turn-id="request-WEB:83f986c4-e1b7-4c64-b335-74c9da614134-7" data-testid="conversation-turn-16" data-scroll-anchor="true" data-turn="assistant">
      <div class="text-base my-auto mx-auto pb-10 [--thread-content-margin:--spacing(4)] @w-sm/main:[--thread-content-margin:--spacing(6)] @w-lg/main:[--thread-content-margin:--spacing(16)] px-(--thread-content-margin)">
        <div class="[--thread-content-max-width:40rem] @w-lg/main:[--thread-content-max-width:48rem] mx-auto max-w-(--thread-content-max-width) flex-1 group/turn-messages focus-visible:outline-hidden relative flex w-full min-w-0 flex-col agent-turn" tabindex="-1">
          <div class="flex max-w-full flex-col grow">
            <div data-message-author-role="assistant" data-message-id="eff6f699-5145-44b3-84df-8d13c6ad2446" dir="auto" class="min-h-8 text-message relative flex w-full flex-col items-end gap-2 text-start break-words whitespace-normal [.text-message+&amp;]:mt-1" data-message-model-slug="gpt-5-2-thinking">
              <div class="flex w-full flex-col gap-1 empty:hidden first:pt-[1px]">
                <div class="markdown prose dark:prose-invert w-full wrap-break-word light markdown-new-styling">
                  <p data-start="0" data-end="291">Please expand the FWM
                    abbreviation (“Fence Wait Multi”) and add a more
                    detailed description of what the test does and what
                    it validates (including the negative check: the job
                    must not complete while fences are unsatisfied, and
                    the positive check: it completes once the fences are
                    satisfied</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </article>
    <blockquote type="cite" cite="mid:20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Yogesh Mohan Marimuthu <a class="moz-txt-link-rfc2396E" href="mailto:yogesh.mohanmarimuthu@amd.com">&lt;yogesh.mohanmarimuthu@amd.com&gt;</a>
---
 lib/amdgpu/amd_PM4.h                |  6 ++++++
 lib/amdgpu/amd_command_submission.c |  5 +++++
 lib/amdgpu/amd_ip_blocks.c          | 27 +++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h          |  5 +++++
 4 files changed, 43 insertions(+)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 8f59b4223..923826656 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -224,4 +224,10 @@
 #define	PACKET3_INCREMENT_CE_COUNTER		0x84
 #define	PACKET3_WAIT_ON_CE_COUNTER		0x86
 
+#define	PACKET3_FENCE_WAIT_MULTI		0xD1
+#define		FWM_ENGINE_SEL(x)		((x &amp; 1) &lt;&lt; 0)
+#define		FWM_PREEMPTABLE(x)		((x &amp; 1) &lt;&lt; 1)
+#define		FWM_CACHE_POLICY(x)		((x &amp; 3) &lt;&lt; 2)
+#define		FWM_POLL_INTERVAL(x)		((x &amp; 0xFFFF) &lt;&lt; 16)
+
 #endif
diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 52327c69e..399171b44 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -10,6 +10,7 @@
 #include &quot;lib/amdgpu/amd_sdma.h&quot;
 #include &quot;lib/amdgpu/amd_PM4.h&quot;
 #include &quot;lib/amdgpu/amd_command_submission.h&quot;
+#include &quot;lib/amdgpu/amdgpu_asic_addr.h&quot;
 #include &quot;ioctl_wrappers.h&quot;
 
 
@@ -185,6 +186,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 		ring_context[ring_id].pm4_size = pm4_dw;
 		ring_context[ring_id].res_cnt = 1;
 		ring_context[ring_id].user_queue = user_queue;
+		if (ip_block-&gt;funcs-&gt;family_id == FAMILY_GFX1150)
+			ring_context[ring_id].max_num_fences_fwm = 4;
+		else
+			ring_context[ring_id].max_num_fences_fwm = 32;
 		igt_assert(ring_context[ring_id].pm4);
 
 		/* Copy the previously queried HW IP info instead of querying again */
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 12f92a1d5..e8803c6e2 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -659,6 +659,33 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 		amdgpu_sdma_pkt_end();
 	} else {
 		amdgpu_pkt_begin();
+
+		if (ring_context-&gt;job_start_write_data_va_addr) {
+			amdgpu_pkt_add_dw(PACKET3(PACKET3_WRITE_DATA, 4));
+			amdgpu_pkt_add_dw(WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3));
+			amdgpu_pkt_add_dw(ring_context-&gt;job_start_write_data_va_addr);
+			amdgpu_pkt_add_dw(ring_context-&gt;job_start_write_data_va_addr &gt;&gt; 32);</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Please use&nbsp;lower_32_bits and&nbsp;upper_32_bits&nbsp; everywhere as it is
      done into the upper part of the function!</p>
    <br>
    <blockquote type="cite" cite="mid:20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com">
      <pre wrap="" class="moz-quote-pre">
+			amdgpu_pkt_add_dw(ring_context-&gt;job_start_write_data_val);
+			amdgpu_pkt_add_dw(ring_context-&gt;job_start_write_data_val &gt;&gt; 32);
+		}
+
+		if (ring_context-&gt;num_fences) {
+			unsigned num_fences_in_iter;
+
+			for (unsigned i = 0; i &lt; ring_context-&gt;num_fences; i = i + ring_context-&gt;max_num_fences_fwm) {
+				num_fences_in_iter = (i + ring_context-&gt;max_num_fences_fwm &gt; ring_context-&gt;num_fences) ?
+					ring_context-&gt;num_fences - i : ring_context-&gt;max_num_fences_fwm;
+				amdgpu_pkt_add_dw(PACKET3(PACKET3_FENCE_WAIT_MULTI, num_fences_in_iter * 4));
+				amdgpu_pkt_add_dw(FWM_ENGINE_SEL(1) | FWM_POLL_INTERVAL(4));
+				for (unsigned j = 0; j &lt; num_fences_in_iter; j++) {</pre>
    </blockquote>
    Please use&nbsp;lower_32_bits and&nbsp;upper_32_bits macros:
    <blockquote type="cite" cite="mid:20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com">
      <pre wrap="" class="moz-quote-pre">
+					amdgpu_pkt_add_dw(ring_context-&gt;fence_info[i + j].va);
+					amdgpu_pkt_add_dw(ring_context-&gt;fence_info[i + j].va &gt;&gt; 32);
+					amdgpu_pkt_add_dw(ring_context-&gt;fence_info[i + j].value);
+					amdgpu_pkt_add_dw(ring_context-&gt;fence_info[i + j].value &gt;&gt; 32);
+				}
+			}
+		}
+
 		/* Prepare the Indirect IB to submit the IB to user queue */
 		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
 		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 424b3210a..17f94fd5b 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -279,6 +279,11 @@ struct amdgpu_ring_context {
 	bool user_queue;
 	uint64_t time_out;
 	enum uq_submission_mode submit_mode;
+	uint32_t max_num_fences_fwm;
+	uint64_t num_fences;
+	struct drm_amdgpu_userq_fence_info *fence_info;</pre>
    </blockquote>
    <p data-start="0" data-end="71">Please remove these variables and
      keep the logic local to the function.</p>
    <p data-start="73" data-end="254">We should only add fields to this
      struct when it’s absolutely necessary. We can’t balloon the struct
      size just for internal/test-specific logic—this struct is used
      across all tests.</p>
    <blockquote type="cite" cite="mid:20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com">
      <pre wrap="" class="moz-quote-pre">
+	uint64_t job_start_write_data_va_addr;
+	uint64_t job_start_write_data_val;
 
 	struct drm_amdgpu_info_uq_fw_areas info;
 };
</pre>
    </blockquote>
  </body>
</html>

--------------59lYYKF1u0BlAopFOpKN603S--
