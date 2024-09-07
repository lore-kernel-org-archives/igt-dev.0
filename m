Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2163EB64C5
	for <igt-dev@archiver.kernel.org>; Sat,  7 Sep 2024 11:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3A310E21E;
	Sat,  7 Sep 2024 11:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajRaAURz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D64610E21E
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Sep 2024 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725710271; x=1757246271;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=K9gaL1ZSrC+TwuHX7/FxG/ObS4mUufSvw6pPQN8HCt0=;
 b=ajRaAURzYJfm008ITE/oFjx6a4rvO0fLMggVJn0XO3ZXUKflyTqJmXik
 hGgjS6t5VBSZcFQAUeHZGHwZzWj2sqIZ0NTv5vCvhbyM2Uz/oK4sinvT7
 lLTgvGRqmfZh+qYRB+zLnUOLGSnCFcka5Bwqa3/er5JGR5k7proJAQS3C
 0JDX5jxBXG8STJTCtasIYdt2R6BQbdYsLN8XQQG5rrhx3BOzAF1L2zgrO
 W3RxnjEhsvYOzVDaFg9D0qeTpA+q5FQ08Ijh3eBSKtGoDYrK36N1Fv/PF
 gxtwcX8/4XO85x3ewq7Th3dFuXkl1k4MSZ0Zqh1A6sI3WAbNf+maVvLFs w==;
X-CSE-ConnectionGUID: xxkFnXPrRka1hdapq920fg==
X-CSE-MsgGUID: DCq+AtGXQGaawd0MtbnBHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28340514"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="28340514"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2024 04:57:51 -0700
X-CSE-ConnectionGUID: XVTK/WMsRNmUwkc2XDrHzA==
X-CSE-MsgGUID: GqhPaBiHTCu6uESK3zTPDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="66186047"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2024 04:57:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 04:57:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 04:57:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 7 Sep 2024 04:57:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 7 Sep 2024 04:57:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6V2daNGMuMLg3LI7Gqgt+/7eOnszNYkAxzNhlQHmqynNEG0iFWHULw7TkudOQ2jb8aVhfzfYoEMQxzWQvWOtHAWCJzs3K4tGebImGp/3fHsfWygYU/FZQm7cQ6GLM0O/iS6cRWEQmDC9kSJppd31Nf3zIEHDvwzKAwYPcnebEoeDo/TmZOGkZkdMklWOKcybQWV1kVUwSa1yrFwCT0AfMXBwkiGLvp5kL4mSTzxnHan5tj0f/GfRBGXGHlKSmCjNj02H8j+PbL9pOhSXsFPovYpgS8n/niUH1v4X3LkveUXPSFfM1AaD9d/CGcNAVKlD0QBBM/kehwa1WjICyCYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/etjYkAcIV5WOuIqq6m6MtoKnFHSGWitw6c5k1CEj4=;
 b=izHeuUBR/LfSRJusnocfcBD0uW6Wn7c7H6qrX3KOf76j/EO7rlu05NWK6R9neb58Q5YbZJAz/Isi1YRynBKVHRU/hoDiyUtVPCbBjAgI5FRz7Lq34BFRzXaqabyYG6BpERS+oxppxbqE4JXZB1BDT+p7kw7+/lg7xB/4B1EDKySIX4gMpp6mTkVbza5tA37dd8cJZUoLygQ5Gvi/kNMwmgjTo7fFUXLoIwG3TcCJV3x/oIYG8p0+sJRc/GYQdst7AZSewZUk+TVk4zZOrTgoNtuwz+w9Juhp+LWtMuPoq5SP7v7ho8G8x1tk9TckyZAITA00BxVfxyOqR00cXwaGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Sat, 7 Sep
 2024 11:57:48 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7939.017; Sat, 7 Sep 2024
 11:57:48 +0000
Message-ID: <0e860960-5f0f-443d-95ae-6b269492f511@intel.com>
Date: Sat, 7 Sep 2024 17:27:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_psr: Add mechanism to check sink status
 as well
To: <igt-dev@lists.freedesktop.org>
References: <20240701051301.3344927-1-jouni.hogander@intel.com>
 <20240701051301.3344927-2-jouni.hogander@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240701051301.3344927-2-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dcde2ef-9c59-4b97-498e-08dccf344afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUhvZTN3RGRwc3dOcE9wUkoremVjNTRMamx6MktuWmlWbmxiSFYzOHBqdGRZ?=
 =?utf-8?B?YnVyTk5aU0VRVVFUV2s4c1dkNmVrUFRXWUFNaWQvMEZhUWVVS3JEZEF3alBn?=
 =?utf-8?B?WlV3ZStrOElkTkh0S3NpNFZRZ0N1NTloZm5KSzBGYW0ySlJwaGpuSlNBOHJW?=
 =?utf-8?B?VHFzeDVaYkgvUlF1Z1pXRHo0eENueGpUZmhTL0lUMkxiTGFvcllTMFdpRjVa?=
 =?utf-8?B?U2dKc0hiYUVMYm1mUG1kZWpiZWdKam13V3VIZy9FZ3ViSTR6RW9DWGkzZG5l?=
 =?utf-8?B?ZnBYOTh6QnlGck1ubUMzeXYwaWpZL3lCRGk0OEFhVmMxOXF3bnBacUZNZmp2?=
 =?utf-8?B?NGFBVU9DaUFVejhGcW1MekVJOHFYNEFURnplMXBlczlqTHlSZVg5Q1NlRU5k?=
 =?utf-8?B?T0NWMncwb2o0dENBaVNTUDBqanlpL3BFaDlnRWIzNnU5aUFCa2pCYlZCNTdm?=
 =?utf-8?B?WUdvMlVpc3JiR0RCUWNqUVZPenBGNHc0OUJlVFhpRjU5bk85czNuTmpOQk1P?=
 =?utf-8?B?UTF0c3Zxc0wvSkdRUG9RSU1iQzcrVzBpdWZ5M0s2SkFCNzFGc3pyTmFWbGxU?=
 =?utf-8?B?VVpEVDZSR2ppeDF0VG1HMlUyNGozM096bXFlTm51aEVQdGU4ZDdCcTVYdzAz?=
 =?utf-8?B?blhUY2drcXRKcHQ1V0RjRjE0bVhPYityYXcvVjYra1dUMlQxVytGOWhCZzVW?=
 =?utf-8?B?MGo4QXg1V2ZuejFRcjlPV2M5R2syS1RXNHVMc1pucG5lS0UzS3BaL05YWXdy?=
 =?utf-8?B?cFN5Uk5NRXA3cWhnM0c2Y0U2RG9mNmRFTkFlekZaQXlFNTdGUVJ5enhoYlpF?=
 =?utf-8?B?a1d6Mzh0OENXVDBiRlMxMFltT2V0YXJSMXNrUUtlbUVCalp2RGtGWWtVK3dy?=
 =?utf-8?B?VnBlUGNhRmo2R0c2c05CY2c2NjBMSW53cElMeS9IYlB4L2g0RU55U1V1QXZR?=
 =?utf-8?B?OTdyNWJZK1N2VjRiNnR2cnJ3bnRGb0FpdmRTODRFbzh4TllULy9majQxZmVS?=
 =?utf-8?B?aHFrbVQ1UzBrOXFDQ0FQT2VKNmxZdkZCRk8wU1hYak5JcEZ6MEU0U3VNajhB?=
 =?utf-8?B?MlhNUDY5Vis0U2xXSXRrSngrZzhnZDlubHB6cnBsczhINzZocFFzcjU5L3Nw?=
 =?utf-8?B?MkhhSmppaGFLbDFhTzk1d0NVRUw4NmVlaXhybEg1cWR0eEVpTEtlMlpJVE9i?=
 =?utf-8?B?dEVKM05HUFl2MUlvbzJCZ3MxMU01QUMvWlMyUEsveS9aTUN2NjdWQUdjNVdm?=
 =?utf-8?B?Q2Q5emtrUG5oTkpEbXI0NjZMTzBYTDZUaGhkWmhnWlI1YlZiU2JEaDdPTmtC?=
 =?utf-8?B?dXd6TUZreW1FcE1CS0FxOGdVYlNoK09JZUxFU3RCOENDT1FjSmFYTGZ4K01H?=
 =?utf-8?B?UUh6YzNvMSt2VW9tREtldzlVb0VXeFAwTDV1U29POEdPRzFMdE81M0JHcGVB?=
 =?utf-8?B?aVNpVTFqNFpGL2sxZFEzL2tTaDk0bnpBOHJIc2crWWdNTzB3bTBqUkZ6SkZ0?=
 =?utf-8?B?czQ3K0ZSLzFJWnI4ZGNTNEJQeW5uV0g0a2x0eHZyTktYU08xZnNmV3IyMVA3?=
 =?utf-8?B?MnVHOUJUQk5MY0ZYc1kyOEMydXJnb3ZzdjJNZXU5ZTlqVnppSU8vTVZaSFN1?=
 =?utf-8?B?bitpZmZIaVRYUGh0aWZjT1hUcXRxSjJFMmpScWlwUlc2anFUbUxVaCtVUksr?=
 =?utf-8?B?alZLMWlndFQrZkIvZitVUlhOTkJsTzVkbHZ6ZXpNblZ5dWw1eFV4T1dSUDJq?=
 =?utf-8?B?TUlpY0c4ZEtqNFRrdEREV3dQRlZWTGptTVhJNU5RVWlnb0R4RG1kWFhGZW0x?=
 =?utf-8?B?RUN1TWZlVjV2OTQwQTZrUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NCsxZmI4cTVjLzRvV2dnYi9wNmI1RlI5YTF1ZzVtaEQrTGNUY1Z2ZS82NXVB?=
 =?utf-8?B?U3VqNnNJcVQyMTlMaUk1akNZQk9jWVFTeXJ0STZNblNiM25tU2N2cWwxQ1lZ?=
 =?utf-8?B?TC8raDdsazZaTVVrV2FTUzNFZFZtZThHYVMwbk9nQU9lenFLcWRmbUtLOXZh?=
 =?utf-8?B?VGQ1b3N5cjRjZC93VVlBSFh3TzZ5ODlRY2VaSllKcGxwQTA2TDJrR0w2NHlH?=
 =?utf-8?B?THFIVG9QVnJJUWJkZThmWDVTMTd0Ym9LMVhtQm43L2R1QmxQciswZ0xka0ht?=
 =?utf-8?B?VnVidWRVMlpKb0Q5Z1pXcEdmZm4vYkk3TUxjdGFzNktTZkZPcVZsYWVqa3hq?=
 =?utf-8?B?d2x5b3RORmJJUkhWek9laWFENXBuSStIbktPN2JFanVxdEVaTlk2dXZraS80?=
 =?utf-8?B?ZkRjOFJ0TmRGYnpxV093UHRPd0JBRFpSOHNoRlpEejZISDc2M3pUT3drell0?=
 =?utf-8?B?b0pNdnA3QlRxNzdUNks3NUVBMTRjZk9mY2R0N2F4WWVaSXB2dSswSmY3Rm9Z?=
 =?utf-8?B?R0Z6VDU3dnpqYzYxNDZMSVRNNzVZK2ZraXpONkl6YW50NFFURVJlQkVqOUVZ?=
 =?utf-8?B?dnExR2hEZ0xvMFpwQlIzOVF6WXZHb01DUU10N2pqYXFWVWFZMWpWK1BiNnhD?=
 =?utf-8?B?UC81dU4vdUR4SmhxSFpZdThxbE93OTQyRGFDSEJ4bmFicnhNa2RGWFJ6eVJo?=
 =?utf-8?B?MjVPVUhGUUdrN0JObW1JVDNTUTdjSHZxaGVXaW94ajhMTzNhWXlMNnhmdldu?=
 =?utf-8?B?Zmk5UlY0aEs2VmwzdGViaXdTMzU1azJhZEk2SGtQRWdmR0JKMDVqTzlObU5k?=
 =?utf-8?B?NzhZVmd1V1BKQ0sreXZxMitJbHpCRGN3VXBCS0VVZFk4bEFGOWhNSHQrMS9m?=
 =?utf-8?B?TFlseTFudk53eXlKZjRkU3lBeGhDQ1JxUkxIS3pVZGVPNml6V21KZ2hub3FY?=
 =?utf-8?B?ZXNOdVVCNnlCaUdzVk9ET3VLT2plQWM5SDJIM20wNHRrRndHcTVWY0hnc1ZX?=
 =?utf-8?B?Q2pjYlQ5MG1vWWg3QnNDc3lwdm9CR3U0RWFSM1ljN1ZWK294RmVlNGhLSXFs?=
 =?utf-8?B?UE1ZQ3JnVXdaYUQ5YkE3bWhRMG1yNjJFZm1pK25BU0VQNUhXcEJHczB5b3p4?=
 =?utf-8?B?VWFFeTR1ZnN0V0ZqZG84K0lKbGNFUXdYR1lTY3RXWHFrdlVNeVBVRkhyM25W?=
 =?utf-8?B?Q0pZYUQyWnNKYXhPVmNueE9zVVJmQjhWSmljeFJiSE9RQ2RWWk9KU3Y1d2w1?=
 =?utf-8?B?OXZGbVNIdU1pRTByazNhTUY1MU80ZzU1VnlieWhHOHZBeU9HVEtKcDFpVDU5?=
 =?utf-8?B?eDA1RFo1TVAwbWtqa2drc01wNVYzUUVLWGFBbHZZcXZEbml1YWFnclpVRmY3?=
 =?utf-8?B?amVwSC8relljQitaNExHZlI1dm51eGRRQmIvYkR3R1hPRzBidCsreHF5T1hk?=
 =?utf-8?B?OXA2RjBCN0JxQlhQWGFyVm1vaGtVN0tYMVZmY0NGS3VBOXo0Q1EvT1FVMkFV?=
 =?utf-8?B?Q1hoZUN2RlJxMGZxUWZYeUZOb2Y0MkdhMDFscVpLNWxLbThmSjJQSEZESGNi?=
 =?utf-8?B?alJ3OWZqYktCTFgwQ1NxOUlSc3BhMXFEeHRnMFVSUWZ0S3ZNN3dHdk12RG04?=
 =?utf-8?B?WWp2bVhoc3p0Unp0bzB2dE1oSzZSZ2IvS1JHL2IycUtLYjBBL3JsWjNoeWZm?=
 =?utf-8?B?dEFyRmlqWGZmK1RublN2ZzYyRG9Rbk1Nb01RUGQ4Y3JoNlM1L3c2bi9UVmRh?=
 =?utf-8?B?TUgvUHh2VU1kcTlqMW1iSDl0aTlQaVZGTlRCL01ZWE9qZUdVUXZDbWlvWkpN?=
 =?utf-8?B?dXlWZjBVNUVCT0h3ZVBHOWZRS00wUlVxQVJDUjVicFBDYnZTV0FrUm5RYUJK?=
 =?utf-8?B?d0xrSEJaZ2RRWEVSUGNyVG5hcFZ5Nk1QYWVRcjNaUUtoU2J4RUVXclFlQW9U?=
 =?utf-8?B?VmRMSENTZ0lIZDMxQnA2aytnSnplaHo5WFhwby9YTjIvY3ZjTEVPT0ovcTBl?=
 =?utf-8?B?NUhTVFVyUU1tZ2dCekRJNTJoQmRxMEtQQXgxUjdTR3VrRFFGY1BST280bHhl?=
 =?utf-8?B?VUtaRlc3RzFONUVDQUx0NVRkTDFuOTQzUFV6SW1OVG85ZjU0Wk9xbVcwaGEz?=
 =?utf-8?B?dlROdlNRTVEySnBKd0pYb0ZpcWx4OTRTMkF1ckNGRkRWZWM1R0VuR1NIM1R1?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcde2ef-9c59-4b97-498e-08dccf344afa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 11:57:48.3986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0aDhAgXjScfkSIsnfRHt+otA2nRWEG+yTQ89S57RJw34kwZaBbAuA45ZtoUBYLRFOxTwfYakEGnOOUFo4Fm4Y1vc5P//uBFausUTdrFPfVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
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



On 7/1/2024 10:42 AM, Jouni Högander wrote:
> We have seen passing PSR testcases even though panel is not even aware of
> PSR being used. This can happen because we currently not checking sink PSR
> statuses at all. Also sink might have detected errors but our testcase
> currently don't care about that.
> 
> Help the gap described above by adding new interface to check sink error
> statuses. Also add sink status check to be part of psr_is_active check.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   lib/igt_psr.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_psr.h |  1 +
>   2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index e3e7577eb..47517b5dc 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -52,6 +52,19 @@ bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
>   
>   	return strstr(buf, "PSR2 selective fetch: enabled");
>   }
> +static bool psr_active_sink_check(int debugfs_fd, igt_output_t *output)
> +{
> +	char debugfs_file[128] = {0};
> +	char buf[PSR_STATUS_MAX_LEN];
> +	int ret;
> +
> +	sprintf(debugfs_file, "%s/i915_psr_sink_status", output->name);
> +	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
> +				      sizeof(buf));
> +	igt_assert_f(ret >= 1, "Failed to read sink status\n");
> +
> +	return strstr(buf, "0x2 [active, display from RFB]");
> +}
>   
>   /*
>    * Checks if Early Transport is enabled in PSR status by reading the debugfs.
> @@ -72,6 +85,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
>   	char buf[PSR_STATUS_MAX_LEN];
>   	drmModeConnector *c;
>   	const char *state;
> +	bool active;
>   	int ret;
>   
>   	if (mode == PR_MODE || mode == PR_MODE_SEL_FETCH) {
> @@ -100,7 +114,11 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
>   
>   	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
>   
> -	return strstr(buf, state);
> +	active = strstr(buf, state);
> +	if (active && output)
> +		active = psr_active_sink_check(debugfs_fd, output);
> +
> +	return active;
>   }
>   
>   /*
> @@ -297,6 +315,38 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
>   	}
>   }
>   
> +/**
> + * psr_sink_error_check
> + * Check and assert on PSR errors detected by panel
> + *
> + * Returns:
> + * None
> + */
> +void psr_sink_error_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
> +{
> +	char *line;
> +	char debugfs_file[128] = {0};
> +	char buf[PSR_STATUS_MAX_LEN];
> +	int ret;
> +
> +	sprintf(debugfs_file, "%s/i915_psr_sink_status", output->name);
> +	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
> +				      sizeof(buf));
> +	igt_assert_f(ret >= 1, "Failed to read sink status\n");
> +
> +	line = strstr(buf, "error status: 0x0");
> +
> +	/*
> +	 * On certain PSR1 panels we are seeing "PSR VSC SDP
> +	 * uncorrectable error" bit set even it is applicable for PSR1
> +	 * only
> +	 */
> +	if (!line && mode == PSR_MODE_1)
> +		line = strstr(buf, "Sink PSR error status: 0x4");
> +
> +	igt_assert_f(line, "Sink detected PSR error(s):\n%s\n", buf);
> +}
> +
LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>   #define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"
>   
>   /* Return the the last or last but one su blocks */
> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
> index a7ebd0739..7639f8d46 100644
> --- a/lib/igt_psr.h
> +++ b/lib/igt_psr.h
> @@ -56,6 +56,7 @@ bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
>   bool psr_enable(int device, int debugfs_fd, enum psr_mode, igt_output_t *output);
>   bool psr_disable(int device, int debugfs_fd, igt_output_t *output);
>   bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output_t *output);
> +void psr_sink_error_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
>   bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
>   void psr_print_debugfs(int debugfs_fd);
>   enum psr_mode psr_get_mode(int debugfs_fd, igt_output_t *output);

