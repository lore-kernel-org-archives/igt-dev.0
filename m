Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA7CC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8C910E626;
	Fri,  3 Jul 2026 14:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evLkmyDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6D610E2E7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783088932; x=1814624932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mL4uiBHGpUd5T/vHsx+4m4KI/YALVW6gVYtA/e5jX/A=;
 b=evLkmyDaWR4/wKb7BZB0Ye10lv5wtnIx5b9zMAm4ZeC6rOabFfljkzO0
 o+iRJBQDVWSEs+FEpNZONn5LAILiyMxltD5Rdc6WX/dec2QEeGwruzSYD
 k8UU9mP5dWSrLZns6WhkkBgLH6sNLtZerr1R50ntEA6+yYF091cOAwKBr
 VewfjLp2hlU0kB6HpUl0Qa8fJgir7tXuRCWe4h1sZkYZ6y8Imzor0dVl2
 8mmuclTk0B0L5p9dKu0LI+DccHIOTlHIwpitUk4KcB90nWVrWVHTqodfE
 bHyWjekrunwWmYxlHGqS0Y4RHWoiuw49h7iwIZ4JPxiR0Yhnl5fQtksn7 Q==;
X-CSE-ConnectionGUID: A03irXt5SAWQO5Qb+NDAeQ==
X-CSE-MsgGUID: V3o5UBosQ+ygk+BNfT8+Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87523741"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="87523741"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:52 -0700
X-CSE-ConnectionGUID: 3cfoQHvpTHamEU3nnYYQlw==
X-CSE-MsgGUID: F88tWWl9TQCPQWwbIhQvbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="250476107"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 07:28:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 07:28:51 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 07:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIXRlVgwOc83ZU8TcsBumPXVM59sj7YXSu2vvGPVNeEtPmCq9RsqMYHb4MGtRHlTWTPZKDi45TZs0KDC1aFAMIp2ZNhhKhi9qGA1kXRfcu3cF/+I/J7qfhpN06reiAazT22ehKiI10ckeZL0+rTcLHrIVzK6GPIGyQQ332/wNMgHFiadkF78GrBHLpI/61YFpDznvyVIydGCoZszLwUYMe0VvTOCdXKo/EnHfX/YNI/9D4HNz1bH7AzUhz4PRoTm7q/xoUICuG7iI5AjAV0tLKz4MY78yHx1uzpWMs40hBz6/MG4NDGvCGA0YOeiZoOvp++0iiOJmEiKcAv8saOyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZUEsVT8cgRVVHr3/wXrydjO/bNecEnCA70tEYGN2CE=;
 b=S9ybMTjP4dkp1mtBLC93OGiU6aDZtC5VdzSOURJrQ9O3aIV7q1ZINC4GIEiuCdSFnD9MG5PFzZJYVgYAg7ufz36j6U/q77SrAxJmpwE4La0sgm/tiETMuJjRlQR8vLig5cHiDhrdRryuDGS84ompfEPKn75Iyje7pyvrmQfiB69rhH+Ae4ummv8LPMWA64bA1tbqLxzJ4zfSF7yT24NtP4BhS59pIXoMSRdOm2HSplOgQTdcTFb6aZI5xesyxxTvTrHIIFfQ6COR5mw2brgAxCRmPOCe9AHKyWq7Yq+ZgVPagwywaNRQBZb/KovidB/N0I5u3pe6SQAqLVqbkYv1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 14:28:48 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0159.018; Fri, 3 Jul 2026
 14:28:48 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 06/31] lib/igt_drm_stub: introduce for tools needing
 driver detection
Date: Fri, 3 Jul 2026 16:28:40 +0200
Message-ID: <a7b3a59cfb110b0d7f94552207b2d6b9faae02aa.1783088106.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1783088106.git.sebastian.brzezinka@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: f42a0d47-9ab7-45e5-9e07-08ded90f65a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AeQS+bhaZoTQfafbD0Plzb9Tfl4Zsarbg52fXydXBYyNuLbPZTTutQIKSEUNmEzVD56rQ8Y+ZJmrUouDF8sCSrGl2dKWteeIHyGUdlDUAIsP2xSgh/gqpmtnEt6DKvir83+RpyzUKuuzMtxSH2anylhTmbph2mXyPw7lZQJ2IxZQyDlPR8Wfnpe5a9E0m508uKXECNeKrZNhLcKnWIztziusDLRquBgETXbPr4MjJG7zVz/dPkTiT8hMvI+E5q/FZTI1aNwT702eBh6hZiZregCztRJpquotSFoQC05AzmiF7d1YRW1VQZ9NgiYkY7Ea9xd944zfYFDsYMdpPkmizmIk7Ye3Is7KGIr/dFGbj7fdpjmC1k9qxzKS6D+K0lT/PtNc1t/vvfChmNq7RRTk976OAkKGZxocB7xxUbqR0TlTTVVPx4awvGB6p8UMQaNSN+BSRMvToFxFyCrYNVxDuQ3I1icNA1AFI5CVto6MmN2kEH8dEvXRIShIe1YptjfAyINyqxTpVz3bjLWRDZ/Dh8uZYxKtrV9pQaTGs3cMKbO89qlc3VILDZjl97s4Aod/9upjzDLzOSNGDPiaVd3RXML3yUHtDUU8JN8pA841ASopzBNnYVM8LeteTj4JkSP7qkdBgnalAefug9kT8452nUy4knihzm2J4sHK11JvCWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9qek1Nd05NMU9HdmpLL2NINk9yYkJOQkZlVytydHhlRWFRalYySEFHRGx0?=
 =?utf-8?B?SmNOWkFVVFhaTVp4TmRTcE5zYkJsRUdlYjc0Z05PZXdhWHRYYS94ekFKZXJT?=
 =?utf-8?B?Z292U0F6ZFF4VTFlVWlRQUYvMjBLZnVXUUlEWmJkOG5CaDAyWFRmQ3NZcGN1?=
 =?utf-8?B?UWc1ckVFZjl2ZCs0MEhRdVVZaGhRZU50azdselc4b01RVjJjV0Q1VlRoY3dy?=
 =?utf-8?B?S0lmd2M0WEtHQnVhSDhQM2FGeFRYOXBtL3c0WUdLSXhUSFQvUkIwdk5rM3di?=
 =?utf-8?B?cGZPYUxLbFFkVmhwRFc2Q2hTNlJFTHBHTlNRdGpZYldId3lDSFMyUFAyWGFY?=
 =?utf-8?B?ZThGZ3dxL3ZQZ2lRZDlXWE5mbHFCYkkxaC9tNFd2bHYrOWZvcDV5aHN1S2Vh?=
 =?utf-8?B?N2phR1hVSHhralA3S3R1NytSU21aaXFOMHMwdUttTGFZZlB4V2hPYU8yZzlE?=
 =?utf-8?B?cWZiT3hMQS9sb2pNaGthQjVOOWRXbU5nWVY2d2lUcjVxcFRVY0JHcmVyT0RQ?=
 =?utf-8?B?MmpOeVN6UkZTTzlDQVNpck1LbkpOVVl1TVMvZVBvUTJ6ZzJlTUJLVGx5MHNy?=
 =?utf-8?B?ZWVOcUVRK2FSbk1HeC9oSmMxSXh5LzlKNWx5eG9iSTcwcmNMdWVvclpqZUNo?=
 =?utf-8?B?MktTcTRqd0VlYUI0WCs0MDcrN0wrc2FieUIrQmx1OHk1b1NzbndpNk9YRWUx?=
 =?utf-8?B?dXozdTVSbndDZEVtNHRiTUNxbzNVNXZ1U0kzd3JZTDBTU0FMdzBURG5IUDdM?=
 =?utf-8?B?WnI3UEdzc2FON0RzYTNybGM3Mzh4dS93ZmZuK01MUGJxWitYSnorR2d6UkNy?=
 =?utf-8?B?S3JkTzBlME4zZUlKYWM0SjcvTzFKRTBvUGtYNUF5K2FtSkhsTjJWNzlwbW5I?=
 =?utf-8?B?emN0SDF6TXZxRUN6RjZPV0IxUnNhSk5DYXhnRE5jU0ZUcEhuZUZra1FHQU4x?=
 =?utf-8?B?YXo3SW56SlVyaGlYWW9tQlkzdFl1K3RzVlRoVXZBL0xGMDllV041SnRhU2Ni?=
 =?utf-8?B?N1dRSHk2WnFicWVjK0tPczZ4eU1vbkxsWDMzaGxwck9BRDNnbktEZVpmLzlo?=
 =?utf-8?B?TFlGdzBrQkhYU2hTL04wMkEvd2x4ZEFCZnBTZGpzUk1rektXSkJHZUhIeVNn?=
 =?utf-8?B?ZmYxQVIzY05odVlSOHgrWjdPTlF1ZCtPWTdHa3c2VEV1bEVCcW8vSVIxNkxM?=
 =?utf-8?B?OXI2T3c4VHVrYko5aGphN1hBbHcydnEvVk9jU01RYnBxcXU5UDBVYVRWVmtT?=
 =?utf-8?B?Qy9EQzA3bHZNTHliUUlKSFY3QXBsZlExRXNpMWZTQjFaa1o1cSs1SDBJUGtw?=
 =?utf-8?B?amc5VmFyVlluMTVCUzgrL3pJdkI4ekUvZXNLUHJZdDJ4cVhNMkpoUTY5K0cx?=
 =?utf-8?B?RlJtNUVacGkxeXJ4Z0ZKVzdxbDlLVjAxWG1EZURpeXJQSTV2QjFKRkxlYnFJ?=
 =?utf-8?B?NFBFMGVpU3BZOUFudTI4T1owK0loVVpmTDluaDI2RnphRjkzazJIQitldkhr?=
 =?utf-8?B?dzN1dW44VWxFbEtiM1VJZEErMHAzSWJjMzZKY3ppNE1NcHFDOVRZejdlUFZa?=
 =?utf-8?B?WFU5V09QVjRNN3JvTDdUbC9RUjBVWkdFVVg4RjFsb1JGM1pvaXJSZlNKeEI0?=
 =?utf-8?B?czZtTDJocWh4WFd1cWxLMXh5YTNJUWVaeU1qU2VhVlBCanFLa2x0TGFPb0lV?=
 =?utf-8?B?ZWpoMEtQaVhTTDB0Q2YwMjl6VkozOXFsNkpnSlVXa0F1K0l6R1ovOHVtTDZG?=
 =?utf-8?B?bExYU0pJczJyNkozUjdDVmdnbTlZclBBNHNBRkdsL1ZVWVlMRzJyYnBKY0ZL?=
 =?utf-8?B?OXljTzVwQzdyeE1RVHE5NTFjWU84RlUyM29ubElncS9QcE1GYlZDZVJNc2NU?=
 =?utf-8?B?c05VbFF3MWJOOWQ3VEZuRXc2NDB1VlB0MUZhZVNZUnZyMjhPNFExSVlTaEVO?=
 =?utf-8?B?UndjdFFtOCtKbXJEbGE4UERBLzhMU2xGdW1MeGlHRlV1T2hSaWFxOTdPcmNC?=
 =?utf-8?B?eDVJdW8wQ2VSRWFwQjAwVlpxSkxEQXZNZmdkK2VWRUpGNElNUXlTRklZWVZO?=
 =?utf-8?B?cHFLTGtRSjZ4cHljZHhDRVNiblh0SWk3eEI0S1FoZGVGTmRVdnZhQUQydDlP?=
 =?utf-8?B?YXZkSVpQMDdhMGtTZDdKNE0vK0lDU3ZGYlZOQXkxU1l3enQzUnNJaHllSGli?=
 =?utf-8?B?VnBuMWtVUkd2MTZJVXE5YzBmOGR4UERadEFKM1huZkRWa2xmUVF5dWI0aWZB?=
 =?utf-8?B?L1FMb0MrYlROL1VEdFlhOTR6eHVORzhycFY1ME5aVkxwakNjWTQ4djNyR09H?=
 =?utf-8?B?RzY4WmF2VFhNbUxYZUw1SUFxWXdYOTkrNW13MEdhWFpscDZDWGFlaFJTbUpQ?=
 =?utf-8?Q?pYZKaAXFDw500Ids=3D?=
X-Exchange-RoutingPolicyChecked: f18NfmyAuCUOMsT3T3eebl6MVh7ZmHGlKg6a8glNUxYyGPJGUFyQLoUDrj3zxVQqjsVTEUJO/GZbx2Cm01U+9BOLAMmKG98GgWm4vQEA6LCyjhinTtQEzzGZ696DZ/L0PkeMsCGRai98J0dnh/X+Kl4Fbr7Kw4xJxF4cZoHW7Sxj6KQtc7tv7A4XAH8iD4wmKjzqlkYcheFsmc+IhU3SDlGob9cPoD9Jc/8LT9jCH4q6g+Z31gb32Ek6oPMRw3tyKjcH/MRXRRv8o4wtdZhESfzn7pmVlDcPoTdvtpaZ6BzThpu77wO2RYOtn1DP3o0dFVCWuaK/wGeHTE98dwbSvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f42a0d47-9ab7-45e5-9e07-08ded90f65a4
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:28:48.7444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePjMV1fgKsvlsJGM1GqqTOnNbEFXT9buVtTsDo1uWYcVCkPf71fH854Fg6iDKCI7ovxK0fIDneahq9rAv9BxLPbW2OuFz0+cMzDqd4mYZ9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

Add drm/pciaccess-dependent stubs into a new igt_drm_stub.c.  This avoids
pulling libdrm into tools that only need dep-free logging and exit stubs.

The new lib_igt_drm_stub static sub-library provides: igt_pci_system_init,
is_i915_device, is_intel_device, xe_dev_id and __drm_open_driver.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_drm_stub.c | 132 +++++++++++++++++++++++++++++++++++++++++++++
 lib/meson.build    |   9 ++++
 2 files changed, 141 insertions(+)
 create mode 100644 lib/igt_drm_stub.c

diff --git a/lib/igt_drm_stub.c b/lib/igt_drm_stub.c
new file mode 100644
index 000000000..f8ac3a992
--- /dev/null
+++ b/lib/igt_drm_stub.c
@@ -0,0 +1,132 @@
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+/*
+ * Minimal DRM/PCI stubs for tools that need driver detection and device
+ * opening but do not link the full libigt.so.  Requires libdrm and pciaccess.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <pciaccess.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <unistd.h>
+#include <xf86drm.h>
+
+#include "drmtest.h"
+
+int igt_pci_system_init(void)
+{
+	return pci_system_init();
+}
+
+static bool driver_name_matches(int fd, const char *name)
+{
+	drmVersionPtr version;
+	bool match = false;
+
+	version = drmGetVersion(fd);
+	if (!version)
+		return false;
+
+	match = version->name_len > 0 && !strcmp(version->name, name);
+	drmFreeVersion(version);
+
+	return match;
+}
+
+bool is_i915_device(int fd)
+{
+	return driver_name_matches(fd, "i915");
+}
+
+bool is_intel_device(int fd)
+{
+	return is_i915_device(fd) || driver_name_matches(fd, "xe");
+}
+
+static uint16_t read_pci_device_id(int fd)
+{
+	char path[PATH_MAX], buf[32];
+	struct stat st;
+	int sysfs, len;
+	unsigned int devid;
+
+	if (fstat(fd, &st) || !S_ISCHR(st.st_mode))
+		return 0;
+
+	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/device",
+		 major(st.st_rdev), minor(st.st_rdev));
+	sysfs = open(path, O_RDONLY);
+	if (sysfs < 0)
+		return 0;
+
+	len = read(sysfs, buf, sizeof(buf) - 1);
+	close(sysfs);
+	if (len <= 0)
+		return 0;
+
+	buf[len] = '\0';
+	if (sscanf(buf, "0x%x", &devid) != 1)
+		return 0;
+
+	return devid;
+}
+
+/* Matches the declaration in lib/xe/xe_query.h declared here to satisfy
+ * -Wmissing-prototypes without pulling in the heavy xe_query.h header.
+ */
+uint16_t xe_dev_id(int fd);
+uint16_t xe_dev_id(int fd)
+{
+	return read_pci_device_id(fd);
+}
+
+int __drm_open_driver(int chipset)
+{
+	char path[PATH_MAX];
+	int fd;
+
+	for (int i = 0; i < 16; i++) {
+		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
+		fd = open(path, O_RDWR | O_CLOEXEC);
+		if (fd < 0)
+			continue;
+
+		if ((chipset == DRIVER_INTEL && is_i915_device(fd)) ||
+		    (chipset == DRIVER_XE && driver_name_matches(fd, "xe")) ||
+		    (chipset == DRIVER_ANY && is_intel_device(fd)))
+			return fd;
+
+		close(fd);
+	}
+
+	errno = ENODEV;
+	return -1;
+}
diff --git a/lib/meson.build b/lib/meson.build
index a57c1eb8d..484a912d7 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -356,6 +356,15 @@ lib_igt_tools_stub_build = static_library('igt_tools_stub',
 lib_igt_tools_stub = declare_dependency(link_with : lib_igt_tools_stub_build,
 					include_directories : inc)
 
+lib_igt_drm_stub_build = static_library('igt_drm_stub',
+	['igt_drm_stub.c'],
+	dependencies : [libdrm, pciaccess],
+	include_directories : inc)
+
+lib_igt_drm_stub = declare_dependency(link_with : lib_igt_drm_stub_build,
+				      dependencies : [libdrm, pciaccess],
+				      include_directories : inc)
+
 scan_dep = [
 	glib,
 	libpci,
-- 
2.53.0

