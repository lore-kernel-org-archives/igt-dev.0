Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F62C83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 21:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7016010E8F5;
	Thu,  3 Jul 2025 21:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6rVs+uP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C9110E8F5
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 21:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751578494; x=1783114494;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=uvN+qTGVihJfY8+pTy1SGNG2pJB3sZbH7P0/ZREzNGI=;
 b=V6rVs+uP5bj54V9F1ycyquDHaVzz7Gjtc6Vkxwh5QCDTsXbB6v3G7WyA
 y1QgZ47Pg+FKAw0k0UvVuelM4abxm8tdnxDpwOjSFGRRl+cXlML3sEq+Z
 KDczYktHPNDcnrXHmiBfOvnP20djFDUsaf5mH3qNKg+h7ynSFHh3d3Xff
 KLkSrgJJHctW3rgwDylhn2jAERdi8FWvvttHD7T44mVQ653MOmREII5T4
 uktFQfw1dJ0cvJdMsweoWBAxs8MIUgG8bE9xoytxVMQK6bMhAN6u/H/45
 RYjFdKFCsFdOKO7qNW9pLJceEQFraHwwWpmhjrSqvNM6QY5k2q7BrYcGF A==;
X-CSE-ConnectionGUID: pjIIFup0Rt+wC53qjGq3pA==
X-CSE-MsgGUID: kDPPofsbQteh0Mautmoq8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79354442"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="79354442"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:34:53 -0700
X-CSE-ConnectionGUID: KHUUS2+sTFykGzBO5hGb0A==
X-CSE-MsgGUID: 8WD9rydRQh2KphwG+NmIQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="154565053"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:34:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:34:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 14:34:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 14:34:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tybPMRKS2c4eWId1N5BjVaN1WXR6oVaayo5OXvsCP4UKZoT22SALttZCLVzldfmlZWdcJxU6LYmY5Na64RhNg7nET3DS57WTD2V3i4RflLcK0tZhrZGolpXYkSuboOCoyXsNEcz54rz/gJGbKIaLEF1EEvmRtkWCaxPvQEFEWtjwYnGSasfgH5y5Ob6LWwryqwO31tQqyjDdpE3mj0s01+cJwW60wh+LF/84tlVdt69DGtwOvZj7G9he8q6q5VewVWb9orkuzoljl4oc3OHSLy1prbR4onELI9fGXfsrjXvD7hVc9yD1lAyl4wEKfnFq97BxOepKuSW6bO3eeEcduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBpHwzS1gdyzk8N+0FcPNSPm3Za3ZgowwL6WAnEiWpQ=;
 b=Syf0VtEfjyhguX4DJkfl4vU1QVTPNAVHsIDhVE+nefBRxt+2VOA2aRNGcVi5Gsmd/VijLECiYNOt6aV2P7cvHPtd2/wNysup3+c1UXNB1z6tb5jrc2dgXRJqG67aUeaT7tqVyq0amzU11ga8Cmx4L6OfBIjyR7cJ05Vsu5bHhJC+A8Xz9W8JV5Xu2km+aEVB0qW9AmNCC38i9EdKvwZ+AQh54M8oAHdH+wol0fHFKLmXtNCsMdGcKchHsost9gwZ78NB/d8aJVl0xzw+WFeUOWxNFjoxCJkYefEzsb6eIYDj9b5gjXOU0HAmKKukyK9wrYVR4g5DxSYJZdJ89xXNxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by DM4PR11MB8131.namprd11.prod.outlook.com (2603:10b6:8:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Thu, 3 Jul
 2025 21:34:28 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 21:34:28 +0000
Message-ID: <1f9a71b5-6ae1-4e5a-8d56-66d5d72b5442@intel.com>
Date: Fri, 4 Jul 2025 03:04:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 4/5] tests/kms: Use CI environment variable
To: <igt-dev@lists.freedesktop.org>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
 <20250604053046.1702233-5-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250604053046.1702233-5-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::29) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|DM4PR11MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbfed3d-9974-4913-7fb9-08ddba7963c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFlpUDVSRzRXVFVndGg0UHdOWTBpaFRTOFhyQ0lPa0d5ZU5scHoydmVKajI5?=
 =?utf-8?B?VUkwS1JNT0FqOXB3TXl6dDg3THBvaXl3enlPajFVZDVuWTBOTjhWRUhDUWox?=
 =?utf-8?B?Wnd5WUpDc1QxZTJDcmRpbWxZLzQ5YzVUSStnbUdzR3Qvam9HenJ3VjZXL3Bk?=
 =?utf-8?B?WmQ2c1M1NVBKOXJmbTl0MFNrVnJiemtVbmR6K3dsMDlqbkwrbWdLZGQrRy81?=
 =?utf-8?B?WnpkOG1QNTFnWUR1Mm9vQjVVRHdYVEVpeFlGQ2svbHdMVEUwbkQ4b2k1aHAw?=
 =?utf-8?B?U0RJaERNd2xwRU5XbnJHRnpOYURQaU9ESDFCbWNkT0kwT2g3djNBVGsvTUF4?=
 =?utf-8?B?MUFDMEpCdGRBNmtaNGQrdG0rNkljQWVRbXp5U1lsMDQya1pzRGs3SkZQRlZS?=
 =?utf-8?B?dmtXaWZ4SlVjM011cndqakpsbC96dVRUd0lTd1NxRTQ1NFlVUXg4bnNGQnpB?=
 =?utf-8?B?bVI1bVJUNk5jVkFORkFISUpYOEdkaW5Kbi8xV2JlSUtXaDdvelRpSjZCYXZx?=
 =?utf-8?B?cWFXbzZCS3pnenpwVEF3Z0dFanVobGhOTDdHQmZqN1RLWVJ1WFJiRWVhcXZ6?=
 =?utf-8?B?MVRjcUxrNVFnNXRteG1ZMHJrQWlQeW1EWHdUZXJqTTZTekU5REdwK0U0M3Ro?=
 =?utf-8?B?NXJoenlsRUpoRkhtREx3ZlY2S1FaazdqOFVvajBoOHllTTJadzBHV21lbnRu?=
 =?utf-8?B?R0xNQ3RYSEsrdEhBYmpaUVNtUzlmRng2WDZxZTFQSUE2cEw1RjVWMjRqZFNl?=
 =?utf-8?B?aTU1NFNkTE95SDJQa01uUXpoSGg2TlZuWUVVSWtxNVFrcFgxMGNncWgwaTFx?=
 =?utf-8?B?eEJOWktocHQ1RFNuNHI3b2FOa0hDeTRVbW4vSks1S3VJUEVtQks4TWo0UThP?=
 =?utf-8?B?N3FqMm1ramh3WGVyUk0xNXdpVFFua3pDWmJyblNnTWxyZGZZTEpOK2theHNC?=
 =?utf-8?B?d0thQkxjV3VuVWZxZlFpZDAydEV0OTJUM1IzcHowMkJPdFJaY0h3Q2lyWEJy?=
 =?utf-8?B?YjZueDBORndrZG1KdytqWWtabGFsYythZC8wTXV2bkFNc3JUR0xlUGl3YWU5?=
 =?utf-8?B?SGp4S3hPR3FsMGZ5L0xXWEFpdnFBWm5iM2hKVTBkek90YUlZVFRhRk55SWhD?=
 =?utf-8?B?RWl0Qm5tVVNabzY1M1AwZmJtNzA5Y0pJNDJJOGZzR0dNYTB2eHRESy9Mb0tm?=
 =?utf-8?B?bGRiTFloY1BKTlhzRGxQU0lHbEg0Z2toYk9XaVNwdkszQTVDUVllY3lPcWdH?=
 =?utf-8?B?WHVyN3JJNjcyaWFSRHp4dEdTc3JaTENHL2Zlc2c2Q3pnTisxWURuRmhyS3E0?=
 =?utf-8?B?d1YrWlFxZU02ODhoMDlkL3F5QVlSbERMdHEwbG9HaEVSQmlFaThEYVRUNG1i?=
 =?utf-8?B?RTk5dGZHeE9LaHRPYUgvS3pJVWFNMDBML2sxMXY0MFRxZFJYT2t1MTRGYVlw?=
 =?utf-8?B?VWRyV3laUVBrVFFpK3M0QXk0bFE5NmYrT3ZEOGJOaXVzNnl3Z0I0RHIvVy9x?=
 =?utf-8?B?eUxwOERIUjVSa1JrSjhjQ1BGSGZQWEhEV2hzN2FTWTI4Q29DYkZFM0phcVM4?=
 =?utf-8?B?emUwQzNPYlo0aHljM29oeXNKZDZEWGx5dFBQMUc0Q1E5T29DdzhDZ0kzSTdz?=
 =?utf-8?B?cTNtcmxBekw0SlQ5a0VyNXFNWitrV3FGRkJMZEEybC9qM0pXYnAvbHB3dFND?=
 =?utf-8?B?cU1Wbi9kZzA2aGJ3RUg5VWNER1crelVrbGhLK3dxenBMSVUwYk9YQW5TVTBN?=
 =?utf-8?B?OUpZUjJMZEVCNk5YcmZlOEhZamFvdlRFVmRVcVpxcVZyTXRlaTU2TXE3alBD?=
 =?utf-8?B?a3JNckhaaDNwNE9YbUM1MFhWdFl0YUNTQW1jb1Z3OVM1cENQYXpTYk80NkRk?=
 =?utf-8?B?VXZkTUI5NTJHU21ya3ZQbW1oUWxjQlFEV3AxZ3ZiQ3hyT0hYMFM4WkFyYWZZ?=
 =?utf-8?Q?11NzeLCRl3E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjNrektuaXcxV3Eyd2w5RzZUSm16SHhGZzBDTW1BeHEzVFBYdnRGT09GbWtP?=
 =?utf-8?B?L00rdkVqQnEyVEhKemNtZG0xRDkxbXl2T2ZCM2R4ZWZ2QVJaOXBsclcydUhU?=
 =?utf-8?B?bTcyNlk2aXhzc3NGZnhiUzZxZGRaLzFVZTllbWErdDNYM1luaGR0eFJJVmVZ?=
 =?utf-8?B?UEFUY2hFZmRaSzNOZWpNck9CVGNJSUtLZWpRQTRDd2d3UGFzQUNGcXU1M1Jv?=
 =?utf-8?B?c25xUENFbHpidG9EUGNaaTdDRHRYU1U0V0JiVHhuMWdPWTBBRi9Jak0yK05S?=
 =?utf-8?B?c29wNzZLRlViT2t3czYzUWNoWUJGelBtc0ZjZUNucWhRUzlHNHV1V3JVaDlN?=
 =?utf-8?B?ZVJvb1g3R1RUYm04OXJoTE5CNGdsd0lpdkc5OXdQQVRVN0ZhampOY2FjQ2Nl?=
 =?utf-8?B?MzRNU1VnaHpLQ29sR2JKYXVwd1k4SE0wNkk4Z2ROdmtrM2VHbHFaUmpwSXdR?=
 =?utf-8?B?TXNFaE1sdVh5NmVYMlcrQWtyVjZBblU2LzdyM2ZDZDhvTThCa0lFUlJLaXVB?=
 =?utf-8?B?RHBTZ2RJTndyK21qVmdqOWs4d05lY3N2QnQ3NFBSNEppZ3F0NWdialJJc2xv?=
 =?utf-8?B?RFl3a3RYaDNPYnFFL015SUZRMy9rYkxwQXV3YU5xangvS0k1cEtEMmV3OUo4?=
 =?utf-8?B?dWM4TDU3NGtBK2VtZnRPeUNncHoweVo5YnZpeEJhbldudVJpMjA2ODk0SEVv?=
 =?utf-8?B?SC8vNnNvZTZxSU1yKzN2OW9zSG40UVdHeGd0b3p2RjZZVThhUmsrZjdsbTNa?=
 =?utf-8?B?ejFaMlh4MUY1UjNkN2N1Zm5mVkJLc0taTmdqbU4yMUNjR2diRzd6SVE5MG5I?=
 =?utf-8?B?MlJDMWFYRGFwN3FwVDNLUnp2OE83dmt6UThGYXBrOEhTZ1FqTlZJeExjZEZx?=
 =?utf-8?B?NExoSzlKanJ3TXNlNTJ4dWFMVDZrSWoxOTB4dTVUcUJDYUQ4VmtKY1E3QXdt?=
 =?utf-8?B?S2NwLzJETDR5K3BrbE5oK1dEbklSYmxrTm4vMnA4RjhrOEV4NGJVTjVWMEZC?=
 =?utf-8?B?ZDg0TU1JdlZ0LzlLRXM0NGJEdVhZMTFpWlpSVENSbGIyUkNHK3BNMGdmWktJ?=
 =?utf-8?B?ZDdUTlZHbFZFZXh0R1d1Y1dBZjhOR3dsUE8yUmp4K2lpZHdSbllTZUtWeTNS?=
 =?utf-8?B?amhEMnFJeVZCN1pPU1IzQUl0emhOVVhPNE5EWE1YZStzY2xJVGdxWUVsOTdH?=
 =?utf-8?B?SUdLR2RvdmQvNUxCVVUxWDV2MllTUlViTTFqMHVTVGJaNDY2SGNpU2FHYWJX?=
 =?utf-8?B?anQ1T25BT2pRSnBTVEhJWW92dWp4c1EwVStmTVBOa3JyRnVSWERvTkFubXYx?=
 =?utf-8?B?R25jTTJmTWlxYk82TXJTMHpid2Z1NWdMdHFoSmk5WlhJRTNJa3RxNUN0WUlU?=
 =?utf-8?B?TldkdW0ydWtIenoraUVra2QxUGVNS3Nxbi94YURHVXRMWnRka2FDMTFNSTVZ?=
 =?utf-8?B?bDh4TUJOR3FjRHRDdFR4anlTU0lHSStrdmNLZzRnODVwSllrU2FZaGR6VjB2?=
 =?utf-8?B?dEdtaG55NEd2UXR4SUl1NGJ3WlNBbzVqejhFSjRnZWxRZy9XcFdkMFdpU1Zt?=
 =?utf-8?B?OUM0VG9HdzF3ZmRwVDR1Tm9TSG9DNHhUeEl3cnE4VXg1SEMyME1JM1VDMW5z?=
 =?utf-8?B?bXYvazBzOXlsUFdKSHVMbWJJMHdLM1ZMQURHVTJrUXdEMjNKUjhWaEFGWGt0?=
 =?utf-8?B?SkYxWFV0bVdVTDNGYWkyVjdaQkgzZjEwQlVmYXRhbnpaVGcwUTVHYnRFYWtj?=
 =?utf-8?B?WkFnZzF3dUxNbTMwazl1U2I0V3UvWWtYdHZONG1sNGU2U0ZjZXRTbTNnTFNJ?=
 =?utf-8?B?YmNsS2FLT3Ivcm5TcEJCQzN2b2RlQjZ4ZEJlclhVWE1hNU1xZWRyLzBLY0ZR?=
 =?utf-8?B?aUxQNElFVWoxV3ZHdjFnOWZFSUoydTV1bHdTb05CZkl2OVpVMFgxZlpaWGNH?=
 =?utf-8?B?MkcyS0JieFF6Z1R2V2dSTytvL1paQlF3SVcxbkFJWlRPZC91NjlCZ3h0Q3Bx?=
 =?utf-8?B?cElLbFA1eXlvMzFRUUF1c2wzd2hKcUdwYUpDZ2dMdUs3bkhhV1JaRGY0YzUx?=
 =?utf-8?B?bHVlcmxPalRDM0tlODVxSExNczBEcSsvWlJsZDZUMkJmTDhLZk1Va3BSa2RV?=
 =?utf-8?B?K0grSGsycUlEMzlZTSszbUkrY1dyYTdjNWkySUNYZDBBclc5cXd4VTB0WkZ5?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbfed3d-9974-4913-7fb9-08ddba7963c5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 21:34:28.5804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbVhHLylgRcHKJZI+HtGRn6D/urEuRTPjCLHjVMGaVkqG/0cTx446lJFEcYSyNv3UqnETJ8jaPyT37XdIzYRc+GQdzqKElV5keONDlmn8qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8131
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


On 6/4/2025 11:00 AM, Pranay Samala wrote:
> When running under CI (detected via the IGT_CI_RUN environment variable),
> reduce the DRM debug mask to DRM_UT_KMS to avoid excessive debug output
> and improve log readability. This replaces the previous logic that set the
> debug level to 10 if it was higher, and makes the behavior CI-specific.
>
> This helps keep CI logs concise and focused on relevant KMS debug messages
> during automated test runs.
> As per the test requirements, this level can be changed in the future if
> deeper debug information is needed for troubleshooting.
>
> v3:
> - Refactored for readability and address logical comment.
>
> v4:
> - Remove custom command-line option handler (Jani & Kunal)
> - Have different masks documented (Kunal)
> - Use an environment variable for CI jobs where disk space is tight (Kunal)
>
> Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
> Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
> Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.h                         | 13 +++++++++++++
>   tests/intel/kms_dp_linktrain_fallback.c | 21 +++++++++++++--------
>   tests/kms_atomic_transition.c           | 22 ++++++++++++----------
>   tests/kms_cursor_legacy.c               | 21 ++++++++++++---------
>   4 files changed, 50 insertions(+), 27 deletions(-)
>
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 892682344..06badaf0e 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -148,6 +148,19 @@ void igt_drm_debug_mask_reset(void);
>   int igt_drm_debug_mask_get(int dir);
>   int igt_sysfs_drm_module_params_open(void);
>   
> +enum drm_debug_category {
> +	DRM_UT_CORE      = 1 << 0,
> +	DRM_UT_DRIVER    = 1 << 1,
> +	DRM_UT_KMS       = 1 << 2,
> +	DRM_UT_PRIME     = 1 << 3,
> +	DRM_UT_ATOMIC    = 1 << 4,
> +	DRM_UT_VBL       = 1 << 5,
> +	DRM_UT_STATE     = 1 << 6,
> +	DRM_UT_LEASE     = 1 << 7,
> +	DRM_UT_DP        = 1 << 8,
> +	DRM_UT_DRMRES    = 1 << 9,
> +};
> +
>   /**
>    * igt_sysfs_rw_attr:
>    * @dir: file descriptor for parent directory
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index f8ef0cac4..9cd6f3d54 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -592,12 +592,22 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
>   	return ran;
>   }
>   
> +static void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
> +{
> +	const char *ci_run = getenv("IGT_CI_RUN");
> +
> +	if (ci_run && ci_run[0] == '1') {
> +		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x4\n");
> +		igt_drm_debug_mask_update(debug_mask_if_ci);
> +	}
> +}
> +
Move the update_debug_mask_if_ci() function to a shared library and 
reuse it across all relevant binaries to avoid code duplication.
>   igt_main
>   {
>   	data_t data = {};
>   
>   	igt_fixture {
> -		int dir, current_log_level;
> +		unsigned int debug_mask_if_ci = DRM_UT_KMS;
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
>   						     DRIVER_XE);
>   		kmstest_set_vt_graphics_mode();
> @@ -605,14 +615,9 @@ igt_main
>   		igt_display_require_output(&data.display);
>   		for_each_pipe(&data.display, data.pipe)
>   			data.n_pipes++;
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
>   
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
> +		update_debug_mask_if_ci(debug_mask_if_ci);
> +
>   		/*
>   		 * Some environments may have environment
>   		 * variable set to ignore long hpd, disable it for this test
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 2b64424ce..3202ab668 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1119,6 +1119,16 @@ static const char help_str[] =
>   
>   static data_t data;
>   
> +static void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
> +{
> +	const char *ci_run = getenv("IGT_CI_RUN");
> +
> +	if (ci_run && ci_run[0] == '1') {
> +		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x4\n");
> +		igt_drm_debug_mask_update(debug_mask_if_ci);
> +	}
> +}
> +
>   igt_main_args("", long_opts, help_str, opt_handler, &data)
>   {
>   	igt_output_t *output;
> @@ -1174,8 +1184,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	int pipe_count = 0;
>   
>   	igt_fixture {
> -		int dir, current_log_level;
> -
> +		unsigned int debug_mask_if_ci = DRM_UT_KMS;
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   		kmstest_set_vt_graphics_mode();
> @@ -1188,14 +1197,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		for_each_connected_output(&data.display, output)
>   			count++;
>   
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
> -
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
> +		update_debug_mask_if_ci(debug_mask_if_ci);
>   	}
>   
>   	igt_describe("Check toggling of primary plane with vblank");
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 44f031e7b..281812a4d 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1823,6 +1823,16 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
>   	igt_remove_fb(display->drm_fd, &cursor_fb);
>   }
>   
> +static void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
> +{
> +	const char *ci_run = getenv("IGT_CI_RUN");
> +
> +	if (ci_run && ci_run[0] == '1') {
> +		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x4\n");
> +		igt_drm_debug_mask_update(debug_mask_if_ci);
> +	}
> +}
> +
>   igt_main
>   {
>   	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> @@ -1839,7 +1849,7 @@ igt_main
>   	};
>   
>   	igt_fixture {
> -		int dir, current_log_level;
> +		unsigned int debug_mask_if_ci = DRM_UT_KMS;
>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
>   
> @@ -1851,14 +1861,7 @@ igt_main
>   		 */
>   		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>   
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
> -
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
> +		update_debug_mask_if_ci(debug_mask_if_ci);
>   	}
>   
>   	igt_describe("Test checks how many cursor updates we can fit between vblanks "
