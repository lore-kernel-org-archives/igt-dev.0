Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54B3D11183
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 09:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BEF10E7C3;
	Thu, 27 Nov 2025 09:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqOfJ94H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A53D10E7C3
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 09:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764236156; x=1795772156;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=8bdCUeCx//7K+3wSmq5exZ1ckuKoBceVbqBJ0+Y1KGA=;
 b=CqOfJ94HOhhb24X9ITVxFkr7lqvxJlf5TGgqW3qLay3+yyrvcQ7Wek/s
 q99ruo0/fGddhiK62evau6KDJCQ2u3bAwB+4FgWdnkSC+K8rrZmTvJtF+
 Tf9l03NkQm//2W7Brl8NsM6pR7+DIfZHHRDkB2sEOPs1qSdIGPMcVcezR
 FKUJaiR4fZQYGcKBVYf5BhrlwqWdQv2OCsOmxXU1BoAQa6xZPWUPhUam1
 AKnjNK34nkzX7W5qOxMJJ3gl7N0e5Dsc68nHeeMmO4jcc7UqgYvS5vcKM
 tgaeWXkTdKKtYMPmQ2kQ/edfXGAN4ZOwGan+f+mpOVO3uLlpitdaCxxJ3 w==;
X-CSE-ConnectionGUID: 1NSB/9nuQNWwcG9/ghIRuA==
X-CSE-MsgGUID: 0s6RjDM8SruyYjMTxvBNrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70147911"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208,217";a="70147911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:35:56 -0800
X-CSE-ConnectionGUID: NKgxORJKTG+HptVkdlI/Uw==
X-CSE-MsgGUID: nSS+BeYbSEyATzBl3MLJ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
 d="scan'208,217";a="193002867"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:35:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:35:54 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 01:35:54 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:35:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzhVmULITPBoa3BpdcXpNtOwY59b5awrEBZ90v8MGZiFZ2povqdVp5Jf/98VRkLsuUJzG8a/ii5z82iUYdonc+FyrUJGXP3y7L+pSp2xNBW/4grTSktvUm48Lp03mxSotjEruJ9ZelVvYBRvSV+IfaYRrFuPymghKGQ+YMBtKWqODuqah6h/B0vBHq8vqtpX/GC5pgSikb361euNrAYULUCPwYvbb+5FMTzRFkKYAt82pUZ9sSG9c0sVvQMbMdPhlZ2D9N01CuRpy95/J9ZEgJ62L8nyWg9Mwb10FRccquawxlG5xQUOvdgoUC/52Dn3qeB5PQ/4unEwWGmhMFQhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44fW7d6yD5Gg1XzaL0ZJzOl+c9DwisAAKzJ7olNIVyY=;
 b=yS9oxASNs6nidqcJwem60eaNje//dyYwYgpisG+T/HGS2NyEROq7jEC9pYooCL/vZNORallgvUcDwp833ndUyk++9HcK8RPQnKwqYHSiYm+umsHDpL3tTMqaf3cpfFNIxJsb+s6N85PJ4f5lOwQeIGwhkExQtr8R7mZHEMdIStjNIfWc2z+iQReCE5+TpEVlgEuyhUs56qIiOKfB4+YmjGX38RZAmDP5ppYeWfs+HTSzLAdyFAOYvCpw2xWlsqN3ngiG42TCzJLfa2yc7rpQukN2vTRtq0dRkEABwZg3vqVV3jJV6Ltku1NKZUps9X3Y1WFr9YrGCLohJmkB3M3iow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 09:35:47 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 09:35:47 +0000
Content-Type: multipart/alternative;
 boundary="------------6hcCgj4SaDGQj4IqYLEZUzYi"
Message-ID: <4673f6d4-000d-4aed-9c66-55c2b322c368@intel.com>
Date: Thu, 27 Nov 2025 15:05:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_exec_system_allocator: Added 64k
 alignment support
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251124042821.283623-1-sobin.thomas@intel.com>
 <20251124042821.283623-2-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20251124042821.283623-2-sobin.thomas@intel.com>
X-ClientProxiedBy: MA5PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::12) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: c99dd2a3-95ee-4d1f-d11a-08de2d985812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3RENUdRZnp3WEpSYTN0WEM2ZkpCM1RsdC9PdUhTZHN1NE1VeHA2RXdTV1ZB?=
 =?utf-8?B?dGJWdjZMSmErdSs3N1ZQMWQ5WFdSRXBVK3FQVmlOQUdyQ1FjbkNkQW5QbmxS?=
 =?utf-8?B?Z09hdlR4a0FFeFkySkdwb0tNMC80d0FiOTNRZXZOam1DaDBMNHNXcEtBckw3?=
 =?utf-8?B?MDZuVFV3WEkwZDdraUJNMDF3ekExNFV5V1Q4Ri9sdTYyMzJQWDF0cHNTRXZN?=
 =?utf-8?B?eFNUbEVXTjVTajhNamplUnUxQ2JUcytlSlRZdVhkbm1mVlBXNXFHSFBjSTZi?=
 =?utf-8?B?WWFjTXBDQWZvbG13MlNSV1ROR3p2eU13MmkzdnJiZ2RJeG9HOXdibGM4aVJv?=
 =?utf-8?B?bTUzNUI4Y1NhRUhqQUVLSjBYdEw4SFdrTlpGK2hUVWRISWFoazJuQW1qTCtx?=
 =?utf-8?B?djF6c0xWd2hwYlFxbE54Ykp6OHdGMlhDVHJXNTFrVzgyRWJXVGUwMVVZVDBr?=
 =?utf-8?B?dFFmTDgxaTdEUE5xU3BXeTVLbm83OEZvYmF6Y1pwVk9QOVJKUzdqdTgyVXQz?=
 =?utf-8?B?cW1lVis4YkIwejdkWFp5UzVGK0FjWk42ZlVicTFCRFNKeGVod2ZweVc4ekxU?=
 =?utf-8?B?OThBZGs5RGFET21PRE9oT2V6QVVGVTc1Z3BzU2t6SVBxZVRWWXI5R3FqQVZW?=
 =?utf-8?B?QXVDcmFNTGtWZGx0WmVXSVc5Y0xGeW5uNTN1ckcwUWVBbWduZUJKWklyTE14?=
 =?utf-8?B?QUpxUytWR1lJaUc4NERzeHFqTWlKV2ZwTWFEQUNDaFY3Q080MjAxUFRXZmtK?=
 =?utf-8?B?cWRmNytheXloNVRueWZlQ1lTbkxKWVhvamViZENVZXhPdmprbUJ0RkJrbFhT?=
 =?utf-8?B?K2wxK1hEdWZkSDhQYU5tOWkwUDdzOFRkUE9GMGlGMTUzSnAydkIyOCtWdmpY?=
 =?utf-8?B?cFd1V3lCNzAzUkZUMFhGRVRDMnVpZXpRTWZOcnpaN1AvRndzSmZQbG9wVENZ?=
 =?utf-8?B?c21UQTJQWVVtMHBUbjhNcTRWV2FYYXlpKzBFQXBwL21XQUhuNUQwbWtEcVZk?=
 =?utf-8?B?TE12aTBhTlRNUUhjVzBTa2lROWVWZ3g4ZDFhM2FZd0R1N05oaDhvaVRqYXJG?=
 =?utf-8?B?UlY3bVlaNVZ3T3RkeWNnMmxuNllIc0RUNzhkYmdMdXhua3hIaERLNThBczR0?=
 =?utf-8?B?SkZIZWV3K0QzOWtlK2I5ZzVQbDVUTkZMSWRPeEdmdFc2RWx0WTNJVTRGcTdh?=
 =?utf-8?B?RGV0NDRCdU9XdFQxZktWSnFUaFRZc0tuaytHNk4xTDdvOUNIU0lhYWtYNzJy?=
 =?utf-8?B?dkt1QjhkY3lJYVUyeC9MVzBmTkFMS3lNQVVTa3ZUNDFyOC9Ta21RekRIQ0Uy?=
 =?utf-8?B?ZStGN2laYnFVSkdSb1V6dXFLTGliTG1oaWV1eDAwaUQwL0UvYWlUSy9pRmZH?=
 =?utf-8?B?bldNLzNBankrdEFBdzBRaTUySWdVcXRkaGt1Rkhyd2dGZnhiR0ZQMEJqVWQ1?=
 =?utf-8?B?RWRiZktXbXNmb2puOHo5V1lnNVdDUjBHUGkybmxPZW9UOWsxRnphS3FqNGU1?=
 =?utf-8?B?WkV1SHhvblZ1VXo2RFlNVndtL0VoblllLzE1M0toVkt1UXcyNG9KcnVQSjM1?=
 =?utf-8?B?d1Mrb3V6MjQyOHhrdlVEdW9QdGl1Tk5FZ3ZoV0c0aktyVG4waE04WExyOEww?=
 =?utf-8?B?bThSeUc0VVlGVlQ1dEVHMitUTUhIVVk4VWJCWVJjbTJxZHdzYnBPQzFNU2tO?=
 =?utf-8?B?enZmQ1ltcXlPbmcyWkpTaEM3TVlQTmhYUHpBRFVPOU11Y0dveGlGWExuMTNt?=
 =?utf-8?B?Y25mUW1SVitveTNjNTYydVpHNU11UmUzRUc0T0hpaFZIOWp4NGxBb0hNTk1m?=
 =?utf-8?B?OU1IVDZtS3BmcHZDbERPajdpL25uczA4RzNYN1NZaXd2Z0dJR3Q4UUljVldW?=
 =?utf-8?B?WitKT1VueU90T3cxVEJqTDVtczVLYm91OHMxd3gxS2kwOEZEbWw5dUZiaVdS?=
 =?utf-8?Q?grDdU2YEyEXU+8Ne3vL+Cp67fwEgJ+iW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGlpczdZREgyYno3S3hzNDJFaGpLdUZxZWMrT3pJaTFLaGg0encrSGVnUVJM?=
 =?utf-8?B?M210R3dDQmV2QU9rSzdNOG8wdGhDQUFjb25aTlQvVll4TGplUE1GcXJ2S1RY?=
 =?utf-8?B?L0UwWHlXeGs1TUVNLzEyZkYvb3NQdG9iaTN4QWhpaUgweFM0cFJDUitnRU5C?=
 =?utf-8?B?WWx0cGFUOHZUdEtxN1diL2FmTTZodndmTlhnVTFOVkw3SWNrbXJCcDhhN2NG?=
 =?utf-8?B?Mm15Mm1pUjdtMDNQeFFUc2oxWmE5Slp0dXBzVDl1cGJUeTJjVWpXejI4MllC?=
 =?utf-8?B?aVJOTWhmNkxQVS9tTDMxaXBVd0FKcG83RHdNZGNFbWx4YWtFRmlaeXpQTlZK?=
 =?utf-8?B?RkczRy9UWkY5Wlk4NTNUOTlVNHJoSUVXYkN2Wkg3VzJKYktnZlEwOGZkUmhw?=
 =?utf-8?B?dDNXcFUyMzJMdWJaTDlsMzhHRmRhdlpwdWN0N0tMcXFhRXlpNWlVM1pLcEdR?=
 =?utf-8?B?L2pON0U1eEpzYmVTc3M1TVZCaXlwcW1OeTBtZGY2QVU2Ylg2Y2dZbUhnOGM3?=
 =?utf-8?B?allsNHErRnpvTTVDcnYvaitSMktaS0Nxbjk5WFNYbDlQbFhJdXVNWTlBZE5v?=
 =?utf-8?B?N0dvSDkwZGw3SXNCenN5T3BUM2VRcEh0bllWaXpFWGp4R011KzlzNlFjRzRp?=
 =?utf-8?B?M0tjaHVtTEU0STFwNnJkeTF6dmVsUDRTaXlrTFJVekxPL1ZoSHU3QUxWenRG?=
 =?utf-8?B?N2w5amZ0N0ZEdTFnS0N0RCs4MDIwSDlLRDByWUw2aGI0WVI0dzVIY2VKYWNG?=
 =?utf-8?B?OS90M2Fqb0xHWitGWDlNR2VzVGdVeWNtQ01iOSthOXRMOVBjak1hQ00zcitP?=
 =?utf-8?B?STd4VVZCZW9vLzF6VG9qWGxPQi9NbmRrRjlSZ1ZSa1N1OHBGYm5MT1MvMFA1?=
 =?utf-8?B?N2plVkFBOTdJaHVyY3dUZkZSVmNqdjdQcEh0K0ZoODVmdGhGOURyWFRUMGcw?=
 =?utf-8?B?T2hjSC90SytJbkY5MWQ2d1hNMWRJdXB5OXNZTWhKUUI0RWk2dHplUDc4b1lL?=
 =?utf-8?B?Ung4ZnJLMFprdG1ycjBsdkszK2piNjA1d1RXMTY1bldzNVV1ME1WR0VaZm8r?=
 =?utf-8?B?ZFJyY2cwNDFHRTNVeldXVmx5RUhJM25Ca1BlK2x3SlpUMk9ySE9tUDM4TThy?=
 =?utf-8?B?YW96OEw0N01UNXpQS0RqdmJwbDBzQTdRRTI4U3dVS1BhOFdhWjZUSldjK1Z1?=
 =?utf-8?B?YWpOQ0x5UGZ6N1pYbHMyTWlJbVJVYi9QM1dES3czRUZQeU90Qm5YVFpLb25L?=
 =?utf-8?B?S1RDaW43UkZBVVFoL1I3Rm5GbitFQmd2ZWFQS3A1ck5XTkhnakN6M0lRc3dD?=
 =?utf-8?B?SURhd0UwRmZGZ3NLTEN1Z1BQWHNDMVRoRzdFcERQak81S3UvUkJKS3VIMjA0?=
 =?utf-8?B?RDhpZmxSZlY5NmNJZkpWRzl3UXNQaWN1aWx2YWhIRzEvOFNFY2p6cTdNSWV2?=
 =?utf-8?B?TktidHhBdDdBNDJqWElJVFE4UE5FZXVmd0xSWmtMWEZqSStGMEVnRWJ0V2Ra?=
 =?utf-8?B?dlkvUGxXVGdmNy9kelZGcmZ3aVdFcFpFNWtvUHIvdlZESWtjcHdUR2xVdE5q?=
 =?utf-8?B?ZHdiU3VwNjMzWWdralRQMUxLSGpCRlpXMWl0cVA3OWNZRGRjcTduMDRmQWJD?=
 =?utf-8?B?b1QxSzVJcHE0MjJzS1BZUU9iekpFalVMRFFJRDlsenpXR0FtYnBHaFQvOXNl?=
 =?utf-8?B?ZmFyWFJsdFlPbGZFSGpjc3g0TFBuZmhXemJOTkYrNVBqem9TSjF2a3Y4dW02?=
 =?utf-8?B?alBjTVFjRFE5NXVScDl3SHpkYmpMc2YrenJDWXNNQU5qQ2oyZkQ0aWxadDd6?=
 =?utf-8?B?TWxuTFZtOTdVYXJ3bzRaR3ZEaEtGL2ZKSGlaZElEaDVwRDU2K2drTG1rb1Qx?=
 =?utf-8?B?Q1RvVCtZSkV0amI1RFlqb1BUZlY1aFFRUE11ZDJUZ3U3ZFhwY0dGTGNndFhr?=
 =?utf-8?B?aWN6MTBZVy9LdjcvRW9pZTFDbm5SZndpK25samtTLzBWZms1aWJsa3NweWl6?=
 =?utf-8?B?eFpERjlGOUhXdk5teFpESEI1UnpLOHQvbGVsd0lzYkc3R1JhMTBiNmVBQkFy?=
 =?utf-8?B?aXlsUW1naTVzZ1d2QlJMczlJdjNCYkMwRisrTjFNV0MwRFVPN3V1NnRoTEkv?=
 =?utf-8?B?UXNGN0tZWjlieHJaa3JzVVVjdCtxdTZHNDYwYWVjTllYcjhGWDREUWNPaHNo?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c99dd2a3-95ee-4d1f-d11a-08de2d985812
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:35:47.2019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Saq9C5la83e+hI0MgUksbVgjELD5w+lxJCr/bmjEIOEdXr6T/naMLIRRAXos6rrMCu7oxOzeFgUxHjPjE8zJdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

--------------6hcCgj4SaDGQj4IqYLEZUzYi
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/24/2025 9:58 AM, Sobin Thomas wrote:
> The original test for madvise split vm only supported 4 KB alignment,
> which failed certain hardware such as PVC that required 64 KB page
> alignment. The test has been updated to include support for 64 KB
> page alignment.
>
> Signed-off-by: Sobin Thomas<sobin.thomas@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 26 ++++++++++++++++++++------
>   1 file changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index b88967e58..9530e07e7 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1201,6 +1201,8 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   			    struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
>   {
>   	uint32_t bo_flags, bo = 0;
> +	uint64_t split_addr, split_size;
declare these variables in if (flags & MADVISE_SPLIT_VMA)condition
> +	uint64_t alignment;
> Remove this alignment variable as it's defined in (flags & MADVISE_SPLIT_VMA)
>
>   	if (flags & MADVISE_ATOMIC_DEVICE)
>   		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
> @@ -1251,17 +1253,29 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   	}
>   
>   	if (flags & MADVISE_SPLIT_VMA) {
> +		uint16_t dev_id = intel_get_drm_devid(fd);
> +		uint64_t alignment = SZ_4K;
> +
> +		if (IS_PONTEVECCHIO(dev_id))
> +			alignment = SZ_64K;
> +
>   		if (bo_size)
> -			bo_size = ALIGN(bo_size, SZ_4K);
> +			bo_size = ALIGN(bo_size, alignment);
> +
> +		split_addr = to_user_pointer(data) + bo_size/2;
> +		split_addr = ALIGN(split_addr, alignment);
> +		split_size = bo_size / 2;
> +		split_size = ALIGN(split_size, alignment);
>   
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>   		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
>   				  bo_flags);
> -		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) + bo_size / 2,
> -				 bo_size / 2, 0, 0);
>   
> -		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) + bo_size / 2,
> -				    bo_size / 2, DRM_XE_VM_BIND_OP_MAP,
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, split_addr,
> +				 split_size, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, split_addr,
> +				    split_size, DRM_XE_VM_BIND_OP_MAP,
>   				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
>   				    1, 0, 0);
>   		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> @@ -1269,7 +1283,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		gem_close(fd, bo);
>   		bo = 0;
>   
> -		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size / 2,
> +		xe_vm_madvise_atomic_attr(fd, vm, split_addr, split_size,
>   					  DRM_XE_ATOMIC_GLOBAL);
>   	}
>   
--------------6hcCgj4SaDGQj4IqYLEZUzYi
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/24/2025 9:58 AM, Sobin Thomas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251124042821.283623-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">The original test for madvise split vm only supported 4 KB alignment, 
which failed certain hardware such as PVC that required 64 KB page 
alignment. The test has been updated to include support for 64 KB 
page alignment.

Signed-off-by: Sobin Thomas <a class="moz-txt-link-rfc2396E" href="mailto:sobin.thomas@intel.com">&lt;sobin.thomas@intel.com&gt;</a>
---
 tests/intel/xe_exec_system_allocator.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index b88967e58..9530e07e7 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1201,6 +1201,8 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 			    struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
 {
 	uint32_t bo_flags, bo = 0;
+	uint64_t split_addr, split_size;</pre>
    </blockquote>
    declare these variables in&nbsp;&nbsp;<span style="white-space: pre-wrap">if (flags &amp; MADVISE_SPLIT_VMA)</span>condition
    <blockquote type="cite" cite="mid:20251124042821.283623-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	uint64_t alignment;</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20251124042821.283623-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">Remove this alignment variable as it's defined in (flags &amp; MADVISE_SPLIT_VMA)

 	if (flags &amp; MADVISE_ATOMIC_DEVICE)
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
@@ -1251,17 +1253,29 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 	}
 
 	if (flags &amp; MADVISE_SPLIT_VMA) {
+		uint16_t dev_id = intel_get_drm_devid(fd);
+		uint64_t alignment = SZ_4K;
+
+		if (IS_PONTEVECCHIO(dev_id))
+			alignment = SZ_64K;
+
 		if (bo_size)
-			bo_size = ALIGN(bo_size, SZ_4K);
+			bo_size = ALIGN(bo_size, alignment);
+
+		split_addr = to_user_pointer(data) + bo_size/2;
+		split_addr = ALIGN(split_addr, alignment);
+		split_size = bo_size / 2;
+		split_size = ALIGN(split_size, alignment);
 
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci-&gt;gt_id),
 				  bo_flags);
-		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) + bo_size / 2,
-				 bo_size / 2, 0, 0);
 
-		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) + bo_size / 2,
-				    bo_size / 2, DRM_XE_VM_BIND_OP_MAP,
+		xe_vm_bind_async(fd, vm, 0, bo, 0, split_addr,
+				 split_size, 0, 0);
+
+		__xe_vm_bind_assert(fd, vm, 0, 0, 0, split_addr,
+				    split_size, DRM_XE_VM_BIND_OP_MAP,
 				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
 				    1, 0, 0);
 		xe_wait_ufence(fd, &amp;data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
@@ -1269,7 +1283,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 		gem_close(fd, bo);
 		bo = 0;
 
-		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size / 2,
+		xe_vm_madvise_atomic_attr(fd, vm, split_addr, split_size,
 					  DRM_XE_ATOMIC_GLOBAL);
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------6hcCgj4SaDGQj4IqYLEZUzYi--
