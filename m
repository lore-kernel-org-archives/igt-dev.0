Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F81D2A551
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 21:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A3410E220;
	Thu,  4 Dec 2025 21:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Am7uLUe1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883D410E220
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 21:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764884559; x=1796420559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lkTaC94X5a7ike+WqYkWVZGJSbbMWVnPTOWEuw9axzo=;
 b=Am7uLUe19kbWZbuw1Lyfoxdcuz1Vo1JaZOEeQ5uJrl0DqeFuDE7ZFuNM
 oB3JXgEukclAcekZrCnwDj+66FpRTelKEOJt00Shumz11fJJ9oQO2VVsv
 i1rcbNslcQ4+VjlGWSbNVWq9oxUorKXijKaJRfYe2iUaQjgeynkvUI3x3
 PiCeMDt6vauvDxjfnkTDbZ0t1VZI8ODBEKLwv6EigrTFKNZieiSqrlOVc
 ipR5AzrhkXyzebcexBWranV1V1HUUyid6mKhgWcTk1Qn6pO8ZKkvQIuiy
 OTzdSSU48NnJfjiLEbZk7h5alHhSuiHEsmzpgzfoPgayTzlvBSU/LK2vM A==;
X-CSE-ConnectionGUID: cplG0oaiS2+GmPle4VJZyQ==
X-CSE-MsgGUID: VBOo8oEKTSWhW/jUeOrnBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66850519"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66850519"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:42:39 -0800
X-CSE-ConnectionGUID: qxVBol7cSuKJUnB5wt7X/Q==
X-CSE-MsgGUID: h74Xs1gvT8GoLEFai/JoBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="226060477"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 13:42:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:42:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:42:38 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:42:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmTdTmtWDIraZptPlo0NFdfWNn9J4NKs+uuA2Fkgt2ayme1FYotbNZm+5AmezxRSrnwLPxM92plRsZtM1lIfA/NOCiCP//7WiVS0JnutHcKZYDLZGQagimoQk52ZPJb3+gD/3X9kXuF1MQzyXRrNqBPz44DaKTjRsgKzPKhrbu7kXG0D9aOvzn6GQabeheeAkhV75K6j56dSwMRXqHlv0JFCDwIBCmXptVc0r1+d4R6lcupxRMlL8dYdWHMTpviLs5RgmRtLcVT+hvqOphgzrm35DIRY0HYZXXEF8k6E1+wXjMnkeNu5kOdRo6kTKFKHOOB+O8dUwCcORDIRvnbn2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSQ/cCnl4XY3MeVcEhd3Mgn1qkyPNnDbeWiBdkDUlQM=;
 b=obEKvg6CWTDKHYb2S/GPJbVMHQHvbtovUrIGAd1QiuG22ANC98WX0YJ49/UPcDkmGi5Rep7auNcQwHDGnKzY1dcJvf0lijrWX+YMqcEjH52RSfzQ18a7zToV20MNa5drHMyV1f7M4nItpSvDdku20/huNqaLw4oPcO9AtZmazSyk91fNtR1ky9QhfBDhxkN5pyoqVBbw14vBfUD46soeSDLCA6K7lutLe3AilmSn7H4GP42JG1c5ktTsw+MwA3ZFGq8yqPo5IoieW+uCAVRh+Zt3BlrLebQ3dRb6HZXno27JURtrDfw2gvnXD6SnlEKtspobyoriTTJGj2gjoIobSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SN7PR11MB8068.namprd11.prod.outlook.com (2603:10b6:806:2e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 21:42:34 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:42:34 +0000
Date: Thu, 4 Dec 2025 13:42:31 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 14/19] lib/xe/xe_spin: Add switch point for
 preemptible spinner
Message-ID: <aTIAR9boDHPtzkGg@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-35-niranjana.vishwanathapura@intel.com>
 <8cb0874f3e5bac4a8226b8d6cae25c21fd4acfd6.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cb0874f3e5bac4a8226b8d6cae25c21fd4acfd6.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::7) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SN7PR11MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b77d81-9d1f-41d5-96ec-08de337e08a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?yNqrhdvpkRu1L1l5NzrFMLWzYI8AKf5sa4E/aB8P72JlAJIfR5zFuIL413?=
 =?iso-8859-1?Q?i+UOId7T6/WJxFzAriIsYQUH2lbgVxrrBcCtN3Fvx0eZ8i9Wiiwb85x+mP?=
 =?iso-8859-1?Q?taSsPYQ7blrTc2yJ4zn/GqL2TRa6wLRBd7DQfsVAqsSWeO5jDKPcZpSH/h?=
 =?iso-8859-1?Q?uvQI2ZvIe/reCZki9eVADfRo7UwrSfzEyCK9cPGv8OdA9Dga9U7h+xjgqK?=
 =?iso-8859-1?Q?Q8ODaVzaLbxwfmsLOZcd7kLfecP4rQjmnBYVx3GCqFPSCEPkZc/wQQg/Hr?=
 =?iso-8859-1?Q?p26WJTpAFBle7j1UJuKMFs8lVNjiskhXb4C91lVMrej3RkNVpC3CmNRZlD?=
 =?iso-8859-1?Q?wTq+xTZFWHgPY2wEa7WHkNGGKAb6AmuEMiv1yIn6fZBC8Xy6QI6vEfCEDv?=
 =?iso-8859-1?Q?Wn0FKEk0Eks9syVlnLOz79rWh0uAf2w+b7vwU8KaIGWp+YdHGoYi0Cvlpv?=
 =?iso-8859-1?Q?XxKyWLd41t//X16H6gUy5rmBE1fB9Zuc5HjCMDn4lVz+25B99FrHBw8DRP?=
 =?iso-8859-1?Q?Wu2N9462/mNgLRGFzz4qP7EWDM/GWC0lW7N1ISjQ+cOmyCnk7iFTXl8xc7?=
 =?iso-8859-1?Q?555AijV0lFiClrpi1t15tXRskjsNioTxeL4wJmgqcgZr81/TomaOG6hRas?=
 =?iso-8859-1?Q?E/80A2XRs3ygtY4LXm+gT6CTNH3vo6/4f2E+4xmy8FP1jbXMOknoR+lVYV?=
 =?iso-8859-1?Q?Y18swKFbjvqiR3bOeLj8LbGu/ldS59wah6VJn5OArLPmN7Ga1/Ga74L/XY?=
 =?iso-8859-1?Q?F8Ie56u17Pbgd8nnwpIP2fbeLfkU1p5vMfNCRpqhwevMt2Mq0hxPlWhlIP?=
 =?iso-8859-1?Q?ccT7mCnwyi8EnWH0Tb/EF7zwSrQAzP3sI2jo5eMzrX3jXVI0eh/RHOhLuI?=
 =?iso-8859-1?Q?wrt0EBjf7qh0sjfTBfGwKNVDD8mdpc3YDVukpur60VeEEt39rwYo7qv2e+?=
 =?iso-8859-1?Q?LnV/QAgCGlzS/jl1Oz7yFqpkoniZzV7mLah142aqh+895eC5/D91bosLzM?=
 =?iso-8859-1?Q?Lx20XIdqEUfhi05nyVFucQ3A7QGEqrRv2k4twACbkylfTOeSirSCmZuOzb?=
 =?iso-8859-1?Q?NPVL1H4iy5UkBWGDp4FT3n/dk5mVMnM4OS2Z1UDj4n0SPoPzWxfcgR1lyT?=
 =?iso-8859-1?Q?iuhAw/6gZcAudX1jqpqwQbbjw36LirQRN8YtOuwLQaykHTeqjji31+w3rB?=
 =?iso-8859-1?Q?cxmSU5JBBMM3d6o/yWe9McARrg3Eg9ft+1srxrneZbLpHWY7G7i0h55kRC?=
 =?iso-8859-1?Q?AJsClub6LB0X5pVmkeZL+9S9o0Z8HP+lm4TP5sAhkExqYbTsJO84fUkpdl?=
 =?iso-8859-1?Q?cKIsxdlXQJ/ic6eLa+kHk0DTTOOyRmafrXni3bnvsSW6OuAUNY+GXmurRg?=
 =?iso-8859-1?Q?AJc/NV0Rl4xNpagAhFxjgcXdz2Qc1nZxC3XMZAOAtkukjJMrBG8Mrbz6TJ?=
 =?iso-8859-1?Q?cCzvVfdJZUi9tFXJf9KJ603sQ0cIzLwm2oH0YiaIRL3tk5fmKVD2SlaObC?=
 =?iso-8859-1?Q?HHduurWJgKCGH6+IVcpR2E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4jVRkmu/mTI0XbARJMwFDH6GyaITPlIAgM9i6GiyllyCNzTaMnAay624Qh?=
 =?iso-8859-1?Q?STQhyJStccneOqzy7fh8UPiRU7BVUg3cocuvP9KZhL5ByedCQOt52UIb9f?=
 =?iso-8859-1?Q?xNSWD4upbWrvOjssvQmcjCuPEP99uh4QtkXILAwjfl8rJdhmUzFTn4uOPf?=
 =?iso-8859-1?Q?id89cQdKmzDI4RXJKByRtoKlZLnLx4siSQjKSEbR7bKVNoHTBV2BXYqYSr?=
 =?iso-8859-1?Q?DBqvsvdIwIrLyBFNLltLiCMDOkSHfCvpDLzKDwNdmM0l6eJ+Q3l/JTNHUi?=
 =?iso-8859-1?Q?OcWdfTL1hKzhT+8pxLcTytsz0Hv5D+bLv9sq1o1RfmhmkP/BkJLie4JZmF?=
 =?iso-8859-1?Q?N1LtnUJDbltJ1cBtRjZbjkvsZkGkDRXjAXtVGVkLTdNjUGmaKtZ0RkKk5f?=
 =?iso-8859-1?Q?SmoZoj0QvsrowVAh/Ua0sRJvw99QPXNRamC1Z4yey8eVMJWn91UKc/iBA0?=
 =?iso-8859-1?Q?QNHVeKre1afku7V81+w3MyRP+9EaoFiS73HswUOui4UFR4AwvuiA/JZABy?=
 =?iso-8859-1?Q?q1XzV4RHj8j40X0R448b0EyZrE3y5rhBloAQOam1HCBzIE92Waf8C6CwtU?=
 =?iso-8859-1?Q?/Rrj6vvjEyTzS4cWjbaXUwD4uJYou1iaB89MeHzEODRdEYr5YMq9JOZS0h?=
 =?iso-8859-1?Q?mlcJ2FTffLaADvscGqfpJUXA5dcsbZAvM4vsSRaqQO/CgKXjMM8qJVqTLo?=
 =?iso-8859-1?Q?X83TBwe044LS922jChEXMCaCK3QBuGdiXQgBXhvgjRLAPwBydv2CvFU4YS?=
 =?iso-8859-1?Q?f13y1BZvCwYAgeNRWEZLbGx085SHi/pGIYRdT+B7BbKi6dBhCKyDIegI4P?=
 =?iso-8859-1?Q?4V61FD0PBCpgOMRbQehX+qQ+3Ti9vOtarLyLFqUFGuady11embV99VPeB0?=
 =?iso-8859-1?Q?wJU/tRE7E1DK9FYZY+uX0OQk9VlPs7anu5OLkb8NX+D4hU7f2sRRIotCSp?=
 =?iso-8859-1?Q?eeQIeNrecIuEBqGEI4zjh71d82kEep5fCRvyXt8eWow8ggyg2ahmkysyVS?=
 =?iso-8859-1?Q?pMilfm5QwBEtbRkRw7nxybFQT/SvmG7ypv9GwEcVqXf84IOkUi36/SfKhP?=
 =?iso-8859-1?Q?t5k38DzfXuLpnAdMB5FMxgzmCI+buZTm1MmLOP5cD5UA+3c5DSYOqyG2QJ?=
 =?iso-8859-1?Q?Urt4zzVq/Q1p7+UGaqDlYnVo70P8KCAIonzYaox3XzLdAQOP8H7QFBUO0i?=
 =?iso-8859-1?Q?brB6nleTB7BS4NXgtESO0ZKPenFBTfOTx2Y2+p837kaxuujYCcwmkF88lx?=
 =?iso-8859-1?Q?nLuBExuDGWkqXcYYDZjOy7fSw8VYShw7ztwNh9Gu7BHe1aSFfvuM55SpPI?=
 =?iso-8859-1?Q?g378ECHqq2v3ejQqE3APw2BK3xuyfr2qakl/oAcD1XuO+47cH5o0fQsFjW?=
 =?iso-8859-1?Q?vE79t0+T5Db7+EOwepxkRDZe97Oe95ltj8gOiXkYarM0QJqCnIZFR5uCK/?=
 =?iso-8859-1?Q?5UcuNRVJgAJZFLXW1CYBLvf2dFCc9s4kO2vDbrOs+6Xv6uNh5UMllGrM1l?=
 =?iso-8859-1?Q?cc5fWtJYV39kZbby4NEut3zc088C5hVhevdr0UhmLaWxNdzaZHl+hWcNjN?=
 =?iso-8859-1?Q?DbXbODo6BDHlYslpGWixt6xxK6Vg5EBmFzE8cF53EqaaumsbJOEZjREsGg?=
 =?iso-8859-1?Q?/aS3qndTbPsZymzgWXigQ52k3Fh0p+JLy5dJeeBQ8OmJ8sOPeSUbkikZPN?=
 =?iso-8859-1?Q?WqfnzEj6s/5lkEW3XoM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b77d81-9d1f-41d5-96ec-08de337e08a3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:42:33.8785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNO38aU3uw9bojyrs1/KFjlvNgxqVxnLaLLz+yo3RrzPqihn9BXLt+JBI1ErzimVMR1YVgMIkOCTSbhanIUY41oeDM2zmVZNMipm+UCNY/iZRzrED8SYoW9HuYbf9FcV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8068
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

On Thu, Dec 04, 2025 at 01:03:25PM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> When 'preempt' option is specified, insert a MI_SEMAPHORE_WAIT
>> command in the spinner batch buffer. This provides the switch
>> point for preemption to happen in multi queue mode.
>> Allow user to control preempt wait condition.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  include/intel_gpu_commands.h |  1 +
>>  lib/xe/xe_spin.c             | 41
>> ++++++++++++++++++++++++++++++++++++
>>  lib/xe/xe_spin.h             |  3 +++
>>  3 files changed, 45 insertions(+)
>>
>> diff --git a/include/intel_gpu_commands.h
>> b/include/intel_gpu_commands.h
>> index cd281ba89..5158bb0ea 100644
>> --- a/include/intel_gpu_commands.h
>> +++ b/include/intel_gpu_commands.h
>> @@ -123,6 +123,7 @@
>>  #define MI_SEMAPHORE_WAIT      MI_INSTR(0x1c, 2) /* GEN8+ */
>>  #define MI_SEMAPHORE_WAIT_TOKEN        MI_INSTR(0x1c, 3) /* GEN12+
>> */
>>  #define   MI_SEMAPHORE_POLL            (1 << 15)
>> +#define   MI_SEMAPHORE_QUEUE_SWITCH_MODE       (1 << 11)
>>  #define   MI_SEMAPHORE_SAD_GT_SDD      (0 << 12)
>>  #define   MI_SEMAPHORE_SAD_GTE_SDD     (1 << 12)
>>  #define   MI_SEMAPHORE_SAD_LT_SDD      (2 << 12)
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index 72b13ef42..174c5f7ec 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -57,6 +57,7 @@ void xe_spin_init(struct xe_spin *spin, struct
>> xe_spin_opts *opts)
>>  
>>         spin->start = 0;
>>         spin->end = 0xffffffff;
>> +       spin->wait_cond = 0;
>>         spin->ticks_delta = 0;
>>  
>>         if (opts->ctx_ticks) {
>> @@ -167,6 +168,24 @@ void xe_spin_init(struct xe_spin *spin, struct
>> xe_spin_opts *opts)
>>                                    opts->mem_copy->dst->mocs_index;
>>         }
>>  
>> +       /*
>> +        * Insert a MI_SEMAPHORE_WAIT_CMD instruction with condition
>> controlled
>> +        * by the user. It also acts as a queue switch point in multi
>> queue mode.
>> +        */
>> +       if (opts->preempt) {
>> +               uint64_t wait_addr = opts->addr + offsetof(struct
>> xe_spin, wait_cond);
>> +
>> +               spin->batch[b++] = MI_SEMAPHORE_WAIT_CMD |
>> +                               MI_SEMAPHORE_POLL |
>> +                               MI_SEMAPHORE_QUEUE_SWITCH_MODE |
>> +                               MI_SEMAPHORE_SAD_EQ_SDD |
>> +                               3;
>> +               spin->batch[b++] = 0;
>
>Should this be set to spin->wait_cond in case we ever want to change
>the default value here?
>

wait_cond is already part of wait_addr. So, user can control the
wait using xe_spin_preempt_wait()/nowait() functions below.

Niranjana

>Otherwise generally this is a great addition to the spinner toolkit:
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>
>> +               spin->batch[b++] = wait_addr;
>> +               spin->batch[b++] = wait_addr >> 32;
>> +               spin->batch[b++] = 0;
>> +       }
>> +
>>         spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE |
>> 2;
>>         spin->batch[b++] = 0;
>>         spin->batch[b++] = end_addr;
>> @@ -207,6 +226,28 @@ void xe_spin_end(struct xe_spin *spin)
>>         WRITE_ONCE(spin->end, 0);
>>  }
>>  
>> +/**
>> + * xe_spin_preempt_wait:
>> + * @spin: pointer to spinner mapped bo
>> + *
>> + * Make the spinner wait on the preemption semaphore.
>> + */
>> +void xe_spin_preempt_wait(struct xe_spin *spin)
>> +{
>> +       spin->wait_cond = 1;
>> +}
>> +
>> +/**
>> + * xe_spin_preempt_nowait:
>> + * @spin: pointer to spinner mapped bo
>> + *
>> + * Make the spinner do not wait on the preemption semaphore.
>> + */
>> +void xe_spin_preempt_nowait(struct xe_spin *spin)
>> +{
>> +       spin->wait_cond = 0;
>> +}
>> +
>>  /**
>>   * xe_spin_create:
>>   * @opt: controlling options such as allocator handle, exec_queue,
>> vm etc
>> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
>> index c2199d0aa..eaf2a409e 100644
>> --- a/lib/xe/xe_spin.h
>> +++ b/lib/xe/xe_spin.h
>> @@ -64,6 +64,7 @@ struct xe_spin {
>>         uint64_t pad;
>>         uint32_t start;
>>         uint32_t end;
>> +       uint32_t wait_cond;
>>         uint32_t ticks_delta;
>>         uint64_t exec_sync;
>>         uint32_t timestamp;
>> @@ -76,6 +77,8 @@ void xe_spin_init(struct xe_spin *spin, struct
>> xe_spin_opts *opts);
>>  bool xe_spin_started(struct xe_spin *spin);
>>  void xe_spin_wait_started(struct xe_spin *spin);
>>  void xe_spin_end(struct xe_spin *spin);
>> +void xe_spin_preempt_wait(struct xe_spin *spin);
>> +void xe_spin_preempt_nowait(struct xe_spin *spin);
>>  
>>  /*
>>   * xe_cork: higher level API that simplifies exec'ing an xe_spin by
>> taking care
>
