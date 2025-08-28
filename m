Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC39DCA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 02:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566B010E113;
	Thu, 28 Aug 2025 02:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FOdwRDuf";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2215110E113
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 02:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wctQ8AzaUKMpPi6SPsfGLXd/AWhvEG+nchCae7TdjlUC5i0XMeWVkq6wyHttDtQYe7JzO5EmlRI2J7/x1KbgnrAq49sbXzsp+ddNNVSd93g1B1xUv+DqZyMF7ebY/i/XjRPz40mggnbQmXEu+gA6HEZuVsbNQ3j/CUzg6Fj4VPFcweD023unB/3tMfHvg108xx/MOh1MfcTFm8L5gTPO7+2Jf3XmRGCBtfEw8LceyW5dbBEDiCSdaKoLD1YbX9ti0UEDFbvQ0c/6FUddZY4yBbHngY0OO6r7lG/C1rCtX6pxqH9oQpQn+Lhs6SejLdptJINZQg4xUUXBMD/HxiM0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTLchgsE3jw8eESe5fF6xDQFiiT66knLKcsuzMZgl7I=;
 b=Oe9/U9RQKHVlx9m5i7V0aV/xnlT6pX6px0GH+LpPxgwKj8wzd4yYuxrCCMHrSrE/b3sjWW7cxldqewkJqKPJ8En1v6Co/53/as1QRWpGx6dHpSnjLu/IAHnHk7PplAKGO8vzqGINjbRqdOmtw9bTIjV6QBsWxBM0V/39GTcjW15JcEgXXKwbRdG7iXGdepiHfvVS8ZDLtWHxXHXPPHpTISSm+v8WgW9dD4j8xjIRtohBp8sqxSklQGEmr9eqi1wQ9rkRebM5H2YvY4TIkKps08llWnkxHUuuVRJt3mGNGx0KF7yFhSu0ee9Yt5z9DYWVcLuRXqTQCjm6EJZ/KZpP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTLchgsE3jw8eESe5fF6xDQFiiT66knLKcsuzMZgl7I=;
 b=FOdwRDufIBj7LbU56psJoUVMcKMMUcmsjBfm2mtvKyk6Mn13NMMPXmcM6oYXH9n4N3pAo+LVpMrI5Bcxy1H3vK1RUp3MNYl+PSReUhd+uEj+g3/URXW+/H0pWr0g3LfvNbpDjmLnJMaETgbAbsfEUtCfFQbh4GGRf9BVQb+5IT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 02:02:45 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 02:02:44 +0000
Message-ID: <4109a6fd-f3a9-41e3-b033-7d1db03cdf0e@amd.com>
Date: Wed, 27 Aug 2025 22:02:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5] runner/executor: Abort if dmesg is flooded
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>,
 Karol Krol <karol.krol@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20250826125329.109160-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250826125329.109160-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0097.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::29) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MN2PR12MB4253:EE_
X-MS-Office365-Filtering-Correlation-Id: 50923e9f-72c6-409c-927b-08dde5d6fa71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blNyMG1EYmlBVGtSL3VERkY3K1k3ckJvZVNKZ2JaMUVYbWs4Nm11bDRWRE83?=
 =?utf-8?B?MCtkem44NExmZGg3L2k0R1luV0I4MHU3MkIyMkxlbHRZU1BVUUx1V0licXJV?=
 =?utf-8?B?NFdMVExWZG91bE5GeHUxbmpUVWVvOVpFVUpWeGhGNDJDbmhCWGdzT3NOeWZh?=
 =?utf-8?B?K3N0VUs4WnZuRktTWCt0aEgvTGhxY0NJbzMvY0QvYTVXcnZZbHlLdGlTa09t?=
 =?utf-8?B?dC96MjAza3dvN1QvcHZqY1FoaStqTkxnNkZ2UGt5Yzk2TFNQLzZDR3hEWlNP?=
 =?utf-8?B?S1NDcTlMYUt3YXlWVi9WbXZDd2VncmJmREFuSU4vRUxzelJFWktYYis3eFNw?=
 =?utf-8?B?a1BqOVE0czgxL1BsY1ZwMlR3eWdibFJOaXRNRTdmWFB2NkZJdDFHbC9qSnNs?=
 =?utf-8?B?MlZ3a29wL2RTMk9CY0N1b3NIbDFXL0JzMG1qMG9zZDhlUVBQQTZqRjk5VDZv?=
 =?utf-8?B?YWFHb3F0RXQxSU1Ia0UrNko0WHZqVnZpNXcyY2daYVhDK01MbzNkSGlPWlk3?=
 =?utf-8?B?WmpyZlBGNllVcmZTamNYUVBHbm91YkRWWk1YckVYaE1VZHd6YkVVUWlKQXdM?=
 =?utf-8?B?TGIxRURtWkdPaHZKSUw1U2kvaWxQemNGUnBGUXJ4V3pCM3RXYWZYVHJKZFY4?=
 =?utf-8?B?UjZ2SG5WMEkzU3l4a2ZRNWdvbndRaUJ3R1lwTXYxdjF4MEhGbmFRUFl3SDVK?=
 =?utf-8?B?bHIrS1g5Zmx0dkNJU2J4ejlodDdFYytnblM2Wk10bW5jRnhxQjhYd25KdmE0?=
 =?utf-8?B?WGZjbEl1Ky9JUW9mbW9uUXNsbDRBYkxWU3hBTkZXQWhiUjBoblB1djF1ZEoz?=
 =?utf-8?B?eTh2VTA4UVZ3N2RqNmhacWMybU5Nb1QwMGJ0Y2R0TWp1SVVVVWtseVJ5b0o0?=
 =?utf-8?B?VVBsVWVxZGtlTng5NzlzUk1sWXY0ekw2cTJTczV3N05wUEVDMFlrajFQalk0?=
 =?utf-8?B?NmRQNUdodHU2OGsxWUFiZ29QRWt3WlZ0TklkSkhUV1JOMnFMRGRvcHEvc0F0?=
 =?utf-8?B?UlgzNGVvdEhtdFptc0grNUp2anEyTUVlMVNoS1hML1VKNGtLWFBidEl5MVUr?=
 =?utf-8?B?c3ZvNmt0cStVVUhwS2YwSW5Zb1I1TFpnOStQM3FlUG85SGJMSEs2a1FmaG11?=
 =?utf-8?B?eStiM05VYmVQTERxcVJzQ0dJZGNjN0VtdDc1RWZZNXN4a3owaWtLOEgvYVdG?=
 =?utf-8?B?ZTZZanpEbS9aaFlWVlRYaUltRW5ld3NRQmRKY2dOY1MxNlRMSGgycndYcmRT?=
 =?utf-8?B?dWJuTHE1ZG94RWtJdjdyanlIL2ZBcDgrcDBJVGx6ZjY2ODd4N0Z1NTk0WXZw?=
 =?utf-8?B?NVZFRExWTkxKN2xCSGh1dzRIRlFNTlAreVA5aUIxeVZERUlUQTRIVUlGM3hN?=
 =?utf-8?B?a3YzckcrbWhIZ0Y0QmZ1UGp4V2JDSVBwTi9NWkR5NEVKbE03b285ZERDTTZz?=
 =?utf-8?B?MTB1UFlnQXNtWUVuWENCMXUzN0pwRjh4dHZJcmZyOHF2dW5MTHE2UUVJRWxN?=
 =?utf-8?B?Nzc4czBtSWVjbDUvTi9WS3B5SmR3SE9hM2NqTXFZSzVjeW1INkhTTXhieldX?=
 =?utf-8?B?SjAzYkRlZWMrcjFBbTdOeittZzlyNWhrY3h3RTRVNE8wOXdHTTI0d042S1ky?=
 =?utf-8?B?cUhnb3pKR0JHMFJLcmNoTHdKMmdrRVEzRGwwbG52NUdxaUVoV2N2MFlBZlVs?=
 =?utf-8?B?akU0UWhaY2gzQW9YYjFRK1ZxcWhTeEdaV2FmQVgrVkI3R3dEMzZhMThpU0lK?=
 =?utf-8?B?azF5TUQ3bGJZQVdmemVsNExRc25wb3VITE5pYVYrUXVaOEZqcEYvNzVYVDNm?=
 =?utf-8?B?ZFFTdFlsRFQyVktsV1BXOS9Fc1lXaGV2Ym03R0NLN3A0VE1DREZmeDh1R2l0?=
 =?utf-8?B?RlBjMWdndkxDNzhxOGx5YWdOeFlEOUkzQ1VhK2U3TVdYR1pxeU1YaXMwOUhB?=
 =?utf-8?Q?zZBonde5n2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlY0RjdOSE91Rks2eW0zM2Z3ekNlK2NzSSs5UHRnZXZCK2d4WDNNL0tDenc3?=
 =?utf-8?B?Q3RJb3BPbnl4Z0VmQ1F4cmlDRExMcFVnWCtDUWZwTTlCNlpVVGg5bUZvQlRk?=
 =?utf-8?B?b0tIdE5lcExTQmgvaXVJRnNvbkpzNk5xUTV4eVJNT3liUms0bDBraUpOWUJx?=
 =?utf-8?B?UWdYLzFkdEUveXNEYlltZjEyR3dYaVArZVdGZ2lraUQ4R3ZwWnI0Y25haXIw?=
 =?utf-8?B?NTdrMWpxRWJQWXNQcVlvSnFIWXhqV1J5ZWxoMGIzSjczTTBCc3BwOGZqa21P?=
 =?utf-8?B?UmxVZjEzMXRrU0RtWEtPc2NuQmhyOEFOdXdtbmNwTFJuaWtwRStuUlZtdHVN?=
 =?utf-8?B?b1JmNnNqUE8raHY1M3REU3prNnpHcmVYczVJMGxyOUxxTEpUNVJMQlQxNkUw?=
 =?utf-8?B?ZFlQcHZ0MmhNK0R4THNQSU1zYlFjYktzdGFrS2I1MVJYTXNFcThMQzcyK01u?=
 =?utf-8?B?V1BHWGo1YnNXZ2xLRHgxelBwMHVWOEpSaSs5dkhVRkd0eUJLUzFjRDh3dktx?=
 =?utf-8?B?M2Vxb245cGdlcC90YWNMdDJJVjBoOWNNaUVaQVg3Z1ZObFQ3Z1pRQjQyWWxr?=
 =?utf-8?B?K3VBSnpSdW92MmU0cGJMcXhjTXJ2OXJsVTBlZ0ZLaGxIcjFVRzlENTlNYlV5?=
 =?utf-8?B?SFZNTnV3K01FQjNJamVHQ1V3bTFsbWFVMUtQVmd0cmVQNDBtckthRFExamNn?=
 =?utf-8?B?aDZBeDNielphRzVHZG9lR3VaVzZUTzZVWGQ3dmJaOUhjaE5aZ1BXeU9ac1k4?=
 =?utf-8?B?KzR3TGdieHpiKzUyLzBPY25BTkY2Q08zd1ZKQ1A1RnRHcFYzQXd5MUFzTVEx?=
 =?utf-8?B?TllzMmtiYWxpQXk1WW11dXd3Wmc2TlAyTTlUQXI3Z1hsV0Z6UlZrUFk1WHZy?=
 =?utf-8?B?eEdzMEVqMEs4dlBvSUVEL2N2dnFRSXhSbmo4cFV5QUdLRjUxK2hTS3R1bVRZ?=
 =?utf-8?B?YW0va1ZscGtvd1UyNmd6MDJ3OHRubGtUSDFWOUxhSUZjeC9kbEphRXFOdHov?=
 =?utf-8?B?RXo3MjZiSVBEQzRsUXozZlB6UlQ0Q1MvL2RKVEx4ZEs3ME5qUW5pZWN5cVk0?=
 =?utf-8?B?ekNuTHo2dW1CUHN2VGE2TjJlRHJSNlMwcitrMHVKcktPd1pJZ29sQjgvcWFu?=
 =?utf-8?B?ZEFwM1p0dWpRaFk1N0xHR2p0M1ZpQTZWenR3emJJRDh3RGxsRnRuMDNGRndj?=
 =?utf-8?B?dS85a3pkaEJBaEhZMnlsWWdnUkNDNGN2TXZwR04xNFpwV2ZhdklHdVh4eEtJ?=
 =?utf-8?B?cStlZDZMYlNmMytkNWkzUWJNaU5vRXlRYS9EVXBycEdCTnBXV0t6bzZnU2lt?=
 =?utf-8?B?YS94c0FTUWFlUDRnMkoyajQrenNZMlU5WGJ5d2M3amNjNDF6clEyUll4Y1Er?=
 =?utf-8?B?N01CTTkrdGpPMSthOUxzRk4yc2lOZ2d2SjlwRUZTbjYyUzRYcVQvOXFhSXZl?=
 =?utf-8?B?YUFhMWJIdGNsbEMwQnBaY1d1ZzEyNmliTnZvcHBiQTIrakxsYm9ETVBxQ0NX?=
 =?utf-8?B?dVhlMDZ6NGF0ei95ZXltU0ZEWVN5VHlQRHJwUDVMTnNjRC83NTBPZGFvTHE3?=
 =?utf-8?B?MjM0ejR6bzdPMTRvQ3h2REZ0UW1iT0lsMy9zNnAwTkQ0N3J2UlRPakRwU1BS?=
 =?utf-8?B?d0NXTW5yYnJpd2JVS25hMWpOUFhVZFF3VENOOFZNZDNXR0VQRjI3aTAvdDlI?=
 =?utf-8?B?VURPUUt2Rlg0QU15ekVodFFhRkJvU2Q4Q21TU1QvLzJOQkcxQWkwMUEwVjk5?=
 =?utf-8?B?am1HWjE4dkhndE1VUndMTDNFTk9UVnNheW5VMjhjME5FZ0N6UWZ6TUJEYUdr?=
 =?utf-8?B?L3NRcHBHeGVuWEJTZGxJaFVIRHFaWVA0Ri9mTldOZ1N1cUZyakpUNldzWDJB?=
 =?utf-8?B?Wld3SEg3YXVNOTA5c3JHSkRHVVA0SEtlc3V0U1V4eUlVNFFUOXFlbWVCY08v?=
 =?utf-8?B?MHBUb0pRcW9FNFArM2pQM0NOQitkMlltTTRqS1hEcFRkV2MwTC9hT1p4RnhM?=
 =?utf-8?B?bUk1NytOY0twOUpTcDh1Qlc2b3dvWXVXclNoMzJ3blRKaVkzWFFWK0lERWVj?=
 =?utf-8?B?OVN4eTNLenBhSFB2L0xiU1JJUU9qQlc5OUtvMUwyOVgvT01wTU9zRndkYVk4?=
 =?utf-8?Q?PSdAnw+vKqhY4eQHeWQbfr4Ap?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50923e9f-72c6-409c-927b-08dde5d6fa71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 02:02:44.5813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eDShaTf5Q4HjWOlqtqRxHp0FO4g109bzC+VmYHmgeZTj2zRzYwHajV17vMXtRpzF02rYnJ5G8SeBV/9uISA+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
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

The change looks good to me. Reviewed-by  Vitaly Prosyak <vitaly.prosyak@amd.com>

Just small correction below for edge case.

On 2025-08-26 08:53, Kamil Konieczny wrote:
> Current disk limit triggers once when it is exceeded during test
> monitoring. After that happens executor no longer checks if
> kernel is still printing plenty of messages.
>
> Create a way to abort test in such scenarios with the help of
> measuring kernel kmsg activity before first test is executed
> and then also check it after exceeding disk limit.
>
> Also print info about it after each test ends.
>
> v2: fix error when kmsg open fails, fix reading proc (Kamil)
>   changed calculation of max bps (Peter)
> v3: abort only when disk limit was actually exceeded,
>   print info instead of aborting after every test (Kamil)
> v4: added abort at main monitoring loop, also cleaning up
>   printing messages (Kamil)
> v5: fix typo, use less vars in a loop  (Krzysztof)
>   reused existing dmesg reading function (Kamil)
>
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Karol Krol <karol.krol@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 143 +++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 128 insertions(+), 15 deletions(-)
>
> diff --git a/runner/executor.c b/runner/executor.c
> index 847abe481..b11381f39 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -637,6 +637,11 @@ const char *get_out_filename(int fid)
>  	return "output-filename-index-error";
>  }
>  
> +static int open_kmsg_rdonly(void)
> +{
> +	return open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK);
> +}
> +
>  /* Returns the number of bytes written to disk, or a negative number on error */
>  static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  {
> @@ -646,6 +651,8 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  	 * /dev/kmsg doesn't support seeking to -1 from SEEK_END
>  	 * so we need to use a second fd to read a message to
>  	 *  match against, or stop when we reach EAGAIN.
> +	 * If outfd==0 it will not write anything but still count
> +	 * how many bytes was readed from dmesg.
>  	 */
>  
>  	int comparefd;
> @@ -711,7 +718,9 @@ static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
>  			return written;
>  		}
>  
> -		write(outfd, buf, r);
> +		if (outfd)
> +			write(outfd, buf, r);
> +
>  		written += r;
>  
>  		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
> @@ -948,6 +957,76 @@ static size_t calc_last_dmesg_chunk(size_t limit, size_t disk_usage)
>  	return dt != 0 ? dt : -1;
>  }
>  
> +/*
> + * Tries to read from dmesg for 0.1 seconds
> + *
> + * Returns:
> + *  =>0.0 - Success, measured kmsg activity in bytes/second
> + *  -1.0 - Failure
> + */
> +static double measure_dmesg_bytes_per_sec(int wrfd)
> +{
> +	struct timespec time_beg, time_now, nsec_sleep;
> +	unsigned long long dmsg_read, rnow;
> +	double time;
> +	int kmsgfd;
> +
> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> +		errf("Warning: Cannot open /dev/kmsg\n");
> +
> +		return -1.0;
> +	}
> +
> +	lseek(kmsgfd, 0, SEEK_END);
> +	nsec_sleep.tv_sec = 0;
> +	nsec_sleep.tv_nsec = 10ULL * 1000ULL * 1000ULL; /* 10^7 nanoseconds = 10^-2 sec */
> +	runner_gettime(&time_beg);
> +	time = 0.0;
> +	dmsg_read = 0.0;
> +	while (1) {
> +		rnow = dump_dmesg(kmsgfd, wrfd, 64 * 4096); /* 64KB max */
> +		if (rnow > 0)
> +			dmsg_read += rnow;
> +
> +		runner_gettime(&time_now);
> +		time = igt_time_elapsed(&time_beg, &time_now);
> +		if (time <= 0.0) {
> +			errf("Warning: Time underflow\n");
> +			return -1.0;
> +		}
> +
> +		if (time >= 0.1)
> +			break;
> +
> +		if (rnow == 0)
> +			nanosleep(&nsec_sleep, NULL);
> +	}
> +
> +	runner_gettime(&time_now);
> +	time = igt_time_elapsed(&time_beg, &time_now);
> +	if (time <= 0.0) {
> +		errf("Warning: Time underflow\n");
> +
> +		return -1.0;
> +	}
> +
> +	return (double)dmsg_read / time;
> +}
> +
> +/* Returns: true if ratio lower or equal than maxratio */
> +static bool check_dmesg_ratio(double maxratio, int log_level, bool sync, int wrfd)
> +{
> +	double new_dmesg_bps = measure_dmesg_bytes_per_sec(wrfd);
> +
In the current patch, if /dev/kmsg can’t be opened, measure_dmesg_bytes_per_sec() returns -1.0, but later code still compares it against max_dmesg_ratio. That means a negative value could accidentally be treated as “ok” and cause misleading results.

The safe fix is to short-circuit inside check_dmesg_ratio() whenever measure_dmesg_bytes_per_sec() returns a negative number. For example:

static bool check_dmesg_ratio(double maxratio, int log_level, bool sync, int wrfd)
{
    double new_dmesg_bps = measure_dmesg_bytes_per_sec(wrfd);

    if (new_dmesg_bps < 0.0) {
        if (log_level >= LOG_LEVEL_NORMAL) {
            outf("Dmesg ratio: unavailable (no /dev/kmsg)\n");
            if (sync)
                fflush(stdout);
        }
        return true; /* don’t gate on missing measurement */
    }

    if (log_level >= LOG_LEVEL_NORMAL) {
        outf("Dmesg ratio %0.3fKB/s\n", new_dmesg_bps / 1024);
        if (sync)
            fflush(stdout);
    }

    return new_dmesg_bps <= maxratio;
}

> +	if (log_level >= LOG_LEVEL_NORMAL) {
> +		outf("Dmesg ratio %0.3fKB/s\n", new_dmesg_bps / 1024);
> +		if (sync)
> +			fflush(stdout);
> +	}
> +
> +	return new_dmesg_bps <= maxratio;
> +}
> +
>  /*
>   * Returns:
>   *  =0 - Success
> @@ -960,6 +1039,7 @@ static int monitor_output(pid_t child,
>  			  int *outputs,
>  			  double *time_spent,
>  			  struct settings *settings,
> +			  double max_dmesg_ratio,
>  			  char **abortreason,
>  			  bool *abort_already_written)
>  {
> @@ -1463,29 +1543,31 @@ static int monitor_output(pid_t child,
>  				 * exceeded the disk usage limit.
>  				 */
>  				if (killed && disk_usage_limit_exceeded(settings, disk_usage)) {
> +					char killmsg[256];
> +
>  					timeoutresult = false;
> +					snprintf(killmsg, sizeof(killmsg),
> +						 "runner: This test was killed due to exceeding disk usage limit. "
> +						 "(Used %zd bytes, limit %zd)\n",
> +						 disk_usage,
> +						 settings->disk_usage_limit);
>  
>  					if (socket_comms_used) {
>  						struct runnerpacket *message;
> -						char killmsg[256];
>  
> -						snprintf(killmsg, sizeof(killmsg),
> -							 "runner: This test was killed due to exceeding disk usage limit. "
> -							 "(Used %zd bytes, limit %zd)\n",
> -							 disk_usage,
> -							 settings->disk_usage_limit);
>  						message = runnerpacket_log(STDOUT_FILENO, killmsg);
>  						write_packet_with_canary(outputs[_F_SOCKET], message, settings->sync);
>  						free(message);
>  					} else {
> -						dprintf(outputs[_F_OUT],
> -							"\nrunner: This test was killed due to exceeding disk usage limit. "
> -							"(Used %zd bytes, limit %zd)\n",
> -							disk_usage,
> -							settings->disk_usage_limit);
> +						dprintf(outputs[_F_OUT], "%s", killmsg);
>  						if (settings->sync)
>  							fdatasync(outputs[_F_OUT]);
>  					}
> +
> +					if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
> +						asprintf(abortreason, "Dmesg ratio exceeded during test run.");
> +						aborting = true;
> +					}
>  				}
>  
>  				if (socket_comms_used) {
> @@ -1587,7 +1669,7 @@ static int monitor_output(pid_t child,
>  	dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], dmsg_chunk_size);
>  	if (settings->sync)
>  		fdatasync(outputs[_F_DMESG]);
> -	if (dmesgwritten > 0) {
> +	if (dmesgwritten > 0 && !aborting) {
>  		disk_usage += dmesgwritten;
>  		if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
>  			char disk[1024];
> @@ -1599,6 +1681,11 @@ static int monitor_output(pid_t child,
>  			} else if (killed) {
>  				errf("%s", disk);
>  			}
> +
> +			if (!check_dmesg_ratio(max_dmesg_ratio, settings->log_level, settings->sync, outputs[_F_DMESG])) {
> +				asprintf(abortreason, "Dmesg ratio exceeded after test ends.");
> +				aborting = true;
> +			}
>  		}
>  	}
>  
> @@ -1766,6 +1853,7 @@ static int execute_next_entry(struct execute_state *state,
>  			      size_t total,
>  			      double *time_spent,
>  			      struct settings *settings,
> +			      double max_dmesg_ratio,
>  			      struct job_list_entry *entry,
>  			      int testdirfd, int resdirfd,
>  			      int sigfd, sigset_t *sigmask,
> @@ -1814,7 +1902,7 @@ static int execute_next_entry(struct execute_state *state,
>  		goto out_pipe;
>  	}
>  
> -	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
>  		errf("Warning: Cannot open /dev/kmsg\n");
>  	} else {
>  		/* TODO: Checking of abort conditions in pre-execute dmesg */
> @@ -1885,7 +1973,7 @@ static int execute_next_entry(struct execute_state *state,
>  
>  	result = monitor_output(child, outfd, errfd, socketfd,
>  				kmsgfd, sigfd,
> -				outputs, time_spent, settings,
> +				outputs, time_spent, settings, max_dmesg_ratio,
>  				abortreason, abort_already_written);
>  
>  out_kmsgfd:
> @@ -2418,6 +2506,8 @@ bool execute(struct execute_state *state,
>  	     struct settings *settings,
>  	     struct job_list *job_list)
>  {
> +	static double dmesg_bps = -1.0;
> +	static double max_dmesg_bps = -1.0;
>  	int resdirfd, testdirfd, unamefd, timefd, sigfd;
>  	struct environment_variable *env_var;
>  	struct utsname unamebuf;
> @@ -2560,6 +2650,26 @@ bool execute(struct execute_state *state,
>  		}
>  	}
>  
> +	if (max_dmesg_bps < 0.0) {
> +		double ncpu_bps = 4 * 1024 * max_t(size_t, sysconf(_SC_NPROCESSORS_ONLN), 4);
> +		double set_bps = 0.0;
> +
> +		dmesg_bps = measure_dmesg_bytes_per_sec(0);
> +
> +		if (settings->disk_usage_limit > 0 && settings->per_test_timeout > 0)
> +			set_bps = (double)settings->disk_usage_limit / (double)settings->per_test_timeout;
> +
> +		outf("Dmesg KB/s ratio settings:%0.3f ncpu:%0.3f current:%0.3f\n",
> +		     set_bps / 1024, ncpu_bps / 1024, dmesg_bps / 1024);
> +
> +		if (set_bps > 0.0)
> +			max_dmesg_bps = set_bps;
> +		else
> +			max_dmesg_bps = dmesg_bps > ncpu_bps ? dmesg_bps : ncpu_bps;
> +
> +		outf("Using max level dmesg ratio %0.3fKB/s\n", max_dmesg_bps / 1024);
> +	}
> +
>  	for (; state->next < job_list->size;
>  	     state->next++) {
>  		char *reason = NULL;
> @@ -2596,6 +2706,7 @@ bool execute(struct execute_state *state,
>  						    job_list->size,
>  						    &time_spent,
>  						    settings,
> +						    max_dmesg_bps,
>  						    &job_list->entries[state->next],
>  						    testdirfd, resdirfd,
>  						    sigfd, &sigmask,
> @@ -2651,6 +2762,8 @@ bool execute(struct execute_state *state,
>  			break;
>  		}
>  
> +		check_dmesg_ratio(max_dmesg_bps, settings->log_level, settings->sync, 0);
> +
>  		if (result > 0) {
>  			double time_left = state->time_left;
>  
