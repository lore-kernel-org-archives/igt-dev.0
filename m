Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4AFC52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 08:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DA610E12E;
	Tue, 27 Aug 2024 08:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsge3jnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7599B10E12E
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724746330; x=1756282330;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=B7FyPz5fV8Aa4PuPkyLCNLRg5z/0L/52ehjQpex2an4=;
 b=gsge3jnRQqjFAa8O/F+MXl7jMn+kE8uNEvB8WL+OuCehdaI6iK8g64nS
 /YyOF14Yti1lmcI+TC3Q/AA+Q50fUR3EAG/qNst1qqP3UzWyXwa+1RZVO
 O2h8m2avd7swfa7wr8l+Isz5hWKqG72OwYpXqZhAjYyjqKY2LqyKcmcXd
 ID1BFEqRTg7MSCXBTlZqwZuJiZRsaeZc09N45/WO1EFux26PmtCdPEfUp
 bxw6H2vzmZY8/vlGO2Ac2dbsH+0N8XljaOD5tDrTyuC/iv+eIkWAc34z1
 NNlsh7HETxT5+y1nLA22912TY1Mk2vkC0HBgl8irHGjfLVPOXjQtRSThJ g==;
X-CSE-ConnectionGUID: i6I2T8wzQ+iZavtYmyBDGg==
X-CSE-MsgGUID: eOJhuPgHTXSwJ1g0H4f5NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23387053"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208,217";a="23387053"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 01:12:10 -0700
X-CSE-ConnectionGUID: Rl6MOMZLQjilplN6JvtRfg==
X-CSE-MsgGUID: AoHMGv+PT36BjLjMTKpr+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208,217";a="67480591"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 01:12:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 01:12:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 01:12:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 01:12:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 01:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kv5CHTayUFjqWTRso7cdjbsoILto1kFZYBJr26NiS8OjbVu6UkcQnGXAn57bwv6azjrkmaiy5xUKDBUPht2jgzyZpI1w7robZplW8uhieNmuwega54MFdLI5J6IWFDLINFDeaQjI02moZK51/pK2WUdzff50k/d3i80Wjwf9Nv8wLD3CuzCyU1qEV9bpIfWkdvajdSpLwpS86yIh7LCXriLryGCq3D+xrNnYHcH2eVbnMUBobyOyk0TpmLbhJ31wYL5n3e91Is2/5xWM7FnTpFkJyTlp4SxsiLQYi9i59VC/djlVujUNAnZxTDqQgzp4su5xLR4pQISCjLR802AgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaCF+3e0uwJ/X9COdidAGVkIz/Rd2EjzzhpSWTUfmJ8=;
 b=hlAr2ogNWUAuQHmEhPILNaXkVy23b3ZWzJELaSmbHOitGgpuo8gSC7LOGz/erfmtgAm1Z90INFjkTSu2rCgErB3no2e8WvSVGTfJwNxIUFF0ve5oTGXqYxDfyeb+d1Hod/5W5bkjLL7io6TErnDU1heDIrI2GVN7nFbLq1qS0Bae54+XEi3wHrBcLhLw3k+aJD/W2QFrJICPuOOJ4Eto+iorFiwJQMseFTl/887StqtEWKazxdtjNOIdN+5rO1uKiyj1eBD6Y967lT33SqEGPgRHhpTn5Z9TZgOmh+upCxVMIo8McaTceOSssrLmkNHDpYdGtPk3IYtcoppGRyrYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH0PR11MB4983.namprd11.prod.outlook.com (2603:10b6:510:40::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.25; Tue, 27 Aug 2024 08:12:06 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 08:12:06 +0000
Content-Type: multipart/alternative;
 boundary="------------ZDsv3lshI0hVoWrEEmqG2P0E"
Message-ID: <82a8af36-642a-4747-b085-924c02e6308e@intel.com>
Date: Tue, 27 Aug 2024 13:41:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
To: Gustavo Sousa <gustavo.sousa@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <katarzyna.piecielska@intel.com>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
 <172468301865.6014.9946879676247551400@gjsousa-mobl2>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <172468301865.6014.9946879676247551400@gjsousa-mobl2>
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH0PR11MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1ab203-09a0-4815-45b5-08dcc66ff090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFZRTmtPTEwyTWpiQ1BQR1RVOVdWYjFtV0VYVEJ3UG1wbWdUcEp1ZE9kSmtz?=
 =?utf-8?B?RmYzUGVNWDhJTUlIdGpCc2lBN3diWWtaWTlxWDJaNFZRNzdPQmR3UG43eVFP?=
 =?utf-8?B?RVpIUXNxZHdudElLM1FNZjh1dzhhRTRoWlAxV1VFaEZtbU9qeCtMTEp4SDVv?=
 =?utf-8?B?cHBOZTlIYW5MVmpDaWJ5Qms5QnYyVThIMG1oRVJYbzBGOGJCN0VaM2YrTHVz?=
 =?utf-8?B?TGhzS0J0MG5UdnA1ZXpBWUlSSS9QalRzVHAzeXBIekJNSjBLQ1F5UGUvYUtv?=
 =?utf-8?B?c1AwSUZ5NUJBbGJ5cmVUc1pWOEhlcVZ4WldTMWNoQ1JaNlNYZmdvbnkwRVZC?=
 =?utf-8?B?VHZrVVFNd01ma1RER0ZMaGRmbjhxbWFNUjhrUzFlQmZXTmJuN3BRVmViUG1X?=
 =?utf-8?B?c1hydHdxWHFRZHZGMzVUelBPc2NPb1N2cHRaZlQ2RGc1VWErVW9veTVVa0xi?=
 =?utf-8?B?c3pPVERDVnJmTldmV2ZnZ20yTWxBdWNPTURzb3ZiZnhrOThQeFluc2xoVXM2?=
 =?utf-8?B?OEpKbjlqaGpQbjM2ZGlNSHdqVnlNY2ZmdVB3cHNDQ3EwaWFsVlFXMTRreVBz?=
 =?utf-8?B?RW40cFh2VC9yT1pwTzRxcVpTUk9TQ1FrbWs1MVdRTXh4Z3lIWFFXRWxDWDBs?=
 =?utf-8?B?Ymg2Ym5NQkxDMVA4azNkTDBmaVVKMUx4b3ZtVUxQaFpOSnltT0pEbFVTdEpZ?=
 =?utf-8?B?dHFsV3FiU3VUdUwvMHROL3J6cERRR1BuL0R3OUR3MTNNak5JaVVwbUNrWVhC?=
 =?utf-8?B?cnJEczRTU3R1R0VjYzhONG5yNWgyUk9NQ3hvOGtvWjVTQmpncElDUEtOY3Fx?=
 =?utf-8?B?MDRDK3JZWUN0L3JaaURKRUR2aHVjVm9HYjdOUXNWZXdvbmJvcWpoZDZjVjlJ?=
 =?utf-8?B?K01aZXNRUUNjdWoyYlRSbXoyYzhWVjZoR1NBNW9WMnJZMXVOMGZZdjMwc3JX?=
 =?utf-8?B?YnFzR1EzTnh5RnhhdkdHc0ZaVU9mTUR1eWZBZkoyWksrSVpQMGNkaHJ3amJx?=
 =?utf-8?B?cFZ6bTVoRTB3M2U5VUlEalJRQ293WFVnS2l1cW5rNlNpSXRMcmhMNmVsMVdU?=
 =?utf-8?B?SjRCTk9wdFRtZWhDcDBYZXFLUGFEZE1PU2FrbUtNUFdJREJWeGdvaHFrV1JJ?=
 =?utf-8?B?S3dXbEY0dlVXTmpSRXUxZGo2TTNDSHZ3RytiRTlSd0d4MnBKc1NpQWkxVE12?=
 =?utf-8?B?ekhuVUJxTnB5bHN3eFpQSXhSenprUnQ2QXpFUlZ1VUJGYldJVFpkUHloZkVq?=
 =?utf-8?B?WEZkV0tLcDVHc0I0SmdmSG5KQTBrN1k1YlQ4MnVXZVpwc3lwZ2gwbFVUQ1d1?=
 =?utf-8?B?YkpkL3lKQ1Yyd0dTRFVWZWd0RHJTK0l2RTYrdEtuRlN3Vm9taHZMV2VMb0FH?=
 =?utf-8?B?QUtsNGRPNXZGVkN4K1NnVlNBQUZnd2VYMlVFWWJoT0c3ZjBPaUNmbnkxQk5k?=
 =?utf-8?B?WTVnWHA0R3lJWnZCaGhxOGxvYW81cW1LQ2w2SW9CbzlSdzRYOTQwN0cwbWRS?=
 =?utf-8?B?WWVTVVFldENsUndzTnp0alphVkRoZWNwTXUySkk3cml5em45VlZSb2VpL29j?=
 =?utf-8?B?WFdwQjVXKy9hRWgzbDI0ZTJIYjdJU09DcnJ1a3FkWFNwNlJYQ04zUWRDMnFN?=
 =?utf-8?B?TkhHTDBZQ2pQYWgvVThuUkNiZHQwKzd0alhFdzFHYmYrQzFCekx2eDlkNFRI?=
 =?utf-8?B?VmRwaERYZ1MwSHBTY2Rvb2RjdDk0dkFVRUY4YythVUJEbWU4NFFPb0p0T0li?=
 =?utf-8?Q?JEFSzvuWIPkqeAcnEs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFhhVzZNMG1va3B5bzExZFNFbTFjTjdyTTBSQm9iTUkzWm4rSUNTZmVpNjRG?=
 =?utf-8?B?QWZhSHZpcDNZY2tERXBpVjdYZWtSKzd0NnlmdTRQdDEwZGptQis0am5xcjVT?=
 =?utf-8?B?ZG52SVRaQStCaXpUTWZKekY0aFhiOWVYYUp0R3NJREsrMFpKQWlld1o5OW5D?=
 =?utf-8?B?TEczUmFWdjc3MmFqbzhEQTRQakRJUGFxWHNDOGtHVHRXRnFBcFhHZU5QVm83?=
 =?utf-8?B?SHRwdVNBT0VNdXVMWWxCeFRLR08wYnRkaTlyZ1FMZ2tHakVZYzJnQlliMlNP?=
 =?utf-8?B?QmxUeUFqVGt0MFBJQmRkUWtOalBiSFo2MzBHVmVZdmorZVNSUG5CVWNSVXFQ?=
 =?utf-8?B?TmFKZ0VsV2hOcW9DYmFXaWJNTUJLN09lU0U2OUN2b2ttM1o3cG90UlRnOGdD?=
 =?utf-8?B?UjJCZ0lMZU42clFHUzFXUkNiR0k1d21tNDMvRjA3ZUNoSE5qZ2FRVG1XNUpl?=
 =?utf-8?B?VTJkVGJNWTN6c0ZtTFdVUlJ5MXpYdWpUK2plS2ExbXhoNGYwSC9IQjM2OG9K?=
 =?utf-8?B?REVuZlZrYUk3dXVWTXJacll5eXYyTUlKelRCL0JJdG94eHBHaFIvQjh6WENB?=
 =?utf-8?B?Z2VwMkhIUXRJeDM1UUF3NEdkNEZ5TmtWYy9iNzVVc0ZPWS9ZemJzTWt5L0l2?=
 =?utf-8?B?YXFRck41RTlSTy9SQXk5Vk1Rem9WazBlbTNwVk56ditxQlVZRUR1S2VSdSty?=
 =?utf-8?B?b1R2ODEvNjlBaUgrSWpZUEpWMDZlT3FOZ2xaeHYwb1JRMjI4cDErVVpvTmpE?=
 =?utf-8?B?ZVJiRVRyQlNSeDRUSDZBaUErR0pvQklxWEdhejJUVTBHS2dLRnU5R2JUbWVJ?=
 =?utf-8?B?bTB0em9jWGp1N2hwSktTQXpPSXMvenlDTWQ4ajJkVkp3dWpyVHRYYml6K2VD?=
 =?utf-8?B?cUQwcEt1YmNUZ0tjQjVsZ3JZd290WVNrM0ozeXBCUE9MdVptZExWNStSaXk5?=
 =?utf-8?B?Mko4dGMyWGJXaElwOXhxejluNmlXSnd5YU5TNHV3ZzNGamhpajU2UEc1YXlO?=
 =?utf-8?B?cklUc21mMDNubUhKL2RRZ1o3WVFzU2gwZit4bzBramE1c0RXYUFHVXN6NDBj?=
 =?utf-8?B?Y3N2QVJ2Q1lsQkVGalJldlJoT3lUUWNQeENLRVRjMFNvZVNqcTdxU1oxSnlv?=
 =?utf-8?B?YlQ4WHE4MktZcGRTemkrR2k1V3c2U0xIVlR3bHVSaHcrVmRhS00xaWxLMVBR?=
 =?utf-8?B?d3I4QkdvVjQ1aWJWWnYxcjBOdUZNT242U2ovTnZKdEgrQmtXZ3FvaDZoTFZT?=
 =?utf-8?B?bmFCNjRUNXI0WlE1QWl0azZaTkFvdmpaMTRVSGlzN016OCtsUERQa1d2Sm10?=
 =?utf-8?B?eUhKcVNHOVIrVUVYNjY5czJrSWs3Y1pUQWNaZ1h3akxtSUNzUzhiVFY0aEda?=
 =?utf-8?B?YkFYd2xsaVBIYzRJMWdoSFB2ZWEyTVAvRy93d3VraklZNXlTWEdEeS8waDBE?=
 =?utf-8?B?ajhZMURRTU9TTGs3Vm5XWnFReHRNbkF1ZTkrSGVmNmRXMFVPS2hVWE5kYTd6?=
 =?utf-8?B?MGl3dU9LaFlHT1hLanlyRUhqQmR6OXI4YWd3VHFTcUVCMjI3YS9YTHZNcHpT?=
 =?utf-8?B?TVJ0OXMyWk85dll4ckNJQnlxTmdRQ1VWY3k3S2JWemFIa20vcFdrY051bU10?=
 =?utf-8?B?TnpoNEZHWTBmODRnR2IzcUJnVmdOVmg0a3N2QU8zTlhLaE9memRIcHJ3eEhj?=
 =?utf-8?B?Sjk0WGNOYlduaGt6V0pNdFFuQ1ZwcCtibFk3eDgxVHhrUk03TVo5a3g5bXdG?=
 =?utf-8?B?dXlRUW96WmJibGJsZTVWZTdEWHNKMW9vdTczWEdra2dNL2lQNmttZnNhcFpQ?=
 =?utf-8?B?Y1A0K2x6M3lveWE0NXNZd0I5VC8rRzA4TG5maXhsNWQreFRqY01DSnAzQWRZ?=
 =?utf-8?B?K2ZBdE9QSXJ1a0JmWTF3bE9Pd2xUd1VXMzZnbEllQkVwd1prUnlvWW5YVGNQ?=
 =?utf-8?B?ZHlURUZ1R09xWGpUeEk1eEFoVXg1S1g4Njgzclo4T3V6ZnFRRkNqZ2VDYUQy?=
 =?utf-8?B?ZmlPVExIMFZDNDlCZ3RYQnl6aWo3ZFhXazBNSUF3MFhjbzc1YkdrWVQ0YWp0?=
 =?utf-8?B?SkplcHE2U01ZNlE3MTRhUXU4UjZiNWVoUFdHMXlNTkFtWk9PMUNocU5SeTE4?=
 =?utf-8?B?T0FmV0dmK3ZBd3lyc1NuSjduczR3N0ZCL3FwOXBtN3RmRmxxZi91d1lIT1lF?=
 =?utf-8?Q?RAMsR9KygWztSjPIdbB/444=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1ab203-09a0-4815-45b5-08dcc66ff090
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 08:12:06.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybW6sVzeuvOnTCRznt7UyW0yihBLzuDynL9IldhrIQrbmxs53xp6KNW9AnuXv2ynk501dVo1MpdxRb2kS32kEh4StvKSQsgjTg3i0ozW8I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4983
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

--------------ZDsv3lshI0hVoWrEEmqG2P0E
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/2024 8:06 PM, Gustavo Sousa wrote:
> Quoting Lucas De Marchi (2024-08-22 18:01:19-03:00)
>> On Thu, Aug 22, 2024 at 02:45:15PM GMT, Gustavo Sousa wrote:
>>> Quoting Kamil Konieczny (2024-08-22 13:52:43-03:00)
>>>> Hi Sujaritha,
>>>> On 2024-08-22 at 14:50:58 +0530, Sujaritha Sundaresan wrote:
>>>>> Add tests to validate basic execution suspend/resume cycle
>>>>> without display module to rule out display related issues
>>>>> from the suspend/resume stack.
>>>>>
>>>>> v2: Add normal reload cycle after running test (Anshuman)
>>>>>
>>>>> v3: Rebase
>>>>>
>>>>> v4: Change commit name/header (Kamil)
>>>>>
>>>>> Signed-off-by: Sujaritha Sundaresan<sujaritha.sundaresan@intel.com>
>>>>> Acked-by: Katarzyna PiecielskaKatarzyna.piecielska@intel.com<Katarzyna.piecielska@intel.com>
>>>>> Reviewed-by: Anshuman Gupta<anshuman.gupta@intel.com>
>>>>> ---
>>>>>   tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>>   1 file changed, 34 insertions(+)
>>>>>
>>>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>>>> index eee89428c..1623a56c7 100644
>>>>> --- a/tests/intel/xe_pm.c
>>>>> +++ b/tests/intel/xe_pm.c
>>>>> @@ -17,6 +17,7 @@
>>>>>
>>>>>   #include "igt.h"
>>>>>   #include "lib/igt_device.h"
>>>>> +#include "lib/igt_kmod.h"
>>>>>   #include "lib/igt_pm.h"
>>>>>   #include "lib/igt_sysfs.h"
>>>>>   #include "lib/igt_syncobj.h"
>>>>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>>>>    * Description: suspend/autoresume on %arg[1] state and exec after RPM
>>>>>    * Functionality: pm - %arg[1]
>>>>>    *
>>>>> + * SUBTEST: %s-without-display
>>>>> + * Description: suspend/autoresume on %arg[1] state without display
>>>>> + * Functionality: pm - %arg[1]
>>>>> + *
>>>>>    * arg[1]:
>>>>>    *
>>>>>    * @s2idle:        s2idle
>>>>> @@ -681,6 +686,7 @@ igt_main
>>>>>           struct drm_xe_engine_class_instance *hwe;
>>>>>           device_t device;
>>>>>           uint32_t d3cold_allowed;
>>>>> +        const char *opts;
>>>>>           int sysfs_fd;
>>>>>
>>>>>           const struct s_state {
>>>>> @@ -757,6 +763,34 @@ igt_main
>>>>>                                             NO_RPM, 0);
>>>>>                   }
>>>>>
>>>>> +                igt_subtest_f("%s-without-display", s->name) {
>>>>> +
>>>>> +                        if (!drmModeGetResources(device.fd_xe))
>>>>> +                                return;
>>>> This should be skip or save it (as global?) and run test on headless.
>>>>
>>>>> +
>>>>> +                        xe_for_each_engine(device.fd_xe, hwe) {
>>>>> +
>>>>> +                                igt_debug("Reload w/o display\n");
>>>>> +
>>>>> +                                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>>> +                                igt_assert_eq(igt_xe_driver_unload(), 0);
>>>>> +
>>>>> +                                igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
>>>>> +                                igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>>>> This param was renamed to probe_display, see
>>>> https://patchwork.freedesktop.org/series/137096/
>>>> tests/intel/xe_module_load: Rename enable_display module param
>>>> Submitted by Lucas De Marchi on Aug. 9, 2024, 5:30 p.m.
>>>>
>>>> +Cc Lucas
>>> And disable_display=1 might be more appropriate, because probe_display
>>> would simply skip the probe for display?
>> Good point. For platforms with display, is it expected that suspend works
>> if DMC is not loaded? Otherwise we will actually have to touch display
>> to disable it to be allowed to suspend.
> Well, for s2idle (s0ix for intel), DC6 is required, which in turn
> requires the DMC.
>
> For s3, I'm not really sure what DC state would be required, but I would
> assume that we would need the driver to put the display in a low-power
> state, so disable_display=1 seems to be needed here. Someone with more
> experience could chime in to confirm this.
>
> --
> Gustavo Sousa

Is there someone else specific that can be brought into this 
conversation to help answer these questions ?

Thanks,

Suja

--------------ZDsv3lshI0hVoWrEEmqG2P0E
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/26/2024 8:06 PM, Gustavo Sousa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:172468301865.6014.9946879676247551400@gjsousa-mobl2">
      <pre class="moz-quote-pre" wrap="">Quoting Lucas De Marchi (2024-08-22 18:01:19-03:00)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Thu, Aug 22, 2024 at 02:45:15PM GMT, Gustavo Sousa wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Quoting Kamil Konieczny (2024-08-22 13:52:43-03:00)
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi Sujaritha,
On 2024-08-22 at 14:50:58 +0530, Sujaritha Sundaresan wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Add tests to validate basic execution suspend/resume cycle
without display module to rule out display related issues
from the suspend/resume stack.

v2: Add normal reload cycle after running test (Anshuman)

v3: Rebase

v4: Change commit name/header (Kamil)

Signed-off-by: Sujaritha Sundaresan <a class="moz-txt-link-rfc2396E" href="mailto:sujaritha.sundaresan@intel.com">&lt;sujaritha.sundaresan@intel.com&gt;</a>
Acked-by: Katarzyna Piecielska <a class="moz-txt-link-abbreviated" href="mailto:Katarzyna.piecielska@intel.com">Katarzyna.piecielska@intel.com</a><a class="moz-txt-link-rfc2396E" href="mailto:Katarzyna.piecielska@intel.com">&lt;Katarzyna.piecielska@intel.com&gt;</a>
Reviewed-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
---
 tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index eee89428c..1623a56c7 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -17,6 +17,7 @@

 #include &quot;igt.h&quot;
 #include &quot;lib/igt_device.h&quot;
+#include &quot;lib/igt_kmod.h&quot;
 #include &quot;lib/igt_pm.h&quot;
 #include &quot;lib/igt_sysfs.h&quot;
 #include &quot;lib/igt_syncobj.h&quot;
@@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
  * Description: suspend/autoresume on %arg[1] state and exec after RPM
  * Functionality: pm - %arg[1]
  *
+ * SUBTEST: %s-without-display
+ * Description: suspend/autoresume on %arg[1] state without display
+ * Functionality: pm - %arg[1]
+ *
  * arg[1]:
  *
  * @s2idle:        s2idle
@@ -681,6 +686,7 @@ igt_main
         struct drm_xe_engine_class_instance *hwe;
         device_t device;
         uint32_t d3cold_allowed;
+        const char *opts;
         int sysfs_fd;

         const struct s_state {
@@ -757,6 +763,34 @@ igt_main
                                           NO_RPM, 0);
                 }

+                igt_subtest_f(&quot;%s-without-display&quot;, s-&gt;name) {
+
+                        if (!drmModeGetResources(device.fd_xe))
+                                return;
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
This should be skip or save it (as global?) and run test on headless.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">+
+                        xe_for_each_engine(device.fd_xe, hwe) {
+
+                                igt_debug(&quot;Reload w/o display\n&quot;);
+
+                                igt_kmsg(KMSG_INFO &quot;Unloading Xe\n&quot;);
+                                igt_assert_eq(igt_xe_driver_unload(), 0);
+
+                                igt_kmsg(KMSG_INFO &quot;Re-loading Xe without display\n&quot;);
+                                igt_assert_eq(igt_xe_driver_load(&quot;enable_display=0&quot;), 0);
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
This param was renamed to probe_display, see
<a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/137096/">https://patchwork.freedesktop.org/series/137096/</a>
tests/intel/xe_module_load: Rename enable_display module param
Submitted by Lucas De Marchi on Aug. 9, 2024, 5:30 p.m.

+Cc Lucas
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
And disable_display=1 might be more appropriate, because probe_display
would simply skip the probe for display?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Good point. For platforms with display, is it expected that suspend works
if DMC is not loaded? Otherwise we will actually have to touch display
to disable it to be allowed to suspend.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, for s2idle (s0ix for intel), DC6 is required, which in turn
requires the DMC.

For s3, I'm not really sure what DC state would be required, but I would
assume that we would need the driver to put the display in a low-power
state, so disable_display=1 seems to be needed here. Someone with more
experience could chime in to confirm this.

--
Gustavo Sousa</pre>
    </blockquote>
    <p>Is there someone else specific that can be brought into this
      conversation to help answer these questions ?</p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">Suja
</span></p>
  </body>
</html>

--------------ZDsv3lshI0hVoWrEEmqG2P0E--
