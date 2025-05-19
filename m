Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1416EC3DA6D
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 08:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A268B10E1CD;
	Mon, 19 May 2025 08:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejFujwYC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DD810E1CD
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747641849; x=1779177849;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zhiNdhHt2vCgXYqsiKCm/rX9Gsm41bPr27tXXdqaFXY=;
 b=ejFujwYCeSqBmhTa4ZTZWOe3/WevgqQcuZLNltIQVuyC6IaJhcUgJ+f8
 +De53Ye1ALOvH5X7L2Pt4WteknnvZLdCVu5NXtLbCcedGgLbzbIa/zjkp
 YP8In0NqkrY6YeYsQo5JVo2CKbq0zzlq++b5mUJbg16MhR4YNQozdhR8C
 IPXRWTj6KQN3NnJOi+gafz6XpP2V+tZIUdjYSe6s3bcI0Emzun8LUoygo
 tAm+ftx50V46WGrA13NdQGNWogyjf62aOhCfI9uiXZXs9uAUk1y3pIhMc
 1ghVyuXf3LOulETXb1aa5vvEZgAolh9rbQoqQ18Z7UV14SnR8JLl+ztdA Q==;
X-CSE-ConnectionGUID: ezcg7+5yQRCHgDMsW70qEg==
X-CSE-MsgGUID: Yl8RzbmFQN+QsydQL00vqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="66944300"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="66944300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 01:04:09 -0700
X-CSE-ConnectionGUID: kaWrHQhGQiS82Y1qlkmjgA==
X-CSE-MsgGUID: gJrYfkDrSJO6qrEgdHGrSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="170330565"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 01:04:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 01:04:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 01:04:08 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 01:04:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbfafXwXy9nlgn4WmZIltFxPQ8nosqbMPtgi/aG0I5kw38vdHGHaNnoRprdwYxJUOzQMZ1utSgYQXoBy07Dh2ZbC1bxBtcC/QcuaIO/6uIYHxP8oESZ+v4QIq8GEUE68lau+2wCMzUSmTpr1EMbvFhHLA+KcXnB0LHpWaDiALAsX9KjVZTBGdYlGTi1naWdXLUgMoAf/ATZ7vMTQ+fapOKNBZ/XJCnPjnBSeg6kS+l8+FQ31TVoFucm9RIvQRzVW1jIUJGf/Nq59dUCpz5UGx7XEekbXmko9X+ckGU8AKDq/X8caIs8OOBHp8/20JMX66/KHa2iBNXJFDmKn7utkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCA5BbeCarqJDRYq+B+8w8GGlm5+4MsToUpTs05IgtE=;
 b=KnagAaaytnMEdFVFHSdtfcBJWw6TeIT8qBLGhLqIdKYomjwMl3Mfz+WyBPgnfWLJ/dII5PCiZ6RJ0eSLtmn/DqcsYQPV1pVLrTvdW/nRII9hRaG6QjwceSjJ52MqrtjSgey8egXcFgmq26ZdUuF3pdgiqPPf4sb1l1sBc/CzrphCTlM44RKKEx1PEEuCQiYTg23WBFfWzE3JbhTkGlZefg1NydIxnr9THS3dCqtNOhREt4mso/q+FEKd8YttHUDCR2CakNysq6wU/7ycDWpFqwO/PjkQl9DVmOT1/x1e5gEmH5meLXcFM3acxcZV4nj8vLYu5DrB+Qyl6AMGqO0Hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:04:03 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 08:04:03 +0000
Date: Mon, 19 May 2025 10:03:59 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 05/15] lib/intel_cmds_info: rename M to TYPE in
 blt_memop_type
Message-ID: <aCrl77t1TQvHgKmq@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-6-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 836c9d86-1c61-404a-3c2c-08dd96abb817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjVuU3BHLzNsdUlselVBSzZOSExsd2NUU3lpMnFFeFppTnhjaWhSSVFNdG1P?=
 =?utf-8?B?d0FqVnhjbWlRK3AyaDJaMGhqU3ZIMUpCb2lnVlJEdmg2eEdhTytPOTlLL0c1?=
 =?utf-8?B?azBxMTBINmxzb2tzOURHak1aN09JQzhiQWoxZWhmcys3YnlOUmdtbldDMmor?=
 =?utf-8?B?Q3pCNVF5ODl2VUZ6RTE0RlcrYUtNaVJqNlcxeG12ZFZWVEN5N25mOWMvMlZa?=
 =?utf-8?B?Z1pMeW5lUVZ3T0xkU1l0NTl2MlFNVndzUWV6bjhDZzlQL3ltaTBURFV1QlFF?=
 =?utf-8?B?ZGgvcVhGQWRMWmpxWE53ZEtBemdSOFc1WHdQcEJLdzZzSzdSWWZYcVhwL2Jx?=
 =?utf-8?B?ZTZNRkZDZDJLbUhlQXdqaWJ5WTRYNU5pekFoQzAzQ3dSR3NocXdOUWN0eGQx?=
 =?utf-8?B?V2k0ZVNGOWxsRVF2emtyOTRLU2JVTEcyUFNOYmR2UVlIQ2RZcmlRZzRFbHBR?=
 =?utf-8?B?NVFrck94UzErQk1RTDJNMFZEeGJSRGppbXlmS3hYbjh1SUxVRG5pKzQ5RWhY?=
 =?utf-8?B?cmx3SlJqQU84OW1rbWdSSzdwS29TY3BrbjBPTU9NVFM4NUhMQXFKNlE0dVU4?=
 =?utf-8?B?OGt1bTJGWk13SXZXeThMVVJ6YVRPbEl1SUVMdFV4VTRDVWV1c3ZsT0ZhSUtU?=
 =?utf-8?B?VEFweS9OZ0hpQTk2U0FXMlBsVHZPQ3hBdFU0Mmo2U3VnbzAyeG1ZTUZlNFhu?=
 =?utf-8?B?bnhoZE5LSFhuNmY0K3lCV3liODhoUk81UDVVYlEwUmxpTDMyREh0Q3VXSnFK?=
 =?utf-8?B?b3ZxQ201Mnc2RU5KN2F4MjhxTWZMZk1yL21IT2FwOVl4SUduTDBSdXBrN1Y4?=
 =?utf-8?B?bzRDQzNCR0IrREZpY2JVenNwcU9sQTFTbmJFTS82NldVd1Vza1gxdXdBeUt0?=
 =?utf-8?B?dXU4R0hFSE9SN055MElkckVDOHZkOXJLZEl6VjNYM2lSQXAxWDQyMThPQ1RL?=
 =?utf-8?B?TzVtZ2w4QlNuRW4rdzlMVmFXaTZrK25tMkRnZTFCd1QxRUVZaG1tVWY4aC8y?=
 =?utf-8?B?ZlJyVjNvQWJTVThGUjJ1dDh5dkZ6aXhsMEVZb1BoeXNFVytDYksrWWc1UlVN?=
 =?utf-8?B?OTY4a0srSkIyOXdla05xQWRWUUMvdVNPT3FZSis4M25sZEcrLy9CSGpoN2dj?=
 =?utf-8?B?a2o0ZGMxTjYzQVgwOUxpcDhOc1B1YTFCV2FPOGhIUnRjOG56Rk1RV1RXMWVa?=
 =?utf-8?B?WHkyR0Z6YTdqKzMvc0tyWkdiTDBkOTJ6ODF2WTJZcHo1SHFEOG0wTFRaT1Jw?=
 =?utf-8?B?RW4wZU1qUlVHTWRhN1hsaERxbCtwazYwYzFBM3JUelE2ZUdEVlQyRGg5YWRq?=
 =?utf-8?B?RGdvdkhkZkN6bmE4RHRyL0RWNStZOU5KTzJOM3dJWURoOCtSem42WDJjb2pv?=
 =?utf-8?B?VDVjYUQrNWJsWXlvVStjaXVvamtjQ0dJWVhPVkRRWUY2dThKdERkV1RzY3BM?=
 =?utf-8?B?REkxdm9ueGVmSWZZNy94K0pCUEhzaElNUkpyZktnR0JSQWZ4SVdnQ2k4Q3Vy?=
 =?utf-8?B?Y1FjYTdWRFlpbEd4T1FoNmJaL2h6M3MyK21GMytDNmdicDdCMUZHcUFEL04y?=
 =?utf-8?B?dEc5Y3p6dU9XN2QrUzRJRFdUMW5GTXc0UjN6V1IzQ3NXWnRPb041V3NmYVJS?=
 =?utf-8?B?UGdWdUVicUxPbStKZmdwNUVLelVMNlB0eEFDZG55a0J3a3NWdFdBNDN6K1hy?=
 =?utf-8?B?TDBCL2dzRUVJV0tkMzRzTlpsMlVTRnNYYTRqTlpTbk9TcXUwUnhLSlBWV3Z6?=
 =?utf-8?B?dzBLekprbS90KzNKdmMrYktENFhEREpxQW84T1V3aFU5QTlJdHBWMEZrTS9t?=
 =?utf-8?B?UGFvakcwbUExMDRNQXlMakNkbkV1TGd1SXZidG1kNStHQ0lkWVNydVJmektz?=
 =?utf-8?B?Wm9Na2loYk1hTE1SR1RlU0ZUWXFCaHFzMHI4SytlMWhlNGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFJVeWZiVjcweXo1OXJvWWNmYTB1WG1aMk5CNkZ4Q1hDcmlJSk1mVENhaTRC?=
 =?utf-8?B?ajV2VTdOckVsUGVJT3M5eUVGb09XeHoxRXRyVVFJOGIyR29sNU9xRDVPQkFu?=
 =?utf-8?B?akJyVmQ3dlFNWjRuVDQremFMR2h5MkNVWTZnWUJoM3NaQSt5VkM5UnErRnpS?=
 =?utf-8?B?NkRXN212c2toU1RrUnhBeFFDOUQxU1N0cXdFQjJHM096dUpKM3BxdU5JeCt3?=
 =?utf-8?B?bndQcWtnYmgxK1doRmpSVmZDMjlzdjR3ZW5Ia1R2WmZ6dUVkTmcyRmJ6Snl1?=
 =?utf-8?B?OGlYQTVGN0ZWSWZmb004QnYzWURIMnE3OERzMWgxeGNNOVFxMXhRaXpsL1ky?=
 =?utf-8?B?N3U1T20wRTY5Rnl5V2x6bnlhNnYyMWR5SC9Xdi82TFFFNFNVVGwzdml4OTdv?=
 =?utf-8?B?T0V5N2NrclRGYVFyZ05nd21CU1AySE5CdndWM1FDaG05YitWdXgvUldjbGlK?=
 =?utf-8?B?Y0p0UFRjNENDTnpBMzR6em1wbDNpK05VZEJ0T2x1NDBZY3RUa2twaFVJb2ZM?=
 =?utf-8?B?a3AxR0cySkh2U3o2ZUUzUW5kRDBZZ3dCcVdKc1o4MW5ydk1oMEtUaEtpZWND?=
 =?utf-8?B?SDZJSkVrT3ZCd3ZpSFVGT016ZVZrSVJ4bnFySUNzYmRHdjJacHZ6UTdOdEYy?=
 =?utf-8?B?cGFmRFVhbDY3bGgrbGkrcHRXbnhEVUtjRm9nSWdyL0JqV1BtVmJPdFh0dUNL?=
 =?utf-8?B?RVp4YWFkOGRGK3pKOGRUV051MnhKR2JmbEN6UDhPU1krSzBERm42NnQ4Njda?=
 =?utf-8?B?M0FUUHVrckZHZ2QvMVA2eHptVk91SGRMMjlrUmtXMWdRdHhzdERUVUh1R3hR?=
 =?utf-8?B?VVJJeGNaSUVUaEl5dkdrVmRvYjdEOEhleW9MODBDRUdCUjF4enYrazZsdlBw?=
 =?utf-8?B?R1JmdE1DbXN1Q2gzR3FVZXNyUzc4Z1Zmd1BsUXlIYnZ6c0d3N2dQdkxqQXdt?=
 =?utf-8?B?SzFqMWE5blI4dFh4ckV6cU4wRk5sb05tSXIvZkRHMWdOMVMyQjgvTGpTNHFL?=
 =?utf-8?B?aGVabFMxdzArZys0QzAzMDBUZWxXQ0lNV0NEUG0zL3Jmd1FZWXhjeWNDMkdR?=
 =?utf-8?B?ZjdEREJTM29aVjYyTy9OQVJJeEhlMWlwRDlZcHc0MXRhRWtpTmtTdmpOSWtB?=
 =?utf-8?B?MmpTNXlzMlBEamJWZXhBSmhwQVVucEFqdURmRjhxSXh5K2l2eDRkbkl1K1ho?=
 =?utf-8?B?em8rRmZCTFpFN3lsYk50YXNVMEVZM1NpRGlxcHJzSWUvMUxJcktsOWRSdWx0?=
 =?utf-8?B?QXJ4M3FvaGM2T0VkWmZkd3V0NG5XbWZYT2pWcWU3ay9zNGV0eWhHQXFpSWNL?=
 =?utf-8?B?SHo0OHhaR1Y1VjdLT05UVWVYOFVxRmY3ZVFHaEZFZGJIM09xODVUaUUzM2k1?=
 =?utf-8?B?aWNjMnlMK0k0TUZ1LzBPQWx1RDhOaHJYcHpncXBicTd4Mi9DeWd3cFo2clQ1?=
 =?utf-8?B?R0pBTWVXaldHbDF2YkQzSGtPR2I1QkJmemdsOWYrcGR1NE1wNWxNYU10bGdk?=
 =?utf-8?B?QnRVbmI3TVpLbzRpMGtIVXBXVUhoVkxDZ1BZS3dDaFdFRUlITUZLc1l1WTZI?=
 =?utf-8?B?S1lZZWttdEU0TmUxT0dTVTUzbHBvQnhuaHFMVGRSUDBHYXE3bndEL1MxckVv?=
 =?utf-8?B?dUZESWNEejhiVmJ5TnUyUGM4YitXVEZyRjRwTXZ6cndaOHVQdlNWemtlRXc3?=
 =?utf-8?B?VFcrYzZxa1B0Y3laMSt4MEVZSVJWQ3prK1dNWlJZVDNsdFl6aDQveWYyTG9q?=
 =?utf-8?B?Z3lnMnRiTm94R0d3cW9qUm5vREVVNkFGcFV4TXVLVnNpekxoTTNzR1FuNXp6?=
 =?utf-8?B?RDRLb3dGcTJBakk4eFExcE5kNXFocDQ3T3orRjVRRFM4RFg5VDRXVTdPNm94?=
 =?utf-8?B?QlJzVXlpS29hSzlESDhjY0FZaHR2a0d0ZGp4Y0dNR3hNVk9jUzd4N1hjalND?=
 =?utf-8?B?WEthRGNDcyszLzU4YWNtRDFBRVZnQkVJdHZXNUhzaXV3VG5iV21sTmEwQUo1?=
 =?utf-8?B?YjgvTkR6Qy9BNi81cHUvdDUxeStQUUk1cTQvWkc4aDhJT1dXYVhTMXZ4TDdW?=
 =?utf-8?B?N3lCaXk4VmZ4NWZoNVh3c2VGMktCT3NrYSswM1hQeDNtM3NXbWQwZkVBOFM2?=
 =?utf-8?B?b0gzRGZYdFVwNkJEanl2WnVSRERIOVBBdDIwRktmT000OWFhb3doK1JxWjl1?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 836c9d86-1c61-404a-3c2c-08dd96abb817
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:04:02.9445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUf/DE5CnVmI+SjKJmneu/dpDUr4wo5ohAj7iwba7ihcmGzc5lzFwYWyhUFNPvHMOq+fZYjw78d/8fGes61gD+cdVrzv9NFU/sKRcZO5bH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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

On Tue, May 13, 2025 at 08:58:00PM +0200, Zbigniew Kempczyński wrote:
> Documentation separates type and mode in mem-copy so rename prefix
> to avoid ambiguity.

Which documentation?

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_blt.c              | 2 +-
>  lib/intel_cmds_info.c        | 8 ++++----
>  lib/intel_cmds_info.h        | 4 ++--
>  tests/intel/xe_copy_basic.c  | 6 +++---
>  tests/intel/xe_render_copy.c | 4 ++--
>  tests/intel/xe_spin_batch.c  | 4 ++--
>  6 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 7010d3ff7d..33efbf1038 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1827,7 +1827,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
>  					  0, mem->dst.pat_index);
>  
>  	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
> -	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
> +	optype = mem->src.type == TYPE_MATRIX ? 1 << 17 : 0;
>  
>  	i = 0;
>  	batch[i++] = MEM_COPY_CMD | optype;
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index d581edb6eb..3bd5eab653 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -74,13 +74,13 @@ static const struct blt_cmd_info
>  
>  static const struct blt_cmd_info
>  		pvc_mem_copy = BLT_INFO(MEM_COPY,
> -					BIT(M_LINEAR) |
> -					BIT(M_MATRIX));
> +					BIT(TYPE_LINEAR) |
> +					BIT(TYPE_MATRIX));
>  
>  static const struct blt_cmd_info
>  		pvc_mem_set = BLT_INFO(MEM_SET,
> -				       BIT(M_LINEAR) |
> -				       BIT(M_MATRIX));
> +				       BIT(TYPE_LINEAR) |
> +				       BIT(TYPE_MATRIX));
>  
>  static const struct blt_cmd_info
>  		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT, TILE_L_X);
> diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
> index 7960e0412e..66f63d7e72 100644
> --- a/lib/intel_cmds_info.h
> +++ b/lib/intel_cmds_info.h
> @@ -20,8 +20,8 @@ enum blt_tiling_type {
>  };
>  
>  enum blt_memop_type {
> -	M_LINEAR,
> -	M_MATRIX,
> +	TYPE_LINEAR,
> +	TYPE_MATRIX,
>  };
>  
>  enum blt_cmd_type {
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index d4300b85c0..a9e9bd2359 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -58,10 +58,10 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  
>  	blt_mem_init(fd, &mem);
>  	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
> -			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> +			   region, src_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
>  			   COMPRESSION_DISABLED);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
> -			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
> +			   region, dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
>  			   COMPRESSION_DISABLED);
>  	mem.src.ptr = xe_bo_map(fd, src_handle, size);
>  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
> @@ -109,7 +109,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  	blt_mem_init(fd, &mem);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
> -			   dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR, COMPRESSION_DISABLED);
> +			   dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR, COMPRESSION_DISABLED);
>  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
>  	blt_set_batch(&mem.bb, bb, bb_size, region);
>  	blt_mem_set(fd, ctx, NULL, ahnd, &mem, fill_data);
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index 9f16537c1e..f0a90e320c 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -470,10 +470,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
>  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>  	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> -			   M_LINEAR, COMPRESSION_DISABLED);
> +			   TYPE_LINEAR, COMPRESSION_DISABLED);
>  	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> -			   M_LINEAR, COMPRESSION_DISABLED);
> +			   TYPE_LINEAR, COMPRESSION_DISABLED);
>  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
>  	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
>  	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 4fff34a092..06c5f9d3f9 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -351,10 +351,10 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
>  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>  	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> -			   M_LINEAR, COMPRESSION_DISABLED);
> +			   TYPE_LINEAR, COMPRESSION_DISABLED);
>  	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> -			   M_LINEAR, COMPRESSION_DISABLED);
> +			   TYPE_LINEAR, COMPRESSION_DISABLED);
>  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
>  	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
>  	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
> -- 
> 2.43.0
> 
