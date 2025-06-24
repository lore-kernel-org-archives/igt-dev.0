Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974A6C71157
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 04:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C10C10E009;
	Tue, 24 Jun 2025 04:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQq/NB6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E58E10E009
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 04:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750739988; x=1782275988;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=n/TrCPTg6NUV4YHAJbB4zjNYbi993FGBo3UP7vEV83s=;
 b=ZQq/NB6HUr2k1xjQnyDVf+Ua4vDvF55zI0fkxN7PUaT6H0/GGW3F4+NB
 rDZJVkqnuzE4KmEYy2BI7Cj/SOI7aGy4Imbwl/tItghg7fedm6voXqrUX
 giLrbX/wwJOEh6/vh9Bdg/wd0k7Oj5NAf7LF7dP7FcGH1+iNrRBw0d6OT
 5pg/6D/qH86J2PcIKfr2GqJ/pFkurdwWrMWKGQt4ns933Oeeo2FKMFRdN
 Cyu7FVNugysUgsVlUMSrXqEYWUguyu2tkq8P04o8u0nMKoRnbS1PzkrGE
 qvY6h8DII+8Eo0odGXneXNzayPeuY6Z8r4CGni1tHFtfzvGJVaukwLlqM A==;
X-CSE-ConnectionGUID: t3OtZm1rSTiRCLKjQtoM4Q==
X-CSE-MsgGUID: oaNyM2asTGK4Z4YFYU/uyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52936164"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208,217";a="52936164"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:39:47 -0700
X-CSE-ConnectionGUID: 3iwbfrcCTi6PhJmg0e6qVw==
X-CSE-MsgGUID: 2TZuWCSwQmmi9LjDWq13KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
 d="scan'208,217";a="151561762"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 21:39:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:39:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 21:39:45 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 21:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KABx8d+LIF8mFcfPhuqCHNcCmzYqEjLHuvIfqjGfAcp5dFI8Ipsk13CYzmmyFW06z6X9KoamV9O8fmU2QsQXXFsF9LReOfE9y5QsMMswYD21auQrPxuTjRHUXsIlHTFbvHa+zJvfyhVO6mwtdBRLnJ+BIlb8HKJCCXN4xiDGtqoln5oNlWskttvdUVI46BF2yxIv3r6PiNN/jasLtA83JL7RV/NmFSzix0sSrqHbIxgNjq0h6DAU04whqu2uyJe0drG+nhk66qLd4WhNDqH2t3CExsw61JOfNIzHkXmJI6uDfuTkEqExYzs1WvZOlOK/IN+hFxdNa7ynvpOSpfiPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5E3+cQIO2WaV2SUxLSC2fX8GnZ/hjOG78Hs/a2wxOU=;
 b=ulFcmOexGgNYKHa99IDgAs0UjLFuy7IJE0e2f1cy+H059Ctaj71NLhN95RKGTPnPDJGwsgGl+mqkDwjyW5A7ZqLufJxmvjE0fm68T5hIPuIhMc+7ijX7nbf8uW7lo/5hDnjrSGnQZVaXU9FDCVv0mcNuY7zKOzdbutuWAfdyYGH85xleSdWvHgJaBqTUkzBJ9irZAln0Wms3RDwIz9WaTqJr/qkl/au3qbLicVJnQBFjSIEV5KsvW3wgSXoZpnbhfqLQ+d1nl9lRjihyFw+OL1MlL9nPdfbjx20LeygkbU1kbGpYI+pXgbEx1J3CO+zlxFxDn6EAw3C5MTCIIhGzag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 04:39:23 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 04:39:23 +0000
Content-Type: multipart/alternative;
 boundary="------------juNNWmQyfpwk298SF5n3G9ea"
Message-ID: <619f8d57-a651-49b7-a350-2f0a7f329be7@intel.com>
Date: Tue, 24 Jun 2025 10:09:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_writeback: Fix kms_writeback for VKMS
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Alex Hung
 <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>,
 <harry.wentland@amd.com>, Swati Sharma <swati2.sharma@intel.com>
References: <20250618230105.1721658-1-alex.hung@amd.com>
 <20250623095502.5jeyyxkpfczucd2n@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250623095502.5jeyyxkpfczucd2n@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MAXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 3515d21a-ec80-46b9-9662-08ddb2d91785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDBRbWRLT0RXUW0wdDlTTlRkT1h6SXpJK0pkUVFJQy9vK1N1SmVLZ1cwcVU3?=
 =?utf-8?B?VlhkeDMrM2xSdSsvN2xWQzhScXpSR2kvQVV4MzE0RkxCd0VqS2hiSFFGU1RV?=
 =?utf-8?B?YXh6WE1tYTZUbVRpMHgxcW15N1p4UEN3bFVrMnRGVG8zRUh2WE5XVFA3OGIr?=
 =?utf-8?B?N2U4emx1dXJQb3E4TWJUbXl3MkpibEY4WUYyeENPTG1iUGM5NXBRNnZlUW5V?=
 =?utf-8?B?VEpZMTFkZFpZUmVqWUhSWWRFbkluUFF0S0tVM2oyQ2UxOGRoRU1lUzN6bHdu?=
 =?utf-8?B?aHhvaWVacTI2b21tdkhGc0lsbkJrc1lKdzNwbnc5QXlRbktOaGxibHBuOXdk?=
 =?utf-8?B?UXFzbGlBbFAwMnV2bitsaU1LRFZGenNuZHdLS1NiVnR0TEVydlQ5RldsL1Br?=
 =?utf-8?B?aDl5THhBWHFBbDlURDRRbjF0Y3VEYXZNUVhuSmRkclZPQ1FVVnpvYmlTOGpP?=
 =?utf-8?B?YUxJWG1wUXJkQ28wbjVXOEV0K0NZd01HN3dHU3NuWE43eEtpcmc1VU9PSUlm?=
 =?utf-8?B?ajkrbE94VlRVZGFBbHcrZjNFTFlnSEltd0FRelJqa1MyencyMFRKQzdlTkVs?=
 =?utf-8?B?MXFFREVkWXI3TXdSVUxJWWxBTnZKYWQvMmcvSWF6cjVhQjhXQzNqSVRYbXc0?=
 =?utf-8?B?WTVBVkxMVXZudUdUUzJhcXVJRTJGUElvdDM3YjFWZHZSdFQ5MEQ5bWdZdUV2?=
 =?utf-8?B?Tmd4RGgrYlBUcWhwR1pZdnRDcjhvdkpnYTd4cmdpMFhkaXBuYyt5Wktram4w?=
 =?utf-8?B?Q0RFYlNpc2FwVkV2ZmZGT1VtN3cyZkJaeU8vNXNpSVN3b01YeFZMeWxTMXc5?=
 =?utf-8?B?NkR0RUNBNTROTE1JUEdKaGt1blR2OW9tRlBrcXMxRFY5VE4vWjBwa1BhekpZ?=
 =?utf-8?B?RG5UcTJzSVBFaldmTTQxSlhPK2cwYWhZaHEyZHlaOTVUc3hwYjNjOHFVNWpD?=
 =?utf-8?B?NjlTNkVtS3I1d055ejQzK1YvcFV2OUlsT2NxcXJSalhHMFR0SEFJdnNpM1Ju?=
 =?utf-8?B?dDdsbjcrQUN1TnRnR3VrMEhiUThHdTViWGV0c0RQYnVVSk91cWhEbGZNckFQ?=
 =?utf-8?B?cklxMkxQZnRNN0x5UkdXa1JxcXdZRG9Ja0dIT0w5SkFVSGE2NjlGRGN0R25W?=
 =?utf-8?B?ek5aeW1BK3Rtc1NJVHVBYk52Uml2MHBOQmRhWXBFdWNhUkc0R2YxNkYvMzRk?=
 =?utf-8?B?WUt5M0VpTVZmVkx1VjBZRnhrWjk0bDlIdDFlYVd3eE1nOFhLVlllQWd3MHgw?=
 =?utf-8?B?ZkVsSVVtNDYvZGRQUG43VnZGcmlTOE1VekpNUHkzbXRuRGp4Y3RObjlMbmo2?=
 =?utf-8?B?dGtpbjhibmZLVklqWTNVQnV5MmtYM0hIVUxsN1l3SnVUR0hScDgrQzZnN0JP?=
 =?utf-8?B?Vzg4ekU0WjREZTBVZUFmZ09KbHZnMGpRSmFvZzZrK1NzalJkSnM2M2VOTVNB?=
 =?utf-8?B?U05HS29hUENPTXZBYlB4REprOFdpYXN3MkhBUE90Kzc0d1VKbFZQd29LVzhZ?=
 =?utf-8?B?anViU1ZVbm9TRFJPYmYzSXdWNURNRys3bnY3V2tUd2VrZWx6cHZPOGxOVUV3?=
 =?utf-8?B?QXJWY0tjbUVlNGdrMU9rNFNxVWdTWGsxalJQKzVBK1AvT0JhR2xOSlpMWk5H?=
 =?utf-8?B?bnlYVm9qM09LbGU0cm9SeERvSmdJSXN1Zmh4OG9nazVqVjJ0eUR5NFczWWhY?=
 =?utf-8?B?Z3J4MHF5OGlYS0JoK1JZZkRPcFdTQVRUbUk4U1JidlNPcWtXTzNqL2JqYTFk?=
 =?utf-8?B?M0FoOXp5d242UzhkL1VsdGhwTytBVTFvaDNLd1llNlVaN3p2TUNBWCtBTmtP?=
 =?utf-8?B?c0IwZUkranZZYTAreEdlcytEc3JYaDBNQ28xM0ZoWmxYdWNmb3EraitVblJZ?=
 =?utf-8?B?Ry8yYXVIQjhGNGkrT2pvWHlDQU0rVi9Td3c3RGZHQkxaZXlobmQ1M3NpZGs2?=
 =?utf-8?Q?Jg50x2Or9Dk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkdLY0VkK052bnFhaU9ibzkwK0tlWmZ4QUVMYWJqNTZFaEFnb0ErQU84aVcy?=
 =?utf-8?B?YlgzaGtReTRoSmRiQ2RzUnhJVWp4ejhVS1dTVEFMY0FkQ28yZ2doanorWHY0?=
 =?utf-8?B?bTdiN2pQa3BteE5GbVl0SUEyZjFWZnZZZGpFb096NnRRTUpKYUhxNzdBTWUy?=
 =?utf-8?B?NFcvcnhMdm9hSVFsS2VQdDZ1VTMyR3R6MXFFUGU2UllZdi9nYzBiRXdVUXdy?=
 =?utf-8?B?M0dLTllXc3NTL1dyWGJHRXVUVU5obVI5ZjRaVVlhT0pySFZoWCtiMjFoSUJq?=
 =?utf-8?B?QjIrdU5ySGlTTjVnODB3bW5kK296cS9LSElaUlhySE13RnBjOXVQdFA5b05p?=
 =?utf-8?B?c2sxRmFWV2lJc0JWT3FHKytUdVJmOWtVWDRwS0VmeTZ2bWNKYjk0MXZFM2E1?=
 =?utf-8?B?dkZjWlJLeExwV0lQbXNnaDlvZ09sQm01SXlCRnR4Si9JSHRuSFlvallKOE9O?=
 =?utf-8?B?YkpSdG0ycmltdFlNTFpxTDRDdFRzVE9nOStvNHFPSHhmbVJ4b2h6Tkw2U1hL?=
 =?utf-8?B?V254MzVvNTEzTjNBclZiVWJmbkV4WTgwZ0x2M1RmZ3NCY0tKdXdxcFFIY0FH?=
 =?utf-8?B?dDBTcS9JeVd3MGorMmdNcFUvaVhuWHNJQ2V2OUdEV0tVbWNRdlUvSzk5VW9Z?=
 =?utf-8?B?K2FPZ095d3lOK2ZJQTFwRWh6MlViRHkvL2gyVmdnak1GVDFGV0l0bjUweGE0?=
 =?utf-8?B?dis1WnBJYmtJTE5PemV4L2g0aTNMejB6V2dGMkxuY240RjkzVEkxeXlqYkVW?=
 =?utf-8?B?NHlha1cyOVRNdzMzVCtJZFBmUjhweWQ1ck1BK2lydHQ1dDdhY1dFTks3YzVG?=
 =?utf-8?B?TTVhQldZUkhWZmlHWWt4bTVkN0ErN3NnT21KNGR6cGkyZFM3aHRwN2p5SWN4?=
 =?utf-8?B?dG5aRmxsZmhvTXZLQXRQN3lDemZlSWh6ekxjeWFEVko4Y0N0OHpzS2tpa09l?=
 =?utf-8?B?V1pZR0xIMUZKUjdlbVFRNHFJNnhHaXY4a3VxQmtWenFSc1h3MkNoYTBnT2Fz?=
 =?utf-8?B?QTViNWQ2M0VObXN5bUZiOW1JeERQcWJNUTBFb3NKdmJmbEs0YWtscXNEVjY1?=
 =?utf-8?B?eTNhRmJzRW82NVBzYW41NElFRCtFTFAyQXBuNXczY3hSSTAvWHdOVWZHbHJB?=
 =?utf-8?B?NU5WUm5GcTBlTEFtelV0SFdZakdZQ1VXWDh1VEVxMytiL1Npb0tRUkVCY2pw?=
 =?utf-8?B?L01ibFFPdEFuc2FvWEViKzhpS01WalNVWDIySGFnR09mdE1PaFpDZ0hXcjJq?=
 =?utf-8?B?clI1emc2MzduUU5LeDhwZHJpN3M1RGFGNlgzaGlvUTh0bU8xMjRsOUdHWWFX?=
 =?utf-8?B?QnJ1MVN6SDA2S0hPQ3lqU2x4VHlFWVVCcmVLSUc4OExQQWpqdjB5WnR4WDJ2?=
 =?utf-8?B?a3oybzlRNFoxNmpwbFdvWThGdGdrU29NcVA2aHo0Y2lwbkVvMXlLajhLWnlR?=
 =?utf-8?B?RlRGcmxJWXpMTER3dEJrblUxMVNZRXM4RnpEVEs3cUlORDhMdm1QRGlGak5W?=
 =?utf-8?B?MEYrL0ZiaTBFYlVyRG10amhBK0FOUTF6TXg4Z292OVZMa1NvVGE5dHQvbTg5?=
 =?utf-8?B?UlBnSmdGN3NEUE5JcCtrMExjRVBWMk0yb0l2MWpmaS9kRnlPWVk4Sm5lSkl6?=
 =?utf-8?B?T1IyanZCVUN3NXI0ZzVrVkp1cGZ4NlF0NWtvS25OeUpPZkhxUVJteDJONHlJ?=
 =?utf-8?B?aHkwejdrUENLdE41YVFmM2pPaDhacmNiQ1Awa1lOamxIOFVJczlaR0FrSmdR?=
 =?utf-8?B?OU8yeU9zem1KMC9OVVc3VWI3b0p3VGxkTnhzc0JObnBMdFg1b3JGdWk4K2hL?=
 =?utf-8?B?UWk1WXFGN1RjWUlOMjFKZm51d1F2QVB6alJJRDQ5aFFoL0dRa2ZncGh4cURz?=
 =?utf-8?B?NmVWYkpYb1ZJVVpaVy9xaTFMWGtJMDRBWEpnazAzenJNNlYrM0U2RG1EV2hz?=
 =?utf-8?B?anMweTdZU1R6K1VhUXl0eVRQQ0VQR3MrMnVJcitxSUt6SU5ubGJDNnd2Wm83?=
 =?utf-8?B?SDBsZkRPWjl4ZFM4MmhmZ3NmWDNwdzhCaytkTjY2ZkRaVmI1QkVwQmd6NXpz?=
 =?utf-8?B?ZFg3MzlyV2owVnEwWkYwelowbytCSFFGZW5uTEFkbVNuV2daNmhQWjhGNDN2?=
 =?utf-8?Q?voZ2yAt0K5OE9vP/NhrkDkqfk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3515d21a-ec80-46b9-9662-08ddb2d91785
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 04:39:23.2285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEANmN3+sDjCYOyaJQnnGbQRuZfkvKy1L00IdnSNuai8UYgVnlBfGMWk7Y7v1N4gzP6uWurInCXmJTIQnXbcgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
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

--------------juNNWmQyfpwk298SF5n3G9ea
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

On 6/23/2025 3:25 PM, Kamil Konieczny wrote:
> Hi Alex,
> On 2025-06-18 at 17:01:05 -0600, Alex Hung wrote:
>> From: Harry Wentland<harry.wentland@amd.com>
>>
>> VKMS doesn't like us to add buffers with unknown fourcc
>> type. Other drivers might behave similarly. Make sure
>> we avoid creating 10bpc buffers if they are not supported.
>>
>> Signed-off-by: Alex Hung<alex.hung@amd.com>
>> Signed-off-by: Harry Wentland<harry.wentland@amd.com>
>> ---
>>   tests/kms_writeback.c | 19 ++++++++++++-------
>>   1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
>> index d075cc5b6..20c3a32c2 100644
>> --- a/tests/kms_writeback.c
>> +++ b/tests/kms_writeback.c
>> @@ -112,6 +112,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>>   	height = override_mode.vdisplay;
>>   
>>   	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
>> +		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
>> +			continue;
>>   
>>   		ret = igt_create_fb(display->drm_fd, width, height,
>>   				    fourcc[i], modifier, &input_fb);
>> @@ -121,7 +125,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>>   				    fourcc[i], modifier, &output_fb);
>>   		igt_assert_lte(0, ret);
>>   
>> -		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>>   		igt_plane_set_fb(plane, &input_fb);
>>   		igt_output_set_writeback_fb(output, &output_fb);
>>   
>> @@ -571,12 +574,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>>   				      &input_fb);
>>   		igt_assert(fb_id >= 0);
>>   
>> -		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
>> -				      mode.vdisplay,
>> -				      DRM_FORMAT_XRGB2101010,
>> -				      DRM_FORMAT_MOD_LINEAR,
>> -				      &input_fb_10bit);
>> -		igt_assert(fb_id >= 0);
>> +		if (igt_plane_has_format_mod(plane, DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR)) {
> First change looks good but I am not sure about this one,
> Karthik or Swati could you help here?

The change itself looks good as standalone update, but one thought I've 
is if we could check using the 'supported_colors' variable here, similar 
to how it's used in the XRGB2101010 subtests?

Regards,
Karthik.B.S
>
> Adding to cc:
> Cc: Karthik B S<karthik.b.s@intel.com>
> Cc: Swati Sharma<swati2.sharma@intel.com>
>
> Regards,
> Kamil
>
>> +			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
>> +					      mode.vdisplay,
>> +					      DRM_FORMAT_XRGB2101010,
>> +					      DRM_FORMAT_MOD_LINEAR,
>> +					      &input_fb_10bit);
>> +			igt_assert(fb_id >= 0);
>> +		}
>>   
>>   		igt_plane_set_fb(plane, &input_fb);
>>   
>> -- 
>> 2.43.0
>>
--------------juNNWmQyfpwk298SF5n3G9ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Alex,</p>
    <div class="moz-cite-prefix">On 6/23/2025 3:25 PM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250623095502.5jeyyxkpfczucd2n@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Alex,
On 2025-06-18 at 17:01:05 -0600, Alex Hung wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Harry Wentland <a class="moz-txt-link-rfc2396E" href="mailto:harry.wentland@amd.com">&lt;harry.wentland@amd.com&gt;</a>

VKMS doesn't like us to add buffers with unknown fourcc
type. Other drivers might behave similarly. Make sure
we avoid creating 10bpc buffers if they are not supported.

Signed-off-by: Alex Hung <a class="moz-txt-link-rfc2396E" href="mailto:alex.hung@amd.com">&lt;alex.hung@amd.com&gt;</a>
Signed-off-by: Harry Wentland <a class="moz-txt-link-rfc2396E" href="mailto:harry.wentland@amd.com">&lt;harry.wentland@amd.com&gt;</a>
---
 tests/kms_writeback.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index d075cc5b6..20c3a32c2 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -112,6 +112,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	height = override_mode.vdisplay;
 
 	for (i = 0; i &lt; sizeof(fourcc) / sizeof(uint32_t); i++) {
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
+			continue;
 
 		ret = igt_create_fb(display-&gt;drm_fd, width, height,
 				    fourcc[i], modifier, &amp;input_fb);
@@ -121,7 +125,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    fourcc[i], modifier, &amp;output_fb);
 		igt_assert_lte(0, ret);
 
-		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(plane, &amp;input_fb);
 		igt_output_set_writeback_fb(output, &amp;output_fb);
 
@@ -571,12 +574,14 @@ igt_main_args(&quot;b:c:f:dl&quot;, long_options, help_str, opt_handler, NULL)
 				      &amp;input_fb);
 		igt_assert(fb_id &gt;= 0);
 
-		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
-				      mode.vdisplay,
-				      DRM_FORMAT_XRGB2101010,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &amp;input_fb_10bit);
-		igt_assert(fb_id &gt;= 0);
+		if (igt_plane_has_format_mod(plane, DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR)) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
First change looks good but I am not sure about this one,
Karthik or Swati could you help here?</pre>
    </blockquote>
    <p>The change itself looks good as standalone update, but one
      thought I've is if we could check using the 'supported_colors'
      variable here, similar to how it's used in the&nbsp;<span style="white-space: pre-wrap">XRGB2101010 subtests?</span></p>
    <span style="white-space: pre-wrap">Regards,</span><br>
    <span style="white-space: pre-wrap">Karthik.B.S</span>
    <blockquote type="cite" cite="mid:20250623095502.5jeyyxkpfczucd2n@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Adding to cc:
Cc: Karthik B S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a>
Cc: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
+					      mode.vdisplay,
+					      DRM_FORMAT_XRGB2101010,
+					      DRM_FORMAT_MOD_LINEAR,
+					      &amp;input_fb_10bit);
+			igt_assert(fb_id &gt;= 0);
+		}
 
 		igt_plane_set_fb(plane, &amp;input_fb);
 
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------juNNWmQyfpwk298SF5n3G9ea--
