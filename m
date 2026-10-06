Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7DECA5FFC
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 23:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247B510E47F;
	Tue,  6 Oct 2026 23:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CjRaLNbO";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012040.outbound.protection.outlook.com
 [40.93.195.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F38810E47F
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 23:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQHtSR2PXt8s6LS8p9R1kv4xRw9Ww1oJafUye2CseWMg2ixxac7aEusDWYmKs/0TuPQlQ8rDzhX5rGDYO1v/iMhr0BV+wBeAAVSBPs1OmawKHhMiracJdZfNP2rP6bBFlIeo24gmSDQQkitevyHjthfynb62gfFdc678OCuGs+C/jLJKwQtaq17+XhBaNPK+g6CGisQ3ruo2WFM3eiXZEFH+FD3UFmyHTT8B7eE0roboJIR/15MiNK5iQ0nqz2fLRsygvGVhqjnkQce/ine1O8HMSIK04VcKW0VASDECGBP7I6v2ZzuBchls/C4+L6o67d+JAx7bY95qmoRLyiRewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBX1+IiZJxjfmh41KJmd1WD0HFT2j34FGq0LI9wlhac=;
 b=atgxBS4wajNYeGTQWWK6V8GyDiP9x/T5mjyG7VMNAyNVY/QE2QpoTKwVP+MgjGbK0iv/8kpoXhplMAfwoVCoNYrMBkbHsrc5p5eUCFk3Zp5VtGSMd7MMW3z7PFYjEL/4Id6JDf+UeMpJKxBtk2/iqyTeusblDiZwcz6cIY6lT6SA9gbuFjpvlWQN5oAEmP609HDv5mM6eiEBk5FZwP81OXiE6c1eK8NIbUcdAGirAogmwujSrQVmcjKO4UDMyH4kI5qwOiCNgAZXUnPgHvdWXMfrtLhcameL784pQfUcRfSUXnnEEV8rH2obZ95IUCeO2vD0I37Kumta+93ctRhDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBX1+IiZJxjfmh41KJmd1WD0HFT2j34FGq0LI9wlhac=;
 b=CjRaLNbO9Jf0AgSY63zOLDPlVihRMVUL7/bcX3FTHV+phpExU56Tjl43qisMd9zYgYTiWboTtbabQjf8713se/nksa7iBCaHNP2Dq1SwWionvTq6Ih8RRSnvCQNg8qwcO8ppZi9WE+gp0uVfY5cHolYWWutwFqum0aFIYJrK16o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DSVPR12MB449095.namprd12.prod.outlook.com (2603:10b6:8:4fe::22)
 by CH1PR12MB9648.namprd12.prod.outlook.com (2603:10b6:610:2b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 23:09:01 +0000
Received: from DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0]) by DSVPR12MB449095.namprd12.prod.outlook.com
 ([fe80::76a6:7a4f:a0a5:18c0%4]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 23:09:01 +0000
Message-ID: <ced89749-5a9e-494c-9283-59c9cb6c9eae@amd.com>
Date: Tue, 6 Oct 2026 19:08:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: insert pause mnemonic only on x86 /
 x86_64 platforms
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20261002191401.469214-1-dmitry.baryshkov@oss.qualcomm.com>
 <20261006142929.v262wmhkjaia2jmf@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20261006142929.v262wmhkjaia2jmf@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0275.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::26) To DSVPR12MB449095.namprd12.prod.outlook.com
 (2603:10b6:8:4fe::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSVPR12MB449095:EE_|CH1PR12MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dde7452-7d60-4a2e-ed0b-08df23fecf41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8EsmQVVlrTooT/G/qpcUUA7LT4QRDdH8dZWd2zMqlpzzNKOGX5DYSlqhPlGMtShDGV8aHyH3wwk1aQeQREMfVGHZ6lOhmnMOVdFDkJiMZk9zGJGL6YJcAd68mosyQJw7kBWhZ2XXBrUmP4wk1BkF77MhZnQxwj/7SPbtR8eRQFZvu9cmWDt04P2G7AyS8O5LRv4Zm3fSLQS81S1m9lD+RQMSv8iDlbRr0MmlN3RBLIa0g0eFkL1rGtt7l/dyekie2IhTIksxxKrE/nK7ZcBZ/aGm8G5xBw4efUEVRbmirRFQMBTkHx6Wfy0N94XSw34leL+NEMHgUgzaKB+ajPhtG8Y+2UAtIizFkmfL25PqWJlfjGqsZJoszgI4kc+uYbtkQuD2gTatDJRKoX0su6J9LdIewxVPwJd5gBMTeAlLIRxy+OXw5756uV62Vacyyopp2q1yuAPTpc0zX/v7kFpCjoiKlxMO1/u5Ra4YyotAgXQq1mlQ7M000VJV1CvnnckgtqkQh0BzfQjGq7HwJOavwQ2O2mQpuLLa3ol69uvd5y6Ju9GTZfM3ZFEk4ytsIK32cqjberJgnpKqRPmZtnGf7TX/YDvpQmMMeMMrJY9iAxy0JQwd+AhGEEHsOvKO20vKTIX7+BXxpwNPYt6VpNBCni3fZROGMDaXa3/No4QJvZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DSVPR12MB449095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0RRVVR1eThvVkVKZ0hvZDV3SVl6M1BmRnlHTmw5WDNLUlpCRnVjZFhlR0Ey?=
 =?utf-8?B?VVBqdDFzVDJ4djZjZGJ4ZU9OczdKNmw1TFp5VHZXbk16ZlhSRlJTTWZrVXNI?=
 =?utf-8?B?NXh2bkZlTjd1QXoxeHpHRXd3Vk1jZkVqL0pPVE5PUmJhYkVHRFVlOUFDTzVa?=
 =?utf-8?B?TnlWKzNuYXVybCtkd2xwVFRyMGVnbUQ4eEtTUUsxS3RvcXU3blR4Sm9MNFM4?=
 =?utf-8?B?TFUyaEpjazVyZXFYRElHU1hFU1pyaVdSbEZqNkNQbmd0SzZsZE1rN0ppLytX?=
 =?utf-8?B?NHFPdkJ3YUhEb1lXYy83Z1lpNE9BaFN2dnlETUk3RWdoM3hGQjFtd3NtYll0?=
 =?utf-8?B?MS8vM1cxM3ZXcW55dWZOQVBpOVY1eUtEWndtZ1VaUjNyQTdSbHVieFdKSVVJ?=
 =?utf-8?B?VTkxb1E0K0RRdm9QbUlEb21uS3k3RE00aFg5bjNUMk1OajhWWmIvUGdNeXJY?=
 =?utf-8?B?OXp1dnpsSndPUWxOZzlWL0FIM3ZKU25pejdaUXRQQysway9US21DL1Z1SUpV?=
 =?utf-8?B?OXhyTm9qQUc2Q1E3cVBaV1FQNnR6N0hvVy8wc3lIUWxpWTFGem8wSFdBZ2Qw?=
 =?utf-8?B?VWpoYUMrZS9aRFFsQ0hWVlRLZG9qTGRSTTJjUlhwTjdWdEJDMVJ6UVcyVS95?=
 =?utf-8?B?M0Z2K3ZJdXNwSG9DOWN1RkJvRVgvd3RqMU5LVzZ0MkVESnR1QnVOZGJqcG5q?=
 =?utf-8?B?dTNhTnUrd25VRVJOSm05L0RoR0szUlR3NG4zN05hSCsrV0VZb1lja0ZjcDR6?=
 =?utf-8?B?NWxWbUtZeXNyTlBFRDh5b3FreWRWS0o3NHhBVFJ6R1h5VlpURHhrMXFkdkdh?=
 =?utf-8?B?MzZDaS9Kb2F0QXA3dW5TaW5xZGtYSTBTRUxtZVRnWE5yOFdyRW1wbWhkMHor?=
 =?utf-8?B?bWNwTEtpWVFGV0tyQ1NUWGtVWldrSDhMUlFOa01WaHdmV1JTUzhFQlVxaFhj?=
 =?utf-8?B?T0lwUXhscWptYlo1VHUyMG5CZFE4SGdCT2Z6bHhGY3kwVGVJQ250M2JoTE10?=
 =?utf-8?B?Yy8rOGdTWmdVeUhLYlpMelVDb1RhOTZBclVETDBlUk9HQUFuUnBiZ3VRTlhG?=
 =?utf-8?B?bmVuTDMzWVc1aHJlREN1WXpwTlU3WEQvSEhUTUZpbVZyQ3B1SDVvNGl0SDdG?=
 =?utf-8?B?VUVXTjZSd2JzamJaM0tJUFhMaXdkcmR4OHgxTVdha2tROEZsc1FYalB4ZkNx?=
 =?utf-8?B?aEhKQW1VVlpEeHRsZWtsdTlvOEkrS2wwdERwbUlVN2NhTUlyckdrTlVZMU9j?=
 =?utf-8?B?V0dnb0JZamYyR3crN0pOeTZscDh4RFBVc2ViLytidEcrRDVkZ1hwMFo1TEtD?=
 =?utf-8?B?NUQ4UStQUjV0aEtQMmFOa3dzQUN5V3ZCREd1NkQ0b2IrR3F1SFJRTWlvc05o?=
 =?utf-8?B?MDNiL1hSeEJVOU5VUmtQN21wR2ZWa2NlZ0xKRXd0Ry9teDE2ZkJtdEd2bTc3?=
 =?utf-8?B?eTIwUkpMSm1rbXh5QWdkVWZaUkFzRlBBbFlGbVduc2c2K1pMZ2VJNVpLTXlu?=
 =?utf-8?B?RXNXV3RKY1kwYWhmNlB3ZG41OTVjNUxOclI4RE5VWGFYZjc0OVU1bEgwU3B0?=
 =?utf-8?B?c1cvL1lCWjB3VnUzeGIzR3Q5YkF5VDNma1k0d0RaN3lpdDFHemIyZTh3RlE3?=
 =?utf-8?B?Z1RhSGdNOW0vUlpMOWtGM3plMTNxa1Q0bnJXa2RrNDVqdHNLMk5WQzMxc0ZM?=
 =?utf-8?B?a1g5WUtjV1hvMk5vQUQvYUVhbXFoWWZ3anZhVHpqVlJuaTd3c0NwSzY2S29B?=
 =?utf-8?B?enJET1Y2U0taUUZpb2M4ekN2akxaNTU3YUlZK2RKNUExTHViOWI4OXcveVJa?=
 =?utf-8?B?d0trVXZnczVDS3FJVHVpT1kvVGM2b2k4QTQ2Ry91RFBSWGx1QWdWY0ZFcWtx?=
 =?utf-8?B?dTFvZFp6RWNINktZZmlkTEtzQk5ZWUdpUzJvakpzSWg2czN0c2hqSkp6cmRB?=
 =?utf-8?B?WFRsVkdRV2ZPNHAyd1pyTzljMlp4MlRhekV1bDFKM1hqdzZFTnBxVE5sSVpC?=
 =?utf-8?B?bWVNWXBFcytWOThVNXQ1SGhaM1Fib2tVME03UHZQbGlKV1Y2UFQxUnBBcFJl?=
 =?utf-8?B?bXlQYlV0TWR5THVrSEFqcFFXZHdyL1plQ1RHT3I1bXI3UzhpVVQvbnd0b1Jm?=
 =?utf-8?B?OVBOeE0wUGlVelFXUVkrZ2NsSXNlTWdKUmRydWJYNXMxeXNpendQZW5FN05B?=
 =?utf-8?B?aVFoN2crVVFqSldJcllma3ZtbGwvcTNkRENNcGRnTStpdS96bHJyRVoyeEF5?=
 =?utf-8?B?TFFBYyt2NFNFUE91aFBYTklnQ2F1dUR0VmluQ28xS3BIdmQ1VUZqcjNrU2hv?=
 =?utf-8?B?byszQXBoNmhRYmdKSVpwcm9nTXJSN2VoTGx6TUhPdFBJdzFGa0RBQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dde7452-7d60-4a2e-ed0b-08df23fecf41
X-MS-Exchange-CrossTenant-AuthSource: DSVPR12MB449095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 23:09:01.6648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTk0yOgOu/yPr0OEFyGYTS0jm/MkcdzdatmWh+qh7ZQpHfqqsnyFEZdTgkv7icz/4MgM7dy5Jt9Cwi+S9Ou5mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9648
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

Thanks Dmitry!

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2026-10-06 10:29, Kamil Konieczny wrote:
> Hi Dmitry,
> On 2026-10-02 at 22:14:01 +0300, Dmitry Baryshkov wrote:
>> The "pause" assembly mnemonic is only available on IA-32 platforms,
>> breaking e.g. debug IGT builds on ARM / AArch64. The issue manifests
>> only with -O1 or -O0, the default -O2 seems to optimize the condition
>> away.
>>
>> Guard this inline assembly with the preprocessor checks, making sure
>> that other platforms don't see the invalid assembly.
>>
>> FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
>> Assembler messages:
>> {standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
>>
> Please add in Cc amdgpu devs, found by git log -- testname.c
> here
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>
> Regards,
> Kamil
>
>> ---
>>  tests/amdgpu/amd_basic.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
>> index 418db286f81f..494934c1c321 100644
>> --- a/tests/amdgpu/amd_basic.c
>> +++ b/tests/amdgpu/amd_basic.c
>> @@ -705,8 +705,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
>>  		/* Sleep if interval specified, otherwise tight loop */
>>  		if (check_interval_ns > 0)
>>  			nanosleep(&sleep_time, NULL);
>> +#if defined(x86_64) || defined(i386)
>>  		else
>>  			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
>> +#endif
>>  	}
>>  }
>>  
>> -- 
>> 2.53.0
>>
