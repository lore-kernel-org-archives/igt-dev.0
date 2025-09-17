Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40666CAC598
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 06:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25DE10E0BD;
	Wed, 17 Sep 2025 06:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BX5IUbbx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FF010E0BD
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 06:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758091664; x=1789627664;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=g26d90hvSggSEPwTFbPzZAtkiVGFC1MVscNkgPcNMEM=;
 b=BX5IUbbxRzHcaDH8aj/Gb9vr0ieWaU19VURVvKgLWZ8jzyeF7goN3G03
 kFVmxghvM3iSLby73NDMg9zKarvkddsCvbBNJe9bbvyHYfjzjTgx5zUFu
 L+Ca7/Fk+cZNgb2lAnhZBVSLBR1NFlLrVbUragGYoNdaIyrYDU3Lm7N1r
 20ILMPlGDi/gwznYxwku5pJA7M19kRV3eg8EBYRcclrTE2v0GialnXZnv
 1AMxuZg/RlB6s390eUEbQwe0/FEASAm3k+0Ii/zAIpmrEZZM+ouz/FmBB
 UbFibzX+328iqvh5/5O7AsGeuftQ/DeVkxZ8fOmV33c1dUZrXJjcX80f6 A==;
X-CSE-ConnectionGUID: bbxOPlqkQmGY1YpHR5dcgw==
X-CSE-MsgGUID: gwmfDzZxSYq8bVRmiI+tTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60496194"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="60496194"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 23:47:39 -0700
X-CSE-ConnectionGUID: J0CdO60ZRsuHWu0IgvLVgQ==
X-CSE-MsgGUID: RVdyExcWSkKCDzsgCDvwhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="174452383"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 23:47:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 23:47:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 23:47:36 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 23:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb/AkXd9UinipJR5uzZjCRXPuWmnJstfUfiesf9f1Kw/iPJuxukwc2ZTdfKo4FWBAoXBX64ZoIzyVH9PRIM6VESe9EcxBgD0OqfbBa80fSUbMv/t5Qu1jzov097iVPIod4GOOSOi9MjkskleB/d3R6Wc2vhx0ttBBcytr1MqEfZamQNUCMevED7P9mcOf6CT5d1B1t28kepOzh+uDddKDA40JSK3Wms2QlXgWjzzlarjQ7TZ3+DlI8q7tUh8QzBs885W8w20AtAb7nJ6MQ4GeUh/b+OSolAfZjLLKhOSU7yDVDcspTtznTaVBZlgfXZl+AkCs84biYs5LGMaYtOjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57ZGakZDJ1hHwyjNhvD3pPthblY9+6fbQDrP+TzmaPI=;
 b=ToZKQ+I8UohuJ59MFXWX0iRWwBlcqqV0puP2V3QhAIBo3SyQ0iUK+TQX4OQPK20ZIvaY08sxXq6I1Dyg5r1P5AK3O9pWdr6gPxRsm0W26BBFnhAuNko0nCKZj9V04lJ5X1NG8ygMgVelxbbrcRl+jY2gg7Pmq4ubqqmlM+SxrZJ1DDtydgnqmnISjl+YvoaOxHHyT94YBSGnR9/inKyE0MlgVh5uc/1HfN8bBSSQjNjhbaR8s0O2mVlK39kgTc/Dm54aF53ytayznyJZBOUkwz1921hdvlLrPcgezbJNjslMEEWoH/cxXnJaTibDX/OOUyl34qVlvglHpQX9r8TbGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 06:47:30 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 06:47:29 +0000
Message-ID: <313f01f0-5cfa-4be9-acb8-655156d95dc3@intel.com>
Date: Wed, 17 Sep 2025 12:17:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/1] Revert "runner/settings: Add function to set
 IGT_DATA_PATH environment variable"
To: <igt-dev@lists.freedesktop.org>
References: <20250916130904.166885-1-kamil.konieczny@linux.intel.com>
 <20250916130904.166885-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250916130904.166885-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|DM4PR11MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c89042-6dcf-42fd-bb99-08ddf5b61217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXovUnVndFgxdnFvOUhKWndDc0tqeVhtQjA0UHZHRlU3cm5wNFVIOEFDTmhw?=
 =?utf-8?B?ZmNjaHcrdTdZbFhvU01ZeEx4RkwxblhZWndoeFdueXVXNmRCck9xMVN1VUtm?=
 =?utf-8?B?RytoWUVDSTdkOW1oM3ZVN3U2RmI1VWJrRE9BZkh0YTFxeGNnd1ZNVEJ2K1FW?=
 =?utf-8?B?L1gzRTcrOHNDcHJsMHYzeC9JUXNNRU9MVGgyZ2lqWmdWTzBlaVJCcGNCUWpk?=
 =?utf-8?B?a0pmcjk3bHQwOEZYdzNPWm1IVy9kd3gzUWZOYnFjcWFSMGI4dmFIYXA4SlNp?=
 =?utf-8?B?Q0MrM3kvcGx2aEQxend0REltKzlHV21xSkRUd0NrdDdrM3dIYTRSdGdFTlBi?=
 =?utf-8?B?MlliemViSktmS0d3YXBYTnlYeU9RUXBjTVppeGhTSU1nTXRkNUVySE50RDNO?=
 =?utf-8?B?MG1ZNjRGVnhIaWowMEE3eWhMVHZpWGgrRXU3a2RwNXQvU3doVnhLZEQyVk9P?=
 =?utf-8?B?Z1RCMTM1b2R2TVI5bFN6dnk5UnM1Y1VzbHdaTnJiUWphejNSSFYvK3Y0cEli?=
 =?utf-8?B?NXV0ekhPRHErWTBaNEFtSHhXWTRmV3Q4Vms3bDlZUWk2cGxNLzZaQTMySVlR?=
 =?utf-8?B?anJwczBCKzNrOTNtdE40Uzk5MFhxWlA5eXk1SjJPVXo0TWpjZzZ0L2QxVFA0?=
 =?utf-8?B?UHd4aEdZNUs4TVJVTWFMQ29UdktpVWNkcGx0SXoxaHFTNVdvUCtYMGxvbnUr?=
 =?utf-8?B?cXRMc1VjUXBlVlJCK0Z6eDJGZG9rK1pFYjJSKzBBRUNRMTN1dWE2dGgyMjJN?=
 =?utf-8?B?QzdwY2VUZGVHc0R5ejBDbjhVLy9lREFyei9FM2VRREhFMWhyOTRYTUM2d1JV?=
 =?utf-8?B?b2dFTmxQbFBuS1ZUZkJoZWUyektZbGh5YjZubHJlWFZTL2NLVldHQXh4ZHh3?=
 =?utf-8?B?WnpJZDdVYmpuK2p4YTBjN2tjTS9UdkhId2dYN2hkcElJUTljQjZNb3k3L29h?=
 =?utf-8?B?OWpUU0FmOW9PYXBTUVk3c29BT09vUXJCNTVRWU9mYnV0Wk1PajNET00xaEVV?=
 =?utf-8?B?M2RwY05ubGdwVzgyQ3BBZXE5dEwwYmVZRSt6VDcrVG9QSS80Y3B2em8vZ1ZB?=
 =?utf-8?B?S01WQXRFa3ljUmtGbXBySmppRWVDV3UrcjgyM2tvaC8yWCtlM3N2dnB3c1dK?=
 =?utf-8?B?bnBtQnJqOUl4UktYY0ZpRklWK1FhbmhXbEU4UWhGajhRNGM4RTlTamNsTWow?=
 =?utf-8?B?N0s4ekJObTFvdUpISytHT0U5ajAvQm1KRCtKN2w4OGlUdUlXcFl2R0pQZW1I?=
 =?utf-8?B?ZjhYUUJyekN3VXNFU3BFUWpOS0hMZmVleUtUcUQ2RlgyMmJtT0NwMytRZVpu?=
 =?utf-8?B?WlVjd1Y3d2hEQlRxUWxxTEZIb0NOOGVJNGtFbDBETHFsU1lQNHB1aVBKeGRO?=
 =?utf-8?B?YXhuOEZtL0dsanl0VlRUQXlWL3NVdms5N0wrQWNEVk1Qb0ZaNlM4LzFDekZK?=
 =?utf-8?B?TkRGQlVkajBUQnRlS0RNcmg3dGNKSUVWVFhBRjZtWkJVVk0rMjVXRDROU1hD?=
 =?utf-8?B?Z1doUlJ1clNMbzhlUjlIRUpJMUtuMXNwZXNqSlJjTUFLaUJ1Z1JDMVZ6V0Nv?=
 =?utf-8?B?ZThYZ0ovd3dVbkVvS1V2aldtcnVlTU0vU1FxY2daYm81NFJ6YWtkN0k3aVBh?=
 =?utf-8?B?SDB0V2VCK1lsa0VVbUkrcEpjQjBlNlYvaWpEWkUxYklxQmRrSENXR1IrZFJ5?=
 =?utf-8?B?c0p1b1p3d2lYdERPMHF6SWNnUXFsS21oMDIwMUdoWUNwY05JQTUrcnFWWUlD?=
 =?utf-8?B?U0dybHdna04zQVFIc0lnejY5K3BBbWE3VzBleDh2bVRraW1sUTExc0JxSzlT?=
 =?utf-8?B?a1ZFS2tZZ0diM0JHU2haS08zcTlZaUk4M3VzOHBWQzhtV2VkRm9aR3hrYVV6?=
 =?utf-8?B?dzVlNEttbDVxUzJDVUc0WjYyNlpjYnlKMmY1ajliSnlXRjBjWnNYbWlvNzR1?=
 =?utf-8?Q?TWEV42u+7TI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amNhUzF5Z1hvNDlydEMxYnZVa3k4a2o2cFJvRUl0ZVhPaDJIWkVGY1V2NEQ2?=
 =?utf-8?B?Q3c3NzBsT3JtOUl2M2lhbEZFK1dsM0pXazRkQnBjNEw1QjVweTh3bXVSRDQ0?=
 =?utf-8?B?RnZldXVTUXoyR2wrc0l4QTN3QXBTMG56czhqM21EcW5KaWJyTTdHN2hjSjQv?=
 =?utf-8?B?Y0krRnkwZ3hKdE00aER3WnI3Y1N4V0JuUGEzMG1KdUczOUFqZXU0NHVjeFV3?=
 =?utf-8?B?WlRzam14czFNajFRTGxlZTlEYVEraGNOQ0NCL2hBSXQrczR2SWVXOGMvMVNo?=
 =?utf-8?B?TWhuZUpvWlNEdGphNHhTQS94NVVhWFBubDN0akJ0N05YTzl1dWhlQUVycDdD?=
 =?utf-8?B?TTlEZXpvZ0w1M1lYSlIramYzZXdmaU5Wc0ZpUmtUeGF2NUJueGF4dFZZbDZR?=
 =?utf-8?B?QkpadFVXQTJnMmw0SGdlSnNlRmhWeC9UajB5QjRhRXpWR3MxekQ4S2VrTjFH?=
 =?utf-8?B?eUY1WmVDR0hoSzBRem9oODJ3NVFJYk42UEpPa1VyZnZXcjR3K0twWlpZYlB2?=
 =?utf-8?B?YzB5Wk1hbVo4ZTFGbTBlMkNtRkNXVmxQVXZjV0p1R1pCeTNia0hsaGtKb1N4?=
 =?utf-8?B?WW9Hb015a2I0VHhEbGlIZFozRTJMZ25Xc3VkNmpDWEZneWNPcW1HT1d4NWJ3?=
 =?utf-8?B?QnlVVFdHM1MvUzlaTWYvN1VFNjk1WEFDTWc4RkFwcDg4ay9OaXZoSk1JZGEv?=
 =?utf-8?B?ejNPbDd4YTFiVkxKS3NyYkp6M2F5OHRib1Jvc3htTHZCeG90cWhvV0pqMVZz?=
 =?utf-8?B?L1lHR1FUS3NEQm5BS1RCV1BCZzRaZS84UW5xTGtSOW44SnhmNSs4YlJDekc2?=
 =?utf-8?B?U1MvNnRyTW92OEc3Ti96Zkw2bmUvOUEvc3FHVEZyL3IzVndjdHMwM1c5UkQ1?=
 =?utf-8?B?WUlmU29ER1hhd01qdGRYZ0gzRW5pQ2R3THlMWitCU1VSblQxZVJPUzRHVkEr?=
 =?utf-8?B?ck80Yyt3VnJjb3BPK2hBNDlsM29aRjl5dklZcWQ2ZFJDV085azlXYktBUlpx?=
 =?utf-8?B?M2VlK1Nzbk50Ukx3VUx1QWhVd1hWeTZCZW43ZWFQREFCa21lVHJiZllYT2hO?=
 =?utf-8?B?ZzhYcnBKcER0WWNkYzhNTHY5ZU8wNk0wOVNtbGZXbXhFZ1prTmJjZUVhL3U0?=
 =?utf-8?B?VWxqQjlOdWNFQVIzMmdFVEJBRWdzMG1SQUo2dUl1SlNkRlM0dHFtQTB0NnB6?=
 =?utf-8?B?dFllSkRxOXNaRVBJWG1NMnE3SVFZOEN3R1U1T1VhK3NlV2tSOFVBVUhBdkxC?=
 =?utf-8?B?MG9tR3Y2SGZ4aEU4SEpkcnUxL01WVlQ3aWMrZkZadlRsUDc0Z3NOdmIzSVFz?=
 =?utf-8?B?TlMrSHpXMS9QOXBTOHZZTDBWaUNGdnVRVE8rTWJ2TThjMDMwWWNabTM0M3BK?=
 =?utf-8?B?eWRvMExIMUlVYkZ1NUZRT093NkhmK0lsQ3NaZmxkdHdJakhJb2pYdS9ReVd4?=
 =?utf-8?B?NVZPKzA4d0ttb1FxTkx1cTVkMGJKYVRNaC9PMjMwY1F6dFd0WFJKbEtGMXA0?=
 =?utf-8?B?RzJ2MzNmbXRVOFRBdkFaZUtvQ3BUWlp5ZDRDTWZBRER5MERPaE5zc2xvOGUr?=
 =?utf-8?B?dm01SFpCQkh3MzBUVWlmc25SMWJwVmJ4TWhwV3UyS21KcDJMdXBRWXYweWly?=
 =?utf-8?B?b0IxVi9GTW9ya3hCZzh5M3F6VnBTQWtPRURhd2JsK2laUit5OXBiMkRndXVi?=
 =?utf-8?B?N1U4QTA4QWJ1TkRRUjY0Tmd0dUtOT3lBYXZrQm5XTWs3N2JpSVRFb0RYWVJE?=
 =?utf-8?B?cE95eFNUMHNlTVd3U1JjTGJGaVRFTkRmS09RdXdha05sMUFnNk5WWk1QVmZt?=
 =?utf-8?B?NnprSFZmYnFBRlBjME5LazR1RUNhRGdWYkNKb2dnb09sYVJIdW4zZXIwZVVk?=
 =?utf-8?B?R1FvY1c0OXVvZGlGYXBGWDJGQW5VVmhMdFJ1WHVrU3h5QTR6cHVQMDRqVGM5?=
 =?utf-8?B?cU1YeTJ0MHhHQ3NWNGIzalFxSkNBSlYrRTZ1WUE0b1VoOWk2OXRqbzBpTHRN?=
 =?utf-8?B?aEp6N3lrSXNsaTNPa0YycjNRT2lBbmVYNm1jMGI2NlVWeTdZRHhEVEIwcGtw?=
 =?utf-8?B?cVRRRXpjZ1cvbG8wZDFncjlPRmhlcFMrQlpmcXBoSlM5Z0pobVhHZUd6T0o1?=
 =?utf-8?B?MWpMZmU5cUJFRlVWd3N1QzhXN0JlTGh6S2p2QnkxUjV1a2tVSVhKdkdoUWVY?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c89042-6dcf-42fd-bb99-08ddf5b61217
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 06:47:29.7033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swwGKBLF8bjcfJXnIBd5dT87Kr+Gn3bGkEeaTx+w6bbNlEKzwyeomFmQ+hM282bkTiYzvdJuEhi1KvsgF04ZsDQUZA4cUKpmFkJX8y/8VN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6239
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

Hi Kamil,

On 9/16/2025 6:39 PM, Kamil Konieczny wrote:
> This reverts commit eacde5c2acc37c1570e27b68b8b6c39d8b61fb32.
>
> IGT_DATA_PATH is currently used only when loading PNG images
> by kms_3d test. It looks like more proper way would be to
> place such path discovery into igt library, not in runner.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   runner/settings.c | 36 ------------------------------------
>   1 file changed, 36 deletions(-)
>
> diff --git a/runner/settings.c b/runner/settings.c
> index 85980dc96..3ccf71870 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -90,8 +90,6 @@ static const char settings_filename[] = "metadata.txt";
>   static const char env_filename[] = "environment.txt";
>   static const char hooks_filename[] = "hooks.txt";
>   
> -static bool igt_data_path_set_by_runner;
> -
>   static bool set_log_level(struct settings* settings, const char *level)
>   {
>   	typeof(*log_levels) *it;
> @@ -614,31 +612,6 @@ char *absolute_path(const char *path)
>   	return result;
>   }
>   
> -static int set_tests_datadir(void)
> -{
> -	const char *datapath = "../share/igt-gpu-tools";
> -	char *abpath;
> -
> -	if (getenv("IGT_DATA_PATH"))
> -		return 0;
> -
> -	abpath = absolute_path(datapath);
> -	if (!abpath) {
> -		fprintf(stderr, "Error: Failed to get absolute path for '%s'\n",
> -			datapath);
> -		return -EINVAL;
> -	}
> -
> -	if (setenv("IGT_DATA_PATH", abpath, 0) == 0) {
> -		igt_data_path_set_by_runner = true;
> -		return 0;
> -	}
> -
> -	return -EINVAL;
> -}
> -
> -
> -
>   static char *bin_path(char *fname)
>   {
>   	char *path, *p;
> @@ -681,10 +654,6 @@ void init_settings(struct settings *settings)
>   {
>   	memset(settings, 0, sizeof(*settings));
>   	IGT_INIT_LIST_HEAD(&settings->env_vars);
> -
> -	if (set_tests_datadir())
> -		fprintf(stderr, "Data dir path not set\n");
> -
>   	igt_vec_init(&settings->hook_strs, sizeof(char *));
>   }
>   
> @@ -702,11 +671,6 @@ void clear_settings(struct settings *settings)
>   	free_hook_strs(&settings->hook_strs);
>   	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
>   
> -	if (igt_data_path_set_by_runner) {
> -		unsetenv("IGT_DATA_PATH");
> -		igt_data_path_set_by_runner = false;
> -	}
> -
>   	init_settings(settings);
>   }
>   

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

