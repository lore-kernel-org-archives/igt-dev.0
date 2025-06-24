Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52C0C77B7C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 22:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0A410E62E;
	Tue, 24 Jun 2025 22:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XOVoSUV3";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C5110E62E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 22:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqCmO4jAr/bdqTB/RXsUy+1kVaAXlgm03GbQ2sBhQcKpvtEy26xyxraZCdDE4JXW1ix1wIOMe569caKbNLSWfYK226doq7V0zHcxZhBb9z1AMU2o/I4glAP+sK2NqpTLcCnrINXxtr2KLCCTh6rp2vHS7eXllv4e3lbQ9Oo9CBVv/1IgUvu+/npHDWLd0dBguzIgX5yDpVH+kuK0SxmUsnOqjDiNbo5nsqLrnGsRJaTa7Ts0DmbA4llt2rCUnA3iQVJ9nXPBZ3j9022iEZV+pDaqv+HLm/yHXY8gMtIzA90oPC8rpdsxWwJtXe+dZDlI3ZIAyAgimtXycP73ASV+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAC3Fcz135D1wc+Li2u1YaAOLRAr4nhH15GHDQi3PfU=;
 b=lmS+koLU+Hi1LdQk4pm03vpAcmue5grWAwG3Yjencd3KEdrJ5BbWkpcPfUgJ6vagKHh+4xr6aKVBt2Vc8fAD3nLOtbnta5lwATSSYlHk73q68NQ28JwNH6Py8fO3+ZMau/A6pTf90fcjHw2ovcEDM3kHbmJNJucyKPRfiDn1qFFDhNCKyu5IYdi42jEQ685+H2gO5IDjtb+5g4Jzo2C8HV0OmCBMcbqbhveGijpleG/wQuWxdqtwexNgqsYXPqtdBr4bwnlO29Tr4KSTAlT0BoPsYL9E98cTUdDuK/K9rDAYi7wtDyMymomLyNk81TWw9LVtRWYxW/XxRfqoth1rpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAC3Fcz135D1wc+Li2u1YaAOLRAr4nhH15GHDQi3PfU=;
 b=XOVoSUV3Rvq32kOmSaJyTZq2R1BLOK5G5epvAZOMq3NXzruo19/o6aNpIiodtKkygzaFxrknN8KH1SoKrkv01RBh7dxq6Z+q2mhRwlVjG93Mu3eKjIlbDlqNK9iNjKB8doXIV9/c2x/yHWPmuBx1k8cqQSntlDwRZgnFsRdYwWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 22:19:42 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 22:19:41 +0000
Message-ID: <56dace0e-fb8c-45eb-ac5e-3fde3401207c@amd.com>
Date: Tue, 24 Jun 2025 16:19:39 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][V2] lib/igt_kms: Move get_writeback_formats_blob to lib
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, harry.wentland@amd.com,
 Karthik B S <karthik.b.s@intel.com>
References: <20250623181440.462861-1-alex.hung@amd.com>
 <20250624133106.s2lppebjpbc5grg6@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250624133106.s2lppebjpbc5grg6@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:303:dc::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8e2862-0991-4adb-3713-08ddb36d36f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmFSNWVMZjdQeko3c0pjNE5wYnpSalpSajBuMzZMVHdGY24yelI5T0toaGxq?=
 =?utf-8?B?U05GM2dWSzlZZ3RCbHlKMER1cTdMU2hwUWdxVnZZN1ZwTGdTVUY0ZjZYY3ZW?=
 =?utf-8?B?UmhDRmZZSW5LMFJWeUlLcmtKc25od2VFSTV0N05DT2NhaGFPTTNuSHBTenhT?=
 =?utf-8?B?SkluTmd1bnhyQlZZZmZIeHlwU2pncC9ocGlMVytjNkV3ZzFmczNZWkpkeGQ5?=
 =?utf-8?B?dXhWcVpXbkYyK0pBMGp6QWRCR2lSckx0cVhIL05RSUxwS3U5V2t5TC9kbWw1?=
 =?utf-8?B?QWl2eXVPcEpxMFV3eGVVSXd3UGkvOUwwRU1zQlBjZXFqYkZiZENuYW5ZLzF6?=
 =?utf-8?B?Ujk3eE14QlRBNlBhTGUvc0ZTMGl2ekhlUG9QK3krY2hXQTJPcFJhbEpVK1lz?=
 =?utf-8?B?Z0dkeEZORFI2b0I4MkJpeElXZmtQSHdxQXdkOE9zM09OTm03aEZDSEVPT1Uz?=
 =?utf-8?B?emtLVmVWbldwME9lQkZsWDNodHhBOEcrelFRTHY2SE5hd3RKTEpTNnRoMDhV?=
 =?utf-8?B?SjYxRUFzQkhVNktjNkNGeWtiQk5vZnBtemowMnVGU3JnZDhraENRYkxvSlBZ?=
 =?utf-8?B?amtHKzhtVnFTNnQ5Q3UzcFFrQ1VRMGVLamYrN25tVTNVeVl4Q0RGT2dkcWNy?=
 =?utf-8?B?T3FqOGJNUmxqaGlyN2JhUnlHempFV0sxcEZMMytjNENaWkRyVElzeTc2QUYz?=
 =?utf-8?B?cGRST2I1U2MrQTRYcmZkMHVxOFJqMjQ3bkdkN1hzRUpzdkplN1Jrb0tUWEZB?=
 =?utf-8?B?ekIwY054MERYSDVjV25kTWVNdEFiejNNcnJxU094aFUxUlZFeWxPZHRvNmR6?=
 =?utf-8?B?MnMwRlRDR3lPYitYQVN4WVd5eFZoRzNQQkRHdmEwcVgrUENMSVpCWWtNMUpq?=
 =?utf-8?B?ZWtUT2VQZTJaMkszUXc2aTdJSldOa1lyZld5NmQ3RHdWNFBEZkZSUVlyZnQw?=
 =?utf-8?B?b0FCaW5TdXVWMnQ3ZGZWREZ1MndSRDc1ejI0ZTN2ekZseXdjM20wcG1pei81?=
 =?utf-8?B?V0lsWGhCMklFVi80R1RQQmlGNXBMNEZ3MTBUV3B5OVE2WXVmNFFVL3ZEa2NH?=
 =?utf-8?B?ek5OeDNQM09CRGRVUzJBaVRjUjYwR0pnODNRUDkvV1ZVVGgvQmhaV01tNytL?=
 =?utf-8?B?RkZpc0NraXhOa1hOWWdsVlpYUU9ONGRzb3g5a2t6bEQ0ZG1pQ1lsNFdyR2U2?=
 =?utf-8?B?bjFNaXNPdkUxWkZoR3VabFEyYWN1aGdOZy9Ibk94cHV3WHVEa0R3bVA0STEx?=
 =?utf-8?B?T1FnVk9scGNZVVBFT1luNkF4OVJqSEFzVlltbkFzVE5tbkpaYUJ1bEFMaGV3?=
 =?utf-8?B?SG1hWlBpeVpIbzRIRkRmcE5NRTRBTGs3OUhabTIrVXFRQWhzcjVZQXZMU3Y1?=
 =?utf-8?B?LzlNL1pBWVZsUUlnMmRQQVU5ZCtab05EcVVtdWV3eERxMG1HaC9saTBjSmJO?=
 =?utf-8?B?NkVaUXFUS0NFcTQ2blNSWDNtMW91anFYVW1HMjRqWGkxeEdtYzlqa2xZdmlo?=
 =?utf-8?B?RFlUK0x3b0NGTThhT09zK2lFemw0dGhXSmtWdFJLem9vVjJUR3hXbGJGR0hT?=
 =?utf-8?B?S05nWmdJZlhITTEyOGt0YWVvQWdzY3ZXTmx1YmtXeW9udG15OGpsM2xISzdH?=
 =?utf-8?B?NFduU3VDYlJxenZGNmFvWDV4ZnNnaUYzb2pUL0RFVk4remJUbDVpN2h1eG5V?=
 =?utf-8?B?R3NDTzRiMS92ZWxvMDdML2R1M1p4ZGpxZGFXQ1lNaVJIMTNPbk5EQ2xLZHBm?=
 =?utf-8?B?Zm51cHhURHA2MDZodWJDNlBhaGw5QjY1TW5jVnpxUk9IekN2S3ZzUVE3U2or?=
 =?utf-8?B?SmtlNjZsN0VDNitFY3MzYlliRTNpNVVNNStIdkJ5aEJGUzBMY1B0Vm0xKzhz?=
 =?utf-8?B?eXpCQXhpV3NCT0YvVGlrVDg4cnMrYWhpcGJtNEVLeXprQk11MCswS0tZUlNu?=
 =?utf-8?Q?HLRd1n9+uiE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDdOaTc1RWFSSzVRSVlPa1NEUW0zSE1FeXpyUEQybUQ1N3haZEJqcUdMT2Mx?=
 =?utf-8?B?R2NENGtZYytsRVJ5RnVtR01HZlJ5Q2tTd2haL1VDUE4rdkJHeFVLcUdSL0Jr?=
 =?utf-8?B?dWtWaGVhRk1sK0RCaFUyZEplcmtyNElleXJPL3NQek82bmtQSmo0elBWb3hO?=
 =?utf-8?B?T24zcWdleVFVbzVIeExYTHpVejIxeVgrV0pYeUJ6aWwrLy9pUmVTeCtoR0pZ?=
 =?utf-8?B?OVVZNFAwL1QwMTJrNG1zc1lUVXBWa24vVkJlRUYra2FqMEJ4S1Z3SEYyVWRx?=
 =?utf-8?B?Wmkzcm9RYVlPK21obWxTRG9reVorZUFxNDl5YUdoK0tlcnBLQklvTzZBOGZY?=
 =?utf-8?B?WmVNU0xxYlcwbk5uWjY4TUhEQ0Q3bnZIeDJNWENMZERNaDZTWXp0M0kvNHNG?=
 =?utf-8?B?U3JnT2JTdmYzbzluYlRDQTFJTlZWa21jcFVaam90eVFJbUFRWWU1TGNISElr?=
 =?utf-8?B?L1l2dTRoUVdJM29odW10aCtreHZSd0MwQ1JRdDJOMndsaURvOHluS2RlNHN2?=
 =?utf-8?B?NDQvK1E1RUtjUVdETkt0NFNYZUlZOVVITzRYS1lYUzZsRWxhUkVLeXVaMU5Y?=
 =?utf-8?B?NEswQ2dpVUU1c3R5UndrRlhlT1FWaERyY09OOU16SE8vYlQ2YmpLeEFaOVVZ?=
 =?utf-8?B?VDRNUVZpTGZRd0pkYVZUSHRlUXlpOS80dzRyTlpUQTc0c1NQWkJWVlgvdjdo?=
 =?utf-8?B?OVg1V1R5OEpvR3ZnS1BmL1hJK2tPRnlXaUJVMWxuRGxXcjZqcTZFQVBRbEhy?=
 =?utf-8?B?RmttOVRRMlF4amxNcWtlWVBDa1RxVDM1bkc4YzhYZGMzV3BtS0FudnZ2Rytn?=
 =?utf-8?B?Q2JueFArd2U3SlIxVlVaMmtZbGh5OGpMeTVUL25jc3ZFbWl5QTBLUFVKcGV6?=
 =?utf-8?B?Rk5rYjMyWXl5YlJqOVY3N0xsbXJoV3poaVdwNG53ZzZMT0VmNmFHNElleHky?=
 =?utf-8?B?Ym9mbVd0ZHcvVTN4QU5xL2ttMXdGbFFWZ3FZdW9qS0Z3TXRlV1dYMmI0MnhV?=
 =?utf-8?B?MXBRMGt3OVE2eHFmaFZITGNzcGxTYTk1QjNQelByZ3BSQ2ZjcFBnWEhPVm1Z?=
 =?utf-8?B?dWx3T09WMlRzUTBpRVFRSEtWcHR1Sm41YzVyd0RNd1V1cjBZc1lSOEkydWlO?=
 =?utf-8?B?YWh3UlFEN0xPazZhYUV0V3ZQQ3N5KzVWcm5ycEhHYmh4YytuOUtseVRHK0tr?=
 =?utf-8?B?SDJndCtPM05PaTJGQnBwdUFUSmdScE9QT3EvODZFbTNuUVdFbVdTT3R3Mm9N?=
 =?utf-8?B?bnJaVHNWTGZZdFoyZlFSZnplTVJqdUFUME1IckFCNmNjY2FOYTZxNjBZYWFu?=
 =?utf-8?B?b0l5VzFBc1dBVlgrbVMvR1BJU3c0VFhSS3c2TWtVcEwybmt1bHdLbzJJVk5p?=
 =?utf-8?B?MXhraHNqV2VqcjNzRW1QdDNDSmd4U2RVQWp6c1Z4MXNuOGNyNXJSNk1Lb1lm?=
 =?utf-8?B?K0srbHlsU2xFSGUvSWJGbWtsVWt2SzdFRkhDNGtDWVpTNTlVR2dGRng4N3A2?=
 =?utf-8?B?ODdOc2NrdGN5Qm9pNXc5M3gxUkNqS1loQitxMzNuWW1YMzZZQ24xWWJXUkFC?=
 =?utf-8?B?bmMyWFlKN3lpNVNwaUVLaFh0TGZ3K1BqR0NGNE1xYW43WGRGZStIdnUzRllq?=
 =?utf-8?B?bFRuZUtsWEw5L2xJbmFiYUdkRURYNWc4VnJIVlp5bk0zQjU5N2VFK1dndWRr?=
 =?utf-8?B?TXdRREcvb29kcE5QVUhlZWh2YVFBVEkxaUhQSTEwWkFkRUJnUVRBamxhU0Ny?=
 =?utf-8?B?TVVvR0ptQ2NtMjhoanFQbGIrb2FLS3pOeWMrazI0T2JLYWkxMDBvMEJuNGJC?=
 =?utf-8?B?VTErTkVXRUhtTjNKSkUxaUxITDNWVlJJK0hFbmh5dVd0TFpTaHNlUEF4NkJj?=
 =?utf-8?B?ZHRmT0RzSFIzV1lURWVLdFRPODRHTTBJZnY1Rk5IQXdSOWZwRllFaGdEK1o2?=
 =?utf-8?B?MjRkZVp2U1RFZ3ZnbTFBR2pXV0tDbENuMUxpUkRFcmZzYXphU0N6REVxaUVB?=
 =?utf-8?B?eXhTNi93MTN0UmR4SVdCRDJNZUhqUkppSlhVY09Wd25NTk1Nd3k1TXdKekti?=
 =?utf-8?B?QVcrZkhVNDB2c2ppK0Z0UTk3ZVoyMG1wRm1uS0Uvem1Rb1MwSnllaFZuS01R?=
 =?utf-8?Q?OAw7XIME/FLDpMUaazETtIrnX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8e2862-0991-4adb-3713-08ddb36d36f5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 22:19:41.3679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvPgqUeKbr/gqDKkxTfcsxOkfDL0kZhx/QFVHrRJVYu1XQrawtt9C+CMv/u5u8EK9cGXLWZGDCg57qtsgvIahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529
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



On 6/24/25 07:31, Kamil Konieczny wrote:
> Hi Alex,
> On 2025-06-23 at 12:14:40 -0600, Alex Hung wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> This function can be used by other tests that need writeback. A prefix
>> "igt_" is also added to the function name.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   lib/igt_kms.c         | 25 +++++++++++++++++++++++++
>>   lib/igt_kms.h         |  2 ++
>>   tests/kms_writeback.c | 21 +--------------------
>>   3 files changed, 28 insertions(+), 20 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 9ee03e870..085c3f430 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -7472,3 +7472,28 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>>   
>>   	return 0;
>>   }
>> +
>> +/**
>> + * igt_get_writeback_formats_blob:
>> + * @output: Target output
>> + *
>> + * get supported formats from the writeback connector
> 
> Document here when this could assert (or not)
> also document when return value could be NULL

Updated in V3

> 
>> + */
>> +drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)
>> +{
>> +	drmModePropertyBlobRes *blob = NULL;
>> +	uint64_t blob_id;
>> +	int ret;
>> +
>> +	ret = kmstest_get_property(output->display->drm_fd,
>> +				   output->config.connector->connector_id,
>> +				   DRM_MODE_OBJECT_CONNECTOR,
>> +				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
>> +				   NULL, &blob_id, NULL);
>> +	if (ret)
>> +		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
>> +
>> +	igt_assert(blob);
> 
> Please remove assert from here, or at least move it iside 'if':
> 
> 	if (ret) {
> 		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
> 		igt_assert(blob);
> 	}
> 
> Or provide second function __igt_get_writeback_formats_blob
> without any asserts, see note about writing library functions
> in CONTRIBUTING.md

igt_assert is removed in V3. Thanks.

> 
> Or it could be merged as is now and improved later on?
> +cc Karthik
> 
> Cc: Karthik B S <karthik.b.s@intel.com>>
> Regards,
> Kamil
> 
>> +
>> +	return blob;
>> +}
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index a85fee515..09d7d4414 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1281,4 +1281,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>>   int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>>   int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>>   
>> +drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
>> +
>>   #endif /* __IGT_KMS_H__ */
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index 8765fda34..86afed509 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -92,25 +92,6 @@ enum {
>>   	XRGB2101010 = 1 << 1,
>>   };
>>   
>> -static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
>> -{
>> -	drmModePropertyBlobRes *blob = NULL;
>> -	uint64_t blob_id;
>> -	int ret;
>> -
>> -	ret = kmstest_get_property(output->display->drm_fd,
>> -				   output->config.connector->connector_id,
>> -				   DRM_MODE_OBJECT_CONNECTOR,
>> -				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
>> -				   NULL, &blob_id, NULL);
>> -	if (ret)
>> -		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
>> -
>> -	igt_assert(blob);
>> -
>> -	return blob;
>> -}
>> -
>>   static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>>   				    drmModeModeInfo override_mode)
>>   {
>> @@ -621,7 +602,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>>   		const char *valid_chars;
>>   
>>   		igt_skip_on(data.dump_check || data.list_modes);
>> -		formats_blob = get_writeback_formats_blob(output);
>> +		formats_blob = igt_get_writeback_formats_blob(output);
>>   		valid_chars = "01234568 ABCGNRUVXY";
>>   
>>   		/*
>> -- 
>> 2.43.0
>>

