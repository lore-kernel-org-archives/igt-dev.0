Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AF4CF3194
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 10:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1A810E5DC;
	Wed, 19 Nov 2025 10:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOvQ9b2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E5610E231
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763549679; x=1795085679;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X3aM3uzbAGKG+3IdWHpd9Nw2tOKFcHehC7YamcMKYkA=;
 b=lOvQ9b2O2kO3mRgf4K8x0AzS4/tI/JShRhJ5xWSr2EUwb0Cq/AQS9OnD
 ygsOXXYglpi9W2LW7F8sLQ+x3KNSGpXRump/iSoIlIxX3qYmW0x7KW/wt
 vy5Eu+9Zec3vr23iwiBTnABlPLmmQCcAh9lY3S0wmHXIMS2E53ZR3WN6h
 iLYDqmEdoBWD7Td70wbUt0FTBy8pmdbNykbDPv/sG4WAnjpZgx4/eyvlw
 5icBnw1hcPNnCudNWbq0xi38cV+InCrg/R9DJNF2j8IKCIkJErgWYdqFS
 yjmBEtKgwz2tEAulIw7U8v7UyWwl5XFIPgDF+00Pu/L5pZXHev0CC5HG2 g==;
X-CSE-ConnectionGUID: JfqrRfXsQtyD2sYe2CxUbQ==
X-CSE-MsgGUID: T1UuEGRrQ8KpXVdWorD5QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65743562"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65743562"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 02:54:38 -0800
X-CSE-ConnectionGUID: xafCS+yXSLe+bES9hz8QIA==
X-CSE-MsgGUID: gEvCCOliRuecuIqakD39jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="195497574"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 02:54:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 02:54:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 02:54:37 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 02:54:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esKnTNwukfgA5OswKlQBqlIwICa4iMkD0VuqI3Cs9Bhth3Vz1vDKsP2BLI2cXHsUrsRwoVTd9nvbiBZ4M/PreEfL5R/nbwZIRHupmZzLu7MkwlKnZncx5jaM/neGjUN+4U15JYcbrLr4M/LjxPoyCxUmg7ORuKu/exTIgZNppx4JpsBbxAWs4Ep12F4i+ED5Hlr2xXguBlEuW4lU1iyGYJw851lGSUuufvB/gme8n4a3AaCMu4jVpgf+h4yFFUL4t1OTprtRA03y2Up2L9y63y97pevtCLDju3LHZsKJEV7X/CMs2ACVPkg41mgIMhQIboBN60oxnMhx84p9uCspnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3aM3uzbAGKG+3IdWHpd9Nw2tOKFcHehC7YamcMKYkA=;
 b=IBRrp5/gE9sKOiP8+ZDYRsB9Z+Yd10NnsSPUxvOosbiz4uuXsBRdXhiN33tYqJOomYNZhF9tHGyd42Dyn9FZZUO7UeB2jJNNcfvS5KDjK3lMiQ12AUxvHN9zRQvHwlGR4+D4Aca7fYwmAyQTp5yg0ULMib0E9nanSbF/PYq6n1XUqUfgH7EuuATBn4Ew76mHwTlX5L76g3L7YVVzXdE1FHKV/LKa7IaXsNUahuhNGh5phyfxsobMgIZ5D1QOUdx3Ld1P3wdaSkriRe8biR6AWqFy8NG8eUWK6houZNvjuhtVutQ3P1oZL8vXv632jq9XbuIJnCLJBsagfW2dT8aziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 10:54:36 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 10:54:36 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Mun, Gwan-gyeong"
 <gwan-gyeong.mun@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: RE: [PATCH v3 5/8] lib/xe/xe_query: introduce iterator for GT
 topology masks
Thread-Topic: [PATCH v3 5/8] lib/xe/xe_query: introduce iterator for GT
 topology masks
Thread-Index: AQHcV6/aocufahJTr02C7aCfFNPfpbT51iIA
Date: Wed, 19 Nov 2025 10:54:35 +0000
Message-ID: <CH3PR11MB8434834D6D4791D76277B1768DD7A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
 <20251117-xe_query_helpers-v3-5-25d984ae58cb@intel.com>
In-Reply-To: <20251117-xe_query_helpers-v3-5-25d984ae58cb@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|BN9PR11MB5289:EE_
x-ms-office365-filtering-correlation-id: 3e8d677e-08f6-4d47-0a59-08de275a0783
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZFNyTUFUZXNGaWJ3TzFmT3NMNU1KMWlpYWRwMmZreW1TdHFCYkNtUzFaZUxk?=
 =?utf-8?B?YllESjhRM3VOdHJTKzNmK2p6R0V2d3czK1hGZkRIV05JZVhsVWs0dUxGZUIz?=
 =?utf-8?B?dlNHQmIyU2FGNUpjbXExVEQ2NlFVeGdWYjB3bk9DTEcyUG0xSFNMdXh5Z0ZX?=
 =?utf-8?B?ZkJKSzE0OHFnR0ZWcFdUUjZvQUUwd3pwL3ZESUNMSjlabGxrekhvVGlXY2sx?=
 =?utf-8?B?VllMZXRRcFd1NG54NStndnFVcmlNdVp6TlNReGZzYlM4QTRzeHVxd3k5YXZ3?=
 =?utf-8?B?RnYvYmNnTTAxbG1IYVpDWWVObGFET3hsMW9QNnlCeVN6Y1FQWHQ2ODJRZ1B1?=
 =?utf-8?B?S3hXaXh1MFByN2xtTEppdS8vQXJ3NW1NWUdqenk1cm9yRTM5WGlZWkVsRC8y?=
 =?utf-8?B?VzNmMURIOGxVY29ncXhBN09sSDhEU3pQRDF3RWNoeUw0bXRUcHdscHExbzlE?=
 =?utf-8?B?K2FaNjA0UHJEanpTTFpPSTlYL01QV1g2RmFJT3cxN0NuVzFyUHVDbGQ3UERF?=
 =?utf-8?B?VlY5akpJUDhXZFVPZHA1TWl3ZmV5dzlES3hrclJkMG1CK2FKeGlLclAxa1JK?=
 =?utf-8?B?bGxxL08wM1k4bktnVFN4emp2anE2cDhYZTgwSzhXS2pjRzhoanFDY0Y1RXFF?=
 =?utf-8?B?bkZSd0ZxcFhrVVJWaFNmNFBPa25UYlBaV3hpbU1ON2xqNUNKQjFSc0dBRUFs?=
 =?utf-8?B?SnY3bVprSVlKTzVGMXc1Vk9ZR2oySDhTTDIvRWNFL0pLL25wZ1BlQzMvTzF2?=
 =?utf-8?B?cHgwSnA0SkNxWWtRcFFsQjUzaEl1Q1VFdFJTN0JWYlZlaHhodGQ0VHdrNmhZ?=
 =?utf-8?B?Umhjbm1EdzJDemNiS3E1WnNIZnBEV25iYVp2bnhMclRGRFV1QmtHdU9LMk1K?=
 =?utf-8?B?c3M1eUlncWdhVGpoWFpJZ3JQbkhtTzU5Q0N1NkkrWE1SWVdLQWQ4WDQ4R0JK?=
 =?utf-8?B?cVNQRzJwc2pIOWpkR2hWdHpwbFVRYnZUZndSUHlkczhUcEtOT0htK3BpcEdU?=
 =?utf-8?B?K1JnRC9KdnVBdkt0OUlFbGc1dnVLTFNZa0RDU0hZd1VTaXBnZkh6U0haNVo1?=
 =?utf-8?B?SWNneW9LRXI2YXhYQXlWeUFMK2o5b1ZZLzVheWJObjNPVk12RmJKTW5ud0tt?=
 =?utf-8?B?bHJzTTNBUE1aZEF1QXVVUDhlUDFMSlZ5T1o3eHR1MVlzZU1WbmVxT2pzT3lF?=
 =?utf-8?B?dmtZbjJRMUxNY1R2VFphNnJqOWwvTitocUVCSnJxQjJUU21pczhBb0dDK1lB?=
 =?utf-8?B?REViSG8yR3VHWENuNUtVcm1iNWdUSWlOM25XQzA5NTFjZ2RMd1hDQkpKbTJY?=
 =?utf-8?B?WmlCc2o1QUEzZi94RUUraGNkNVBGdDdvMmFpaVA4S0swaTk2VzExQXVsYkw3?=
 =?utf-8?B?ZDFjWWJXN29Eblk3OXRDejRWZ1hYRGp0bHY2SnF1R2ZGSkJXdmFzZk5ETGho?=
 =?utf-8?B?cWdvRDhIY3p3M3ZLSjJTVy9XL1ZpSlhCOERldkJOVk5Za2pMKy94aklINWU5?=
 =?utf-8?B?a3JGN0xtTHNDTXQ5UmkzbG8waU4zWnpubFJmSWM0eEhFbUFRdTc5TTlYZkVq?=
 =?utf-8?B?SHZZM3kycDhtREF6KzgyTUVqMTlZSHd3cGFkdk81dndmU0lkMW8wVzhXRjdG?=
 =?utf-8?B?T3hFYWZ5b284aThYbFhWVHVNakFHVGhuWTJPeXFGSHZsalNMWkRwdVJ6bU9T?=
 =?utf-8?B?UUdkWkY1V3lRYUIyQnFUMGovUXRwc01Zc2NxWElpRndHa052a050dG8zVWE0?=
 =?utf-8?B?Q3UzS0htZ3o0eHRRRGtVeGxXOHkxZXdBa3RiOU5lWklUcUFYNW54QzM0cHFi?=
 =?utf-8?B?OTI4cUVubU5FMG1NTHVvUUxpdG5NRmlJcVlTMkZrMmV6QmREd3U5N3QvTG41?=
 =?utf-8?B?TWx0SHp0Y05SWWRPOVVoQU1EVk5Uc1pidzBlY3JucmlPaEtlL0VpaVp1b3Qv?=
 =?utf-8?B?Wm9FcFBKUkUrSElkbm8xWGlYV3J1TjZ3d2VPa3A2ZTNtQWdwcGZvdk85UklH?=
 =?utf-8?B?OEpBZ3Brd3VhMWJYWHROWDN6VUgrV0REeVk0dGJ6dkYxMk5DcUw3elM3azRJ?=
 =?utf-8?Q?bwMZVN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDJiOTZLNi9waGEzSFRXRXV3S0MxeG5NRlVTajdpaVVPQTc4RmFUNzV5UEV0?=
 =?utf-8?B?ZXdCREZFT2pOMDhkYjVCQXRWZnV5Y2RSZ1cwOVZZQnkzb1FvSHd5NTBWaG5v?=
 =?utf-8?B?YnphRmVOOWsvVXhXbCtHOFNXYlpDWk42VnMvcG1mR29oQVBYb2svVFd6eC9l?=
 =?utf-8?B?VU1tVDRjelhYY05SM295VWtuK1VWQmRwaktyYk9keGRkR0JnbDR4c2RxdmJF?=
 =?utf-8?B?WWY1enBjanZreWVqRnA2SWNML1gvWXlGYUg0Qkd3QUc4cDVCOGgwaHU5L082?=
 =?utf-8?B?bTF1WC8vOFdXK2N2MThLLzJ4ZXF4d0ZBQTJ2NEg2U2NHNlBvalVWbmZNd1Mv?=
 =?utf-8?B?NzVzdkJIbWEzYUdqbEc5dmZmMDZka1I5eXJJSVZMcU5EcmxoWHlZMHRjQkJL?=
 =?utf-8?B?cGxXZEFlTGIrWkM2RGFuaFJDc0JRODZydlZjV0JGOEpjWWpUYkxLbnM0c2xZ?=
 =?utf-8?B?RWRZWkowRnVFUWNreFhhQzBQejhZenVHUDFIMVlENDRuMldqWXRSTGdJWGdn?=
 =?utf-8?B?N3hHcFgwNm9DR0VxNngzWVBvdFExNmNDazZxcGRwWk9TRHI2TSsvMFpwWGJk?=
 =?utf-8?B?TDRKWjc1WmNhNldUbFhWY2Q3K1dyU3FmelVRbnpLWWF2L2djdlhPYjhkT0Qv?=
 =?utf-8?B?a2xPSFc1YzVaN1N4V09wS1RVeldCMXRKUHRDSzBVV0owT3E0bWxHWkt5MVdI?=
 =?utf-8?B?STdjSkNkb1RsbUpaSExCOWt1WENsWFlOR29lQXNpUlBxRk1FdjJ2Q3V6aEI0?=
 =?utf-8?B?d05wU29IUnVXZkVBbWVrRGFUemdKa3VhYVhhVmcycVl6cDB6dGRSelZHcC93?=
 =?utf-8?B?a3VxV0tZMWJwQmJOcTNvWmVCTkMyc2FMVkZFRm00VzhXMWNyTk9mY0NwQTBJ?=
 =?utf-8?B?M2hBMDdPTEdwUjdEczhSZ2w5UC80VXdiM1pWbURPU3MvdE9IclBUM0FXK0Vi?=
 =?utf-8?B?Wlo4N3JZTnF1VkRFU082SGZ1NHBlSmxHSithSG05NzUxTUV5eFk3UmpGc3hN?=
 =?utf-8?B?UkpmL0Q1bCt0NDhlb3hMNmVGVTNKVjlkQ3dEb0dpRzl0bTN2a3FoNlZMMk1z?=
 =?utf-8?B?cDQvTGVzOE5oMFB3L1hFb1FMWkJQT3ZqUUQ5UE5CWVQvdnFwYndXTTc4S2Ex?=
 =?utf-8?B?ZHlsbzI3WUNnSEVUbk9UK3JmVVZEYStrWlR1amp3VEloNERkcDZOQ0xScVFo?=
 =?utf-8?B?SEdDRTAvY1l0M21jUGhkU0pDWWRhR0UrVHJuOXBpSnFoZ0s4a25Zd0V2Ulhh?=
 =?utf-8?B?VXA3L2JVa3RNRytjRUhISUkrWFZzeVVCa0krN3E1dmJlaHZkSWdZMnpFa2lo?=
 =?utf-8?B?czd3ZFIvcFplV09BQ1hyZXBOZGdWaEVZcUVhYTZ2UkFheXpJSkVTNzY5c2wx?=
 =?utf-8?B?Vy9pdDN5TGVsSDNwMUZvdDMvbDNaRVkyZEpPYnhkQVVUYUtxREQ5c3VTV01O?=
 =?utf-8?B?SWcrcVVHc0tRL0hqYnZPbHJJMEV2T2FGUUM0ZGh4c2RPUVdHTndQdjkvaTlo?=
 =?utf-8?B?NnRJM2hRS29wbHVMdFRCMDZsZjdCUHlKSklaSlBGUUhVSU50ZG9ZL21SWDJC?=
 =?utf-8?B?cng0azZkZlJpWHN5V2E1d0krQkFMRWpxVFd3SnJsc3R2czFEWGRVN21qd3pQ?=
 =?utf-8?B?R1ZOQURDSEtoTCtVcmNIZi81RVphaGsxVHVucE1vK0xSSGF5cHVwUGFJWmRV?=
 =?utf-8?B?b3pnQnhhaTFndkF3dnhuU0x1RDhEL01WSC9GZXJObXFKa0R2SUkranlGeFdM?=
 =?utf-8?B?WHJuYWNWQ3Q4THBrcHJST2FyeE1SUjhMaHhVakkyWEFMeHdJOS9WalF1dHRn?=
 =?utf-8?B?V2plK0hjMFFpL2ZDVzhER2FVYjhIeFY4dlVjM2lucVFZNkZjWG94VnNUVWV2?=
 =?utf-8?B?K2lnZ01XajZlcFVWVmJVcGV6R1FYRlVoc1FzeXZ2ZkNwMjBIV1BraW1mbStp?=
 =?utf-8?B?RGc0eU5GUDVPcVZ0WFBWNG96RWpNOElkd1BEeUc1Y3YzalBzZzhDUGNxNnhk?=
 =?utf-8?B?SG9kbW1haDFEbjI5a2taaHcyZ21FdXlRTy9DaFRzNmxEK3o0eHJFa2RVMDZ0?=
 =?utf-8?B?S1BrMWhlWGp3VU1pbjZKOXRNbVRvUDlGZ1IvN1VmUnl5MTROT3FpM1hIbG1z?=
 =?utf-8?B?Ujk0ZzJtd2QxeWZ1bXh1VUZzS0VTd0ZuVGlMc2JkTm5VeGJ6bTM2RXdzNlI4?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8d677e-08f6-4d47-0a59-08de275a0783
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 10:54:35.9413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U0Fuk2CBt0ePNn7lx/8JmAgJcSgl9Hahn63M6Km+xenA5EnRsfj4KFNBIAdsNpOtm8tvSX7nllTe3guhemnRZHnIoEWx6Fbsx+eT6Oj/rbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFqZGEsIEFuZHJ6ZWog
PGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiBTZW50OiAxNyBOb3ZlbWJlciAyMDI1IDA0OjE4
IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS2FtaWwgS29u
aWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPjsgRGFuZGFtdWRpLCBQcml5
YW5rYQ0KPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IE11biwgR3dhbi1neWVvbmcg
PGd3YW4tDQo+IGd5ZW9uZy5tdW5AaW50ZWwuY29tPjsgUGlvcmtvd3NraSwgUGlvdHIgPHBpb3Ry
LnBpb3Jrb3dza2lAaW50ZWwuY29tPjsNCj4gTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3Rv
cGgubWFuc3pld3NraUBpbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplag0KPiA8YW5kcnplai5oYWpk
YUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyA1LzhdIGxpYi94ZS94ZV9xdWVyeTog
aW50cm9kdWNlIGl0ZXJhdG9yIGZvciBHVCB0b3BvbG9neQ0KPiBtYXNrcw0KPiANCj4gVG9wb2xv
Z3kgbWFza3MgcmV0dXJuZWQgYnkgZGV2aWNlIHF1ZXJ5DQo+IERSTV9YRV9ERVZJQ0VfUVVFUllf
R1RfVE9QT0xPR1kgYXJlIHBsYWNlZCBzZXF1ZW50aWFsbHkgaW4gb25lIGJsb2INCj4gb2YgbWVt
b3J5LCBtb3Jlb3ZlciBldmVyeSBtYXNrIGNhbiBoYXZlIGRpZmZlcmVudCBzaXplIGFzIHRoZXkg
Y29udGFpbnMNCj4gZmxleGlibGUgYXJyYXlzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcnpl
aiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL3hlL3hlX3F1
ZXJ5LmggfCA2ICsrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9xdWVyeS5oIGIvbGliL3hlL3hlX3F1ZXJ5LmggaW5k
ZXgNCj4gYjE0ODNmNWViNmFjMzMwNDU0ZTcxOTQyM2RlZTUyMDEzYjRiNjEzNy4uMDFjYTFkNTdm
ZGIxYzUyYzA2NzZlYjINCj4gNTVjYWY2YTUyMjNlM2Y5NzMgMTAwNjQ0DQo+IC0tLSBhL2xpYi94
ZS94ZV9xdWVyeS5oDQo+ICsrKyBiL2xpYi94ZS94ZV9xdWVyeS5oDQo+IEBAIC05Nyw2ICs5Nywx
MiBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsNCj4gICNkZWZpbmUgWEVfSVNfQ0xBU1NfU1lTTUVNKF9f
cmVnaW9uKSAoKF9fcmVnaW9uKS0+bWVtX2NsYXNzID09DQo+IERSTV9YRV9NRU1fUkVHSU9OX0NM
QVNTX1NZU01FTSkgICNkZWZpbmUNCj4gWEVfSVNfQ0xBU1NfVlJBTShfX3JlZ2lvbikgKChfX3Jl
Z2lvbiktPm1lbV9jbGFzcyA9PQ0KPiBEUk1fWEVfTUVNX1JFR0lPTl9DTEFTU19WUkFNKQ0KPiAN
Cj4gKyNkZWZpbmUgeGVfZm9yX2VhY2hfdG9wb2xvZ3lfbWFzayhfX21hc2tzLCBfX3NpemUsIF9f
bWFzaykgXA0KPiArCWZvciAoX19tYXNrID0gKF9fbWFza3MpOyBcDQo+ICsJICAgICAodm9pZCAq
KV9fbWFzay0+bWFzayAtICh2b2lkICopKF9fbWFza3MpIDwgKF9fc2l6ZSkgJiYgXA0KPiArCSAg
ICAgKHZvaWQgKikmX19tYXNrLT5tYXNrW19fbWFzay0+bnVtX2J5dGVzXSAtICh2b2lkICopKF9f
bWFza3MpDQo+IDw9IChfX3NpemUpOyBcDQo+ICsJICAgICBfX21hc2sgPSAodm9pZCAqKSZfX21h
c2stPm1hc2tbX19tYXNrLT5udW1fYnl0ZXNdKQ0KPiArDQpMR1RNLA0KUmV2aWV3ZWQtYnk6IFBy
aXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gIC8qDQo+
ICAgKiBNYXggcG9zc2libGUgZW5naW5lIGluc3RhbmNlIGluDQo+IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2U6OmVuZ2luZV9pbnN0YW5jZS4gT25seQ0KPiAgICogdXNlZCB0byBkZWNsYXJl
IGFycmF5cyBvZiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlDQo+IA0KPiAtLQ0KPiAyLjQz
LjANCg0K
