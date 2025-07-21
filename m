Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489A6C83F25
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 12:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F193D10E53E;
	Mon, 21 Jul 2025 12:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nx0YTwOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85E410E53E
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753102040; x=1784638040;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i6r5Yi9/A9k3TP6bCwdHnUT020cMHIxsZfm7GBml+rI=;
 b=nx0YTwOP6OLeYES8E62eQ4BaXnV+ng6MWcC8irM8DE6H/A5IkN+AdgGJ
 35IZMYMlPl6mp2P5WesS2mvwywTkigqL8p3NXWjG1zNmihCa+A/eQGGZw
 qMK3re0c4qgrIgv/ZykcOQ+ZbV5UnBghNetjHvRK8AG465rDd5IWHmHZo
 c06EA8XXbF4Dm9U+q1zgnRGJq8sTOCh/Tpg2sa5WbZwKCr6Gk09mueM1V
 rrnmZTMZlanvW1VcqLFxVzj17KiBS1tibZzAEdzWTzH5QTJ1iYdxhP/Ns
 ctVTl9ZbZl0AnPcBZxMlRX1vxERVqqtLtc8OtP1hlANhHvW/xQifr17Kt g==;
X-CSE-ConnectionGUID: Ngc+Tuq9SV6VsGE7kCE49g==
X-CSE-MsgGUID: 6ZwecN0OQ9SuIngw4X/rwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66381425"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="66381425"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 05:47:20 -0700
X-CSE-ConnectionGUID: 7MjvjuBxTEaA67ac+R0Bag==
X-CSE-MsgGUID: 4uv/OtmaRVycG0D0UNO2Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="158935788"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 05:47:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 05:47:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 05:47:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 05:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzzZslbOsl4zUwAe7X9gUIQF6EdOfugIzCgsBeBTVhmOvDulLPNNhcoLOsrIrTp+Igjzft55RiwgHg+0RPi3wu+uyjZLb1Yjyu3O5njHftjjP+1BG3szbQbmZnb2Hpqj4lPvzZI62otY8sPlGkPFnfuWMcrx86urkAQUxjRl2oalV1rW3gs5u0qaEedj5jUSReAxkxn7wFEji4PflWlPfvzWkcFO8e57PYOerdZ3YK4PzndphgPEDoVuU3nWfmbsWhKhLlFKFTSPqa2NmC5tQH1yVfHaAiwHH3NEMW366Ca+pLWeGApLNgo1Y5ApmdwE1ILTIr0Q5kdczlQzPHhW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kETOWBzwoHGfVdbqOj88TJzrGMithAEUm93LYFxHLFw=;
 b=F57mzr5cYttcrt2e9rSQT4U99l1f4ddyRTHkUoCvy2kPG0dKzxpCPWpXzPpuTJnHUKE67St5T/FZXqCNVeyyFXjkP2osS/VXQo8fkdEBWuCTqG9huQaVuyyI31cermksl6Kl0+dSPgXXJdfua0nO8WicpRODh+P3TWTi5klq0c6hAzqH4MTDAk5/QkTD6FtPAUdKReKIA0gL9i7jA47En0P9S+VZTs1HgE81SkX6vYBTy725AVFSsIoFc/txOOtfujrcsAT0XqCI2W191QNKR3YdmYu+LJ+2HzZzE6oLPgE1FFHGq56cC3KHLWl+Rv6YyNLRQ0jzG7QyaqcCM3V8aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:46:50 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 12:46:50 +0000
Message-ID: <ffe305ed-9bb8-4630-bfb5-356ae94ae313@intel.com>
Date: Mon, 21 Jul 2025 18:16:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_vrr: Improve VRR test robustness
 with cleanup before assertions
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <mitulkumar.ajitkumar.golani@intel.com>,
 <karthik.b.s@intel.com>
References: <20250708220502.803610-1-ramanaidu.naladala@intel.com>
 <20250708220502.803610-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250708220502.803610-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f17265-e5c8-4786-e051-08ddc854a8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDAwYVh1MFRXMGxSNlNvUzdlUmZZV0RCTW5lR1Nnak9sSitmalh4YWpkTXBX?=
 =?utf-8?B?SHYzaE9HbU83UFlWYnJyS2FOWVNCQTBLS0RZUnI5Y1ZlTmhGa3lWUXU0TzdM?=
 =?utf-8?B?R1ZoaVJnaGI5enBZN3FwcUZkUFgwY3VRWmdUcENIaEhmSEJrdmMzeVZZV1Bn?=
 =?utf-8?B?Z1gvME8vL1E1QVR6bTEwd1A3cTRQTG9FU1p2THYzWnRQU0J4aHJRQ08rK1Jy?=
 =?utf-8?B?T1VoSFBEMGQrUlJ0ZHBxVURzdW1iUWo0dHUzdDhZay9aa09xZWRiQ3Avczdr?=
 =?utf-8?B?M2VRS1JTNVFVK1llQWh2UlRycEV6bHdHcmZvSWVyWHpZRE5kTkVZWC84WEV0?=
 =?utf-8?B?Y1JjbWlDMDlZczZYY29Wemswc2dYSVNuOEhjei9YVHZoZlFybys4TkltZThI?=
 =?utf-8?B?N0tiOWVaVWk5UVRiampaanJzeHRzekM1K0tRaGJEL2VoY1hyZ00yRDZ1VHp1?=
 =?utf-8?B?QkYrU3p3ZHdWelZ0dkZWSGUwcHpjcTVzZTBEbEsvQmpmOHNJblJLc2w2dy9Y?=
 =?utf-8?B?VzNjeHhleWJEVzA2THMrZGZPdlM1N2NlSENnNlR2d2hwdkd5bHF5QTdhMkFn?=
 =?utf-8?B?Nng0Mm1CcWpQOGl6SmlvMlJIYnFqeDAzUnNqWDBXRUxTOW9yYVJybXc3OHZx?=
 =?utf-8?B?M2syN0Y1OVl3dmEwREQ1VjRVSFhaZWNQWXBjc0NzZlI5ZHk5dXpDTWtFQXd5?=
 =?utf-8?B?OVFBSzJiaGM0T1RtcmxkNG43Q3o2SExISEthVHA4RDY4cDQ3ZjhIVEY5T0JI?=
 =?utf-8?B?UzdvTXF0UXFJQnliL3BPUlluK3VQd3R5R0o2cFJLZml6cFUwMFhRRkg4dEFx?=
 =?utf-8?B?T2V6YldSUyttNW52enhhOUhaK096NVVPSDZ4SFRsV21UeEtJMHdlRzhTamNZ?=
 =?utf-8?B?cU5oQWtuSklUYUtHK2lieXNuUmNDb3d6M3FvVGw3MHQwYUJtSFZFQVVrYXM2?=
 =?utf-8?B?TElERVFGNGowdkxja0ZVaExMWWF4RzlLRE5ZeHRFUldwRlVuYTl6ZlJhZDFS?=
 =?utf-8?B?THBNVEZacmFJUThJaVNjZm5SRWJ3UWYxNm4wYXJXV3lORXVmbzVoWmFqZTA3?=
 =?utf-8?B?R2IrUkRkQy9CM0plR0lVTmlHR3hBcnVsY2JJNEl2Z3haUXFBcHJ5MEgxdGtG?=
 =?utf-8?B?M2xjcUdsbTlxNlp0NDd0bldoazlPMUtWRFFLRmlMdHBBNzlKYkRqK1lmVUl6?=
 =?utf-8?B?T0xTK0x5ekpOeGRRZGJLZ2JJRWVBMXVORFBubnQ3MmhKQS9xL292TWdJUDFT?=
 =?utf-8?B?VWl3aW5XanJBbWZUVDgzTXVSbXpzS1NSbkhUbENxLzdXelVoWjlOTU9VWVFW?=
 =?utf-8?B?ZTVmaUlNVjNzYjB2T1BuUm52cmt4S3lzR0ZqdUdpV2R1eW5JQWJ1QmhvK0Q1?=
 =?utf-8?B?NFU1VEpyUXdzeTYzc3FIMWlVenBpUEZYanBKeUUrR2lhNURIajBvSTgxOExq?=
 =?utf-8?B?aEVEbncySWpmUElVcjh3OStvdTcvMjBRV3pCdU1Db1RTdkFVYzV2NEFucDFq?=
 =?utf-8?B?N0xYNmVmamUyRUpvVFU0UjZ3MlFxR2dPdFhVSGNUZitNWFFva0pBUUxNV1BJ?=
 =?utf-8?B?MHV5R3A4TDNUTnIvSFFLNlU4M0pUZFBhZ1pFMTAvN2RZUDNXejVwaGU4Syt3?=
 =?utf-8?B?YUQxQVM2TnRFL3lsODY5eXFsMVdONGpFSGFGdmtjZDZLWEVyVzRhK2NJQU8z?=
 =?utf-8?B?VWgwR1hqSWlwTEdTWUNFd2ZRWFJka2JqRllzUmxEelcvNEx4RUxqYk1WT3pY?=
 =?utf-8?B?SU1hOGVWZncrYjB5dW5XUW1wM2FKb0t6REp4RVBlUnlEMGNET1VRRW5UODBQ?=
 =?utf-8?B?UmowVnc3Kzh2MlUrbVBUbjNTend1VWVoOE1MTS9tUGx4OXBJN0w3aXladDZ0?=
 =?utf-8?B?ZXM4ay9rbmhpU0JNKy9DcVZ1dmpVY2dqcFFJamgrd1JWR3lEdTJzMWtBSXFN?=
 =?utf-8?Q?s3c9H3DH+5E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG1UcDg0VzlHK0NEc0dZZkNQcERaZzVyUGQ0eTdjV0RQYWFleVUvVGNMTHNN?=
 =?utf-8?B?T0E0QnhUc1JlV2dIeXAxUDlCbEJtU3pMM2pGMklseUxpaTJrOWdTZ3RNN1pm?=
 =?utf-8?B?RFFRSjlIUUl1aWhSYlRXa3dkN2wyalcyd0lRUVdTTCtBZVpyamtDbnVxcC9v?=
 =?utf-8?B?MVhHMzZ0N0lmdkl6VVVnVjFjclVOV0NHZVNVMHBrdjV3RHl6dUdtMHVpb25H?=
 =?utf-8?B?K2JNMCt2RzJMYnZCbmgwYnVNUmpjeFlSbW9lazRvRVFLUEoxZWp4aDM1dFo2?=
 =?utf-8?B?TXJkMkhxcW1DU3FpOTBGampyVFkya0YvQ0x4bDdNeDBmL2cwV29tTWV1NHA5?=
 =?utf-8?B?bi9CZzRsbFVyYU93Nnk2YzVMcER3STQ0eThaRXFTVlg1T3NPRnZMa0RWaDg5?=
 =?utf-8?B?RkMwazdudUJsWVhRWW55WDJzd0ZoUzdWb2ZTVTd4N0diTllrNHRabWt5Y3JL?=
 =?utf-8?B?ZWdVZm9JbEo3Ty84OUVqZHFORWRMVDVNMUFuZVRnek5IRzBzNSt0NWRTNGdv?=
 =?utf-8?B?TmVWdGZMRTB5d2pDemh3WmFLdG1RRTBONW9MREtJdk9iMEp0YlJEV2FRUzRs?=
 =?utf-8?B?SHZ3V0ZqUUxLNWhKM3hOYVo0NC9BSm1nc0NtdC8wbmZxb2tXa1Rjd3crOE1L?=
 =?utf-8?B?UGpWUksvVWE1R0c4ckd5ZFIvd3I4M3FwWWEwcG5EMTluZSsycTJ3VmRseHNo?=
 =?utf-8?B?OFBScDNiN0V5V1JDQnZiRGVOUzRpMGorbkhyNkQwUnJvOE85eWRDSUhCNm1w?=
 =?utf-8?B?SngweUpyeUUrT1NLc2RNQ2pKdVE5SWlZeWpKQXpaTE9jTjhiU2JaS05SZ1Nv?=
 =?utf-8?B?bFRCRURNaFdHTGV2OXVsZzlJV1F0MG5SSEI0SC9TVGR6Zkg4WHpwdkozZHNw?=
 =?utf-8?B?TzhZeVNXdDZ1a2J0a1FYZDRKUjVQZktIRGpCM2M3N0I3TTU3SE9MS2pmaTIy?=
 =?utf-8?B?MWQvaHVrZ3RNRnpVUTZOZG9VekJ2NWtYRDVqOHJIeXRGT1RGenNCNmZkc2pP?=
 =?utf-8?B?SlVKUUZOdHNyT3JlbUN6TFJscHVxK2dxdVZ0U1ZvZW1YM2M5NGlQZytmaFRC?=
 =?utf-8?B?bWRIQ3dFMXBLQzJiUk9EOHg5akpYdUZRMk80K3owSnNjRGwxMEF2TjJqUHBK?=
 =?utf-8?B?Z2luc0VpRUE1YkNTNUU3N3M0MVlnRWlBM1lZTjRDYjNpSXRLRFBzUi9jNWpM?=
 =?utf-8?B?RCtlRWczQ21hek82Nk9uc1hyMTVIYnBoQ3FrRUNCV1BoclVMVGkzOFpSYnpi?=
 =?utf-8?B?WUVRa1Uzeit4dGtwaG1CTUFrc0NNUTZ6VWVYRTRaQ1BEejJtck1HN0x0ZG5u?=
 =?utf-8?B?bmU5bk1BaDNoYUJ4SFkzTmUwaWh5amRKcGwxVnF3aXpjbHRTdzNoc1RJZC9J?=
 =?utf-8?B?VFdyWU05eTFvSWhlQ3Z3dUVwNDVtUVdCRUZhWitRdXV1T2Vmam1CME9QNnFK?=
 =?utf-8?B?eGFuOUhLRkpwbkdjUFhMd1pCSThFYnF4bTE0L1BYb1A3SEFkdmVQWW1ISWxG?=
 =?utf-8?B?WkZ5Qlpqamh5ZWIyNisxS013NU52dEF0U2duM3V6bUJUSmdVSkV2YUR6Ym5T?=
 =?utf-8?B?bC9ZL0Zuakw4MmJySTIvUHFWYkQva0NlSVRzZHRTaHhSdUVWeTI0WGxyN3ZS?=
 =?utf-8?B?Q3cvT3JaUDN5YlI4RHlQeCswQzRyRWdabW9WNFBORk1VTE50RDczcW9mTzF5?=
 =?utf-8?B?bnFZaUN6MjRPNWd1UVlhMnQ0S3lXUjl4Rk12ZVNvVUZVSTVVcHMwcGorU0NE?=
 =?utf-8?B?T0oyOHZodXZia2IydWR4dXl6eXV5Z0lSZGZya1RSN3FKbjFablczYnRIVEdp?=
 =?utf-8?B?Q0lzT3N4MXR4OStSK3RXWUkvYTM3cEJWa3dKdWR1blVPK3hkSUdINHlaV2dL?=
 =?utf-8?B?VEVzYjhTQ1hsWmxsR3kzeXJQNFYrR0NaSUdkb0trQVU0NVhKdStoR3NJWkFZ?=
 =?utf-8?B?Q3FYdWlFMTNvSStSUm9IS1ZFRUVkdzFmNGV4QXRpdlA5aW9ZRzh2WThXaXlJ?=
 =?utf-8?B?bXRoOE1OSW93RjFzMER3ckgxNnRJRkV1bElGbEpGbG96eENvSEZ1T29IUWo5?=
 =?utf-8?B?NzVSN0FKbEladlh1dUFjbmtrSCt0ZTFjZnV4SmU3MlA4WFZyT01TTUN4dmVK?=
 =?utf-8?B?THo1dWVLeExtMlFIekgycVZBZUhRV2FYK01mTytKbEJpTHM5b3hKYjR1clNS?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f17265-e5c8-4786-e051-08ddc854a8e1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:46:49.8444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWxy3TCebA4fmYmI1lJyVwDj3gDqqTmgY2ieZagAahPl6FkXK26BQcg5tiBgEPm26lJ0nkMo8DhpauVeaSbz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6418
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

Hi Ramanaidu,

On 09-07-2025 03:35 am, Naladala Ramanaidu wrote:
> The robustness and maintainability of the VRR (Variable Refresh Rate)
> by ensuring proper cleanup is performed before any assertion failure
> is triggered.
>
> Previously, when a test failed due to not meeting the expected VRR
> threshold, the test environment was not always cleaned up properly.
> This could lead to resource leaks or inconsistent states that might
> affect subsequent tests, making debugging more difficult.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_vrr.c | 161 +++++++++++++++++++++++++++++++-----------------
>   1 file changed, 105 insertions(+), 56 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 9c2c4ac92..a24f413de 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -241,6 +241,18 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	return mode;
>   }
>   
> +static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
> +{
> +	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
> +
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_override_mode(output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
Add a new line here.
> +	igt_remove_fb(data->drm_fd, &data->fb[1]);
> +	igt_remove_fb(data->drm_fd, &data->fb[0]);
> +}
> +
>   static void
>   virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
>   {
> @@ -701,25 +713,34 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	if (flags & TEST_FLIPLINE) {
>   		rate[0] = igt_kms_frame_time_from_vrefresh(range.max + 5);
>   		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> -			     (range.max + 5), rate[0], result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> +				     (range.max + 5), rate[0], result);
Instead of igt_assert_f() we can use igt_fail()  it will avoid the 
confusing |assert_f(result > 75)| right after explicitly checking 
|result < 75).|
> +		}
>   	}
>   
>   	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN)) {
>   		rate[0] = vtest_ns.rate_ns;
>   		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> -			     ((range.max + range.min) / 2), rate[0], result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> +				     ((range.max + range.min) / 2), rate[0], result);
> +		}
Same here.
>   	}
>   
>   	if (flags & TEST_FLIPLINE) {
>   		rate[0] = igt_kms_frame_time_from_vrefresh(range.min - 10);
>   		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
> -		igt_assert_f(result < 50,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
> -			     (range.min - 10), rate[0], result);
> +		if (result > 50) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result < 50,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
> +				     (range.min - 10), rate[0], result);
Same here.
> +		}
>   	}
>   
>   	if (flags & TEST_MAXMIN) {
> @@ -732,10 +753,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   		};
>   
>   		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> -			     range.max, range_min, maxmin_rates[0], maxmin_rates[1], result);
> -		return;
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> +				     range.max, range_min, maxmin_rates[0], maxmin_rates[1], result);
Same here.
> +		}
>   	}
>   
>   	/*
> @@ -746,9 +769,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
>   	rate[0] = vtest_ns.rate_ns;
>   	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
> -	igt_assert_f(result < 10,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
> -		     ((range.max + range.min) / 2), rate[0], (flags & TEST_NEGATIVE)? "on" : "off", result);
> +	if (result > 10) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result < 10,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
> +			     ((range.max + range.min) / 2), rate[0], (flags & TEST_NEGATIVE) ? "on" : "off", result);
Same here.
> +	}
>   }
>   
>   static void
> @@ -758,6 +784,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
>   	vtest_ns_t vtest_ns;
>   	uint64_t rate[] = {0};
>   	bool vrr = !!(flags & TEST_SEAMLESS_VRR);
> +	uint32_t ret;
>   
>   	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" : "OFF");
>   	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> @@ -773,14 +800,21 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
>   		 * so switch to High clock mode as test preparation
>   		 */
>   		igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> -		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
> +		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		if (ret != 0) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert(!ret);
Same here.
> +		}
>   	}
>   
>   	rate[0] = vtest_ns.max;
>   	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
> -		     data->range.max, rate[0], vrr ? "on" : "off", result);
> +	if (result < 75) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
> +			     data->range.max, rate[0], vrr ? "on" : "off", result);
Same here.
> +	}
>   
>   	/* Switch to low rr mode without modeset. */
>   	igt_info("Switch to LOW_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
> @@ -790,22 +824,32 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
>   
>   	rate[0] = vtest_ns.min;
>   	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
> -		     data->range.min, rate[0], vrr ? "on" : "off", result);
> +	if (result < 75) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
> +			     data->range.min, rate[0], vrr ? "on" : "off", result);
> +	}
>   
>   	/* Switch back to high rr mode without modeset. */
>   	igt_info("Switch back to HIGH_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
>   	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>   	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> -	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
> +	ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	if (ret != 0) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert(!ret);
Same here.
> +	}
>   
>   	rate[0] = vtest_ns.rate_ns;
>   	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
> -	igt_assert_f(vrr ? (result > 75) : (result < 10),
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
> -		     ((data->range.max + data->range.min) / 2), rate[0],
> -		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
> +	if (vrr ? (result < 75) : (result > 10)) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(vrr ? (result > 75) : (result < 10),
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
> +			     ((data->range.max + data->range.min) / 2), rate[0],
> +			     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
Same here.
> +	}
>   }
>   
>   static void
> @@ -815,6 +859,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	unsigned int vrefresh;
>   	uint64_t rate[] = {0};
>   	uint32_t step_size;
> +	uint32_t ret;
>   	drmModeModeInfo virtual_mode;
>   
>   	igt_info("Use HIGH_RR Mode as default\n");
> @@ -828,12 +873,19 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	 * switch to highest refresh rate mode.
>   	 */
>   	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> -	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
> +	ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +	if (ret != 0) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert(!ret);
> +	}
>   
>   	result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> -		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
> +	if (result < 75) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +			     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
Same here.
> +	}
>   
>   	/*
>   	 * Calculate step size by considering the no. of steps required to
> @@ -851,13 +903,21 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   		kmstest_dump_mode(&virtual_mode);
>   
>   		igt_output_override_mode(output, &virtual_mode);
> -		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
> +
> +		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
> +		if (ret != 0) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert(!ret);
Same here.
> +		}
>   
>   		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
>   		result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> -			     vrefresh, rate[0], result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
> +				     vrefresh, rate[0], result);
Same here.
> +		}
>   	}
>   }
>   
> @@ -924,26 +984,16 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
>   		prepare_test(data, output, pipe);
>   		result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
> -			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> -			     result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
> +				     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> +				     result);
Same here.
> +		}
>   	}
>   }
>   
> -static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
> -{
> -	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
> -
> -	igt_plane_set_fb(data->primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_output_override_mode(output, NULL);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
> -	igt_remove_fb(data->drm_fd, &data->fb[1]);
> -	igt_remove_fb(data->drm_fd, &data->fb[0]);
> -}
> -
>   static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
>   {
>   	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);
> @@ -1060,10 +1110,9 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
>   				      kmstest_pipe_name(pipe), output->name)
>   				test(data, pipe, output, flags);
>   
> -			test_cleanup(data, pipe, output);
> -
> -			break;
Why are we removing break? Do we want to run test on each pipe?
>   		}
> +		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_override_mode(output, NULL);
Is this redundant?
>   	}
>   }
>   

