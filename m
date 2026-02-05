Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0A3EA794C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 01:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1EC10E079;
	Thu,  5 Feb 2026 01:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXYeTbOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7015510E079
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 01:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770254159; x=1801790159;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=WUCslNOABHQodSDTFIB0wqpKg0m8ujAeK9xlE8OfFiw=;
 b=cXYeTbOEJLfuZXtX5B3Ngz4UXb3okN2YH8LvqzXJhI8TIPuXTMiGJd9i
 QAeKb3W0/Ix9eWY+WB2AWGfKsG49+xuSNLqYfQbccQ/iNSf2VWnZ7wKin
 uYawKoMCod8czz+Jf7XCdXejsWrkM8PfKWT2wrEhf7IeBdOHVC9F1EvGc
 1Ppb77spseCPsRQCOICehPRVGGynylZIK7/puQzHYSurJEFcj3uTVdsUo
 Fa7/kndEXmu6unSvcPpjFxaQtgrwF9BecyCcyPY53MZjiiYA76UUuCx8o
 APKllpdpmsGv9Uiyk6fuQ9LTUH99XawcpRHxdL3692UPhVd7x+6PhIoR6 g==;
X-CSE-ConnectionGUID: f631Qe5GRDq7KCyxJMA3AQ==
X-CSE-MsgGUID: g4GIYka3RFCdFs+SEcC7Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81762710"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208,217";a="81762710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 17:15:58 -0800
X-CSE-ConnectionGUID: amnaGpDWQ5WatLRutsyRkg==
X-CSE-MsgGUID: I23P81RdTWikDuWaoLm6eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
 d="scan'208,217";a="209854628"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 17:15:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 17:15:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 17:15:57 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 17:15:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5hoBgnbHNvdqGBAfplVpepa2wz9UfvLp5BYCT5huFOvJjRzG7p/2oicFuiTaYqS1b2fIAN+y0OqFWkygJm75DgEW1XPMA/UorkUidiNNCs8XE++ySzRPT3hhBGHKMiD9DJ1xFraskPodcRk2n2RxTiO18e/p+cGngRQjKC9ktUvMZ6Zb9fkxHQyKKCz6Dm4s8i2qR5yUyUL6xR4jDcpZwNW8ChhlL2rdl1ObeXRtoy6AVuonqEXsoFRdyrkDAGMpahLVfWlD64MFR+B4UbN6Av7C6zQvtvaqwIF5CkOeLu3mMv80Q0KaCgOr3kbnjfNfuxKUOiO7kVCdL/GJQIWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLwnSvG/bA5zxUeYa+ZyzIYNyfSjY5gP3y8pi1sT2nc=;
 b=MT+sKvcQzL1qKHHQvhGlwehB3fbzMdcTp69hEMzQuE2pwX6wFH4lXpR28Yy1gb0S1gmNz9X6ZuKeUfC0dGeYWUgJyL3mzu6cT9IPAbBQrZH1GZ84ujKl2E5PXqTT16HPxSlpeTjScWCjGSB1SNbXYJir2dqzbxcr5FkJiAnOwdvFm+W8bo2EtA9B3Zf6ijlRgHt+84D3PPKFa6xDoxgTifPZ5JiAREBHly6Zgt13n2pu7mQWdA49RGoAkvxaDKur0LQhd4ua9uzCARS/AUA30AYirHz+UgOmWYnhWKkbYlvVV8pb4gfJUwYGvx7jwIl7jsrUVvoqXjc+r/cAa7lvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.12; Thu, 5 Feb 2026 01:15:53 +0000
Received: from BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1]) by BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 01:15:53 +0000
Content-Type: multipart/alternative;
 boundary="------------leFg0sgXVF0sALJz4A2N0YF6"
Message-ID: <2afec503-67a2-40ee-9183-58490dd75c66@intel.com>
Date: Thu, 5 Feb 2026 06:45:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_plane: Skip unsupported modifiers
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260204083913.1048566-1-pranay.samala@intel.com>
 <20260204083913.1048566-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260204083913.1048566-3-pranay.samala@intel.com>
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To BL1PR11MB5253.namprd11.prod.outlook.com
 (2603:10b6:208:310::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5253:EE_|DS7PR11MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 015f4005-7747-4ee2-e49f-08de64541b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUFaa0kwdGlNZkhMVmFxMGZZaXYzL0ljVHdwNkd0SXJFcWdaOWVIdm5kVEhX?=
 =?utf-8?B?UnBjRnF1R0hGZU1tQUxPaGpYc0pBbEdYSFY3M05LR3lzb3puN0VKMlA4eHRq?=
 =?utf-8?B?djdOeUV3MnFuZlVYMVo0QXZLc21oT3BvK0UxdlZSRVJmNVBFMlZ0RzJyTnM5?=
 =?utf-8?B?dXY0VFV2ZERpVUZON29DRGRQcEQ3KytTYStjSDB1WWlWY3ZIUGtDOHBuYSsv?=
 =?utf-8?B?MGVlR0VYSlg2QStxY3BxTTVrRjZRSjdKQTJtWDZVRGRjM3dBL3ZxVm96TkZV?=
 =?utf-8?B?MExpRGlTanFnVUNJSXZLQ1VibDFGYVorRVJrU0d1WXducmtVOHMyNmFOYXly?=
 =?utf-8?B?ZVMrcHZYOE5NMmNIRXhtQ00vaHo3YUErT2xRQU5DRU1DaFNaZ1N4bXpFa29l?=
 =?utf-8?B?czdBeDkxN2dVcXM4ZmhyTm9YWDU2OGJKZTF5cGt4dUFYOWR6VXBMSmZnbmlD?=
 =?utf-8?B?TnlmcDA3YWRGL1Q3dDJhMEN2d212cGdrZ1kyU21SQk93eE13VGwzenBjd3NY?=
 =?utf-8?B?cS92bll3cDR2TmNRUzJmOTlROWpGODlyRG15MmJ0K3VBSWpNT0NJQytEWXNX?=
 =?utf-8?B?UHhqR2N6NWdkZktkMVpLai9xZWNPOXNwVXppeHpTYUdMQzc2RUdXK3pPdXFJ?=
 =?utf-8?B?NE9aak5DYzBmblVXUi9MRGdtU1hwSFhuc3gzOThqYXBoYjh3YUNzdEkvM0Vv?=
 =?utf-8?B?TDdXS2d3STVsdE5walIyMWdvdm1kS0dDTWEyLzY5Zm4ydG5CQ0pCQk5BN3dy?=
 =?utf-8?B?OHlPL3duZXNTeWVRTnhtb1ZxTVhMMC95TThtQUdNcVRZV1BteE1seExqUUNs?=
 =?utf-8?B?YWprMUp5S0g1aG1yYjlOWklNMmRGWTYvb0pRU0VpNk9YUGxsQnBXZ2FYbm1H?=
 =?utf-8?B?ai9oL0RlRTI5bHp3QnpwTkx0K2M3KzY0b3JxWjRONENZRGRqNzNjanE0b2Mw?=
 =?utf-8?B?SlFnQ0Fvdm1XT2F6QTNWY3l3WEZYeGhEb2kxM1hiMWtYK3FJcDNqUm9uclYv?=
 =?utf-8?B?bFc4NXE4K2xNMTl3NksxYnQzKzEwZ0lnSFJ3NkNVUkl0Sy9pY0V0eW4xNUp5?=
 =?utf-8?B?cmxqNGVqY1VKN0tSTktmN2duOFlzaURBUTlFcmRyUGhrS3k5Ym4rSlVuT1RY?=
 =?utf-8?B?U1dIS2tibzhwTzZXNGFZZHd6N2YxRGVVTnZ3eFlDTm9vYk00VXNRNm1LK3JI?=
 =?utf-8?B?azEzbXRoRjB4bUg3ZXZqbHl5ZUdwM1hUQjkzUmZCWEliWk5IVTBkTkxWUkpK?=
 =?utf-8?B?RnFTbFNLTlJxTUx0MVczYnNKRU9kTHBiVTVtQzdQMUZVWHNnU0RreWtPNlR4?=
 =?utf-8?B?dWptT3NNVzFiR09wb3BwbUNUMld0bmplWUZWOVJEL0JiMngxdmFERzMweVpp?=
 =?utf-8?B?L0JrcUsybFFtMTVGL2VmMTdwTUpYeEhaQ2w3ZVRpZUVCNW1WMy9tMHFrUWNY?=
 =?utf-8?B?Z2NnclQ1aktnLzRGeWFRQWZjMTU1Y3lRUkVpZis2RkJyeEQ5RUdWT0JaT0Q2?=
 =?utf-8?B?THZ6SzNzc3FGdHowakpMcTlDTGtpLzR4SWRyVWdaSldQNVRWeXVrUHY3ZmtK?=
 =?utf-8?B?bGJha3pIZjV5TEk5MkVOVEZpTGo3dXdDL3BDU0tlcUs2Q3FjQXhhMjZRSTYx?=
 =?utf-8?B?TmR3ZTZnbmkwMTlPVW1IY2Zza3RteEx0RVJ2UDFPSk84dkUzZ3ZpdmM2dFF5?=
 =?utf-8?B?dlNPVWcvelRRUjNPVlRWS3RUZnVnY2kwR01JVUplMjNzdncyOWhPcUhLcmRB?=
 =?utf-8?B?UFg0ajNLNFlJK3Y5ampUSGZyN1JLcnhnMGNqQm9FMzg3NmlSVE9UUnpnME52?=
 =?utf-8?B?UGE4Ui9JN1Q2V240Rk1URDlHN3Vvck1NVXkzYWZLc3ZxaU9ycFVnN3RpbUtR?=
 =?utf-8?B?TEt3Qi9aRS9sZ2wxWTFwdGQ4S3BaYjNoeld1N0w4aXhMVXhDRzNoNzJQcTg4?=
 =?utf-8?B?bGl2ZmZJRVExcTJyRGRGMFhhcm9kdW1aTlZDK3NSOWJtazNBM0U3TEpMUHQy?=
 =?utf-8?B?bUJiL1kwdVlGNG16WS94a2dYRnZDL3FKRzBnNEF0MlhYeGpMVWZIS3I0V3Ew?=
 =?utf-8?B?Q1FVTlVudFZCekJzeWI5RlpEMUJRNEY0YnlaUVlFSWFjN3pTUlA5cVFUZmJV?=
 =?utf-8?Q?GXSI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5253.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkE3ekhucHFVb0haOGRHa0YzZFNNSzdPZTcwcHpHazZuR3IwcXZrRlpXNUF5?=
 =?utf-8?B?STJScVdBczZJdVQ2UFVuamNBU2c5OTV5V2NwOEVZY3AxaXJhOU9XVmdZMy9B?=
 =?utf-8?B?VjBXMTJKSlpjbXl4QzE0QkhtUmtCaHpKSFh1NENBMjQ2N3lvb045VnpqSDZ1?=
 =?utf-8?B?aUZmK2haQVBBK1lzd29MYzVVMUxuazZESzZyWTBHT2lTODJMS2VNSG9UT29L?=
 =?utf-8?B?VjRwdUN4OElkLzlSWXljV3ZRbExaKzJoTlI2b01lWGZseGVFWlluTlcvWDZV?=
 =?utf-8?B?SjROOXVEcGFDQnpmK3pneEtSMFduZnE2dE5McHc2eWZUQlg4LzVIYlRWS3Mr?=
 =?utf-8?B?QmFLL2NHbVN1SHdkaVNSYnNxUDNkb3RsK1lmWjdjdzg3b1RvT1dOQzRzR0pW?=
 =?utf-8?B?SVRmME0rdW1WQjkrUERuWjlJNUgrZ0FuYWlrUEVrbHc0cEI3MklRYkVJK1lz?=
 =?utf-8?B?Szd6MTZGc2lPZERialJCWVNzalFWQ0tXYW5FRlhjSHVNa0dNbDNlSTExMEQ4?=
 =?utf-8?B?Nmd0cjhBbWZQOW5oQU5JdXgvbU82YWVYaHhRVTRTdzRoWXo3OHR2WEcvUTdM?=
 =?utf-8?B?RjNMaGVBMCttaHdpamdsOXFTWDlZdlhrRUFmb09hZzFvT1dxb2psNGV6QW0r?=
 =?utf-8?B?TEE3MTFjdDIxMDFtT1NtK1kxZTFqY0tKckZMYU5kbEhpQ0dRSEd1WFcxRFZL?=
 =?utf-8?B?Y1dlaXYwV0xncU1GYnRScUdGaExmZmpJU0ZnclRRUStuT0JXbHJDdjlYdG0v?=
 =?utf-8?B?dXRBcTgrNUlES2t5aTgwSFBZOVNmVmVQZ0YwTzJZNVZKak13M0ZsZVFKRHZ3?=
 =?utf-8?B?SDczdlMyc3F2QmZKMXpaRGtrUFlIUnpLdlBodGxMT3MxczErcTZRYVJlSkdJ?=
 =?utf-8?B?NTNqQ1JuQ0Juc2h0RFVXZGF4TWpRWlY2ckJZQ1EvL3RJRkc3UXg0dWJWNVdU?=
 =?utf-8?B?NmdPU21LRE5lTVVMN3lGblF6U2hyRUs5WmxuY2ZOR3hqQmRCOGtIL1B0R1NS?=
 =?utf-8?B?T1pRanM5S1dUWHdUYjZNaUR4a2YvSmhDVVdueEs5bHJFSURlL2Nya3JhUlJH?=
 =?utf-8?B?SzZiVnl3c3kxMTg5WnlDSzUvMmZXUVBqaUMvL0sxVkRqWFFkZDZxNXl4djA2?=
 =?utf-8?B?M2dyZjZXSlV6MHBwbGplUTlGSkJ4K2VYSXR6V0J1dlhhQXRyeW16OU94cmQ3?=
 =?utf-8?B?aUpmMHpIU3d1dVUvMEVucmZKUGxOdGIrL2NsSy9LWHZXd0hMS2VoSVdET2Uw?=
 =?utf-8?B?QVpjSGF5ZFlMemlySTBQUU51V3QwMzM5NjlCUzhFN3FmRXJ4c0FteGVHbDVU?=
 =?utf-8?B?WDVvZUlXVE45azlCSWIwVlhwWEI2Y1dUMG5IV2c4NmdQTmJsUEkvWG9tYjEw?=
 =?utf-8?B?YzJjMVhQT3p0dDlSY2FSZGZZQ296RURLejByYVRBYkx1VmhzWW03SnFnWmhu?=
 =?utf-8?B?SXdaL0t5cC8vc0p0UFdjQzFyMzViM0tja1JLVUJNVkNCbTExNDM3bEp0d2xT?=
 =?utf-8?B?ekxEamdkMmJrT1d2UGUrYk9sNVV5V2d6U0d1R05PQytNMjU0TXNVK3NyTWdy?=
 =?utf-8?B?VUs1YVpIUUNESUlBeGFIUDZHTlR1VjVKdVcvSjBRYnpDK0puTkRRY2JldTAy?=
 =?utf-8?B?cVlMSTU5cWlRWmdRZDdVL3IzV1dVSzVnTlAvdTlaQXluSGRSK2pLUXpEVGhj?=
 =?utf-8?B?R1hFMjI1L2MvOFBZckVIS0dtOXFOOVUwdC8vN2hqNnBwQTE4N3BDVnRFaHl0?=
 =?utf-8?B?ZzY4d3Q4NzVpblE0Mml0RjFKOWp5endxOUsrSVMrOHJtOFNoQitYR2RYV1Zq?=
 =?utf-8?B?Nlo3VnltRjNmcmd6ZWVnS21VdFBWdGV6WjUveXZ4QkhqUU9GNUZjRFExQjBV?=
 =?utf-8?B?bXBrRnhyR3U2N3lOT0U3WGs1MEoyQ0htQVdHWEJYS3VMRXF1M0hZRjZoMm9E?=
 =?utf-8?B?MU5BZFJHMmtlK2hRWko1WTYzczhJWW9IZmNOUk9TSzQyRG9aTHp2L1hrd3lU?=
 =?utf-8?B?VldyYUlSVEtCd056cWUzT2JGanRpaG1OU3hOTXRzTGRDWHR5bUNCQ3ZJUjUv?=
 =?utf-8?B?cDFyY295MTFVVngyc25QaXJHUUdhUEdKdXpQOGdQVEpMaDUxN0IwM21DWnl5?=
 =?utf-8?B?dzBtMDdtOXZtL1FJTWRlVEVwR2xVM3RmYVErN0lRUXlYUmpMRXVTb2tuVkMy?=
 =?utf-8?B?TldQa29lTisrcVdLdTdydm5sQnVPdW5lWnYwOHlqOENwUm9CeXdDTUltNmFF?=
 =?utf-8?B?bHl4QWdjYzloUktNREFkMCtyb0R4bVhIc3AvYmJ6TEFmYlU2cXVPVXF1Ynl6?=
 =?utf-8?B?cUp1SE5aUkJZWmFFdk4wYnJhN0VDQjZnSk1tbnBiY3RVb3pMdTdyQWJ5emVQ?=
 =?utf-8?Q?4+xmLX6KNwhm9498=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 015f4005-7747-4ee2-e49f-08de64541b73
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5253.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 01:15:53.7807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ne1PkfTvwwVKNyNXmUyFvfkqwYgEDTTLkRe+AN/0lj9M6JLH+42OENqHtRynyndpGHcYW2yWTbo/i+hnHiGNrjAJ2B7JlIPEgR07ARUl8Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
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

--------------leFg0sgXVF0sALJz4A2N0YF6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pranay,

On 2/4/2026 2:09 PM, Pranay Samala wrote:
> Skip modifier subtests that are not supported.
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_plane.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index a7b1bf25d..69d06d627 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1495,6 +1495,10 @@ run_tests_for_pipe_plane(data_t *data)
>   	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
>   		igt_describe("verify the pixel formats for given plane and pipe");
>   		igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
> +			igt_require_f(igt_display_has_format_mod(&data->display,
> +								 DRM_FORMAT_XRGB8888,
> +								 modifiers[i].modifier),
> +								 "Modifier not supported\n");
>   			data->mod = modifiers[i].modifier;
>   			run_test(data, test_pixel_formats);
>   		}
> @@ -1504,6 +1508,10 @@ run_tests_for_pipe_plane(data_t *data)
>   		igt_describe("verify the pixel formats for given plane and pipe with source clamping");
>   		igt_subtest_with_dynamic_f("pixel-format-%s-modifier-source-clamping",
>   					   modifiers[i].str) {
> +			igt_require_f(igt_display_has_format_mod(&data->display,
> +								 DRM_FORMAT_XRGB8888,
> +								 modifiers[i].modifier),
> +								 "Modifier not supported\n");
>   			data->mod = modifiers[i].modifier;
>   			data->crop = 4;
>   			run_test(data, test_pixel_formats);
I suggest moving this check into |run_test()| to avoid duplicate code 
across subtests.

Thanks,
Ramanaidu N.
--------------leFg0sgXVF0sALJz4A2N0YF6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay,</p>
    <div class="moz-cite-prefix">On 2/4/2026 2:09 PM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260204083913.1048566-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">Skip modifier subtests that are not supported.

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index a7b1bf25d..69d06d627 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1495,6 +1495,10 @@ run_tests_for_pipe_plane(data_t *data)
 	for (int i = 0; i &lt; ARRAY_SIZE(modifiers); i++) {
 		igt_describe(&quot;verify the pixel formats for given plane and pipe&quot;);
 		igt_subtest_with_dynamic_f(&quot;pixel-format-%s-modifier&quot;, modifiers[i].str) {
+			igt_require_f(igt_display_has_format_mod(&amp;data-&gt;display,
+								 DRM_FORMAT_XRGB8888,
+								 modifiers[i].modifier),
+								 &quot;Modifier not supported\n&quot;);
 			data-&gt;mod = modifiers[i].modifier;
 			run_test(data, test_pixel_formats);
 		}
@@ -1504,6 +1508,10 @@ run_tests_for_pipe_plane(data_t *data)
 		igt_describe(&quot;verify the pixel formats for given plane and pipe with source clamping&quot;);
 		igt_subtest_with_dynamic_f(&quot;pixel-format-%s-modifier-source-clamping&quot;,
 					   modifiers[i].str) {
+			igt_require_f(igt_display_has_format_mod(&amp;data-&gt;display,
+								 DRM_FORMAT_XRGB8888,
+								 modifiers[i].modifier),
+								 &quot;Modifier not supported\n&quot;);
 			data-&gt;mod = modifiers[i].modifier;
 			data-&gt;crop = 4;
 			run_test(data, test_pixel_formats);</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">I
      suggest moving this check into <code>run_test()</code> to avoid
      duplicate code across subtests.</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
      Thanks,<br>
      Ramanaidu N.</div>
    <blockquote type="cite" cite="mid:20260204083913.1048566-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------leFg0sgXVF0sALJz4A2N0YF6--
