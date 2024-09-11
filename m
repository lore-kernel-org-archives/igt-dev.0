Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DF0EE020C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 05:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B2C10E7B6;
	Wed, 11 Sep 2024 05:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Svd/IZ+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBA010E7B6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 05:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726031997; x=1757567997;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b0h8vzeaB4mldQiD4NjE3c45c7mdE8rcNU3FmU0Q60c=;
 b=Svd/IZ+psBbin7rV95NgfglEe62fVT5Cghqb44SA2dXCGFTU7FmIwKhS
 TpxUnJL38NcOY8+7v6kmZC0yEK2vLa0LI4erq/hzcSi1jda9VGc4wc972
 /UrjVOeDJzuUVzGNJt+jbnEFePcejeAYK0yxjwUeAStqaXpo+R6+VkOS9
 vf5TrjETroiZTsPNRLf6BpNBOyNopWD0aTMpGcwADQqoLZWUmKRlYYCCs
 jOli+wfCU0VNcDNBF64CV/zCMPwVFklgWiEJqDy9l+pd0R233gG4Fdo0u
 tSTUEzUYZ118ygcrC46PWkRxrgUTyGy9/nNW6FKJGgswp7lqHtYNxJ25u A==;
X-CSE-ConnectionGUID: fkEPw2y/TpKyj8LZANSawA==
X-CSE-MsgGUID: fq21JEpVQNOZp2v5IM4ogA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36190346"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="36190346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:19:56 -0700
X-CSE-ConnectionGUID: vmCGpZL2RGCFxRbMzWjkDg==
X-CSE-MsgGUID: QNJNyZzbTp61hB6yXHBByg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="71388330"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 22:19:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:19:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 22:19:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 22:19:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 22:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhPWKKTlEycF/YCavOK9AA1P7KpESHwauCTApMfHT0nn3OsmRnYfzChkomM+3P2bJDlGDtic1SIV3BIYnzMJc8dnOnGubnwsTAnD1abFPYv5V/CPyHregQu+p0CZUDqgcqPsKQs5FRX15XQryN1N4/xmT8MiFQkxqiMDy9g4AfKCwRyhcpl2TvuKOvB2hA/sajeF5ku6wMj9UgkzhwWVa+9jpb0zKm2fLDBE9+7eXx0bRPzDsuRnogjMThQLGE1Ib+hJ7W8epAD3HbtFd55qlBOJP/oQ5m9OpLMavD5MW59mjQpKr5VNrc3PVkb8corN1Sr9VjBWvqVqnUnd42ofWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0N+9+R09fOAI9/UGrZJPvO+mgTOz5zYaDpAhORMZK8=;
 b=MVUc017rcbc/O7wP3UEei90xm0lCr4DhQj8yjBU1VMb32+up8FrneNB0L/c9e7o07VMsLQGRbcXuB+59uNjdkaIly9E3MPPp+euJATJnLDhBjjAQWKEUxnU4IARPJKMAC9zrSA1G0x5R5y5hM+vQTFvglzJqZxJ0Vl/QqoaWJ9UH3rTLfO0WG4rQ8xI9GyE3jXmhM8huNBlDf17N6APulZx+9V/gdmI1KDPLPql5alaDhfBf0OKGN9X4gbD0cFww7VHXa3OKGClUZjDhklixJESkF6AX6SUqUNLEW2U15AAiLGtRE2c251+rthiXCTUjWwzG8wQn3IipPX/YQfzudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DS0PR11MB6351.namprd11.prod.outlook.com (2603:10b6:8:cc::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Wed, 11 Sep 2024 05:19:53 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 05:19:53 +0000
Message-ID: <0368307c-3c7c-4167-a122-8f27a7bc36e3@intel.com>
Date: Wed, 11 Sep 2024 10:49:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
 <172468301865.6014.9946879676247551400@gjsousa-mobl2>
 <82a8af36-642a-4747-b085-924c02e6308e@intel.com>
 <CY5PR11MB62119DD080EF001546D7D41C95942@CY5PR11MB6211.namprd11.prod.outlook.com>
 <172476290898.3066.9682588878616653824@gjsousa-mobl2>
 <CY5PR11MB6211B873C18594896BD21FA295942@CY5PR11MB6211.namprd11.prod.outlook.com>
 <44e18951-3b9d-4aff-a590-efd39e0a7a70@intel.com>
Content-Language: en-US
In-Reply-To: <44e18951-3b9d-4aff-a590-efd39e0a7a70@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DS0PR11MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd6d8c6-389d-4980-b1da-08dcd2215dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnpvV1pKdTQxUFkyM0FPSEFKK25OVWJzcGJtL0FsYk1INkhwd3RUL3Y3UkhM?=
 =?utf-8?B?cmpjUnhxRGRKa05BMnpJekRUWmVpaGFYN1ZDMnRMeVdFTDhYRXYxZENiOUpI?=
 =?utf-8?B?QWJxOFRFS2dvcGxZMlhaRTV5SmdKRWEwaXU3ZUQ5RVQ2cGswVzhlaDl1dG95?=
 =?utf-8?B?VjNyWHpzNjBNTmVjWEdINnNwU0ROS1FhbWU4TCs4VlVucE05V0tEdkRTbHNt?=
 =?utf-8?B?bW8xamowR21KS3V2UllvNEMxdUUvK2ZRY0FUTXJ4U25yVEI4dDNlNVNENUM0?=
 =?utf-8?B?YXh1L2xXbG4vbnlSNXBZOUY0N1VKNnZxVWE5YytZVkcwb1N2NEJsYklCUW1R?=
 =?utf-8?B?dDg4TlZaTUg1OW13ZW1yK3VQWkV2TFRXS0U2dVRCcmh6WmRQNTdKb2k4aDkr?=
 =?utf-8?B?Z3Vub0J4dkdQOHRVQVhlUzZ3OC9uQjZmdlB4L0YzWXhnN0dBczQyd0lLN1E2?=
 =?utf-8?B?ZTNxeGpmcXdCZjBsb1RNRUUwbDhPdG5pQ1ozQTdja2ppaW9RaGo5am0ySVBV?=
 =?utf-8?B?VWFOV21CQitrdnE0MU91UFhrSVAyempCT2lmcXRIVDdQdllwNzI5R0pzUHRx?=
 =?utf-8?B?U2JkRE9UYmZPWW1GcVBQVndCZy9wRDRqVUpkN0RpSXZuUnJGTWFkQlVXMWlw?=
 =?utf-8?B?S0ZNKy8rWXVhZytyRGJGN2tTdjdlUTluaGZMUUVwS0ZPUy9aNWVuMnVsZnJQ?=
 =?utf-8?B?OVF6TkNZMmdCZnIvOTBmWjZvRjFRTFJIMjNhS1ZsWEpZQzlXcEFRSkMzWUR5?=
 =?utf-8?B?RngrU1pwMmE4WEZ2QldLRytUeEFLaGxLRVRsQWV0TGhGOFZxeVNVbEhPT1Jr?=
 =?utf-8?B?ejZjeE5Pc1ZMMzlOUjMyRFA1L0x3cVJCRWZQY0taU2NuVm9PenNOc09wbTdQ?=
 =?utf-8?B?Z21qczFzVVlvMjhuWm1IK3lucDFLRDVpV29VeGI2amVxaTkxTFZwckgzMDRP?=
 =?utf-8?B?TEhaZ1o3Um0zVC9yRDlqUGVEcHFkYTZnb0ZuTHljTXAvbUp2MUpLakl1U1dE?=
 =?utf-8?B?SEhlMjNIeDJVWVh0VlJSMTdZMUVOYUV6WWhnR2tRU0RzRDU5SUxiM0pFU0p3?=
 =?utf-8?B?QmZsWVkvdDNILy9CdTcrck92M3F2S1VEY0tmWW9SQUI5bWJBTk9BNzc4bzBu?=
 =?utf-8?B?ZEN2d2o1cS9VVk1FMERXS01RUUphSlRlTktTV1BGcGR5MWVwMXpyZWE3eHJO?=
 =?utf-8?B?SklIRlhiUHdLOWU2cE42Q2NJMVZLV0t1VC9ETWFFT0dtaThYSmM1T2RPNW9k?=
 =?utf-8?B?cGR4dmhnLzN6K21WeG13cWUyc3dEUDNGem42WWNuV1cvMzJsUll2RDZCMWQ3?=
 =?utf-8?B?T1EvMm8vQmhyYTFKN0ZjMGRLUFkxU2QvTXpZc1p6L0V0T0w4UGVGYVRYWFlo?=
 =?utf-8?B?d2RKYVExRSt6RktTY1JhMjlvNXBPL3IycHBiMElpblFpWGtDbWM3NlZPY1k3?=
 =?utf-8?B?TFZzcUZTdTRnU2UwYXNHYXR3ekIvSmVHVkpmMkxaWlF1NE9sdUxvWkFQZmtn?=
 =?utf-8?B?UlFDLzczeFJ6ZUNTUDBESUJFWkFUT0JYbnA3M1J2WVJwTE1KaUkyaTZPbnFl?=
 =?utf-8?B?cVh4SVBrT3podFRQUlM2ejloSXRnSkNUWGFDYSsxTWI0aXVDTElvdmlIbUpV?=
 =?utf-8?B?UmpsZFlXZU5OR3VFdy9nc1Z4REZ3UWxVdU41ek5hdkZPajJlWU93NUttTFo0?=
 =?utf-8?B?bVVzaGxzT0NJWTNlR0M5Ynh4VzA1cnRKTGRZcytra1NrRVZnaXAvQW5ReUNt?=
 =?utf-8?B?ZTdlYU1UamhGdDR3WGxsc3NuYlBUcWhNcFcrYjRCMTFyd2RlOVh4cjRjTEw0?=
 =?utf-8?B?SmJSYXp1bWVBZm0zMVpjQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVpoeWIzQVZpWFhRYkZDejUzT0tnekpyZzM2c3ViSjFrd2FmYkxlTUlvUjVE?=
 =?utf-8?B?Sm1UN3gxRlVsK21FTDMwckJoaTFDdDdSTXErZVFYTTZRVDhQdzJoNXJudXB0?=
 =?utf-8?B?U0lWbmgremxrSkRnVHhVOEpLZVMxL01tYkNuWnBQTUFmek4rRUNaUFh2bGNa?=
 =?utf-8?B?M1JFMW55czBqUXhoOVlXWnpxRndURVpuRisxQTRQTWEyam5IeWZUdkIzVk5j?=
 =?utf-8?B?cFVhUzZQRS9sWFI2RVp0OEMxZXl4OW95TFQzbDF1UWNQV25udERpZjN1eWlC?=
 =?utf-8?B?NkhRNnViZGFCMzVndU5OOE5kZmtvNmlRL01QSndMTVNwWTkyQ1h2Uk9uajBa?=
 =?utf-8?B?dFdjVVpCdkJpK05lSTJ6QzZBWFBWRUtzRnhtRnpYQzV3QkJPMG1pVkRjbWlk?=
 =?utf-8?B?NENTOVdyR0FROFpqaXJZNmJlOXRra2t4cndBZmZNUVpoNnhGck8wNGFBOXFP?=
 =?utf-8?B?ZytpSlkrSFJwVkFCNGRpZjFnSUdLemRUUUozeEcvMkxtRmpZRUFCUUllaDhk?=
 =?utf-8?B?OFZrWHlWckZZSDUvcHlpbUJCajZXQ3BPcXdNSlZwQmJvY0thOTlxVE9vdThy?=
 =?utf-8?B?dUlIOERISkNIYy9saVk1VEw2cWZtVjFxWkdVMWVnU1EvSmVva2VYYzhmZG1J?=
 =?utf-8?B?NXM1bUJWQnk0ZTQrRXo5RVRXQ0liUk9XYmIvdFNKSGlIaENHKzNrRzNVM2Jl?=
 =?utf-8?B?OEgxSnZPVUhiL24zdmVpUS9YeERBcDZ0a1dPU3Y5YTJYSFB4UXpPNzF5eUlH?=
 =?utf-8?B?NHEvZXEzTVNKVWZGMHM1NFo1WkJkUnR6bHdDaDdWVWpkT2x6dFpJQlZxQklE?=
 =?utf-8?B?OTduZWxwdzBObyt0L043Z0ladnlUTmJmWmVDWm1hbE55M0J4dGplTGVpU1pY?=
 =?utf-8?B?bSt4TE5MNDYzUTFtS1c4WEJBSnJ2dWdDVHg2cTV4SHdOUEdsNnBaMkdwWDds?=
 =?utf-8?B?WE1aYml0cXpjZlo1azBaLzNObFpEa3hMUGdXaUVTeVEzaVdIaXFnSEtZU1hN?=
 =?utf-8?B?ekpmSloxSzRtL2RBSEZsWEpFTGpuV3FJMTc3QkhxSFJ0djNEVldkOEQ0VDgv?=
 =?utf-8?B?Yzk3d1MxbWFERmZTci9TclExanVuVnFkU0I1cEF2ZGVTcnJPTXNSdHFid05O?=
 =?utf-8?B?cnVrTDM5d3lsSGVmV3pHR2NDOXYvcHE2dFZxU0dDVUNFOHB5NmNUZnU5MFdv?=
 =?utf-8?B?YWp0VnlIZlFzOWFyRUNOeXlrbUhUK1A1S3ZscHRUb3krektSckRTaE5aKzZQ?=
 =?utf-8?B?V1BCQU5rbHI4cysyT1pSU0ZVZlppTUsrMzlhczRnSjEwVGRwVnpPWGdYS3k3?=
 =?utf-8?B?TWxudTR4RjZDWXlGNzhDQm9KS3c5aUs5ODVpUWNqQTVteWN5QktjaDFQT3dD?=
 =?utf-8?B?d3U1aU1JQWpLWUJsb0E3Y1RsbzdVVGtqbGF5QURKQlFCVlREOUxVWm9acEs4?=
 =?utf-8?B?SUdEbUM0NU00a2FkWVEwUnNYK2k2SGxEWHNPRk9BcXg1QzJ3SzZ2SW8rcytn?=
 =?utf-8?B?ai9BWXhQSVU4aG1yVnpvOEhESHVqRXVycU83Y01VTUFoeFBDbUVueEZuakVs?=
 =?utf-8?B?aW1rYmRGdjJWZmVVRjRFSUxOVXN3dTBERE5hQm5mNEdIa2RDSlkxTnAybHUw?=
 =?utf-8?B?Ly94YWZPcjJOc1RDbVhDT1dvZkI3dHRHUUJ0d0orVkNFazNKMDZNYVBhYmxV?=
 =?utf-8?B?d1IyY09DR1Y3aUY5MENLalMwcE03YkJvRlE1QmJCUXRHVFEvREZ4dUlyVjJB?=
 =?utf-8?B?VkdNT1dDVWFPYnZwdkZNbHYzV1U3Y3Z5ekpIdTRldkIway85N2sra2N2eUpL?=
 =?utf-8?B?Uzd2L29ZVWwrMkRXWUd6RjJ6RjBQenZGY0sxMENwM3cxM2c0ZDZGbmZaWDZa?=
 =?utf-8?B?eU1SMGx6MmFXd2dQTXoreHBsK3BvaVlaMTc2OGgyM3hLY3FTcnlsc1J0UkZN?=
 =?utf-8?B?M0RlZTJReVFxaFBwR2ZmQ2RMN1dzQ0p0KzZHa3lubld1R2czNjNWS0FQTlJz?=
 =?utf-8?B?NFNmSGxVVCtUMDI5dEJ2dFRJY2FWOHpqbGpPSHcrNkZ4UytDWFVtdXprZXQ0?=
 =?utf-8?B?RUVjeTdhZFdLR0ZDQWdwTWVXT1VJd2dWajNuSCtsejRBK3FoK09lSXJNUFFI?=
 =?utf-8?B?NXJTcHowOUc3M2VxTkhoNkxuMkdKeU9aYWl1ZU02d0RTaGh2RXhacGMxZk1t?=
 =?utf-8?Q?Kw6AL4itTw8RDjjRz4YVL1w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd6d8c6-389d-4980-b1da-08dcd2215dea
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 05:19:53.5991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCMnmSD2gxAETc7eLyLiN+5QQuol/qs2uziNMt9G4KJksAIWOQpjFrQzatfJImAQzmi1nJuKXGo+wIfB9VszjamBvxUjSCEdIvFXAYFhVdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6351
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


On 8/28/2024 2:16 PM, Sundaresan, Sujaritha wrote:
>
> On 8/27/2024 6:24 PM, Gupta, Anshuman wrote:
>>
>>> -----Original Message-----
>>> From: Sousa, Gustavo <gustavo.sousa@intel.com>
>>> Sent: Tuesday, August 27, 2024 6:18 PM
>>> To: De Marchi, Lucas <lucas.demarchi@intel.com>; Gupta, Anshuman
>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>> <sujaritha.sundaresan@intel.com>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-dev@
>>> <lists.freedesktop.org igt-dev@lists.freedesktop.org>; Piecielska, 
>>> Katarzyna
>>> <katarzyna.piecielska@intel.com>
>>> Subject: RE: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for 
>>> suspend without
>>> display
>>>
>>> Quoting Gupta, Anshuman (2024-08-27 06:29:06-03:00)
>>>
>>>> For s0ix DC9 is the pre-requisite rather then DC6, DC9 does not have
>>>> any depende ncy on DMC.
>>> Maybe DC6 and DC9 are pre-requisites for different S0ix sub-states?
>>>
>>> - BSpec 68851 says that DC6 is requirement for S0ix.
>>> - BSpec 68857 says that DC9 supports S0ix with more power savings than
>>>    DC6.
>> DC6 is pre-requisite for runtime s0ix with PSR Display On use cases. 
>> Which is irrelevant for system wide suspend.
>> Thanks,
>> Anshuman.
>>> -- 
>>> Gustavo Sousa
>
> Hi all,
>
> Thanks for the comments. So if I have it right the only final change 
> here is to switch the param to disable_display right ?
>
> Thanks,
>
> Suja
>
Hi all,

Gentle ping on the above question.

Thanks,

Suja

