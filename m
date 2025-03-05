Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F931C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 11:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD02910E0B6;
	Wed,  5 Mar 2025 11:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KIBrJaW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFE010E0B6
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741174683; x=1772710683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GhT0RYIMpM9/alXlVwi6Tgoq1+YT61iSXv18TO6KcW4=;
 b=KIBrJaW2YBsdeiEjMguC08Fd5VPMJXJz3/eETDFcwVoOXmqEaK/5OcHX
 mBwbJqQTvi7ZQcMg2vM9F5iaT7aZCnJvc0K6nwWN0aXUXveDv5mrP/kpd
 F4Cv5zPPOBd6PBoomzXhWUcBGySDn0xP/YEuHo7TVfkr4+SKanwM0YTnS
 mgsr1WcbYMJ51Wc/7aFZgLxvB598xV99cF98XLmOxvKcvZSSKCbkNF1oI
 KncpM5HFpLBXrged5gIHCsQ9IstVP9qdBnpPO/5QK9RdRK9Xg5uOVhIuw
 h6eyDz1ybM9BfnA+6x+/9oDx17QrCGfF9+L+0KUJ9Svdt25l9w1jz8tV5 g==;
X-CSE-ConnectionGUID: eY7pHhe/TOuDyztp20Kj5Q==
X-CSE-MsgGUID: dQ2/dam9Tp6kp7b0GUA0Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42260304"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="42260304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 03:38:03 -0800
X-CSE-ConnectionGUID: 4nRksoCRQB6K/Xm+N/W1dw==
X-CSE-MsgGUID: UXtBDGbAQqSdiXH1W1Ftpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="119166701"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 03:38:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 03:38:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 03:38:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 03:38:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrvuxvA+YIpoxvD3evlbfbTC0CqlfbusH5hUk0pTMe0ud9fxcTPuJQVOeSaTJiLG0F1kbPyKchEuStQs39Th5qFwoOKNSMPpwvqWb01bN/liJpDht3yEQjDgaZTGj+Lds46QCr/z7BykCHvvR1ORRNnFjIsCuAt5yeawclhN8R7D5wYIfH+kGuuWsCOe3vNEvDa4ByoULDreCACQFrxaS52w4gD+bVJI6tT7FzGsItcBE9KHBizWEfz8MFrzTUrXxU/NOC7VMDabPSZO1haEt3WL3VLZBIrkv2owe6MdWUfrkWqQSTfi7PRtAxzTWqsPkSY8p4FPNJrj1s/QtJB6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhT0RYIMpM9/alXlVwi6Tgoq1+YT61iSXv18TO6KcW4=;
 b=g6bSwzKGldGdfAiFvuCSKX/eSTcH3gN1qDbV96QcLoMLSx2dBmYUn7DLa6P6vW6xmH9mmdhRwFHpbeJGDiQg1ZMvxglpK1QW42YEJ0sn0T2HNh8+RDmRcxG1qDyFNmFDPRKHzCsvl5llxLBbR4MGqf3ZsQQDj7FBPIYo1L1hx6yhIyP6qNMZbdSDa0Q4gIUjzLwwFSUYWCvmPhFEJaoyXWGFb87FnadksEhbAXGK1ugpP2LI6SUUs3S00vpQ2AJeG6agVcEo6T88zV1fBEQoEc2TzPAwS635etT3HSbiUoqt9X4ulVqWMRjFq0BUuHkHfAtpBvBT44mGS57t+ahEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by DM6PR11MB4561.namprd11.prod.outlook.com (2603:10b6:5:2ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 11:37:18 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%2]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 11:37:18 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "marcin.bernatowicz@linux.intel.com" <marcin.bernatowicz@linux.intel.com>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>, "mika.kuoppala@linux.intel.com"
 <mika.kuoppala@linux.intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Thread-Topic: [PATCH i-g-t v3 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Thread-Index: AQHbjSMeMZotQrIkYE61DTzSUt/0XLNka56A
Date: Wed, 5 Mar 2025 11:37:18 +0000
Message-ID: <a7a6b13787a4977f319e7962e30486d18a31f977.camel@intel.com>
References: <20250304163227.49986-1-christoph.manszewski@intel.com>
 <20250304163227.49986-3-christoph.manszewski@intel.com>
In-Reply-To: <20250304163227.49986-3-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|DM6PR11MB4561:EE_
x-ms-office365-filtering-correlation-id: 8a88697e-dcab-4561-4443-08dd5bda15c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YW5NYnlSRlZld2VKWGxiYnFvSlJydXZ2OU1PcHo5VGtEelI0SnZUbCtVVTFr?=
 =?utf-8?B?cWZDNkNHT1ZCOWZRT3FITERKUjB2TVVRdnhsVHJwZXVoMHVTcWV3U05XVFdE?=
 =?utf-8?B?OTVaTEg4MTNKZ3grdlBxU1RJVG81OVlSZ0ZtUFVDblJHQVpnMEJMRUNBdFJp?=
 =?utf-8?B?RkhhaUdST1NyV1M0bnloZzBUbnRHQTR4WkNBVTBSZHk1b1M4aXRrSjRCVWw4?=
 =?utf-8?B?RUFGN2F5TzIvalFSd3NxdEtZVUpZdFRJc3J3K3l3L0p4K0VzeUxGYUdMYjVJ?=
 =?utf-8?B?YUd5WXlacFBnSjE1b3NROXE0SlBsY2pMUS9ZNy9BQjNBaGNUaTZlZ3JjdUZw?=
 =?utf-8?B?TzBhdWd6WHNMeis1NEwxR3VtRjJZYTkyVXpCc1p3MURrMGhDNXlOVmhCZldp?=
 =?utf-8?B?T09uM2JkaUFnNGY0cE5IRDFlSG5QODhyTVE5VUF6Qk9UOW1SYWErL0NHY0Rl?=
 =?utf-8?B?a0F5MHFlMjkvTW9TaFVFa0VRSmVTMFM2czcxZTFVRVEvTUZqVEhKdjBkVUVO?=
 =?utf-8?B?OWVTTEVYdmZ3aW1wb3hWMXdBeWdUMlZ3Mml6OTZKcG0yek9yRWZFZ1NVUm05?=
 =?utf-8?B?dlp0OHMyTnBkczlTOHBSN28wb1BDNmdrY1hQSFczbG80KzAzMTFYZjkyNXk2?=
 =?utf-8?B?ek0rRE5aL1FNZkMybmp3MEFhVmR3anBXeTJjNW5HQzlVZVFxejU2WVNKdU81?=
 =?utf-8?B?SDVZVkF5SkRKNnVQUXdJcS80cUhsK25VQkdwWnMyVEd6TWRZR2JGUTMrWWhy?=
 =?utf-8?B?bnhzTU4xL2FpTFFSVjdVMFNBZU1UNUFjWWl5YXBRMnV4REs3UldnVmV5V0xh?=
 =?utf-8?B?VUZPQXFlU0VsZ3lYbmo5RiswaFVJd01wNXpTRmZUK0ErZTdIRWt5Vld5U0pn?=
 =?utf-8?B?UUw4ZHhQRGkxWjQ0d0JSUVAwcWNlSm5tQXVNeEYxRGNhK0VTTlVzTmErNlBB?=
 =?utf-8?B?WTVJYzFYaHl2MnY0Tjh3ODJuZTU3WWRud1FYVmVRNHY1MzhpZTBWcExhNnVX?=
 =?utf-8?B?UUFOQS9KcDVFZmhUV3hPbGNUZGJXZjBZbW8wNUE4V280QXBjbG8zSmZSencx?=
 =?utf-8?B?eWtETHArMlVlWm1ld2M2TmZHZ3NsMGZ2K0xQczgrbXhDaEdVaUJjSkc0eVBB?=
 =?utf-8?B?VjNyMHM4b0Z1KzQ3N0d3bm11RVFyOHpmRU9qSzBhYUtWa1pTUzJmdU5vMTJ3?=
 =?utf-8?B?U2RYdk0xNCsvZVBsdmdDVGRKZkJHQU1nSHViaFRGZDBwbVR3T25SeURJS1ps?=
 =?utf-8?B?aHlCbmwwUkJUY21rRTYrSXh0UnVlUlAwSldlMysrUHhiOWFsZmtFRHROKzI2?=
 =?utf-8?B?WkpKOUYzL0hXVWl1TTk3Yi9ERHZ6MzBtKzFUMzZmS0o4K3lEQWN1R2RDeVhh?=
 =?utf-8?B?cVhHT2d5OTZhUFpCK0VNdzZkUmRvMXlLSEJsSU5qK1AxNlV2UklzU0xtWmps?=
 =?utf-8?B?VGpxMm9ZRGpaeE9ZOFdzOHA5Qy9DOUxVZE16NE1tTW42VmtBWTZNdVdjOUhm?=
 =?utf-8?B?cWlLQnorbDZ3UVlUU3JvUWZteDl0bDV5MGRIUXBLSk5OZm1Sd1VwL0ZVaHY5?=
 =?utf-8?B?UEtWbERwMGVsdWdmUFVxeVdxUVlWUFRYTmNobFd6MlozRHhGOWljYnRNVW5x?=
 =?utf-8?B?alhuaENwSjBDYzNIOGtEY0I5dnV2b3RxOHNQT1o0eitGRHBJM0QzVXRjR3hn?=
 =?utf-8?B?SDBkekZLWTdKR3JPV2c5RkozOU9zQUtiZEF3T2dlUjlKUjhicVNZeEhWMmgz?=
 =?utf-8?B?cFJ0ekFMUGtCN1NWWXYrZWpDVFI0NUErdG1ETGdLZUxUazV1M0NNSTFYTjlW?=
 =?utf-8?B?ZkdPUzdjMU1veWJoVnl4V0FrN290QjlWcDJuekRQUlQwK1ZhYTA0TUhPbHFT?=
 =?utf-8?B?aUZ1U2pJVXh2VkY3SERRTjcxdktMbWR3aERoN2E3UjkvdlZCaVRrb2RBenlk?=
 =?utf-8?Q?XRgLiP/BNpcADdTEAekPwB4FNDerFQch?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3V0NTZpUGZ1RFdzamttNG0xcDF6cldNblU5SktWNFdLdUdJaXhnTFE3cUYv?=
 =?utf-8?B?YnQxaTJTMENkcnRiV2lXbG1sVVNncWpWalJrYnBIM0RaM2Z6aFlJQlZLd0xX?=
 =?utf-8?B?YnZISDVrZjBHTGVFQUhzZHBOdTNhUjd5YkZMVXBJa1JSU01nMnY1RUxBZDFv?=
 =?utf-8?B?djNXejlzbHJpeitCd1ZpMlpYZjd6aTFaVHBwOTYycXYrRmljUGpCMlB2R3Bt?=
 =?utf-8?B?cE12K1dNK1dJcWpYQ1kzVFZsRFdKenBlRjBLK1c1SDJwT2lyOVNPcUxLZTRG?=
 =?utf-8?B?eFU3RUpFWnBMNzlhS2VtT0w2c0JEMm03SkpZU3FwcDROZTBYYXY3UmNyc25T?=
 =?utf-8?B?QmtWUEJFQ0lzRGQvNExWczhSaUlmU0xHbWxQcEN2RS9zcU5aR2ZZaVlwZXha?=
 =?utf-8?B?N2hBKzlGUHFhMXpOcVhNdHQ5SjloMVVPUkViWGYycUswRnY4RGdERyt0WW85?=
 =?utf-8?B?UXl1bVA3dTVjdnBmM0lFSGZjNUkxYWhUaG9BTWtxMzZEdnNnK2FIR2NKZGpk?=
 =?utf-8?B?K0x3SENZcTQydnZobGJ1MExSbHpUU1ltVlEzcEJNL3ptVk5wbCtJUXRYNVZw?=
 =?utf-8?B?MnJhbDlrbm1YLzNtWWhHZVRGbVVQd2NOc0c0ME5yaFdRMVIrVGFzdlI0WnN5?=
 =?utf-8?B?OFJIZE42TmhFTkUvZDNFRnBnRGw2ZjRWdmtVenBhTUhxVEtsVHpGUllubVNP?=
 =?utf-8?B?cFpwY3JnbHRwOVViYTNzeStBcUlJYlozRDVjWURWa01NOTJxelZFdVpNdS90?=
 =?utf-8?B?Qi9aTXNGZWdJbC9pd1F1U0V4eUM1RlJQQi9TTlBXRlFPdk43aHNMTHVHYlM4?=
 =?utf-8?B?MDg4c0JMaEQ5NytmVFF0M2FmUmlsdnQzbW1TdERNUTZPM0x6NmFtdm1lTlNx?=
 =?utf-8?B?MmF3VGdka0FVWDdITEJiQ2V1KzRPRVVva2dKbkNhS1I2TW4vYWNlTlc5S29s?=
 =?utf-8?B?bm92dkNUWU80djhoV093UXpiLy9xME0wV2x1M3pEdmdsV1JPSHVISkpIb21r?=
 =?utf-8?B?K2RPOEs0d3dHTnQrbHd0dmdCSWNxc0NXQUdtTUZOSzRiS1ZFUnNhNkQrbmFX?=
 =?utf-8?B?ZGZjaFZIN0lvczF3VDNGd1BxNm1zb1NOSUpmaFF1WE9TdWVRVk5SWFo2RTlR?=
 =?utf-8?B?VXcyL1k3dEV6aUh5NTFycnNVV0hWTkNmYksrMmVub2MwdUxoYzUwWlZNMjZs?=
 =?utf-8?B?dHFONTRBWlY2UDlDT1FQczZuVmttVjhhdXd6a0lrTk1Ub0xJaDN1R280dHhP?=
 =?utf-8?B?d3Y4a0hGMUwxbkluVGNFRVpsTWZRMkk2QlRSMHUvVXgzaGdZNC84eG1WbU5C?=
 =?utf-8?B?bFZyQnlpQVZ4VjlpeHJ3T2lGUk9FS09iM20rWGdDTGtSd1pZNURTTWhmNzB6?=
 =?utf-8?B?MTBGZ2dya0o2VVJBY3BodzZOSWlHUzYxRTE4OTBrV21NYkl2RTltZjBRRUpX?=
 =?utf-8?B?TGt4QnhUbWUwUnJMeDZuc1dKckxxN0lvOXZzVitSTnRjaHN5N2E1WFhEYmNr?=
 =?utf-8?B?NDRpS3hnKzlEeWFYdjVrVThUZ0Vhck1leFBXT1VKMWpWNGZwWW5OZDBMR2Ri?=
 =?utf-8?B?alZzSUZBVjcyRE5RN3c3VWxUOTlJVVpLNGh5Z09XOTN1UFlPcXRHTmk4VEZi?=
 =?utf-8?B?MndOQ1dYQWRxUFZLYnoxMmNFOStvT3lKNkw3MGMydUtITmZBMHZMaS9nU21B?=
 =?utf-8?B?Umc2SmJGcC9YTGp1RkxoSkdsZHlPMm5jTUtjaktRN3N6dnBoV0gxODlpZXpH?=
 =?utf-8?B?V2lsaFVEZkYwbVVEdFZPZFpBbDZoZ3V2c20zcGR1ampVL1cvUnVHRDV2VUJJ?=
 =?utf-8?B?MGdyZHBIQTZsWGtaNU5DOElyZk9DQmZ5V1BLWDI0Zy8zTk9RazkzTmZaamxy?=
 =?utf-8?B?RVFBWnpHZXp4V2NhQXZlR0laeDhLL2pmTUE2UWVmeTJMUlB6Wk9BUlNKZ0R2?=
 =?utf-8?B?S2FaTmVvZUxUS0loTWhHWEw3bkRIRlYvS1pydWJ3TzJvMnB5dEwwUG1DbzFp?=
 =?utf-8?B?Q1JFZ0dlOGsrc0h1NHRibXdYK3RURDJYUjEwRWZyQ3Z3MS9pTTRIZGRSYWJ3?=
 =?utf-8?B?aFFBa1BxcXdnRXFlZG40TU16b2dRUXlxczBEbHNmREEvblRPa05oeEFienNS?=
 =?utf-8?B?R01lVjQ0Z3RnZGtwUGpJTWk1MDdTYkJ2dkZyUUhLWTNLUlIrS3RyN1JZaEk1?=
 =?utf-8?Q?L+WNCTTzv6MuFBZ8cSeixTM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB5C7A1AA852304A80A99CEC3E39CD6E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a88697e-dcab-4561-4443-08dd5bda15c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 11:37:18.2706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlAkUIwdDBNQ7JIJwUfqJkOyjtZNdYwlz+ZM5B5rF/bSKa3PNFkeEp1z5nx/PpPpKH8im/omugkeW9Vrfa5VQpIfjphQUNlNymwu91htAOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4561
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

T24gVHVlLCAyMDI1LTAzLTA0IGF0IDE3OjMyICswMTAwLCBDaHJpc3RvcGggTWFuc3pld3NraSB3
cm90ZToNCj4gRXVkZWJ1ZyBpcyBub3Qgc3VwcG9ydGVkIGluIFBGIG1vZGUgd2l0aCBWRnMgZW5h
YmxlZCBhbmQgaW4gVkYgbW9kZS4NCj4gUHJvdmlkZSBzdWJ0ZXN0cyB0byBlbnN1cmUgdGhhdDoN
Cj4gICAxLiBlbmFibGluZyBldWRlYnVnIGlzIG5vdCBwZXJtaXR0ZWQgaW4gUEYgbW9kZSB3aXRo
IFZGcyBlbmFibGVkDQo+ICAgMi4gZXVkZWJ1ZyBzeXNmcyB0b2dnbGUgaXMgbm90IGF2YWlsYWJs
ZSBpbiBWRiBtb2RlDQo+ICAgMy4gZW5hYmxpbmcgVkZzIGlzIG5vdCBwZXJtaXR0ZWQgd2hlbiBl
dWRlYnVnIGlzIGVuYWJsZWQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNYW5zemV3
c2tpIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBEb21p
bmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQoNCg0K
