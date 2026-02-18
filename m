Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9C1E9A02C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 16:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058F610E085;
	Wed, 18 Feb 2026 16:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eleTU3pe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F12010E085
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771431816; x=1802967816;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cP4+1DKLZZZEkE1ewBaaZ0Xow4/taWnz+ElrY+KgE6o=;
 b=eleTU3pe9BKynzJ2DVtMWP0IHoqs1cXeOLZbrXZLmcq3QElEbosdHATt
 YEleq3mYXY/FcsjqkFfKJYVWa2TP5S5MwBnax6syUene8iAa0/7aa1iSX
 8OaIK0CRPwt16iHLr3ZPTwU9FRxl9ISWxI+ePKPG/uL0Su7WclirmOTwU
 xMuaAtrkhzDkeQnpPUQ1fXEQMmDeAc+NUnn9W4oI+XWs/dDcFqIQ35Pu5
 41NlVgMOc8VxP87XHwHjniQZmfpkLjPl3HbMivdSloNrGzrhOBYBztgvG
 k6iQhqdfpA5lMULHB4ym5teOqqjVOaq4fD96eIVOgghr3Qpr5Giy7WqD1 g==;
X-CSE-ConnectionGUID: z9JgRlBYTNyYWC5gmFIQEA==
X-CSE-MsgGUID: /eVmcwv6SNiaSDYDa2RGLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="90094572"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="90094572"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 08:23:36 -0800
X-CSE-ConnectionGUID: aFqgExNIS/yUozHflRv7fA==
X-CSE-MsgGUID: 9sQjQtwaQ+WHM835uLSpMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="213477218"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 08:23:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 08:23:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 08:23:35 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 08:23:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bErJuJiOHEjN5s0+0O7NIE4A1/tYS14+v9EHvhtEVWAmZp+yU2LbvhUYklk9yDCpksqAYr1eErMsBfelLCSASLpHB4y1kMMqNwp5veCFSejRnMt5BiPUOuaa4KeKjdG3lEWA1/XuPpxcd6/dUZwpLgNuuqIdzFWl2c8EVN5tloZJMOxGUycyWXuYg0hHfhQg9IcXftycqGyclYI+FwYiwbDSrl+cc74fVoknzedfVGDcXnOMGzH8ValzSN9EgYKQ3fWal7NeIk7wHKtrX3IrDknnqUOrB7O+VK9rIYbFNamYnaL7Uy78u0aP8gnzVPuv8dUtY+kX6OJ6wuFcFWcqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjno7qPER8p/gyRXeeBOdJ+a6aLy1dIsIyH8XFRR49c=;
 b=i7VHaPyB0J1rDH0Q66ZyeeIZBsrr9Q+NtWK+3B519AJp6K9/H4+SujFER1Xe9lb2JgOK97xyqRjakJTTGFYLPfYkY97Rhf+cHSum4uTHkRhwR7lBluL2ckW7+zZSuKGQzBfDGI0S3pIzRZwWvQdsRX7gGDjkyaYTagwhbdIpq22WmhROwx+RhZ4x4uhmLYPYxUQZBY6TgnukXMpv/hMmzi1W8oSAnvZT1gPxzZPg2iDJaTZNOKIoTKaHloTCN7bPi4pz7F1gV/OHrZ8tH3RQM2GJPgGyVXzzAEdJtahGna0tO6aGnI476+1YinuqVMxDuBwqvaqvGJPWYhxyFFpgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 16:23:32 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 16:23:32 +0000
Message-ID: <69c063cd-bddd-490d-8f66-09515a61d38d@intel.com>
Date: Wed, 18 Feb 2026 21:53:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 4/5] tools/gputop.src/gputop: Enable support for
 multiple GPUs and instances
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <ashutosh.dixit@intel.com>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>
References: <20260130095318.644256-1-soham.purkait@intel.com>
 <20260130095318.644256-5-soham.purkait@intel.com>
 <0bd96bbc-fd89-4b04-a203-8784a5d9701c@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <0bd96bbc-fd89-4b04-a203-8784a5d9701c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::9) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DM4PR11MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6ac55f-cb49-4365-bf75-08de6f0a0ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWliRVo3cXBqdW93U1dkemRibVBGQVluejR1aDFRbkQ3anF4UlNZRk85aHly?=
 =?utf-8?B?V3Q0UUk4VkxCVWo1R3Zlb1NlR09XMmFXV1E5TnpwbUVsTUFhejNaWmVqTExQ?=
 =?utf-8?B?Q25jY2xTNDZ3VmpTSzQrcnJyN2xTTjZkMjJ2Wmd2ZlNId2RpVjV0WWZFNmpD?=
 =?utf-8?B?bWFBd0JiVEkwdHJpMzhTeW94YjlFNzVYUXZFRFFqWDJlbzIzSVcyN25pdXdo?=
 =?utf-8?B?TVdYT25pQUZSaWpBRnZoRWFkQzNmMFc5RjkwUno4QmNTQTl6bTM1aFdJTzR1?=
 =?utf-8?B?QUo0Z0RZWWhqUEN6OC82ZVhCQW5LY2NVckthb3J4Tjc2Uks3YlFzTHM4V2JL?=
 =?utf-8?B?czJ4cCs4OWRzVll3b3ZNSGNUR0dyNitQWUpjaFFuZmlzdVd4bzV1VUNJNkZy?=
 =?utf-8?B?ZlI5Y3VtWG1TMFBBL1JXRTlPV01aNE5BT09yRVQ4Mms3TERqemt4OGdnWmt1?=
 =?utf-8?B?TWplcWlVVVhvN1U1c2RxSWZBZ0lwVlJJWHMwU2FGbFU5Mm1LanZKNUkxejYv?=
 =?utf-8?B?anM4bEpBVjZ5by9EU1VkdVJiSWNPaUMvOGJxZDVONS9oSGVrOUE3cldJZHVV?=
 =?utf-8?B?Ukc3djZZR2QzQWkwNVQxczV5TVlQbkJLVmVtWTdxTVpoL1BVOFRwL1NBYmxM?=
 =?utf-8?B?RkFUTGFTTWxmd0lKbk5XSE1NWkpJSEtLK3YvWWh5TXpRTWlVSDdVbS9Cd05P?=
 =?utf-8?B?YWFxSUczMzZ4Nm1hZDU3Z2RycGJLMC94dGZoZVFnYkM0b2Z5OHBaSU9NczJL?=
 =?utf-8?B?VlRFZUFzNFloSWJiSWJ3ZjNCVWdXWldoc0M5NmZUT2dpUk14RjFNeGRKNWZi?=
 =?utf-8?B?THoxT3d0RWFsV0Rnbm13K2hiQXdETlNScnE2UWQxVENYMWJIOU9lcTJsYm9J?=
 =?utf-8?B?TDRLeDhtU2tUY0YyNVBrQ2x6SjN0R25wdW1rd0xzbkpkck5MUTFvYUl1ZkZQ?=
 =?utf-8?B?TGJhRUIvNi8xOXVhZm90Z2R0eHptUkJYUXRvalE4RUp6VzBaVFU3RXJacVhs?=
 =?utf-8?B?N0VoK2F6TTk4Vy9Ic2lYLzBSa3gyS0hmb0U1M1R6M1RFSEJuR2xzalBrQjJN?=
 =?utf-8?B?UkorMGwyZmw3bWtyNEhwY1JNQUZwa2h2eXI5cU0wTS96cW4zREUzczdZTklR?=
 =?utf-8?B?NCtKNkp3NEdDVUdkOTRsd3lzU3Q3N0xFSFRxc1NNdDlDcms4WFRnUVdHY1hK?=
 =?utf-8?B?RFBrWkJOMmRPajVMc2h0UzNtVFdIbkJLcmNOMXpTZ0xRTlhHQkptdXhTZkxn?=
 =?utf-8?B?cVFVRW84L2tpNlJMNTR5d0IxelZPK2x4RExtQmFNZ0NzNzE3eFJ5Q3FPSmRP?=
 =?utf-8?B?VnR5ZE1LRmloWXhZZ3NwVzFuSGlpV0FtNHZvZXBiVVpQTWUzTEkwRkdiNXN5?=
 =?utf-8?B?dTlJZU54eHcwMWRnWkVTYythUHJYcURJQThtalo4aERwRm4rWkNjYUpTZGxh?=
 =?utf-8?B?Q1NYV0VacVJuZzZNWTRNaHpxa05TWW14MGJrdVkwSGdSdGRLV2JEcUI4YlBr?=
 =?utf-8?B?SzA3VldxNTJXa0YydDlOUCtWd0w1RnczVjEzV1NWSlhsemdqTjgvNWJoVXRT?=
 =?utf-8?B?aUZrVXNZMktGNU0rU016NWF2ZjJVSnVrN1VQV1JhRkRyT3FEQi9rbUhiL0FG?=
 =?utf-8?B?WHgxWjBQQUlnSldIZzFQbVc1M2xBQnBOSkJOejJ3a28rZkE4NEJ6K01yWTJ0?=
 =?utf-8?B?cmVacTQ1L3ovdGRLaG84dFp3bUZaQ0MwOXpBS0E0YWM5ZzJwNE5wRDJYRUNo?=
 =?utf-8?B?Yi81Y2xVM3VtTWJzcjFqanpJU0NyZG80WUJnRTBwbVN6Ym5XNnRBSUxRUE90?=
 =?utf-8?B?UXAwRUVHVTQ1dDNZb1lsUHp4bWFVazlQcHlqejY3eS9XQUI5ZGlJaGNselNS?=
 =?utf-8?B?WUFFZmdmeG5jUWpZZGcyODRwbDdRVVVEL1BsKzZ4cWZZZmVvQVgva0JZNUVu?=
 =?utf-8?B?UWV3VzAzRGNiRTVwOEFNWUlvWG9RZHhFdm8waVhvNngybWdqY2JJdThIRWR6?=
 =?utf-8?B?cWNMZXRXcWJsOEZsWHE3RjI4dFIxaytRMUIzRmhDZ3BmbnN2eG0xUk5JcjNx?=
 =?utf-8?B?R2JlUWdnMUtrR0RueWZMMTZyNTVvTVBNM21tdXlxY0tsbG1sTzZFOGt1RWQr?=
 =?utf-8?Q?jN04FWZK31mfMTdptosjoOPPH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7142099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHprUllmVU10dHVMbktQUWRXMnBJcVdGZExncUtUZUZFeWs3bDVEVVczcGRz?=
 =?utf-8?B?RWs1eFI1WWUyVlRDMkkxeE5Dc1UzUVc3dExBZVhFb2dPV1hqNk5pTEFjU1U4?=
 =?utf-8?B?ak1WblNiZ3BWd3hoVmlqbS9BQ1QwdCs5VTd4cGlSTEV3dEN0cVBZMmR6VWlm?=
 =?utf-8?B?cWxwaTh4QnEvOC82TnQ5cUZMVTNGMWlSOFJ6anpscHdkYWhVR0xkVVBPWEl0?=
 =?utf-8?B?ZTR1S2FPNzFEbkFEeDc3ODNVNXVOY1pXQ2h4TWhrMnhVVnQwMUNNVDFSc0p0?=
 =?utf-8?B?REFyWU1ab0RMSERXaFFhWStJYXNCVTRKVkFQVVgzcWJaaUJnc1RrWFZSK29C?=
 =?utf-8?B?SVgvSVpwbWpmR1B0cVVSd1dWbjBvL3laT0cxS0NjbVUxaUZWM2ErNFFRZFRY?=
 =?utf-8?B?RW1UakpLbk1VN1p2SnFpWlZwQi9NR2xRbDMwNDBrWWgyRmNLUjJpWHdVOGVT?=
 =?utf-8?B?dmdTaFdBekFSQXZka21oc3J5bXFtcy9DUWtHS3l6bnpZT2QzNWNBempkbWJO?=
 =?utf-8?B?Vmxkd3ZBM01pOUs3MU5hL0YyTWora0YxZ25kWExkNVBBOXRRUXkzb1piU3lZ?=
 =?utf-8?B?VWFPVjFUcjIzM3krV2o3cmJMeXRleGdPQ05wakFWR2N5bU5qQUZiQVBhL2Fy?=
 =?utf-8?B?WndUV05SaFB6cklqSUVqbk1Oc3FGc0R4bXcrRm5YZG1vN3ZsUzVGSG81NzBB?=
 =?utf-8?B?ODdZT1FrU3BDL1hYOFFCVEloTVNSMDFLYzd1ZkZGalBLaUQ3M3VLM1FrUDBH?=
 =?utf-8?B?S2lQVFo4bis4N3VUZWdXdGp6T1hmS0ZLcFk5WGpuYWJ1K1pDZFhHT0pZa1M4?=
 =?utf-8?B?dXRSU0JUaG55R2FrZk8vek5PR3EwWUJxb3NERHJQZXJvS3VvR3hTampjZFlm?=
 =?utf-8?B?cGMrWC9LU3NKeGJPclRldFF6UEVUdWdIVlVDS2FKV0JnOWRqSThsbWJnMmtW?=
 =?utf-8?B?ZkY1aHhiZE1sK3lDWXk5UVFwOU5YYmV6aHY5UDk0dGJ5SkZ4ZnpPQWNONlZP?=
 =?utf-8?B?aXNrMTNzSDNHdXFIRDZ5cTJsYWo4ZDNtVUFHMk1vUW14SGtiZ0plOFN4MzJk?=
 =?utf-8?B?Ukp0NjFiQXNzNThZQnFKVGlpRzUrMVhHMkxDNjh0WUpFUTUydWJKSE1TZC9T?=
 =?utf-8?B?dURYbHFMelh2UVQvYTYwZWZ4UmJuTFZNWS9Ya0crQkJPVktocy95N1hYNkI4?=
 =?utf-8?B?N1BseXlMYm9YV0hmdFEyMTNrd01NWitERkV5TENwVExTSG44bFJwUDluWmcv?=
 =?utf-8?B?b2NSaFR2ODhOY0MvZ2tWQm1qL2pJRHAwOVJJZ2t6YkVXN2xqNWh4WWE4Mkt1?=
 =?utf-8?B?S09ibHQzS0c3amUzK2pKMlNobWI5T3hmZmZoZURSSlFOajNrZzBEbjR3dVI1?=
 =?utf-8?B?ZkxaY2tUN0dWSkpCc2VuZkwvMmM4M1czOUY0WlFDSEp4QkNOK09RQjBOK1Jv?=
 =?utf-8?B?ZXk1QWFnNmdhVW9saXZRT1BLNFlzMjlXeTRZNzZ6bUppMTlobTcwZGEvdkp4?=
 =?utf-8?B?VmxEWStVcnlyMkpiR0hUWllML3VRNzJsdGhWOG1VTUZsUy9rNWd2eko0S2xT?=
 =?utf-8?B?c1NZWE8ycVgwYmtyQSs5SWJ1YkdVRWZjaGx3UUFaWXdpVCttcHpDMUtXTlQx?=
 =?utf-8?B?R2QzYldKZGs5Q1g0VHk2aCthRnE4N29KcjJCS0xIRHkzTGx6L1AvSkdQeCt5?=
 =?utf-8?B?azQ3WDZsRnVZZ21Uek1jZ2lXem04RSs2VWUycVpBSDFEa0ZjQmZQZHlMTysx?=
 =?utf-8?B?YXRFR0phU0kxMTZNNW5GQXkxNHc5b2FMQVJUN1BkMVY5TVQrY0JKNEdDNGhP?=
 =?utf-8?B?R3B0K3pHTUk0OG1qRlcySDRWWnJKK1FUUVJmcjYzY1BCVEV3eitaWlZJdmg4?=
 =?utf-8?B?aTFJWVEzcUQ0b0o3aXlZS3lpMVpBNHJ0TnpSaEV5U2tseTFHZ0h6OUNGY1Ni?=
 =?utf-8?B?T3FZaThHbFZKcUIxMnIySEM4cGZmODd2SmJWaFdYdVEyalI1S2dYbnllMEhD?=
 =?utf-8?B?UlFGdGFhZHVNbHFHbElyN2J3alJ0N2d6OTNKaTUrZ04yLzNzcXRiVXJoWnN5?=
 =?utf-8?B?RnZQNXlFOEFjakFQNSs3aWw2cWh4eUJhOVhKWnZFRU5QZG1uSGNKWVVTL2xz?=
 =?utf-8?B?TGxNU3dmVUJrTjBxVlhDdHRrcUF4ODhsY1NiQ3B2NXBTWVltUlBHTmFVbkhR?=
 =?utf-8?B?Z2RvUks5MFM3ejhVWk5VOGg0ckl0MnFHUHM4dDFrdDdhWTlJZXhuNVlnRXdk?=
 =?utf-8?B?Y0UvRkd5UXRvR2dWS2VlSHhuVm8waWZCQWFDamp3VjBzdUoyZmplTFRRcG5k?=
 =?utf-8?B?V0E0eEc4OU9TOTZqdS94SEE4Y3RzTVhDUHd5OFk3RVZ5ZXhvYSsySHczaWw5?=
 =?utf-8?Q?uhYZXI2UtgXSTqA0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6ac55f-cb49-4365-bf75-08de6f0a0ead
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 16:23:32.3601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RI5SV/0QITgEl+810DCJo0Bf/KU6SP/0nHWFRx5b+kyXojEpalEPemjgHxZoKYjstc7UjOyXJYjETvpVcOihIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
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

Hi Vinay,

On 13-02-2026 04:58, Belgaumkar, Vinay wrote:
>
> On 1/30/2026 1:53 AM, Soham Purkait wrote:
>> Introduce vendor-agnostic support for handling multiple GPUs and
>> instances in gputop. Improve the tool's adaptability to various GPU
>> configurations.
>>
>> v1:
>>   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
>> v2:
>>   - Cosmetic changes. (Riana)
>>   - Avoid three level indentation. (Riana)
>> v3:
>>   - Add device filter to populate the array of cards for
>>     all supported drivers. (Zbigniew)
>> v4:
>>   - Add user message for running without root privileges. (Kamil)
>> v5:
>>   - Add support for GPU client-only busyness on unsupported
>>     drivers as a fallback mechanism. (Kamil)
>> v6:
>>   - Remove unused dependencies and headers. (Kamil)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tools/gputop.src/gputop.c    | 278 +++++++++++++++++++++++++++++------
>>   tools/gputop.src/meson.build |   2 +-
>>   tools/meson.build            |   3 +-
>>   3 files changed, 240 insertions(+), 43 deletions(-)
>>
>> diff --git a/tools/gputop.src/gputop.c b/tools/gputop.src/gputop.c
>> index f577a1750..7d4515f8f 100644
>> --- a/tools/gputop.src/gputop.c
>> +++ b/tools/gputop.src/gputop.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: MIT
>>   /*
>> - * Copyright © 2023 Intel Corporation
>> + * Copyright © 2023-2025 Intel Corporation
>>    */
>>     #include <assert.h>
>> @@ -14,66 +14,145 @@
>>   #include <math.h>
>>   #include <poll.h>
>>   #include <signal.h>
>> +#include <stdbool.h>
>>   #include <stdint.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <sys/ioctl.h>
>>   #include <sys/stat.h>
>> +#include <sys/sysmacros.h>
>>   #include <sys/types.h>
>> -#include <unistd.h>
>>   #include <termios.h>
>> -#include <sys/sysmacros.h>
>> -#include <stdbool.h>
>> +#include <unistd.h>
>>   -#include "igt_core.h"
>>   #include "igt_drm_clients.h"
>>   #include "igt_drm_fdinfo.h"
>>   #include "igt_profiling.h"
>> -#include "drmtest.h"
>> +#include "xe_gputop.h"
>> +
>> +/**
>> + * Supported Drivers
>> + *
>> + * Adhere to the following requirements when implementing support 
>> for the
>> + * new driver:
>> + * @drivers: Update drivers[] with driver string.
>> + * @sizeof_gputop_obj: Update this function as per new driver 
>> support included.
>> + * @operations: Update the respective operations of the new driver:
>> + * gputop_init,
>> + * discover_engines,
>> + * pmu_init,
>> + * pmu_sample,
>> + * print_engines,
>> + * clean_up
>> + * @per_driver_contexts: Update per_driver_contexts[] array of type 
>> "struct gputop_driver" with the
>> + * initial values.
>> + */
>> +static const char * const drivers[] = {
>> +    "xe",
>> +    /* Keep the last one as NULL */
>> +    NULL
>> +};
>> +
>> +static size_t sizeof_gputop_obj(int driver_num)
>> +{
>> +    switch (driver_num) {
>> +    case 0:
> Might be worthwhile using an enum like INTEL_XE_DRIVER instead of 
> hardcoded values.
Sure.
>> +        return sizeof(struct xe_gputop);
>> +    default:
>> +        fprintf(stderr,
>> +            "Driver number does not exist.\n");
>> +        exit(EXIT_FAILURE);
>> +    }
>> +}
>> +
>> +/**
>> + * Supported operations on driver instances. Update the ops[] array for
>> + * each individual driver specific function. Maintain the sequence 
>> as per
>> + * drivers[] array.
>> + */
>> +struct device_operations ops[] = {
>> +    {
>> +        xe_gputop_init,
>> +        xe_populate_engines,
>> +        xe_pmu_init,
>> +        xe_pmu_sample,
>> +        xe_print_engines,
>> +        xe_clean_up
>> +    }
>> +};
>> +
>> +/*
>> + * per_driver_contexts[] array of type struct gputop_driver which 
>> keeps track of the devices
>> + * and related info discovered per driver.
>> + */
>> +struct gputop_driver per_driver_contexts[] = {
> This is already per driver, no need to add that in the name? just 
> driver_context or pci_driver_context? Also, where is gputop_driver 
> struct defined? (Didn't find it in this patch set)
In my view this array is indexed by driver, keeping "per_driver_" avoids 
the confusion. gputop_driver is defined in tools/gputop/utils.h (not 
included in this patch).
>> +    {false, 0, NULL}
>> +};
>>     enum utilization_type {
>>       UTILIZATION_TYPE_ENGINE_TIME,
>>       UTILIZATION_TYPE_TOTAL_CYCLES,
>>   };
>>   -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", 
>> "▉", "█" };
>> -
>> -#define ANSI_HEADER "\033[7m"
>> -#define ANSI_RESET "\033[0m"
>> -
>> -static void n_spaces(const unsigned int n)
>> +static void gputop_clean_up(void)
>>   {
>> -    unsigned int i;
>> -
>> -    for (i = 0; i < n; i++)
>> -        putchar(' ');
>> +    for (int i = 0; drivers[i]; i++) {
>> +        ops[i].clean_up(per_driver_contexts[i].instances, 
>> per_driver_contexts[i].len);
>> +        free(per_driver_contexts[i].instances);
>> +        per_driver_contexts[i].device_present = false;
>> +        per_driver_contexts[i].len = 0;
>> +    }
>>   }
>>   -static void print_percentage_bar(double percent, int max_len)
>> +static int find_driver(struct igt_device_card *card)
> should be find_pci_driver?
Seems like "find_driver" is more appropriate. This is finding the driver 
index but not using any "pci only" condition.
>>   {
>> -    int bar_len, i, len = max_len - 1;
>> -    const int w = 8;
>> -
>> -    len -= printf("|%5.1f%% ", percent);
>> -
>> -    /* no space left for bars, do what we can */
>> -    if (len < 0)
>> -        len = 0;
>> -
>> -    bar_len = ceil(w * percent * len / 100.0);
>> -    if (bar_len > w * len)
>> -        bar_len = w * len;
>> +    for (int i = 0; drivers[i]; i++) {
>> +        if (strcmp(drivers[i], card->driver) == 0)
>> +            return i;
>> +    }
>> +    return -1;
>> +}
>>   -    for (i = bar_len; i >= w; i -= w)
>> -        printf("%s", bars[w]);
>> -    if (i)
>> -        printf("%s", bars[i]);
>> +static int populate_device_instances(const char *filter)
>> +{
>> +    struct igt_device_card *cards = NULL;
>> +    struct igt_device_card *card_inplace = NULL;
>> +    struct gputop_driver *driver_entry =  NULL;
>> +    int driver_no;
> should this be driver_num or driver_id?
Sure.
>> +    int count, final_count = 0;
>> +
>> +    count = igt_device_card_match_all(filter, &cards);
>> +    for (int j = 0; j < count; j++) {
>> +        if (strcmp(cards[j].subsystem, "pci") != 0)
>> +            continue;
>>   -    len -= (bar_len + (w - 1)) / w;
>> -    n_spaces(len);
>> +        driver_no = find_driver(&cards[j]);
>> +        if (driver_no < 0)
>> +            continue;
>>   -    putchar('|');
>> +        driver_entry = &per_driver_contexts[driver_no];
>> +        if (!driver_entry->device_present)
>> +            driver_entry->device_present = true;
> is this check only for reassignment of device_present or should it 
> include the below statements as well?
This check  sets device_present to true only once if at least one device 
for that specific driver is found.
>> +        driver_entry->len++;
>> +        driver_entry->instances = realloc(driver_entry->instances,
>> +                          driver_entry->len * 
>> sizeof_gputop_obj(driver_no));
> should this be renamed to driver_entry->engine_instances so we are 
> clear about which instances this refers to?

This instance is not exactly the engine instance. It represents a device 
of a specific driver. If there are multiple devices of a specific driver 
then there should be equal number of such instances and so the function 
is named as "populate_device_instances". It is documented where 
gputop_driver is defined.

Thanks,
Soham

>> +        if (!driver_entry->instances) {
>> +            fprintf(stderr,
>> +                "Device instance realloc failed (%s)\n",
>> +                strerror(errno));
>> +            exit(EXIT_FAILURE);
>> +        }
>
> should these be under the conditional if check above as well? Or will 
> we end up incrementing len twice and duplicate realloc? Unless this 
> refers to driver instances?
>
> Thanks,
>
> Vinay.
>
>> +        card_inplace = (struct igt_device_card *)
>> +                calloc(1, sizeof(struct igt_device_card));
>> +        memcpy(card_inplace, &cards[j], sizeof(struct 
>> igt_device_card));
>> +        ops[driver_no].gputop_init(driver_entry->instances, 
>> (driver_entry->len - 1),
>> +            card_inplace);
>> +        final_count++;
>> +    }
>> +    if (count)
>> +        free(cards);
>> +    return final_count;
>>   }
>>     static int
>> @@ -335,6 +414,28 @@ struct gputop_args {
>>       unsigned long delay_usec;
>>   };
>>   +static void countdown(const char *msg, const int start_sec)
>> +{
>> +    struct pollfd pfd;
>> +    int i, ret;
>> +    char ch;
>> +
>> +    for (i = start_sec; i > 0; i--) {
>> +        printf("\r%s%d... second(s)", msg, i);
>> +        fflush(stdout);
>> +
>> +        pfd.fd = STDIN_FILENO;
>> +        pfd.events = POLLIN;
>> +
>> +        ret = poll(&pfd, 1, 1000);
>> +        if (ret > 0 && (pfd.revents & POLLIN)) {
>> +            while ((ch = getchar()) != '\n' && ch != EOF)
>> +                continue;
>> +            return;
>> +        }
>> +    }
>> +}
>> +
>>   static void help(char *full_path)
>>   {
>>       const char *short_program_name = strrchr(full_path, '/');
>> @@ -349,7 +450,32 @@ static void help(char *full_path)
>>              "Options:\n"
>>              "\t-h, --help                show this help\n"
>>              "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS 
>> [.TENTHS]\n"
>> -           "\t-n, --iterations =NUMBER  number of executions\n"
>> +           "\t-n, --iterations =NUMBER  number of executions\n\n"
>> +           "Running without root:\n"
>> +           "\tAs a non-root user, CAP_PERFMON or perf_event_paranoid 
>> is required to\n"
>> +           "\taccess engine busyness\n"
>> +           "\t" ANSI_HEADER "Steps to run without root (using 
>> CAP_PERFMON):"
>> +        ANSI_RESET "\n"
>> +           "\tcd /path/to/igt-gpu-tools/\n"
>> +           "\tsudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop\n"
>> +           "\tsudo sh -c \"echo $(pwd)/build/lib > 
>> /etc/ld.so.conf.d/lib-igt.conf\"\n"
>> +           "\tsudo ldconfig\n"
>> +           "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET 
>> "\n"
>> +           "\tsudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop\n"
>> +           "\tsudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
>> +           "\tsudo ldconfig\n"
>> +           "\n"
>> +           "\t" ANSI_HEADER "Steps to run without root (using 
>> perf_event_paranoid):"
>> +           ANSI_RESET "\n"
>> +           "\t\033[32m# Save current perf_event_paranoid 
>> value\033[0m\n"
>> +           "\torig_val=$(sysctl -n kernel.perf_event_paranoid)\n"
>> +           "\tsudo sysctl -w kernel.perf_event_paranoid=-1\n"
>> +           "\t" ANSI_HEADER "Steps to revert once done:" ANSI_RESET 
>> "\n"
>> +           "\t\033[32m# Restore original value\033[0m\n"
>> +           "\tsudo sysctl -w kernel.perf_event_paranoid=$orig_val\n\n"
>> +           "\tFor details, see 'Perf events and tool security':\n"
>> +           "\thttps://www.kernel.org/doc/html/"
>> +           "latest/admin-guide/perf-security.html\n\n"
>>              , short_program_name);
>>   }
>>   @@ -417,9 +543,12 @@ int main(int argc, char **argv)
>>       struct igt_profiled_device *profiled_devices = NULL;
>>       struct igt_drm_clients *clients = NULL;
>>       int con_w = -1, con_h = -1;
>> +    bool is_root;
>>       int ret;
>>       long n;
>>   +    is_root = (geteuid() == 0);
>> +
>>       ret = parse_args(argc, argv, &args);
>>       if (ret < 0)
>>           return EXIT_FAILURE;
>> @@ -428,6 +557,53 @@ int main(int argc, char **argv)
>>         n = args.n_iter;
>>       period_us = args.delay_usec;
>> +    populate_device_instances("device:subsystem=pci,card=all");
>> +
>> +    for (int i = 0; drivers[i]; i++) {
>> +        if (!per_driver_contexts[i].device_present)
>> +            continue;
>> +
>> +        for (int j = 0; j < per_driver_contexts[i].len; j++) {
>> +            if 
>> (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
>> +                fprintf(stderr,
>> +                    "Failed to initialize engines! (%s)\n",
>> +                    strerror(errno));
>> +                    gputop_clean_up();
>> +                return EXIT_FAILURE;
>> +            }
>> +            ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
>> +
>> +            if (ret) {
>> +                if (errno == EACCES && !is_root) {
>> +                    fprintf(stderr,
>> +                        "\n"
>> +                        "Running without root privileges.\n"
>> +                        "Engine busyness may not be available "
>> +                        "without root privileges.\n"
>> +                        "See \"--help\" to enable engine "
>> +                        "busyness without root.\n\n");
>> +                    igt_devices_free();
>> +                    gputop_clean_up();
>> +                    countdown("Resuming with only gpu client "
>> +                          "busyness in ", 5);
>> +                } else {
>> +                    fprintf(stderr,
>> +                        "Failed to initialize PMU! (%s)\n",
>> +                        strerror(errno));
>> +                    igt_devices_free();
>> +                    gputop_clean_up();
>> +                    return EXIT_FAILURE;
>> +                }
>> +            }
>> +        }
>> +    }
>> +
>> +    for (int i = 0; drivers[i]; i++) {
>> +        for (int j = 0;
>> +             per_driver_contexts[i].device_present && j < 
>> per_driver_contexts[i].len;
>> +             j++)
>> +            ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +    }
>>         clients = igt_drm_clients_init(NULL);
>>       if (!clients)
>> @@ -449,22 +625,42 @@ int main(int argc, char **argv)
>>         while ((n != 0) && !stop_top) {
>>           struct igt_drm_client *c, *prevc = NULL;
>> -        int i, engine_w = 0, lines = 0;
>> +        int k, engine_w = 0, lines = 0;
>>             igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>> +
>> +        for (int i = 0; drivers[i]; i++) {
>> +            for (int j = 0;
>> +                 per_driver_contexts[i].device_present &&
>> +                 j < per_driver_contexts[i].len;
>> +                 j++)
>> + ops[i].pmu_sample(per_driver_contexts[i].instances, j);
>> +        }
>> +
>>           igt_drm_clients_sort(clients, client_cmp);
>>             update_console_size(&con_w, &con_h);
>>           clrscr();
>>   +        for (int i = 0; drivers[i]; i++) {
>> +            for (int j = 0;
>> +                 per_driver_contexts[i].device_present &&
>> +                 j < per_driver_contexts[i].len;
>> +                 j++) {
>> +                lines = 
>> ops[i].print_engines(per_driver_contexts[i].instances, j,
>> +                             lines, con_w, con_h);
>> +            }
>> +        }
>> +
>>           if (!clients->num_clients) {
>> -            const char *msg = " (No GPU clients yet. Start workload 
>> to see stats)";
>> +            const char *msg;
>>   +            msg = " (No GPU clients yet. Start workload to see 
>> stats)";
>>               printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>>                      (int)(con_w - strlen(msg) - 1), msg);
>>           }
>>   -        igt_for_each_drm_client(clients, c, i) {
>> +        igt_for_each_drm_client(clients, c, k) {
>>               assert(c->status != IGT_DRM_CLIENT_PROBE);
>>               if (c->status != IGT_DRM_CLIENT_ALIVE)
>>                   break; /* Active clients are first in the array. */
>> @@ -488,11 +684,11 @@ int main(int argc, char **argv)
>>       }
>>         igt_drm_clients_free(clients);
>> +    gputop_clean_up();
>>         if (profiled_devices != NULL) {
>>           igt_devices_configure_profiling(profiled_devices, false);
>>           igt_devices_free_profiling(profiled_devices);
>>       }
>> -
>>       return 0;
>>   }
>> diff --git a/tools/gputop.src/meson.build b/tools/gputop.src/meson.build
>> index ec39f4c7a..e95657fca 100644
>> --- a/tools/gputop.src/meson.build
>> +++ b/tools/gputop.src/meson.build
>> @@ -1 +1 @@
>> -gputop_src = files('gputop.c')
>> +gputop_src = files('gputop.c', 'utils.c', 'xe_gputop.c')
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 521607a4c..caca57d0e 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -123,4 +123,5 @@ subdir('gputop.src')
>>   executable('gputop', sources : gputop_src,
>>          install : true,
>>          install_rpath : bindir_rpathdir,
>> -       dependencies : 
>> [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],)
>> +       dependencies : 
>> [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,
>> +                  lib_igt_drm_fdinfo,lib_igt_profiling,math],)
