Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16086CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 08:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC47810EF79;
	Wed, 20 May 2026 08:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qy4b4Wpy";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010029.outbound.protection.outlook.com
 [40.93.198.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D3910EF79
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 08:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQytWjCYeYQ9NJPjX1Um+Aydg6y87TnPleBe+fw5snL4obuw8ddG1DosbFPYmDJfJBtTZRqc6+M7Z4JMkLxiWDgEVpuZpryo9BNSDPZA+gypalqjEEVH+TvzKzUKge91q02AO9zeIN8uX70Ru3bKt3Lnf0emI5qLjx7ZpwROGXGHaN9oTUvpD3Cm2SNz4gAnwqqMSQ5mWu3HZGJEY4Uwf12U3pbd1rJ6reXou55hPCs0nT02dJefb/cIVrrVDVehKOKvpgRvcZWWQ6xNDDLcSIGwNdmccVdc1O5ZmNs0cuVRUbvEiJ8yLIl7YcW7/rFJKKdz4QL/Ow+f8gb35Cocug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPE3JfJ69SZ35ViZOqoENuic0ZKAgRtOhqnHlBQgoZQ=;
 b=FCjZV76tFhctkA4gvAL4IkMmqcH/NuQEBDapF6g4bIMcjJBYcqtinW5XDDD1hIkDfI9EfM0PG73B8828JmoDNdcETG1u4KbDHq1QpEf9rvv1n4NTq2zEUcop60CcEcaJMzxh9VRBa48qO7lrkzCR9xGOQOIwARcPEAhW0f0AjuRmf6i/odbKSMOO5WAykSiMKzLP1s0+3TjIk9VsPgAGa5Wx5ZgP80WXTu4oH6xH7IcEZU4EjxHW6GRGHeO4yBgS8Fncnvp+B0gzuBYpEwrrHPbK4krVNz5jgrt+vyTLC2V68g/QTaUjDsBlEL+Vn5Rurg6I4NKR6Wl7TnFkO78Yrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPE3JfJ69SZ35ViZOqoENuic0ZKAgRtOhqnHlBQgoZQ=;
 b=Qy4b4WpytjLfnkBmKvwnfscXCiUTY/mZWAev4vXJm20p5EbDXpRZfQtjqzSIeHcocITX0E/jkz1DvZro2q0QmGBMGSEJ35pR04XK9jmU54LW+p/LH9Z1m8wrJHEK5rNsxw09nUSaNcfAUWP2W+jpNcXs3naWgriA9RiPWilft3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5108.namprd12.prod.outlook.com (2603:10b6:610:bf::6)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 08:30:33 +0000
Received: from CH0PR12MB5108.namprd12.prod.outlook.com
 ([fe80::8403:dbac:360:bc4c]) by CH0PR12MB5108.namprd12.prod.outlook.com
 ([fe80::8403:dbac:360:bc4c%6]) with mapi id 15.21.0048.016; Wed, 20 May 2026
 08:30:32 +0000
Message-ID: <74a0b74f-1c8f-4a99-b664-58009763e943@amd.com>
Date: Wed, 20 May 2026 16:30:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/amdgpu/vpe: refactor VPE1 blit test
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 vitaly.prosyak@amd.com, jesse.zhang@amd.com
Cc: Solomon.Chiu@amd.com, Peyton.Lee@amd.com, HaoPing.Liu@amd.com,
 Yu.Wang4@amd.com
References: <20260520073320.14656-1-chih-wei.chien@amd.com>
 <20260520073320.14656-4-chih-wei.chien@amd.com>
 <666767d95d982b77158724018ae5d2e830e09153@intel.com>
Content-Language: en-US
From: Caden Chien <chih-wei.chien@amd.com>
In-Reply-To: <666767d95d982b77158724018ae5d2e830e09153@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To CH0PR12MB5108.namprd12.prod.outlook.com
 (2603:10b6:610:bf::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5108:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 9477ebfe-822d-4747-bbf2-08deb64a0ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|20052099010|4143699003|3023799007|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 6Z3n2/36ejrywDFSOvdoNRWozBl4Ylcuryq+uvVgH7mfauQL9xUmyzpA4Jf5+FxO9Uy0aIjJRupKcE5ixECIYBaD/x/nyd1ZIFnhJeChZSLQKL1QbNHSBr/12FZ7EubWbyS0KkPw2AW/Wfm/1MsczTZR5bI0K6qXSqg480nDsJ9MS0zKG+EFJT2VwC27v+/SFoJgoLJd3XoH2CUHYMYTZNCDbbYpYGgjKByzI94wNS/G8WjeLSOUrcswXlQFOgBLyYr0rveOxEBX/lh8iab4P6kNyjYOAq8SXD4vwpTVRjiRy0iGbMKYZQZdAhfilQlCFqtPoe8g/WE7n06jhy9zubJrPEBpAzCoiSqImvQkG3aj04jdSLQMuL1+5rFo+aHYdDHcEl69KHWwcbDmEd9Z6A8jFkC5047TcfigPWresrKpR7pikBQtk9Nw/YhfIkNY3RhfB+kZ7Hxl6cPWWRRaxgCnGsiRCYWy+Pi9hNlMe2okYl/qnfYH9D3ovVavh0WfuPc/rv8pJ1ADInSWRTEyEoEU7LwZJo/e64YCG22AS6DNd79D8u06beRphTG9bCzx5OkCLSwSsOy7yado6FFhFNn6CQ2p6qkEihvQayWirg3MPk7JNA8yriiyoVYQLNRabv0uKQYBxlyGGgYQTJgUt2I+6/OK8oMTWe2bSy3UH3fZzEt3NkZzDe2ZBOm50loF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5108.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(20052099010)(4143699003)(3023799007)(56012099003)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXdKRW5CdXMvYndEVkcrWDhJSlFGWDdzZGk0WUhZOU4zMHJvTnhPYllaUmJP?=
 =?utf-8?B?S2l3eXNtcnd0SFlOVkhQWENCNkcrS21JSXM0TGxPTVlIcWRhdllaWU5aNnNN?=
 =?utf-8?B?cG1JRGd4Y25ybVViZXRERXUzMnAySzVQMmxuNVliVVhTd3NjYWJhYzdhL0Zo?=
 =?utf-8?B?SDBKRTlDNndlcE9hekVzOTRIVXA1YmJlTG9Od0VPMXpITTVlN0JzZ0w5MVBo?=
 =?utf-8?B?YnljeFU4WUgxMTQrVGFYeERwOHpaTnVub1FYakxhUHd4b05XUkFSZFF1a0Zo?=
 =?utf-8?B?b2ZvemxsNmIvMXZzT05jWHRlM0xROFVCWi9NT1crM1c0b3hsd0J2M3NHRXBn?=
 =?utf-8?B?RnV4QXY3TmJCQTZGRlBscm1kY1MwdDVBMHl4S3dDWTNLelBFTjc1RWRtSnJM?=
 =?utf-8?B?SU9pVURXeU0xcDVGMTgxZTZGdFVSM0w0bnc1RnNLTHYwZVNJUStkRSt3SFRt?=
 =?utf-8?B?NlRRUXpaNVN0YlMxRU5SOThvekRyZlAyVFJxa2xsR0QvMDZyTlpER2NmWUxK?=
 =?utf-8?B?aElRQXU4Qnl6YXBqaXlURG5QU3haSU1DQ21VMENXbGNNNFVTMkg4bERnTGFC?=
 =?utf-8?B?Vy9sR2Z6TW9HSlN1MmxkbEZYQXhNYTJNZWQ2Y2sxUEpXcVRxRG82Vk42aTFk?=
 =?utf-8?B?WGVVdTRIRFYzL1plNnkzeUkyNnNEUEpUVkRwUXBuTFJnVlo0dFdrLysyUVk3?=
 =?utf-8?B?d0ZHMXJZd1A4eDBBWDFJcUNKNmxVbStWQ1p1SmdZZXJoZnhNaStBT2hGWTk4?=
 =?utf-8?B?alVaWit5YVVjakx1NXBNWVduK0JsWHdHd25DMWxtNXlsT2NLbHBDampaWlRF?=
 =?utf-8?B?bGFYK1J3MHd1N1RLUGQyejY2V3FXVXdIdGkycm4yMkJ2VEFYZDBVWnUwY1ZK?=
 =?utf-8?B?eVIxcFhydSszOXZIZ2hkK051ajIvOWxJRFd1NnRDMmwxc3RvanZJc0NIakQw?=
 =?utf-8?B?bGlYVzhWYmxPdXhSeEJGTEVxaklTLzliVk40QmJVR1hwTllZYllYQnppMXdu?=
 =?utf-8?B?SW5GaSsyekI2L2krc3FianhrVHNzdVdMUGJGOXRIRWJiQXpFdWttU0FUeE5J?=
 =?utf-8?B?Y0VoOVRVUG9QUGN1OFN2dzVUZG5hM2ZydytGUlBqUXdYRTczQUdkVEErMEJi?=
 =?utf-8?B?clAzSUEvTDdHZ0RKZlBsOGl4MFg1RElwNmRWKzhiSHBUeElwVXg2Y2FwaG53?=
 =?utf-8?B?M3Y3OW9rcmVyWm5IM24zNW9mR1h2OVppY1ZCZVl5Z2ttcmhFNmVsYlh3MFcr?=
 =?utf-8?B?MFF3NnpnWTV3bnkwZ0VlL21QSU5ZNHBxendMMHF2Qkd2L0c3b011YVk4bVoy?=
 =?utf-8?B?S1ROMFlSeXJFVDBGUkhGOGZ6VEdOaVJvRXplTGVaU01WZjV1c1lBd3IvQ2Iz?=
 =?utf-8?B?VzI3TDlwejFMK3BiTVd4clg4Qkh6ZVkvYmZBWkNhNTN4Qi9FTnJGd0NYb0xV?=
 =?utf-8?B?UjV6MXc2bUVyZEJvTlRQcVI3OVQwT25IMlpBUDNCdExBVGYvMlgzNVFoTFF0?=
 =?utf-8?B?YlFFWVdyYXIxczgrUkZES0pPUlNycmVRMkFPbExmUkFiU3o1aE13ay9FUUZh?=
 =?utf-8?B?eXV4aEVBSXErNllpaURFVlhkaXIwbnFMV3ZKdzhKWkFMUXFUMGh1V0szcDRH?=
 =?utf-8?B?UjV6OEMxY1IxbDlCbUFhRWVBMDNRTFJoR1dEREErNDRUcTZXWDltWjZuTjht?=
 =?utf-8?B?ekhHa1lPVmZCMkJ1OVphcDdtUkhUYWN2YWNxSkZrUTQrNkxLNHhlNWRVZmh4?=
 =?utf-8?B?MC9RRXdpUWJxM2J1NHo0cnhhdkw2SmphTW9wR2lCemZxdjZzMjF5UjFvQVNZ?=
 =?utf-8?B?L0l0RnJ3YWhMNDJucExDUE9WdmVCQitTMWdrdjNrZkVlY1VVdlJpTWplNVBW?=
 =?utf-8?B?azJ1UEdjQlhLTjVvcE5scXNQYkZ1YVVXTS91WjhRRmF3bG9JMG1hT2x4TldP?=
 =?utf-8?B?dVJuWHhUdVZYYWE0eExmd21Pam5iVVdGbXhhZklnZytwZnVDQ1VvVExLbENl?=
 =?utf-8?B?a3JHRm0xcUxOeGpFaURjRS96WFBES25pUko1NmxBa1dhSnZVZENsdG1Ib2Vp?=
 =?utf-8?B?Q3lSa0JxbW1XVUpZWVhTTFJTRml0dnMxaGNuMEtzS0cyK2Z2c2JtQnY5RFZY?=
 =?utf-8?B?OXlBL0RUNGR6Mjd3T3pyVHFqOW8vOSsxczlNRzEybzQxVkdoWXJMclc1c2N3?=
 =?utf-8?B?eENVbDdLVHFFVGgyYXdtaFQ1aXF5WDJQQlRqVGttZE8wanpTWFFycWxkMUpv?=
 =?utf-8?B?Q1FpTU9UblhXNjBjd293eXZiWk5KdE9FZDNjU3RWZXZvZmZKbndzUzRYV2hU?=
 =?utf-8?B?U2NUYmJ4NGtQVklQMWFZL3lKWEp4UzJCMG5SSDRJb3ptZEdOSEx4UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9477ebfe-822d-4747-bbf2-08deb64a0ed0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:30:32.7230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfvM605Sn64bJPrBoRzvgeiZQ33NMbh29kGxRroD193NW4wests1hWifs9P8U8viDY4bzs4+S50EYvvPKlRgcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497
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

On 5/20/2026 3:55 PM, Jani Nikula wrote:
> On Wed, 20 May 2026, Caden Chien <chih-wei.chien@amd.com> wrote:
>> Commands are moved to new header file to clean up source file. New
>> commands added in the future will follow the same way, so source file
>> won't be flooded with commands.
>>
>> Frame size setup is moved into test case to be per test case, instead of
>> global, as more tests will be added in the future. Variable naming are
>> revised to align with coding style guide and be consistent with VPE2 blit
>> test.
>>
>> Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
>> ---
>>   tests/amdgpu/amd_vpe.c | 88 ++++++++++++++----------------------------
>>   tests/amdgpu/amd_vpe.h | 36 +++++++++++++++++
>>   2 files changed, 65 insertions(+), 59 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
>> index d5b9f403e..3a1eab9fc 100644
>> --- a/tests/amdgpu/amd_vpe.c
>> +++ b/tests/amdgpu/amd_vpe.c
>> @@ -14,41 +14,6 @@ IGT_TEST_DESCRIPTION("Test VPE functionality");
>>   
>>   #define MAX_RESOURCES		16
>>   
>> -#define PLANE_WIDTH		1024
>> -#define PLANE_HEIGHT		256
>> -#define PLANE_SIZE		(PLANE_WIDTH*PLANE_HEIGHT*4)
>> -
>> -#define SRC_PLANE_PATTERN	0x12345678
>> -#define DST_PLANE_PATTERN	0xff123456
>> -
>> -static uint32_t vpe_descriptor[] = {
>> -0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
>> -0x33002384, 0xff000021, 0x330023c0, 0xff000021,
>> -};
>> -
>> -static uint32_t vpe_config[] = {
>> -0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
>> -0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
>> -0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
>> -0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
>> -0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
>> -0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
>> -0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
>> -0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
>> -0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
>> -0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
>> -0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
>> -0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
>> -0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
>> -0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
>> -0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
>> -0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
>> -0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
>> -0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
>> -0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
>> -0x0004aad4, 0x00000013,
>> -};
>> -
>>   static bool is_vpe_tests_enabled(amdgpu_device_handle device_handle,
>>   		struct mmd_shared_context *shared_context)
>>   {
>> @@ -179,17 +144,22 @@ static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
>>   static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>>   				struct mmd_context *context)
>>   {
>> -	const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
>> -	struct amdgpu_mmd_bo vpe_config_bo, src_plane_bo, dst_plane_bo;
>>   	int r;
>> +	uint32_t frame_size;
>> +	struct amdgpu_mmd_bo vpep_cmd_bo, src_plane_bo, dst_plane_bo;
>> +	/* same height and pitch for input and output */
>> +	const uint32_t height = 256;
>> +	const uint32_t pitch = 1024;
>> +	const uint32_t vpep_config_offsets[] = { 0x34, 0x128, 0x184, 0x1c0, };
>>   
>> +	frame_size = pitch * height * 4;
>>   	context->num_resources = 0;
>>   
>> -	alloc_resource(device_handle, &vpe_config_bo, sizeof(vpe_config), AMDGPU_GEM_DOMAIN_GTT);
>> -	alloc_resource(device_handle, &src_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
>> -	alloc_resource(device_handle, &dst_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
>> +	alloc_resource(device_handle, &vpep_cmd_bo, sizeof(vpep_csc_cmd), AMDGPU_GEM_DOMAIN_GTT);
>> +	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
>> +	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
>>   
>> -	r = amdgpu_bo_cpu_map(vpe_config_bo.handle, (void **)&vpe_config_bo.ptr);
>> +	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
>>   	igt_assert_eq(r, 0);
>>   
>>   	r = amdgpu_bo_cpu_map(src_plane_bo.handle, (void **)&src_plane_bo.ptr);
>> @@ -198,45 +168,45 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>>   	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
>>   	igt_assert_eq(r, 0);
>>   
>> -	context->resources[context->num_resources++] = vpe_config_bo.handle;
>> +	context->resources[context->num_resources++] = vpep_cmd_bo.handle;
>>   	context->resources[context->num_resources++] = src_plane_bo.handle;
>>   	context->resources[context->num_resources++] = dst_plane_bo.handle;
>>   
>>   	// plane config gpu addr
>> -	*(uint64_t *)(vpe_descriptor + 1) = vpe_config_bo.addr;
>> +	*(uint64_t *)(vpec_csc_cmd + 1) = vpep_cmd_bo.addr;
>>   	// vpep config0 gpu addr
>> -	*(uint64_t *)(vpe_descriptor + 4) = vpe_config_bo.addr + vpep_config_offsets[0];
>> +	*(uint64_t *)(vpec_csc_cmd + 4) = vpep_cmd_bo.addr + vpep_config_offsets[0];
>>   	// vpep config1 gpu addr
>> -	*(uint64_t *)(vpe_descriptor + 6) = vpe_config_bo.addr + vpep_config_offsets[1];
>> +	*(uint64_t *)(vpec_csc_cmd + 6) = vpep_cmd_bo.addr + vpep_config_offsets[1];
>>   	// vpep config2 gpu addr
>> -	*(uint64_t *)(vpe_descriptor + 8) = vpe_config_bo.addr + vpep_config_offsets[2];
>> +	*(uint64_t *)(vpec_csc_cmd + 8) = vpep_cmd_bo.addr + vpep_config_offsets[2];
>>   	// vpep config3 gpu addr
>> -	*(uint64_t *)(vpe_descriptor + 10) = vpe_config_bo.addr + vpep_config_offsets[3];
>> +	*(uint64_t *)(vpec_csc_cmd + 10) = vpep_cmd_bo.addr + vpep_config_offsets[3];
>>   
>> -	memset(src_plane_bo.ptr, 0, PLANE_SIZE);
>> -	memset(dst_plane_bo.ptr, 0, PLANE_SIZE);
>> -	create_rgba8888(src_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
>> +	memset(src_plane_bo.ptr, 0, frame_size);
>> +	memset(dst_plane_bo.ptr, 0, frame_size);
>> +	create_rgba8888(src_plane_bo.ptr, pitch, height);
>>   
>>   	/* gpu address of src */
>> -	*(uint64_t *)(vpe_config + 2) = src_plane_bo.addr;
>> +	*(uint64_t *)(vpep_csc_cmd + 2) = src_plane_bo.addr;
>>   	/* gpu address of dst */
>> -	*(uint64_t *)(vpe_config + 8) = dst_plane_bo.addr;
>> +	*(uint64_t *)(vpep_csc_cmd + 8) = dst_plane_bo.addr;
>>   
>> -	memset(vpe_config_bo.ptr, 0, sizeof(vpe_config));
>> -	memcpy(vpe_config_bo.ptr, vpe_config, sizeof(vpe_config));
>> +	memset(vpep_cmd_bo.ptr, 0, sizeof(vpep_csc_cmd));
>> +	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, sizeof(vpep_csc_cmd));
>>   
>>   	memset(context->ib_cpu, 0, IB_SIZE);
>> -	memcpy(context->ib_cpu, vpe_descriptor, sizeof(vpe_descriptor));
>> +	memcpy(context->ib_cpu, vpec_csc_cmd, sizeof(vpec_csc_cmd));
>>   
>>   	context->resources[context->num_resources++] = context->ib_handle;
>>   
>> -	r = submit(device_handle, context, sizeof(vpe_descriptor)/4, AMDGPU_HW_IP_VPE);
>> +	r = submit(device_handle, context, sizeof(vpec_csc_cmd) / 4, AMDGPU_HW_IP_VPE);
>>   	igt_assert_eq(r, 0);
>>   
>> -	r = check_argb8888(dst_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
>> +	r = check_argb8888(dst_plane_bo.ptr, pitch, height);
>>   	igt_assert_eq(r, 0);
>>   
>> -	r = amdgpu_bo_cpu_unmap(vpe_config_bo.handle);
>> +	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
>>   	igt_assert_eq(r, 0);
>>   
>>   	r = amdgpu_bo_cpu_unmap(src_plane_bo.handle);
>> @@ -245,7 +215,7 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>>   	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
>>   	igt_assert_eq(r, 0);
>>   
>> -	free_resource(&vpe_config_bo);
>> +	free_resource(&vpep_cmd_bo);
>>   	free_resource(&src_plane_bo);
>>   	free_resource(&dst_plane_bo);
>>   }
>> diff --git a/tests/amdgpu/amd_vpe.h b/tests/amdgpu/amd_vpe.h
>> index 86ad57d14..767750db0 100644
>> --- a/tests/amdgpu/amd_vpe.h
>> +++ b/tests/amdgpu/amd_vpe.h
>> @@ -8,6 +8,42 @@
>>   
>>   #include <amdgpu.h>
>>   
>> +/* color space conversion commands
>> + * source:      1024(pitch 1024) x 256 RGBA
>> + * destination: 1024(pitch 1024) x 256 ARGB
>> + */
>> +
>> +#define SRC_PLANE_PATTERN	0x12345678
>> +#define DST_PLANE_PATTERN	0xff123456
>> +
>> +static uint32_t vpec_csc_cmd[] = {
> 
> IMO it's bad form to define arrays in header files.
> 
> If you ever need this header in another source file, you'll end up with
> the arrays in each.
> 
> If you want to declutter a file, the better approach, while a bit more
> work, is usually to add another .c file with the data, and provide
> functions for access.
> 
> 
> BR,
> Jani.
> 
> 
> 

Hi Jani,

Thanks for raising the concern. And yes, I can see the possibility of 
having cross IPs testing in the future, which can indeed include this 
header for other source files, ending up with arrays in each.

I agree with your approach and I'll update based on that.

Thanks,
Caden

>> +0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
>> +0x33002384, 0xff000021, 0x330023c0, 0xff000021,
>> +};
>> +
>> +static uint32_t vpep_csc_cmd[] = {
>> +0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
>> +0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
>> +0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
>> +0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
>> +0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
>> +0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
>> +0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
>> +0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
>> +0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
>> +0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
>> +0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
>> +0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
>> +0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
>> +0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
>> +0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
>> +0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
>> +0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
>> +0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
>> +0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
>> +0x0004aad4, 0x00000013,
>> +};
>> +
>>   /* horizontal mirror commands
>>    * source:      1024(pitch 1024) x 256 RGBA
>>    * destination: 1024(pitch 1024) x 256 RGBA
> 

