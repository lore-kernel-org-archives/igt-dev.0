Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D46CAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 17:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FF210EA61;
	Fri, 19 Sep 2025 17:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tOHYntoF";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1838F10EA61
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 17:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdCzB3ZMGRFofqsAG46FG7h4xPjr8V1aqvkLaSQ9a+w6Pb9m2hXA8y7wojonoKAI+0Gv1h+Hr1qn398/e4jQx34qdNeQ/9pdvgm+HbWnixGLHoWkjFECx9mkKZqB9GcV2FcUWNHTZp/Id214O3L/uQaXtg8xfmttWgolngrnX5X2/yqA1n/feLB/ijIvnsnjTXgsA9K8GPcXNj3cEggb34uiLY1PrCKGkH6PNNQ5xsLWHGRQStLxlOpL+oMVML2iEesSjXXkRgQixFoG5AFDMVhGZx6MFzRydJclzZAkQRdGPKztXNr0l6TB3q2FiOAQ1jOjcF0mpLbuD4tfFTameg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nu2LO3OBmf1FdSABbD5wDGh2txyEFvdYNkaE+q6o7Tg=;
 b=B6ZdPMy1flqJI5XmGW/3f7IsworruAJmYluqEoH1NWzz+kHcwWT0nEKIduTZUqOmLk2nfz1O8l6VuGaCVRMukQTKRcz/U2QQq11013VTrlDYa+eFD+grqu5BbCWBBosOcrsne4qQSCtUJ4kB/pNhOurfMf+li0F7flMgR+DuYeNIeLk6NAxHx+fsRajcKgRDSsBDW23yu8rWP2YFnU43Ial/m1U7CeNbIrkKVqbNXioNgknXtQHgIAvp7GuAvVMKR3WkkSlz4TgCS0nc0nOsVRlH4eI+JdNgFZWc34bX19y0hXytykD5BNfQsB9maWSUsAiIKPKkyIBvvciApguC5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nu2LO3OBmf1FdSABbD5wDGh2txyEFvdYNkaE+q6o7Tg=;
 b=tOHYntoFaHl9g71bGJHuXRZ5lvJVQNqrDLEQF+IiJzaBldX9ooOnEGG1W8QRZv0xHXBrDPNSKElYRGjIUorSN0tJ1iMkFkNl03aYcG6ubsxIkP8kM2dO1sSopxlujuzIbxCKxRtmOkrzQp6sbnSabpj1UW807sBboR/xy83J0bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB7546.namprd12.prod.outlook.com (2603:10b6:610:149::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 17:06:57 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 17:06:57 +0000
Message-ID: <056d6b63-acc7-40c9-9696-de38595065b3@amd.com>
Date: Fri, 19 Sep 2025 11:06:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 16/30] lib/igt_fb: Allow any non-planar format for
 igt_copy_fb
To: Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-17-alex.hung@amd.com>
 <20250903165135.c34nledhi7pr6wei@kamilkon-DESK.igk.intel.com>
 <c3f20dd3-73ad-422b-b507-9cbfd17293fc@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <c3f20dd3-73ad-422b-b507-9cbfd17293fc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: 17dc4857-e280-4883-f6c2-08ddf79ef093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmdvSUhoSGJrZWwvU3oyZkV1VktSdjNuK3ZDSCtPNjRWR05RSWlIN0sxY2Z5?=
 =?utf-8?B?UGYzS3lvb3VpTGZvM1gxSWZDV1dHUUs0aURnZ2VIbTNZOC9GT3lrK3owWitl?=
 =?utf-8?B?eUlzR042VjhnUHRmejZMOHVLVW9YQ0dLU0NsZU5EVDk5OFVjMmtkdGlFdHRT?=
 =?utf-8?B?VU11Mkx2dytNNzdCeU9lTnNBdW9aMHFPRDI1REpqY3ZmcTAxaWtRdDVSSHZh?=
 =?utf-8?B?UC9DYzdIbG13SzFJRzhZNm1WZHQyQnc1RVhsYTJnLzFpY1NVSlI5aG1mTHE1?=
 =?utf-8?B?VnhmK20rTHpWUEx1dlpkb0QxVFRTQXBLYllXT2QzSmZZc3FkNjlpVGE4T0RT?=
 =?utf-8?B?bVRFcEJsVkpyaW9rb3hVZVN5SUkyaitkODEzOG9nOEZ2NXpIbXl6eUdRS01l?=
 =?utf-8?B?SFJKZFVBRmhiaURtZHRDMHA3MGFCYnJuWnoyZDRuKzBjQzYxRHhUS1JnamJI?=
 =?utf-8?B?ak93bUpQQXFnRE5Ld0hoek5MTzJwdENzL1pxbERucS8xZndiTU9TazlTVHVI?=
 =?utf-8?B?aDFzcVAwZ05BTE8rRkpJZmQyTmNvRHV6U211ZStRdTZyTXN2RUloQWxIelNT?=
 =?utf-8?B?Y2ZqV2VQQzdoQjltQnVFamo4Y2VETTRYQUtRaFpsOE1xQ1phUnlKVEhuRlIy?=
 =?utf-8?B?Sm1Gb3RxNENsLzBWSXRQV2hmV3lMZXJKbEFnazJZQU9ickZ1VzFBUkUyMkI5?=
 =?utf-8?B?RndJL2RYMXFNZTFMVzQ4L0JsSnVYMkkzSjRaNXJhRGlVM1daYk9MeDF4M2tt?=
 =?utf-8?B?SGU1Ulp3QnV2REdRamdNMTB1YzVxb3NZVzlDMVcwUUxzS0VUZ3J1cVBqOFpi?=
 =?utf-8?B?YUtqVms0SVpaMnNXZWJFaGZvTUpTaU1HZ3dBdXptcjFRaGIwek91ZkIzbTBP?=
 =?utf-8?B?UUJ0Ukl3b2lvNnhJajZwRkxwNFV2WXUweTc0N0tqS09nZitkSWRtZjJHQzlh?=
 =?utf-8?B?TEswRno2WDVnZUlDQWlSdFdDSGRIZjdHMFd4cDl4WU9WakRiY25yQzFJd3R3?=
 =?utf-8?B?dFVBdG9td1dpMHREUUkxZVA1TWFlQ0wyV0dPcVZJeFp4b1ZFRUFIYTRMMTBI?=
 =?utf-8?B?aDk3bDRDN2lwb3JuTGhsWXB3NVBMVXhRNi94dFZLVkY1TGxYNWlHU2JuU0RJ?=
 =?utf-8?B?cDUvSVdLakI5ZTgxam94OVRFMmJralptUHNlTUJkUDFDejgwc2lwWHNtcVVi?=
 =?utf-8?B?ZndQRGRpeE5wa2tUZWhqQjNUdXgvZldVeWM5UWhoMk02RmRiM1MwaDlhZDdj?=
 =?utf-8?B?dFVxUWh5UStaV1ZrZ2FkOGN6ZjFROWlwZi9jRmdBVXBaSjBRa3hGTlY2RFZr?=
 =?utf-8?B?Y0FGV3FzMkUwYkJHbVNkZTJad3NaSXFObWp5ZVA1QnMyTmRxRmFBLzNwNEtD?=
 =?utf-8?B?YmpFZjBBTHJNd3JqdlJjWUh2aE50eWdud3J3QkF3QmhrUUR5RU1Cb2lNOUlT?=
 =?utf-8?B?d2UyS0QzQVhEMk1jNkF3UjBUU2J6dktlNk9UMGdib2J1R2lqSFY1cDEvQnNC?=
 =?utf-8?B?aHQyRmlnWVNtQVRYMERtTE81eFQwTS9JdVRiUnVvTk5TTVZMcXFZODAvMktF?=
 =?utf-8?B?ZzBmbFpHeEc5M3B1OVkrVk9uMWUyM3NNb3VtNUpkWGQxMjROMWh5VlZkcDEw?=
 =?utf-8?B?U1hEK3pKYzhBSFZ4Ni9jTDhIelNQTHJJeVVBOFE4L1RnOU9zZlN1YWZRUzZC?=
 =?utf-8?B?ZVkvYm9QRDVpeS9qYmVNY3NuK2dBQzZZMmwzaGFWU1g3Y09Zd1BPdWxpUTU2?=
 =?utf-8?B?WE80dnVXVEl4eG1sa0VoclpQemN2VG5YcHJUTlZjS0l2bVJyRENEZ1pSZWZW?=
 =?utf-8?B?VFdWUXBHbFZ3OWE5RHJJemJYVXJPcEZVdUpzblBMeWtyblQ1cVVtK3JmMDhK?=
 =?utf-8?B?dWFGalJHM0lYRVI5bm04Si9RdmVza2J6VFJFRUI2STNJeXVQbDBaMkpTbUhV?=
 =?utf-8?Q?q0T04t04j6Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enZxOGJHQis3RXFOZkhZdHhiNnh4V3lrSE5odk16Qjd6RFhLMndPdzM2dHM2?=
 =?utf-8?B?aWc2ZjNOTGR1b2JoZW9wSXlFWVFYMGFHU3BWR1R5cnoydFJEWFdEQXBDMXpi?=
 =?utf-8?B?TXFnWjN5OXByQWl6L21mRnV2Z1ovblNFNFY3TjdTRVhkV2lFeEN6ZE9jV3cy?=
 =?utf-8?B?T2tZTU8xWjF6Z1l4cnd3cjFXakloeGxxdlA4TGtFREFaaGJyYTkvdkdsb1Bl?=
 =?utf-8?B?Vy9acXA3UkN4aEJQb1VDWk9iUVNtVGVBMkZQaGNzOGFweWFaN2l1SkxobXdr?=
 =?utf-8?B?S3dJb01pRnEvTnp1aUkyV0l2SnRTbDIzbU1SWWdCSVNSTmpsZWpzY1FIbXJq?=
 =?utf-8?B?cVZyVlpsZEd6NUxyMGZZT3RjYUh1K1JiU2g1Slc5Z1ZXVTAvcWxEelN0TmdF?=
 =?utf-8?B?R2lPN1kwaE05TUcyYW9PdTBzc2U4R1RTTlFJY0VXcXhjKytKb1gveVUvWEI2?=
 =?utf-8?B?NkxqcXFsRHdKYk5sUWcyVVJ3dVNWeVFsRG11SURqLzcrRkJ1aWEvdHc2aG9z?=
 =?utf-8?B?L05Dazgwakh0WXZ1aGxxb0s5cFhvcG5VOVNROUF2RzNWN0hQQ1J1cjFGTEVP?=
 =?utf-8?B?ZVExVFI2Uzk2RGxXZ3FKdUZ4SERjRlRxcEt2RHVkUnN3ekZYYnMxSEoxeDFJ?=
 =?utf-8?B?NHlyb21XUjZGSnNWUGJaTlhhL09HTEJ0SU8zRHdVTkNQdldHUERLQTlWMGdp?=
 =?utf-8?B?SUYzOGJiQ1pqb1lkdVV4T05QYm9lcFRoSjd4L2MxNStuVGxzMElmWFc3TzZ0?=
 =?utf-8?B?c3hLdUgrQnpNWDF4ZDFWai9IcnRZczFJLy90MUJ4RWkwRWVFY2pLdVdUdmNx?=
 =?utf-8?B?UklwMGZmNG1lMXBubVFsUjlPU1Z1SklPWjREa0x3SFZaOVFxRERUU0pweVQ4?=
 =?utf-8?B?eThiTm5mWWhpbjB6SU1sLzRkRlJVRTZsclhiSjk4R3lRZG1QWWJJdlB1SENt?=
 =?utf-8?B?RmpxT2xEUXpxRXJxTjdadEN4SENYNVlFS3dYMTRVTFRUbUdJdjczbEtVeDJs?=
 =?utf-8?B?VWtydTV5OWhGM1FVVUp4SzVLMXFVNUgzVUYwN0Roc3NTZXJ2ZWJ4YnFtMXc3?=
 =?utf-8?B?VnBJeTBsM2dwZG0wNFVNWWJjWDRZUEJQVGxSMEtQTjNrd2dPZlJRYXVDeDJw?=
 =?utf-8?B?MEgwWDBOcmVhakNIb2NMUG1Ia294SmdRMEtIQjZ1TTBlK3RheVdTaGdNeHdT?=
 =?utf-8?B?cmRKRHBSL3lpc1FrUFVjbkh6TDUzTlJyQTBFdGhyaW55YlQ0MVJYeUFRU3hy?=
 =?utf-8?B?anc4emtLMXlHMk5XMm1HanJpM0pGbXVMVHBIZEtia2hBYjF0alZOOGhNWWtp?=
 =?utf-8?B?RXBuRmNZV2ZpS25GMXdyTjVFNjZORVJMcXBocnRMN0xwYWVTWHgxQWxtQU91?=
 =?utf-8?B?bFIvRFRxMnViLzI4dEN1WEVxS0hVZVJmOERFanEwWnd2VmpwRmN5Q0lLckFo?=
 =?utf-8?B?MVJ5NGM1bUNFU3phOTY3YU54VENEbStkMVc5bllZUWxCOTh5NkFIL3BydHpp?=
 =?utf-8?B?eklpdXBTN0VKOG1wckVrKzIvamJhNWNoNHc0MWdLb056MnFiWks0V0xMc1Fw?=
 =?utf-8?B?Nk9yZ0tNZXZmekFORlFORmVUUEszSFY5ajJmaWh4OGo3VnJMQlE4U3FpVkZr?=
 =?utf-8?B?SWhibUVybUsreGJJWHhDTVlUMUE0UkNKZzNkZXRoWEYwOHBHTGEzcTBKZXV3?=
 =?utf-8?B?Nk94MWQ4VGo4UEh5NCtmYzNWdVRrRWtvdCsrS3lLMElDaDZtY0YxQXM0VVk4?=
 =?utf-8?B?bDNXT0tiQThJYlBid1ZjWUtzemluQ1hvT1N0dEJRVnZ6U0MxajlqaCt3czQy?=
 =?utf-8?B?eTB2aEoveTdwdlBCeE1aUUFkR0phT3ZyZ2VHUlF5bnZJVy9YVlp6MzJJVDc0?=
 =?utf-8?B?d3ZJR3k1WVcyTXJlYkhrV25NcU9LWStBQXA2bGllNld1enYxaS9PNjVWcXZL?=
 =?utf-8?B?dzBUMG0vUWFYSUNlakxLbkltU0ovODVNdzVDamJKako3STZsc1RKMmhRK0tU?=
 =?utf-8?B?RmFqUlZidnQyMmkrVi9qclpsaFpFSTVzSnowZUMvckwvZkwvL0o5cERDeWlP?=
 =?utf-8?B?OXY2aEkwaUhKTUo3eDdWSXZNcTlFRW1SalRNMjBNazJ4dmZ6MC83amMvK2xT?=
 =?utf-8?Q?GyLgpfTwgIS65qReg9hypdp4t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dc4857-e280-4883-f6c2-08ddf79ef093
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 17:06:57.1789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEBWndFzQewEw459VAsXvf1g/IGF63/JXr5fVRLMm/zSygAbzP5HKSpUTMseVBatoRuGXDmL3nY/TBfsv4oY2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7546
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



On 9/4/25 01:55, Karthik B S wrote:
> Hi Alex,
> 
> On 9/3/2025 10:21 PM, Kamil Konieczny wrote:
>> Hi Alex,
>> On 2025-08-14 at 22:06:45 -0600, Alex Hung wrote:
>>> From: Harry Wentland <harry.wentland@amd.com>
>>>
>>> The function is able to handle any non-planar format. It's been
>>> tested for XRGB8888 and XRGB2101010 so far but should work
>>> for a wider range of formats.
>>>
>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>> ---
>>>   lib/igt_fb.c        |   4 --
>> Please split this patch into lib change and test.
>> Also imho lib change could be squashed into first igt_copy_fb()
>>
>> +cc Karthik
> 
> Yes I agree with both the changes suggested above.

Thanks. I will move changes in igt_fb.c to where igt_copy_fb was introduced.

> 
> Regards,
> Karthik.B.S
>>
>> Regards,
>> Kamil
>>
>>>   tests/kms_colorop.c | 138 +++++++++++++++++++++++++-------------------
>>>   2 files changed, 78 insertions(+), 64 deletions(-)
>>>
>>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>>> index 8c8436e94..b3474781d 100644
>>> --- a/lib/igt_fb.c
>>> +++ b/lib/igt_fb.c
>>> @@ -2182,10 +2182,6 @@ unsigned int igt_copy_fb(int fd, struct igt_fb 
>>> *src, struct igt_fb *fb)
>>>       if (src->num_planes != 1)
>>>           return -EINVAL;
>>> -    /* TODO expand for other formats */
>>> -    if (src->drm_format != DRM_FORMAT_XRGB8888)
>>> -        return -EINVAL;
>>> -
>>>       fb_id = igt_create_fb(fd, src->width, src->height, src- 
>>> >drm_format,
>>>                     src->modifier, fb);
>>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>>> index 77d8c6bfa..7ac74c536 100644
>>> --- a/tests/kms_colorop.c
>>> +++ b/tests/kms_colorop.c
>>> @@ -380,60 +380,28 @@ static void apply_transforms(kms_colorop_t 
>>> *colorops[], igt_fb_t *sw_transform_f
>>>   }
>>>   static void colorop_plane_test(igt_display_t *display,
>>> +                   igt_output_t *output,
>>> +                   igt_plane_t *plane,
>>> +                   igt_fb_t *input_fb,
>>> +                   igt_fb_t *output_fb,
>>>                      __u32 fourcc_in,
>>>                      __u32 fourcc_out,
>>>                      kms_colorop_t *colorops[])
>>>   {
>>>       igt_colorop_t *color_pipeline = NULL;
>>> -    igt_output_t *output;
>>> -    igt_plane_t *plane;
>>> -    igt_fb_t input_fb;
>>>       igt_fb_t sw_transform_fb;
>>> -    igt_fb_t output_fb;
>>> -    drmModeModeInfo mode;
>>> -    unsigned int fb_id;
>>>       igt_crc_t input_crc, output_crc;
>>> +    int res;
>>> -    output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
>>> -    igt_require(output);
>>> -
>>> -    if (output->use_override_mode)
>>> -        memcpy(&mode, &output->override_mode, sizeof(mode));
>>> -    else
>>> -        memcpy(&mode, &output->config.default_mode, sizeof(mode));
>>> -
>>> -    /* create input fb */
>>> -    plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>> -    igt_assert(plane);
>>> -
>>> -    fb_id = igt_create_color_pattern_fb(display->drm_fd,
>>> -                    mode.hdisplay, mode.vdisplay,
>>> -                    fourcc_in, DRM_FORMAT_MOD_LINEAR,
>>> -                    0.2, 0.2, 0.2, &input_fb);
>>> -    igt_assert(fb_id >= 0);
>>> -    igt_plane_set_fb(plane, &input_fb);
>>> -#if DUMP_FBS
>>> -    igt_dump_fb(display, &input_fb, ".", "input");
>>> -#endif
>>> -
>>> -    /* create output fb */
>>> -    fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, 
>>> mode.vdisplay,
>>> -                fourcc_in,
>>> -                igt_fb_mod_to_tiling(0),
>>> -                &output_fb);
>>> -    igt_require(fb_id > 0);
>>> -
>>> -    igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
>>> -
>>> -    igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
>>> +    igt_fb_get_fnv1a_crc(input_fb, &input_crc);
>>>       /* reset color pipeline*/
>>>       set_color_pipeline_bypass(plane);
>>>       /* Commit */
>>> -    igt_plane_set_fb(plane, &input_fb);
>>> -    igt_output_set_writeback_fb(output, &output_fb);
>>> +    igt_plane_set_fb(plane, input_fb);
>>> +    igt_output_set_writeback_fb(output, output_fb);
>>>       igt_display_commit_atomic(output->display,
>>>                   DRM_MODE_ATOMIC_ALLOW_MODESET,
>>> @@ -441,14 +409,15 @@ static void colorop_plane_test(igt_display_t 
>>> *display,
>>>       get_and_wait_out_fence(output);
>>>       /* Compare input and output buffers. They should be equal here. */
>>> -    igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
>>> +    igt_fb_get_fnv1a_crc(output_fb, &output_crc);
>>>       igt_assert_crc_equal(&input_crc, &output_crc);
>>>       /* create sw transformed buffer */
>>> +    res = igt_copy_fb(display->drm_fd, input_fb, &sw_transform_fb);
>>> +    igt_assert_lte(0, res);
>>> -    igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
>>> -    igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
>>> +    igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
>>>       apply_transforms(colorops, &sw_transform_fb);
>>>   #if DUMP_FBS
>>> @@ -469,7 +438,7 @@ static void colorop_plane_test(igt_display_t 
>>> *display,
>>>           set_color_pipeline(display, plane, colorops, color_pipeline);
>>>       }
>>> -    igt_output_set_writeback_fb(output, &output_fb);
>>> +    igt_output_set_writeback_fb(output, output_fb);
>>>       /* commit COLOR_PIPELINE */
>>>       igt_display_commit_atomic(display,
>>> @@ -477,28 +446,24 @@ static void colorop_plane_test(igt_display_t 
>>> *display,
>>>                   NULL);
>>>       get_and_wait_out_fence(output);
>>>   #if DUMP_FBS
>>> -    igt_dump_fb(display, &output_fb, ".", "output");
>>> +    igt_dump_fb(display, output_fb, ".", "output");
>>>   #endif
>>>       /* compare sw transformed and KMS transformed FBs */
>>> -    igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
>>> +    igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
>>>       /* reset color pipeline*/
>>>       set_color_pipeline_bypass(plane);
>>>       /* Commit */
>>> -    igt_plane_set_fb(plane, &input_fb);
>>> -    igt_output_set_writeback_fb(output, &output_fb);
>>> +    igt_plane_set_fb(plane, input_fb);
>>> +    igt_output_set_writeback_fb(output, output_fb);
>>>       igt_display_commit_atomic(output->display,
>>>                   DRM_MODE_ATOMIC_ALLOW_MODESET,
>>>                   NULL);
>>>       get_and_wait_out_fence(output);
>>> -    /* cleanup */
>>> -    detach_crtc(display, output);
>>> -    igt_remove_fb(display->drm_fd, &input_fb);
>>> -    igt_remove_fb(display->drm_fd, &output_fb);
>>>   }
>>>   igt_main
>>> @@ -550,21 +515,74 @@ igt_main
>>>           igt_display_require(&display, display.drm_fd);
>>>           igt_require(display.is_atomic);
>>> -
>>>       }
>>>       for (j = 0; j < ARRAY_SIZE(formats); j++) {
>>> -        for (i = 0; i < ARRAY_SIZE(tests); i++) {
>>> -            igt_describe("Check color ops on a plane");
>>> -            igt_subtest_f("plane-%s-%s", formats[j].name, 
>>> tests[i].name)
>>> -                colorop_plane_test(&display,
>>> -                           formats[j].fourcc_in,
>>> -                           formats[j].fourcc_out,
>>> -                           tests[i].colorops);
>>> +        igt_output_t *output;
>>> +        igt_plane_t *plane;
>>> +        igt_fb_t input_fb, output_fb;
>>> +        unsigned int fb_id;
>>> +        drmModeModeInfo mode;
>>> +
>>> +        igt_subtest_group {
>>> +            igt_fixture {
>>> +                output = kms_writeback_get_output(&display,
>>> +                                  formats[j].fourcc_in,
>>> +                                  formats[j].fourcc_out);
>>> +                igt_require(output);
>>> +
>>> +                if (output->use_override_mode)
>>> +                    memcpy(&mode, &output->override_mode, 
>>> sizeof(mode));
>>> +                else
>>> +                    memcpy(&mode, &output->config.default_mode, 
>>> sizeof(mode));
>>> +
>>> +                /* create input fb */
>>> +                plane = igt_output_get_plane_type(output, 
>>> DRM_PLANE_TYPE_PRIMARY);
>>> +                igt_assert(plane);
>>> +                igt_require(igt_plane_has_prop(plane, 
>>> IGT_PLANE_COLOR_PIPELINE));
>>> +
>>> +                fb_id = igt_create_color_pattern_fb(display.drm_fd,
>>> +                                mode.hdisplay, mode.vdisplay,
>>> +                                formats[j].fourcc_in, 
>>> DRM_FORMAT_MOD_LINEAR,
>>> +                                0.2, 0.2, 0.2, &input_fb);
>>> +                igt_assert(fb_id >= 0);
>>> +                igt_plane_set_fb(plane, &input_fb);
>>> +#if DUMP_FBS
>>> +                igt_dump_fb(&display, &input_fb, ".", "input");
>>> +#endif
>>> +
>>> +                /* create output fb */
>>> +                fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, 
>>> mode.vdisplay,
>>> +                            formats[j].fourcc_in,
>>> +                            igt_fb_mod_to_tiling(0),
>>> +                            &output_fb);
>>> +                igt_require(fb_id > 0);
>>> +            }
>>> +
>>> +            for (i = 0; i < ARRAY_SIZE(tests); i++) {
>>> +                igt_describe("Check color ops on a plane");
>>> +                igt_subtest_f("plane-%s-%s", formats[j].name, 
>>> tests[i].name)
>>> +                    colorop_plane_test(&display,
>>> +                            output,
>>> +                            plane,
>>> +                            &input_fb,
>>> +                            &output_fb,
>>> +                            formats[j].fourcc_in,
>>> +                            formats[j].fourcc_out,
>>> +                            tests[i].colorops);
>>> +            }
>>> +
>>> +            igt_fixture {
>>> +                detach_crtc(&display, output);
>>> +                igt_remove_fb(display.drm_fd, &input_fb);
>>> +                igt_remove_fb(display.drm_fd, &output_fb);
>>> +
>>> +            }
>>>           }
>>>       }
>>>       igt_describe("Tests getting and setting COLOR_PIPELINE property 
>>> on plane");
>>>       igt_fixture {
>>>           igt_display_fini(&display);
>>> +        drm_close_driver(display.drm_fd);
>>>       }
>>>   }
>>> -- 
>>> 2.43.0
>>>

