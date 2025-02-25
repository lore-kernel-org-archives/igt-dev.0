Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97CBC021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 22:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803DA10E810;
	Tue, 25 Feb 2025 22:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiT+uNod";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9D910E810
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 22:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740523928; x=1772059928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ulG/nQ8zlCpabFeU2B8CqxPwtnHDp+9aIEBT0C33tJw=;
 b=TiT+uNodlLJ0+ZYo20Z7jhraLC4mPHl9Flyk4J1QrZKSQHmifsw0yDw+
 8mHzd9Pm0LjpvDUR6edtCL8tZzV4pzcaw8U5Ul80JjJCPz2pJzVl3e4U8
 w4X1O6qjFyc1kO0V2J2oYdgGlgLsH/NpuJP78ZqTZAXkCqkRmQqrhqrRk
 tv+wQuxkLYzKJWmm8JRbdQppVgb11SyfocERE4wRx1rUBQvlqHqsp72pG
 pdoRrj3KEZqlvxs8TI04tZmKQmEU2VADBZW+QHrz8sqdioe8UXcmUW51q
 HYXecibhgUtKNCN4R4fPuQKTZutY72i7Xui/7/zADdxrr11FTevy4I3ob A==;
X-CSE-ConnectionGUID: Sgdw5qjjRcWNvEJUEKgxUg==
X-CSE-MsgGUID: O3rzzUlNRYyKN+zyCZDCOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40536535"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="40536535"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:52:03 -0800
X-CSE-ConnectionGUID: Mls2SHdiRoeaghk/jGj0pg==
X-CSE-MsgGUID: cJNJBpzRTkKrdgdZKswonw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116304546"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 14:52:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 14:52:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 14:52:00 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 14:51:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNRP4W0xoB9v/HLaL+cmparHhSTnhHv8q0McXYTUz//GgB581LUV4ebTfT1JysL0YhFXMln3KQoPUSx5w4TkogEUVE3f1+Tcy5q92dlSKqGBUx0KEL0rS/cclxlT/3fCQm5uM2jZDweHDZtJaxoMXmDet54crfWuHWqf+7mWffImuM0Cl4lSYiYor+Ri0PXViliLJJvofdMCFOh5BcHkCcPrgXyqwcDNvJiYyR4vs3UqVuvqzQ3N7ylH6hQPsAz9m+ICpoXYI3uXvv4pgA1MhufIt/93pM77mnDqeOAV37ElP596geCGx4YguEk2ZXYz+NmQXfzSbrLuGnM5OGr7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CC9IRLdTVfMVLcPBK/lQQ2g2FKZ2U5PmXM2qdN4Cn+M=;
 b=HsDgyfUa1b9YeBOkfATAtoDokNtEOXvZJuzNYSUeDQDNh+xB+rqPaEMtIh/Tdx0ouVjhWa/wepcWJh3XD5OB6Z+afZqK0UGmsKkybEhMKdivpXclFMFC9ZV9axXvbuabGlDhtCf3euEkQQisxCYOph2tByBzdVohlPxTAFM+PTLtVlBmSb7VMZmU+H6brAAtMDJP5ZRxFypqHG11shHPwI6LwAjf4B4/pjWFllAAh5R0n6LpXf0jJnhku/HAODEAtGFzABRDGotX14tGDZ09HjVMDkqP2svNh9Etgm8jjuJdprI1P+AXHpptBOnf/pjYqzYXc1F+GrcUTX8ocn4ynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 22:51:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:51:42 +0000
Date: Tue, 25 Feb 2025 14:51:39 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 06/13] tests/intel/xe_oa: Rewrite the polling small buf
 test
Message-ID: <Z75Je+fEOfZEBpiT@orsosgc001>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
 <20250215010628.1639986-7-umesh.nerlige.ramappa@intel.com>
 <85o6yrjab8.wl-ashutosh.dixit@intel.com>
 <85frk2k5tb.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85frk2k5tb.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:303:b7::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 36308b82-bf07-47f6-be18-08dd55eef8cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUJhK3VSNWNzTS9jbWc3REMwVWhFcEdkdUlGTEdXZGdXK0llV3FJTzllRTBG?=
 =?utf-8?B?TG9oMUpRSDFFRWFPR1pob3ZxODFsM00zTWxPSy9VOEU4R0NGUEYvTXdsWVYx?=
 =?utf-8?B?RFhObko0aEJqaE9SbFhCem5HVXVucXAwaUpPSllMRXc3TytqOEx0bUU5SXRn?=
 =?utf-8?B?RGh0VGNGZ2FhaWJBUkZnYnJOU3NPeVhrall0eGYzNVNjNEJDU3NKblk1Slli?=
 =?utf-8?B?cUtHM0wwN2JCTFlzK0FScTVrRTVldE5hMnRqWEt4NEVIS2xZTThicHphdmFC?=
 =?utf-8?B?SW8yVUhZNU02akUvQWlLU3VLT0F2cWdrOG5jMkpUb2JVRXBXd1ljcTZQUi85?=
 =?utf-8?B?MnJ6RXJDbjRISDdOTXFPbkcrZW14eW54a05rRGxXcTk1UzA0Q0IxYmp0KzNG?=
 =?utf-8?B?NXV6cjdnNUJDNzhrenU5WndUQzVpUHlDelNZdEZ3NFp6cWU4azN6UWJSd0kr?=
 =?utf-8?B?NmhoV2dRNzh1NXNGbGUwdnZ0Z0NBRjgvbnkwZnh5OVVCL29kRGd5YlJVemxU?=
 =?utf-8?B?cTNqRTNiSnJkZFlVaTZQM1g3Ukd3K0xHZyswSzdraEoveGhXQkFQODFXbVY0?=
 =?utf-8?B?ZStwaGRoTTJZaWNUMk5zMXZHek9jRlh2SFdmQkxSRjVzbVFyK0pFUGQxKzBn?=
 =?utf-8?B?N2lvVmVXWEpHaThZeWQ0enpSUWZHb1lOeXU5bWhJSTEvRThuemlDNTFaVTcx?=
 =?utf-8?B?V0dWVDlUaGRFSWFROWpVcjlQYjZ0OEttRnVidEdEY1FaR1R1ZEZFUFpLZWxq?=
 =?utf-8?B?OTA3VDk0cUtqTkd3YVN3V3l1M0Q4UUpDT055UmlJT1lMamZYbEczQkc1S0Vy?=
 =?utf-8?B?dkh3Z0hFbVlkR0ZUTmp3bjZONHY1NG1VZm5aVWdIai9tSEVaeXhTb3NKcGVB?=
 =?utf-8?B?NEkxcDVRVm54L0FEU1dpcEUvcmx5Ykd6V1JzUGpoWVAzQWVhUldOU1d0K2tT?=
 =?utf-8?B?OWpEZVlacTRybnlCc0srbmJyZWJ4akJsOVJSb2tuUXJvM2hDa1FGaUNRbjE5?=
 =?utf-8?B?WXBwWDFiYVRpZTUvVzZ6TkJJd3p0b0VEYlMwblRCbFkxcFJrQnprZjM4ZGpl?=
 =?utf-8?B?T2FjSnE5UHREZlF4bkpTVm9VQ1lNdGVSOTZmNGpDQ1dwY2drWjh1aFVzWVU4?=
 =?utf-8?B?RThkZDhucHJlYWk0NVZzdzlKbzdvMHVjTVp1WGlvOW1vTVpCU2xNYmVQUFFC?=
 =?utf-8?B?OHE3czZUZzQ0aWFqUkxBanF0NHc2cjljUnZ0ZERhdklXK2RXSXIvbXc4YmJZ?=
 =?utf-8?B?NXVadTVQR2o3eWNkSUYxZFhMYmg2T3FoZG5GWjUyN2FLK0JvMFdxd3EyOXFn?=
 =?utf-8?B?UEZSUThzR0xwejZMOHFoanR5ZlV4Z0FxK3VMWkoveG9ITi8va1FjUnBOS3p4?=
 =?utf-8?B?bW0weVBXUUhoSDByVHNLSElLb0huSVUyd2hxSjlrNVVOeTZSUGtWa1krZTU4?=
 =?utf-8?B?SW5jZXBqbnZ6NFY0WkxyNDY0KzQ4Q1FBKzkwTlduOUFBd21JRkJucUpRcStS?=
 =?utf-8?B?L3BudkhYTkVkZ1p3WWNVTnZtTVpDeHliUjN5ZCtzK0NDemM2RklZWFQ1Ukpo?=
 =?utf-8?B?SDFOSUNVMS9GUGRqbTVqeFFLd0NLbk8xaEVtbEl0ZXd2bU5PYjhvc2IwN2t6?=
 =?utf-8?B?NlhIaUNGcWhWVUNHcStDcy9YUHN3YWFsTDE4Q0syYmtkY1VBR0RsN05TTW0x?=
 =?utf-8?B?UXV3QXpxaEdpS1RSRmZjbTVuZlh1c3hyZFB5QVdjTlZFWkZXU1JLS2E1VU5p?=
 =?utf-8?B?UjYxSndBQm1BUkpWZGNVL3ViQnBoUXIrRk9mZ1IyODY3U1FYbSthNURrakNn?=
 =?utf-8?B?SC9xd3hwV2I4NlF4NXk1R1J3Q1NIZWlyTW1IdmR3Wm5FcGlNaW5ab2dOVGZ1?=
 =?utf-8?Q?t44fbE2/H2TwY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGQ2SENWRGUrRlRuS1VPWTNpdlh5QkRraEd2T2hudUw4amVjR3djSm13aEE1?=
 =?utf-8?B?amo1REo0bTROanZWSllpZTlPMFJNTTlPTUpDSDZoTThYbVVNSWxrYnJEcXJ5?=
 =?utf-8?B?TC8rREZIQ1ZWZWRRd1p1RkhTVnh5UmtMSy9DVzdoaDJpUDM3Yk9CQzVUbmFx?=
 =?utf-8?B?cS83N1R6TVliTU12Mm12MU1MQXVMN0tDZnpRdkM0SlZUYVNUR2lVQk5oOGwv?=
 =?utf-8?B?ZkdJQ0d0blJ5L1Q3bU5yaDdLN2wrYmRGOUdLU0lEZkMweUtRVEU4SUt4ZmlB?=
 =?utf-8?B?SE5jY3ZvVWg0cHVzR1VSRGJQeWVnQXRIVElENzdyNWVkSWNaQ2FJVjNINnRN?=
 =?utf-8?B?c29jcm14WUxpOFVqTTN4eEZ2QzFCN3FNd3lZTlEvdHhaQW41bTF1bEFpdStS?=
 =?utf-8?B?SHpjaGM5cjZ4VER0b1BUMmhiN3laaTF4RU5RZHJzQ0Z5VG85MzlEYzE4OGpu?=
 =?utf-8?B?Y0R4REtVeDFMbTJxcXJYSU4zZ05iS0RFSG5aKzBwTyt3S0ZUT1Z5YWFwZzhB?=
 =?utf-8?B?eTZ5dlNLQXZqWTdQdDlaY2tSazVrT3VrdEZ4bHlKdlo4ZVgreFFLODRIVW5H?=
 =?utf-8?B?VE9mbjBnYVZ2TVlMR1V5TFc5NEtibFc4K1BXNlFFdXRlbkp0dml0cGRCMjdC?=
 =?utf-8?B?bG9IeUVQNUl1aTBKOStpRXBwM0dKVHhBbnNBelpZM25QRUZydU9oSEgvNlh5?=
 =?utf-8?B?bW9UV25rTzc2UWtPUjhudUNNblZjNGtyQVMxdGduaHUwMTdWNlQxUTNEbEUy?=
 =?utf-8?B?Nk1zNXZGZGhnSUJ2SXh4MnZpOTlDakE0ZUpNamx2Ky80czRyNWRiQjQrZDZv?=
 =?utf-8?B?SFFxWXk3a01tR0ZhdCtoL2lqV0Fwc3NsaHRTSnBpMWp4YWpqSlE4NXI0V2pZ?=
 =?utf-8?B?ZWh5b0FxdG53dnhPZHArazZTaDZNL1JEd2VPTmx2WU8xNHdJeml6L2dlbGdF?=
 =?utf-8?B?UUl5SEYzanJVaFV0OWh2MFVEdlgzblczL1FMOUJEUHI1L1lIQ2t2WWhVQmsz?=
 =?utf-8?B?c2R2MVBDWnN5SGUrQVRSQzNsRmNucjJ2MU50VHFpTHFNNFpkMTdjcmhGcHgw?=
 =?utf-8?B?aDM4TitFdUpRYUJyWHZ1MkVacXVjZGMrSXY4NU5ucmorQ1pqVGZ5eEZGakVC?=
 =?utf-8?B?VERaYW1vaVpLcms5VVBJdXRmMy9oK2lFbmg4Y0NUd21TWW0yMlA0MVZveTZW?=
 =?utf-8?B?VWNEVXhZQTQwdkFuSDJFamJsVDVGelhMUm44ZGRHWTRqM0RySFNBcDhYKzhl?=
 =?utf-8?B?cm14elB2VDRsSXIrQkEvNE8wcHA2dDJDK0hncDlOSHUwNnNPTkYxb29CRDN5?=
 =?utf-8?B?YlRFVjYxRmM2N0dia1FiUzZQcjdnc3Z4TDF2OHpBd0FrMld2THVPQkFvRjI5?=
 =?utf-8?B?ZTB6eElvN1NVc2prc3NtWGlBMm0rcGFzSDFWZldqRFFpYU1sV1Y3c0JHZ1dn?=
 =?utf-8?B?bFdLRnF0MmhwcDIxNkptRTZUNXdMa0JwZncxcGpVOWtYUXFzZjdkVUZENmxD?=
 =?utf-8?B?YTNWQzZ6K255ZnNmdnlKNjRjRU5qSE1jNXZuQ05iQ0FQL2NCdGJ4SHJTWTRl?=
 =?utf-8?B?elI1WExUMHA3a2tnaGZkVy9Fb2tuOWRzcWMyZDZvVDFSRFNoSE9zWXQ0MXBL?=
 =?utf-8?B?Rk41bEJnMTdseWd6T05oSEFDNmlqSDI0cng5WjJaSnA5QnIzZ01OcnV3YTI3?=
 =?utf-8?B?TUs0OSs3ajF3dHJ2dDNoTHQ0ZkViZXZjQWxPQWdyb0taRmp0Tjc1SEhHaVRk?=
 =?utf-8?B?Y3pwV3lHZWpBanFOSXFpcTA2R2VhbnlVVnZJMk50YlV5eWhxTVdmcU9NVDd2?=
 =?utf-8?B?YkJGdWhzaW1oRlpaNWdWNVBNelJCNjhHeWxhU09oeTVOL2FZcHBISWhxeXFB?=
 =?utf-8?B?dXR4bEFpemY0ZVV4aXFSTkRHR095RWZtYm9oMmtXTWI2RysvSjNsdlVVVHpK?=
 =?utf-8?B?T0laOVJCZEI0OGg2Tk9KY214cWZRMUJJNnVBeGZacmdZRDhTa3YvVERsSE9r?=
 =?utf-8?B?WDd1d2dQVUVidVZySzdRZW1CaGVTYVEybXlCaEcwaHNKK0FUYVduUFFlU1Ev?=
 =?utf-8?B?VDlJeTd2RVJFZHZ0alFKT1hHWjFkZDRob1FaT1lrd1dHdUZjZHBFSVFCV3Q1?=
 =?utf-8?B?RWtydjhrQ2QvZzdXUExIdmJ5VUNoZGN6TnQ1M2VlTlgxUVpEVWo5Vi90ak9K?=
 =?utf-8?Q?r/sT8laeAvOUpV2Od7bXATw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36308b82-bf07-47f6-be18-08dd55eef8cd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:51:42.3214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jPYUJgATpzLD3eDis2LbDy9xmTSffejmP46iyOdt0FCu8yLCepMOeivAjOWqKroJ56Ina7qJPNCyVkyZRma3rSyWA8Tr4ZIWifo+zkGJtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

On Mon, Feb 24, 2025 at 08:26:56PM -0800, Dixit, Ashutosh wrote:
>On Mon, 24 Feb 2025 14:56:05 -0800, Umesh Nerlige Ramappa wrote:
>>
>> On Mon, Feb 24, 2025 at 12:11:37PM -0800, Dixit, Ashutosh wrote:
>> > On Tue, 18 Feb 2025 12:28:04 -0800, Umesh Nerlige Ramappa wrote:
>> >>
>> >
>> > Hi Umesh,
>> >
>> >> Use mmio reads as a side-channel to determine if reports are available
>> >> and ensure that poll will return with POLLIN set. Then provide a small
>> >> buffer to force ENOSPC error. Then poll with a timeout of 0 to check if
>> >> POLLIN is still set.
>> >
>> > Will need a reason for doing this here. But see below.
>> >
>> >>
>> >> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> >> ---
>> >>  tests/intel/xe_oa.c | 64 +++++++++++++++++++++++++--------------------
>> >>  1 file changed, 35 insertions(+), 29 deletions(-)
>> >>
>> >> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> >> index aaf92308a..5792ffec2 100644
>> >> --- a/tests/intel/xe_oa.c
>> >> +++ b/tests/intel/xe_oa.c
>> >> @@ -2216,7 +2216,6 @@ static void test_polling(uint64_t requested_oa_period,
>> >>   */
>> >>  static void test_polling_small_buf(void)
>> >>  {
>> >> -	int oa_exponent = max_oa_exponent_for_period_lte(40 * 1000); /* 40us */
>> >>	uint64_t properties[] = {
>> >>		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>> >>
>> >> @@ -2226,50 +2225,57 @@ static void test_polling_small_buf(void)
>> >>		/* OA unit configuration */
>> >>		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>> >>		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>> >> -		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>> >> +		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
>> >>		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
>> >>	};
>> >>	struct intel_xe_oa_open_prop param = {
>> >>		.num_properties = ARRAY_SIZE(properties) / 2,
>> >>		.properties_ptr = to_user_pointer(properties),
>> >>	};
>> >> -	uint32_t test_duration = 80 * 1000 * 1000;
>> >> -	int sample_size = get_oa_format(default_test_set->perf_oa_format).size;
>> >> -	int n_expected_reports = test_duration / oa_exponent_to_ns(oa_exponent);
>> >> -	int n_expect_read_bytes = n_expected_reports * sample_size;
>> >> -	struct timespec ts = {};
>> >> -	int n_bytes_read = 0;
>> >> -	uint32_t n_polls = 0;
>> >> +	int report_size = get_oa_format(default_test_set->perf_oa_format).size;
>> >> +	u32 oa_tail, prev_tail;
>> >> +	struct pollfd pollfd;
>> >> +	uint8_t buf[10];
>> >> +	int ret, i = 0;
>> >> +
>> >> +	intel_register_access_init(&mmio_data,
>> >> +				   igt_device_get_pci_device(drm_fd), 0);
>> >>
>> >>	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>> >>	set_fd_flags(stream_fd, O_CLOEXEC | O_NONBLOCK);
>> >> -	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> >> -
>> >> -	while (igt_nsec_elapsed(&ts) < test_duration) {
>> >> -		struct pollfd pollfd = { .fd = stream_fd, .events = POLLIN };
>> >>
>> >> -		ppoll(&pollfd, 1, NULL, NULL);
>> >> -		if (pollfd.revents & POLLIN) {
>> >> -			uint8_t buf[1024];
>> >> -			int ret;
>> >> +#define OAG_OATAILPTR	(0xdb04)
>> >> +	/* Save the current tail */
>> >> +	prev_tail = oa_tail = intel_register_read(&mmio_data, OAG_OATAILPTR);
>> >>
>> >> -			ret = read(stream_fd, buf, sizeof(buf));
>> >> -			if (ret >= 0)
>> >> -				n_bytes_read += ret;
>> >> -		}
>> >> +	/* Kickstart the capture */
>> >> +	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
>> >>
>> >> -		n_polls++;
>> >> +	/* Wait for 5 reports */
>> >
>> > Wait for 5 reports or 10 ms ?
>> >
>> >
>> >> +	while ((oa_tail - prev_tail) < (5 * report_size)) {
>> >> +		usleep(1000);
>> >> +		oa_tail = intel_register_read(&mmio_data, OAG_OATAILPTR);
>> >> +		if (i++ > 10)
>> >
>> > So on slow platforms we might not get any reports in 10 ms? The idea here
>> > should be to not have any timing dependence? So if we want to wait for 5
>> > reports, just wait for 5 reports?
>>
>> Oh, I think the loop was stuck while debugging something, so had added a
>> counter to bail out in 10 iterations. I will remove that. We only need to
>> wait for 5 reports.
>
>Ok.
>
>>
>> >
>> > We tried doing this for the mmap OA buffer: see
>> > mmap_wait_for_periodic_reports(), the function waits indefinitely.
>>
>> You mean this:
>>
>> while (num_periodic_reports < n) {
>>	usleep(4 * n * period_us);
>>	num_periodic_reports = 0;
>>	for (reports = (uint32_t *)oa_vaddr;
>>	     reports[0] && oa_timestamp(reports, fmt) && oa_report_is_periodic(reports);
>>	     reports += get_oa_format(fmt).size) {
>>		num_periodic_reports++;
>>	}
>> }
>>
>> Well.. if your reports start coming in fast enough, then you would just
>> spin in the inner for loop. Maybe break the inner for loop when
>> num_periodic_reports >= n;
>
>Ok, but I was just pointing out that this sort of code is beginning to get
>in. Sai Teja did this.
>
>>
>> >
>> > So if this is done I am not sure if the intel_register_read() approach is
>> > needed (but I didn't think of doing that :). But I guess we can use it to
>> > see when there are N reports available.
>> >
>> > Longer term it would be nice to have a centralized function
>> > wait_for_n_reports(int n) or something like that which different tests can
>> > use.
>>
>> Agree, except that some tests will read the actual reports, while others
>> just want to take a peek at how many reports are available without reading
>> them. Since mmap is also a feature under test, I took the easier
>> approach. We can always refine it if we find something better.
>
>Can have similar peek_for_n_reports(n), which would have to use your
>register read method.
>
>>
>> >
>> >> +			break;
>> >>	}
>> >>
>> >> -	igt_info("Read %d expected %d (%.2f%% of the expected number), polls=%u\n",
>> >> -		 n_bytes_read, n_expect_read_bytes,
>> >> -		 n_bytes_read * 100.0f / n_expect_read_bytes,
>> >> -		 n_polls);
>> >> +	intel_register_access_fini(&mmio_data);
>> >>
>> >> -	__perf_close(stream_fd);
>> >> +	/* Just read one report and expect ENOSPC */
>> >> +	pollfd.fd = stream_fd;
>> >> +	pollfd.events = POLLIN;
>> >> +	poll(&pollfd, 1, 1000);
>> >> +	igt_assert(pollfd.revents & POLLIN);
>> >
>> > Is the assumption here that the kernel timer is firing every 5 ms (so if
>> > we've waited for 10 ms POLLIN must be set since the timer is firing every 5
>> > ms)? I am not sure if that 5 ms is uapi. Or is it? Actually I was thinking
>> > of changing that 5 ms time or changing the timer to a delayed work.
>>
>> But here I am waiting 1000ms in the poll above. That should be sufficient
>> for POLLIN  to be set. If not, we could set the timeout to a large value (a
>> few seconds).
>
>Oh ok, sorry I missed the 1000 ms.
>
>>
>> >
>> >> +	errno = 0;
>> >> +	ret = read(stream_fd, buf, sizeof(buf));
>> >> +	igt_assert_eq(ret, -1);
>> >> +	igt_assert_eq(errno, ENOSPC);
>> >
>> > This part looks ok, it's uapi.
>> >
>>
>> Note:
>> ENOSPC is returned only if the buffer is small enough that not even one
>> report will fit in. Initially I had a 600 byte buffer, but I did not get
>> ENOSPC. Instead I got 576 in ret which I think is the correct behavior.
>
>OK.
>
>> >>
>> >> -	igt_assert(abs(n_expect_read_bytes - n_bytes_read) <
>> >> -		   0.20 * n_expect_read_bytes);
>> >> +	/* Poll with 0 timeout and expect POLLIN flag to be set */
>> >> +	poll(&pollfd, 1, 0);
>> >> +	igt_assert(pollfd.revents & POLLIN);
>> >> +
>> >> +	__perf_close(stream_fd);
>> >
>> > How about just reading N reports using a small buffer for this test,
>> > however long it takes? N can 5 or 10.
>>
>> Not sure I understand. You mean at this stage of the test, read 5/10
>> reports? OR just alter the entire test somehow to do something different?
>>
>> I thought the test was specifically testing that POLLIN is still set after
>> an ENOSPC error, so I have written it for that case alone. The 0 timeout
>> will bypass the wait in the poll so that we only get the state of POLLIN.
>
>The original test, as I see it, seems to be just doing a lot of regular
>reads with a small buffer (1K instead of 16 MB say).
>
>But what you are doing here is also probably ok/better than the
>original. Let me think some more about it.

Just a heads up, I think prev_tail should be read after oa_stream is 
enabled, because BUFFER/TAIL/HEAD is configured on enable. Maybe I will 
read the prev_tail after enabling OA or something like that.

In the long run, I might just use the whitelisted TAIL reg to do that, 
so that it's part of the uapi and will hopefully work the way I want it 
to. Right now taking the path of least resistance..

Thanks,
Umesh
>
>Thanks.
>--
>Ashutosh
