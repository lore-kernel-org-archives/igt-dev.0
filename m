Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7060E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 07:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8943410EFFD;
	Fri, 10 Jan 2025 07:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Es5uM6pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04C510EFFD
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736495940; x=1768031940;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZyFKWIXWng8M+CQAwhrCxlmAi/P3OX/NCfwlmCDDWQc=;
 b=Es5uM6prz1tWJOyVFbsVFDrfi+Nufly78pBsUKQ1ijhPij/HKLpHpmKM
 eT8OgHpNVP8c3bvexFDMO4sQDI7ZpVhrxC30b2HtaQA1Wgv2WZLK8Aepe
 dsDgxBTXffKARmhxlin+x1zv/WcysgsyU5J3N+UolG9ulqHbBlc4sB/FF
 GkSHEkRFj++Eqt3IYvTHkx/MeLz32wqoluRO5y/4UWgQIqCuJX7s85WzI
 27MojLT37mLX/07KEs5mZLdhOkpV7cze716BNdZeFkUlu0a0xbOooMJPw
 Q2/epI5lbkzMTIyNHBc8zlgsZL8Y8pD3NIZ7PWpcQyJWS1eHHPlFGQTOv w==;
X-CSE-ConnectionGUID: 8iREkreZQualgkIxAQsnSg==
X-CSE-MsgGUID: puOsMVkuRZmO7KDo7XazMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48148068"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="48148068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 23:59:00 -0800
X-CSE-ConnectionGUID: XZSmuBZhQgqgyXIqHRk2EQ==
X-CSE-MsgGUID: A93936Y8ROi8JGJ3NS6QBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108288626"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 23:59:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 23:58:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 23:58:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 23:58:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dko6ViwYPjq5MiaerrXkXfnIttURKEFX9N94/y+56indu6PTPYwJ2b619AVnzmZnJr2guX41IpN4F9VrtnjoDUfE+Qk7gvBegHdI7pHNr/Jc1SyUyNCObIUkJC6buQ7nLnALL9ErJT79pXbq4ZXN56o0xEzT1j9Iqka5AC5MwN8gFEm01nun8HFRkEm5Ofq3IYl/x2OWPcPI/sQALE7hXfO/L+cxYq8koBzFrFivcIMippG0dKp4annsN0UpamBuBvYEIT3SoatVgLCqeMvTGqIisQkqB61FupgMAIK8+6ZoRCTOnMkrP+T5Isa91ARGbNcbFmC6upUIzA2K8Xs1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSeZDZ53NtZcZ1KlfBzFZPQIQpMwb3E+jgp4/kdoPvU=;
 b=R5f6W8YTVTHuBuacft6orm9yYPSj54ULS7vDsoKGqGmKOfJQbtp+fY70chigDRoxNtAknW895YugYiL50PyQUxO50JQEW3rZ7/oM91pTq5wNgs4n1cae1tHqZpQ/2cFhLtL02GktLOV9ayWfHzRIWRiff1XO1f6LguA8g8NV9rAVPUlccKAy5peKZ//JtyxDGVjYyLxR5bQpGTtP1KtG/iIuCwdbAoBzmBP8nk5ExohWDcSynP/uZbzxYuQZJM+iWBvZp7oUYdY0/A+EVIKMF9X6jdYij83+roK/xXfC0+D83ZQeq5cF09aFifdlXRPcfIZTer0syYv9pFjsIDrG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 07:58:43 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%6]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 07:58:43 +0000
Message-ID: <36bf601f-72a7-46cf-9d95-29baea769179@intel.com>
Date: Fri, 10 Jan 2025 08:58:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib/meson.build: allow build IGT with link time
 optimization
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20250109-fix-lto-v2-1-3dc74d60a124@intel.com>
 <omr2ioqmwgdfxbdn74mzqar7xdf5sgu6k4wktcr64byyu343o5@xxrp7q4p2hbf>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <omr2ioqmwgdfxbdn74mzqar7xdf5sgu6k4wktcr64byyu343o5@xxrp7q4p2hbf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fd9192-52d6-4ff9-5176-08dd314c9a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW9UZHVYL3BZVFpZM3Z0K3RCNU1jZWE0YXZuYk94K3puR0xoUG1NQVErWTFn?=
 =?utf-8?B?NUw4SmhneXQ1NHJ5YjJIY2p2Y1dacFB3U1ZLRlJ4enFMMTZKYmx3RnBmWGdD?=
 =?utf-8?B?cFlpNVc0WHJKaTZJRGVHUXdtR1BNK3pET3ZoK2lvWUUybzcrSFZUZncwZlJO?=
 =?utf-8?B?NHpxTitwZnNZc3pCdS9EUDZiREd2RUlOOWpZR2VudHd5OVIrb0xoUWMyMkND?=
 =?utf-8?B?K3o5Wk9IZGdCckpObzFGenZPdVkyL2IzNkUzU3BLTS9iZ3Z3L2doTTgrbVZh?=
 =?utf-8?B?TXJDcTBIdGZ2aTlkWmc5SW5XOEtOSFd1K3NwMGFKN3hIMlJWaXpkcW9pZFZB?=
 =?utf-8?B?bHJZRjdaQ3RHV21keGQ5Y3NoY3JCWHdBMHlDdFNrYTQ1aHdvcTg3eHZLdmxP?=
 =?utf-8?B?VWJuUEtRSmExektzb3I2MFI4ekdIRU1RYllVTERMUUx4R0FuMXhSOWZWUHdF?=
 =?utf-8?B?QldpK3UzcGloU2pLS3ZSNzZ5eExVNTNJaCtHemh3Tmp2SnNRbzAyWFV1cnox?=
 =?utf-8?B?MERuay9oSHVDc2o3d0RlREMrM1F3R0RVNDFPZmNsWnlJaEdIa2wycVhYV2h4?=
 =?utf-8?B?ZmdsN2dJbFRqYXNzY2c4WllJRDVzS1Uxd3JGSi91a01SRDBRWGQ2RVBaTGhV?=
 =?utf-8?B?VDhKQ2dveVl6VzExa3pSVXhSR3kzNVdtZEMyVlhwUEZyOU1qVHRyZ2dQNm9N?=
 =?utf-8?B?bFpPNmJVMlBQUWdhSkZBa2lrSTdGSEpBbGk2bDU1NmNnTmo5V3dGUGNjVzA3?=
 =?utf-8?B?Q282dFRRZXJqWjI4STRMaDNMeDJ6eFNuZUdacHVZWU83SVUvZnIwNTcxak5N?=
 =?utf-8?B?QkordlVHdk1HREIwZVBCaFhUMytCTjljekx0VW95Wnl4cFE3UkI5dlUydXho?=
 =?utf-8?B?eW4ycHFZeDdrWVZFNWFQQ3dSK2djako1Q2x3UGNGdGJZNVZkSVVSeUhkQjNh?=
 =?utf-8?B?N2FRazRSa01KVFhQdVBxek5Ia1pSRjY4QjJoc2JMb1RBWWRzem5kZzhrR28x?=
 =?utf-8?B?d0k2YXVhcnl3a1FEMEExK2RXUEh2YUFxd05xbW5PUFpyNzdFOUd4dllmSDc3?=
 =?utf-8?B?dk5RNDZmaUtYMkNPM3NpUjVQanBjQmhha0ZpcjhFbi9CSjg4ZzJzZnBvVXBS?=
 =?utf-8?B?ZTVhSWs2MU1zcEI1SnhVZytWaXlBbDdtVlVWUDVFR2dlcVdUWXBLbmZOMktO?=
 =?utf-8?B?OFlVV1lpZXNrVVdSakJZYTJLanRMVS94WFdUcVBRcDR2TGF5cU9QV2ExVFNW?=
 =?utf-8?B?aThpSGx4M1VBRXFPZ2tkUWE4bjROcG5xRlVkUHpNSGtDem1PUXFoVHhtTmVy?=
 =?utf-8?B?clpJRzJMVjR4eHc3V2p0ZnNURlNxa1JMUVN1VWt4Y3FiN2I0VHU5OUQzZWpt?=
 =?utf-8?B?S3p5VU1Mc3ViU042dGM4aXYxc1BvN1kxVVJqMFlLNml6QUQ2QmlhZE9rbUxW?=
 =?utf-8?B?V2lmdE4zemZaZXBkVUlWb0NQS3I2SVhxM0F6OFdGU3dYaFI2Ym5ZdHNrMjR5?=
 =?utf-8?B?c2ZORW1pSVZHWndnZlNSb2FIamFTRU9UQzhmKzN1SllNcC9UVEQ2M3JYRW1E?=
 =?utf-8?B?NW9NcFpEVGlXQzZGRWdGR21YL21qK3V3WjZ1SXlEOWI2Y2R3UWVQYnduTzJS?=
 =?utf-8?B?eFdKWGFpS0ZJdy9Vd1NlbUxYZTVmYW1UNHhaVlZoZ0FMaHZPK3E1RWtWMEQ0?=
 =?utf-8?B?MlR6TjFDbzk4NjhTWnN5bXF1VjVsUC9xd1pmbHNMbndmdXBHR1I4dE9ZOW1M?=
 =?utf-8?B?aUN6bkdNQ3lheTYyZUJUYWI3dFhmcXZRdVRoNSsvVFhjaUc4Rk44Z3BDRTdY?=
 =?utf-8?B?Mk41SWxwM1JMU0U4Z3NQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTRraFhvOU1ESEdGYzJPQlpWdG01aEZjZlJUS0JNZnoyR2U0NWpVdGdmdHRU?=
 =?utf-8?B?NGNSakxiZFgremp1WU5KWDhWY0M2MlNYNzhrbmdiL2lyVEhEaFJCcEJHOGty?=
 =?utf-8?B?OXNUanZ5cHN2NDloQmxjbjYxTFdtY3VqM0F5bDBSQTRNZWNYTThVUDBvTlll?=
 =?utf-8?B?VndBc1N3bExoVjYzRXk5dUlFRng2aWozT0p3L0tLUzJEYUNnMWhMWTA4dU9n?=
 =?utf-8?B?eDY1M1l6SzdCQWYzQmNvbjNHb3VCQjBpVXFuK2pwcG1CWG01K2d5SEFDS3d6?=
 =?utf-8?B?eGlkSGlvVGZRTlN2UkhSM01zaDZ1QTRlNkJHVENnWnoyNWFkdG42WTNRSUJi?=
 =?utf-8?B?RGVaOG5QT1NhVC9RN011djl0bENLd25oWDByOER6TFBiQ1pqYitISUdVb1VB?=
 =?utf-8?B?a3NUaWNnSyswd3dERGhSblZMdkdOWDZpQkRRUDQ2OTlBZERBZnc3VDdxa05L?=
 =?utf-8?B?VTAvS25HRUtIZFU5Ym1yOCtzdUZMbTMxbjdlVkdpVzM5MjFQMWY3MElDK3Nj?=
 =?utf-8?B?ZmtPOWplTHVsTjZpeGlNbktFZFUrNnF6d3F0VXVpaTU2NUVrS1BLdWhWVm5i?=
 =?utf-8?B?ZTdqNTN4Z2FIdDhhYUV3ZUxXclI0TXk1d3JmcHNQd002QVpvbFdONFJOU2lq?=
 =?utf-8?B?UExMaTVIMWhGMUpVVEQ0WFp1dzZyV1I4Zks5WDVKWkR4THB3V0tneVR6dmlF?=
 =?utf-8?B?ZTVVU3hrbEIxZ2krcWYrSHlHeHhPV3ZVWEJsU3M0cjRGMXpxcWZ2akMwZFB5?=
 =?utf-8?B?a2JMZzBCOTAzeDNzcHNCbzkyU1pNdkdRZlNhM1hEdDlSbHdkc2dQVUFURGJV?=
 =?utf-8?B?UlJ2azQ3NHcwcmZzT3lLYldtWURiRzlWb2k3ZXRVNFQ5N2tWTlQwRUx0eWpY?=
 =?utf-8?B?QjNKbHQwZ3R4RmsxQ2xQSVZ2QmNmYm85dDk2Vlh3YWUrVkhsRnF5cDRXcFVX?=
 =?utf-8?B?QW5pU1poeVRINXE2TEJOeW1lWHl1Z0RSa1BOcGo0US9SK1UzQnZOSEp3bUhJ?=
 =?utf-8?B?TEJHTXNxQmpNMVUwMVRIYmphMDQ3bGF0MEZ6OUM2YW5McWNqWnRGa3NKTGVu?=
 =?utf-8?B?cnM3TzhpR3Z4WGhOUUZQVGRxKzhUTUdRbkxQNXl0S2xIdXcxWkk0c2VrRWMw?=
 =?utf-8?B?ME5Ib1ZwSXN3SmZDemdOSFlnVG5RUGVteW9tbC80cHRlTm84WGZXbGEyYzZa?=
 =?utf-8?B?V09URVZXeUtQbjJFZHVGdExHazRNZDA0dmZHNDlxckdkbHlpbUI3djdmQjlZ?=
 =?utf-8?B?bDBsSEFaZjJyUjJTSXdEY0p4d203cGdmb2N0QmFwNDgvbWl0U2QyNHF4Z255?=
 =?utf-8?B?aTFBY0wxNTBtVFExTmxlYld6QmJiQ2gvN0VVUVpjZHArSXhMK1k5cGpqNk94?=
 =?utf-8?B?TE1rZ0R0ejcyVjNucTYvWVVRb3BjMUFIM0hiMDRXcjl3eW9uQU5tNC9UU3k5?=
 =?utf-8?B?YWl4b1hZWkM2Y0Y0aTZjUXBoMTZWVTJ3TzhEbzdMZWUyNUtJVXdwUVB0YmYz?=
 =?utf-8?B?M21BdElHNkovdk13ZTRjbjVKSmk5OHpIOUdyMnhiMkEwRTRFR2xhR3hqV3ZD?=
 =?utf-8?B?WjEwc0xacmJGd3Y1L2M0RVVDMEUvQ0EwRWZjMmdGYWFSaWM4SHpaa3VJQmdv?=
 =?utf-8?B?ZGlLeDBhZk5vVDZWbUlyN0QvRys3ZW41RFhzbXc3Z3dmSVlPcDVDejZ5ZTM0?=
 =?utf-8?B?TXI2Y3RpdjMxeGtBNUFHUURNTWoxR3RGNE1IWk8yMXVmbFNLUU80VnFBYjNF?=
 =?utf-8?B?NjFvQm1lU2NHU3V3c3JiZUFKR1BhWFQwNU9pQ3dxcEJlWnlpMDA5aElKRXI4?=
 =?utf-8?B?WkdrZnUvemIyY2s0QStJYngwWHhwNURaM0lINWlydWJhUUdqYkxLQWRvNDF4?=
 =?utf-8?B?MXRJa0sxVHhnR2lHRmZOTytQd1Erd0laWGJBV21QVFNKNzkyME9VRmFPb2Fk?=
 =?utf-8?B?dEJDY21KRzZmZFdhMWYwb3IwaWFKOThNckxIVVBVejhWemUvaFBLYmNJUHlu?=
 =?utf-8?B?OHd4Ky9SZ1BnV0VFKzVCNDdtY3ZFbTVuc0M0cXdPTm1xdndBZkU1dWVWRlVt?=
 =?utf-8?B?cURFVFN1TnkxalVYT3lWNzdta3ZwVEl2ckREYlRPZHhjR1FTNmJoTEw1L0Zs?=
 =?utf-8?B?cm5qMkx0eHhuTGRldnJVaERmT0J2UWdYc0pwaGdieXNYdklPbWRyVXIvdXRk?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fd9192-52d6-4ff9-5176-08dd314c9a5e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 07:58:43.5738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jJIrSQjAWw2r5af+pYGqImaNai/CWv3JLkwZUfeTiKVPlBEg+3bY50rCV6Pud31dhE4ju4DB7dCSMn3oN9unA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
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


W dniu 09.01.2025 o 18:29, Lucas De Marchi pisze:
> On Thu, Jan 09, 2025 at 05:26:30PM +0100, Andrzej Hajda wrote:
>> Some distributions use -flto gcc flag to build IGT. With this flag
>> enabled variables declared with section attribute do not appear in
>> correct section in .o files. Since iga64 assembly helper script relies
>> on it we need to use -ffat-lto-objects in case of files containing
>> iga64 assembly. According to documentation this option is effective
>> only in case lto is in use, so it should not affect non-lto builds.
>>
>> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/165
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
> is this about
>
>         static const char t[] __attribute__ 
> ((section(".iga64_assembly"), used)) =\
> ?
>
> it's missing a "retain" attribute to be able to link with LLD.
> I fixed a similar bug in kmod recently, but that  was due to linking with
> LLD instead of using or not lto. See 
> https://github.com/kmod-project/kmod/pull/274
>
Yes this is about this line, but I think we have here slightly different 
issues.

As I understand in kmod-project you want to keep the symbol in final 
executable/so_library/whatever.

In case of igt we want to have access to ".iga64_assembly" section after 
compile phase (ie see it in .o files), we do not care about final 
executable.

With LTO enabled the structure of .o files drastically changes - every 
function/variable in compile phase goes to separate section 
(.gnu.lto_*), information about final sections is kept somewhere in 
private metadata.

With compiler option '-ffat-lto-objects' .o file contains both 
structures of sections - classic .text/.data/.iga64_assembly and lto 
related .gnu.lto_* and this is what we need in case of igt.


Regards

Andrzej


> Are you sure this is related to LTO and not the different linker?
> $ grep -r -e '\.iga64_assembly' build-lto-clang/
> grep: build-lto-clang/lib/libigt-gpgpu_shader_c.a.p/gpgpu_shader.c.o: 
> binary file matches
> grep: build-lto-clang/lib/libigt.so.0: binary file matches
> grep: build-lto-clang/lib/libigt-gpgpu_fill_c.a.p/gpgpu_fill.c.o: 
> binary file matches
>
>
> $ readelf -t build-lto-clang/lib/libigt.so.0 | grep -A3 -e 
> .iga64_assembly
>   [10] .iga64_assembly
>        PROGBITS         00000000000657d0  00000000000657d0  0
>        0000000000002c65 0000000000000000  0                 16
>        [0000000000000002]: ALLOC
>
> So it has a section with that name of size 0x2c65
>
>
> Lucas De Marchi
>
>> ---
>> This patch 'fixes' building IGT with link-time-optimization. I am not
>> sure it is or should be supported by IGT, but build scripts can be
>> modified to allow it for testing.
>> Grepping internet shows at least Gentoo and Arch Linux builds IGT with
>> LTO, so I guess it is working for them.
>> ---
>> Changes in v2:
>> - added Closes tag
>> - Link to v1: 
>> https://lore.kernel.org/r/20241216-fix-lto-v1-1-1280b17dc70f@intel.com
>> ---
>> lib/meson.build | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 1704ed1e1c17..9fffdd3c6218 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -240,7 +240,7 @@ foreach f: lib_sources
>>         '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>>         '-DIGT_SRCDIR="@0@"'.format(srcdir),
>>         '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
>> -    ])
>> +    ] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' 
>> ] : []))
>>
>>     lib_intermediates += lib
>>     if iga64_assembly_sources.contains(f)
>>
>> ---
>> base-commit: ee7a3ac616f55f6ed1b959ff951237099bda86d8
>> change-id: 20241216-fix-lto-8d3bc1488c6a
>>
>> Best regards,
>> -- 
>> Andrzej Hajda <andrzej.hajda@intel.com>
>>
