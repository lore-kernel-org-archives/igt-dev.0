Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1586DCCD19F
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 16:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AB310E2A6;
	Mon, 20 Oct 2025 16:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYafunjG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC6510E2B0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760977622; x=1792513622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lyYd4yJ36WK1Ld6LQdLkeJM1o1tfXsq3GEOu4GXVkek=;
 b=ZYafunjGtnXNjhCYVStqzjzzhNFO4QqHQRa288KKLO637nLSXdOIE8lC
 h/p0+q1su7aVVvZqbfifzPa7sgT3Snx6seU0NgZlMxLZQVPF5eZfuXWB3
 0Qpksk84jPqGaPZmgdp4sfXOlcqFMlxjIwHYuRvA7u0odKghTPUr+b+uL
 3uuTjoZkRsiBBqbHkQ2p5S+zwfO6/oqBWhylLQMJTotVnwMK+i0OyxvGs
 SofC0mI2irirnML70HDYweaS5wG4E58z1UozfLdry23Kg2+KHcz/mRhrL
 g3vZdY91oT7hZpKiWaHiierZhtJrtKy6C+MqdwMGc+W2BhHQlOY5JSCa+ g==;
X-CSE-ConnectionGUID: 0ZriCYPwQX2XDOpOpXGkew==
X-CSE-MsgGUID: 9IM2T74jT0+bpGYHXtNPHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62127899"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62127899"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:27:01 -0700
X-CSE-ConnectionGUID: EKFJmROESzK0jpWfBkVCdw==
X-CSE-MsgGUID: LTHZINH7TKudV/OW+k2mJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="184138216"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 09:27:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:27:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 09:27:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 09:27:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDXKv1PIn1R1Ytyl/v8tFSFg1C+GoiHr+IwLOJrEZSzwdq3F2ESTvjrpCDtv0/leocO0e7kOQe8+QfHtmHq2gk1Wqj15gCjZJ6GN0CbARrjYxCgVwlDrPMLkpPfw+yBApMLIuEEYL6JseSSFgdQzSCzWX+eq76Og2gMpHIBy33lBPtFsICKu1iKaYJ8TPq/F4jCqGYKdIBciLw+9+sV/ZlsPb+sPjh/oJJvw8C4QT89E8kcFA+ZmASiglPqS8UcJ/9US6h49hTpEy+23H/XbFugW3c9SMMeKiQvbDuCr74WaZK6N9CTkZgS8169bKfibeBRQWI/6QsRQFDo0cAX+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zpjrt+HLUjvL4ilVmJwpYG9KsngsKNtOgOqZan0vcxY=;
 b=uFDbPDpvikZnYOvq5uzHulXSmWBo/2094kRaY7K4gS9s1DA2bwVYfxb3h3Z3QNAIT7RJb/nlOiwVA18lDIFOB8M/CtDKMiL9eZ0VZZVwtHTJ7tKpWH03BChMWTo5gScDYBr23DJnZ1kq08fxazPLaCmE4yy0Ppcc4NmIdF7BlktdjkBSnEIV+OH7h5hvlA00rR0cXtc3aTQZoRf+lOtp/mRXQeKVCJepKWc4Xd0l6JVu/nrHuYNwTkHAKcCLnX4Qf2qj12J4f0M5ZTLqMrshaEy6MygfOBfWR8MvYRa0ZcaO8QG8i/UOG1MWI95D25f4yKDmoqGyNBqJDkpGF4B+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 16:26:58 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 16:26:58 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v1 3/3] tests/xe_sriov_flr: extend VF FLR test for multi-tile
 Xe devices
Date: Mon, 20 Oct 2025 18:26:33 +0200
Message-ID: <20251020162633.2622396-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020162633.2622396-1-piotr.piorkowski@intel.com>
References: <20251020162633.2622396-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0002.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: e65692d4-4ad2-4aaf-b412-08de0ff57d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmUxREVqTE0xVXMxYVh3SW9YSUNsMFRSWmZFam9rdEwzc3pZc1UzSlk5T1VK?=
 =?utf-8?B?S1BWY3BkNGFNV3hTMUx1SVJQUmYyTDRGY21mWU5Gc2VSV2xvTXlBdWtSclR2?=
 =?utf-8?B?YmZHVSsxZFVzMXJZakxsQ0VjTjk3SEo0T0htODZJUzFGVExueWMrS1ZNWHFD?=
 =?utf-8?B?OE9Ucm16eDU3bzRIVXRIbWtoa0dISkM0dEdZOVJoUGdBOGl5cCtSQkJZRlEw?=
 =?utf-8?B?UWtWenJtL0RqcVloRGUwVkd0b2VJOWJ1cXVwU0VONzZoVVNPOWNVV3dyS29F?=
 =?utf-8?B?d3B6UzNPYndXOTdTRUVLdEthYXZzcllxZTNjanJ6Z2Q1RzZobU5SbVpIM1RJ?=
 =?utf-8?B?bFFFUmMrcTJqVGROT1YvMFU3MEFva1VMckNLcjFITUpTNHczMDNzOFNjb2RY?=
 =?utf-8?B?UVIrK24wWjl2MXc3N25UUEoyaHRjeUVCcEtrRVMvbjZETVhHRnVLdzRFWGtR?=
 =?utf-8?B?NUwwTlRkUTZ1a3piOGthL0hEbmJXeENHM2xvM250M2hTQXBjWktleVhYT0Qv?=
 =?utf-8?B?dkIyU3p4dXYwdHNTMXpiN3JrRnByRTJYeWJESFplSFBWTDVqQlRPcG5PL2pw?=
 =?utf-8?B?YzBhS3NZZm10UFBONHF4V0N2WGhZdzlBd3ZkRytPNS9LbXdCU0tZQTVJcVBV?=
 =?utf-8?B?Q3VhRFN4QkRsZDMxTno5dksvdEhqN3NTUzQ2dGdWcXpxTmNtY1dTZ0Q2ZWlJ?=
 =?utf-8?B?N0xCc3ByVk1zNDBpYkFHMmVaOTFvUWR2cGpqdGo2N2NKbEpSbmZXN3pDQzV5?=
 =?utf-8?B?MGcxUk5aZjRkekQzTkhoVGNLWCtTenBndnlOc3JqTzNLeWVPMURMeE1ZZS8w?=
 =?utf-8?B?OXEybTFtSC92K1lJYXZIZEk5T1ozRWlSQkRCeDJycjV5VGdpait2aVcvM056?=
 =?utf-8?B?R1hKRElCTC9rdDZTenhBWTZSV2Vhdmdnd29Rbk9NY2YwZ1NXL3NSa05jN1Zj?=
 =?utf-8?B?Q2hqZUZtMFlSYWl0YTc2Z3Bmc3MrbnpXU3lLczh6dzBPQ2dIZDAvSjZTUjZL?=
 =?utf-8?B?NFhOdmlMcUx4T3ZLeEhUTHNtL1ZIUVc5NmNqMkRrb3J3ZFhpYXIxVFJ2UUFl?=
 =?utf-8?B?WVQyWkJueFFmV1Rwb0poQUhaZExKZEV0ekE1YnE0YjUwZVNJaDM2aml2RTVQ?=
 =?utf-8?B?Y0ZHNTRRclpYQ2huZW9zTHpVRGhEeUdyTjIzQVYzMFlhNG52N1g5QlVjTDhp?=
 =?utf-8?B?ZnRkVUY3cVBCSGdTczlIdVpkVjNwN3RFbE16SmhKQ3FlWlZLRTJ0UkFJa2Nk?=
 =?utf-8?B?dkIrek1ZRzYraWhWb0NLNGVYUVpMdVZGZVlEY05SUHBsNTkvNS9kb0Y1bkhj?=
 =?utf-8?B?Ly9QSUdvOE45Y3dWWTIyRklUdStjZWtLc095Rlp3Z0tsMVROVEhGNlF0TVFR?=
 =?utf-8?B?T1Z6dEx5Zk1ucXhZNkFYL0lOc3R6L2NmTTJiSm93TG5LQ2xXV1U0TnIzWlZY?=
 =?utf-8?B?NWZjWXFleWZreW1uMzdjWVZYOU1jdHFXdGJldmZxZFpWK2JNRGZ5VUlOeGV4?=
 =?utf-8?B?Rk9kODF6U1VNQnp0eUZIUzNtWFdESGRFc2Q0d3lwUGpiUTdSWVU1UUNqa0N0?=
 =?utf-8?B?b3Q1dGYvbitjdTFPNGduL0ZUVFh5bTJtMjJQaENXbXdBdk9DVHpWR3QyajRy?=
 =?utf-8?B?Y3RCakNYd25hQ0U0REZtMXBKNDgvMVlNdEM1ZmU2SmRxUkZ3L3NOQ1dZNW5s?=
 =?utf-8?B?T1BwQktoN2lIRVQ0N0FOVENDMzdNYUNMcjRZYnFFcE9nS0FZQi9zRDRha0pw?=
 =?utf-8?B?UEZ4anVJRDJ6SkJOYWZlQU9ReFlnTmhkVWVKQ2p4VitxZm9HaUJGN0NURFFS?=
 =?utf-8?B?NkhhaTZFaWVzbERGUDRZWkwvZzR2V3ZQNXZXb2F3QVV1RncxbUYzczVNNi96?=
 =?utf-8?B?Q1lGL09GWlFXOGFxNVQ0cyswdDlMeWx1R1V3OVRVYzU4T0tteUxMTGZoeUM4?=
 =?utf-8?Q?wbAmQNKu6BCoY/EAS5BMmosoLUUki8pV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0g0QXNGY0JuN3dBeTl4L04rKzVFTDA4KzJyUk5RM2RhUmJDZnpnWUtYdG9J?=
 =?utf-8?B?S1psdElxcHFBRDVjSDVvNTljSjdWSHhDQkYwd0t6RzNVeE1scHlHbVEvdU1s?=
 =?utf-8?B?MWtJa3NHMmxaWlFwZ0kzSlRIQ3Y5SVBmZFYrVzhMeFJmVHhOekdtLzMwL21J?=
 =?utf-8?B?N3lYSzJsanh3em9UWk1NS0NCYStaMm5pZHZ1OFdDMGtjYkViamdJRzBQVTMx?=
 =?utf-8?B?TW45NGxHU1dLR0MxMk85LzNmTUZVbEtaSUgzOW9ZVldBeFdpRmNyQUMyeFZV?=
 =?utf-8?B?bXZGbHhhUjQxblpUbFRqc1F5ZkdGYWZQSzFQL3lBcTY5U0ppNnFVOHVXTkU3?=
 =?utf-8?B?bWpLdVhDU3FsdE0ycHRiZzB1RHpaMVFGcUdBWkFUSUM5SFMxVEs3eklSVXZa?=
 =?utf-8?B?bEExaFZ3Z1dXZWFrMXRMRkprVWdRNEZ1TUNKMkJRM2xkd3FiR0lGQ1Flbm0z?=
 =?utf-8?B?Z0liOG1XYjR5ZTYrNUFoWDBSc3dxbVZIemZJWmNMZlBCcVRJWVJ5c2lnWGw4?=
 =?utf-8?B?WUUvVCszTWtDejJ2SDZjelduTjhrOVh0WGhNYmJxTXo0bWg0Tm9PQk4xNUhK?=
 =?utf-8?B?VGM4ckR0cS9mSWFuVnBJWVFkVEhxZ3MvOHFzSHdNMXpkRDBrclpsQm9PSzJF?=
 =?utf-8?B?NnhwRkNPVTQvNHBUaWZscm5lRk5udWM4R0tORFRqS1g1Um9sZ0pJZ1NQbitv?=
 =?utf-8?B?UXV1b29EZVhFdzJsOVZTdjRyNGZweXhWN3RZVzJHVUZnc3c3UmRiSHhSOWFu?=
 =?utf-8?B?Y0tUY0lVNFl2L0E1MWkwZEtwdWRtYWJEdnM2MUQ0YTY0MjJCcnlCYWFJRnpR?=
 =?utf-8?B?SzBRaHZmbk5jZ2lIY3BXVUdpSDRpRi9TMW1qd1pkeW02ZXVQMWlkVlVHRTk4?=
 =?utf-8?B?RnJHazAxZnVSOXU2RWtkMHRZRi9Ib0U5eUx5RzFGS1JwWHJtTzQ2TnhzTXVN?=
 =?utf-8?B?TzN6OHF3SGhSdjNGdHVDNFBWK2FUSE1FdVIyUjRLUi9xeEVxdUczNVh5ZGRs?=
 =?utf-8?B?TGtXMWpqMGtzUTVDdmw3Y1l3WXJsWTYrYXQxRVlReTBsWElvRnF3eW5YUWFC?=
 =?utf-8?B?d3F6dUVsNUl1QVJIa042bzZDWFpNTWhZck8rMGtJQ3F5cURqZUR0Vkd6b3Vt?=
 =?utf-8?B?aE5WaCs3cG90OXpvQ2pESlZpK2h1aW5SNG9qTUtmTkZIL0VPTGorRDRZdkRq?=
 =?utf-8?B?dkxnMVhUVDVldlpyUkJaV2xveUdoeTVRdkVJNUxldE40cUtKenJFRHgyWUN2?=
 =?utf-8?B?OWIzWjc1bkNlU3VaNFpxK3hKNHFsYkVoemlpOEFCTlZRNGROTmdlNDQ0bVJC?=
 =?utf-8?B?STVUcXNzc1dKL2M4YU1EdE9DL2o0UzhiclN0OWo1VTBFelpudkJ5R2lxZGFk?=
 =?utf-8?B?V3lzRTBUSnBUWWh4SVUzaWpqK21aQnpqTHVaTDNSZS9PcmJXblNBNXZiQjJX?=
 =?utf-8?B?MXN6SGJnQUd2RGRHSk90WXBIV0tQWHNPOU83YXR5K0QxVUpnWUdmUnhLOGlK?=
 =?utf-8?B?QStMTXhiWXVNN2VicUtuTGtnc0YvdkV2c0ZQUkV2NWFyTHg5Q25tVFRaakpY?=
 =?utf-8?B?VWgxVG9mbk0yRk1jQndHQUFqdDJQcU8ySlpQdVdmTXB5ay9xZ3lFVWRBWnAx?=
 =?utf-8?B?bUlMOFNUTm1NK0xQZkJRb1p0eFFYTGVaTzNmdXdPMkFJbC9GWGZ0WGdET1pU?=
 =?utf-8?B?WGRrV08zU2J2S0NubHNudk5aTVd1QlZtY3ZVQjBsNzVGdm5EV3p6aHhBQzR5?=
 =?utf-8?B?UFg2VG10UjIrUjVzREdiUVdzanljdnBvaFB1UU5YRFB0aUduTzQ2SGgxc04y?=
 =?utf-8?B?b05sWWlCYjhYbXRrOFg0dWU4eFUzQzJQMDZqdVVoTmFONEFWSE5YZWM5UVFZ?=
 =?utf-8?B?anNXamZwdVU1TWpPTGMxU3BKdWtlMFU1MzVTWERySEZBeTY1QWJLUm16d3JN?=
 =?utf-8?B?ODgxUk5jNjJpVXNPSHlFZHdhZXJDbnBVYXQvQjhGazR6ZWZreDZ3UElKR0Z6?=
 =?utf-8?B?dW9OV3Y3Y2JkR2pXT1l6N3diVTB4QXdHVG1SZUVhUC96a3NJc2J6OFYwNHZq?=
 =?utf-8?B?RUVCQ2R6SjBPSjB2Mm9IdWYwRUMvSVdlUWg4UlFJMTRFTkF1eVlZY1E0Z3pI?=
 =?utf-8?B?OEhOUWF6NjFQb0MwQ1pacGVjYzdkMjNJNlFVeldzQXovQ3pac1lZU1IrZmVN?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e65692d4-4ad2-4aaf-b412-08de0ff57d4b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:26:58.0444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVbm0f6a5TTtz/7t4EqDOaVmkWNFScuQWHd1qxvDFVTGuDYorWHT0Oi4vB66gMDb0/mkm7mUS+TjWIvrt0by1mZjZlS+YtgvcQBbXMjP394=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's introduce tile-level iteration and per-tile resource management
for GGTT, LMEM, and register subchecks.

Key updates:
 - Add xe_number_tiles() and xe_tile_get_main_gt_id() helpers.
 - Introduce xe_for_each_tile() macro for tile iteration.
 - Refactor subcheck callbacks to include tile-aware arguments.
 - Replace GT-based logic with per-tile handling for GGTT and LMEM.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/xe/xe_query.c          |  45 ++++
 lib/xe/xe_query.h          |   6 +
 tests/intel/xe_sriov_flr.c | 513 ++++++++++++++++++++-----------------
 3 files changed, 334 insertions(+), 230 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a89e0b980..14677e862 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -515,6 +515,22 @@ unsigned int xe_dev_max_gt(int fd)
 	return igt_fls(xe_dev->gt_mask) - 1;
 }
 
+/**
+ * xe_number_tiles
+ * @fd: xe device fd
+ *
+ * Return number of tiles for xe device fd.
+ */
+uint8_t xe_number_tiles(int fd)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	return (uint8_t)__builtin_popcountll(xe_dev->tile_mask);
+}
+
 /**
  * all_memory_regions:
  * @fd: xe device fd
@@ -995,6 +1011,35 @@ uint16_t xe_gt_get_tile_id(int fd, int gt)
 	return xe_dev->gt_list->gt_list[gt].tile_id;
 }
 
+/**
+ * xe_tile_get_main_gt_id:
+ * @fd: xe device fd
+ * @tile: tile id
+ *
+ * Returns main GT ID for given @tile.
+ */
+uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile)
+{
+	struct xe_device *xe_dev;
+	int gt_id = -1;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	for (int i = 0; i < xe_dev->gt_list->num_gt; i++) {
+		const struct drm_xe_gt *gt_data = &xe_dev->gt_list->gt_list[i];
+
+		if (gt_data->tile_id == tile && gt_data->type == DRM_XE_QUERY_GT_TYPE_MAIN) {
+			gt_id = gt_data->gt_id;
+			break;
+		}
+	}
+
+	igt_assert_f(gt_id >= 0, "No main GT found for tile %d\n", tile);
+
+	return gt_id;
+}
+
 /**
  * xe_hwconfig_lookup_value:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 715b64e2f..e1ed61675 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -86,6 +86,10 @@ struct xe_device {
 	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
 	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
 	     igt_unique(__mask) &= ~(1ull << __gt))
+#define xe_for_each_tile(__fd, __tile) \
+	for (uint8_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
+	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
+	     igt_unique(__mask) &= ~(1ull << __tile))
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
 	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
 		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
@@ -101,6 +105,7 @@ struct xe_device {
 
 unsigned int xe_number_gt(int fd);
 unsigned int xe_dev_max_gt(int fd);
+uint8_t xe_number_tiles(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 const struct drm_xe_gt *drm_xe_get_gt(struct xe_device *xe_dev, int gt_id);
@@ -135,6 +140,7 @@ uint16_t xe_gt_type(int fd, int gt);
 bool xe_is_media_gt(int fd, int gt);
 bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
+uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 59e4d215c..b58545384 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -53,7 +53,9 @@
 
 IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
 
-const char *SKIP_REASON = "SKIP";
+#define STOP_REASON_ABORT "ABORT"
+#define STOP_REASON_FAIL "FAIL"
+#define STOP_REASON_SKIP "SKIP"
 
 /**
  * struct subcheck_data - Base structure for subcheck data.
@@ -66,8 +68,6 @@ const char *SKIP_REASON = "SKIP";
  * @pf_fd: File descriptor for the Physical Function.
  * @num_vfs: Number of Virtual Functions (VFs) enabled and under test. This count is
  *           used to iterate over and manage the VFs during the testing process.
- * @gt: GT under test. This identifier is used to specify a particular GT
- *      for operations when GT-specific testing is required.
  * @stop_reason: Pointer to a string that indicates why a subcheck should skip or fail.
  *               This field is crucial for controlling the flow of subcheck execution.
  *               If set, it should prevent further execution of the current subcheck,
@@ -79,12 +79,11 @@ const char *SKIP_REASON = "SKIP";
  * Example usage:
  * A typical use of this structure involves initializing it with the necessary test setup
  * parameters, checking the `stop_reason` field before proceeding with each subcheck operation,
- * and using `pf_fd`, `num_vfs`, and `gt` as needed based on the specific subcheck requirements.
+ * and using `pf_fd` and `num_vfs` as needed based on the specific subcheck requirements.
  */
 struct subcheck_data {
 	int pf_fd;
-	int num_vfs;
-	int gt;
+	unsigned int num_vfs;
 	char *stop_reason;
 };
 
@@ -100,37 +99,48 @@ struct subcheck_data {
  *
  * @name: Name of the subcheck operation, used for identification and reporting.
  *
+ * @alloc: Allocate resources for the subcheck.
+ *   @param data: Shared data needed for allocation.
+ *   @param num_tiles: Number of tiles in the device (for multi-tile devices).
+ *   @param num_vfs: Number of VFs enabled on the PF.
+ *
  * @init: Initialize the subcheck environment.
  *   Sets up the initial state required for the subcheck, including preparing
  *   resources and ensuring the system is ready for testing.
  *   @param data: Shared data needed for initialization.
+ *   @param tile: Tile index for multi-tile devices.
  *
  * @prepare_vf: Prepare subcheck data for a specific VF.
  *   Called for each VF before FLR is performed. It might involve marking
  *   specific memory regions or setting up PTE addresses.
- *   @param vf_id: Identifier of the VF being prepared.
  *   @param data: Shared common data.
+ *   @param tile: Tile index for multi-tile devices.
+ *   @param vf_id: Identifier of the VF being prepared.
  *
  * @verify_vf: Verify the state of a VF after FLR.
  *   Checks the VF's state post FLR to ensure the expected results,
  *   such as verifying that only the FLRed VF has its state reset.
+ *   @param data: Shared common data.
+ *   @param flr_vf_id: Identifier of the VF that underwent FLR.
+ *
  *   @param vf_id: Identifier of the VF to verify.
  *   @param flr_vf_id: Identifier of the VF that underwent FLR.
- *   @param data: Shared common data.
  *
  * @cleanup: Clean up the subcheck environment.
  *   Releases resources and restores the system to its original state
  *   after the subchecks, ensuring no resource leaks and preparing the system
  *   for subsequent tests.
  *   @param data: Shared common data.
+ *   @param num_tiles: Number of tiles in the device (for multi-tile devices).
  */
 struct subcheck {
 	struct subcheck_data *data;
 	const char *name;
-	void (*init)(struct subcheck_data *data);
-	void (*prepare_vf)(int vf_id, struct subcheck_data *data);
-	void (*verify_vf)(int vf_id, int flr_vf_id, struct subcheck_data *data);
-	void (*cleanup)(struct subcheck_data *data);
+	void (*alloc)(struct subcheck_data *data, uint8_t num_tiles, unsigned int num_vfs);
+	void (*init)(struct subcheck_data *data, uint8_t tile);
+	void (*prepare_vf)(struct subcheck_data *data, uint8_t tile, int vf_id);
+	void (*verify_vf)(struct subcheck_data *data, uint8_t tile, int vf_id, int flr_vf_id);
+	void (*cleanup)(struct subcheck_data *data, uint8_t num_tiles);
 };
 
 __attribute__((format(printf, 3, 0)))
@@ -154,12 +164,12 @@ static void set_stop_reason_v(struct subcheck_data *data, const char *prefix,
 }
 
 __attribute__((format(printf, 2, 3)))
-static void set_skip_reason(struct subcheck_data *data, const char *format, ...)
+static void set_abort_reason(struct subcheck_data *data, const char *format, ...)
 {
 	va_list args;
 
 	va_start(args, format);
-	set_stop_reason_v(data, SKIP_REASON, format, args);
+	set_stop_reason_v(data, STOP_REASON_ABORT, format, args);
 	va_end(args);
 }
 
@@ -169,7 +179,17 @@ static void set_fail_reason(struct subcheck_data *data, const char *format, ...)
 	va_list args;
 
 	va_start(args, format);
-	set_stop_reason_v(data, "FAIL", format, args);
+	set_stop_reason_v(data, STOP_REASON_FAIL, format, args);
+	va_end(args);
+}
+
+__attribute__((format(printf, 2, 3)))
+static void set_skip_reason(struct subcheck_data *data, const char *format, ...)
+{
+	va_list args;
+
+	va_start(args, format);
+	set_stop_reason_v(data, STOP_REASON_SKIP, format, args);
 	va_end(args);
 }
 
@@ -197,7 +217,7 @@ static bool no_subchecks_can_proceed(struct subcheck *checks, int num_checks)
 static bool is_subcheck_skipped(struct subcheck *subcheck)
 {
 	return subcheck->data && subcheck->data->stop_reason &&
-	       !strncmp(SKIP_REASON, subcheck->data->stop_reason, strlen(SKIP_REASON));
+	       !strncmp(STOP_REASON_SKIP, subcheck->data->stop_reason, strlen(STOP_REASON_SKIP));
 }
 
 static void subchecks_report_results(struct subcheck *checks, int num_checks)
@@ -269,10 +289,12 @@ typedef int (*flr_exec_strategy)(int pf_fd, int num_vfs,
  * A timeout is used to wait for FLR operations to complete.
  */
 static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
-		       int num_checks, flr_exec_strategy exec_strategy)
+		       size_t num_checks, flr_exec_strategy exec_strategy)
 {
 	const int wait_flr_ms = 200;
 	int i, vf_id, flr_vf_id = -1;
+	uint8_t num_tiles = xe_number_tiles(pf_fd);
+	uint8_t tile;
 
 	igt_sriov_disable_driver_autoprobe(pf_fd);
 	igt_sriov_enable_vfs(pf_fd, num_vfs);
@@ -284,12 +306,19 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 		goto disable_vfs;
 
 	for (i = 0; i < num_checks; ++i)
-		checks[i].init(checks[i].data);
+		if (checks[i].alloc)
+			checks[i].alloc(checks[i].data, num_tiles, num_vfs);
 
-	for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
+	xe_for_each_tile(pf_fd, tile) {
 		for (i = 0; i < num_checks; ++i)
 			if (subcheck_can_proceed(&checks[i]))
-				checks[i].prepare_vf(vf_id, checks[i].data);
+				checks[i].init(checks[i].data, tile);
+
+		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
+			for (i = 0; i < num_checks; ++i)
+				if (subcheck_can_proceed(&checks[i]))
+					checks[i].prepare_vf(checks[i].data, tile, vf_id);
+	}
 
 	if (no_subchecks_can_proceed(checks, num_checks))
 		goto cleanup;
@@ -299,7 +328,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 
 cleanup:
 	for (i = 0; i < num_checks; ++i)
-		checks[i].cleanup(checks[i].data);
+		checks[i].cleanup(checks[i].data, num_tiles);
 
 disable_vfs:
 	igt_sriov_disable_vfs(pf_fd);
@@ -315,6 +344,7 @@ static int execute_sequential_flr(int pf_fd, int num_vfs,
 				  const int wait_flr_ms)
 {
 	int i, vf_id, flr_vf_id = 1;
+	uint8_t tile;
 
 	do {
 		if (igt_warn_on_f(!igt_sriov_device_reset(pf_fd, flr_vf_id),
@@ -324,16 +354,20 @@ static int execute_sequential_flr(int pf_fd, int num_vfs,
 		/* Assume FLR is finished after wait_flr_ms */
 		usleep(wait_flr_ms * 1000);
 
-		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
-			for (i = 0; i < num_checks; ++i)
-				if (subcheck_can_proceed(&checks[i]))
-					checks[i].verify_vf(vf_id, flr_vf_id, checks[i].data);
-
-		/* Reinitialize test data for the FLRed VF */
-		if (flr_vf_id < num_vfs)
-			for (i = 0; i < num_checks; ++i)
-				if (subcheck_can_proceed(&checks[i]))
-					checks[i].prepare_vf(flr_vf_id, checks[i].data);
+		xe_for_each_tile(pf_fd, tile) {
+			for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
+				for (i = 0; i < num_checks; ++i)
+					if (subcheck_can_proceed(&checks[i]))
+						checks[i].verify_vf(checks[i].data, tile, vf_id,
+								    flr_vf_id);
+
+			/* Reinitialize test data for the FLRed VF */
+			if (flr_vf_id < num_vfs)
+				for (i = 0; i < num_checks; ++i)
+					if (subcheck_can_proceed(&checks[i]))
+						checks[i].prepare_vf(checks[i].data, tile,
+								     flr_vf_id);
+		}
 
 		if (no_subchecks_can_proceed(checks, num_checks))
 			break;
@@ -431,15 +465,19 @@ cleanup_threads:
 
 	/* Verify results */
 	for (i = 0; i < created_threads; ++i) {
+		uint8_t tile;
+
 		vf_id = thread_data[i].vf_id;
 
 		/* Skip already checked VF or if the FLR initiation failed */
 		if (vf_id == last_vf_id || thread_data[i].result != 0)
 			continue;
 
-		for (k = 0; k < num_checks; ++k)
-			if (subcheck_can_proceed(&checks[k]))
-				checks[k].verify_vf(vf_id, vf_id, checks[k].data);
+		xe_for_each_tile(pf_fd, tile) {
+			for (k = 0; k < num_checks; ++k)
+				if (subcheck_can_proceed(&checks[k]))
+					checks[k].verify_vf(checks[k].data, tile, vf_id, vf_id);
+		}
 
 		if (no_subchecks_can_proceed(checks, num_checks))
 			break;
@@ -470,8 +508,8 @@ static int execute_parallel_flr_twice(int pf_fd, int num_vfs,
 #define GGTT_PTE_ADDR_SHIFT			12
 
 struct ggtt_ops {
-	void (*set_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
-	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
+	void (*set_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset, xe_ggtt_pte_t pte);
+	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset);
 };
 
 struct ggtt_provisioned_offset_range {
@@ -486,74 +524,89 @@ struct ggtt_provisioned_offset_range {
 
 struct ggtt_data {
 	struct subcheck_data base;
-	struct ggtt_provisioned_offset_range *pte_offsets;
+	struct ggtt_provisioned_offset_range **pte_offsets;
 	struct xe_mmio *mmio;
 	struct ggtt_ops ggtt;
 };
 
-static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
+static void ggtt_subcheck_alloc(struct subcheck_data *data, uint8_t num_tiles, unsigned int num_vfs)
 {
-	return xe_mmio_ggtt_read(mmio, 0, pte_offset);
+	struct ggtt_data *gdata = (struct ggtt_data *)data;
+
+	gdata->pte_offsets = calloc(num_tiles, sizeof(*gdata->pte_offsets));
+	if (!gdata->pte_offsets) {
+		set_abort_reason(data, "Failed to allocate memory for pte_offsets array\n");
+		return;
+	}
+
+	for (uint8_t tile = 0; tile < num_tiles; tile++) {
+		gdata->pte_offsets[tile] = calloc(num_vfs + 1, sizeof(**gdata->pte_offsets));
+		if (!gdata->pte_offsets[tile]) {
+			set_abort_reason(data, "Failed to allocate memory for pte_offsets[%u]\n",
+					 tile);
+			return;
+		}
+	}
 }
 
-static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
+static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset)
 {
-	xe_mmio_ggtt_write(mmio, 0, pte_offset, pte);
+	return xe_mmio_ggtt_read(mmio, tile, pte_offset);
 }
 
-static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
+static void intel_set_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset,
+			  xe_ggtt_pte_t pte)
 {
-	xe_mmio_ggtt_write(mmio, 0, pte_offset, pte);
+	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
+}
+
+static void intel_mtl_set_pte(struct xe_mmio *mmio, uint8_t tile, uint32_t pte_offset,
+			      xe_ggtt_pte_t pte)
+{
+	xe_mmio_ggtt_write(mmio, tile, pte_offset, pte);
 
 	/* force flush by read some MMIO register */
-	xe_mmio_tile_read32(mmio, 0, GEN12_VF_CAP_REG);
+	xe_mmio_tile_read32(mmio, tile, GEN12_VF_CAP_REG);
 }
 
-static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
-			uint8_t gpa, xe_ggtt_pte_t *out)
+static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
+			uint32_t pte_offset, uint8_t gpa, xe_ggtt_pte_t *out)
 {
 	xe_ggtt_pte_t pte;
 
-	pte = ggtt->get_pte(mmio, gt, pte_offset);
+	pte = ggtt->get_pte(mmio, tile, pte_offset);
 	pte &= ~GGTT_PTE_TEST_FIELD_MASK;
 	pte |= ((xe_ggtt_pte_t)gpa << GGTT_PTE_ADDR_SHIFT) & GGTT_PTE_TEST_FIELD_MASK;
-	ggtt->set_pte(mmio, gt, pte_offset, pte);
-	*out = ggtt->get_pte(mmio, gt, pte_offset);
+	ggtt->set_pte(mmio, tile, pte_offset, pte);
+	*out = ggtt->get_pte(mmio, tile, pte_offset);
 
 	return *out == pte;
 }
 
-static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
-			  uint8_t expected_gpa, xe_ggtt_pte_t *out)
+static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, uint8_t tile,
+			  uint32_t pte_offset, uint8_t expected_gpa, xe_ggtt_pte_t *out)
 {
 	uint8_t val;
 
-	*out = ggtt->get_pte(mmio, gt, pte_offset);
+	*out = ggtt->get_pte(mmio, tile, pte_offset);
 	val = (uint8_t)((*out & GGTT_PTE_TEST_FIELD_MASK) >> GGTT_PTE_ADDR_SHIFT);
 
 	return val == expected_gpa;
 }
 
-static bool is_intel_mmio_initialized(const struct intel_mmio_data *mmio)
-{
-	return mmio->dev;
-}
-
-static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
+static void populate_ggtt_pte_offsets(struct ggtt_data *gdata, uint8_t tile)
 {
 	int ret, pf_fd = gdata->base.pf_fd, num_vfs = gdata->base.num_vfs;
 	struct xe_sriov_provisioned_range *ranges;
-	unsigned int nr_ranges, gt = gdata->base.gt;
+	unsigned int nr_ranges;
 
-	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
-	igt_assert(gdata->pte_offsets);
-
-	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, 0, gdata->mmio,
+	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, gdata->mmio,
 							 &ranges, &nr_ranges);
 	if (ret) {
-		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges on gt%u (%d)\n",
-				gt, ret);
-		return -1;
+		set_abort_reason(&gdata->base,
+				 "Tile%u: Failed to scan GGTT PTE offset ranges (%d)\n",
+				 tile, ret);
+		return;
 	}
 
 	for (unsigned int i = 0; i < nr_ranges; ++i) {
@@ -563,46 +616,38 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 			continue;
 
 		if (vf_id < 1 || vf_id > num_vfs) {
-			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
-					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
-			free(ranges);
-			return -1;
+			set_abort_reason(&gdata->base,
+					 "Tile%u: Unexpected VF%u at range entry %u [%#" PRIx64 "-%#" PRIx64 "], num_vfs=%u\n",
+					 tile, vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
+			goto out;
 		}
 
-		if (gdata->pte_offsets[vf_id].end) {
-			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
-					vf_id);
-			free(ranges);
-			return -1;
+		if (gdata->pte_offsets[tile][vf_id].end) {
+			set_abort_reason(&gdata->base,
+					 "Tile%u: Duplicate GGTT PTE offset range for VF%u\n",
+					 tile, vf_id);
+			goto out;
 		}
 
-		gdata->pte_offsets[vf_id].start = ranges[i].start;
-		gdata->pte_offsets[vf_id].end = ranges[i].end;
+		gdata->pte_offsets[tile][vf_id].start = ranges[i].start;
+		gdata->pte_offsets[tile][vf_id].end = ranges[i].end;
 	}
 
-	free(ranges);
-
 	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
-		if (!gdata->pte_offsets[vf_id].end) {
-			set_skip_reason(&gdata->base,
-					"Failed to find VF%u provisioned GGTT PTE offset range\n",
-					vf_id);
-			return -1;
+		if (!gdata->pte_offsets[tile][vf_id].end) {
+			set_abort_reason(&gdata->base,
+					 "Tile%u: Failed to find VF%u provisioned GGTT PTE offset range\n",
+					 tile, vf_id);
+			goto out;
 		}
-
-	return 0;
+out:
+	free(ranges);
 }
 
-static void ggtt_subcheck_init(struct subcheck_data *data)
+static void ggtt_subcheck_init(struct subcheck_data *data, uint8_t tile)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 
-	if (!xe_is_main_gt(data->pf_fd, data->gt)) {
-		set_skip_reason(data, "GGTT provisioning not exposed on GT%d (non-MAIN)\n",
-				data->gt);
-		return;
-	}
-
 	gdata->ggtt.get_pte = intel_get_pte;
 	if (IS_METEORLAKE(intel_get_drm_devid(data->pf_fd)))
 		gdata->ggtt.set_pte = intel_mtl_set_pte;
@@ -610,16 +655,16 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
 		gdata->ggtt.set_pte = intel_set_pte;
 
 	if (gdata->mmio) {
-		if (!is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
-			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
+		if (!xe_mmio_is_initialized(gdata->mmio))
+			xe_mmio_access_init(data->pf_fd, gdata->mmio);
 
-		populate_ggtt_pte_offsets(gdata);
+		populate_ggtt_pte_offsets(gdata, tile);
 	} else {
-		set_skip_reason(data, "xe_mmio is NULL\n");
+		set_abort_reason(data, "xe_mmio is NULL\n");
 	}
 }
 
-static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+static void ggtt_subcheck_prepare_vf(struct subcheck_data *data, uint8_t tile, int vf_id)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 	xe_ggtt_pte_t pte;
@@ -628,22 +673,23 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 	if (data->stop_reason)
 		return;
 
-	igt_debug("Prepare gpa on VF%u offset range [%#x-%#x]\n", vf_id,
-		  gdata->pte_offsets[vf_id].start,
-		  gdata->pte_offsets[vf_id].end);
+	igt_debug("Tile%u: Prepare gpa on VF%u offset range [%#x-%#x]\n", tile, vf_id,
+		  gdata->pte_offsets[tile][vf_id].start,
+		  gdata->pte_offsets[tile][vf_id].end);
 
-	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
-		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
+	for_each_pte_offset(pte_offset, &gdata->pte_offsets[tile][vf_id]) {
+		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, tile, pte_offset,
 				 (uint8_t)vf_id, &pte)) {
 			set_skip_reason(data,
-					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
-					vf_id, pte, pte_offset);
+					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x on tile%u\n",
+					vf_id, pte, pte_offset, tile);
 			return;
 		}
 	}
 }
 
-static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+static void ggtt_subcheck_verify_vf(struct subcheck_data *data, uint8_t tile, int vf_id,
+				    int flr_vf_id)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 	uint8_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
@@ -653,33 +699,62 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 	if (data->stop_reason)
 		return;
 
-	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
-		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
+	for_each_pte_offset(pte_offset, &gdata->pte_offsets[tile][vf_id]) {
+		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, tile, pte_offset,
 				   expected, &pte)) {
 			set_fail_reason(data,
-					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
-					flr_vf_id, vf_id, pte, pte_offset);
+					"Tile%u: GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
+					tile, flr_vf_id, vf_id, pte, pte_offset);
 			return;
 		}
 	}
 }
 
-static void ggtt_subcheck_cleanup(struct subcheck_data *data)
+static void ggtt_subcheck_cleanup(struct subcheck_data *data, uint8_t num_tiles)
 {
 	struct ggtt_data *gdata = (struct ggtt_data *)data;
 
-	free(gdata->pte_offsets);
-	if (gdata->mmio && is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
+	if (gdata->pte_offsets) {
+		for (uint8_t tile = 0; tile < num_tiles; tile++)
+			free(gdata->pte_offsets[tile]);
+		free(gdata->pte_offsets);
+	}
+
+	if (gdata->mmio && xe_mmio_is_initialized(gdata->mmio))
 		xe_mmio_access_fini(gdata->mmio);
 }
-
 struct lmem_data {
 	struct subcheck_data base;
-	size_t *vf_lmem_size;
+	size_t **vf_lmem_size;
 };
 
 const size_t STEP = SZ_1M;
 
+static void lmem_subcheck_alloc(struct subcheck_data *data, uint8_t num_tiles, unsigned int num_vfs)
+{
+	struct lmem_data *ldata = (struct lmem_data *)data;
+
+	if (!xe_has_vram(data->pf_fd)) {
+		set_skip_reason(data, "No LMEM\n");
+		return;
+	}
+
+	ldata->vf_lmem_size = calloc(num_vfs + 1, sizeof(size_t *));
+	if (!ldata->vf_lmem_size) {
+		set_abort_reason(data, "Failed to allocate memory for vf_lmem_size array\n");
+		return;
+	}
+
+	for (uint8_t tile = 0; tile < num_tiles; tile++) {
+		ldata->vf_lmem_size[tile] = calloc(num_vfs + 1, sizeof(**ldata->vf_lmem_size));
+		if (!ldata->vf_lmem_size[tile]) {
+			set_abort_reason(data, "Failed to allocate memory for vf_lmem_size[%u]\n",
+					 tile);
+			return;
+		}
+	}
+}
+
 static bool lmem_write_pattern(struct vram_mapping *m, uint8_t value, size_t start, size_t step)
 {
 	uint8_t read;
@@ -735,66 +810,51 @@ static bool lmem_mmap_write_munmap(int pf_fd, int vf_num, size_t length, char va
 	return result;
 }
 
-static int populate_vf_lmem_sizes(struct subcheck_data *data)
+static void populate_vf_lmem_sizes(struct subcheck_data *data, uint8_t tile)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
+	unsigned int main_gt = xe_tile_get_main_gt_id(data->pf_fd, tile);
 	struct xe_sriov_provisioned_range *ranges;
-	unsigned int nr_ranges, gt;
+	unsigned int nr_ranges;
 	int ret;
 
-	ldata->vf_lmem_size = calloc(data->num_vfs + 1, sizeof(size_t));
-	igt_assert(ldata->vf_lmem_size);
-
-	xe_for_each_gt(data->pf_fd, gt) {
-		if (!xe_is_main_gt(data->pf_fd, gt))
-			continue;
-
-		ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
-								  XE_SRIOV_SHARED_RES_LMEM,
-								  gt, &ranges, &nr_ranges);
-		if (ret) {
-			set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
-					xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
-					gt, ret);
-			return -1;
-		}
-
-		for (unsigned int i = 0; i < nr_ranges; ++i) {
-			const unsigned int vf_id = ranges[i].vf_id;
+	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd, XE_SRIOV_SHARED_RES_LMEM,
+							  main_gt, &ranges, &nr_ranges);
+	if (ret) {
+		set_abort_reason(data, "Tile%u: Failed read %s on main GT (%d)\n", tile,
+				 xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
+				 ret);
+		return;
+	}
 
-			igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
-			/* Sum the allocation for vf_id (inclusive range) */
-			ldata->vf_lmem_size[vf_id] += ranges[i].end - ranges[i].start + 1;
-		}
+	for (unsigned int i = 0; i < nr_ranges; ++i) {
+		const unsigned int vf_id = ranges[i].vf_id;
 
-		free(ranges);
+		igt_assert(vf_id >= 1 && vf_id <= data->num_vfs);
+		/* Sum the allocation for vf_id (inclusive range) */
+		ldata->vf_lmem_size[tile][vf_id] += ranges[i].end - ranges[i].start + 1;
 	}
 
+	free(ranges);
+
 	for (int vf_id = 1; vf_id <= data->num_vfs; ++vf_id)
-		if (!ldata->vf_lmem_size[vf_id]) {
-			set_skip_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
-			return -1;
+		if (!ldata->vf_lmem_size[tile][vf_id]) {
+			set_abort_reason(data, "No LMEM provisioned for VF%u\n", vf_id);
+			return;
 		}
 
-	return 0;
+	return;
 }
 
-static void lmem_subcheck_init(struct subcheck_data *data)
+static void lmem_subcheck_init(struct subcheck_data *data, uint8_t tile)
 {
 	igt_assert_fd(data->pf_fd);
 	igt_assert(data->num_vfs);
 
-	if (!xe_has_vram(data->pf_fd)) {
-		set_skip_reason(data, "No LMEM\n");
-		return;
-	}
-
-	if (populate_vf_lmem_sizes(data))
-		/* skip reason set in populate_vf_lmem_sizes */
-		return;
+	populate_vf_lmem_sizes(data, tile);
 }
 
-static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+static void lmem_subcheck_prepare_vf(struct subcheck_data *data, uint8_t tile, int vf_id)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
 
@@ -804,12 +864,13 @@ static void lmem_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 	igt_assert(vf_id > 0 && vf_id <= data->num_vfs);
 
 	if (!lmem_mmap_write_munmap(data->pf_fd, vf_id,
-				    ldata->vf_lmem_size[vf_id], vf_id)) {
-		set_skip_reason(data, "LMEM write failed on VF%u\n", vf_id);
+				    ldata->vf_lmem_size[tile][vf_id], vf_id)) {
+		set_abort_reason(data, "LMEM write failed on VF%u\n", vf_id);
 	}
 }
 
-static void lmem_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+static void lmem_subcheck_verify_vf(struct subcheck_data *data, uint8_t tile, int vf_id,
+				    int flr_vf_id)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
 	char expected = (vf_id == flr_vf_id) ? 0 : vf_id;
@@ -818,14 +879,14 @@ static void lmem_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 		return;
 
 	if (!lmem_contains_expected_values(data->pf_fd, vf_id,
-					   ldata->vf_lmem_size[vf_id], expected)) {
+					   ldata->vf_lmem_size[tile][vf_id], expected)) {
 		set_fail_reason(data,
 				"LMEM check after VF%u FLR failed on VF%u\n",
 				flr_vf_id, vf_id);
 	}
 }
 
-static void lmem_subcheck_cleanup(struct subcheck_data *data)
+static void lmem_subcheck_cleanup(struct subcheck_data *data, uint8_t num_tiles)
 {
 	struct lmem_data *ldata = (struct lmem_data *)data;
 
@@ -839,12 +900,12 @@ static void lmem_subcheck_cleanup(struct subcheck_data *data)
 
 struct regs_data {
 	struct subcheck_data base;
-	struct intel_mmio_data *mmio;
+	struct xe_mmio *mmio;
 	uint32_t reg_addr;
 	int reg_count;
 };
 
-static void regs_subcheck_init(struct subcheck_data *data)
+static void regs_subcheck_init(struct subcheck_data *data, uint8_t tile)
 {
 	struct regs_data *rdata = (struct regs_data *)data;
 
@@ -854,7 +915,7 @@ static void regs_subcheck_init(struct subcheck_data *data)
 	}
 }
 
-static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
+static void regs_subcheck_prepare_vf(struct subcheck_data *data, uint8_t tile, int vf_id)
 {
 	struct regs_data *rdata = (struct regs_data *)data;
 	uint32_t reg;
@@ -863,32 +924,22 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 	if (data->stop_reason)
 		return;
 
-	if (!is_intel_mmio_initialized(&rdata->mmio[vf_id])) {
-		struct pci_device *pci_dev = __igt_device_get_pci_device(data->pf_fd, vf_id);
-
-		if (!pci_dev) {
-			set_skip_reason(data, "No PCI device found for VF%u\n", vf_id);
-			return;
-		}
-
-		if (intel_register_access_init(&rdata->mmio[vf_id], pci_dev, false)) {
-			set_skip_reason(data, "Failed to get access to VF%u MMIO\n", vf_id);
-			return;
-		}
-	}
+	if (!xe_mmio_is_initialized(&rdata->mmio[vf_id]))
+		xe_mmio_vf_access_init(data->pf_fd, vf_id, &rdata->mmio[vf_id]);
 
 	for (i = 0; i < rdata->reg_count; i++) {
 		reg = rdata->reg_addr + i * 4;
 
-		intel_register_write(&rdata->mmio[vf_id], reg, vf_id);
-		if (intel_register_read(&rdata->mmio[vf_id], reg) != vf_id) {
+		xe_mmio_tile_write32(&rdata->mmio[vf_id], tile, reg, vf_id);
+		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != vf_id) {
 			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
 			return;
 		}
 	}
 }
 
-static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
+static void regs_subcheck_verify_vf(struct subcheck_data *data, uint8_t tile, int vf_id,
+				    int flr_vf_id)
 {
 	struct regs_data *rdata = (struct regs_data *)data;
 	uint32_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
@@ -901,7 +952,7 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 	for (i = 0; i < rdata->reg_count; i++) {
 		reg = rdata->reg_addr + i * 4;
 
-		if (intel_register_read(&rdata->mmio[vf_id], reg) != expected) {
+		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != expected) {
 			set_fail_reason(data,
 					"Registers check after VF%u FLR failed on VF%u\n",
 					flr_vf_id, vf_id);
@@ -910,84 +961,86 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
 	}
 }
 
-static void regs_subcheck_cleanup(struct subcheck_data *data)
+static void regs_subcheck_cleanup(struct subcheck_data *data, uint8_t num_tiles)
 {
 	struct regs_data *rdata = (struct regs_data *)data;
 	int i;
 
 	if (rdata->mmio)
 		for (i = 1; i <= data->num_vfs; ++i)
-			if (is_intel_mmio_initialized(&rdata->mmio[i]))
-				intel_register_access_fini(&rdata->mmio[i]);
+			if (xe_mmio_is_initialized(&rdata->mmio[i]))
+				xe_mmio_access_fini(&rdata->mmio[i]);
 }
 
-static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
+static void clear_tests(const int pf_fd, const unsigned int num_vfs,
+			const flr_exec_strategy exec_strategy)
 {
-	struct xe_mmio xemmio = { };
-	const unsigned int num_gts = xe_number_gt(pf_fd);
-	struct ggtt_data gdata[num_gts];
+	struct subcheck_data base = { .pf_fd = pf_fd, .num_vfs = num_vfs };
+	struct xe_mmio *mmio = calloc(1 + num_vfs, sizeof(*mmio));
+	struct ggtt_data gdata = {
+		.base = base,
+		.mmio = mmio,
+	};
 	struct lmem_data ldata = {
-		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs }
+		.base = base,
 	};
-	struct intel_mmio_data mmio[num_vfs + 1];
 	struct regs_data scratch_data = {
-		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
+		.base = base,
 		.mmio = mmio,
 		.reg_addr = SCRATCH_REG,
 		.reg_count = SCRATCH_REG_COUNT
 	};
 	struct regs_data media_scratch_data = {
-		.base = { .pf_fd = pf_fd, .num_vfs = num_vfs },
+		.base = base,
 		.mmio = mmio,
 		.reg_addr = MED_SCRATCH_REG,
 		.reg_count = MED_SCRATCH_REG_COUNT
 	};
-	const unsigned int num_checks = num_gts + 3;
-	struct subcheck checks[num_checks];
-	int i = 0, gt_id;
-
-	memset(mmio, 0, sizeof(mmio));
-
-	xe_for_each_gt(pf_fd, gt_id) {
-		gdata[i] = (struct ggtt_data){
-			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = gt_id },
-			.mmio = &xemmio
-		};
-		checks[i] = (struct subcheck){
-			.data = (struct subcheck_data *)&gdata[i],
+	struct subcheck checks[] = {
+		{
+			.data = (struct subcheck_data *)&gdata,
 			.name = "clear-ggtt",
+			.alloc = ggtt_subcheck_alloc,
 			.init = ggtt_subcheck_init,
 			.prepare_vf = ggtt_subcheck_prepare_vf,
 			.verify_vf = ggtt_subcheck_verify_vf,
 			.cleanup = ggtt_subcheck_cleanup
-		};
-		i++;
-	}
-	checks[i++] = (struct subcheck) {
-		.data = (struct subcheck_data *)&ldata,
-		.name = "clear-lmem",
-		.init = lmem_subcheck_init,
-		.prepare_vf = lmem_subcheck_prepare_vf,
-		.verify_vf = lmem_subcheck_verify_vf,
-		.cleanup = lmem_subcheck_cleanup };
-	checks[i++] = (struct subcheck) {
-		.data = (struct subcheck_data *)&scratch_data,
-		.name = "clear-scratch-regs",
-		.init = regs_subcheck_init,
-		.prepare_vf = regs_subcheck_prepare_vf,
-		.verify_vf = regs_subcheck_verify_vf,
-		.cleanup = regs_subcheck_cleanup };
-	checks[i++] = (struct subcheck) {
-		.data = (struct subcheck_data *)&media_scratch_data,
-		.name = "clear-media-scratch-regs",
-		.init = regs_subcheck_init,
-		.prepare_vf = regs_subcheck_prepare_vf,
-		.verify_vf = regs_subcheck_verify_vf,
-		.cleanup = regs_subcheck_cleanup
+		},
+		{
+			.data = (struct subcheck_data *)&ldata,
+			.name = "clear-lmem",
+			.alloc = lmem_subcheck_alloc,
+			.init = lmem_subcheck_init,
+			.prepare_vf = lmem_subcheck_prepare_vf,
+			.verify_vf = lmem_subcheck_verify_vf,
+			.cleanup = lmem_subcheck_cleanup
+		},
+		{
+			.data = (struct subcheck_data *)&scratch_data,
+			.name = "clear-scratch-regs",
+			.alloc = NULL,
+			.init = regs_subcheck_init,
+			.prepare_vf = regs_subcheck_prepare_vf,
+			.verify_vf = regs_subcheck_verify_vf,
+			.cleanup = regs_subcheck_cleanup
+		},
+		{
+			.data = (struct subcheck_data *)&media_scratch_data,
+			.name = "clear-media-scratch-regs",
+			.alloc = NULL,
+			.init = regs_subcheck_init,
+			.prepare_vf = regs_subcheck_prepare_vf,
+			.verify_vf = regs_subcheck_verify_vf,
+			.cleanup = regs_subcheck_cleanup
+		}
+
 	};
-	igt_assert_eq(i, num_checks);
 
-	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
+	igt_abort_on_f(!mmio, "Failed to allocate memory for mmio array\n");
+
+	verify_flr(pf_fd, num_vfs, checks, ARRAY_SIZE(checks), exec_strategy);
+
+	free(mmio);
 }
 
 igt_main
-- 
2.34.1

