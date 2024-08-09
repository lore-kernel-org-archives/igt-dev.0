Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A77C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 11:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8356C10E8CC;
	Fri,  9 Aug 2024 11:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nFyHlAmv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D8810E8CB
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 11:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723203689; x=1754739689;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=S+wgye0C5NQEHG7gA7x+DExpU/HIVP2cMdMFyphSuPY=;
 b=nFyHlAmvgxQ9AxUwXo/m69AW55as6LIpKvXlinjmvDrhtxeL/Qs8UUF7
 vazNdsu1yBd+Hj57jfN58ilusQgXFCdeaBs80jQKHFaxd3MBCAAF8mXCr
 1wxpiMTp4gN/qhCNDz8JUYPSuI21Ez57B7CesXnp5DXWZZuz5MYOruxVy
 bpqHhiznulnMRL1mnAe2jURt4BuAR/TuMhELDWyVY8zA4ykmfSuyBxwZ6
 wCaiw8J1Af1Ln+fkW8JghgVdtKbCuX+l7TZiH39iJH6/aVqw4HXsmq0oz
 /r5GahXLqo5jg+vm78LYnGM7To9UvRz1gMz66wnhkh5s1W35fOqbNsU25 Q==;
X-CSE-ConnectionGUID: MSb+BFrtSs+GCLzw1SmaKg==
X-CSE-MsgGUID: LYxG6r6OT3yqveEmWc9jNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21232938"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208,217";a="21232938"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:41:28 -0700
X-CSE-ConnectionGUID: WQsMumdXQIC7Yz9mNETdxw==
X-CSE-MsgGUID: 3LZ+XwdfSbOTJ0ZFii0CdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208,217";a="58260919"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 04:41:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 04:41:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 04:41:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 04:41:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 04:41:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=It9EyA12x6R2avjgckyMAZVCHrhmzKK+A83BW1ySOSY/496GF47wkPTvrJKoYlheJAo0A/qatsHjfbQaUgoCJnNJxjagsBErY4bFvWlBU0R0bNdVSgMSkxZb9O0g0p1tYuRnqj1Jz5Ar8kz0i3eAwkRaipTQvW6n0JwdEu5mlcHVphyE4UMpts03/5DQAvwQIHG/PvPaMM5vtz5oaGjgzeGlvUoZ2pmGAOzGiWsmZZYMMIbNG3o05t2NKKJieG+iyCq7upyVbI4sf9GTI2xh9n5vQX4T0pWXQkh7tiVlKvN3Y8iTLfjNuBe/b/XRbJ9yhTA/ZJ1vmpMNuthGSevtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUnGzb3VryfexlM2LkhLHAg/0SvzI04/lYQisVgbPkA=;
 b=IF92w5nTAudc3RY9ixKJwIY1mNDdTxD+3oUt35YhIjjgmVXsuvD0aKdxzdZBvhFZkwR16JsaxTFtpwhpSr1T/lelmiaj2sXa+T877J2RMc+FCwP+8i+zoxkkKMC73M9zZiKDmIvGQW8ZnT3C/9iQ3cfbfA5ocDenI/OBqOWyqrGVdsU2NVo6N90zyfikE/0+F8Ui4VXe3Sh1x5xlcfM4sGVMWEfvSrd2wmP2aqs5qYZrEZVbPe25bB+mqKvY0yP14G/gx4aRM5oKMAPfokH3fmWJ+F+M6Eb+OzwiiuuocfVPuC9hJs28IZliQOTehEDoiV8U/O+IKDMEOszgYdw/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MN0PR11MB6230.namprd11.prod.outlook.com (2603:10b6:208:3c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 11:41:23 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 11:41:23 +0000
Content-Type: multipart/alternative;
 boundary="------------9OBunsmIlBncxDcQLezw2bYR"
Message-ID: <5a7c55e2-a303-4b2c-91c9-6a54c8b8be5f@intel.com>
Date: Fri, 9 Aug 2024 17:11:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without
 display
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
 <20240801114553.gmb4lpfb4i2xnico@kamilkon-DESK.igk.intel.com>
 <8fba7a7c-47f0-436c-b839-635a5edec4f9@intel.com>
 <20240806125020.jygbaulfsnpv6rqd@kamilkon-DESK.igk.intel.com>
 <5cc321f5-a3e7-491c-b45b-e821caf424a2@intel.com>
 <IA1PR11MB60973966DEAC168058C09FFA86BA2@IA1PR11MB6097.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <IA1PR11MB60973966DEAC168058C09FFA86BA2@IA1PR11MB6097.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::15) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|MN0PR11MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: fd006aee-d64b-4f2d-62c8-08dcb86831a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHc1L3oya25rRFlMTVZoZHp2YW1HRCtGN1V2SUJncjVvSzBmREpET1dla2JL?=
 =?utf-8?B?YTkyNkdVd2Z1NWM3VFF6ZUFDQk1jMit3azVMdkdpcFVrRlZaYUlyR0VYdDhx?=
 =?utf-8?B?VVRmb000UmsyNWNRMkN5VmhpUEIyUnNHSVBUcDBRbWFZZ2dnWmxzRldKM3Rm?=
 =?utf-8?B?RDNrTFNVUHZEamx3Ti9FR0E4OGNEdkhFSkdJWXlDNC9zMVZ3RHZVdXpYT1lQ?=
 =?utf-8?B?K0NYNHE4OXVLZmtBZGdDQXMyWkd2OGh2MGZoSi92OUhudmRXR01CSzV3TVZr?=
 =?utf-8?B?TkljYU5JS21WLyt1UzhHMjhzUTRnUW1UVzNoUjlhT1I5eUN2U2g4Mis3MG1B?=
 =?utf-8?B?dVdwSlJHeHp3MDYvcmlBeE1laU1yYmRXczZ4eVlqemRKUmVETUMxaDMxcGVw?=
 =?utf-8?B?UHJBSnhoUmRSc3RjYmZkZlBRRWFNYWwvMlRhR2ZZcElBcStXQ3hDekpjN3Ju?=
 =?utf-8?B?bWZwV0p3VzNHOCtrdVp6UHd0MjV0LzVwSHFYUTk0dmFQYnVoRVNsSERYL0cz?=
 =?utf-8?B?L1J6WjdBTUszeTBFdFZqUEorcFZjUXd2R05DWWJOV01jWUtOTWU1R0I2aTUx?=
 =?utf-8?B?a1Zac1dmZTBMUGlCQUx2OXkrWEZuZ2hkWEsyUjlnUlM1Z3YwZE9NeFc5b1RH?=
 =?utf-8?B?bTVGY21EZ1VCcmJ3WU9kejF1ZWd4R2hlVTN6cmo0cW4zMjNnb3h5MkxFVmVa?=
 =?utf-8?B?QTZXU0hLRXVydTh6Z3YybFFvekJLcUdBRkNNamRQTHJOYWZmY3djZXlRK2dF?=
 =?utf-8?B?ZEp5bFdqV08xeVEzZERYMEZPcVV4VGRlZWpQRkI2clBGTnJsbVpmNVBnNS9u?=
 =?utf-8?B?VGxwRjBNUFZBYmkrSWZJS2cyRlVQeDhkVzQ1S2VTSzZMclZzSnFJcm5RVUdo?=
 =?utf-8?B?QUtZWkdQRmNiRWhrY0VUMU85MkRtYWtveFloVWlLbGVTNjNzd1Z3ZFYrc1pv?=
 =?utf-8?B?NWt1NnpEd3d2MzQvbUgwaDFtSHBhU2lVTTFJRzhDY09lTkZCdm5LdXZ1azBX?=
 =?utf-8?B?c2lFSFFVTE93bFkyK1FiR2x6MCtaRzRxSjd2T1hlSTlKZ2xmb3VNWnEyK1JX?=
 =?utf-8?B?aVNSaUpxOTZ5VlN3VGpicGtFV2ovZFkxRHZmbkZuQWdDZ0FGZUM4NzlKUDln?=
 =?utf-8?B?YkorK284U2RLOE9VUnJLelNNZTBORWNsL2N2Wk9yV1lBQ2hrNUJwUC9OWFFp?=
 =?utf-8?B?Q0h3R1hqNkVmNUNxTndXb2FWL3VQN2Q4anhtYkQzZGJGYWd6ekdyYzJla0la?=
 =?utf-8?B?UDFDQ2R3MjdGbUVqOG4vazR3OVlUeis5Y2syZ05ERFFOS2NtM0hIKzdlVHA3?=
 =?utf-8?B?N3k0cTE5S0tOamRncnFITytvZmVyQlpVU01hdmxIaG1oYXZDb0ZHOWlFS3Bo?=
 =?utf-8?B?QUwwN0U2VldtN3M3dDJxUDhldm1odWM5WnJ1L2pzWEZmZ3BURmd0UThEcTE3?=
 =?utf-8?B?QzNNaUp2alExbnRWWlVQaXJEQ1RWYmZMK3FRWkR3OWg2MUVJZGNmdVFkKzhB?=
 =?utf-8?B?WUpGYWFPQU12cXJKbjcvR29RamV4S05yN0xtZTlldDhDbDN5alhILy9aU2RS?=
 =?utf-8?B?dWNCSkZkV042ZUlOZjYxS2YwWDVpU0NkU0FPQm5KYVM0am1vcS9WNGMyTnV6?=
 =?utf-8?B?NlpnYzN1VVdzN3FXK2prdnE4Y2lVMlNGdU9saEVUczdiMmticWUrdHJnMGVs?=
 =?utf-8?B?bjAvcXF0VGJlNGxvOVVqQjlDZFBnRFNOWVNGZ1Q5YnJYU2VsQ0xEc1JSMVNH?=
 =?utf-8?B?b01vTFQvVHoyT0djSmY4VDNGZDBTMzlpVHA0aTFYNmZhQVEvZWRLTlJWZjdS?=
 =?utf-8?B?ME9PZkZtdXJ3a0g4TnNZZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1daeUd0MVhqck5TcEM3aWhUSU9YOW50RmtTQnFINzFoSkVDMUx3RjlBcXU3?=
 =?utf-8?B?bW8xdmhMODJrc0s5bnpwZXQ3TFBNbzdQWG9PcFpkb2RYQzJjL1VISXcydzBj?=
 =?utf-8?B?Y0JhRUdwQy9Ra0pQR3BVOEwvQWlXRzZFSklSYTNFNm1YNG82b1Rxa0JWNlRZ?=
 =?utf-8?B?MGZJaFoyandRY1VXS3NYNy96WkJhUzdzelBHeTRST1JUQWpqQXNxRGxjL2la?=
 =?utf-8?B?ckRsb1BWejFoMU1uTVovb3BhOThYMWh3SEc4YlJOcUoveFlkTzZyYXo2RDNy?=
 =?utf-8?B?K1lyVG1jQzVOdXIyT1ZpWnpsK0tiRGVzSnMvVUNNZW55SW53ZG9IOEtBTlRN?=
 =?utf-8?B?eEpLNnhLb1pHVXhHalNQUmwzOGpDWVFNRkJqakR1cFhaSUNJTGVkcnZBaDBX?=
 =?utf-8?B?MmI2OWQ0cXRHODU1aVQrcExYRUFEZlMwQU10dC95RjMwTEwwMm9iYVVUTzQy?=
 =?utf-8?B?SldLVzVkMTB0dUcyOE5RcmJCUXlpczRzY0RsNDhDQXJiZHVGc2J2alRLcDNk?=
 =?utf-8?B?a2dmL20rdW9CZGhtMlR1N29qQ2kxcytRMXNTQW5IdUs3aWdTUnJ4Qkt6Vzlp?=
 =?utf-8?B?Slk1bkp1WWRId0NIWVM4aFlmbkRyTnR6NFdyUVh3SktkTlFFSWN6SjZ3bDZr?=
 =?utf-8?B?aEFOR2x4UUljcEg1V1ZGL0ZKU1RWRE15eUlMWSs2SzUvOWZRK2M1YkpPR3hq?=
 =?utf-8?B?a1FacEl4OTBoaEh6UlhYTVplb3lzZlpQNjZoTWNYa1ExSmdydTRURzZ6K1Vy?=
 =?utf-8?B?MkFEZFUyUlZiMEdJQlByQnlTWlBITklFVHM4V0VBdGFqNUtGUFJxdUp1WXoz?=
 =?utf-8?B?N2x0cldtRVU5TDdSdzdsZWFxZTBQQ2QxSXZTVjJ3bzRGUWY5R09hMDFsaUJi?=
 =?utf-8?B?OEJhb0E0eE5Gci9qY0VZRElMRkx4N053SEZ5VG9DY3dVY0VUT0tSTlF0NVpI?=
 =?utf-8?B?T3VQVm8vdE0rRDZIbGpuOFc4cmR0cEJYd3g4K0tXMEJqaWFlZ0lTWXVvWTRn?=
 =?utf-8?B?cjBwTjVHN01xTC9mb0FwQXJnQmJzTVo4RVh1TWxFeXdKREl0RGhkM1I2dHdp?=
 =?utf-8?B?aDh1bmlGVUQzNWNKWFZKcXlXbHdPK3BDd29Ob3g3UmEyYTErLzFRTFM1WVBT?=
 =?utf-8?B?VjJRKzN0S0lOZjlNYWxDREZSTzJwZTNUYzNkOEYvK2IyaGUvYjFtdVNRTmdT?=
 =?utf-8?B?TVczdWhxSUhUN090TTdCT0poOEhacVFFYjJid2t3VlFBaTBPc0dzVGxMOGFx?=
 =?utf-8?B?OVlpVGdNYUR3TVdIR3R1U1JkM2dORWFreUxGdGw3MkZBd0wzVjVTZ3lMc294?=
 =?utf-8?B?MWVnblRJY3I0OTJJemRkSnNEWGx4UTJwQk1OZEFsY2JnSnd2ekg0aUNPdWtz?=
 =?utf-8?B?V1J2N0Y4QWdRMzUzLzQ5aXR1d3A1bHdibEV0UjJURyt1NjhWLzNqR2xQZmJ1?=
 =?utf-8?B?NEpYcWhUY1Bqb1lNeWMyV0FlSzFrQXBXbEw3MU9tV3crOTRkZ3d2MDg5b1ds?=
 =?utf-8?B?U253cjFNQ3VjR3lHZjRlRXl1WDlJb3J2SlB1L0QxdVpDNjNPc09oTUIvdzND?=
 =?utf-8?B?OCtvaTJaNzlPNW44MzFiWllVNEI0TVZZaU5PcXNPY2wyQWxmQzNXazRhclB4?=
 =?utf-8?B?RXNIa0VnK080L2tWd3J5TU5MZFV2MG9Rd2h4ZzQzYTFIWHcxbVRaa3I1K1JH?=
 =?utf-8?B?LzRMeWR1a0ZXU0lKSE5IREtLdUtJZnJ1cHJxa0FqSkh3bnlLWUlVVWUyMEdv?=
 =?utf-8?B?V3NkanRZb1ZzYUVFWWozMUJhVzJVc21GTHcwNFgrcmlTWXhQUnBObkYwTjFJ?=
 =?utf-8?B?MHUraXUzdEsvb0J0VGFxZ09JOHd4QW1aK1hVd1ZQUlAxMUpBNld6VUcvU3ov?=
 =?utf-8?B?R3hlc0tMRTh6WU14T3lMTmw2TVZQbXVTVjF4SmdJV0FNaXNpeVFUZk1IZGtZ?=
 =?utf-8?B?Y1QyTlE1akdnM3p3S1ppMjJTeXpEcVdLYlpBT0tVUFBCOHpPblE2enpYdDhR?=
 =?utf-8?B?VEt2RTdXYnAveDF5TmE3a3RoTThsU3BIbVc5MnVEdG5FakhMVExmMTlZZkpF?=
 =?utf-8?B?cWlWb0VQWExiUDRMS3dxcnMvdnZwOEVsOEZ5UjJVOWplUzBXRllNdFlrYWNT?=
 =?utf-8?B?Vmczblp4ZDVmTkpiK0Z5YVhNNDVmNmpFUURnTlhtRVpHekcvVjlHMVVDeTkw?=
 =?utf-8?Q?dhkXzNmdpoi3IyJhEkH1IlU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd006aee-d64b-4f2d-62c8-08dcb86831a1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 11:41:23.6772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNnOciaL0V+acCc2BwtFQKXiqH/i+YdZMwVlXBULiquztpU7SNGr0XrdXqKv9T0q5pFIaDSmj3yR7rmI1paIEG46F7l2RsVy3XY4ikOvD+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
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

--------------9OBunsmIlBncxDcQLezw2bYR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 8/9/2024 4:28 PM, Piecielska, Katarzyna wrote:
>
> For documentation – everything looks correct, a little bit different 
> then in most of cases, but correct. I’ve generated docs and all needed 
> tests are visible.
>
> From this point of view LGTM Acked-by: Katarzyna Piecielska 
> Katarzyna.piecielska@intel.com
>
> Kasia
>
Hi Kasia,

Thank you for the ack on the doc.

-Suja

> *From:*Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
> *Sent:* Friday, August 9, 2024 11:04 AM
> *To:* Kamil Konieczny <kamil.konieczny@linux.intel.com>; 
> igt-dev@lists.freedesktop.org; Gupta, Anshuman 
> <anshuman.gupta@intel.com>; Piecielska, Katarzyna 
> <katarzyna.piecielska@intel.com>
> *Subject:* Re: [PATCH i-g-t, v3] tests/intel: Add tests to run suspend 
> without display
>
> On 8/6/2024 6:20 PM, Kamil Konieczny wrote:
>
>     Hi Sundaresan,,
>
>     On 2024-08-06 at 11:50:46 +0530, Sundaresan, Sujaritha wrote:
>
>         On 8/1/2024 5:15 PM, Kamil Konieczny wrote:
>
>             Hi Sujaritha,
>
>             On 2024-07-30 at 17:05:08 +0530, Sujaritha Sundaresan wrote:
>
>             small nit about subject, you wrote:
>
>             [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without display
>
>             imho this should be:
>
>             [PATCH i-g-t, v3] tests/intel/xe_pm: Add tests for suspend without display
>
>             More nits below.
>
>         Hey Kamil,
>
>         Sure this change I can make.
>
>                 Add tests to validate basic execution suspend/resume cycle
>
>                 without display module to rule out display related issues
>
>                 from the suspend/resume stack.
>
>                 v2: Add normal reload cycle after running test (Anshuman)
>
>                 v3: Rebase
>
>                 Signed-off-by: Sujaritha Sundaresan<sujaritha.sundaresan@intel.com>  <mailto:sujaritha.sundaresan@intel.com>
>
>                 Reviewed-by: Anshuman Gupta<anshuman.gupta@intel.com>  <mailto:anshuman.gupta@intel.com>
>
>                 ---
>
>                    tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>
>                    1 file changed, 34 insertions(+)
>
>                 diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>
>                 index 8b115e2f6..03f742265 100644
>
>                 --- a/tests/intel/xe_pm.c
>
>                 +++ b/tests/intel/xe_pm.c
>
>                 @@ -17,6 +17,7 @@
>
>                    #include "igt.h"
>
>                    #include "lib/igt_device.h"
>
>                 +#include "lib/igt_kmod.h"
>
>                    #include "lib/igt_pm.h"
>
>                    #include "lib/igt_sysfs.h"
>
>                    #include "lib/igt_syncobj.h"
>
>                 @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>
>                     * Description: suspend/autoresume on %arg[1] state and exec after RPM
>
>                     * Functionality: pm - %arg[1]
>
>                     *
>
>                 + * SUBTEST: %s-without-display
>
>                 + * Description: suspend/autoresume on %arg[1] state without display
>
>                 + * Functionality: pm - %arg[1]
>
>             I see you copy-pasted it but imho both Description and
>
>             Functionality documentation fields should be static, here and
>
>             in other places.
>
>             +cc Katarzyna Piecielska<katarzyna.piecielska@intel.com>  <mailto:katarzyna.piecielska@intel.com>
>
> Hi Kamil,
>
> Sorry I didn't get this change. This is inline with the rest of the 
> file right ?
>
>                 + *
>
>                     * arg[1]:
>
>                     *
>
>                     * @s2idle: s2idle
>
>                 @@ -681,6 +686,7 @@ igt_main
>
>                         struct drm_xe_engine_class_instance *hwe;
>
>                         device_t device;
>
>                         uint32_t d3cold_allowed;
>
>                 +      const char *opts;
>
>                         int sysfs_fd;
>
>                         const struct s_state {
>
>                 @@ -757,6 +763,34 @@ igt_main
>
>                                                         NO_RPM, 0);
>
>                                }
>
>                 +             igt_subtest_f("%s-without-display", s->name) {
>
>                 +
>
>                 +                     if (!drmModeGetResources(device.fd_xe))
>
>                 +                            return;
>
>             Why 'return' here?! Imho this should be checked in fixture
>
>             or be a skip. Or other way around - what about a headless board
>
>             or one without any connected display?
>
>             Regards,
>
>             Kamil
>
>         I think this patch idea sort stemmed from the cases where we have a display
>
>         connected and
>
>         want to make sure that the suspend/resume issues are not being caused by the
>
>         display.
>
>         But would you suggest expanding the test to have the headless/no display
>
>         situations? If so what changes are you suggesting for that ?
>
>         Thanks,
>
>         Suja
>
>     I would suggest turn this into a igt_skip_on_f(), not a return.
>
>     Regards,
>
>     Kamil
>
> Sure I will switch this to
>
> igt_skip_on(!drmModeGetResources(device.fd_xe))
>
> Thanks,
>
> Suja
>
>                 +
>
>                 +                    xe_for_each_engine(device.fd_xe, hwe) {
>
>                 +
>
>                 +                            igt_debug("Reload w/o display\n");
>
>                 +
>
>                 +                            igt_kmsg(KMSG_INFO "Unloading Xe\n");
>
>                 +                         igt_assert_eq(igt_xe_driver_unload(), 0);
>
>                 +
>
>                 +                            igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
>
>                 +                      igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>
>                 +
>
>                 +                            test_exec(device, hwe, 1, 2, s->state,
>
>                 +                                      NO_RPM, 0);
>
>                 +
>
>                 +                            igt_debug("Reload as normal\n");
>
>                 +
>
>                 +                            igt_kmsg(KMSG_INFO "Unloading Xe\n");
>
>                 +                         igt_assert_eq(igt_xe_driver_unload(), 0);
>
>                 +
>
>                 +                            igt_kmsg(KMSG_INFO "Re-loading Xe\n");
>
>                 +                       igt_assert_eq(igt_xe_driver_load(opts), 0);
>
>                 +                     }
>
>                 +             }
>
>                 +
>
>                                for (const struct vm_op *op = vm_op; op->name; op++) {
>
>                                        igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
>
>                                               xe_for_each_engine(device.fd_xe, hwe)
>
>                 -- 
>
>                 2.34.1
>
--------------9OBunsmIlBncxDcQLezw2bYR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/9/2024 4:28 PM, Piecielska,
      Katarzyna wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:IA1PR11MB60973966DEAC168058C09FFA86BA2@IA1PR11MB6097.namprd11.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Aptos;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:#0F4761;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt;color:#0F4761">For documentation –
            everything looks correct, a little bit different then in
            most of cases, but correct. I’ve generated docs and all
            needed tests are visible.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt;color:#0F4761">From this point of
            view LGTM Acked-by: Katarzyna Piecielska
            <a href="mailto:Katarzyna.piecielska@intel.com" moz-do-not-send="true" class="moz-txt-link-freetext">Katarzyna.piecielska@intel.com</a><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt;color:#0F4761"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt;color:#0F4761">Kasia</span></p>
      </div>
    </blockquote>
    <p>Hi Kasia,</p>
    <p>Thank you for the ack on the doc.</p>
    <p>-Suja<br>
    </p>
    <blockquote type="cite" cite="mid:IA1PR11MB60973966DEAC168058C09FFA86BA2@IA1PR11MB6097.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt;color:#0F4761"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt;color:#0F4761"><o:p>&nbsp;</o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                Sundaresan, Sujaritha
                <a class="moz-txt-link-rfc2396E" href="mailto:sujaritha.sundaresan@intel.com">&lt;sujaritha.sundaresan@intel.com&gt;</a>
                <br>
                <b>Sent:</b> Friday, August 9, 2024 11:04 AM<br>
                <b>To:</b> Kamil Konieczny
                <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>; Gupta, Anshuman
                <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>; Piecielska, Katarzyna
                <a class="moz-txt-link-rfc2396E" href="mailto:katarzyna.piecielska@intel.com">&lt;katarzyna.piecielska@intel.com&gt;</a><br>
                <b>Subject:</b> Re: [PATCH i-g-t, v3] tests/intel: Add
                tests to run suspend without display<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p><o:p>&nbsp;</o:p></p>
        <div>
          <p class="MsoNormal">On 8/6/2024 6:20 PM, Kamil Konieczny
            wrote:<o:p></o:p></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <pre>Hi Sundaresan,,<o:p></o:p></pre>
          <pre>On 2024-08-06 at 11:50:46 +0530, Sundaresan, Sujaritha wrote:<o:p></o:p></pre>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>On 8/1/2024 5:15 PM, Kamil Konieczny wrote:<o:p></o:p></pre>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>Hi Sujaritha,<o:p></o:p></pre>
              <pre>On 2024-07-30 at 17:05:08 +0530, Sujaritha Sundaresan wrote:<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>small nit about subject, you wrote:<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>[PATCH i-g-t, v3] tests/intel: Add tests to run suspend without display<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>imho this should be:<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>[PATCH i-g-t, v3] tests/intel/xe_pm: Add tests for suspend without display<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>More nits below.<o:p></o:p></pre>
            </blockquote>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Hey Kamil,<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Sure this change I can make.<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre><o:p>&nbsp;</o:p></pre>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>Add tests to validate basic execution suspend/resume cycle<o:p></o:p></pre>
                <pre>without display module to rule out display related issues<o:p></o:p></pre>
                <pre>from the suspend/resume stack.<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>v2: Add normal reload cycle after running test (Anshuman)<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>v3: Rebase<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>Signed-off-by: Sujaritha Sundaresan <a href="mailto:sujaritha.sundaresan@intel.com" moz-do-not-send="true">&lt;sujaritha.sundaresan@intel.com&gt;</a><o:p></o:p></pre>
                <pre>Reviewed-by: Anshuman Gupta <a href="mailto:anshuman.gupta@intel.com" moz-do-not-send="true">&lt;anshuman.gupta@intel.com&gt;</a><o:p></o:p></pre>
                <pre>---<o:p></o:p></pre>
                <pre>&nbsp; tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++<o:p></o:p></pre>
                <pre>&nbsp; 1 file changed, 34 insertions(+)<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
                <pre>diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c<o:p></o:p></pre>
                <pre>index 8b115e2f6..03f742265 100644<o:p></o:p></pre>
                <pre>--- a/tests/intel/xe_pm.c<o:p></o:p></pre>
                <pre>+++ b/tests/intel/xe_pm.c<o:p></o:p></pre>
                <pre>@@ -17,6 +17,7 @@<o:p></o:p></pre>
                <pre>&nbsp; #include &quot;igt.h&quot;<o:p></o:p></pre>
                <pre>&nbsp; #include &quot;lib/igt_device.h&quot;<o:p></o:p></pre>
                <pre>+#include &quot;lib/igt_kmod.h&quot;<o:p></o:p></pre>
                <pre>&nbsp; #include &quot;lib/igt_pm.h&quot;<o:p></o:p></pre>
                <pre>&nbsp; #include &quot;lib/igt_sysfs.h&quot;<o:p></o:p></pre>
                <pre>&nbsp; #include &quot;lib/igt_syncobj.h&quot;<o:p></o:p></pre>
                <pre>@@ -229,6 +230,10 @@ static void close_fw_handle(int sig)<o:p></o:p></pre>
                <pre>&nbsp;&nbsp; * Description: suspend/autoresume on %arg[1] state and exec after RPM<o:p></o:p></pre>
                <pre>&nbsp;&nbsp; * Functionality: pm - %arg[1]<o:p></o:p></pre>
                <pre>&nbsp;&nbsp; *<o:p></o:p></pre>
                <pre>+ * SUBTEST: %s-without-display<o:p></o:p></pre>
                <pre>+ * Description: suspend/autoresume on %arg[1] state without display<o:p></o:p></pre>
                <pre>+ * Functionality: pm - %arg[1]<o:p></o:p></pre>
              </blockquote>
              <pre>I see you copy-pasted it but imho both Description and<o:p></o:p></pre>
              <pre>Functionality documentation fields should be static, here and<o:p></o:p></pre>
              <pre>in other places.<o:p></o:p></pre>
              <pre>+cc Katarzyna Piecielska <a href="mailto:katarzyna.piecielska@intel.com" moz-do-not-send="true">&lt;katarzyna.piecielska@intel.com&gt;</a><o:p></o:p></pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <p>Hi Kamil,<o:p></o:p></p>
        <p>Sorry I didn't get this change. This is inline with the rest
          of the file right ?<o:p></o:p></p>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre><o:p>&nbsp;</o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>+ *<o:p></o:p></pre>
                <pre>&nbsp;&nbsp; * arg[1]:<o:p></o:p></pre>
                <pre>&nbsp;&nbsp; *<o:p></o:p></pre>
                <pre>&nbsp;&nbsp; * @s2idle: s2idle<o:p></o:p></pre>
                <pre>@@ -681,6 +686,7 @@ igt_main<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; struct drm_xe_engine_class_instance *hwe;<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; device_t device;<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; uint32_t d3cold_allowed;<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *opts;<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; int sysfs_fd;<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; const struct s_state {<o:p></o:p></pre>
                <pre>@@ -757,6 +763,34 @@ igt_main<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;NO_RPM, 0);<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-without-display&quot;, s-&gt;name) {<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!drmModeGetResources(device.fd_xe))<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<o:p></o:p></pre>
              </blockquote>
              <pre>Why 'return' here?! Imho this should be checked in fixture<o:p></o:p></pre>
              <pre>or be a skip. Or other way around - what about a headless board<o:p></o:p></pre>
              <pre>or one without any connected display?<o:p></o:p></pre>
              <pre><o:p>&nbsp;</o:p></pre>
              <pre>Regards,<o:p></o:p></pre>
              <pre>Kamil<o:p></o:p></pre>
            </blockquote>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>I think this patch idea sort stemmed from the cases where we have a display<o:p></o:p></pre>
            <pre>connected and<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>want to make sure that the suspend/resume issues are not being caused by the<o:p></o:p></pre>
            <pre>display.<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>But would you suggest expanding the test to have the headless/no display<o:p></o:p></pre>
            <pre>situations? If so what changes are you suggesting for that ?<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Thanks,<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
            <pre>Suja<o:p></o:p></pre>
            <pre><o:p>&nbsp;</o:p></pre>
          </blockquote>
          <pre><o:p>&nbsp;</o:p></pre>
          <pre>I would suggest turn this into a igt_skip_on_f(), not a return.<o:p></o:p></pre>
          <pre><o:p>&nbsp;</o:p></pre>
          <pre>Regards,<o:p></o:p></pre>
          <pre>Kamil<o:p></o:p></pre>
        </blockquote>
        <p>Sure I will switch this to <o:p></o:p></p>
        <p>igt_skip_on(!drmModeGetResources(device.fd_xe))<o:p></o:p></p>
        <p>Thanks,<o:p></o:p></p>
        <p>Suja <o:p></o:p></p>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <pre><o:p>&nbsp;</o:p></pre>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre><o:p>&nbsp;</o:p></pre>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>+<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_for_each_engine(device.fd_xe, hwe) {<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Reload w/o display\n&quot;);<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_kmsg(KMSG_INFO &quot;Unloading Xe\n&quot;);<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; igt_assert_eq(igt_xe_driver_unload(), 0);<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_kmsg(KMSG_INFO &quot;Re-loading Xe without display\n&quot;);<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  igt_assert_eq(igt_xe_driver_load(&quot;enable_display=0&quot;), 0);<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_exec(device, hwe, 1, 2, s-&gt;state,<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; NO_RPM, 0);<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Reload as normal\n&quot;);<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_kmsg(KMSG_INFO &quot;Unloading Xe\n&quot;);<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; igt_assert_eq(igt_xe_driver_unload(), 0);<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_kmsg(KMSG_INFO &quot;Re-loading Xe\n&quot;);<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; igt_assert_eq(igt_xe_driver_load(opts), 0);<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
                <pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
                <pre>+<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (const struct vm_op *op = vm_op; op-&gt;name; op++) {<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s-vm-bind-%s&quot;, s-&gt;name, op-&gt;name) {<o:p></o:p></pre>
                <pre>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_for_each_engine(device.fd_xe, hwe)<o:p></o:p></pre>
                <pre>-- <o:p></o:p></pre>
                <pre>2.34.1<o:p></o:p></pre>
                <pre><o:p>&nbsp;</o:p></pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------9OBunsmIlBncxDcQLezw2bYR--
