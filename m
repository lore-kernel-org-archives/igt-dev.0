Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD7DCCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 11:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F2610E704;
	Wed,  5 Nov 2025 11:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVJRcWOJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87C210E704
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762343179; x=1793879179;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=UQtBQREn1k35S6fKfFRhMrdtpA4fzfcobKfOapCYbAs=;
 b=mVJRcWOJ3QpeP2TpsqlmJp9pCE2fK7LmMN3hsL2J5oYfOpUwsWIsdVOg
 BrOcjxJUSnilfmXD8F1eu1Fo1+is/kuxFUUG4Hz5WLX8CoNne65uDHluc
 JyMm4D5ru0hu/lMAhHtQxdtMlT+Z2KJIhK/Ps5mzYNnwGSCFfb8XQfVjW
 MpZOP6jzoyoQke3KSI+KzC5BubwyBf+2B2SvBEGk9g1sqGAIlBqpWfz+U
 H0obaO26LAsoci7OYo1dRBLYmZmB0Y98YL6n9Q7WFumFV8p54omF1w/oz
 ws9MBUtbDtfqaxhat/S+Y6Gcec1MEslZB03Nou8KcQw6gIUN07j4rpVaC A==;
X-CSE-ConnectionGUID: ZGZuaHigQl+SmbbBFQxp8A==
X-CSE-MsgGUID: oIfleUUISeWKa+WAQfY0Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75903974"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208,217";a="75903974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:46:19 -0800
X-CSE-ConnectionGUID: Jq40Wy+OQlSlIV6Qj+qmoA==
X-CSE-MsgGUID: O6chfrcoRfuENuzpcUgqrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
 d="scan'208,217";a="187105525"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 03:46:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 03:46:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 03:46:17 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 03:46:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3S0LVsuSYM4evGFx6SLQNKTWb9BQ5SF7X7TIfhBxziMg0YZ8eWYywGrnYadzft1YCopD2XFJmU3eKSVVpRwWdA+2v8nePFHP8/RT8bCplHTzUqLIhAfhqz/qQE+ZYYg/tg4bKqVb5wIM0366TvonoxGy7H+sXS1EbsIbQMt68xKhae47qCYQvxdycnLC28y+3MHECgyI7VzgBcz8W3Bc0NQBTR8Wf4d0RR5LfdH4gExxmYWxu4TcMIxDzxzD0jEbDrxWT5pqXKpCxp9ZOzwlSAGpW9YHi+9VsOzssVcwo+I9BE1o5hjnBOOw6AEmMfmXGbWVhNfSI2XGwkaWBC3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKyuympgYiVslT8uo8mtVaZ17sEwTrWqgVbilcBcmJQ=;
 b=L5AuenjaIItE8SuO6CA5GHcrtNJp2ZJW3jtEW43nNeSu2I3UxKSEPegKAmwzKwCgyphpnyxQ3x3rBjrQMdEt04JqnC6z9amSjCDf40W1KSNatyHARJcKBeFDIMuzqThJ1nNAGr6Ar/scsp+hpYemRqmr6vpLHFlW+V6tCCzF9XFe8O00v0Tz9d+wmqeHQj9umxkhnNR7QpoIRh/bQzXpU8SI8wW+XTWgHxN72AY34VfMf7zyjy/f/p/gF5w3ChJ8jFqjKcWtWQhWHeeY45lhXma98UrPrsVIhgAGlJbWle7xd0x/cxrlJ9l1U0GmmL2UignEaYxOi1U8dFiAtGx9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 11:46:14 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 11:46:14 +0000
Content-Type: multipart/alternative;
 boundary="------------qtsZxq8TJ0qfqeS0DK6Z8HIS"
Message-ID: <12c0cdbb-be76-4a55-852e-1b993f3a22e2@intel.com>
Date: Wed, 5 Nov 2025 17:16:09 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?xe=5Fsurvivability=3A_Add_xe=5Fsurvivability_test_=28rev12=29?=
To: <igt-dev@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>
References: <20251104095221.694286-4-sk.anirban@intel.com>
 <176229555320.17802.13400962993084440102@10055242dc62>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <176229555320.17802.13400962993084440102@10055242dc62>
X-ClientProxiedBy: MA5P287CA0051.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::16) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb99d12-8c12-4511-7f90-08de1c60ec4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vy95VzJlWCttMnlqeFczNVdBQUQySUlvTXp3YkFjSkNpWDdJQ054UythM0xY?=
 =?utf-8?B?OFdaazRKSXRDVVRBT0ttdkgybTJYTG1kN0lJOFJJQms2eEdZNEpJeXNlTUlj?=
 =?utf-8?B?T1lWaUJGa1dkMVVPR2NyV2hsbkpWU2t0TkpXZVdFTTN6SFBPRlJ0QVFpRFdy?=
 =?utf-8?B?TG1Oa01EWUJjK2pzWHNyM2JQenFnY3VzeWVnZjR4WnNSUkhQY1d2ZWxPNnVQ?=
 =?utf-8?B?UXhYbE05SUhLdFh0VWR3Y1FIVlBnd0l5ZitIZUtGcHhPSHVKalpOQnBVUGM5?=
 =?utf-8?B?UEN2UU8ybEl5dlJzTm9TTUdyZjZMK2V3OXNycWVJaHlVUms3ZTU4SXVUSEJt?=
 =?utf-8?B?M1Z6Y2UyakhmM0twUEQveUlHbmlyQ2xUVVZZZE9zbTBYK2ZOL1h0citPNzkr?=
 =?utf-8?B?MWNGYTdHZlRMZ2pFYi83d00ramdDS29nb3A2aWNDaHBnYklmNmIreG16a1VP?=
 =?utf-8?B?VCtJeHNENExyN3paSm4wR29jNkF0M2pXSUpCMmdlajY0RlBLbWliR2g2RXZO?=
 =?utf-8?B?c1ZkRkdEWnd6QTVsMGN0SjNnMXp2TGhXOFdUU25xMU80OGdZb3pFWHFLU0Jx?=
 =?utf-8?B?bmJYTEFQeit3RXp1RFVIQyt4QWZwajhYL0RoS2JWajNwbW9hdlJQUXpEUkl0?=
 =?utf-8?B?LzdLWTdka0lvWHdZLy8wZnpaTE1uRVJWYUo5Mk5TbW5qYkJmTnpseHV1T1dO?=
 =?utf-8?B?ZVBwYXlKRVE1WnhiaHQzL3hjcm9ESEY2N0xHamxwUVM1bmh2TWJwYUtmL0R6?=
 =?utf-8?B?V3d0ZlVXU0RubUc0SG5DMnRaUVJDaHlKWVlaOTdVNVlHaDZ3a1oxaDBpZ202?=
 =?utf-8?B?WldtWHppNU5KbVh6Q2lxeTdhaDI0ZVFkVVNhMDQ2NCtiS21pRjBHU2oxNnda?=
 =?utf-8?B?Tjg5K1NoSWkwTTFrZml4UkVPbHg0WGRMSW5qak40SUxHaCtacFkwZG9Yci9a?=
 =?utf-8?B?cXBJTEM5RTl1a3VyeFcwR0xCTWFTLzcwWDYybUs0b1JqNWRvMUM4ays3bWZZ?=
 =?utf-8?B?d0hGcHpmMlJrc0haZHF4bHZMMFJpTTlmZUVGMm00dTQ4UllDTHRROUZJR2Yx?=
 =?utf-8?B?Z1oxWnViWGRBZjZLcUIzYjdnMytMR3ByRkF4TDNTNjliV0NsbDkxYndJYWxt?=
 =?utf-8?B?MzVCVVFXZ1hpc2wybFdWQndpaEY4OGVtaWRuaTVmR3poeTI3ZzNUWm5iRnNZ?=
 =?utf-8?B?dHRhZmVSc2Rpczc5NDBlbU03ZzBPd0tLa3FtQytOQkZXNnZxRGVNUDRoekoz?=
 =?utf-8?B?aitOemdENlIwY0wrVUd5OVJwaEhNNzByQ2FiL3R2SmlDcFZwazFBVURwVTVG?=
 =?utf-8?B?Nkp4cUdGeGV5ZU8waThWYnNST1FOR0phMnVEcW1ZYmxFc0o0OHhzQktiN3BF?=
 =?utf-8?B?QlpvTWVxZE56OUpEWHU2T3FpTmVXZ2pRMW5qL0Z2d0s1Smd2MzhvV0hOdzVM?=
 =?utf-8?B?ZmFKQmR6Nm1sRzh2N0RkZjZYSkhLVWtJVEJObWdSUXd4cG44UVg5QlNQWUNt?=
 =?utf-8?B?NlduRHFTcXBVWTREaTUybXpHazkzOVBMNFlvclUvbEhGVWZyUDU3b3JrUWVq?=
 =?utf-8?B?aVpMWVVpRGRNdGMzN3RYWittZ0JFeHl1ckNmRHM3TVMwMWh5WkM3OEdod3Nt?=
 =?utf-8?B?ckFBL1VFQzM0ZExpbHpQL3FQMXZWWGlwWXIwYnhtU2ZhZHRqc0RyZnl0WDFN?=
 =?utf-8?B?VHIzalZXYVVzUFVzcTAxbWVPWGQrSnhlTzVsZi9YWXRKQ0NVTlhzeG44VEJJ?=
 =?utf-8?B?K3ZCY0piSlQzaTUva1BLV2RhdFRqU21wMGpkdHhEaURnVDdqVXI4S0p1Qk8v?=
 =?utf-8?B?bmYxQy9GVmRVRjF5ZDI4NncvdjMvNEtsdUxReDN5Qkl3d2sxYXNJdlZtS0Mx?=
 =?utf-8?B?clFObG5zNmt0YUZxYjJrOTg1QjZRK2RjTDBSS0sreHV5dWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2dvZWxXd1NqMUFzZDBVeXFkT1NYMXRhZHo5TkhSelFHc2ZpWmpXYTNyQTl3?=
 =?utf-8?B?a1BtNUd3RlZZZDlUWk5DcHR5RHZiZlNlSFRSQXlOVVZIV2cwM3A3VnF1SG9a?=
 =?utf-8?B?TEUrRzBsOGxpUEdpWHdGQktPUmJZZEtYWGt6SG04Mlhja1l1QkpEckUranBY?=
 =?utf-8?B?VGxyMlpBUWpyYlZpK0ViVXpzN0tKSEk1MFRZVVFJSnFBajFEV1l3K2dJMzRk?=
 =?utf-8?B?YytJYk10a1FDS1p4T1kyQldsak5yT3VET2RFZnBSRVlnWXFjdVFMVGljQ2pt?=
 =?utf-8?B?VmM1bTJ5N2o0aTg0NXp5dy9QRFJoTXpCcTdVNnVINlBIdmNlczROYVE5bnN3?=
 =?utf-8?B?SmxrWVdYdmEwSXR3OGovSUJNc25ZRUxkL2g1YmY2OXBuckRBZ3NNNmJRV0oz?=
 =?utf-8?B?bkFRbVpxbndvYjdXTWQ0a0dtRTYyYjM3bFlUUU1zM3kyZXF4REJnMmc1TFIx?=
 =?utf-8?B?R01xaFpHQTNQMldUMlNnTXZzc3FmZjAzY0ttcDZ1QTVrdUROVHBEQldsK294?=
 =?utf-8?B?MlhNdS9qK0s3TVN3UkdKQlc5YTl1ZTNiNGxOaUUyN1YzUEh3bGRoU0ZmMWRR?=
 =?utf-8?B?ZGlXMlZXQVF6V2F5Y1l3QzV1WndlY1FNa0U3KzNTTURVY1RuZG11Rk5Db21n?=
 =?utf-8?B?OHI2QTkrN3JiV0p0NVpTeDZMREROOTh3bWxGUTdNQm4yT2VselY4bDdCVGVv?=
 =?utf-8?B?VlN2ZXdGZ2o0cmg1cHhDMStlWklkdGZwOFBNOEhtcjl3cktoVVlhTnlGMTFK?=
 =?utf-8?B?VHFEeXlyVUhmdXFVOGFqbGtwTThBZzFKQnppZlFaLzc5Y1UrZ2ZmYndBZ0dw?=
 =?utf-8?B?cWZVTVVkdDhDZWlGNFJZOVZTU01DbmlicGRVa05kOTNzRml4Tkpkc1lLYXIz?=
 =?utf-8?B?dEhXU1kzWlc1MTNPaDVoSCtvL1pVNUIwa0E1d2o0VjFrRi8rTHZkZEFuR1Jo?=
 =?utf-8?B?TnRUbmhJRThKRHdIUEV4cHZJVDVGVEdQUXFqWW9TcnFvUFc5K1Zmb21zR2hz?=
 =?utf-8?B?ZVN0WVd2N1VxVlJDMzBsMW53NWxRMXMzdXRsZTF1WGhFVWNSdmtYUnJsb0Nr?=
 =?utf-8?B?ODBOTXplV3dPN3FBNkUwYSs4bDV3NFpjUHBZc05kN3lVdkgrcDBlVlhDWXVl?=
 =?utf-8?B?ZzhRdGNGNjJuRGRNbUFhTDB1YXhxSWNlYVN4Nml2bHRDanlaM2tYeGpRY0Fw?=
 =?utf-8?B?R3doQ1pzREZsOXhZaDVSV3BzZlhyKzJ3eU1DREFVZ0h0WjZsc2xIUGNHWkpM?=
 =?utf-8?B?eEdta3BGQlI4UG1xeW0yS2ZNcUhva1pWNTZRU2NIOHR4WnhLa1VPdHRKeVNM?=
 =?utf-8?B?SWxwV3RHMnZsUk1PNzNaK3Y3MmkzUEpoYkhpOEJlTytCM3NTSng3bWdDMnFO?=
 =?utf-8?B?aVpPTERrM3hBVld5MlRabEdWUTNqUzRRanpXb3poeHJLYUJYM1JTSENzT0Z6?=
 =?utf-8?B?RFJQaXRReTlWb0M2NXJqTHczUmVxN2o4V3owNDBlbkI1eE5JZTRVc0ZnM0Ns?=
 =?utf-8?B?cGcwdWVsNjRFVTZicmxCTCsrYVA5T0ljemlsRzk3aGlUQjRYVTdCN0ltQ28z?=
 =?utf-8?B?bktzNGUxbnEreDNjdjR2L2Z2aE9vV3k2bzdQakV1YzJTTHREbkZFcTFjKzk4?=
 =?utf-8?B?UEV2L1hVL041MVJyRkhwajM5eUJrUFVHL29yN1NadVZTd0V0MUpKR3JxbzE0?=
 =?utf-8?B?VHlDK3padU5Nd0FTUEwzWHRiZk5tTGhzcTg5eWFVb0JRMCs2VGpWb0VqYWdD?=
 =?utf-8?B?NFJvaUN1MDBYWllrbkRiVWRLME9td29RMExHRzhPb0kwWll1c1BNbUx1MUFR?=
 =?utf-8?B?Ly9vODAyK3pRM253c0N4T0xoeS9Obkw4cWNlTi91bVRkWVFzVVA4TzFIVE1C?=
 =?utf-8?B?emJxNHFpbDV2R2wvQXFWZ05zc0tIeXlOSGFrNk9oWHlTSFhXbUx2SXIrcUVa?=
 =?utf-8?B?SXJoUTBXa3VWRzgyUUYzQkJlUWQ1eE1yZ1NranZGV1psSzVaeFNwY29MMFNi?=
 =?utf-8?B?T1ZZeThmL05ObFZyODBQRXVldkgzNE9xUUNHejFZa3BSaXFDZkhXbDBsUUNO?=
 =?utf-8?B?M2tvNG9ReW9qdGUvbzVOcVE0UUtUVjFmWUxxQks5WHRDb1JVT3pRZTYrdXYx?=
 =?utf-8?Q?UqsirQTI27Otu/vk0xGrqiGZ5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb99d12-8c12-4511-7f90-08de1c60ec4a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 11:46:14.3892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 101C0gEy5vL3kUVD37/kBZg58VrJP+rm7nYqkueagqcizqHYTMKX9USNUJS/JPqzzUyE/gnltcj/GJHc1V7+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
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

--------------qtsZxq8TJ0qfqeS0DK6Z8HIS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi,
These bat results are because of HAX and expected.
Could you please re-report.

Thanks,
Anirban

On 05-11-2025 04:02, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_survivability: Add xe_survivability test 
> (rev12)
> *URL:* 	https://patchwork.freedesktop.org/series/154342/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/index.html
>
>
>   CI Bug Log - changes from XEIGT_8607_BAT -> XEIGTPW_13987_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_13987_BAT absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13987_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (11 -> 11)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13987_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_survivability@i2c-functionality (NEW):
>
>       o bat-lnl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-lnl-2/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o bat-ptl-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-ptl-2/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o bat-dg2-oem2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o bat-adlp-vm: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>  *
>
>     igt@xe_survivability@runtime-survivability (NEW):
>
>       o bat-adlp-7: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-7/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-atsm-2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-atsm-2/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-ptl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-ptl-1/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-lnl-1/igt@xe_survivability@runtime-survivability.html>
>         +1 other test skip
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8607_BAT and 
> XEIGTPW_13987_BAT:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@xe_survivability@i2c-functionality:
>
>       o Statuses : 2 pass(s) 8 skip(s)
>       o Exec time: [0.0, 0.01] s
>  *
>
>     igt@xe_survivability@runtime-survivability:
>
>       o Statuses : 2 pass(s) 8 skip(s)
>       o Exec time: [0.0, 2.23] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_13987_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Possible fixes
>
>   * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
>       o bat-adlp-7: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html>
>         +1 other test pass
>
>
>     Build changes
>
>   * IGT: IGT_8607 -> IGTPW_13987
>   * Linux: xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165 ->
>     xe-4042-23a9835dc75d0a8ce54cce440a3e0b36c4cec6af
>
> IGTPW_13987: 4d24e938d100a2f6746e6dcb11c9c1d9c19bd3d8 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8607: 8607
> xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165: 
> 3512eb46a8d42c3deb477856c25d519b19a7d165
> xe-4042-23a9835dc75d0a8ce54cce440a3e0b36c4cec6af: 
> 23a9835dc75d0a8ce54cce440a3e0b36c4cec6af
>

--------------qtsZxq8TJ0qfqeS0DK6Z8HIS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    Hi,<br>
    These bat results are because of HAX and expected.<br>
    Could you please re-report.<br>
    <br>
    Thanks,<br>
    Anirban<br>
    <br>
    <div class="moz-cite-prefix">On 05-11-2025 04:02, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176229555320.17802.13400962993084440102@10055242dc62">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_survivability: Add xe_survivability test
              (rev12)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/154342/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/154342/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8607_BAT -&gt;
        XEIGTPW_13987_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_13987_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_13987_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (11 -&gt; 11)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_13987_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_survivability@i2c-functionality (NEW):</p>
          <ul>
            <li>bat-lnl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-lnl-2/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-ptl-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-ptl-2/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-dg2-oem2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-dg2-oem2/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-adlp-vm: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-vm/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@runtime-survivability (NEW):</p>
          <ul>
            <li>bat-adlp-7: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-7/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-atsm-2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-atsm-2/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-ptl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-ptl-1/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-lnl-1/igt@xe_survivability@runtime-survivability.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8607_BAT and
        XEIGTPW_13987_BAT:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@xe_survivability@i2c-functionality:</p>
          <ul>
            <li>Statuses : 2 pass(s) 8 skip(s)</li>
            <li>Exec time: [0.0, 0.01] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@runtime-survivability:</p>
          <ul>
            <li>Statuses : 2 pass(s) 8 skip(s)</li>
            <li>Exec time: [0.0, 2.23] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_13987_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@kms_flip@basic-flip-vs-modeset@d-edp1:
          <ul>
            <li>bat-adlp-7: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send="true">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset@d-edp1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8607 -&gt; IGTPW_13987</li>
        <li>Linux: xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165
          -&gt; xe-4042-23a9835dc75d0a8ce54cce440a3e0b36c4cec6af</li>
      </ul>
      <p>IGTPW_13987: 4d24e938d100a2f6746e6dcb11c9c1d9c19bd3d8 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8607: 8607<br>
        xe-4040-3512eb46a8d42c3deb477856c25d519b19a7d165:
        3512eb46a8d42c3deb477856c25d519b19a7d165<br>
        xe-4042-23a9835dc75d0a8ce54cce440a3e0b36c4cec6af:
        23a9835dc75d0a8ce54cce440a3e0b36c4cec6af</p>
    </blockquote>
    <br>
  </body>
</html>

--------------qtsZxq8TJ0qfqeS0DK6Z8HIS--
