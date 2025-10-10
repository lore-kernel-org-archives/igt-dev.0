Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAE6CCD187
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC7510E108;
	Fri, 10 Oct 2025 22:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMWN3PrR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6865410E108
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135306; x=1791671306;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=agetZcMQHMGCFJflLUeZZm0VUqDHvOfIIOmlWXRlY94=;
 b=TMWN3PrRUOHDWtLODKe2Ouw505mx5CF9b9C2ap9mE8LFk8UKL4RqWDAX
 Ff0B0bsW+Lm/lV6le8gaifuZNaobyj1E3x3zHd27y0wZgF3tOkLaF9oqq
 FazuE+tSbhmxMc5roAh3A5lAm1Oj7sqZx9KWtX7Mvs7lbk7uWia1AHPyH
 FrtSpy5HJYOhYJZ3kmeS9JgP3Op4kR5NxsRePz0iuzD6prdzCNEYhLcyx
 HlC5hejbiePBQM1jPliMeUDfz6EhbZIlPQXVu+K2bff5aAeydJfe49ksv
 G/gqYjhILey0mPYP92cAMwIuehXV2GxYKg7XkcX+TD2svrpR7RU+NAug7 g==;
X-CSE-ConnectionGUID: 0N0V5fLySVuKvv7RadRANw==
X-CSE-MsgGUID: P2t50400SMOEv37NFO0sKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62278895"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62278895"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:28:26 -0700
X-CSE-ConnectionGUID: XN4V849sT3Obj+bDZ6HUvA==
X-CSE-MsgGUID: bjFGwtaIQ9ySoFO+TsHelQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="180665704"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:28:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:28:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:28:24 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:28:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOQEmntWE+reZbLpqksePnNqCt+my4jG5g4AzzaK6ma0J27+fChgSkkNeWhHcW/CKBrb19qHhnF2BdPXToYpINoQxBfwH1aXDVtm+D8a5Nxm6z3xbHdfj8czCieDCsfev9XnzuzCNIgZpK6QP6Cc4tzI7U4CBKCD2yVv/bXRuF+KXYQU2v9O5KVwB0Xc6IP3QL43Vo/gk0Q2MtYMHXuNKv9ug3jq0uM6wstb6lUiaSGdCHlHF08L2FjgBXXgBzBoTfO5suIdDs5v7znCCY21QNJGCDDqaOYOOpob2RqUTZzwZ4uhVKgfZwpbc7SmZNV1a8ZW3OsQymxhw3sV3jb6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itgr5zcbT2SZAvj/fbri/dqQ2O/L3ZmX+zJyg9AYJ4k=;
 b=aINfsQrgrj8CrtwUXFkExgZO/98ZeavSPOul3O424muMRYVwKrGedZZw0OA5Ub+W5PQKZL7NZ2vNQ055vMEFSFERh5Zrbxb86AUL9BVW5jKWLjUesA/4l1QYcozeQrhILOsuFoFUOst1KrJ+99SCWWal+e8uMF/vIiDw5Ds6HyZ4le1gq6YclnPpDqtoiUXNN0Kq6J08MXD5MmN87Kz7CCtBuit+u2WgxmnwlISRUT8HQ1peeeDKOPQtNxRapqKIJi/yUjUGdOdBJnA3FZ3EcWOhYZQL455QMcpdsQFOcxuAW4cFp2mUepj4ekYNmlPEJCIjigTnlPoWu1xskIzJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:28:22 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:28:22 +0000
Date: Fri, 10 Oct 2025 15:28:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 13/18] tests/intel/xe_oa: Convert OA buffer mmap
 tests to take OA unit arguments
Message-ID: <aOmIhGwBbrw9Hkdo@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-14-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-14-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0352.namprd04.prod.outlook.com
 (2603:10b6:303:8a::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: f4709971-776c-4f0b-c98e-08de084c526c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXdxMGVyTFd1TmQ3MndOMjFZZjQvOGcyVTVUVGRiYlpOSHlqUmR4aGh4alRp?=
 =?utf-8?B?TGtwak5SWnRtc2crcVROdjIvV1ljWjJMakE4d3FRSjFBblJkd0hWdE92Z2pE?=
 =?utf-8?B?NGlsVzZXZ3V3YnVpMDVLc2V4bEJjR2lCVlQ3STMyK2tqSUpRY2VhSzgyNnRh?=
 =?utf-8?B?TC9NVEhzZlhQeS9yZlAwZTc1QmFIaHY0Ui9JcmtaMHF6QWVaeklpenRJSWl4?=
 =?utf-8?B?UUxlcFBhejVGbndNYm1rVEQvc0JGdFVMK3kyWGdDNStwb1hjeFAxWlBNQmlI?=
 =?utf-8?B?OWRpekMxM2c3OWRFMWVQNldtYXRVR0xzb1Y2QzVJWVE5Wm1RVE1Kb2pYTFpZ?=
 =?utf-8?B?YVNYU3hpU3ovOEM2TWxDaVFMRGFWaEpoWVk1VXdURDdPY1VSMEU3bGNxcDRx?=
 =?utf-8?B?YllwTXVqRmtxTitVRUhTUkJXNEJPNDRwUDBwYmk0a3Q4aEt2bHBjeGx5SlF4?=
 =?utf-8?B?QXJ3NEc2OGZxaWhoUDZXcXZnRTYyQ3VhODN2TzlTeVNnODFRbHZrM2NuNHhv?=
 =?utf-8?B?VlJkemk0Mm1Ec2tCNTFGdmlNcTVvSFRnOEZEOVVSSjZkbjRPN3hIY0RNdWtr?=
 =?utf-8?B?aWJGR2lpUTBUdEZMZmE0RnRFZjY4cnd1YXJUZENxd1JkT0YxbEgyelZOOVdR?=
 =?utf-8?B?RElFTEdOU1J4cXFQU0hraXJLQXJ0b2lKNThOUk5FV0M1QjFKY3U2MXh5Z2cz?=
 =?utf-8?B?MWtEZHQyNEhyUjNqZS93VTFjQUZkeEpLZEhqd09ldFQwL1o3K1VqYWxIbWZ0?=
 =?utf-8?B?bW96TUNxK0tpOXM0UzIwd1loTzJ0NGZhZTJIblExN1RtTFNoeDVhem1IVzFU?=
 =?utf-8?B?bFo5aHMwR0kwQk9wYUlCaHRUYnNCVUhneVJKQzFXcWpiTWh1QXQwa3VoKzJw?=
 =?utf-8?B?Zy9DeHQ4STZhQ0dwU3VsQy9xZDFkM0ZaUEZTOTdFdFUxajU3M1haVnp2SWdy?=
 =?utf-8?B?aHp4VlZwTzcwdHQyMEVmbGZjNmFlLzBCVzloanJ5dTVjb2F6ZDh5c3FJSUt1?=
 =?utf-8?B?STMvZUFEUGZKUU8rWDdTMDB2VVBYR1EzcktZUUY3L1hJY2V4U1BiVkRFbFI1?=
 =?utf-8?B?UnVjckFVUlQzYWVRY2pYM1U3RFdrQnZFQ0tRSkl0NEFpS3B5VVV1bHQrdExN?=
 =?utf-8?B?VnkrZ3dwVm9xczZsVjRXUEpSZVBnanZZOUVRSHJpTy9hZXJEeTNOYUZHODdJ?=
 =?utf-8?B?T0cxZzhIMXN2YXFzUndCUkxPZU55QUh1eTZmWDVRMUczWEx2cmludW44bkkw?=
 =?utf-8?B?TXhVQ3hUcDMvcWk3NmV3d3lYZU9DVTRXaVhaSnpreVlRaFR2UWtKaEIxVG1F?=
 =?utf-8?B?cnhNSTFuRFJGdHUyWmZybGtnNlpxbUhkaGVxNWlnMVMzTDFxS2VFOG5nRlpr?=
 =?utf-8?B?cnlENGR6aGM2dzMwTVg4R1pvL0NDelEwYXBLTHdDVFQ5UG9KUms3VE5XNFox?=
 =?utf-8?B?UjU4N2hOZXpOYzhRQnRzVSs2UE4rbGI3TVBUNVlwVHBFZ2NYeGkvQ2RRQTJE?=
 =?utf-8?B?Mi8rdllhUEsvTVRlNUYzNzlVcjkwcFprNmYwWE1DMG1GeWcxdExpOUo0VVBk?=
 =?utf-8?B?dktyTzRLSiszdmRjZFZWL3MwdkRJZ2F3d05nb0ttUzlGdWxiQ29aQ1pDTnA3?=
 =?utf-8?B?SHNxcU13WXBsaEJKNndEVG5ZOHdXaW5kMjI1aStZVzc2dVBNRmZnOWZ0aHdY?=
 =?utf-8?B?a1R4MFFSVUsvTTRpd2c0Z1dEVitvN1RncDNkaW1lUlVyQ2JhRFgxQzFsSy9p?=
 =?utf-8?B?Unowd3MwNXhYakdkU1RQMzVxTkcvQmZrc3RodWFyQW96V3hjVUpYS1pPYkNr?=
 =?utf-8?B?SEZuUkdaRE9oQm14YXlPZkpxMlE4dDVDY0crQ21hWXpRcmxQZ2dLaU1rZlJv?=
 =?utf-8?B?TDJLcmhYcmhHOE5BY1JrV0YzcnRkQnhBVW1Zb3NlZW13Zk9YR3d0dlZQb0xr?=
 =?utf-8?Q?HKguxD3C8gumERs9F0Y6ODbpef2N2V9n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1FINVFPN2dSNnIrU3pzeHJFSk5SWUduUUYydTJnU2JrWFdZRzFFZmdGbFJE?=
 =?utf-8?B?RzRnNHdwSjh0Q2ZRVmtqQ0cyR2J0L0ZaY3d4VnIzZUNKOXlvcEFxREZpaW0r?=
 =?utf-8?B?U1dOREJRY0kxOVJBZXU2L093alVqUVBiekt3dU9ncjRqaVhXZjBZSy9GRFVv?=
 =?utf-8?B?bW8ycEx5aEFVMG9rTFhRTjJsZUh5bHE0WmFoM1lMYUhrL2c2QURieXlqcklm?=
 =?utf-8?B?N0RTaEhxV1J0aS9uMThOOFY5Uys2UFA2a0l5Q1dpWkNsTjVvWVBDbGF0VXk3?=
 =?utf-8?B?V2JNMmFkeENUbEVSTGRxOFltUTAxQ3k3bjRLVkZPRERoTGNJQklmTHZ4dUxy?=
 =?utf-8?B?VldMdWxKclRGcTd2M1M5OEI5Uk5HZDk2QWFZdlJycFdGNmw1RGtsaFNFVXBy?=
 =?utf-8?B?LzFwRjRGVnRweFdyb2ZNci9TMGQzdmVzOW9wenZuanIzM2hJOXJ4QkhZMnBD?=
 =?utf-8?B?N0hreEoxRXpzM1lhNUhTM054OVo3enJFMS92TE43SERxUmZPWDJFUUNpamRi?=
 =?utf-8?B?aVBBU0NBcGMvWndtZEl3TlMwL05YYXNDVGRxdDlobW92Z1RjMHpwU1pTbTFh?=
 =?utf-8?B?UnVxWWV1V3Z1TmFYZGpTOUNBSTd1clFCKzM3N3cyeU5HdS9nOXJPbGdqcER6?=
 =?utf-8?B?MWNod1hxNDZ6bHdmNDR0eHkreFU1OWhvZmcwdlF6M0svYW4ycTF4NUZtb1ow?=
 =?utf-8?B?ZVVMcU1lR2orN01uQmpHMzYxTUE1dDkzK1ZlcTl6N0l6cXRkYm1yTlA5S2J1?=
 =?utf-8?B?RzNoaFNBTDhlY1ovUVV4RUNVK3Y4WE5MS0J6MU9VNWtwQmNadTl6bGRybHJF?=
 =?utf-8?B?YUN4aUdMaTU1cndNYnlEd1ltZ01lZ0lubnh4ZDRjSktwQngwcUovclRYNVNK?=
 =?utf-8?B?b0dYUmkvL0E2ampqSEllSHRVeFo1Rkg2Vkd4TU54NVNwNGYxV1M5M2lKRnVo?=
 =?utf-8?B?K2ZrWmNRTE5RZWdETThGQjl5SWNhWUJoRUFNMXRka3V6OTB2eDZyY0ZFMHpN?=
 =?utf-8?B?SWV2RVNnVmhrZU8wd2s3b3lxeGFlenB2RGpUaVRXM0FlNzRvWkx3SkVOeWhu?=
 =?utf-8?B?T0lIR01YNDYvTFZKZXVxay9aRTJXZWlCdE1iRXJ3Z1pCYWpZRXVGL3krMkxN?=
 =?utf-8?B?K1dvVDR1bzBiMmU5ZHcxRmROelhFbFM1R3l5VW9iMXU0bDVlZHFOUTMwZmE1?=
 =?utf-8?B?U0gySVozb2dEOHo2dERwSmNrKzlTV2V4NDdVRHlzZzlqL0NUQml2YWJUVVNx?=
 =?utf-8?B?Nk5tOEMxeTZwbzBaQ0t4TVU5RjFyc0VvZm1XbWQ1dnZlV0ZrVkRocXNXc2d4?=
 =?utf-8?B?UHlOUCtDcS9QRExEampIUFVTQnNFV3BUYUtoYW5Fak5IUUYvYk55T0REa2NF?=
 =?utf-8?B?cTFJaFlNUE5xTHJBdVMyQnZ6L0E3ck9jMWw4M3dzdlpPM0w4dGJDQmh0S3c0?=
 =?utf-8?B?WUNRMmZWd2JZU1hRbHFZbWZxRmVxMWZnRGdxQnkwMS9ZZlpybTFlYXErTVFy?=
 =?utf-8?B?bVFZR1N4Nm5wRE1IWVBoK2llRjl6ZnRMa1VidWNEUXVrZ3pwNTlLaHFmREFV?=
 =?utf-8?B?eDdvZ1lpclA0d3RpRHlmME1GMlREd2R4WGZEQWUxaFVyaEV1TUpMa295dUxB?=
 =?utf-8?B?Skxrb1ExU0JNYkJTNTN5ZWs5MHltdE9LeGl5Rnc0R1dVUTJaREpUNHBGdGo4?=
 =?utf-8?B?S1ZZb21BVVFrVWR2YmVTbHFpZVArY1g5b1hteVVnbHEwRmlrWEExM3ZRaDRO?=
 =?utf-8?B?aFhRWjVSeGNQdWdYbmxVOFZDSFpyc25KVngxYU5MdTRhQ0IzbXkvUVZoZmhj?=
 =?utf-8?B?NzZhK2NZTUppVHU2UTI4Lzg3M3dMOExMNHl1dVpuYkU2bDBvNkMrM1UySEV2?=
 =?utf-8?B?SGpNa204VWJDNkw4c0dyaFhZS3pHYjNnWFJlNzV0SHl2bjlyc000VFpsUTNr?=
 =?utf-8?B?OXZ2WTVOYzhIVERLdTNCaHBGTGdhR255MnFhNXNDR29Ed3IyRXVmZiszaHZ1?=
 =?utf-8?B?NFI0WnBFS21DWDZOSTRja3FMN0RMR2VHZFlmeHVxeVQwMWQwcDhUUW1WN3Rh?=
 =?utf-8?B?aTN0T3BQVmh5S1BNYXNlMUtXYjlYNklnZ3BXODFBS2prSHE4QUllZmdRSkla?=
 =?utf-8?B?WVhUOFgrTHhIU0p5T2ZlVHVZRkpmcXFESzJNMUZ2N1laUzlDdHZZQ1AwZWVN?=
 =?utf-8?Q?EW3t0VWv5/tvuGiilff5Apo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4709971-776c-4f0b-c98e-08de084c526c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:28:22.8131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHFZPWT7fP93pOyEN5R6Io1kem0sR3HDSktK+OJwAOA9O00oqUnJM/gGWMU1R18WghhUqdXzDhkqmVL6XiIwOVwIQB9Ho/f9jftAGMK3LMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Oct 08, 2025 at 02:18:00PM -0700, Ashutosh Dixit wrote:
>Convert OA buffer mmap tests to take 'struct drm_xe_oa_unit *' arguments,
>to enable them to be run on all OA units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 71 +++++++++++++++++++++++----------------------
> 1 file changed, 36 insertions(+), 35 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 01df791dc5..1b16893de3 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4414,7 +4414,7 @@ static void *map_oa_buffer(u32 *size)
> 	return vaddr;
> }
>
>-static void invalid_param_map_oa_buffer(const struct drm_xe_engine_class_instance *hwe)
>+static void invalid_param_map_oa_buffer(struct drm_xe_oa_unit *oau)
> {
> 	void *oa_vaddr = NULL;
>
>@@ -4450,7 +4450,7 @@ static void unprivileged_try_to_map_oa_buffer(void)
> 	igt_assert_eq(errno, EACCES);
> }
>
>-static void unprivileged_map_oa_buffer(const struct drm_xe_engine_class_instance *hwe)
>+static void unprivileged_map_oa_buffer(struct drm_xe_oa_unit *oau)
> {
> 	igt_fork(child, 1) {
> 		igt_drop_root();
>@@ -4484,7 +4484,7 @@ static void try_invalid_access(void *vaddr)
> 	signal(SIGSEGV, old_sigsegv);
> }
>
>-static void map_oa_buffer_unprivilege_access(const struct drm_xe_engine_class_instance *hwe)
>+static void map_oa_buffer_unprivilege_access(struct drm_xe_oa_unit *oau)
> {
> 	void *vaddr;
> 	uint32_t size;
>@@ -4500,7 +4500,7 @@ static void map_oa_buffer_unprivilege_access(const struct drm_xe_engine_class_in
> 	munmap(vaddr, size);
> }
>
>-static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instance *hwe)
>+static void map_oa_buffer_forked_access(struct drm_xe_oa_unit *oau)
> {
> 	void *vaddr;
> 	uint32_t size;
>@@ -4516,10 +4516,10 @@ static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instanc
> }
>
> static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
>-					   const struct drm_xe_engine_class_instance *hwe)
>+					   struct drm_xe_oa_unit *oau)
> {
> 	uint32_t period_us = oa_exponent_to_ns(oa_exponent_default) / 1000;
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t fmt = test_set->perf_oa_format;
> 	uint32_t num_periodic_reports = 0;
> 	uint32_t report_words = get_oa_format(fmt).size >> 2;
>@@ -4537,9 +4537,9 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
> }
>
> static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
>-			       const struct drm_xe_engine_class_instance *hwe)
>+			       struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t fmt = test_set->perf_oa_format;
> 	struct oa_format format = get_oa_format(fmt);
> 	size_t report_words = format.size >> 2;
>@@ -4557,22 +4557,22 @@ static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
> 			sanity_check_reports(reports - 2 * report_words,
> 					     reports - report_words, fmt);
> 			pec_sanity_check_reports(reports - 2 * report_words,
>-						 reports - report_words, metric_set(hwe));
>+						 reports - report_words, oa_unit_metric_set(oau));
> 		}
> 	}
>
> 	igt_assert(timer_reports >= 3);
> }
>
>-static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_instance *hwe)
>+static void check_reports_from_mapped_buffer(struct drm_xe_oa_unit *oau)
> {
> 	void *vaddr;
> 	uint32_t size;
>
> 	vaddr = map_oa_buffer(&size);
>
>-	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
>-	mmap_check_reports(vaddr, size, hwe);
>+	mmap_wait_for_periodic_reports(vaddr, 10, oau);
>+	mmap_check_reports(vaddr, size, oau);
>
> 	munmap(vaddr, size);
> }
>@@ -4581,13 +4581,14 @@ static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_in
>  * SUBTEST: closed-fd-and-unmapped-access
>  * Description: Unmap buffer, close fd and try to access
>  */
>-static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_instance *hwe)
>+static void closed_fd_and_unmapped_access(struct drm_xe_oa_unit *oau)
> {
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>-		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
>-		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
> 	};
> 	struct intel_xe_oa_open_prop param = {
>@@ -4600,8 +4601,8 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
> 	stream_fd = __perf_open(drm_fd, &param, false);
> 	vaddr = map_oa_buffer(&size);
>
>-	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
>-	mmap_check_reports(vaddr, size, hwe);
>+	mmap_wait_for_periodic_reports(vaddr, 10, oau);
>+	mmap_check_reports(vaddr, size, oau);
>
> 	munmap(vaddr, size);
> 	__perf_close(stream_fd);
>@@ -4678,13 +4679,13 @@ test_tail_address_wrap(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>  * SUBTEST: privileged-forked-access-vaddr
>  * Description: Verify that forked access to mapped buffer fails
>  */
>-typedef void (*map_oa_buffer_test_t)(const struct drm_xe_engine_class_instance *hwe);
>+typedef void (*map_oa_buffer_test_t)(struct drm_xe_oa_unit *oau);
> static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
>-				  const struct drm_xe_engine_class_instance *hwe)
>+				  struct drm_xe_oa_unit *oau)
> {
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>@@ -4698,7 +4699,7 @@ static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
> 	stream_fd = __perf_open(drm_fd, &param, false);
>
> 	igt_assert(test_with_fd_open);
>-	test_with_fd_open(hwe);
>+	test_with_fd_open(oau);
>
> 	__perf_close(stream_fd);
> }
>@@ -5236,28 +5237,28 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>
> 	igt_subtest_group {
> 		igt_subtest_with_dynamic("map-oa-buffer")
>-			__for_one_hwe_in_oag(hwe)
>-				test_mapped_oa_buffer(check_reports_from_mapped_buffer, hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_mapped_oa_buffer(check_reports_from_mapped_buffer, oau);
>
> 		igt_subtest_with_dynamic("invalid-map-oa-buffer")
>-			__for_one_hwe_in_oag(hwe)
>-				test_mapped_oa_buffer(invalid_param_map_oa_buffer, hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_mapped_oa_buffer(invalid_param_map_oa_buffer, oau);
>
> 		igt_subtest_with_dynamic("non-privileged-map-oa-buffer")
>-			__for_one_hwe_in_oag(hwe)
>-				test_mapped_oa_buffer(unprivileged_map_oa_buffer, hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_mapped_oa_buffer(unprivileged_map_oa_buffer, oau);
>
> 		igt_subtest_with_dynamic("non-privileged-access-vaddr")
>-			__for_one_hwe_in_oag(hwe)
>-				test_mapped_oa_buffer(map_oa_buffer_unprivilege_access, hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_mapped_oa_buffer(map_oa_buffer_unprivilege_access, oau);
>
> 		igt_subtest_with_dynamic("privileged-forked-access-vaddr")
>-			__for_one_hwe_in_oag(hwe)
>-				test_mapped_oa_buffer(map_oa_buffer_forked_access, hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_mapped_oa_buffer(map_oa_buffer_forked_access, oau);
>
> 		igt_subtest_with_dynamic("closed-fd-and-unmapped-access")
>-			__for_one_hwe_in_oag(hwe)
>-				closed_fd_and_unmapped_access(hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				closed_fd_and_unmapped_access(oau);
> 	}
>
> 	igt_subtest_with_dynamic("tail-address-wrap") {
>-- 
>2.48.1
>
