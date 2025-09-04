Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D51CA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 07:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B630510E236;
	Thu,  4 Sep 2025 07:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWGWWj4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48ACC10E236
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 07:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756972547; x=1788508547;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nM1zpRSXxa6OcDud32B2rGUk7X9lwGNJf4op+KIua9w=;
 b=NWGWWj4jXMVSJC/KhzD3bk1Z2rjKaDMCjFqo8VQGDyPEXHLbLNsQBszW
 SF8j69mvscPSXUxNHmB8kikuksa/Dcs0T3r/yx2Gw6Togx0jWqZvkO467
 1QrfYEAWvD7Hk3xL3pyCZ1+OWpqj102BdaRnOjX9mIvK9xmVuvCCpg6p9
 qqENSTQbjVGpUu/grhEF+Uw9j2kz2xI90TdHGGdTXJCjmPks7jtFzs9/C
 WBQgcGrVS4ZEuGhss5yCCuJyqLFFt18nPWU8TrXdY7qYT2NfyrAX9NYaZ
 Wkf6UiLPCN8CZWqhwbWiV2Owy1ET0feXLkHAAdvGC8DBc3MypS3Laisxp A==;
X-CSE-ConnectionGUID: SIYyf4zHSBmXvc8hkaJlUw==
X-CSE-MsgGUID: CNBLvhc+Rp+/uN57LMlICg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70007264"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="70007264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:55:47 -0700
X-CSE-ConnectionGUID: UrB7KMgrQHez+2MGxVktCQ==
X-CSE-MsgGUID: QdeNhWfRTpCGxM4cQ89E+A==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:55:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 00:55:46 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 00:55:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.79)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 00:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6FMxDtFTmx/kTjTRyiSjHPBCzg51H5y2hYnN/rjoJNtvT3x6CJ2YZLEYgqIW1sHFfWZ6XsOJ6VxTnHgEH6rCgfFc3pYIdPLKD1DLIzLiCnSuKpaH6IGyKrSvQHb4PBjafh3dg7uhPj2gzYqt/zz7WrBxpBayxJbfSJsoMxEAXSSiRom3BYgpzMeF0thP6SUj/i9NYeUijZND9qOeIQTIq3HSrk9OeixbF+Z962h2u/BOLpvLEyUS8PKYLLl4zjqVOEtReL8WfL7+G448sDhwWbKnyteoIcAP2lCm3V2+Q1yAI0xKhKJWcdoA7+KqoCb8aOOsYF39wBao84YVKa+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fme+R2qFSvcMZQPxZWcN2+n/dYTzDiio+mFICaFl7Yk=;
 b=yh+x6Kq6k9jLWeyIixuoXhSnsekNPj5HQC8ZRY1VVhQjd4wd2cckdwyA0u1G5yb0kLpkPPHKqOs2EVZ7yjAZqzm9F96/a/PNemXt67xbzkz6w/tUS/WwIY4D1zdkU8y3aVjYLud3iiwZZwtTqX5Dx9hSo5hwbSJ63CsJNsqCbWbj72kOFHhwadszWrGgr+IWjscGl07fPUOTQCug8pYMVtKtIVQHIwW/Zixcq1b0zFew3QP8ytGtoQ+EuCkgcE1unBB9uf5Hr6dX7J5g/rMSh0CGOMtaHt/t4cpsJRwt/C2DYuEyne2Uj3lKyglIP1eW0SH8AacFaScKdRil0gYhMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 07:55:44 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9094.018; Thu, 4 Sep 2025
 07:55:43 +0000
Message-ID: <c3f20dd3-73ad-422b-b507-9cbfd17293fc@intel.com>
Date: Thu, 4 Sep 2025 13:25:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 16/30] lib/igt_fb: Allow any non-planar format for
 igt_copy_fb
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Alex Hung
 <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>,
 <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-17-alex.hung@amd.com>
 <20250903165135.c34nledhi7pr6wei@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250903165135.c34nledhi7pr6wei@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 240d62e3-6e98-4216-df0e-08ddeb887274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|42112799006|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a09DaU1nczcwMkIrUmRIYnlJaU1EanduTGRNUzdzdzN1b2w0cFJYdWc1T1Mr?=
 =?utf-8?B?dTVUa3crUllETXQrZTRPckhaVTRlWHhrY2ROMGZzM3B0bFJQQTdEZmJmSCtJ?=
 =?utf-8?B?WHJKY3VxTmFkRHE1KzZXV0lCMVZ6a0lhZUxGeFptYkpGOWRLenhteGgwTW1y?=
 =?utf-8?B?dnpod3UzTmxRUDBERlFkVWxMa3ZGYmFoK0p0SnB4UERIYkk2NGx5YkdlUDZO?=
 =?utf-8?B?SCs1K1pZNW4wTysrNjEreFlUeGFrUzJnK2I1ck5TYWFpUk9rUU1wNitPQnRk?=
 =?utf-8?B?TDVtZisxb3J6a3F4dDhtbVNCTS9SaFVYbENpNS9JdThmd2hqS2xDMjY4SFN2?=
 =?utf-8?B?eXRSVkxmbzRlelRMbjluK1U4bzVhMjFIU0FFSllNVzhWZlNxSDFGRVludEZR?=
 =?utf-8?B?OCtkRWZ6MkxrckVhdFZCWCtMdDdqK2wxL2ZWM0xJUFhhU0h1ek9zLzdYMVdk?=
 =?utf-8?B?WDFQVVJHVDBvL25IaHFKdU1QNy9pMEdwODVkUG1OTU11aVRNQ2hMdU5RRXll?=
 =?utf-8?B?bExGVEFSRmoycHRwaWNDUWQrTFdFNVRINHI2MHJlcS9BU2lZb3dQNUU5OEc2?=
 =?utf-8?B?VTlhSGJSMTV2ZHIvajQ5N05hLzB4V2NXTXp1emkzd3F0QkpFTjFjQllFTU1a?=
 =?utf-8?B?cFA2K0tERERtdm5nTlFXYjVrcElXa0h4ZUVHWCtnWEJpemhhZXhIQ2s0SmxY?=
 =?utf-8?B?YUM4RTB6RVplOGFuNU1PTVJxRGxqNE1ZR0hXNFh6eXpseU1NUDF4cFpVcGx4?=
 =?utf-8?B?cUg5Qkx3eG5sd0hBZWJuODI2SE1VUWVnNjlBVUFlT3AyMFh2SFpHS2ZWc0Fk?=
 =?utf-8?B?ME1jb2Vjb1orNUZyZS9UaHdFY3hXMU14eHRSOVFEWS9ubXlPcTNVWFpuUk5l?=
 =?utf-8?B?UXpOQTlTNWJ4b0ZSWDl0L0lrTjU0WkFCV2NOVHRUNGFtdkJibVBEUzczWUZv?=
 =?utf-8?B?VXpRYmdXQUE5aGZRd3BqRm9JbE13NFNubEc1OUxucFhNbXZiNi9NdGpjYTRJ?=
 =?utf-8?B?cC8yU2lJTkVoTi9nSXhTTGRCbllzdEVxZmwvbkhFZDNOYStYVU8wQUxvWGVu?=
 =?utf-8?B?VmpTTmZiQ0NNaHVXRWlpOTZJZmNnZ1FmMlpWeGllWmNsZkMzaFVDOU1RS3E2?=
 =?utf-8?B?VnlsU1E2SHRhcnVibEVvblk1TjhmTFk4Tm85QjN1SnRXMWNkUUNQeHUrWmpa?=
 =?utf-8?B?TGRsb3pZZC9nMnIvZjVzT210Z2dPZzVQcll6RE9tQTRRcko5V2lTbXl1d2dE?=
 =?utf-8?B?SHBQN0xJa3FyQjhDTWJBQVJ4K3d3Y0dnL293ajFOZ2FDRDFERzd5eEoxclN1?=
 =?utf-8?B?YnlPekVaNkVWQSs2VGs3bFJ4WFBLdnJSMHFiNllaclpteHh3ZVZHZ1NNeVFw?=
 =?utf-8?B?MFFuQU9rRk5HTWVMTzdPNTAvT01iSGpiQTd0SzFOU1dDZ2tBUS8wRkFDVlA0?=
 =?utf-8?B?M2ttY0J6ZGlrcjdpTVUraEt5MXJFQVNJaSt3RDE2eklEQlRiVHNpZFBVRkVO?=
 =?utf-8?B?Q1NvZmR1QkwzTWFVOWgxMjZNekhXaVV4S3dWRTBIZCsyM1Z1R1l1c29NMjZ5?=
 =?utf-8?B?aGJKdXRSb2VxSFovcjJNaUxZTVpkMWtXZmYwbWI5ZmZrZ0RUa05Cc0hSeEQx?=
 =?utf-8?B?dVhJT1ArbGZGYnhvekpZdEN4QlNpSm93OFlYUWlETkg5VFBRSDRYWkhRUTZx?=
 =?utf-8?B?cEVFbk5JSDdRbGI1Z2o2dDlETFNybXgwaDZWK2VrSjdDTVpFZG1TRFR6UytD?=
 =?utf-8?B?bUtUbHIxb1JyalM3THF5ZFhScHNzcTBOVU1QS1ZDaVhXTFdjUCtxTmVwenR3?=
 =?utf-8?B?N2RNa2NCK0Nta29GTXZaWnduUk9TcEk3NnRBRUREQXdGL1dqQTEzM3hSbmE1?=
 =?utf-8?B?UFBaVXBtNjIvTmFXbktRUEdUcUpyZlVRc05NSTBObytPY2RjcytFZHVlYjVL?=
 =?utf-8?Q?xoUt5eQyz98=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3h3TzMrM3MwTTFTR2J4UnhMMVY4eXpzRllVRmJKaTJTakRJZGFNMGRBUkFj?=
 =?utf-8?B?QWtvVWZVWXlsN3l5TThNZ1lsL0VSWmVsUlZZdW4rNmlNbzBRQVJ1OGlqTUg5?=
 =?utf-8?B?SU44UzZRVjh2UVFQZlAwbGkxY2dKT1RTVHVydHRXVlk2L3JGV2h2Zzc2djdD?=
 =?utf-8?B?enYwN1pKNHgxamdBeURaazhkM29CMVo5NmlHNmlJUXk5OUloSHloVUNSNDdu?=
 =?utf-8?B?YUVranE2cWNTWWowOXFYdVlLMlhLc3E0QUhycCtDcW5LMWZtOEpya1Uvdlg2?=
 =?utf-8?B?TnppcmhzTXBQYWhvZW9NdVA4eHAzVDVDNXJLSm5GNVN2eGtFcm83RW1JcU5a?=
 =?utf-8?B?eGhYbmVxeXcrZGZ3a2FzS1dzSW1PRWxxaGUwSXhJbkFWTzVBMllZWUJuUDBj?=
 =?utf-8?B?WXo5Sy8yWjBoSCt2U0V3TUNoUW5HcCtWenlBUDd4S1pYeXJ0QlRrU1pzd1k1?=
 =?utf-8?B?QzNzSWhQZnA5RDJYS0RpazhFWFJJYTdYRXhWbFNFdjA1SWVkQTQ1ZmV2UHBI?=
 =?utf-8?B?dFk2TDQrZnpaTmRQbFNqaTJ1ak4rc29pY3NaUi96MTFReTFhbzJYQ2VWNTY4?=
 =?utf-8?B?MG94M0tQa0hLcjQ5TnhDK28rYzB0TTV4cHFFV295ajIwK0F0M284a1VDS0xk?=
 =?utf-8?B?UzYwczFnMnQ4eFRyUjdwZnVvSGc0RUx1Zk9KdHJMQzA2V2NINE5LVEllUnFz?=
 =?utf-8?B?TEtSRGlidnFpZG5DV0t0amdsMEVMN0NSYWYwRHh5SEpYSzd5aHpBSFBQNk9Y?=
 =?utf-8?B?QWFzUWdQQ3Z5aXpyYVlSYTBkTzBXRFJVVy9LUzNydndDTVBLUHlxSEVzZlMw?=
 =?utf-8?B?ZU0wSjRVTk1sR1I5TklEUU40bjV4TGlhdXAyaFFjSkRpSkM2aWVqME9ka1Rt?=
 =?utf-8?B?Z0NUaGI5TFpZODdDQ2laa0lqUjdFNlFuNUpxeGRPZStFNndESGRLS3JjOU9v?=
 =?utf-8?B?dThiaS9HYnNyR1Jyb0JXaVhMaVlSWTZSUXhvemRwRHZxZS84TzFnbXlMMU1i?=
 =?utf-8?B?NmhocWNpc1Y0eG9sczNKZTEzRXpIQ2xFNUliNjQycXQ3WHBTaTBUNWxabnhH?=
 =?utf-8?B?ZkczZVFIWmJkdU4vTzZLVFA2VHJseUlCL3NjSGE5L3RDL1Z6R2VBRzd4WmIy?=
 =?utf-8?B?MjdCQnFMMElxTU9NWXRnQzdMQ24xaGMyMUNaMzl4aWhRYmJlTkVWK2xJeitQ?=
 =?utf-8?B?d0xrYlVsNmVPT1NzUFdJcUFKalEvNTIweWlNY1FxT0ZkVXBucGExQ1JGMG1W?=
 =?utf-8?B?R2tuOTBHT1NZK1RnbWVNOGRSZk9FbTVEeXJYam03KytOcm9HSjBGWFQ0b1I5?=
 =?utf-8?B?djY2STMwT2xYdWgxMFBtMW14QThTYlU2ZEFhRzJqd3VZdzd4eEE0L3QvNHRn?=
 =?utf-8?B?OWIzSXd3OXlTUXRRZkhHM3RRYStaQTFxODFKVGtMUXF1SUhYcnRuekRHZ3RC?=
 =?utf-8?B?VVhXUzlOQTdFVXYycjlrY1d2TDhvYkxVZ01TY2l1MWFNT1I3cHQweW9CZ29U?=
 =?utf-8?B?UEVyVGJHaWxxUzdHcVdhLzl3TnhVZTBCK2xFSjRsRjF6VDBtbGI1RVdLWVV5?=
 =?utf-8?B?U1FtckVnYUFzeDRobElkRTlHUHUxWUh2VkJRbEwxZjhyNzUyc0YxYzJyQXJn?=
 =?utf-8?B?WHpGdVNUbFRxdkxJYkVEYjY5M2JGb0dnSmtTSDdVYStwUGxza3FUeE5hYSsv?=
 =?utf-8?B?VkJrQ3BZRkxmMWtRcW0wUjVnMFd4V01MNGg3ZC9DZzdsT1dZYzh2Uno4VDZQ?=
 =?utf-8?B?K0ExeVZVSzlPd1E1Z2QzS3kxbFZPN1o2TDhUdUY3amNhQXB6Z2U1MHN0TDRk?=
 =?utf-8?B?c0I3c1NDeEU2TjJoVkNDVU5IU1JQQk5McUVDUWd1dEdkUDdCaFJlOW1VRFhm?=
 =?utf-8?B?YjJSOW1LU0huU25LVjRMK2Y4TTREeUdVQ2hNNkpLOTlDR0xoNnh5T0xmWkNO?=
 =?utf-8?B?R2RZSzkyTUFoc1lMaFhRVk5ZQnZiMnRNODY0SlcwazlvOFhwMUVWRVBUelFU?=
 =?utf-8?B?YkFHd3d5M3BCTjUxL0FLYmREZ3RmeGFKQkovOFFnbWY4ZkQ5K1d3M3ZHTmJt?=
 =?utf-8?B?T0Jna1NPWTZLUTgxZkZ2K1gyKzk4cWRpc1BQeVArUWFZc1ljWWRlRG81eFJX?=
 =?utf-8?Q?w1ord4MyL1HUbAT5JNpvhSvf/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 240d62e3-6e98-4216-df0e-08ddeb887274
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:55:43.6016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h21q7+F4r8+ihkkcl1368y1r/jGfTGHtdbpHE+ow4kINmrF9vinYPcrGxMS8k6lMJw/FGlJmp38aI3ivN9INJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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

Hi Alex,

On 9/3/2025 10:21 PM, Kamil Konieczny wrote:
> Hi Alex,
> On 2025-08-14 at 22:06:45 -0600, Alex Hung wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> The function is able to handle any non-planar format. It's been
>> tested for XRGB8888 and XRGB2101010 so far but should work
>> for a wider range of formats.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>   lib/igt_fb.c        |   4 --
> Please split this patch into lib change and test.
> Also imho lib change could be squashed into first igt_copy_fb()
>
> +cc Karthik

Yes I agree with both the changes suggested above.

Regards,
Karthik.B.S
>
> Regards,
> Kamil
>
>>   tests/kms_colorop.c | 138 +++++++++++++++++++++++++-------------------
>>   2 files changed, 78 insertions(+), 64 deletions(-)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 8c8436e94..b3474781d 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -2182,10 +2182,6 @@ unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
>>   	if (src->num_planes != 1)
>>   		return -EINVAL;
>>   
>> -	/* TODO expand for other formats */
>> -	if (src->drm_format != DRM_FORMAT_XRGB8888)
>> -		return -EINVAL;
>> -
>>   	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
>>   			      src->modifier, fb);
>>   
>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>> index 77d8c6bfa..7ac74c536 100644
>> --- a/tests/kms_colorop.c
>> +++ b/tests/kms_colorop.c
>> @@ -380,60 +380,28 @@ static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_f
>>   }
>>   
>>   static void colorop_plane_test(igt_display_t *display,
>> +			       igt_output_t *output,
>> +			       igt_plane_t *plane,
>> +			       igt_fb_t *input_fb,
>> +			       igt_fb_t *output_fb,
>>   			       __u32 fourcc_in,
>>   			       __u32 fourcc_out,
>>   			       kms_colorop_t *colorops[])
>>   {
>>   	igt_colorop_t *color_pipeline = NULL;
>> -	igt_output_t *output;
>> -	igt_plane_t *plane;
>> -	igt_fb_t input_fb;
>>   	igt_fb_t sw_transform_fb;
>> -	igt_fb_t output_fb;
>> -	drmModeModeInfo mode;
>> -	unsigned int fb_id;
>>   	igt_crc_t input_crc, output_crc;
>> +	int res;
>>   
>> -	output = kms_writeback_get_output(display, fourcc_in, fourcc_out);
>> -	igt_require(output);
>> -
>> -	if (output->use_override_mode)
>> -		memcpy(&mode, &output->override_mode, sizeof(mode));
>> -	else
>> -		memcpy(&mode, &output->config.default_mode, sizeof(mode));
>> -
>> -	/* create input fb */
>> -	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> -	igt_assert(plane);
>> -
>> -	fb_id = igt_create_color_pattern_fb(display->drm_fd,
>> -					mode.hdisplay, mode.vdisplay,
>> -					fourcc_in, DRM_FORMAT_MOD_LINEAR,
>> -					0.2, 0.2, 0.2, &input_fb);
>> -	igt_assert(fb_id >= 0);
>> -	igt_plane_set_fb(plane, &input_fb);
>> -#if DUMP_FBS
>> -	igt_dump_fb(display, &input_fb, ".", "input");
>> -#endif
>> -
>> -	/* create output fb */
>> -	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
>> -				fourcc_in,
>> -				igt_fb_mod_to_tiling(0),
>> -				&output_fb);
>> -	igt_require(fb_id > 0);
>> -
>> -	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
>> -
>> -	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
>> +	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
>>   
>>   	/* reset color pipeline*/
>>   
>>   	set_color_pipeline_bypass(plane);
>>   
>>   	/* Commit */
>> -	igt_plane_set_fb(plane, &input_fb);
>> -	igt_output_set_writeback_fb(output, &output_fb);
>> +	igt_plane_set_fb(plane, input_fb);
>> +	igt_output_set_writeback_fb(output, output_fb);
>>   
>>   	igt_display_commit_atomic(output->display,
>>   				DRM_MODE_ATOMIC_ALLOW_MODESET,
>> @@ -441,14 +409,15 @@ static void colorop_plane_test(igt_display_t *display,
>>   	get_and_wait_out_fence(output);
>>   
>>   	/* Compare input and output buffers. They should be equal here. */
>> -	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
>> +	igt_fb_get_fnv1a_crc(output_fb, &output_crc);
>>   
>>   	igt_assert_crc_equal(&input_crc, &output_crc);
>>   
>>   	/* create sw transformed buffer */
>> +	res = igt_copy_fb(display->drm_fd, input_fb, &sw_transform_fb);
>> +	igt_assert_lte(0, res);
>>   
>> -	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
>> -	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
>> +	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
>>   
>>   	apply_transforms(colorops, &sw_transform_fb);
>>   #if DUMP_FBS
>> @@ -469,7 +438,7 @@ static void colorop_plane_test(igt_display_t *display,
>>   		set_color_pipeline(display, plane, colorops, color_pipeline);
>>   	}
>>   
>> -	igt_output_set_writeback_fb(output, &output_fb);
>> +	igt_output_set_writeback_fb(output, output_fb);
>>   
>>   	/* commit COLOR_PIPELINE */
>>   	igt_display_commit_atomic(display,
>> @@ -477,28 +446,24 @@ static void colorop_plane_test(igt_display_t *display,
>>   				NULL);
>>   	get_and_wait_out_fence(output);
>>   #if DUMP_FBS
>> -	igt_dump_fb(display, &output_fb, ".", "output");
>> +	igt_dump_fb(display, output_fb, ".", "output");
>>   #endif
>>   
>>   	/* compare sw transformed and KMS transformed FBs */
>> -	igt_assert(compare_with_bracket(&sw_transform_fb, &output_fb));
>> +	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
>>   
>>   	/* reset color pipeline*/
>>   	set_color_pipeline_bypass(plane);
>>   
>>   	/* Commit */
>> -	igt_plane_set_fb(plane, &input_fb);
>> -	igt_output_set_writeback_fb(output, &output_fb);
>> +	igt_plane_set_fb(plane, input_fb);
>> +	igt_output_set_writeback_fb(output, output_fb);
>>   
>>   	igt_display_commit_atomic(output->display,
>>   				DRM_MODE_ATOMIC_ALLOW_MODESET,
>>   				NULL);
>>   	get_and_wait_out_fence(output);
>>   
>> -	/* cleanup */
>> -	detach_crtc(display, output);
>> -	igt_remove_fb(display->drm_fd, &input_fb);
>> -	igt_remove_fb(display->drm_fd, &output_fb);
>>   }
>>   
>>   igt_main
>> @@ -550,21 +515,74 @@ igt_main
>>   		igt_display_require(&display, display.drm_fd);
>>   
>>   		igt_require(display.is_atomic);
>> -
>>   	}
>>   
>>   	for (j = 0; j < ARRAY_SIZE(formats); j++) {
>> -		for (i = 0; i < ARRAY_SIZE(tests); i++) {
>> -			igt_describe("Check color ops on a plane");
>> -			igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
>> -				colorop_plane_test(&display,
>> -						   formats[j].fourcc_in,
>> -						   formats[j].fourcc_out,
>> -						   tests[i].colorops);
>> +		igt_output_t *output;
>> +		igt_plane_t *plane;
>> +		igt_fb_t input_fb, output_fb;
>> +		unsigned int fb_id;
>> +		drmModeModeInfo mode;
>> +
>> +		igt_subtest_group {
>> +			igt_fixture {
>> +				output = kms_writeback_get_output(&display,
>> +								  formats[j].fourcc_in,
>> +								  formats[j].fourcc_out);
>> +				igt_require(output);
>> +
>> +				if (output->use_override_mode)
>> +					memcpy(&mode, &output->override_mode, sizeof(mode));
>> +				else
>> +					memcpy(&mode, &output->config.default_mode, sizeof(mode));
>> +
>> +				/* create input fb */
>> +				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +				igt_assert(plane);
>> +				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
>> +
>> +				fb_id = igt_create_color_pattern_fb(display.drm_fd,
>> +								mode.hdisplay, mode.vdisplay,
>> +								formats[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
>> +								0.2, 0.2, 0.2, &input_fb);
>> +				igt_assert(fb_id >= 0);
>> +				igt_plane_set_fb(plane, &input_fb);
>> +#if DUMP_FBS
>> +				igt_dump_fb(&display, &input_fb, ".", "input");
>> +#endif
>> +
>> +				/* create output fb */
>> +				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
>> +							formats[j].fourcc_in,
>> +							igt_fb_mod_to_tiling(0),
>> +							&output_fb);
>> +				igt_require(fb_id > 0);
>> +			}
>> +
>> +			for (i = 0; i < ARRAY_SIZE(tests); i++) {
>> +				igt_describe("Check color ops on a plane");
>> +				igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
>> +					colorop_plane_test(&display,
>> +							output,
>> +							plane,
>> +							&input_fb,
>> +							&output_fb,
>> +							formats[j].fourcc_in,
>> +							formats[j].fourcc_out,
>> +							tests[i].colorops);
>> +			}
>> +
>> +			igt_fixture {
>> +				detach_crtc(&display, output);
>> +				igt_remove_fb(display.drm_fd, &input_fb);
>> +				igt_remove_fb(display.drm_fd, &output_fb);
>> +
>> +			}
>>   		}
>>   	}
>>   	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
>>   	igt_fixture {
>>   		igt_display_fini(&display);
>> +		drm_close_driver(display.drm_fd);
>>   	}
>>   }
>> -- 
>> 2.43.0
>>
