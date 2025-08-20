Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED34CCA0EDC
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 08:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFEB10E353;
	Wed, 20 Aug 2025 08:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpeFGWrl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3D710E353
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755679266; x=1787215266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=35K/YEm4Qa0DpoqMNy/e6EQ6z6jDPjEXwAs9EKK4hr0=;
 b=EpeFGWrlxzw/9mcpmg1fhBk9iKsg26P3mNCEqgr3zvgvnwm7/90tDvlQ
 X4aw9bX3UcuRjS153wM/JE4OttGDx3Pywb4FDruHB6z9H69DG0clR3KJ9
 yIdM+Rd57A3fol3+f1L2DCZCVoimnaPcVFoLp1ys0uNWrwyph6czChRVd
 a1RX9SDkm2cYgHPz3Xvev9/3hqcQHm8P80dLDrMgXIEzL6FvHXBP8ndR1
 Jy7LCciOc3KP82D2bLHaqahKJjXSNyUIy0FKdjRd8ld8EoqqDg08Uq5Lj
 Q0tRNnFlpWiEOX11T754bMSM2eJmprvz+E5J+ERtN57zWP0WH8r5pfIlq g==;
X-CSE-ConnectionGUID: dbU6vm9NSsCQP1K/dIgHng==
X-CSE-MsgGUID: t99t40y/TEW4xNbi8MbWcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58037743"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="58037743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 01:41:06 -0700
X-CSE-ConnectionGUID: JYAMpAlESpO8psb0bskaBQ==
X-CSE-MsgGUID: 1q65gCD/SvyLjFGDJlvLFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="191764356"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 01:41:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 01:41:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 01:41:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.81)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 01:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5Iw5TZjiaCJqnkAJDRJ9Wh48mI0G9fSm5F+LBIKigMl4Ga/7HXBy89SOCO74qB7R9j3VIAnq/vlJ1Mqla3B8kva6EudkpfPc6uk5uWGFCFdR15+6cQpvHP1xW8NwE5da0mb+H7KhUnuQLC+y7jpEgeSLUdY+skKP/JOk1C3x3ilLk9n2u+rvKygtkLyL4+b7Wf0NGPw5DiwFybNPPAipyjWXLh/ZMj5c1cZ1UMfOr8b6OYa2IJrCOVD2crcASTUHHOpD3PjETL7j2jw29rlF0TCzPZBebNG0+pEPSl+hDEUK6YYyPS4KwqYDDjBhXJ0Rk8qKKSvWvIGaYVFcYf1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF7pK5LErz6ox7yt7G/C5Zy76YqMQE1I/UAYBe5diFE=;
 b=CHeM4x0rsGibJMzyvOXPOL1Hs1/dbiXO0sRuzzVeL7JwrHhHJez4wYKfG1ugHXCYCf9LMb5KKJNAQXJncEAOGVZes4jZ6jz04wtdJX5WTK9cOney9Y5rU9opfVqOi29NRHAhX/LUGUyXK0yFyaC3mC/pPZeQTZP3mVF3sbVkbIDOu5N393zTHDjTM/HjfkT1VxG8bBWnSpMv+4fT2qBKwuHLg9nbt01ZlhfWs+o1PoiIA9LQoXxfhznzI2QZRN3kHrUxrBBtqc+vmi5NtywEWojp39RfxsJfSbwI/QHA+EqikYX/draxKCG8FYjz5Zo1Lckv9anZvd+A/bFN6l2Kxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5685.namprd11.prod.outlook.com (2603:10b6:8:20::21) by
 SJ5PPF77ABF615C.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::836)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 20 Aug
 2025 08:41:01 +0000
Received: from DM8PR11MB5685.namprd11.prod.outlook.com
 ([fe80::d2ec:6ee7:4fc2:ea3b]) by DM8PR11MB5685.namprd11.prod.outlook.com
 ([fe80::d2ec:6ee7:4fc2:ea3b%4]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 08:41:00 +0000
Message-ID: <7eebde44-f231-4d7f-abd8-78043aeb442b@intel.com>
Date: Wed, 20 Aug 2025 14:10:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: Remove unused format
 modifier checks
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <swati2.sharma@intel.com>
References: <20250820062656.1081253-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250820062656.1081253-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To DM8PR11MB5685.namprd11.prod.outlook.com
 (2603:10b6:8:20::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5685:EE_|SJ5PPF77ABF615C:EE_
X-MS-Office365-Filtering-Correlation-Id: c70bda39-97a5-418b-97b8-08dddfc54a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|42112799006|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnAxNWUxdGFWdFJIUkhOUjRtL2tCNTYxZ241VUgyaVp3aFNCL0xWcXljQWk1?=
 =?utf-8?B?cE41S3hid3o1cnFoWEhMNjA1VURpT0dNV3JrQlRMTnpaQklHRDJwbFoza1gr?=
 =?utf-8?B?T2NXT1cxa21iU3I1VzYzUDEzeGV1dkFBR1Q1UGVKeFRaZ1FGRUh2bFlNL1hD?=
 =?utf-8?B?MUlYdWpCQkoyazZHVXg1Y0FEV1JaMzdCTmVuRmhDcTc2ZkxFU2JuczZVYUQz?=
 =?utf-8?B?WENNamVVckhkbHZVRjFOMVlRenIrYjBheEgyT0NDM1ZDNWFhVmw1d2R0QzRT?=
 =?utf-8?B?TGhLV1g3aklZVG8wVjdoSDRDcEQvQ0p2SmRveWhnMHZoNEhCaFIwOGcxVGJX?=
 =?utf-8?B?Q0crTHF6ZEUzTXIzRlYvNTJMVXJQSURheEdXK3ZmSkJTUjViYlVZc2lodStu?=
 =?utf-8?B?dXE1aWZyV3E5SG5oZTRWT3o5TzBnellrNVdVMU1VeXhRZ0UzUUZVcTAvdFVW?=
 =?utf-8?B?TVdwQzkydkhoN1hGSzd3SUhrZ2prSzFvMmJDNm1mbDBOa2lsNDRaUEYwWWwy?=
 =?utf-8?B?dTNkRXovUk03djZWaWM1YitWeHFsZCthNUNhd2FMbE9naENubmpPT1dGQzZ0?=
 =?utf-8?B?RmFRclI3cUh1cU10blBUenRheW5peExmcVhQM3IzS3ZJTTEzUGZ1V3hacDFn?=
 =?utf-8?B?T1Q2V1A4NnN5cGhUeXYrUmlWYy95bG9Uc0hQaUpXczNyTi95ek03WXJWbGov?=
 =?utf-8?B?ZnRTc3Rya05nWDRKU0hBQWdUTWtKd1kzUTl5S3VpdmlUSEJNNlltUk1sVnVa?=
 =?utf-8?B?RFkwbDdPMnJOUFNFcWlrcEV3TitXUklUT2NUMEloVHVkL3JSdkx6bTgybU94?=
 =?utf-8?B?OVlDRTV6dVJLM2dCanlCbkNuRFZWR2hXdmkwTGZ5TnN2OFlvYXRsVEFGR3hE?=
 =?utf-8?B?M3N6UUVIMlcwOTc0eU0wdU4zVEZmbnNtMEN2d3JFdUVWTmI4djZFcGNFLzFJ?=
 =?utf-8?B?OW5WUEhaL2NjcWNwS0JwSDN2cU1BSmhUd0JaeXo1SmhITGRrUkEwVlUyc2Jr?=
 =?utf-8?B?YlpyTlJvS3ZtakR6MmV2UWhiZnM0MmRxM3dOdm9ja2NMSEo3YnFwL1Fia0E4?=
 =?utf-8?B?Y0NZeU9LTnp2ZCs5WFRLRk9XZTFoT0d1Y1lyRk1wMUdMZlRJTGZnVWFjdVBq?=
 =?utf-8?B?QWJ1SEpZclVZWE55aWRYZEtaeUJlS283eklPenlSLzlvTmdiOVlJYlY3Uisw?=
 =?utf-8?B?TGMySE1jaXNYRTBMaXdtWE8vclpTa2ovY1BRcmtsNlZ2RW9MaWJMTGpVTHFD?=
 =?utf-8?B?UXpkREpCU3RZdmVQUlVaclRXTEdrY3p1aHZVYzBGVjRtME9ZV3ZrNFBrazkr?=
 =?utf-8?B?M1Y4TUhPWENaTld4eUp6bGExVy9OcTBFWm5MTTQ5ZDJUeWc1WVRNRW5MSGov?=
 =?utf-8?B?VnlQNU1tdU9hQWsyazdURVdEeGR4UDV3ZmtncGdrdnpOeDZRR0xkMElGakxP?=
 =?utf-8?B?UUtjSFFIaU9zeW5vdndTbk9uQ2ppcnB2cTY5YVN2SWdNSzBZelBHaldJd1VP?=
 =?utf-8?B?dkloN2kyZ0krZVNNTHNhN05oQ1NCSXZhWUhTT3hOUzd5OGVEYi9BcTREQW9S?=
 =?utf-8?B?QXBkWFpXSlZPNXhkNmtpZnNWd1FlM01GTXZYejBrVW1WZzE3b3ZxQytXWHl6?=
 =?utf-8?B?UmFrZzliQnFJM1pTV1FsMTVYSzNRcDhPQkJpNkpzNGRkZVkyWmVPSW10OHF0?=
 =?utf-8?B?MVIwSHh3Y3NVajZsNnY0cCtjcEtaL1Y1K3BBNEdPbmloREFaUjBJZXdtOGVh?=
 =?utf-8?B?UUtrZHlKZDdwbTFxU1UzSXFHVTNSc2FRZzVXbkJWc1hFMEp6bEtQTytLblpQ?=
 =?utf-8?Q?mza5jvyIpzr0+dkHYN9oDiDaV6o2nrOSoR0ek=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5685.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFRnNkNCV0pXd1RVeUJQbnI1SHNWQUJDaGZuaVI3MFNWcGNTY0NPM3BuVThj?=
 =?utf-8?B?Y2NhN1RFMVU3MVlnYU9LSC91ZlNtZGw3b2dwM01zSy9FZzZyclk1Vk9YSXBD?=
 =?utf-8?B?Rysxd3JNa1c1YTlrNStjOTNCdHcrQ2w2NnRnaGpsL3djeEdIY3prSUhWMFpa?=
 =?utf-8?B?Z2ZQVVhhZ1NVVVQ1Nmh6Z0JBV3FOdnRBUzZrN2p0UVk2VzF5K2FUc01LR0Vl?=
 =?utf-8?B?WVM3b2p5VzFkVytiVkR4VWUybWpLbHJKTVkrcjUzdEpWeHJPNk9kdVZzZ0NO?=
 =?utf-8?B?eExkeE5RM1hNSHEyL0liR3J2b1FtNDU1TTBtNldFcXp0YlN0NVRrTi9pQzVn?=
 =?utf-8?B?TDVGbTFxWDVEL25RMjFlU2FKdmI5cG45YlFhVkNzRER6Z1dEMGNTdTVYdGta?=
 =?utf-8?B?Ti9OejNldUtPOTN2anZpSDJYZlpGZDZGQ2N1TmsyUW02RStmUEtDb25OYnB3?=
 =?utf-8?B?YzJuak90NTBINXNyM1NaSmUvUzUvRXRLQTA3Z2czc2dMZ2VUNnh5bzMveHc0?=
 =?utf-8?B?TG9VQmN3WVNCNldLYUN2aTRUSXlQQnRCdHFwSWFWdHFyaWNDdkVYc0wvZlVG?=
 =?utf-8?B?M0pnS0lRUGF5dTltWHhOWXIzMmlsT3FGS3BQbDNSbGdOWERqNkxUbVBLbjNO?=
 =?utf-8?B?dkZDZE5GK1dyVHlaTGNRclgvVk5sUnBqeDB5NlRqQlpNNzByNldteDRPdzZj?=
 =?utf-8?B?ekMzRGdLZ21GcUxvMXhHbUc5SnArZ01SR0I0ZWV1cTltZnVWQmV1TjhSZWlX?=
 =?utf-8?B?RWNCbGhQS3orTUEyK2Q3VkFHaTh5a2ZWTTNUeGVPaEFyRllEcGFJUWVnYytC?=
 =?utf-8?B?UlR1aGhld3FDV08zQTVVaGZQWlFnRERFUTY4NnR1NUgwQzZvdzc3RTFEMFdC?=
 =?utf-8?B?ZzJ5N0grbkhkMEtpRmZrYUwwUkFEdTQxYm9mNVFvZ3g0ZkxBUThKWWdGODEy?=
 =?utf-8?B?Y2cyRnpwSTJ5QXlOYkNleDVNYmZWOW5lTUpYZnNrVC9jQmRuRk1DaFdHcURX?=
 =?utf-8?B?YTd6OEFYU2NONUxjNXpneklxZmhxc09xSFU0TXJ4L1VJUlpiQ2NYZjZFTW43?=
 =?utf-8?B?aFBQOFFCZVZTZURDek5hU0ZnczY5aDVRVXlRdUNVTCt1WnhSOXpXdC80d1FW?=
 =?utf-8?B?WTRJdG5iYnlnclJQa2N5d3MxRkNvdU16MVYxSWErUVZKSFJweEVldENqODJZ?=
 =?utf-8?B?dXNNZG1tSm14Y0l5akg3Z1BNbzBSbnhTUzltTWRDL0RFTVJ4OFFGQnhYT1h3?=
 =?utf-8?B?VXlVSGJldGVEQTBET3dFak9abWlFVlI2VExJRXdiN1dibE96Tkk1VTVNNWMv?=
 =?utf-8?B?cURnNkNyVUZ6MzlRVUJtS0Jad3F3cDlTQWhDdlh4SFpFQ0xMUzk1ZU0velhU?=
 =?utf-8?B?UjBNUnlxQjQ3NXVvRnYwa3hOTVN1RFF3cTBQYzBWa2pyWU04bkhvVXQxUThV?=
 =?utf-8?B?VHMrNTFwWlNmNDdrZTM3S0IzTDVwMUZhemIyekhkVGhib3RvbTAyeDhkWUFE?=
 =?utf-8?B?RmNYTEc5NStHQndZbUFCSmhQLytydktkbG9ZcFZDcTh4N2IwTnAxbFJlSHNC?=
 =?utf-8?B?clBycXNTOVhoTFZ2NS9nU09PWm01ZnNqbTZHeGNleVpveFRHSFF4VjNpdUp0?=
 =?utf-8?B?eWdHejFhVk1vdGllMkQwUEFJd1BxMjdXY25rTVBhTzlKRDVHUTFKMFBtQUVu?=
 =?utf-8?B?Z3YxV2lSa0dacDNKRmNmZG1XVHNEcUE3bTJPZCtzWDcwNzBnWUxIbGNPVFll?=
 =?utf-8?B?SGFSUktadXhkSDVkVUFNc2tjUU1RWmoxWkxOenNlRVRuUy9qYWhUR3dQYmlB?=
 =?utf-8?B?cVNkMmlRcWZSQ0xoWWNDRFZuU0pVd210WE9LRzZNUjRVTEhSOXZnbVo4MGRw?=
 =?utf-8?B?ajdPVCsrQmhYeUU5dThvTWRuc1RJb01PSVluUVN6d2lwY3dNYmRpYTZKL2gr?=
 =?utf-8?B?U0lrbTk3UkF0UEZYWTN4REJVWTVaa25EOVhEaE1YMVNkRjJ0NGUzajQzZ1hV?=
 =?utf-8?B?ay93SndHQ3V6ME5iUHFjSURsbW5lOGFpN0FJUlRoQWRycFlxTjE3NENpVXpZ?=
 =?utf-8?B?a1BKRTNUMWFVTlhBM3BDc3Bhb3NFazc1VFVaeTdrcm1Mamtld2VpeHVXNmtN?=
 =?utf-8?Q?YzN0Vzzfo57lgQsTzirL1xkEm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c70bda39-97a5-418b-97b8-08dddfc54a33
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5685.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 08:41:00.6769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0o4p9zl+OrV9LZWtRjT2xsjAU513Ui89NzVCLefS6qzogeC7QqYNayyOk6cw+iJUSoEIe/8h5ZoFG26vwKuuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF77ABF615C
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

Hi Santhosh,

On 8/20/2025 11:56 AM, Santhosh Reddy Guddati wrote:
> with IN_FORMATS_ASYNC, hardcoded modifiers are no longer needed
> for invalid async flip subtest.
>
> Fixes: 4972020ea0f3 ("tests/kms_async_flips: Replace hard coded modifiers with async modifiers")
> closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_async_flips.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 1ac5e6db0..733abf417 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -1186,11 +1186,6 @@ igt_main
>   		data.atomic_path = true;
>   		/* TODO: support more vendors */
>   		igt_require(is_intel_device(data.drm_fd));
> -		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> -						       I915_FORMAT_MOD_X_TILED));
> -		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
> -						       I915_FORMAT_MOD_Y_TILED));
> -
>   		run_test(&data, test_invalid);
>   	}
>   
