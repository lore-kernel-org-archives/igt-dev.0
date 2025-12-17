Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD6ED65C49
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 14:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6570A10EBD4;
	Wed, 17 Dec 2025 14:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8KLz5xu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A7310EBD4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 14:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765980293; x=1797516293;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PdpjIZaijd1ThJDuUfY4BuE/TfLRUhDPC14qL+P+atU=;
 b=L8KLz5xu3UFbUXpNyKPmiqSyB3czDyv3wk0w4u9ewPRfL9y/XBukW3Tu
 beSFEJ9fz138uJIEwV+BPnKC1HR5QBzA3G7m0+atb2ASvSGOj03oVFxea
 +N5P7ugjin7A4b8Tq7RLCV08bqrgoaqWHhnges5BXuZgRPA+2h1QkwKcX
 8AmtP2R+U3zzB6l045hP1RXoO6FFxNXgL8DrlxJvgzZUFLT7TVQEWg+4W
 LxOicuXJgvwL13+WiHFhBclC2SaaPMnZO4dIEEbhX3POMMCLNvJXEES6C
 1Z5tOmzqjtowNlIlZmsXytXqlZIc6ILafSM9XHNL/GDqxJYO6h90cTo03 w==;
X-CSE-ConnectionGUID: mHyNPBOURGWR/YdjBJauDw==
X-CSE-MsgGUID: 1gQ7prN8TaKD/+Pu6RVDjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="90575493"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="90575493"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 06:04:53 -0800
X-CSE-ConnectionGUID: aDNb+JDSSNGjVRgL+9NHTA==
X-CSE-MsgGUID: 23wU/vsqTJGepUVEw8ngyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198310218"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 06:04:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 06:04:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 06:04:52 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.16)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 06:04:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkQul4LTfqgLYduLSH1UWUUeMQ9j6as9X3hU72zvxPjD8WLuTyFoFs6PRbAQbpgRaLG9Jrd1skADhnUwAlj8Lfz5+nYYoB+HqHgCEJXy2B8zchvHa7Y15iT5STLgUGOg+zKQJynHKz2jEnUGM9DT4sWwYiABOL+dK/XGOnpISb5WosIk3NM8nX4Aa7q4zj47tKFv1WkPdPCCVPCg8FBMzWCXIObuarr3CcIvx+TpCkNUTkIU+2UKlP2REGPLPcVqfe9IfE+0ZoTiKTeSt9yE7fNsxJHltKg/bwOOk3a2lJjauzWy7c9lCGjCdIeVsREVLueDtr7YpOyYLOzomE9s4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exjCh/8JIAeZP49I16q84hyGN7eis91RRCyvfBa4qsU=;
 b=kwVQfC7mMfRVUvT4TucSGq7DShSJNwhGCVJnbwlP5DfrL272Ef5UVW4Xw5DVIatb3P89mc3CuZxDlpbmeKcaV9XzqQvTlQT07BtQQCtSM0cU5lTw27PQBh/M9GAe/x/w7IxeFw8QZmtJV1mpZ5x0ndwckTQgEXX8ZOWgasv7ELb+OXHG3fCSa3VHrigAFQeQuRI+JdXvHCKQky5M+jiSCwheuuaakSyOIf6iGNUp16Y5u1vxzzbYLkbaw6dhJRCc5VikuEGRywb5xQG7ib1cvrJHcm8IEtVoWrxVaFN2BQE8mMv8vmFJrWWffKFXC76vXLtLXZZPOk1JeRG46WiASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB6873.namprd11.prod.outlook.com (2603:10b6:806:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 14:04:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 14:04:48 +0000
Date: Wed, 17 Dec 2025 15:04:44 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t, v2 1/3] lib/intel_compute: Differentiate
 array_size and loop_count
Message-ID: <aUK4fJoFUIPvcuDw@fdugast-desk>
References: <20251212115208.179655-1-francois.dugast@intel.com>
 <20251212115208.179655-2-francois.dugast@intel.com>
 <gelf7k7ibthfgzlwe2xkxucxhnlw6obunszawro6tluyc3i57t@m2j2l3gna6da>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gelf7k7ibthfgzlwe2xkxucxhnlw6obunszawro6tluyc3i57t@m2j2l3gna6da>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR06CA0065.eurprd06.prod.outlook.com
 (2603:10a6:10:120::39) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4ec6c7-2946-4f8f-da60-08de3d753d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWdIaVN4Q2Mrak1kS1RVM2VtMUZzQjNOeFpyZXlGQUxZTXZHT2JXWGRmVnRY?=
 =?utf-8?B?ZEo5OUhzRHpOS1ZDUzV5dkN2N0RmVHZNem1JT3hINjF5eERDa0liU0k1U0VW?=
 =?utf-8?B?c3ZxbEpYemhLZ0JReEswZWVVR3ZiRU1PYzNCOHZRUGpGQlp0dDZ2Qjl2Nk5x?=
 =?utf-8?B?Mm5ZRmZwelpoQ3dvakFsY3B3TUhsN1k1dktwb3Y0RGp6NXRMbGNDSmxac0Vu?=
 =?utf-8?B?NDJ3YmZBYTVSUm4wQXdpQ3FIS2xDelR5OWlieUpGeWxSbHZBYk5QV3ROS1g5?=
 =?utf-8?B?bEt3blh0SExmSytpS1BpTU1zR1RQN3A2Q3AwOHZpa3M5VHVhOXk1VUJnYURv?=
 =?utf-8?B?bkxVVHhIN2FJeTNYMDRsSnRHaVZ1MW1qQmpUS2RpL2FtNXJGYXRJdExIbS81?=
 =?utf-8?B?VUtRNUEzTnV3UkxaUDlQUVhXT3Q5N1dEcjJKa3VwN2VYQVIzbzNGczkzcFVu?=
 =?utf-8?B?LzE3dDVWOEx3cnNLVlVFVE1tUEhDZUNsaWVtS0RDY2VFS29JODliRFY2QzBD?=
 =?utf-8?B?b05uQjdDR2lFcTFNZmxCTEZ3M25lcnIwVnFqaERHWHk4MU9JckZHbVl3cmFR?=
 =?utf-8?B?NWszZGx1QWlOcWtsdnpGUmlFc1VwSUZ6M3ZtdEFHSDVPbTdsdWxzaFZmaHha?=
 =?utf-8?B?bW4xaWF1RXdsamRXM1dCakwrSzU1SCtLRWcyQUpybXl0SzhzSFdlWVFERjJr?=
 =?utf-8?B?YmJRZUhDS2tjNzV2cmVZMFlNV2h1T1FkT0pKQjJBZDJFV0VscWNNTkxaYnpa?=
 =?utf-8?B?bTlQc3U3R2cwaExLbXF1bFNQSVpyTkU4UnpraFZ5dGNGbjFCbmFBbVkyVUNU?=
 =?utf-8?B?eG55M2tYNlA3S0N0VkhMaStic1hyRldGb3Nqb2FOSmN6WE5OcXRmUXkvSlRy?=
 =?utf-8?B?bkkxT2ZTV1VDZlRzSmszdzhjZEgyZTNFbEVVeGZhZE5lckdHVnhaWXBhdHFL?=
 =?utf-8?B?eTdtc0xXRTduVm45MTlZT0VReXgycFV1bk5jS3I0enlLUzRFdE1XRGl1RVhm?=
 =?utf-8?B?Yk9IL1d4MmEwM0EveElIUm5wdEtEN0t6TWZiTEdSWVpJTUJVOUNpU1B2dUNh?=
 =?utf-8?B?TmRQK1JlWENuaU14YnBtUEVjOTdFOVNSd0JCOWpxRDBDQW5CV1pFYnpISTlX?=
 =?utf-8?B?b2RzWC90WUhYUjEvWkFMMStTYktrUHUzNWRsZDcxdFBRM0xmRGRialpxSnRj?=
 =?utf-8?B?c2pPUDVMUE0vSitlcnYwT2JPS25aUDRULzYxL3JwL24weVBoeHpVL3BQenBv?=
 =?utf-8?B?SGFFbmh0dmVEWjdIdjk5M25lN3JiVk1uM1k1UFRNL1p1R1ZkT3dBTmM4bzRj?=
 =?utf-8?B?eSs5eE9JOEtMTUcxUHZxVlU0dm5jUFFHNUE3em9VbXRUeml0aW1aVGt1QUc0?=
 =?utf-8?B?cUpHQk85bml3eFB5OTBTbG1FY0ROMEtNcmhrODFtZlNON3pWUTZ1eVFOaTdW?=
 =?utf-8?B?VHU2eitVMnVpSHlLdGwyUUt0cVdyRTJGVFpJYVc5cGt6ZEVEelZTaHNabVlp?=
 =?utf-8?B?WWFkMVFOOFh6NGw2ZkNFUzVpVFJNaFZKK21mLzBzQTF2MXR2a2ZZNUZDRk1Q?=
 =?utf-8?B?VmN5cUtXemN5N3c3S2xLMVppN25xVDlUYXVxdFg1QS91SERzU09OUGJTZ01H?=
 =?utf-8?B?WDg0YzQwUThJQjU0TnpZM1lGMzRHMC9Ca0Z6RTlFZkJ0QTVQT2FZZklUTnYw?=
 =?utf-8?B?UUhJNThZOENYTkZOcWpURmozd0FuMXhGa3djREZkOEtxSHo5RXNFL1dSbUl2?=
 =?utf-8?B?dXpGSlVNKzBFZ1d1bUlpNXJoQWx4QkNzM21WaktwYUI0d1l3VlZXazBrczVx?=
 =?utf-8?B?ZElBYm9NS1dBeXcrekRuaWRacXFKSWJXZ2tyeVk5Z3pKV092aFVrNnhKMWhD?=
 =?utf-8?B?TXc5SXBZOVdYdmNuZEpDUXhRa0MySzMvVmsxR3RYUXJWb3NZMW9Jc0YvUFMy?=
 =?utf-8?Q?c2heAI7QK1Ip/A1UoEu3FuSUpJDK/dgQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGZYZHJkRjV0TjNoYUFoY0dIVE12Zk9tS0dUeC84MGI1T0Q4QTdOdXNTMlg5?=
 =?utf-8?B?SUdPb2o0Y2RxWVVDSUlYdjNIbnppSlpCSHlCZEEwZVFyRHF0cTRQSUFBbmZl?=
 =?utf-8?B?MlNoeEVlNzltMkVrK0cyV0pMOXo0VlNlTlZkUEhPbGZKMVRCaFJpbHhwU3Rj?=
 =?utf-8?B?UUtTdFROVFoxM1AwZVpETm1YSStzcTByN2VLemt2Z3VUV2VoT05uK251QzVC?=
 =?utf-8?B?cmU1S0tPRFZZTU1BbkNFQmxCczFZK1NpVTRqckttRkdSaXd3aHcyV0pzeklD?=
 =?utf-8?B?OHQrZ3FXWHNsZFZiL2NKZ3JIU3VGV2s2MXhSQjRZUEkyTEdCdkFWYk9YWkJM?=
 =?utf-8?B?K2RDR21lcXpKR093aTgxZE5XMkkzckl2emxtNVRRQUlKN3VuUkdaZERQbXJ0?=
 =?utf-8?B?ck5VZk9OVDlsQ0Z3QWhxT3dsVzJMMS9aRWtHb05sQWx5TXRGcURkWHkyQkxo?=
 =?utf-8?B?VEJHYTBNOHBTUjVSbkxkbGIwdWZkaytHSFYxWitkMVpQdnRpOTVPNTBNVlQw?=
 =?utf-8?B?NU0rOEViUWJSSEVNVGU1ekdFdWJBMmI3dnAxc2dQWXlpd21QK1hrOVV0WmE2?=
 =?utf-8?B?Kyt2VGJUQnpwRDI1bVhvVG9zYjNicnV3alppOG1nbFovTHRxQnU3MmcwWXFD?=
 =?utf-8?B?WnpYRlE3VkJGYTNiRFQ4RE54a1E4a0NuanoxaXQrcHV0VTJPVzI1UnVCRVhr?=
 =?utf-8?B?U2duTXcvTXZ4aytGMTk4WmJpc2FqREU1cUtlQU1XZlpoV0pQbWFrd0NUOW1o?=
 =?utf-8?B?TDNyZC9rZ1RLclc2YzYzQlN3YkxieEF6L1d3RE9BQzBBYTRnOVNWVStDUHFr?=
 =?utf-8?B?Y0hCOU0rWkc3V2RQNk5zaDlzbWsrYlAzQUs1MWl0aEZkVDJhTFh4L0NuemV3?=
 =?utf-8?B?N0F4SU5yNzZ1aTNTa1lORUI0ekRKdEpEeGZ1dFNna29EaWNBWDRJU2R3cjlO?=
 =?utf-8?B?S3RkemIvS3Iza1orR2hHOEErV3R4NDJxNWlJenV5LzBqRDc2dWE1Y043RExI?=
 =?utf-8?B?dGs5OEJMNWlPWms1cUk1NHJHbGgzVnJxMGVjK0xyWm5leEpXd2ZJckFCT3c5?=
 =?utf-8?B?MTFUTjV6TC9jZlJlRkhzSnFyb2pLZDErWVVkQUZwZGVJTnBQTTJtcmdERTU5?=
 =?utf-8?B?LzlFRDdNQ3o1NU9tWEc5NjdjOWQ1WStaV3krWjJZZzFIazhuYksxWWxQRThQ?=
 =?utf-8?B?Ui9oQTZHZGtYYkxlNTBQdFVHRjBlcC9uOTh4bUhXTjlIcFRuQjk3aldvYTQv?=
 =?utf-8?B?RlVVeDU3WnZSdlpzWk1lTlRDc3c2dnNJa0VITjl0cE04QndVVk13NHdrWVhI?=
 =?utf-8?B?UWV5ZmwzUXBUQ3BLZTVodUorVFVrNXZtUEJNcC9uUlpsUVN5dGp6N0JwakNJ?=
 =?utf-8?B?Y2tCVjM1bEtpWko1RWdpb2pQdi9XTjMrR0RiejUxU3dUcXpOL3dCdWZJVnlr?=
 =?utf-8?B?b0Q3QTE2K3crUkI4eXJuS3BpaFlUUExWb1N5VFlJY1pIOFcxOGE5L2dseXpN?=
 =?utf-8?B?SndNWEh4T1lwQ2l3cEJJU2xxcGxyRlBhbVdWYzhXQmhWYVdhWXo2bzhvNDVX?=
 =?utf-8?B?UGlsekUvbFlUOXBOMnBXNlAzOFQ1Q1ZlTjVOYTE5ZSt1VDNneDZtMXVwS2tv?=
 =?utf-8?B?SmU2NDJZMnB0b2kxQ2hsRHk2bXlGTkNPQUVKL0F2c2czOFczQjBEYWJlTnRv?=
 =?utf-8?B?Um1KVnhEeFBMZjVjSGFCLzd1Tm0wTUhPZHJqb3RyWFFNaXNQQ3ZPYXY4c2tJ?=
 =?utf-8?B?VzBCRXpMTjJoTEdzNzZUNXNlRVFMU3FRQWI0SHh3RXRwSkQ2OTd3OG5ONlNw?=
 =?utf-8?B?SEtNM1ZVM0x2UU9aYThRcExOeDF6dmhBSUIwS2I3MzVaSVdkaUZZd3ltRlI4?=
 =?utf-8?B?amdmK1BRQ2YvTjBZa01RMzc2WUVPQXZGalVMOGxYZWtGaXFBMmpUNVBGVUVl?=
 =?utf-8?B?Q1F5T09lTTFiQk5PUmI3NEZzN0dobU1jbFJwN2txL3dGb2ptRUhFdE41SzNq?=
 =?utf-8?B?dFZJeUlEWWdLQjN5WGEwMzl2c0N3TE1RMTZXc2crNUp1aVBUWU9ackRtTUU3?=
 =?utf-8?B?czlCTUJ5OUR6ZDZIaWd5YlZJZXFKSml6NFNFeHZoa2lBUFV6cmVac0VTUGtp?=
 =?utf-8?B?QW1KNTVXWFg5bWJkb1lFK3hacXlFV3NKc3RkMGZxUEJiVHM1QVdrdEN3UVg4?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4ec6c7-2946-4f8f-da60-08de3d753d2c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 14:04:48.2290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtISKS25/ZPZWKv0Vq4B2SsgbmVOkI10tKB1hbpKr9y3mKYqf33wc2YVVs2tvZ9n+y6cFjAnrwOt+sAd2pFq/aEc1+/AWAtj12yZ8RWc2lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6873
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

On Wed, Dec 17, 2025 at 10:08:50AM +0100, Zbigniew Kempczyński wrote:
> On Fri, Dec 12, 2025 at 12:51:09PM +0100, Francois Dugast wrote:
> > Use of execenv.array_size was ambiguous. Split into separate variables
> > to make it clear and to prepare to let user control those variables
> > independently when executing compute kernels.
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_compute.c                    | 26 ++++++++++++++++----------
> >  lib/intel_compute.h                    |  2 ++
> >  tests/intel/xe_exec_system_allocator.c | 11 ++++++-----
> >  3 files changed, 24 insertions(+), 15 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index e112e57b5..154318bb5 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -94,6 +94,7 @@ struct bo_execenv {
> >  	uint32_t vm;
> >  	uint32_t exec_queue;
> >  	uint32_t array_size;
> > +	unsigned int loop_count;
> >  
> >  	/* Xe user-fence */
> >  	uint32_t bo;
> > @@ -181,6 +182,11 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
> >  		else
> >  			execenv->array_size = SIZE_DATA;
> >  
> > +		if (user && user->loop_count)
> > +			execenv->loop_count = user->loop_count;
> > +		else
> > +			execenv->loop_count = execenv->array_size / sizeof(float);
> 
> Hmm, shouldn't be:
> 
> 	execenv->loop_count = execenv->array_size;
> 
> ?
> 
> When user == NULL, we have execenv->array_size = SIZE_DATA;
> 
> Input/output is then:
> 	{ .addr = ADDR_INPUT, .size = MAX(sizeof(float) * SIZE_DATA, 0x10000),
> 
> so additional division by sizeof(float) seems wrong.

Let me extend the commit message of the next revision:
- execenv->array_size: size in bytes of the input and output arrays
- execenv->loop_count: how many items to loop on in the compute kernel

Therefore it makes sense to have by default: loop_count = array_size / sizeof(float).

I left xe2lpg_compute_preempt_exec() aside but will fix in the next revision as there
are inconsistencies, such as bo_check_square() and bo_randomize() must loop loop_count
times, and we should have:

    { .addr = ADDR_INPUT, .size = MAX(SIZE_DATA, 0x10000),

We can also increase the value of SIZE_DATA (*= sizeof(float)) to keep the same loop
count as before.

Francois

> 
> --
> Zbigniew
> 
> > +
> >  		if (eci) {
> >  			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
> >  								   eci, 0);
> > @@ -864,7 +870,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
> >  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> >  	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> >  	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> > -			     IS_DG1(devid) ? 0x200 : 0x40, execenv.array_size);
> > +			     IS_DG1(devid) ? 0x200 : 0x40, execenv.loop_count);
> >  
> >  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> >  	output_data = get_output_data(&execenv, user, bo_dict[5].data);
> > @@ -885,7 +891,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
> >  	bo_execenv_exec(&execenv, ADDR_BATCH);
> >  
> >  	if (!user || (user && !user->skip_results_check))
> > -		bo_check_square(input_data, output_data, execenv.array_size);
> > +		bo_check_square(input_data, output_data, execenv.loop_count);
> >  
> >  	bo_execenv_unbind(&execenv, bo_dict, entries);
> >  	bo_execenv_destroy(&execenv);
> > @@ -1152,7 +1158,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
> >  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> >  	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> >  	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> > -				  execenv.array_size);
> > +				  execenv.loop_count);
> >  	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
> >  
> >  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> > @@ -1170,7 +1176,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
> >  	bo_execenv_exec(&execenv, ADDR_BATCH);
> >  
> >  	if (!user || (user && !user->skip_results_check))
> > -		bo_check_square(input_data, output_data, execenv.array_size);
> > +		bo_check_square(input_data, output_data, execenv.loop_count);
> >  
> >  	bo_execenv_unbind(&execenv, bo_dict, entries);
> >  	bo_execenv_destroy(&execenv);
> > @@ -1365,7 +1371,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
> >  
> >  	memcpy(bo_dict[0].data, kernel, size);
> >  	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
> > -				   execenv.array_size);
> > +				   execenv.loop_count);
> >  
> >  	input_data = get_input_data(&execenv, user, bo_dict[2].data);
> >  	output_data = get_output_data(&execenv, user, bo_dict[3].data);
> > @@ -1382,7 +1388,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
> >  	bo_execenv_exec(&execenv, ADDR_BATCH);
> >  
> >  	if (!user || (user && !user->skip_results_check))
> > -		bo_check_square(input_data, output_data, execenv.array_size);
> > +		bo_check_square(input_data, output_data, execenv.loop_count);
> >  
> >  	bo_execenv_unbind(&execenv, bo_dict, entries);
> >  	bo_execenv_destroy(&execenv);
> > @@ -1762,7 +1768,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
> >  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> >  	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> >  	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> > -				   execenv.array_size);
> > +				   execenv.loop_count);
> >  	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
> >  
> >  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> > @@ -1780,7 +1786,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
> >  	bo_execenv_exec(&execenv, ADDR_BATCH);
> >  
> >  	if (!user || (user && !user->skip_results_check))
> > -		bo_check_square(input_data, output_data, execenv.array_size);
> > +		bo_check_square(input_data, output_data, execenv.loop_count);
> >  
> >  	bo_execenv_unbind(&execenv, bo_dict, entries);
> >  	bo_execenv_destroy(&execenv);
> > @@ -1850,7 +1856,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
> >  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> >  	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> >  	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> > -				   execenv.array_size);
> > +				   execenv.loop_count);
> >  	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
> >  
> >  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> > @@ -1881,7 +1887,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
> >  	}
> >  
> >  	if (!user || (user && !user->skip_results_check))
> > -		bo_check_square(input_data, output_data, execenv.array_size);
> > +		bo_check_square(input_data, output_data, execenv.loop_count);
> >  
> >  	bo_execenv_unbind(&execenv, bo_dict, entries);
> >  	bo_execenv_destroy(&execenv);
> > diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> > index 8a3d7b450..28c1efd55 100644
> > --- a/lib/intel_compute.h
> > +++ b/lib/intel_compute.h
> > @@ -63,6 +63,8 @@ struct user_execenv {
> >  	uint64_t input_addr;
> >  	/** @output_addr: override default address of the output array if provided */
> >  	uint64_t output_addr;
> > +	/** @loop_count: override default loop count if provided */
> > +	unsigned int loop_count;
> >  	/** @loop_kernel_duration: duration till kernel should execute in gpu **/
> >  	uint64_t loop_kernel_duration;
> >  };
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index ffa4ec3f5..07ac6b66c 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2190,9 +2190,10 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> >  	} *bo_sync;
> >  	uint32_t vm;
> >  	struct user_execenv env = {
> > -		.array_size = size / sizeof(float),
> > +		.array_size = size,
> >  	};
> >  	float *compute_input, *compute_output;
> > +	unsigned int loop_count = env.array_size / sizeof(float);
> >  	int i;
> >  
> >  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> > @@ -2201,12 +2202,12 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> >  	bind_system_allocator(&sync, 1);
> >  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> >  
> > -	compute_input = aligned_alloc(SZ_2M, size);
> > +	compute_input = aligned_alloc(SZ_2M, env.array_size);
> >  	igt_assert(compute_input);
> > -	compute_output = aligned_alloc(SZ_2M, size);
> > +	compute_output = aligned_alloc(SZ_2M, env.array_size);
> >  	igt_assert(compute_output);
> >  
> > -	for (i = 0; i < env.array_size; i++)
> > +	for (i = 0; i < loop_count; i++)
> >  		compute_input[i] = rand() / (float)RAND_MAX;
> >  
> >  	env.input_addr = to_user_pointer(compute_input);
> > @@ -2214,7 +2215,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> >  	env.vm = vm;
> >  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> >  
> > -	for (i = 0; i < env.array_size; i++)
> > +	for (i = 0; i < loop_count; i++)
> >  		igt_assert_eq_double(compute_input[i] * compute_input[i], compute_output[i]);
> >  
> >  	free(compute_output);
> > -- 
> > 2.43.0
> > 
