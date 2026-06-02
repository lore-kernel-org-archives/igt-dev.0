Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D499CD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 08:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFE710ED5B;
	Tue,  2 Jun 2026 08:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4caH6wPI";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011057.outbound.protection.outlook.com [40.107.208.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D585C10ED58
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 08:56:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwPFnq789vF2bGbwHUaPDeVh4m9JhwZhV0dwM0DPUE5bNsuQH9DvZeNx/FlYJgKE69/PCgIwa/jnu1P/pEPJMcNnxSdEBl+ByLVEJOFRSiBJo8RfYszy1qyZA3I6Kkbvv0i5+7QeMj/SSZeSh8o03gR9bY9RLc7mudV1XDUIyf3gPPrH3BTrL5QYGbCvjcAgu1O1JDAERNWWOl0d6JBtHQ3UhvttDabVJTV8fE/Bhxscp/ejrUDwiRajJFqf0rvYc7VxwChAcQh0ZnVW3z8ynJfqIV8RXFabH2icDMEibYFwTtoGo2LO8VoG5X2gCjRYjyl3XTqtvtkwaV0+1aNPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIMkZXntG6mhQ8IR3sMs7V+O898mMQrdEoJ1PbdweTs=;
 b=SEQDbwSsDE4RiwU/f2X+x6n4owneK7CQjUiySMJzROPPbQBEnkns9yunGoWsg9MDM08GxS3hsNskN+niagobkGyZSH1VFTELrmmaEe1VIQsStFftWOykl2BFv+wGMQZnsNFgbctGeek+GPT+ELrVak00TfAYS27QmK9RBKAqOjjarSSsrIcCxNoO8Hir+EwLcDDAz+Tw2ES1Ixtpdv7K9TZmtxjWzyVavBdF5OPEBvDZS6dIpB2rMdZ3LDguPrfQqAXZoGLGStgnTrEys4EapQK3gv01arB/8MnxXXTG0EgKJNOC5jEdLPbfxXyiO+Cn7r8/xRliDtYSkP8GyLEjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIMkZXntG6mhQ8IR3sMs7V+O898mMQrdEoJ1PbdweTs=;
 b=4caH6wPIgaGSVRraNya+ic5+JoM69pXRJkWc8hpbpmhcVZ/qJtdZyTGRYYGtuYGgGG/YW1q9H458ueXYLhXSVgMzxfHJuEn83cfBKCX3viq8u9y2LJ/NgIeMlvGHW/EjUxHs20dNJB1/SCjFNq64Au+5PXARm5Xc3Hf1jOElzHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5108.namprd12.prod.outlook.com (2603:10b6:610:bf::6)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 08:56:44 +0000
Received: from CH0PR12MB5108.namprd12.prod.outlook.com
 ([fe80::8403:dbac:360:bc4c]) by CH0PR12MB5108.namprd12.prod.outlook.com
 ([fe80::8403:dbac:360:bc4c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:56:44 +0000
Message-ID: <13701bce-efe5-4c1d-be1b-514536440420@amd.com>
Date: Tue, 2 Jun 2026 16:56:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/amdgpu/vpe: set blit test based on IP
 version
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 vitaly.prosyak@amd.com, jesse.zhang@amd.com,
 Jani Nikula <jani.nikula@intel.com>
Cc: Solomon.Chiu@amd.com, Peyton.Lee@amd.com, HaoPing.Liu@amd.com,
 Yu.Wang4@amd.com
References: <20260527120802.617332-1-chih-wei.chien@amd.com>
 <20260527120802.617332-3-chih-wei.chien@amd.com>
 <777dd068-31f1-4b4c-bb5d-d7875dc4851c@amd.com>
Content-Language: en-US
From: Caden Chien <chih-wei.chien@amd.com>
In-Reply-To: <777dd068-31f1-4b4c-bb5d-d7875dc4851c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0011.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::6)
 To CH0PR12MB5108.namprd12.prod.outlook.com
 (2603:10b6:610:bf::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5108:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: adde53aa-01eb-4386-bfb5-08dec084dee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|6133799003|11063799006|4143699003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 0IjazqRATjJbUxtII8QrPAEdn9Y6hDAvpIqvNSlA1/gmxx05bJC6FTesU3DZTDyS7YaBDQWxd7U1VERObcRl+Skpx9Z6/ol9SVIPMZzGsmqzz0G1myt0GOrETne5JPANYP21k3OaQVEvZYfU8W8lOQhTKMq4e6VjS8MGkwKwUGu/LAWSDvL+H3hgnZ4YIY/HcoJHJ1CsKxgzQPewBWfqr5sGjzt1CSmFvPu6FxhFFzzpHXHuXvoqu+O/opgW5JkQNQwXUKEMpWdfJe/9IKQuwiu1vhgdF1wj4LPvfldzSAFImERAK7QQ1SMCtpxOc1D06wkEdDohDzbtxyDhjf6wAD71At70Sf/rQEfAm0QNNDl/UHlOgAX75M7xcCfi0HgOUeimATGSeNgaM0HYFhau+cbINrjdtd/nKblawm2cl4sYZzU59Mh7Ro3xaF0Lzov5IqpJS1xZbAHKyup4fYzC5Do1axXPOsKtdHBtl9wubQmzS6ieY+kTN/rSv5yIp5of40c/UkDu/e7DHNErc/dbWd4FjbPjhjf07C1olvU6Cd+r0D02wByAWvUpmvY8BrphQA2Ljc0lt5HSHClrdi5HaR0VrMJFfuaM9dZixpw80Af2w6Z8ZlfJ6kv/onmk16jzbseAV6mP1HuzJMuGkhrDFfDbU3QBYxw+TFlXprF/viJWSGe2rYYrFLtdmGVCxJqA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5108.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(3023799007)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTNZTDFnN2JQSkxraTRTY2R3TmVXemY0ZThKWEVyYUtKeWdNanZ3TlNoSkFi?=
 =?utf-8?B?ZlNuazJVK1pnWkdONnhpaGpvQzZYa09wVy9VampESmRScXc3YWc1UFZCMUgr?=
 =?utf-8?B?QXdaYndNRG84TkZYUlJIWDRRT2FiZlppSkMybzZqZVhqZjNsN280S2FxUVBJ?=
 =?utf-8?B?U0NBWnJ0c2ZzUlplNkZybmt0RE9ydTRzOXRIaTN1VUtqNERLYkpJd2dBWCtr?=
 =?utf-8?B?VjNUUmEybjVYbFhhNmhwcDFvaFFBSlFqZSt6b1g0MDlzYkQ1Ni9mSjVteUFY?=
 =?utf-8?B?SmFwV3pyekhxejFta1ZEdEdBOEcyV0VpaFdpMytVSlhGRGFlUHJpRHAzME1M?=
 =?utf-8?B?ejl0SVJ2WE0rc2RwUHppWjhZMXh1SDluTHd2WVE2T2t4eTFOOUhHdEpaenFZ?=
 =?utf-8?B?T294V1JCSkJGL3F3WUF6dHpISmlLdFRHTU1pQy9yd1I1WG82RDdvZVZ5TDhB?=
 =?utf-8?B?ZW85TkxieUpiakdGZmVWY3ptUGdHQjc0ZzZZVHd4bUltYWJQU3FkN1h2VERk?=
 =?utf-8?B?QlpxZ0tpRnZpcUVidGhoL1ZkT1NQdXRmWGUzRFhOaUNrbDRPc05laVBCODFK?=
 =?utf-8?B?ZWNrMllxbmpGODR3S1hQdlFDZVRnRU1YZTExdDZtNDhqSWxOTkpOMlMxaWxh?=
 =?utf-8?B?L1dIOTFYSUpnZ2VsVTJ1T1drRzJtc0RtazNaV1d4T1VwM3pGVS9VcW5sUENi?=
 =?utf-8?B?UzJWWi9zdm5aRzhscDZraE5Hc1QwdlZsZ01vbkNPQzU3TFFvWWtsTzVHQ2dR?=
 =?utf-8?B?SjRwNVJkTGtHTmQ2THVjdHhhR2tsNmNDRFRyaGlqalA2UU53R0Qva0xOYzZX?=
 =?utf-8?B?R2VrYlFlbU82d3hzK1NzbXJ5bmtQLzdQcGVQRkd2eCs5dHFrVThBdkQvTkRw?=
 =?utf-8?B?VFFkVERFVDI3RytJU2FYUVFvUmVJc05KY3hhLzFjeStjUXNBaXBHRk9Qc3pr?=
 =?utf-8?B?dTlYaWtGUXBMQkxURS8wV2kxcXNaRXRpRTF4bEZnRFI3dGtYY1A2WGhRY2dK?=
 =?utf-8?B?b2lWSmRDeVdoVUZ6MUZZZHFpSnFoV1g2YmprVWN1U1NLQmd0WEdFU1V1UU5D?=
 =?utf-8?B?TnpqNWRCOXhxaXhRRWcxZVVrR1FaR0RXSUozdlNteWRKbGJLVy9zbjk3cXd0?=
 =?utf-8?B?U1lOUTBLclo2aFFKbVlQRzFzMVlUaE1JQnBQMHFrOGFPMkFScDBZUURKV3Y5?=
 =?utf-8?B?WDhxS25HclJsc1k0ZFdYb1M2bzJNU3pyd2t4K3VRV2NoVDNOdytWYUpXTGNs?=
 =?utf-8?B?WVJYV3RMNzFSTFFGdEhGVUpWaCs3YW5qMXRnK3MxV0tMUUxoRGtNNGtQQy9y?=
 =?utf-8?B?cm9FS2dRbmZXcGFQcEVwZ3N5WVBQaERRa2pFRnY4Y1E0Q0IxNys4eEZOZ0NX?=
 =?utf-8?B?VXJ0NzhCdG1jdDJvWGZPYzkxZjVxUmlhMGlNeU1VSEN6U3lScndZYThVbFln?=
 =?utf-8?B?Rk1YcGp4S21JWmx2OVFJY1NXWHl0V3Y5MGNXL1VVN2RYTHlIWWlHNGc5NDJN?=
 =?utf-8?B?ZlZMWDQ3bUhHYjIrbHV5MERndGt1dTN6VEgvOEkyVzBoREE3VFhZdTdsRDM2?=
 =?utf-8?B?aE1NZXgwbVM5anJYS1I5bEtreFNjdTlQQ2Ewb2g5cTF3eElpcnVYNVdGVTBJ?=
 =?utf-8?B?a2ovKzYrNVQveFYyUnJwL1FFSGE3VVhkMnFLY2I2dkdvRUJtSHU4K2FxRzVR?=
 =?utf-8?B?b3VZa2huc28rdmwzejFIaHdiQTdRZkViZDJqSW9ZMjVRQzRWRlp3V1VES21J?=
 =?utf-8?B?SXVRWDJUZnFtUXZSdnJ2ckJYZkV6cWovSFdHVUJsWFRwUGxhK2FHY2preDNF?=
 =?utf-8?B?M0k3a3BjQU5pUnM3aDF3MXZWZ09NUWV3OUdaMGpoRXN3dGlXeHB5UWN3QXEz?=
 =?utf-8?B?YmVhQ0MyS09TdUwzYWl2RTZZTGJCVzE4alo4Q3dtVGlXWjRQb0FtTkpFKzI0?=
 =?utf-8?B?NnZFaTBJZlBVelRTaVdKTTdkREYyeFJvZjVpRTJ2YWZZWlN0UzBwNWo4ZHdR?=
 =?utf-8?B?dWlOY09lQ0loS3REN2NzeXFmQnZlMGkxSGV3RksxU25VWnJIRE1WRElraklJ?=
 =?utf-8?B?WmQvN1NFZWo1QjNZK3VaQlBJQ1ZtSTlaK3M1RXFrbW9ueUJLckpDSXRtL0lI?=
 =?utf-8?B?NXMvaDIxSG5SN0wyRHl1eDJadU44WmRYdFcrcEVQdUVVcnlXS2N1bHBjV24z?=
 =?utf-8?B?d2ttb3FvT0hxdHY1V3I1RklPNnJldlZZSzk1ZHZkVkd6RVQ2RGpobHBVa1JR?=
 =?utf-8?B?cE1DcTFqcEhSSVJTcTFuaTZxUXVpeGkxc0NUdlRXb3cyUWgwVGVQWmdVQmJO?=
 =?utf-8?B?T2J0WGFaRUhQMDRyaTZqbmZ4dzdWY2hIYlV2UmpMWTZvcVJ6WFNVdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adde53aa-01eb-4386-bfb5-08dec084dee8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:56:44.2246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOtRYI3qNBlvVVzW2YU83X45yUeI9SZ+6motc+s1SLKhw2tNXVksNrQKvTG1My/zYojgqwvEe/8SdeZn/ubRAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032
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

On 6/2/2026 1:11 AM, Alex Hung wrote:
> 
> 
> On 5/27/26 06:08, Caden Chien wrote:
>> Commands for new VPE version may not be compatible on older VPE HW
>> (e.g. VPE1 HW can not execute VPE2 commands).
> 
> If the previous patch can introduce regression (ex. "not compatible"), 
> can this be squashed into the previous one?
> 

I think yes. This patch was intended to be split as a more fine-grained 
patch to help reviewers better understand the intent. But yes, as you 
mention that previous patch can introduce regression (ex. on CI machine 
with VPE1), I will squash this into the previous one.

>>
>> For test runner to run all tests without manually specifying which
>> blit test to run based on udertesting IP version, a new switch case
>> is added to execute the blit test corresponding to IP version, in
>> the single blit test entry.
>>
>> Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
>> ---
>>   tests/amdgpu/amd_vpe.c | 27 +++++++++++++++++++++------
>>   1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
>> index 809f22d17..9c72b1c0b 100644
>> --- a/tests/amdgpu/amd_vpe.c
>> +++ b/tests/amdgpu/amd_vpe.c
>> @@ -176,7 +176,7 @@ static int check_rgba8888_hmirror(void *addr, 
>> uint32_t width, uint32_t height)
>>       return 0;
>>   }
>> -static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
>> +static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>>                   struct mmd_context *context)
>>   {
>>       const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
>> @@ -337,6 +337,25 @@ static void 
>> amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
>>       free_resource(&dst_plane_bo);
>>   }
>> +static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
>> +                struct mmd_context *context, struct 
>> mmd_shared_context *shared_context)
>> +{
>> +    switch (shared_context->vpe_ip_version_major) {
>> +        case 6:
>> +            /* VPE1 has major version as 6 */
>> +            amdgpu_cs_vpe1_csc(device_handle, context);
>> +            break;
>> +        case 2:
>> +            amdgpu_cs_vpe2_hmirror(device_handle, context);
>> +            break;
>> +        default:
>> +            igt_info("Unsupported VPE major version %d in blitting 
>> test",
>> +                 shared_context->vpe_ip_version_major);
>> +            igt_assert(false);
>> +            break;
>> +    }
> 
> Can you run checkpatch.pl from linux kernel?
> 
> 
> ERROR: switch and case should be at the same indent
> #39: FILE: tests/amdgpu/amd_vpe.c:343:
> +    switch (shared_context->vpe_ip_version_major) {
> +        case 6:
> [...]
> +        case 2:
> [...]
> +        default:
> 

Got it. Will run the checkpatch.pl and fix it.

Thanks,
Caden

> 
>> +}
>> +
>>   int igt_main()
>>   {
>>       struct mmd_context context = {};
>> @@ -370,11 +389,7 @@ int igt_main()
>>       igt_describe("Test VPE blit");
>>       igt_subtest("vpe-blit-test")
>> -    amdgpu_cs_vpe_blit(device, &context);
>> -
>> -    igt_describe("Test VPE2 blit");
>> -    igt_subtest("vpe2-blit-test")
>> -    amdgpu_cs_vpe2_hmirror(device, &context);
>> +    amdgpu_cs_vpe_blit(device, &context, &shared_context);
>>       igt_fixture() {
>>           amdgpu_device_deinitialize(device);
> 

