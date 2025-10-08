Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1682DCAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 05:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B934610E067;
	Wed,  8 Oct 2025 05:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWonjAyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE9310E067
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 05:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759902609; x=1791438609;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9yg+QjP6daOyphG4V5pLLnNFLTdsRBTIaPUBUagXnuQ=;
 b=lWonjAyJV79pWoZZHWtGuEHEf/LHu7V5MXe26U3I33M1SwNUPoT/Y73X
 r8jCyXsyhtvbzchpelzsDc2G7lbIoigUVJh4NBHB4T8GRZtVlFlF29lkp
 /Kk3Gamuhrje6MnugMVdEP2OKazDpvhWCiSdgoYhhaZUnM8A9n3+Wt2QG
 wOJCrpRlhD+nSYT0Bf49PhmOkep2KtU3F6uZsMc08/wY/T1bRFSS39kZx
 ZAOL0Z1TBrYTY3TdrcqMClcUX+XvZdMfb2RSqNrK1YbXh7FSjm/8+9/IE
 IrMtCPfE0fEPiQohvGrzlWU47ZRNqPLGcIABJ5qHKYN9lOKMK2NtJoTuw w==;
X-CSE-ConnectionGUID: 7H746MtmTM6kTFAiCkISWA==
X-CSE-MsgGUID: np5yfkwVQT6WW0CFyeHPnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="61123664"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="61123664"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 22:50:06 -0700
X-CSE-ConnectionGUID: kJGuDzHyTCCqG9RvvAmq2A==
X-CSE-MsgGUID: dhWn/27wQkKYcIFds4Blxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="179603765"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 22:50:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 22:50:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 22:50:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 22:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WS4381zDeWjos/21LaR571M/dx60dC0cPoRrXWhiMH32Puz41jFW94BcA2Qwbte9yBJmjVoytEOQHLbeRZbiU5LoH6JOou1uCKxOiqE7RmcKdILMA7Liy5g+Qo2r0WF/+MeNP+kcr+6r/9LqLE0xSmxk2ukbR3KNC+BxQasobzOzBD8ChhwRxJ/798ujCCQ04G9PateS1R/tHsZd8zTi/qQtAe2imvqyGtBEdaO2sJfEgHJU4YtKZ8d4HGoyYr6onJ6hikxgytCbmhxAEojCo1oFy17FmuO5IM03HDlmHLLKJ/3HZYyDRCz8oshDpaY0zMG0Vg0LFJQgZ9qd8Zsp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnH22DnrEDtnT8sonurKUHTdDGex6y7eUnj3BBuEC74=;
 b=aUNRCmxNUaPl4vIeQkKDD6CqkNgJwuCATuE6+s5mOWu3IvjGtvyNL0D6HdUdkq1H95J40qbS/PzufZE8CqN8nqeHbv6hm0mK7NPNnfHm03LJ4lcMrtInULUs2BFW+cOlIK66jqyETlVExqzzu58ePNdiA7x0hjU29fTrKNPRQ4lnMMQTzGfczTUFkES2WmYSoJt7Iqw2M1KjpjCXOP5f06iH7Mgg/j9mylNvZdv8kloDOCTIq3ha0iWkNhAYs7hM0zhJ3/thcWOfoS0DG3Kj+Ra6S2AiAoXMyl2xsDraTgkHqA0GSQpuVLyPar5lJvPHV2/+PmdbYTgj4CBr9bzgIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by CH3PR11MB7273.namprd11.prod.outlook.com (2603:10b6:610:141::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 05:49:58 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 05:49:58 +0000
Message-ID: <f7cd3d9e-59b4-4fae-b33b-98569b9b6186@intel.com>
Date: Wed, 8 Oct 2025 11:19:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_vrr: Skip DRRS-related tests on LNL
 and newer platforms
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20250924093226.3899875-1-ramanaidu.naladala@intel.com>
 <20250926182305.3939296-1-ramanaidu.naladala@intel.com>
 <DM4PR11MB63129DEC337DF5019E82F51D90E6A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <DM4PR11MB63129DEC337DF5019E82F51D90E6A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|CH3PR11MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 169b9c2c-e332-4bec-75fe-08de062e837d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHhmLzBoRTNxQ2twZnZ1ZktuSkVQTVloeFc1RkZMNlREUkpXQzVRSjljenlU?=
 =?utf-8?B?RWd6aE8zb0lKK2VBWnZtcTJya0NMTmhHL2NOUzM5NXhNVVBJcnlrSWs4cy9H?=
 =?utf-8?B?UkowSDZLMmJCc1RMVFpTS3BqekJrV2toaVI1eFk3TDJCUXliUzFwRFdBUFNy?=
 =?utf-8?B?T2h5NGpTSzVNWTErRlVhN0Q5K3Fib3ZOcDJpUzdWOUU0WEp2UEt6NHR4Y3ZP?=
 =?utf-8?B?ZTVGQjk1WGpvTE5CRjBzTnpXclluV0RSZXovamNxOWZsUFNUUHlPMG1yT0s5?=
 =?utf-8?B?NzFybkZ2VDhCemQ4b3V6dnhsVytuckw5Z1pNQ1NDU3VkblA1Z2RuOTZ0bC9L?=
 =?utf-8?B?S044S3dNNEtKSlljTTgyaVIwRjM0MjloVms3QTZpUWVSditJN2dZWnJ6RmJT?=
 =?utf-8?B?UE5WeGtnVEFtVU05dEJ6cGE3Z01Wby9JR2tBcXlLM1dQcExTeHlWVks0MHJu?=
 =?utf-8?B?YWlrWWJxYjNONGxPTFNrWDZQbUNwOWNhY3RaV3VUTEU5bXU3d0dXSEJPSFky?=
 =?utf-8?B?aGJpdWIyeHYvNDNudllLeVE3WFlzUnp1bHN4US9rY1d3OXNZMHlQVkxsbEkw?=
 =?utf-8?B?SlRoQ1FXT0RZU095cDAycTM0K0lmTnRkNzdYQ0E0NndDZXZGN0xsd1VmQnho?=
 =?utf-8?B?TEZvVzJxVWZma2ZaSFVtM2hOdUFPL2J4bll6NW1wVmdUVURWWnVQK1crU3V1?=
 =?utf-8?B?Qi9jbDIxUDVjRCtMQmF4ZWc4ZWRMSUVtOWxLZ3UrWFhTeXRnQVNPTHJZbXRa?=
 =?utf-8?B?RWYwQnRFcG5MNzd2aDlRcHAzSFEzSHRLcEMreGZ2cmdhOFc4RGxFSTl3UkxE?=
 =?utf-8?B?N09uaVpXQzJUbEdJRHhpMkdTYVVFMkxidEwwK2IwSEwrWFp0RFVuM0RNc1Zy?=
 =?utf-8?B?TFFVQVhtLy9TdktUbW9XNHZwbFA4RGNBRlVjbXc4OE8rc0JSOWVqWlIwSGlj?=
 =?utf-8?B?NHdPQ0VJK0hlWkRvangvaTgvN05NL0g1NUhZTHM5bFRlTWdXdUJHMXRzbzNh?=
 =?utf-8?B?ZWQwUmtvUC91Rnl2REFyckRKZVdEeFpmZC9iVlFYZkl6RGs3OW1qOGhVRkN3?=
 =?utf-8?B?SGd1d0tmQU5SL1R1Y2oybGtFOVMvYjlmZU1pSFF1V1NzbFFDMllkWitKdnhC?=
 =?utf-8?B?SFhCbFozM0xBRUhBNGIzeHZKTmRqK3pJZ010OEg1UlhsSFNWUU9lVG0ramFG?=
 =?utf-8?B?M0tTMHRDbXFtTkp5WklaWFh6SlNRTTNadlFTbmFkamdSU1BPU3VsQWFiVndC?=
 =?utf-8?B?U21aaGVsdzV3QXJndkR3aERydDNTYmtFSEIxd3cxWTk5bEpRMy9UVWhXcW9W?=
 =?utf-8?B?ZkZESEZSRVhvSkZ1NTduOWNZS1owV2lXTEUrYUVUWHJMMG00UEJZV1NhNHIx?=
 =?utf-8?B?cEFhWUkyQUdGUzhBZUgrTGJ5M2JRUnJpWWNrK2FvSVhYbE9KVi9VSndzVTRH?=
 =?utf-8?B?YVVyMVhZVHFIa1RPYnJRUTYwcjlMMTlkWm0wZkhWU2F2dllibEFYV0ZjOGlN?=
 =?utf-8?B?Uzg4TmI5UE1Ob1FaNHFCZlpRTTY2SHdrV0d2c0YxQ2Vsc3d4d2VmUEE5ZXox?=
 =?utf-8?B?Y0pFQmZMY2Rsb292WTZmRUVDT1N3MzVHNDVmdlJrUCtlUFBidU5pOHJxeVh1?=
 =?utf-8?B?OXpGVEV6Qk8rVlRCWWpyWXVZWE00R0J1d3lrVnlLSEw4TlBkY3pyQVBWVVd1?=
 =?utf-8?B?WXNXeFdiMDFKbzA5T0U5QWJRZDU4SUFVcWVaa0JYK1pQMk1MQ29BV0lzWlFa?=
 =?utf-8?B?MlNGTTVTRUtTdzljUGRhVngyU1pCcDZPemtsTW1YcDFaQTJ5am1zc2JkaFpx?=
 =?utf-8?B?QmRqY0tMTlBUTVRSbGRWN1hPNHJFODM3a214aXlneFlSTGdZOXl5Mm5JMk5O?=
 =?utf-8?B?bVhZK0FlVEhKNGUzdmJvUHJtRWlsdUtjeHFWaXBOODVYU2NHV0NzbGxuemdC?=
 =?utf-8?B?WElYYVk2eVV2a3NPVjRDY2VvVHMya3RLSSswcllhaUtWcExwSjVRaTJKaXdi?=
 =?utf-8?B?My9HdHBLc2FBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzVtUG1OWTEwdlZrQzRVbzk3UFpIYmpLQkliYVNnS09qM1lKZVBCUkV1dkNR?=
 =?utf-8?B?RkYwME1iUzRzT1hjRDUxRW9DYjhNaWdXRmdBblRxOUtIb1dNaVJGTkxCNHhO?=
 =?utf-8?B?SWxJRGdFclJORXl1NGgzTWtCZUhKaU1mTnBqMkhwdjg0U0g2TXpwT1NlU1pJ?=
 =?utf-8?B?WHRQWEFEaHoxcndqTXoxMUlqeUdpeURFb1RNdENSdUlPUHd2dnlZZ2hkQlYz?=
 =?utf-8?B?dXBIQmNjUHZOTWJ0Y2EvUEVoQ01wUzdjajhkYTJrWWorWmt4dFZJcC83U24w?=
 =?utf-8?B?ejkyczVPZDhzYm5nVXk5WDBNcnNraisxV0hEVnFadFZoYUU3YURQTHdiQ1Bw?=
 =?utf-8?B?SklqYXdyMlhUdEw0MGMzbHZwVUkvbFA2NDV1dTZhby9Oa3lUYnEyRnRXczRi?=
 =?utf-8?B?MkVoZFh6QkFWNXhUc29pMHBmZWg3V1RzS2NzbUZTZTJrYk80aHpVV3dOMG1B?=
 =?utf-8?B?R1I0OWM1S1p1VHZhcFZmR0YrN3kxN0tQQVo0bDRhQzNjK1g5SkFObXVoRDFq?=
 =?utf-8?B?R2RVUXk2UnhTczZEYlFKcU03dU02ZW5Fa1h0Y1RIQWZ4QW00NlF2dVc3YXdm?=
 =?utf-8?B?Zmp4RGI0elRHVi9DbExMNXIzY0REQ1h4YU5ScUkzWmNqWGMwSjNXa2tjbEhS?=
 =?utf-8?B?bjVkVi8xNlJOOXE2MzFaS1g4YlJUUWhKV3JDalFsK1hNbEgvYUxTRFo1UjFw?=
 =?utf-8?B?dXNVRHh2TmJoeFMyaU8zcFJoT1V3dXVDY0huSllUYjZVUTh3V3RjMmtiRUVK?=
 =?utf-8?B?UUFFSGRDWnNmN0VXWW9TUFR6V3d0My9rVFVicm9BNU93Ti8zVnRPM0lJWVpo?=
 =?utf-8?B?Wk1hNTQxZ3B5Z2g3YmJvOWxySG1JcUJQWGx3dWZ2enpDQUt3bkx1Tmx4RW5m?=
 =?utf-8?B?enFkbzJ1Z2V6YVJpcW1URkRhbTRCMFl1SFhiaXBvRUhBbGlSN2FncDhHZFpW?=
 =?utf-8?B?ZFJKek1kY0NKcnl3UUdFd0lkNDUyekw4cWVLYXlma2FWa1kxLzlqTHNlZmly?=
 =?utf-8?B?SGRjZ0J6c085bERteVNuc1FCQ3lvOG5BM2QyZUxoNUpBZ3dJRWhibzNqRjQx?=
 =?utf-8?B?Qk1wNVM1OTEzYjY5TW9sYVAySnZGdkhJQVFPdFI4OXg1Z2RpaUVmQ0ZpeEFj?=
 =?utf-8?B?SE1mQ2YzU0ZDUmdjYTdCWFZkNGhuWkFqQXJyYkVjd1hyZzVHR25PdHhwV2M2?=
 =?utf-8?B?TWxBLzRDTGdIREZmRW9LVmxZSmozb0RKOVV4b2hOd0xMcnh0VXg3ZjJwbEMw?=
 =?utf-8?B?ZXI3TVFNbDZKREkza3ErYVpXaTd1OXFWb2loSi84ektaU3dlUjVjdzZNU09r?=
 =?utf-8?B?bnRRSHR5NWF5a3JzU3ZMT2wxT2FVR2V6d2FRQmhUN1M0T2Yvakh6YmJWa1BI?=
 =?utf-8?B?WU9SRVdFcjZiS1Nwb2VMemE0RHlPY29ENW02WHh2Vi9Fd0t3YlFhZkxjZnNk?=
 =?utf-8?B?MmZvY1d5MHpLYnh0QThpdlkzNC9odVhJcGxVakJWQmRyR1lDMC9kcytGd0c5?=
 =?utf-8?B?LzFiQTVpZ3BHdDA5VTJFSGdHN3E4RW02ZDlNcUM5RFNFNE5VTzAzUHhNaXBl?=
 =?utf-8?B?TThYQUVVMHdVRVhCQ1RQQ3Y4RlIrYzA1RTdVR2VhTmxPYXk1N2xCdC9QNEdh?=
 =?utf-8?B?S3BidHNnd1ptRi9SOXh2aWJnWUR5amFYa2N4OU9Hc1lXUUJycGJLM2VONlc2?=
 =?utf-8?B?bzB1ZkE1elUwckYrZVVEbGNLV0dXYVRrcjF5OUlTOTg5L2Vxd2ZueGJyanFa?=
 =?utf-8?B?RmVjdTJJd0VqcnJVcTN6SnZJTVVOMHFHOEJRTGlrckJqQVZGZFY1emxza2JS?=
 =?utf-8?B?VjVlbWNRVUlENGd1elZibGRFdGd4RkcvQWRsV0F5V3RKTXRwMVJvZ2dPK0NJ?=
 =?utf-8?B?RzB5T21XbHc2cEZvRDFoSU1FVktDaVNOUTNhK2RCZWVIaHBDWjVWb3ovMEFu?=
 =?utf-8?B?KzZGU1V2blhLaU9CQmRRa1VoWlRXVFdsT1RHOEkwYmFsVTcvckRFV0crSU45?=
 =?utf-8?B?Z0w1eGVLc2tpK0ErQW1KQytwdUhnZVo4RnRMWjVLcUpaRXNJYnlzdjhHamho?=
 =?utf-8?B?UXRJSVl3ajB4SEJpVmttZGZjMS9GWWRDc3dhMUxOM0JYUFAxYzR2UTJsTmps?=
 =?utf-8?B?ZkNjUVlIUU5TMmk1M0FLUGt3em1na2h5a2FkMTJHbUVpczcrQ3BZeDlZTm9U?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 169b9c2c-e332-4bec-75fe-08de062e837d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 05:49:58.1343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wn6wthT+QdmOmIoGnQw/H2/+VjDvTda9RjIzulWcGdaWjtvASE0Lg0rpt1L35spimLhu0rIDOqUue1C3/UtTx4RQm4wk2cQyFiBlS3tE8U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7273
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

Thanks for the review Jeeavn. I will add v2 details while merging the patch.

On 10/1/2025 2:31 PM, B, Jeevan wrote:
> Please add v2: details
> With this small change Patch LGTM.
>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
>
>> -----Original Message-----
>> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>> Sent: Friday, September 26, 2025 11:53 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v2] tests/kms_vrr: Skip DRRS-related tests on LNL and
>> newer platforms
>>
>> To prevent false failures and maintain test relevance, seamless VRR and DRRS
>> test cases are skipped. This ensures the test suite aligns with current hardware
>> capabilities and avoids unnecessary execution on platforms where DRRS is no
>> longer supported.
>>
>> Bspec: 68917
>> HSD: 14016007525
>> Link: https://lore.kernel.org/intel-gfx/20250912135926.18910-1-
>> ville.syrjala@linux.intel.com/
>>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   tests/kms_vrr.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 233143770..ee0f057d5
>> 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -1016,7 +1016,7 @@ static bool config_constraint(data_t *data,
>> igt_output_t *output, uint32_t flags
>>   		return false;
>>   	}
>>
>> -	if (flags & TEST_SEAMLESS_DRRS)
>> +	if (flags & TEST_LINK_OFF)
>>   		goto out;
>>
>>   	/* For Negative tests, panel should be non-vrr. */ @@ -1030,6 +1030,12
>> @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t
>> flags
>>   		return false;
>>   	}
>>
>> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
>> +	    (intel_display_ver(data->drm_fd) >= 14)) {
>> +		igt_info("DRRS is not supported on LNL and newer platforms\n");
>> +		return false;
>> +	}
>> +
>>   out:
>>   	if (!output_constraint(data, output, flags))
>>   		return false;
>> --
>> 2.43.0
