Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7721A606A33C
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRpAbysn;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Y2ZryuEb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD4F10EC2E;
	Mon, 23 Nov 2026 14:58:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD9410EE9C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 14:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795445682; x=1826981682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7HpTtL/CISfyklfU4aW+NQoSMdEkWFNqjefjeIflwPg=;
 b=kRpAbysn9OoR3uxqt9ROFeQGssj3NArfEN9bxDqDXMYY/BQZTir87iMk
 xmQJMUBFeUVSLETj+dBQD/lyaNyMR4W12RDxEMGkgHnAgpNIamEiLMi2J
 gzGErbwHcEJu5smXmYRWIEyNE8yKk+farrTBo/VVEh9xlZduyYov0mloc
 24+PtRmEZY31Ml2oG+GKdSdoGRYlfUOJtUY6yINWGHjMBpP7dC/o4EKY1
 XY3Fq4iUNgTFr7H7GegEBXRfeIqN6byeFOCKjI7pyQZPL9fr5iBuho075
 cZo2FB9EJxW9Z46AWZgw4j6F1hnmMdQ9w/90gNgWUVRadbwZfWFpdissb w==;
X-CSE-ConnectionGUID: 5ddSWTEJSraE2NR/ravIsA==
X-CSE-MsgGUID: oye7NeUQRz+BB9GPc+uTLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4149522"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4149522"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:35 -0800
X-CSE-ConnectionGUID: P2EbbmLQTP+JmbThH3hzXw==
X-CSE-MsgGUID: fmcydkqaQqevveh7XMTjAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11302859"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:54:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:54:34 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:54:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEeC6p1xFKgQsEoj2ojnrYBTV6uzoMQM3W3052hpqeDD5QJuzYYD/7BgPDblcF6v6x/qxtI7cSdngxim7nSRge1qaOx30Ev9COP+aDzLqdxfNT7o3iMW7isATXqdURL/BLiQmuIrMmRC+X4nJzKKr2njoBj0QazR1HnfcweHzMYHDWL+yI/Ja+/ZFGQALvsMR2RIAzteDQqoYh+GsgOoARuHfyLugMAt98QWdCG/3PS3ba50qhjDScerKGQHBAzhnfijF+BBF2yPEvlpkgs/EAQZprAKnOXJddosnW0jEYzcOwQ4OW83KrzsZIbdeX++SKy02w+Yh+yQtedXj8lcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0JqTkmePkyjWb5CCaV8lmscCVjhYkHgTre3EW7AAFo=;
 b=yfBehL18WgVOfnoBXwEy/ndvEsv0+U0Eli6vTblJqbk2HPpHAH18n3Pgmdl8aQxbCjecfRcN2M1pail46eJ9BDfQRbSngjKpD1nIl1qVVl5rMFjACKownJUnk3u7IH6aMUwgvtmy0LlX72XB8HBgCW74pU7kJ+Uw8/D07+y4YtBGhcJoQLu0oN4M3aVRREXHp9YZMNZY7bknuWIKK+OoIHoWze5D9ooarVOHdo9mEJQX7C2bsVLiGpzDh/6rdnZzBMtQVcUCvNkxlBmP28U7CtLewnS1C65qm5vtpc72+Mb1LZeU6xrumuo9jpuk3SjCfjfqYF0knIlJ6tAJc0/XhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0JqTkmePkyjWb5CCaV8lmscCVjhYkHgTre3EW7AAFo=;
 b=Y2ZryuEbnMfUN4QQe/WaZO7IW0rNzEb03J4R1rxfZI6opJCUi+d55YRabyfO/euGmE18opzrpUfgdUOOUNGHgznGyoq+jM6nMsieGulLx5f7C2vQDmXTujSBrIiyLmmpwNUNTnuDeWRwL4ZBCHvGLlWSO4SXlMs/S8f54p+n/iE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 14:54:32 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 14:54:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/xe_drm_ras: Test retired pages
Date: Mon, 23 Nov 2026 09:54:15 -0500
Message-ID: <20261123145414.2243338-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
References: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DM6PR11MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a79a94-93f3-4b04-876c-08df4971ae8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|5023799004|56012099006|261009223027099003|261022075727099003|261022105027099003|261022113327099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: wjKyoaDrQIWzalJLWuHWpilXPRx3c3nxro1ItmGUl2BONvPq42+hFP05QhGFNd9ZSq657EOIsdbJlvNGU9wJwDhXQBlEQ5wZU3iO4LXJwa8kP/G/VqOLfjmeyrEfqG+S6G4eN7rPnvPkLxBywDVq4e12scz3VW9cC0+bGzmRBoi8g9S1UyMs0kIpIzxNypOfYgp68W9wHyFaYNd5aoiQ6V8BHlYSNzLYDJq3qI6ZcxEJ21/Bl+FQNWuCmsTgtQCsVBjkAnDIeE7kESZ5JtCwwAte6TAmfaLGV0fe7dkNFL0QzeFXXrCCAYno1httk34iZazi6a0u2ttRftoAkKHyk8pkGMLWM+TSAP2J0qsdtpdsJ2YwrppAZsdmnUqkJh6h+IU9eJdb/52Y0wmwY9Gw4VeSiImZP+k8iJw2nXQCOUJxkGmJqChhMsTXAGPZN0w5F+ZWAuKMns40A7ZQ8xH3LleeFOWXjNU/mysh56ww7D1wIi9R+cj+d3OCDclyJPEPu7nvodrgmei6zEAlUIYLRv+jmSQbWRCF2rU75jhjxTn6k5o150Ubt09Rex+4AhRBrc1nQxV4b7wxrna6VrM6WbHconzDVT1ZFWh1BAbvE156U815O6gRWrs6PD1VMGaaOqChNqK8YNG7eR4Q2WMgshJIV28+MMDkojpl5ffcHC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261022113327099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0M4VWdnMENNR01zSXp1bVZDQ1A1cU4ySGFmRDNOd1JUM2ptUVFzMVhKeHZE?=
 =?utf-8?B?bml6S3plT3EvU3puVGhXZFZMRXlpam5xaUZkbk1OanVnWkdWYXd4b1BETXk0?=
 =?utf-8?B?Szh6aUwwZ1BZTjZzcVVnQ2pRVmV2NEoveDErekJtSk9zc2llSlJXZktMWDVP?=
 =?utf-8?B?SE9YSFNZck5wT2JHWkx0WTZRMzdTUHlqemNSNnEwdzJHUklsNmxhM3hzaE5y?=
 =?utf-8?B?MWFLNmZzQ2x0cFlPa2hObThqSitzRUZmWVZhakY1RUIxbE84N1JNV3MxM0tP?=
 =?utf-8?B?eHZwcUpsQy90aVM1eDA2OTNtM0RLNlVhcm1VNWsxR293bGlPbDc0NE43dGVS?=
 =?utf-8?B?Qm1wVXVQQ1o0R2xqdW1Cb2tXNm5EWit3d2lIZ1NwUzdJVUMxdDgvZTNXVWdj?=
 =?utf-8?B?TEhoSzJld2tiM0pRZGh5S2taT3F2Y0JNdTZUVDlzTWVqc1E3UGdDeElZNnVz?=
 =?utf-8?B?cHo5TkhaT3VNMlpIT1hpZnhZTWxSUlhLbDlYZlN4dDdnV3pDaEc3RVFMYkxT?=
 =?utf-8?B?OWRVRHdXR1RkZ28yME96WHB1SHdyeDNWcnJRd2gyY2x3cFByTGVCOGJRR1Q0?=
 =?utf-8?B?VHd5TDRZano0Yi9GeWdyZ1FTZGpjL2xHa0xid3ZIaUxHUmxhOFZDa2c4SGJ2?=
 =?utf-8?B?TDJuVklwQ3dodUxXbGRvcGRDdC90OHAxait3TjZ1bURqTEdSQ0RMQkpxVE1u?=
 =?utf-8?B?R0d2U2Y0aUFwM2JTMmdBZGRDNmQyUVJIeXZiTTdVUnFWWVVBRklCVjdHdWls?=
 =?utf-8?B?RXhUM0dPeXVaallXRWJCNzhEbWpjRDVxUVVzWlhPRndvT2RucnRTdG1WdDQ5?=
 =?utf-8?B?NkorNFB0S0RDWUxnMXN6U2lmSkFLSStCZ0hjclFmQnJ2V3Y3d2xObGpuOW9r?=
 =?utf-8?B?c0k3ZHgwaTdkZW1QQ0JjZTQvRlMwdENmTCszRURkbkhoWEJhNXZIaTBZREIr?=
 =?utf-8?B?NlNVNm1NeS9DaUlldXhBdUVTSitxTnV0NGJRajRreUIzSVVOWTNISW11RE1Q?=
 =?utf-8?B?R2xJR1RoemVjSThWV1BMcVRCUWh0dklwNVNEUXo4NmdHa1pJelpQaXc0bG9v?=
 =?utf-8?B?VW5WZmRHcW5uK1lzTndzTU0xd0R5VmpMOVliTVFQdHRYelphVzlPNVFlWFVP?=
 =?utf-8?B?MEpORDduYUhaaDd3dCtIOVk3QVN1VVhjN25GRndBMVkxV2dmMkdTVS9ybzlZ?=
 =?utf-8?B?UUhlclJJNEhzNytoZ3dYa2dyTHNHM3dxVU01TjVrZ1pmYjF6ZGFuZkhIZUxh?=
 =?utf-8?B?YWJ1ejMxSnhoSnRKSWs1R0Y2YWxPU2R2QVIyWVAyQUdWR0hwY2toNy9yOFhm?=
 =?utf-8?B?UkNaaTlRVnBNK09yTFl2eTJ5NjZScExwVEhlQlhMeXMrREI1T0oveUZvVGFn?=
 =?utf-8?B?N3VSVEVNbFl6M013dzZUQlJzaXVoZkYxdmgzRTQ2ak5XUGt5TlhMN3lFc1Ay?=
 =?utf-8?B?bm5lUFo2SG5RdjFxTHBEcmU0Y21mNDJOTzZUMEN3TEY2SGljeklGNm9xQ1M5?=
 =?utf-8?B?dmlGY1lhbTljdWRCT3dmZE9waEhzbFZocXVRWGZGRlVscW1ZSDRpSWg5WGFw?=
 =?utf-8?B?SkQxZGFlNmM2WkpKSEs3OU9BWkZmbnRSdFk0TTlRYUxYci92NnE4K1hsYWp0?=
 =?utf-8?B?bXFqdXNFRFE0d09GL0djTlJndkJJOGVSaFBuaEcxU1NRL2VwSE5va3pieXZr?=
 =?utf-8?B?L0FDWFgveFNwVDk2Qkx2Y0FPdWx3cHFLS1h3d1hWWFFJdzNnemJWSFpuVFRn?=
 =?utf-8?B?enVyVGE4aURlejVydmpqck9CZEhlbUI5MXl4U3Rjc1RHclRjVk10NHhyMkFm?=
 =?utf-8?B?UXArelVNdXR4WnM4SS83MUlnQUphbnFacnYzRWxLeVZuanhtM3NIMTRoOEor?=
 =?utf-8?B?SmovVmZsZmM4YTNtdzE3eDVRRzRqeHV2OUZkV28rSUhSNzFrODJ2RXBwQWY1?=
 =?utf-8?B?bm54SjNiS00rMklqclJJVWdDNFBQNXVDRFZBVEs0SDFQRi9sSFcrSm53bUlM?=
 =?utf-8?B?cWZOOGJUTENtN3hFWG5lWVpVSStoTkhWYkpQRzBRL2tiLzZhTWVERjJldXJR?=
 =?utf-8?B?VVVDcDYvUHhxaXBKL3M4ZlBKdVd3QUhFV0ZmbXQ5TnptZElPUTBDVHF1bkVp?=
 =?utf-8?B?WDZNaEtmZC8xVEJNWENjMTRCVXF3UVRhQWFqSjVwU0FlREltbjVJZkl1dGZq?=
 =?utf-8?B?WlM1RVkxMms1QWhxeWxLZnZGQ2xrRHZCdk56NlVlT2ZENzFoU0xjbmM4allJ?=
 =?utf-8?B?eExER0xjZGZFTllMalFmUTYzZU5mTWl6a0JBelBFbEhZMUc4RzV0MzhtOXV2?=
 =?utf-8?B?ckppeWRJOVJFZllJeGo4UE9lNFhLOHBCM3RwTlZKKzRWbGtKK2tiZz09?=
X-Exchange-RoutingPolicyChecked: MDr1vXkj3fBOf8qiTqWnBZcluEukfehet7RbwaHyoNjAfWVOlIVORLqPARn7rTqIwu/s5dOig0bcdJm7bsGr+A4dv6lxkei/Vp80w/pl3zcFlhGVUty3MXnMag4S8jEWmNx4FvBKv04QCJJwuSVxUo2sJqfiF2+HBBXT4moZsk0zBPfVyDNuQE8DdcdZTkoBcHNcLxOOMBoJwJvmbGZNxueB2oyuKMvS/TbjZtgCApnA5PbcybmRKN4tvsh5mxSD5RCy5grOh/5wbo6ftxbOsK0lDl/o/QPXCTb/mf+izxMCsBYO2gOlgsk1Zaa437FMm8ujAMOil1Xm6DS1r1ywpA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a79a94-93f3-4b04-876c-08df4971ae8a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:54:32.0095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jZWW8r9C7ETewWjve+fkrSBXaI9fUJgAAq0sqxs8Q4b06EpzfIIQgihFzflXxB3Saxr5sasE2b5SwESMu0yrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4578
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Check the retired-pages node of the device:
 - retired-pages-info: the node reports a page limit.
 - retired-pages-inject: pages injected through the VRAM page fault
   debugfs interface are listed over netlink, in address order, exactly
   as in vram_bad_pages.
 - retired-pages-invalid-node: requests on an unknown node or on a node
   of another type fail with -ENOENT.

Tested on BMG with simulated retired pages.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_drm_ras.c | 218 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 tests/intel/xe_drm_ras.c

diff --git a/tests/intel/xe_drm_ras.c b/tests/intel/xe_drm_ras.c
new file mode 100644
index 000000000..4803623c1
--- /dev/null
+++ b/tests/intel/xe_drm_ras.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: DRM RAS netlink interface
+ * Category: Core
+ * Mega feature: RAS
+ * Sub-category: RAS tests
+ * Functionality: drm-ras
+ * Test category: functionality test
+ *
+ * SUBTEST: retired-pages-info
+ * Description: Check that the retired-pages node reports its page limit
+ *
+ * SUBTEST: retired-pages-inject
+ * Description: Inject VRAM page faults and check that the retired pages
+ *	reported over netlink match vram_bad_pages in debugfs
+ *
+ * SUBTEST: retired-pages-invalid-node
+ * Description: Check that retired pages requests fail on other nodes
+ */
+
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "igt_device.h"
+#include "igt_drm_ras_nl.h"
+#include "igt_sysfs.h"
+
+#define FAULT_INJECT_DIR	"inject_mempage_offline"
+#define TRIGGER_FILE		"inject_mempage_offline_trigger"
+#define VRAM_BAD_PAGES		"vram_bad_pages"
+#define INJECT_PAGES		5
+
+struct nodes {
+	const char *device;
+	int64_t retired_pages;
+	int64_t other;
+	uint32_t max_id;
+};
+
+struct pages {
+	struct igt_drm_ras_retired_page *page;
+	int count;
+};
+
+static void find_nodes(const struct igt_drm_ras_node *node, void *data)
+{
+	struct nodes *nodes = data;
+
+	nodes->max_id = max(nodes->max_id, node->id);
+
+	if (strcmp(node->device_name, nodes->device))
+		return;
+
+	if (node->type == DRM_RAS_NODE_TYPE_RETIRED_PAGES)
+		nodes->retired_pages = node->id;
+	else
+		nodes->other = node->id;
+}
+
+static void add_page(const struct igt_drm_ras_retired_page *page, void *data)
+{
+	struct pages *pages = data;
+
+	pages->page = realloc(pages->page, (pages->count + 1) * sizeof(*page));
+	igt_assert(pages->page);
+	pages->page[pages->count++] = *page;
+}
+
+static void netlink_pages(struct igt_drm_ras_nl_context *ctx, uint32_t node,
+			  struct pages *pages)
+{
+	*pages = (struct pages) {};
+	igt_assert_eq(igt_drm_ras_nl_list_retired_pages(ctx, node, add_page, pages), 0);
+	igt_assert(!ctx->dump_interrupted);
+}
+
+static int cmp_address(const void *a, const void *b)
+{
+	const struct igt_drm_ras_retired_page *pa = a, *pb = b;
+
+	return pa->address < pb->address ? -1 : pa->address > pb->address;
+}
+
+static void debugfs_pages(int fd, struct pages *pages)
+{
+	struct igt_drm_ras_retired_page page;
+	char *buf, *line, *save;
+	uint64_t pfn, size;
+	char flag;
+	int dir;
+
+	dir = igt_debugfs_dir(fd);
+	buf = igt_sysfs_get(dir, VRAM_BAD_PAGES);
+	close(dir);
+	igt_assert(buf);
+
+	*pages = (struct pages) {};
+	for (line = strtok_r(buf, "\n", &save); line; line = strtok_r(NULL, "\n", &save)) {
+		if (sscanf(line, "0x%" SCNx64 " : 0x%" SCNx64 " : %c", &pfn, &size, &flag) != 3)
+			continue;
+
+		page.address = pfn * getpagesize();
+		page.size = size;
+		page.status = flag == 'R' ? DRM_RAS_RETIRED_PAGE_STATUS_RETIRED :
+			      flag == 'P' ? DRM_RAS_RETIRED_PAGE_STATUS_PENDING :
+					    DRM_RAS_RETIRED_PAGE_STATUS_FAILED;
+		add_page(&page, pages);
+	}
+	free(buf);
+
+	qsort(pages->page, pages->count, sizeof(*pages->page), cmp_address);
+}
+
+static void inject_page(int fd)
+{
+	if (igt_debugfs_exists(fd, FAULT_INJECT_DIR "/probability", O_WRONLY)) {
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "100");
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "1");
+	}
+
+	igt_debugfs_write(fd, TRIGGER_FILE, "0");
+}
+
+static void test_info(struct igt_drm_ras_nl_context *ctx, uint32_t node)
+{
+	uint64_t max_pages = 0;
+
+	igt_assert_eq(igt_drm_ras_nl_get_retired_pages_info(ctx, node, &max_pages), 0);
+	igt_assert_lt_u64(0, max_pages);
+}
+
+static void test_inject(int fd, struct igt_drm_ras_nl_context *ctx, uint32_t node)
+{
+	struct pages before, after, debugfs;
+	int i;
+
+	igt_require(igt_debugfs_exists(fd, TRIGGER_FILE, O_WRONLY));
+	igt_require(igt_debugfs_exists(fd, VRAM_BAD_PAGES, O_RDONLY));
+
+	netlink_pages(ctx, node, &before);
+
+	for (i = 0; i < INJECT_PAGES; i++)
+		inject_page(fd);
+
+	netlink_pages(ctx, node, &after);
+	igt_require_f(after.count != before.count, "VRAM page fault injection not active\n");
+	igt_assert_eq(after.count, before.count + INJECT_PAGES);
+
+	for (i = 1; i < after.count; i++)
+		igt_assert_lt_u64(after.page[i - 1].address, after.page[i].address);
+
+	debugfs_pages(fd, &debugfs);
+	igt_assert_eq(debugfs.count, after.count);
+	for (i = 0; i < after.count; i++) {
+		igt_assert_eq_u64(after.page[i].address, debugfs.page[i].address);
+		igt_assert_eq_u64(after.page[i].size, debugfs.page[i].size);
+		igt_assert_eq_u32(after.page[i].status, debugfs.page[i].status);
+	}
+
+	free(before.page);
+	free(after.page);
+	free(debugfs.page);
+}
+
+static void test_invalid_node(struct igt_drm_ras_nl_context *ctx, struct nodes *nodes)
+{
+	struct pages pages = {};
+	uint64_t max_pages;
+
+	igt_assert_eq(igt_drm_ras_nl_get_retired_pages_info(ctx, nodes->max_id + 1, &max_pages),
+		      -ENOENT);
+	igt_assert_eq(igt_drm_ras_nl_list_retired_pages(ctx, nodes->max_id + 1, add_page, &pages),
+		      -ENOENT);
+
+	if (nodes->other >= 0)
+		igt_assert_eq(igt_drm_ras_nl_list_retired_pages(ctx, nodes->other, add_page,
+								&pages), -ENOENT);
+
+	igt_assert_eq(pages.count, 0);
+}
+
+int igt_main()
+{
+	struct igt_drm_ras_nl_context ctx;
+	char slot[NAME_MAX];
+	struct nodes nodes = { .device = slot, .retired_pages = -1, .other = -1 };
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_device_get_pci_slot_name(fd, slot);
+		igt_require_f(!igt_drm_ras_nl_init(&ctx), "drm-ras netlink not available\n");
+		igt_assert_eq(igt_drm_ras_nl_list_nodes(&ctx, find_nodes, &nodes), 0);
+		igt_require_f(nodes.retired_pages >= 0, "No retired-pages node on %s\n", slot);
+	}
+
+	igt_subtest("retired-pages-info")
+		test_info(&ctx, nodes.retired_pages);
+
+	igt_subtest("retired-pages-inject")
+		test_inject(fd, &ctx, nodes.retired_pages);
+
+	igt_subtest("retired-pages-invalid-node")
+		test_invalid_node(&ctx, &nodes);
+
+	igt_fixture() {
+		igt_drm_ras_nl_cleanup(&ctx);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 806320a82..14e576ea6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -361,6 +361,7 @@ intel_xe_progs = [
 ]
 
 if have_libnl
+        intel_xe_progs += 'xe_drm_ras'
         intel_xe_progs += 'xe_err_injection'
 endif
 
-- 
2.56.0

