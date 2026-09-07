Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF584C79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 14:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391CE10E15A;
	Mon,  7 Sep 2026 14:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIYEYTJ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C838910E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788791311; x=1820327311;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jM4XDEIBPSZfYSJOI5yY6AtPpDRw4hD5e+iAOpFkQsQ=;
 b=ZIYEYTJ1ge/G6KZJUqfLZCd6dYWQnZFT7hcn4QiQBpUoJAN9IIXu2XsV
 4m47asYeAdyQKLpWLy9vVXi3i02ez8k0HValGDcjWMPus/D6Y1xgj2wcp
 1DhVZxksKZabKRJIJ6O2fpIm18Il7iv0hYjarYfxFz+OoUXvIImoiF9Xn
 bSaDznSHAX4XT4yTmA87J6TaqP0RNDbOhdIp8KENsSmJ7NryVhrKwuB5g
 7NfJsD9H9hR87dw6fWoZVgMY3fueog2ehcdLZbSMPxVhoa6KG1TP/Jm7M
 G5e9hrQcAV1kYTfQEJQK3SQjQPfhfdulhrelL4kyK13jvhMGIblRbT7vR A==;
X-CSE-ConnectionGUID: dyKCAQVeR/yAGvqpCqInjg==
X-CSE-MsgGUID: ulzo1KsSRfmNEySbOiTK9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061895"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="93061895"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:28:30 -0700
X-CSE-ConnectionGUID: 1J4UxKL7TD2oMwqczK4p5Q==
X-CSE-MsgGUID: iKh9JNPhR3S6Nt07joc20A==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:28:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:28:29 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 07:28:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 07:28:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5NchVPFGDL4aJrWoAz416ZN0QmM37aZa4eRWdzQfG78L2QppGOcSVYiM6jL/6MQUzEzOK6oKuUDXoEGy0Op9Dzp1VhyxUqNnYcJGOkC2kMC2cTBZpr+UEAvxESlbX+7vhvSR6RFRI9xeU9sWC1piuB/dijHyn84pB2VuNcDZNhJHVTztQAxVpoig8Wh32puKRME1rC+PQoPt5vQf1rg8fMnRpzZayOaLdiGJWihssl5GfJlz1rQsfIcRWT0QtUG9yMM9tDsrGit7x3ESlf9RzZz+v3KnhY/Ea0PBh5a5+O3Rlyns+1xQeJSLaRqsItQdAGMKhcaVnC9qnVyVFcNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDmKKlaixEN0Bn2jOHwPFTMLqcyWeK4w9bRtXaNffFM=;
 b=rJoCLZm++1eIstGoAUif6JVahCX8ij9XTNhk5OAa4pfqiYo7Ploy/dQcXghzeV8RZoqiwfACoIib656Vd3NAsjCjIDinpaXzJHiYrau8b1S+ySLflUON5IK+mF9QpjY11y1y6Tz57R5mfOU1+p5d1tRAIyTZXAAMDGlc3L+VH8UorZdLYU7vYbixV71AO64Tf1mGYL65SYRIgZKBVkZlZ0IvfKC/Hh8krQmWYxTZcAe+Je/7PrAh5TX3uCttHImIvYCJkfaGdbX+m6dCqCzfjWDOoxKeC/QhTlmp7Tfd/Cmcc9WbANHXLBqyR981w1XMjjIXAod3mOJ79OKrofDVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by LV4PPFDC496280F.namprd11.prod.outlook.com
 (2603:10b6:40f:fc02::22e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 14:28:26 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 14:28:26 +0000
Message-ID: <d4212b66-f350-478c-8f7d-3e9dbb52b8e6@intel.com>
Date: Mon, 7 Sep 2026 19:58:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/3] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <mitulkumar.ajitkumar.golani@intel.com>,
 <chaitanya.kumar.borah@intel.com>
References: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
 <20260825183359.2791891-3-ramanaidu.naladala@intel.com>
 <20260826120322.hnuce26rtgjfpcxr@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260826120322.hnuce26rtgjfpcxr@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|LV4PPFDC496280F:EE_
X-MS-Office365-Filtering-Correlation-Id: 0812c813-9ec0-450f-0602-08df0cec47d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|4143699003|10067099003|6133799003|3023799007|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: drA/qbjSJZMyGIV2YlftyaxlauL/KMEsTR9AgV/svDILcUTnMCr3DzNarwuI+PS98l4OYHd+xXmo0lYa4SiajHfNtFlZT1Ib9JM8X4+Do3l/irXANq9FnIMPxlMaiHuP+UEfG4bWhbvTToqzUjHLGboIOvqEu09uHLFWaUXPM/IdvIU979ADquH9IGMav2ZFUB0TGZEKRXiceCxXKf+rdG9t/J4XX0pq1QnhzxgVWjRqTpqLPbyhKIRpfaVj1Zt3gWsvPF1mdLAmgPDbOoJnNAwOmekex+EIEY9pzuO7j/+fHYbYA71dNLNUcJ8W7wzH34wyCT71jh4UuiDLYvwp4q5KsaoaQ2srBA7xCKqOHct++2R2+ealaDmBcm+ygx+IsaD2sT+bs2WI+sJlzKryuUr6JaC0dvq9PS5vm/N2dcN62tLwlBpru88KvG+gKT2YB1Gm0AxWdfCs1JC9+BNBykhZrQu9PRd4pOE2FCPmm3ZhJtSXjPfC9LBc2vRueRVcvKX+BvK6DzJKnFJl2dM1vdphufQWfIRzj2dPqNNFPmlCpV26Bo/ipP4YwYZQtB4uvIdEPlJGfsi1ihKEfJqu+tx+uTmpEB/y1GxwhpSWLZi8G7+GbYN1OSKCFJdagriDsoJcWoxWkuwWYkylqgaG++9GRLxrKaRXehF8fORLjVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlArcm5sbzhQVi91NlZkbUswK1I0eGROSTJQTUd1cHBtMFkwM0crOWlKMEVE?=
 =?utf-8?B?UTJUTHlPL3lDd2ZRQ3MwZ2VERjZ1OFNxdEZnWHFjelpvWUJiWDErZ3JrWXI4?=
 =?utf-8?B?Q05ER1JrQkxOZm5VY3o3RHg4WnZydTUxdXZTM3hWU2NDM2szVjh2bGk3VmdT?=
 =?utf-8?B?MUdta0RraktBQlluUU05MHFRWFdiVFVzYzNSeFVNV25Vb1Erc1g1L1BUQ1FN?=
 =?utf-8?B?dWNtcXBUbVJtRnQ4K09pVW5PL3RwLzFXTmppWmEwUWpHMk9OTGNRdW43SWZi?=
 =?utf-8?B?dXNxald0UHY5d1lCZFBlSkdVSUFZMy93bkhTWGh2T3B2M0RVNDlnblgvakl1?=
 =?utf-8?B?QWc5UGxBcUZCOVlJY3lpdFo1aVVRQm84ZmpiRzhhdzhodGQrZ2I2c2FiYWFW?=
 =?utf-8?B?TjZ6WGRwZ3BjQi9CVkVZQnc4UzIxNExzdzBjMk81OFBkOVVxdVRzWnFSYzV5?=
 =?utf-8?B?SGlpR1JOS3RNTXdQRUN1d0UvMnJLU2ZqNld0NlVnMlRtckw5MEpUeERSSWtT?=
 =?utf-8?B?aDNpbVI5Q2kxTk9UOGduRkhSNTd0ekpKcVlZcHIzVmczNndaQUxXMXRmNllP?=
 =?utf-8?B?dU5wQmRxNHhOQkU1L3dvMGlEdk8zM0tpYmJiWnhlamc0RERvM3BQWnRrZXI3?=
 =?utf-8?B?ZHZ6R3VjeTR4SEE4VnFlazJDdnlPaXFQR25qTHhrdXZ2eW5IUWJVaWVWMWYx?=
 =?utf-8?B?RHUwUkFTWEh3YjVoVWtJYUVLOUlvZzQyanhqa3YwNXp0Z1ZEaTMwaU1WOEIz?=
 =?utf-8?B?YktmRUkxcllvOWlwTTk0L05LTmFrSWtvT3dzZWJwQ2lzTzFpWWNYcE1zNEdz?=
 =?utf-8?B?T2VCUk1jU3VkUUpPREZlaURYQnU1b2tIOVEzTG1vTzNFS1M2TXFrMkpOSWda?=
 =?utf-8?B?cTZFNzNNZnBmZkFpUmtqei9aZ1hpQ21wNk54bjNyTlZHbHFIRkFOTHM3Zisr?=
 =?utf-8?B?TEtQTXNJRnRvMGNyd3liK1FkbUYvbnZpdlNPaTJrQ3gyL2pTcWQ4TElsZU9i?=
 =?utf-8?B?eDlPejBCTEVBc0REaWlrcFRrR1RBNHFhTitJcHB4eCtLelp1eWJ0U05HUm5w?=
 =?utf-8?B?Q3grUDhxdWt2eWp6cmczWlgrMTk2WlZoRlpvakhYUVd4WkNFV3YrVXpIUFRY?=
 =?utf-8?B?eVVlOGZ3QWpaVG9GZzY2LzY5V1VpWkZUckppOUErSUNaeVVFZ2tleFNGWFJw?=
 =?utf-8?B?YTI0VHlnUi95dTUrUzJyOXZtZU9HZDAyMVRNT0JDUHBMR3hnZ2hveC9wYnJl?=
 =?utf-8?B?R05PUmtORWMxTVZ0WkhDMFovQW05OW53ZG5RNVhrSGxUdmxYdmR2bXpLaVJW?=
 =?utf-8?B?elFFYmoraXc1M1FaWHNraVJjNmxCd1J1UWxZeE1ybHRFeUdYWEkxR0dRU1Bt?=
 =?utf-8?B?TTNYSVlHVEIrRmtna1p1eFhVOHNNcGNWUWl2aUZvZWpPdnZ5U3JwR1NBVzUw?=
 =?utf-8?B?UCtVK0MxcDJlOEZoaWlYRDhkbHlyWlExdFRSeThBbjBGc2JXTmhGZndkb0wy?=
 =?utf-8?B?U0YyVFVyblRjVGdkNndaa2t2cmlRTE5LeXF6NHAzdFFOMVQwR3JyTlEyZkps?=
 =?utf-8?B?aFcwVDlmRnhXVXFzc1gyL0V5dzNvVmlSQnpVWldtS3dZeDhJUjMzaDJZekZz?=
 =?utf-8?B?QjRrMXpXbmFwbXlaNldmUFY0a0lHaXFPZUVyNlBaRG9BQytraVJQc28yNlNX?=
 =?utf-8?B?M1phdWRaSGd4aHZXT3NDOVI0Y0E0MFVsdmFhT21GdXJBOVlZaVVUVzdsTm9L?=
 =?utf-8?B?TXB3RFZKTUpDaWh6cHJab2txU1V2RE1ON0pncWRJcndXVjZNb28rejJhRDBW?=
 =?utf-8?B?VXFpUmw2WmdzU3IyOHMrVU54Z2lLVTBJYVE0T2FFQzRlc25KcGRETmpwaXlN?=
 =?utf-8?B?K1QwQmM3Z2RuUFVFUmp4dlVyaXFIblF1VDdzZkZkcER4TzlwNE02bUtMaHZL?=
 =?utf-8?B?VUlwV0JvbUpvTGVMWW9oWldHR0E5bEw3NlNRUzFxU2ZPZFgvbTNGbmRsM0lI?=
 =?utf-8?B?TEtOUVF2OW1FUkw1S016Q1FaUFJoditTTHFWVUV6V2VpRGVPdE5uMmFMRjBO?=
 =?utf-8?B?Z1cyOHB4c0hvUnJKdXdwMGVqSnIzbktzNEJRd09jODdHWHNSVER3OFZTVEZ6?=
 =?utf-8?B?UWc5bDJzam5sN3diNWZPbTE2YTc4VkZSdUs0RmpyZHhYSEpndzNqajJaQ1h2?=
 =?utf-8?B?akZCQ1lpUGFWWnJqdmtDSk01NVFUT01jS1NRd2h2a1E2b1IrKzRGcEdTMnZy?=
 =?utf-8?B?WG50eUEySm40Y1VlNmZacHNWbDBlU3VrVk5IQ2dkb2I5WXhKTTVWaUI4TUpG?=
 =?utf-8?B?Q0g2Y2NhcFpWWlc2SDI5RUIxb2hBcHd0WEpEbjFPc1JPSXhqcWRadkRBL1pC?=
 =?utf-8?Q?iCyKAQhOJK2cg/PE=3D?=
X-Exchange-RoutingPolicyChecked: W6SzJnBRgGCInB1JXDLiwAGHc2jP3iT/lex8uBYXsWclbS29F78GmGu+MrYjCL8i36ahPzTKB4y2nWsmb0DtAaN2NkOkM05S5x3HcOQkq2IpysKL8Tu647P8/B1+6eu323p1QSjEX/R9c59fgCaJWi7z8gJEiPdJpZCppJ4H24RpVoz1XTZgmW0l9WbX1xwTfPFOEVfa8+OtEZphWN1EaCOKzUgCn9PEMPQ1JkkaS7YIS8dO25uXJTCqmcEpnARPUmtFef/AkQFkwpLsHStH2ElnNpRc4g+69U+1CQdu7FLv+TXM/28e+r4z7VHDwgHwm3TJAjI340ql+gJojU1Xyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0812c813-9ec0-450f-0602-08df0cec47d3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 14:28:26.7891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uopOiClEVF3EhalwuSSA+/ydvBNzzOwYXO5W6THDS3oHmXU33z8QenZe+LtOrRLZBr0podncgHXv92jTk/MLHk2T1g3Qutgb3l8OYLzKybs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPFDC496280F
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

Hi Kamil,

Thanks for the feedback. I will address mentioned two comments in next 
revision.

On 8/26/2026 5:33 PM, Kamil Konieczny wrote:
> Hi Naladala,
> On 2026-08-26 at 00:03:57 +0530, Naladala Ramanaidu wrote:
>
> I have two small nits, first about subject:
>
> [PATCH i-g-t v5 2/3] lib/igt_vrr:Add VRR helper library for display refresh rate testing
>
> add space after 'igt_vrr:' so it will be:
>
> [PATCH i-g-t v5 2/3] lib/igt_vrr: Add VRR helper library for display refresh rate testing
>
> iSecond nit at end.
>
>> Introduce a new helper library for Variable Refresh Rate (VRR).
>>
>> Add helpers to validate targeted refresh-rate testing.
>>
>> v2: Modify debugfs with helpers.
>> v3: Add helper to check cmrr support.
>>      Address review comments. (Mitul)
>> v4: Address below review comments.
>>      - Add source and rationale for standard timing refresh
>>        rates. (Chaitanya)
>>      - Restrict target RR debugfs helper to Intel devices. (Chaitanya)
>>      - Make Intel target RR debugfs helper return bool instead of
>>        asserting in the library. (Mitul)
>>      - Avoid assertions in library functions and return status
>>        instead. (karthik)
>>      - Reorder source list as per naming convention.
>>      - Rename cmrr_supported() to igt_vrr_target_refresh_rate_supported()
>>        for consistency. (Chaitanya)
>>      - Move CMRR-specific macros and enums from the library to the test
>>        file. (Chaitanya)
>>
>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   lib/igt_vrr.c   | 149 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_vrr.h   |  29 ++++++++++
>>   lib/meson.build |   1 +
>>   3 files changed, 179 insertions(+)
>>   create mode 100644 lib/igt_vrr.c
>>   create mode 100644 lib/igt_vrr.h
>>
>> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
>> new file mode 100644
>> index 000000000..5b710b3cf
>> --- /dev/null
>> +++ b/lib/igt_vrr.c
>> @@ -0,0 +1,149 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <inttypes.h>
>> +
>> +#include "igt_vrr.h"
>> +#include "igt_sysfs.h"
>> +
>> +/**
>> + * Integer refresh rates that sinks advertise as standard video timings, and
>> + * for which a fractional (rate * 1000/1001) counterpart is also defined:
>> + *
>> + *  - 24, 25, 30, 50 and 60 Hz are the film and broadcast (PAL/NTSC) cadences
>> + *    carried over into the CTA-861 video formats.
>> + *  - 48, 96, 100, 120, 200 and 240 Hz are the integer multiples of those
>> + *    cadences, also listed as CTA-861 video formats.
>> + *  - 75, 90, 144, 165 and 180 Hz are VESA DMT/CVT and adaptive-sync panel
>> + *    rates in common use.
>> + *
>> + * The fractional variant of each entry (e.g. 60 -> 59.94) is what a target
>> + * refresh rate in video mode programs.
>> + */
>> +const uint32_t igt_vrr_standard_video_timing_fps[] = {
>> +	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
>> +};
>> +
>> +const size_t igt_vrr_standard_video_timing_fps_count =
>> +	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
>> +
>> +/**
>> + * igt_intel_target_rr_debugfs_write:
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + * @numerator: Numerator of the target refresh rate fraction.
>> + * @denominator: Denominator of the target refresh rate fraction.
>> + *
>> + * Write the target refresh rate configuration to the per-CRTC
>> + * VRR debugfs interface. Passing 0/0 clears the target refresh
>> + * rate.
>> + *
>> + * Returns:
>> + * true if the target refresh rate was read successfully, false otherwise.
>> + */
>> +bool
>> +igt_intel_target_rr_debugfs_write(int fd, int crtc_index,
>> +				  uint32_t rr_numerator,
>> +				  uint32_t rr_denominator)
>> +{
>> +	char buf[32];
>> +	int ret, dir, len;
>> +
>> +	if (!is_intel_device(fd)) {
>> +		igt_info("Not an Intel device\n");
>> +		return false;
>> +	}
>> +
>> +	len = snprintf(buf, sizeof(buf), "%u/%u", rr_numerator, rr_denominator);
>> +	if (len <= 0 || len >= (int)sizeof(buf))
>> +		return false;
>> +
>> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +	if (dir < 0)
>> +		return false;
>> +
>> +	ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate", buf, len);
>> +	close(dir);
>> +
>> +	return ret == len;
>> +}
>> +
>> +/**
>> + * igt_intel_target_rr_debugfs_read:
>> + * @fd: DRM file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + * @buf: Buffer to store the target refresh rate string.
>> + * @size: Size of @buf in bytes.
>> + *
>> + * Read the target refresh rate from the Intel per-CRTC VRR debugfs
>> + * interface. The returned string is always NUL-terminated on success.
>> + *
>> + * Return:
>> + * true if the target refresh rate was read successfully, false otherwise.
>> + */
>> +bool
>> +igt_intel_target_rr_debugfs_read(int fd, int crtc_index, char *buf, size_t size)
>> +{
>> +	int ret, dir;
>> +
>> +	if (!buf || !size)
>> +		return false;
>> +
>> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +	if (dir < 0)
>> +		return false;
>> +
>> +	ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
>> +			     buf, size - 1);
>> +	close(dir);
>> +
>> +	if (ret < 0)
>> +		return false;
>> +
>> +	buf[ret] = '\0';
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * igt_vrr_mode_line_refresh_hz:
>> + * @mode: DRM display mode used for the calculation
>> + *
>> + * Compute the refresh rate directly from the mode timing parameters.
>> + *
>> + * Returns: Refresh rate in Hz as a floating-point value.
>> + */
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode)
>> +{
>> +	return (double)mode->clock * 1000.0 / ((double)mode->htotal * (double)mode->vtotal);
>> +}
>> +
>> +/**
>> + * igt_vrr_intel_target_refresh_rate_supported:
>> + * @fd: DRM device file descriptor.
>> + * @crtc_index: Index of the CRTC.
>> + *
>> + * Checks whether the intel_vrr_target_refresh_rate debugfs node is present
>> + * for the specified CRTC, indicating CMRR support.
>> + *
>> + * Returns: true if CMRR is supported, false otherwise.
>> + */
>> +bool igt_vrr_intel_target_refresh_rate_supported(int fd, int crtc_index)
>> +{
>> +	int dir;
>> +
>> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
>> +
>> +	if (dir < 0)
>> +		return false;
>> +
>> +	if (faccessat(dir, "intel_vrr_target_refresh_rate", F_OK, 0) == 0) {
>> +		close(dir);
>> +		return true;
>> +	}
>> +
>> +	close(dir);
>> +	return false;
>> +}
>> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
>> new file mode 100644
>> index 000000000..d56639727
>> --- /dev/null
>> +++ b/lib/igt_vrr.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef IGT_VRR_H
>> +#define IGT_VRR_H
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
> Add newline here.
>
>> +#include "igt.h"
>> +#include "igt_kms.h"
>> +
>> +extern const uint32_t igt_vrr_standard_video_timing_fps[];
>> +extern const size_t igt_vrr_standard_video_timing_fps_count;
>> +
>> +bool
>> +igt_intel_target_rr_debugfs_write(int fd, int crtc_index,
>> +				  uint32_t rr_numerator,
>> +				  uint32_t rr_denominator);
>> +bool
>> +igt_intel_target_rr_debugfs_read(int fd, int crtc_index,
>> +				 char *buf, size_t size);
>> +
>> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
>> +
>> +bool igt_vrr_intel_target_refresh_rate_supported(int fd, int crtc_index);
>> +
>> +#endif
>> diff --git a/lib/meson.build b/lib/meson.build
>> index a7cde027e..b5aece55a 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -56,6 +56,7 @@ lib_sources = [
>>   	'igt_vec.c',
>>   	'igt_vgem.c',
>>   	'igt_vkms.c',
>> +        'igt_vrr.c',
> Please use one tab here, not spaces. Btw you can use checkpatch.pl
> script from igt repo path, with .checkpatch.conf adjusted to igt.
>
>
> Regards,
> Kamil
>
>
>>   	'igt_x86.c',
>>   	'instdone.c',
>>   	'intel_allocator.c',
>> -- 
>> 2.43.0
>>
