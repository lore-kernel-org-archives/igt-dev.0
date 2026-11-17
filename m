Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5731606A323
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aELfLUFt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0B410E3C0;
	Tue, 17 Nov 2026 11:21:29 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BD210E3C0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 11:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SM9iQqqsKVFeGdcdHdi9a4nrcFsu/B7bGIGlGxG1hbHNo4so6V+OxjcSIJVefEXI9zxdXEJFBh6ksj6svkFpIL5sKa/Xr4jHgSk9n6h8iUdyCRurFtejGYNG9HUmOCUF9ojTXUIj46lYQ6n7s0KU9UEMOLsTFpHUbYo9aujxzk6Omh5pHj4Yw56cqHfPxhKqZwALlQODd1yht8HZvCVRONg30iKY83zdtql6/AVubUTxPuwikD0u1V1J8JMaxVVddQvspcs2YLj2+HWw2Gopfw567ZFSlEUKCzIkvc+B4mpWNubze8+5LnkJlmgr+TDTLjxJQDlM7IbJ1bhuCwqMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sImIYVd/3nW9euxs6uWjPHbyZNJrA9wmq45MYPk5+U=;
 b=Ft4U1MZY1KWc+izqsxDUfq2v2PsT4W2HOyMg+EXheqgQGb7TC+BW2XPJHurfauxcYRdrVjk5it2qbmbG+63hJDiTJxq0DanMgkpALFX7gJ77dlDd6iYn3/9n0otUBrpU59asuA52BGE1o7cccmgerU2C79X/e2jjxFOFKIz0b1eRmbhsOcCEGs1/VcDa05IdzSWUCmB4XJH2bAH7t3ZW6efsZVj5HYUnBya4GGSxm3DuPGCrQU6mi6SY268EZyTuvxoElgFkaGPRdYpauQ5rZ0c+LgpfXgDUeOILxpl8oV4GbOZfK83mZ9uwId6V1WQcVBDdkPyK10/SLPLRYc9Rrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sImIYVd/3nW9euxs6uWjPHbyZNJrA9wmq45MYPk5+U=;
 b=aELfLUFtXOuvigR7uyCszyHlv7aZYuOfCuK73z/YYTFERXkSKTQVgYO/AJbxT7vMY5FFHDaUvICt6JGyl3bwmI9DrT7sIsFq0HUweRlQ+nepTUYg0UQ2fXHL5usX+vaMquKHWmYZucVx2fEn912qWnnyJn7icC0YDcD7vratUdw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5108.namprd12.prod.outlook.com (2603:10b6:610:bf::6)
 by DS0PR12MB8018.namprd12.prod.outlook.com (2603:10b6:8:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:20:25 +0000
Received: from CH0PR12MB5108.namprd12.prod.outlook.com
 ([fe80::8403:dbac:360:bc4c]) by CH0PR12MB5108.namprd12.prod.outlook.com
 ([fe80::8403:dbac:360:bc4c%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:20:25 +0000
Message-ID: <eaa9b263-52dc-4ca7-a917-f290e3dee33f@amd.com>
Date: Tue, 17 Nov 2026 19:20:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/amdgpu: add blit test for VPE3
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 Solomon.Chiu@amd.com
References: <20261116132028.2021-1-chih-wei.chien@amd.com>
 <20261116132028.2021-3-chih-wei.chien@amd.com>
 <da1d7d50-2807-4562-a3d8-ae927ff0476e@amd.com>
Content-Language: en-US
From: Caden Chien <chih-wei.chien@amd.com>
In-Reply-To: <da1d7d50-2807-4562-a3d8-ae927ff0476e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0048.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::14) To CH0PR12MB5108.namprd12.prod.outlook.com
 (2603:10b6:610:bf::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5108:EE_|DS0PR12MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0495a4-74ba-4cf5-80d4-08df449cc6f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|6133799003|22082099003|261009223027099003|4143699003|56012099006|11063799006|261102123227099003|261021121427099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: cvqgk9+0nOPYJOCILlmuTWiLeE+DUP6IFAiWG3YFSL5Ahax9VlF6bwdV2CZc6ZIeNJ9Xr7wtHN21sxvFhmj+gO0ZA26GqT/z7KAJDidNJLMD0KVOW8+SmSqJqExBIc059Y8k3DYpToEXcKdgdQ1IjfrkTE0KvN7mH1URqSVcT+s9t67vLzBwaZ5OeBvn9YdeUGIs0mUP//GlocQ2IzqVIEupZUR4IdpmOHNERFWZXsdcl1+6JbdTWVxQ/Kn2xniHUcjsBowuVLkZSMB3KaKHIkEmNY2vzMeI41PCZi6mfUs3yMe0N8+aMSDXq3kxcvA2t91+uBBt/mqV+TH9pXMmGXdyNI1x/ATRz0ZtqBGObx8IxE6GOBashNbWqvES4iHJ3CbmiOUR1dnOUvCCGuX74/G/ruIHhtE/OC/Sk62KU/5Le2ZC97U8WXMuvLeMCgjMo1dN/vkd1+dKT6zr4U0dCr5lgZI1J9mIqWoRiaZw7ZlXbSuVbolv8q4xcdJ4TMcEt8qyq+XfPKXnv3Jygi0V7XYxXA8aXptQsHLkGjRzqI6vHge8/z6Rbj4RG/QuJIsf5uumIJ8NSqu/YVx3VXQ8SSd1rHFPI3f9pTKh34BU+rIO8GnjhbbjzRmmKjHn+HSJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5108.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1UvcVMyTkNrZGNiSUtYbzgwNnBUaXF6Mk9vM1ZCaG5HaDB5cERsQ2VMY1U5?=
 =?utf-8?B?c0RpNUxzaW5BdkNIRjRqQTVFYWR5Z3NZTXJVbEdRYnErdTZnZU5EWlg5eUdl?=
 =?utf-8?B?M2ZVd2pXVjRXYUg4cjhnaUZ6bFBNaXQ0S1UvcnNYd0ozWHNMT1J2eEptM3lY?=
 =?utf-8?B?WUM2dGd6NHVSVnlVTDZ1SmNoNjZ0aitaeW04eTgyOXlrODl1RFZyOVhtdjNy?=
 =?utf-8?B?clVoN1doUGJqa2kzb2hXVEUzYktyQ1k3YkhYaHR2MkJnbkhJYXpnTmhia2VG?=
 =?utf-8?B?blJxR05tWmRDR2FyQWZpK3Z1QmU0T2JqaklpK2REMDhjRzJOM2JBTXNET3Nw?=
 =?utf-8?B?NWluMk9oZ0JYc0t4Zm1JOUlRVDhKZzR5NEpQQnVLL3YrSTRXRHp5M2dpNGZS?=
 =?utf-8?B?YkZlR3hacmxBa0lNZHljVTNZOTFYNEFjT2RndkoyZE53OGp3YStQYXZTcmRB?=
 =?utf-8?B?N2hsQjkxSHhxUGFNYllaYS9tRkFVMVlKSkhwdkpHTVRGdDVGQ25NeUlGZE5Z?=
 =?utf-8?B?N0djK0MwMi9Rd2o3ODFHQ0g5UnpTWXNiZWZWRTJZV3RIQWFoUzMvV3lLaGhD?=
 =?utf-8?B?NG9uMklNR3IrQ3RzdG9FTXU1K3paR1NOTjRZQmdweDU3SGkvL0ZuZWppZFUz?=
 =?utf-8?B?c3F0R2hEdSs3OG9NZHVhb3M1WlU5WngrYS9rSTdtaWRYZXdOYnNpcHhwVmZE?=
 =?utf-8?B?U1VXemp6NzYyN0Z5dUtiY3dobVZlL0hLNDRMQ2R3MDcvV1pOdHBMczJDZ0Fk?=
 =?utf-8?B?aC9GZGtXRUhOODM1VkxKZ29rSjNIS1hZcjhNZm1xWk1qZ3FyY1d6VEFwQ0tp?=
 =?utf-8?B?ZnkyVzc4UzlJbTV6bFFRWnFmVjlRMmM1NElsS1pWZHAwQ0t1K3VsK0xva25M?=
 =?utf-8?B?RDVaYkVUYWRJaG9qWGVCdjU3UGJMUkttSXVVRU1QME04NHMxcnJGVVZKc2VQ?=
 =?utf-8?B?VmtDZUsyZ3htQjFUcGhuMjE4bEIxQUliVUYwWWhUNXZYTEQ5cTczQUJpcC8y?=
 =?utf-8?B?dlUyMFJrMlVvQk5IYktDZ1hxeUZwaDBSWStjOGxqaU1MOS85bGVvK0hHNjg3?=
 =?utf-8?B?ZHdzendyT1lzdENkUnNvMWl4UEZybDJkTHJxWXFHZnRaYjNCN0dKWUJvUzZM?=
 =?utf-8?B?dysxLzZSVHhqVHE5eHJHQWFuTURyZm5Eb3NsWDYrMkg2OExSWWpXVDJjNGtO?=
 =?utf-8?B?clhrVGRTM0FNUjJqanZSK3NVek1mZTFEZkVWczBhNDMwd3lXSTRZVDZqaUkv?=
 =?utf-8?B?SklFWVJOMDFYcjdCMGdobXlQakRNcmpGYnYwdENMUHBBWmJPWEd6T2RNY3Zw?=
 =?utf-8?B?VEd3VndpYjB6S3RIa1NROE5vVEVScldqVGNQMWU5N09TTS91Zk1aZ0Z4aWlx?=
 =?utf-8?B?MEVBdFpjcEZrekdZTmdtOHNXUkNmV294SGk1ZmZNMktCSXdqN3BhV2VGNWpV?=
 =?utf-8?B?MDFBRUkvOU1XMm1mbkpVMzlxOVBJckdVNGN2VHVRQjdMbGt3ZVBtVDhJcGph?=
 =?utf-8?B?VnBrUk90R1VobGF5VHZqSDdJZnUzcE9WUVdQNDdKVlk0Y0VXYWo0K01TbFFs?=
 =?utf-8?B?NFZxenU3Ty9mNjlBeXVTNThncldmTUg1RTRXdGV6dVVYb0JIVy8weFF6RTEv?=
 =?utf-8?B?TGl6UG9oY3RGZGtZQ0lHNEF2TFJKNjdUcVNwcE96bjMzRWR4b29YRXR0SjhW?=
 =?utf-8?B?d1p1Vit3d1k2cnROOW9EeWwwWDJaTUNNYUh4U3Bxd1RaenRCcFp4Y0JkT3ll?=
 =?utf-8?B?czV2REUrVy9GUUJEOXk2VXRxdmJTNlF4SGhCRjRrcDV5dEc4dm5DWDk3OC9S?=
 =?utf-8?B?dXl2N2x6eVZSOE5maEdQaVBtck12SzBnUlBtd1FjUTIwWklUZGx6RFI0eHI4?=
 =?utf-8?B?cUtUclBQbjBxNWwvc3R3ZndFMGJqWERYS3Rtb0VkREoxVmRDb24vOFVQdG93?=
 =?utf-8?B?RHNCeG9CWlREY2ZUMko4U01qRTZQL3VINS9YM1ZiY1hOMklQZnpVNXZ4dGNl?=
 =?utf-8?B?SS9Wa1dCRVAzNE1XMVlxTTBwZU53a2F0Y203eW01MFpwTkVRdElDcmJjbVor?=
 =?utf-8?B?cmJvV0prcWRBN3BMdUpQR1ZLZTJKM3dmM2t4MXg1M3ZtWFVqZ2dtYU9zdWpS?=
 =?utf-8?B?cytrd3hjQVl5MGE0RllDRGtHSXhtNHNYdUZlekJJWVg2VnZmZTRSU0IvS2lP?=
 =?utf-8?B?MEZGMW5lT1lack9KTVl5NTcrV0toL3V0Rk14cFdXYUg3RzVaSVJ6cFFLcm1L?=
 =?utf-8?B?dUdqaitnUDlHcmplY1plYk5TVnJkUXpSV2J4dDgyT2duVkk4c3lTNE1YVjBo?=
 =?utf-8?Q?SGdp75bH8PPa85KTVQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0495a4-74ba-4cf5-80d4-08df449cc6f5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:20:25.6126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4s+1P0zJUKEHpCPwCl0fE535zQIG+4JHRN/CHJtYC9rfxBK4EWmyaoLg+xMnGxQNJoY2ycoIemEajTccfiP1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8018
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/2026 11:34 PM, Alex Hung wrote:
> 
> 
> On 11/16/26 07:20, Caden Chien wrote:
>> Command objects and job construction function are added for VPE3 blit
>> test.
>>
>> Signed-off-by: Caden Chien<chih-wei.chien@amd.com>
>> ---
>>   tests/amdgpu/amd_vpe.c     |  90 ++++++++
>>   tests/amdgpu/amd_vpe.h     |   7 +
>>   tests/amdgpu/amd_vpe_cmd.c | 459 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 556 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
>> index ae76445af..815cd7adf 100644
>> --- a/tests/amdgpu/amd_vpe.c
>> +++ b/tests/amdgpu/amd_vpe.c
>> @@ -309,6 +309,93 @@ static void 
>> amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
>>       free_resource(&dst_plane_bo);
>>   }
>> +static void amdgpu_cs_vpe3_hmirror(amdgpu_device_handle 
>> device_handle, struct mmd_context *context)
> 
> amdgpu_cs_vpe3_hmirror is duplicated from amdgpu_cs_vpe2_hmirror. Please 
> make it a shared function.

I found that there are actually a large part of code duplicated among 
VPE blit test for vpe1~3, not just vpe2 and vpe3. So I refactored 3 
functions into a shared function + pay load for each blit test.

It's updated as v2 series:
https://patchwork.freedesktop.org/series/178695/#rev2


Thanks,
Caden
