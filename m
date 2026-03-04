Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DB1EFCE33
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED49D10EA8D;
	Wed,  4 Mar 2026 17:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtA3Covy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588A710EA8A
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772647105; x=1804183105;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mGzxeSiMVN/2wCN1oXsc1i/zKjnQyS1uKWUxDjeuEHU=;
 b=mtA3CovyKUE3E+F4YrB8jgx3ANfpYaIUr5le8MuhwA23I6dUrRCiNZlI
 cx2HGR664F2cV34gr5QrFAgKrIV1cdn8MWpxs/6xN6OITI3Hq7oaE6Qw2
 /SNpbvOoKMlMKAhJlRsVVU3cwHe7E84s5CSR3t2ECh3psQU/jiagYKaOl
 0eOGYmQNHFBnbTnt7+SHiw82L7AP3xr0IJJbRLJoHxhqG0k9pZ1VoM5ra
 5gZl2R0of7veG3VN7kLTIys3f53q5ukc9UxhX9j10ZkUBvQcvSBgNpNdJ
 CEa/lJ/4G7uAjrKkhiwLeFmvJAgFrZsELCQPrNRpsqwetJJdDZfX/X/0Y g==;
X-CSE-ConnectionGUID: YYWa/X4lTp68NXfl7XBiaQ==
X-CSE-MsgGUID: 3wuPke0LRKuNvMPlKEogNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72743476"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="72743476"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:58:25 -0800
X-CSE-ConnectionGUID: Gb9p+poyQ6O7GhNdCsG3Fg==
X-CSE-MsgGUID: Rdv905xJSK6nH68nODGB3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215327308"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:58:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:58:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 09:58:24 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.68)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:58:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCJQSGM5RfvhGc69w/a1sRBdDB39t4xKbWJAECeIhhFMP7JqSqkwixbZnB+4Fjw+02ysUZb2nwCID1phmWLo9sbMsQ+dKaHzGnVhb7VA8ckNb46BO7ao8rbnLHcoNQ+WnTSBQ0hlyiKi/LoSJP1uNH8SqPNU5xE+BnvoDuodPpJMNvluFlbMMa0Q6Y1+yqgRNKdtAsW/O1exPsouCbFDkaxFei8LZWfoTdscskROUzsw4k5L6de7gacCKvnsF2tejFE/Cdm6/ujAHqlNXqsIq5jMLt9dH/Mg1jkHYgYB44DbkhigEpz8Za3pcoxUVFPgpPtpD0RcTMDjEND5zxKwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BT+YpT42zsX9kqCOaPOSkd6Wo+jtxBIcJRHzS9rJhrs=;
 b=ZNyPKMaEyDLNm01u9ukp1+wbi8FBZ9jW7RNYBHmS7EeFqu+1BYA3hsb+tlPoW1jMGvccQMq0dnrxkfIdwyyRp3sq09BxmPVDFZuVZXWk9k66337rKYhoJRY0yEdDfD57VTMMP8zusH4bVq0z5wvOzLiB+xAMSSB8SEysoprFDjCJtuiwuHVg4n6MOn/hlyHYvx/Y+kANUlrwcKCxYrk9rNCaDhMRIkMRTXJet5NRKjK5kKYViGUqD15cMIhddo76JcXKtuW4t8AnGiue/uLIqzUAMf4mcZUKtb4Y0t+e5Lxlhz+xUmqcUwsjtFmxmwNLEUXswDW0XExGDuYVBCa/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 17:58:21 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:58:21 +0000
Message-ID: <7d4b26c1-3005-4f81-b55c-2968885c3da8@intel.com>
Date: Wed, 4 Mar 2026 23:28:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] intel-ci: Apply xe chamelium delta changes
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Mohammed Bilal
 <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <kamil.konieczny@intel.com>, <kunal1.joshi@intel.com>,
 <karol.krol@intel.com>, <ryszard.knop@intel.com>
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
 <20260302101926.3015380-6-mohammed.bilal@intel.com>
 <20260304171233.edtlepgq4mttioie@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260304171233.edtlepgq4mttioie@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba438a4-8c0b-4cf8-659d-08de7a179f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: jqFfRYKM9wFuwMJXC21eDRRnB4GcJZ36SBPBdKJE/EtXhJFyYNaN2NtHgBMJb+huf7duWddqZ/0Qf5G/oonMujlDnRWChr1bvVaLWn7TK4P1DBQmCt9O25+7MkU8+yltlCfQEwcQSsn+9nQCEMZK/KCo7o1b/Yz2rlEju0II6beHWixJw+amURPApK9GHXyWqrBd6ttiP4lSB86TtrvCDvk/rRFqOp3o/B/Ma2vmNqfpwMC9Me7SmIvDm188nLAdHMfMciFhiXieVBsNWQ51xJ4whxRiY5lzGQVKEgbXxZhgfWD7WoEg3GfB5QAVlZXWVfVo/fe91eLzPJ9m0RMPcuoiCnpER/4dQop3roX7M1E8o1sKQsV9c8V8By4pBXXFRv1kcKDwt2FJi1Ypj7ya8C1KD13KfvWe/GYjZr+upXHI7pAmMR5Gy5rbq+w9BAbBwR+PbcHgsVZobnJ+bHRoMnwLD3d0zrv9M+Zy1AFZXwEw7ELluRNVpeI1K/bUXRXLu7zJtqdw6sRCfr/AjQwICdhSFPcvUPRiqm17wb1RWmdlwsn5G7p7LwC4PwgqW0NSUjRkMulywgU9Lu5fZfuJuGcZ8Czkujlt1dZtNdISGm5NwgZ+4jDcDABTV0d2PuslenBArLkI/JfbgUliwzBwfNa7gSjKJk4CChQMoHEC77CKDFS2Fn16xRo5fVYO9zzGsEEyDoSgJCz5H7FlNjncra3g717p9+fZxK+NnVnSLLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGlXTm9WVlVuQXpHcmJ4TkNlZHp0VVAveWphSE8wRThzVzNYaGY1SXFLeUk2?=
 =?utf-8?B?U0lxSlViSG1DaUxBMERvR3hENzcrTUNzOUZnM3BFQ291TStNVExBR3ZpQTcz?=
 =?utf-8?B?K3lPa3l6cW94ejZub3RzWXowRmsxNG9KMk5BS1d1RTN0ck8xbmdQQ2dTSWZP?=
 =?utf-8?B?MTFKK1VqM2JxQ21pSjk2SW5PMzZRTkFZMFJ1Qkp6N3NxN1ZNT1BITngxbkxt?=
 =?utf-8?B?a0YxZnZLVkhwYkh3eWRDbFpGc1NnZVc5OVNjNVJoV2UwUDBBNkVweHZqcmQ2?=
 =?utf-8?B?azhuLzdtQXE5dEpBMlUrb3llMVhMY1U5NWJvc2JSb09INlZKd2N2eWtFTnp1?=
 =?utf-8?B?QUhoMVJmSHgyU2dmVHl1MXlyZ1F5QWpUdFdYMTVDanlOQVFEYnVlWjVwaENz?=
 =?utf-8?B?S1VlTERoYUVoRU0rcnY2REhWbEtIajFFYmxhSlFuNGNnRUlqOGtRVG9XMUtF?=
 =?utf-8?B?S3RpMGh1d3orenR5SmlOVzkveGtiWjR6b2dMekJqZVBHc2RObnBPYzVZbUdi?=
 =?utf-8?B?SmFuS3NxTmdDbE5CT012TjdLTUgvLzNSaVdRNXZkZ1JrdkFXK2xhcldZd1hX?=
 =?utf-8?B?aTNGbEI1cXNnVDlGUFU4a3dTb2Q1QjlscTdramhYOUl1NmR6VzJCUWJmblox?=
 =?utf-8?B?UTdsSkpJLy9Sa0krM0RUdjNLaTVaRFl1dmI5RXlJclhEVk12WWhPM0VoOURs?=
 =?utf-8?B?NTIrVDVsT2dSM05ESEo5eG9lY1FnRng2VXZHN2tlU3BGRnBEb2lxUW5DbUNq?=
 =?utf-8?B?NDRTL0poVEZmV2h2MlZkSGlQVGJnSkJPQlZJWTFwTnZ4d29Ga3ZxZXdTQTVX?=
 =?utf-8?B?b1JtbDBKODNzTEsvMG1lZlRack1nZDlRcVNQdVdLMk1WMitZbDczTFRobkVn?=
 =?utf-8?B?OUNxenhzY0c0dkRsN3B3MlE1UWc1TE5sS01BajRWSm1yNGJnSDh6YU1jRUVB?=
 =?utf-8?B?Y3JYQVVpOUhtZ2hjQmFkNGxLemVXa3RwUVo0OGNkNTAyRHp0Z0tmWHdDendy?=
 =?utf-8?B?UXNBcEpaOWRKOXJtWTRpS1pKRGFzUHBwTWhFaFYwdDhNZGhOMGRLV2VDeXRQ?=
 =?utf-8?B?TGY3UVhwUzdlRlcyejNqaDA4Z1NHL3pPVURmdHA1cVYxcE9IelNxRy9KMkhw?=
 =?utf-8?B?L3UyWE82UDBJeWpnc3A0TU1sb1lTWmhheHRWQ1d6OWlWYnl5dEtURW53RWd2?=
 =?utf-8?B?UUluaXdHeFVJMTNmU2xtdHRDdnYwVlFyYzdON2QyV21qdHBLQmNURDVGc3h5?=
 =?utf-8?B?MHBZZTIvWVRLUFMycHlVa0xYRG9rSVdBUndTR0dLUW05VXY3UVZmckNtNXVu?=
 =?utf-8?B?L1cxdEVzdWduSW9HakVTUjhuanoxK1hXQXhHOEdmUk4zTjI4bHdLUlNjRHhN?=
 =?utf-8?B?VzZHdVpVc3lNVDdKN1VJY0FuQko2QnFiOGZtN2tYZUhWcHlubm16Uy9pTjN2?=
 =?utf-8?B?K0FVaFRmdzJPQ1paL1hiMjNqcElsZ2tLdTB6ZVQ4VEE1N2lGaHBBUG5jT3VV?=
 =?utf-8?B?SFp1ekRPM0tzWUk1VkpRZXpHdEVWR200czVNcnAzbjQrdHVNWDY1Tk54R1pL?=
 =?utf-8?B?VHZwc2JmejZRTXBtd2NnSXUwdzBQUEhDcTIzQkdhWGVwQUdOM254VXkwMmdu?=
 =?utf-8?B?Smk4d2dCU0czL3dvK1FMUFdFNXpZMjIzR1U0MTZtOXhUSVkrY2NpUDhVRHJt?=
 =?utf-8?B?dVhFNkVYclBXZmN5ZUpZcjFHRE1kajAydmZCV2FUMXBKcjZGU1JOcEY3NHUz?=
 =?utf-8?B?clpFOERyei92cjhKTXZ5ZWFtUk5OYldIK3pTdExsa2hVdnc2Qms1V0I2dUhV?=
 =?utf-8?B?WWVwNTB0QjcyL1NENVhOR2YrcEFuOGJnVXdtb1hreGJSek5teE1tcm02MFgw?=
 =?utf-8?B?VmpZZUFqSXQ0cVNEZ0JQK0piRXdUOVlBQk9rV3RiUjQ3T1M4aTlnak1SM0tV?=
 =?utf-8?B?NUp6MFp3Q3BRN29FbHZ3d3pPaGF4RERJV3A2N294clIvWHVBdXNFdTd4ZUJz?=
 =?utf-8?B?VENrYjUwRm4yMFMwbE1UWEVTSDY1U09HaTZMeWlwTkVTNUxpNGJYc2lUZWE3?=
 =?utf-8?B?SGRkbWRjQkdzS2lvRng0U2pHdXJmbkpGTktGSWtuNUYvL2NIU25vQ1BqVlhS?=
 =?utf-8?B?QVpPMEYvdWpwdE96OE5BbmZwUXRRaW1Ob21FMjR0TGdDSjM2bTA5a05QS1pS?=
 =?utf-8?B?T1ZzaVhHUUF4OHR6cVBVUkpjbjBMZ0pLWmlMWG5LT0ZCRXlYZmxyNWpkMGpE?=
 =?utf-8?B?c3dsRnIzUTY0OXBxaHlCVnQ0SjFBaDFhSWwyb2xGMjEzV1BBY3FoaTdnd2JT?=
 =?utf-8?B?UHFIVkVyVzJoczBlcTBUUkNuQnA2Q0JyK3BWLzhlaU0zcGliVWd0SnBDY0xP?=
 =?utf-8?Q?E3xwuZeNC0rU4J6Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba438a4-8c0b-4cf8-659d-08de7a179f60
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:58:21.5138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBykF2r7TAnTZltqIq/usrpJrNrqmNaiWNHrWcYMQiq2Bdt3dx4KclDKCUzxDruLCvNVRHm/eKT4J1T1PqBb6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
X-OriginatorOrg: intel.com
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

Hi Bilal

Subject should be "Remove *-vga tests" with description why

are we removing these tests from xe  chamelium testlist.

On 04-03-2026 10:42 pm, Kamil Konieczny wrote:
> Hi Mohammed,
> On 2026-03-02 at 15:49:26 +0530, Mohammed Bilal wrote:
>
> here also subject could be more descriptive.
>
> Regards,
> Kamil
>
>> Apply xe-specific delta updates to the FULL chamelium testlist by
>> removing VGA-related subtests and keeping the remaining entries
>> aligned with the i915-based baseline.
>>
>> v2:
>> - Move suspend resume tests to the end of the testlist (Kunal)
>> - Comment out random-plane test (Kunal)
>>
>> v3:
>> -Use move-fix-add approach (Kamil)
>>
>> v4:
>> -Restructure move-fix-add approach (Kamil)
>>
>> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
>> ---
>>   tests/intel-ci/xe.chamelium-only.testlist | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
>> index 56bffd8de..4428fb48e 100644
>> --- a/tests/intel-ci/xe.chamelium-only.testlist
>> +++ b/tests/intel-ci/xe.chamelium-only.testlist
>> @@ -24,7 +24,6 @@ igt@kms_chamelium_edid@hdmi-edid-read
>>   #igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
>>   igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
>>   igt@kms_chamelium_edid@hdmi-mode-timings
>> -igt@kms_chamelium_edid@vga-edid-read
>>   igt@kms_chamelium_frames@dp-crc-fast
>>   igt@kms_chamelium_frames@dp-crc-multiple
>>   igt@kms_chamelium_frames@dp-crc-single
>> @@ -40,7 +39,6 @@ igt@kms_chamelium_frames@hdmi-crc-multiple
>>   igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
>>   igt@kms_chamelium_frames@hdmi-crc-single
>>   igt@kms_chamelium_frames@hdmi-frame-dump
>> -igt@kms_chamelium_frames@vga-frame-dump
>>   igt@kms_chamelium_hpd@dp-hpd
>>   igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
>>   igt@kms_chamelium_hpd@dp-hpd-fast
>> @@ -57,19 +55,12 @@ igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
>>   igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>>   igt@kms_chamelium_audio@hdmi-audio
>>   igt@kms_chamelium_audio@hdmi-audio-edid
>> -igt@kms_chamelium_hpd@vga-hpd
>> -igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
>> -igt@kms_chamelium_hpd@vga-hpd-fast
>> -igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
>> -igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
>> -igt@kms_chamelium_hpd@vga-hpd-without-ddc
>>   igt@kms_chamelium_sharpness_filter@filter-basic
>>   igt@kms_tiled_display@basic-test-pattern-with-chamelium
>>   #Place suspend tests at end
>>   igt@kms_chamelium_hpd@common-hpd-after-suspend
>>   igt@kms_chamelium_hpd@dp-hpd-after-suspend
>>   igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
>> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
>>   igt@kms_chamelium_edid@dp-edid-change-during-suspend
>>   igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
>>   #Place hibernate tests at end
>> -- 
>> 2.48.1
>>
