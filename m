Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEA8C52D6F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Aug 2024 01:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B1A10E0B6;
	Wed,  7 Aug 2024 01:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RHz1Sydg";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4EC10E0B6
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Aug 2024 01:16:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EX2szWf1JjxBxJV0shFsDQqj+1GyU4qAu76Eg5oqQLHivBzVGQnFK7NAapTj3ujswzBpfA5UVxNVyYv2VtRqcSDk4MEmrpQmr57NwowpC/8Lzj8v7IOnT7cxh6Wlcv/Ltsr9VKmcV7PXqlTWPAKvUBPy9dY7VQF2EwLB+zDD8HR4ThJ28dXFlK/Xw4U9PMl+/cmUFi0uGfLxYq0/YhkVeP7CQhUF9GZyW2cN0UEYCHelMQggaQwRiYecAVS9wBIOt6SQ2Cw6CRgXTApwsw/PdZ/JJjPmapIIj+yTM0ETK/zlUj66PaL4tZ3DdqxNPE3c7crCzcASpiLe77iZb9j/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5Jim2ekXApi3eCvftMqixlssT/tWQFXig5Ph8XAu8M=;
 b=bHOzKI1DkJM24xzg+sOg2hjOyeQDdTYveSIsPyc8Nq6sQu0OzsLIVL60egTVufQwXE1k6Ez3DHvpu9uXQ/XxeVcmaPhsbefmknN5oyK2AlLkJ4DlBcah2Sw3BCF+AcavEHSUTJr8ngxVMtQsypddhJ4vOeLVW79Tm+1D9lYGy5u5q7PKY9IPXBKOPE0gWJqRo6Aii9caURAVmv3fTDE8xg/oe5z/jKxyJzSiF8gxzH7IEkz8DoFc7dk0eYUTT0cv5m6ZV7/r/0modr5dee8EWqWGRKS72KIlJBmOWyWYitCWkhVtpZeZH2FlMlMFNfOce9WBu9WfOKnm4tUv33mMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5Jim2ekXApi3eCvftMqixlssT/tWQFXig5Ph8XAu8M=;
 b=RHz1Sydgh5rlBe4zjU/Ilhd01LpnHEwcAyoyJgZBNYOyL86zkQ/cFMdvC6uymSculKYtPnypGBnaDjlURmvjfO1UNO9FQwtIsihCxBeqrnUTIq7cFk8x0tV7/9mVyBG+nk7Eow15n6tS7lef/hOI8ggzITsFWoV6DP7PRfmpStw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH3PR12MB7595.namprd12.prod.outlook.com (2603:10b6:610:14c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 01:16:46 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 01:16:46 +0000
Content-Type: multipart/alternative;
 boundary="------------0GMF1dAbnuiQ7PletGhtEoy4"
Message-ID: <fa4b886e-ac97-4814-a973-18aeb32d7dee@amd.com>
Date: Tue, 6 Aug 2024 21:16:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu: update bad length case
To: "Liang, Prike" <Prike.Liang@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20240801105925.2523913-1-Prike.Liang@amd.com>
 <DS7PR12MB60050E9E343F11B751C36AFBFBB82@DS7PR12MB6005.namprd12.prod.outlook.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <DS7PR12MB60050E9E343F11B751C36AFBFBB82@DS7PR12MB6005.namprd12.prod.outlook.com>
X-ClientProxiedBy: YT4PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::14) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH3PR12MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 735f4f20-a2b4-42bf-0682-08dcb67e9ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlZ2RnA3Y3lVb2U4NXVxSE8rYk1sRkZEbU5Uajg0MktZLzYxZWN5a3BjVEpF?=
 =?utf-8?B?ZjZkbncvN1RDdkQ3RTN2dU5kbGhRbEJ2VUNGbW9hQU4yQ0dUNTlQbVh4TWxr?=
 =?utf-8?B?Y3AxWEUzc3hZUzd0dktoSHVJTy9QQWs0ZVRESnlCazFXYlUxMUxCSU4vUlU0?=
 =?utf-8?B?aFYwUWZ3Y0dHa3hnT1VPY3I5a3V3NWRhcUFibThFTTIrdTdIbjRKcVBGWVc2?=
 =?utf-8?B?Wkk0VXBJTWdXdU9USEtqM1JuVTNqODNCV0JKYUhhbjlmaS9Ec3ZEbEFPSW1i?=
 =?utf-8?B?Y3RkcFpObUVZMGxQdmNQNlAwdWlxRVlKL1JjeXRRQkRKSWpWclh3ZkF0YmpZ?=
 =?utf-8?B?TFBESW5veUhXdWRkRGRHTDNSZUY1ZkdvZDRjT3BjTXEydkJuODJTdXBtZzJo?=
 =?utf-8?B?UElqK2FuRTJYZUErMTlRZkR2V0poZ2pNZWh1dkE5QTh3VEE3U1JuOHZLdmRm?=
 =?utf-8?B?NnlKTWVjdmRmR0tob3BxNGx1eUpMaStEbGdTdVVCNTMxNXlCNkxEMnFDckdK?=
 =?utf-8?B?NGdaM0NCMmtzbXd6TDJZaDlUOUsxMHMwU0c1ZStjRDk4OTlrRUdtdGJ5MUNY?=
 =?utf-8?B?Z0hDVkxBRjFoZjFDc2xmY0RBeU9JYlRXZG0wdG0zZFZ0T29IajdScHdGdnNG?=
 =?utf-8?B?VXRmenlDYnAvNEc0VStDQ2pOTFRLL1lQbjhMT01pbzF6cVpzanhzLzNHOHVT?=
 =?utf-8?B?RDFhTTI5dVhSTzl3M05uaEczbFpPQ3hieDQ4Ris5QkloVGhGc1ZvTjBNV0pn?=
 =?utf-8?B?SWRYbmRYbk5XS2cxSVEyNzNUZFpjTVgrNk9tcXBzUmlmcGJIMFNmQnNPUWNV?=
 =?utf-8?B?S0NySEZHQWVYckFselpFNUk2cmZWNmV3SkRSYmJKY200dWloKzFaTHpEbDY2?=
 =?utf-8?B?VzUzRXZJR3EyR2hxK1djdkRlbzFSY0hsZHk2SUtydVNBK3NhdHRxeGhORUhN?=
 =?utf-8?B?ZnN0ZlVFbDdsN1Nsd2xWQzRjLzBkRE1QcG00cWxlNk5ZU1hsVTJFQXgyUmk2?=
 =?utf-8?B?WnpDOGVjc2NZUXowd0NJeTZRR3VySzJMMXBHeHBWaGRpeUFJQmR3NTdNTVMw?=
 =?utf-8?B?OGFtTDNYTmFBTUNjSkg4N284VGFVTmtocWl3UGEvWE0rRmlkN2c3azA5ckc1?=
 =?utf-8?B?bmxuUW80MnVvN3lzQTdqbkZWTXVGSU1vQnpNY2RZREE5L2FKVzF5UERoVlV0?=
 =?utf-8?B?MHpvQS91cTN1blhibFhuKzFCeDVBd0dSOWNoNDhXTm1JT1pDVGZZUHBSOU5I?=
 =?utf-8?B?ZUFCUGo3cmRQVi8rdWFxT05iczJPRXNnU1o5Y2E0K2V6TENjK1Jqb3lhZXFu?=
 =?utf-8?B?Z2xUM0tUelV0OFpOWkNTd0k3ZGJhTW9HcitFellDaGc4N1ByekNHOTNyTFlX?=
 =?utf-8?B?SkdHWXVoNFNHVnhlaUIwTEhZMVZyR3BpMU9tL0c5WDhBcHNaTWhPanM5SGg4?=
 =?utf-8?B?R3lNY2hSUE1aRmNoRWN6dmYxK1dDNTl4ajlFZE9hRUs5b2VaTkE5ZlBwQU5t?=
 =?utf-8?B?LzJQTVhGSHhIYVU1eTV6b0haTkZnSUZnV0NTcWxvRDFhRktNTkMxWjNvNEtE?=
 =?utf-8?B?bGplRlZRUC9FUU1XUGFxaDNaSFJ4Sm5PNWNkWUxvRUlyV0FnRFRLbXNjUzFv?=
 =?utf-8?B?V084MEEySWV6L2NKSm9xcldaM3p6UktIcy9ZWS94dHNINTJGVURiQXQvRXRK?=
 =?utf-8?B?a1dUYngveGhXbW81Mng1d2MycFdDaDFhV3F3V2pkR2RJTE84Z3JtRHFYVXAw?=
 =?utf-8?B?YldKelRQNkhDb0FFNWswVTJzUmJ3cEd0ZkF2ZmZsU1pzWmtOQlRNQWttMnJy?=
 =?utf-8?B?WjYyWTBPMExRRitqaW0yZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZLZFltUUlyVkpINERjcG15OVRmbXh3N1gyNysxL2hycEo5UnhRVFVXODA2?=
 =?utf-8?B?M2FZVWFibFBNaVNyTUo1M1dXN0YyWGh3WkM5b0lxRGNzTzZFZEp0TjhpWWRu?=
 =?utf-8?B?a09NZVJDdFl0Uzh0ZG1yWlJ1dC8wTlBWZ0YwUURpRGdJQUNzSVFZbklqMWVN?=
 =?utf-8?B?NUY3Rnl5cU1NM2dWNE5vUWZweTVwNWtIaGo4ejNwZVEyQ3d0NDAvQm9YWFJu?=
 =?utf-8?B?L0JnRElodktjZzMxRnI3WWtmMHpOZktHUExIdU95MEZjSHlIZjFHak1sZXV3?=
 =?utf-8?B?ejkrcC90eGdGMEZUZW5YdUxzOFZKaDlLb2YzNGxNRFBVVjllNERHREh5TlN4?=
 =?utf-8?B?dTFsNXdwT0xjK1U1WFRVMnk4OEdqWkhDNXNSOWptdDlFclhteS9abGs0Vklj?=
 =?utf-8?B?dFdMdm5MeGVRemhja004dVhpc2tsL1dGYXFJQytDbEZ0V3lEbjQ2THdSZXIy?=
 =?utf-8?B?dFhJNzR3Yi9CeEM5emFtZlZoZkVnNW92RkVqNTdOM2VLblFaMEVVYldBYklO?=
 =?utf-8?B?Z2xjdERWQ3pvUFJ2eURZbnJtTmlSL1piR3M5bjFhcE5Zb0RuSGF0MkxYTjBW?=
 =?utf-8?B?alU0cllPSWFSd29EMkF5WmFwb1c1OVFUeCtGdUxEWmhKR3pjeVFIU1Q2eHRa?=
 =?utf-8?B?TmJRSDM4Z0F3TGxVd3dYNWpYZFhlaTJTR3hyRWcwS0c4NHVDSExFMGlCbFBw?=
 =?utf-8?B?WHlrSlJEVUkyeHpqMk5IQjBLNC85Z3NEclNiUkFZczUzYW9SOWpxeERMSCtF?=
 =?utf-8?B?ZHJ5eWhwdmNoMGxJVGJEVURLakFKd3BWRHcyVFVaNU1TVkdQOG5iZGVUb0dr?=
 =?utf-8?B?c2hVM3FDZ3pFWUJzbnFFd3cxWVVnVmJxM0tDTno2QTBUc0hEM0VxWmpqY2gr?=
 =?utf-8?B?Q0hXc2hDdlo2QndWYWI3OUFpa2tLZWlUZ3ZTRXBzdHdCakF1MTB0TnFCb2FM?=
 =?utf-8?B?SXViVC9oalg4Z1JEdzFWTUs0STdVdDU5cVJGU3NKOFJEWnFLNVU0L0lIdDRB?=
 =?utf-8?B?dldpV2tFbUt0T0dmT1IzNndDMVFPSDAwUHBvREFQSzZvNytQTXpxZkJReGJQ?=
 =?utf-8?B?QTk5eHk2YkRiUHRYak5DMXdQVUhNaHJMNmN1U2E1UEthTTBsRlY5YTVyUkhv?=
 =?utf-8?B?bFhPd3g5MFZUS2Jzd3plRTlGVUN6ejlzYzhvb0d3U2RGREcwQm5HTStOVWRy?=
 =?utf-8?B?bHllNUlyd2hGdVhLMXcvYWJrY2U2Vkw0ek9WRDBBQVRpUEdMdkUvcU1Nb1JF?=
 =?utf-8?B?ekVja2FqNnRscWRNVlQwSC8rQktsZFZsdHV5elFsR0g1bDJ2THo0VVVvZm55?=
 =?utf-8?B?SWFyYmN0Vkh5c292cHg2MjNtRU8wTzBOcERhSW9YOFArb3g5WVNSa3haKzU0?=
 =?utf-8?B?UDl5ZGwzYkxaNkhqR2oxT00zV2VxbDhhSEMvbFNsWmpSbjF3ZDI4MkRLZTVl?=
 =?utf-8?B?amJHQ1h0R0w4bTNWTjJJbkhWdnp4NkVFc21yRHFHTjFFeVZPRXE1TFZQMnJL?=
 =?utf-8?B?bTZieWo4eVc1Tnl2RXphRVN5VkthSDBrL1VuTHZWOEJBNEY3VnFkZURmMVl4?=
 =?utf-8?B?TzAvNlU5WEplMWpHQWVpRFZ5Qkd5dkVFbTZET1NOQVRlZCtyM3BDSFl1YVF0?=
 =?utf-8?B?N21oeTczeVhOQjdHZmJIb21SdkhtSmdaTW5IT1gxL2pNZTkwSlhWdGZ1Q0hJ?=
 =?utf-8?B?S3NEQitBY01Dc0MzU3R5Wmd4amtkbjJhcEpLVGJpd3F5T0dRYTBpc0EyNGRx?=
 =?utf-8?B?eE8xZVM5MDBINnJ2aTZmbDh1eHltZW1FNnBYSVRxS2Z2SStURysvZi9yaThL?=
 =?utf-8?B?QVVlbTZubk05Vm5lUElMc2k2K0JUdytRajNEZWNhdVBtVEtLWjBFSHg3aGlR?=
 =?utf-8?B?Qi9hVWtIV1NwNFczaEVTM0VyMWNValFWQzdUdFc3cWsvamt0R1ZVcDVJSTc3?=
 =?utf-8?B?WEVqa1Q5dC9hRWhmdzU5UVpsWUhWakEzUG9UbEd2V3J0MFdYQ1k5QitqWThT?=
 =?utf-8?B?dzFIUWFmS2hjOFNWVmtoaVc0VjE2SWs3cFk3QnM5L2laOUNuVjcydWtMK1lu?=
 =?utf-8?B?QTc2S2ppdzA3VmRidlZUZEdNVUpEcStidnMvMmE0dzltamh2bmpkSW91d013?=
 =?utf-8?Q?43R3hirGJ1ZoxJqIo3A5wpZWi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735f4f20-a2b4-42bf-0682-08dcb67e9ad4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 01:16:46.1699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+h/bIgTpBZfEtTs5hK+H9cF29QH8hov5g+R6yPBBp86bnRtprvcq4vW3EzxdIUJPhgyaUM86BLNh87OlpKXMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7595
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

--------------0GMF1dAbnuiQ7PletGhtEoy4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The change look good to me.

Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com

On 2024-08-06 21:06, Liang, Prike wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Ping for the patch.
>
> Thanks,
> Prike
>
>> -----Original Message-----
>> From: Liang, Prike <Prike.Liang@amd.com>
>> Sent: Thursday, August 1, 2024 6:59 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Zhang, Jesse(Jie)
>> <Jesse.Zhang@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Liang, Prike <Prike.Liang@amd.com>
>> Subject: [PATCH] tests/amdgpu: update bad length case
>>
>> In the bad length case, when the header length has more than 4dwords than
>> packet stream length then CPFW will pending on the stream data and raise a
>> CP halt error which requires do the pipe reset. As to the orignal case of
>> header length is smaller than PM4 stream length then the PM4 stream data
>> may will create a bad opcode error which only requires the queue reset. So
>> for testing the pipe reset need to update the header length bigger than the
>> PM4 stream data length.
>>
>> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
>> ---
>>  lib/amdgpu/amd_ip_blocks.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c index
>> f675b97dd..3ffacc065 100644
>> --- a/lib/amdgpu/amd_ip_blocks.c
>> +++ b/lib/amdgpu/amd_ip_blocks.c
>> @@ -189,7 +189,7 @@ gfx_ring_bad_write_linear(const struct
>> amdgpu_ip_funcs *func,
>>                     const struct amdgpu_ring_context *ring_context,
>>                     uint32_t *pm4_dw, unsigned int cmd_error)  {
>> -     uint32_t i, j;
>> +     uint32_t i, j, stream_length;
>>
>>       i = 0;
>>       j = 0;
>> @@ -198,6 +198,11 @@ gfx_ring_bad_write_linear(const struct
>> amdgpu_ip_funcs *func,
>>         * But the range applies to all asics.
>>         * 0xcb-0xcf, 0xd2-0xef, 0xf1-0xfb
>>         */
>> +     if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
>> +             stream_length = ring_context->write_length / 16;
>> +     else
>> +             stream_length = ring_context->write_length;
>> +
>>       if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
>>               ring_context->pm4[i++] = PACKET3(0xf2, 2 +  ring_context-
>>> write_length);
>>       else if (cmd_error ==
>> CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
>> @@ -223,7 +228,7 @@ gfx_ring_bad_write_linear(const struct
>> amdgpu_ip_funcs *func,
>>               ring_context->pm4[i++] = upper_32_bits(ring_context-
>>> bo_mc);
>>       }
>>
>> -     while (j++ < ring_context->write_length)
>> +     while (j++ < stream_length)
>>               ring_context->pm4[i++] = func->deadbeaf;
>>       *pm4_dw = i;
>>       return i;
>> --
>> 2.34.1
--------------0GMF1dAbnuiQ7PletGhtEoy4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>The change look good to me.</p>
    <p>Reviewed-by: Vitaly Prosyak <a rel="noreferrer">vitaly.prosyak@amd.com</a></p>
    <p></p>
    <div class="moz-cite-prefix">On 2024-08-06 21:06, Liang, Prike
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DS7PR12MB60050E9E343F11B751C36AFBFBB82@DS7PR12MB6005.namprd12.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">[AMD Official Use Only - AMD Internal Distribution Only]

Ping for the patch.

Thanks,
Prike

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Liang, Prike <a class="moz-txt-link-rfc2396E" href="mailto:Prike.Liang@amd.com">&lt;Prike.Liang@amd.com&gt;</a>
Sent: Thursday, August 1, 2024 6:59 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Prosyak, Vitaly <a class="moz-txt-link-rfc2396E" href="mailto:Vitaly.Prosyak@amd.com">&lt;Vitaly.Prosyak@amd.com&gt;</a>; Zhang, Jesse(Jie)
<a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a>; Deucher, Alexander
<a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Liang, Prike <a class="moz-txt-link-rfc2396E" href="mailto:Prike.Liang@amd.com">&lt;Prike.Liang@amd.com&gt;</a>
Subject: [PATCH] tests/amdgpu: update bad length case

In the bad length case, when the header length has more than 4dwords than
packet stream length then CPFW will pending on the stream data and raise a
CP halt error which requires do the pipe reset. As to the orignal case of
header length is smaller than PM4 stream length then the PM4 stream data
may will create a bad opcode error which only requires the queue reset. So
for testing the pipe reset need to update the header length bigger than the
PM4 stream data length.

Signed-off-by: Prike Liang <a class="moz-txt-link-rfc2396E" href="mailto:Prike.Liang@amd.com">&lt;Prike.Liang@amd.com&gt;</a>
---
 lib/amdgpu/amd_ip_blocks.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c index
f675b97dd..3ffacc065 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -189,7 +189,7 @@ gfx_ring_bad_write_linear(const struct
amdgpu_ip_funcs *func,
                    const struct amdgpu_ring_context *ring_context,
                    uint32_t *pm4_dw, unsigned int cmd_error)  {
-     uint32_t i, j;
+     uint32_t i, j, stream_length;

      i = 0;
      j = 0;
@@ -198,6 +198,11 @@ gfx_ring_bad_write_linear(const struct
amdgpu_ip_funcs *func,
        * But the range applies to all asics.
        * 0xcb-0xcf, 0xd2-0xef, 0xf1-0xfb
        */
+     if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
+             stream_length = ring_context-&gt;write_length / 16;
+     else
+             stream_length = ring_context-&gt;write_length;
+
      if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
              ring_context-&gt;pm4[i++] = PACKET3(0xf2, 2 +  ring_context-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">write_length);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">      else if (cmd_error ==
CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
@@ -223,7 +228,7 @@ gfx_ring_bad_write_linear(const struct
amdgpu_ip_funcs *func,
              ring_context-&gt;pm4[i++] = upper_32_bits(ring_context-
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">bo_mc);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">      }

-     while (j++ &lt; ring_context-&gt;write_length)
+     while (j++ &lt; stream_length)
              ring_context-&gt;pm4[i++] = func-&gt;deadbeaf;
      *pm4_dw = i;
      return i;
--
2.34.1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0GMF1dAbnuiQ7PletGhtEoy4--
