Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBE8C02194
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 19:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6E810E30C;
	Thu,  6 Feb 2025 19:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbjdiIEB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EFE10E30C
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 19:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738870083; x=1770406083;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZBIzUqL7HIC0jmrN0wpZ9cIMPrRtKhD9+eTbTZqPOuQ=;
 b=IbjdiIEBErjVvy6MT24dud2I21SQP7GoDQunA1kpg8PfD/pip5AQEhNn
 fEOHdq1mY1GKXo2HX/tw+V9/xnEy5t7sYurQBhakL0vr1vQ/9jsgm8Mzq
 0vxCnkg42FJbATt4jkjoyqNmVGeCbEYaNeBr9YBMpDEUHsenBzKKQ75qf
 nykd2w/3Us0hFM6VT6CGgsLFVeFFXklJC3HFrJCqh16L/X+zDsKkVb0mf
 za5/MZ5vnBb/ggBfMNPmZsvRdOA4eHNk6ka0qj+ZbhbUd3jCDfbTuHU7q
 X4HIOGppDQurkDVxJNQsectINrSQoRsVLEPtNu19JeU/YjeGcs4Vql12g Q==;
X-CSE-ConnectionGUID: MNIBbsZVRkqW1oevEsvn9A==
X-CSE-MsgGUID: iNWiaQFuTn61WTj4gvl0Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38691765"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="38691765"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:28:03 -0800
X-CSE-ConnectionGUID: O4cdOJeuQguoE2GBOsjfrw==
X-CSE-MsgGUID: mV8NbQlERsqZshBjZPrYMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111503966"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 11:28:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 11:28:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 11:28:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 11:27:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsZxhOrWFm1dqtO5LA+Rm5/1UxamDlMTtrLBz7vYWYRHGxsfTqNbxQdmaWpoSTJR/LE+cOILBpHBE3lp/cITYOE0bzpHM4iY8jVvwJvZgxwdSCb0TgtE6sH9EdkWswOuAWJM4U1fev+u6eNVUDVZEasNpAL7UDbgoqzMsFBzs51PyeEMSsNZXzeQRtjFnsEzF/75YCc1K75KVZpZW6oaWwEJs03DRMcB5vLLJx/91NFzOxTbl+5KRCcLyi5KVHtmdocHf8OpdL72gY+QGu6tl+YDpeowWhZv2gT8nGwMuZk+XCQdKWf58e/lmJz8ClTsU8BUKLlDwNh3qRXPO9tNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8D7YSjBxLp5NMB3VKzhOfqqhs/yP3PvmkAWGECxclY=;
 b=otR/L8gLGbxgktxciCMz5Wo81MUQERFbctlstCWrNrSKzcoMTxPwP9agL9nii9a3+DXfn37uhI2HS4sWb+1yHDUsVD0U0rz+gb6VcS7L8A1rG42SuGivve4awagNkEF1n6Uz3wIQLFwpZc1B90Ug9nYJ82Cj3ehR5G8jjPwljdECfbSmQeRtnNwvXaVp/M7+gGiaN52LUF41+34Ux5NdRsZ2lQMXByA7ALhLzMo+ZzX9UWXL5NMI4O0diK9WZJ5vfahS3IREcb9geyXQCfAGjO1Kv0OlKcg6wXC3MKd5qiU7lkF+SakpD0eXwyFJQQKtjNDtwetLJVPUzXfAAzTNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9)
 by MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 19:26:26 +0000
Received: from SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::8436:8310:fe3d:d46f]) by SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::8436:8310:fe3d:d46f%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 19:26:23 +0000
Date: Thu, 6 Feb 2025 11:26:05 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <Z6UMzbDHC9vMPRI2@msatwood-mobl>
References: <20250204175302.18147-1-matthew.s.atwood@intel.com>
 <20250205233055.GV5109@mdroper-desk1.amr.corp.intel.com>
 <Z6TsGM6LD26qIcRY@msatwood-mobl>
 <20250206180113.GL4460@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250206180113.GL4460@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To SN7PR11MB6728.namprd11.prod.outlook.com
 (2603:10b6:806:264::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6728:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: 8daf9bc1-3b52-4178-554e-08dd46e4240a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHlpVHZoWmQ4VkhUTER6T0RRcXY2V0NCbGE0Q3dpeVhtUldlVnJFSENTUmxB?=
 =?utf-8?B?YUpPc1Z2SndhQ1Jlb25wTU1EeXM4ams4d2YzT2lMZjRLWXQzTm1lb2dubDNU?=
 =?utf-8?B?VEZYVkRYTmp0UlRIN2JycVlmcFczc3NQMU5iU245RzBFbytvZlJxRG5XbXUz?=
 =?utf-8?B?Ri9NSDRHbUhXNWVubW1FaWQ2TEtiZ3RmOUtCRFZDaWE2d3ZaSnBJMjJrb2Jr?=
 =?utf-8?B?VkMyU2tBU3k2VUpJV2xDK24vcFJVVFJNSUk1Kzl3aDNlaVY1eVNWSlBSVUw1?=
 =?utf-8?B?amRydi9mQjV1UWcwK3BXTnZHdU9CejIzSjJTVk5FQVFnTFVMUVV4ZVY1WDFq?=
 =?utf-8?B?bHgyYmRHZWVRejFpNWZzQzViTkw1WWNlMUN0WEE0QVFZNHEyR3NmRlJnNFRB?=
 =?utf-8?B?TGFUODJJRHg2UjFzY3ViOWlFM0FiRDhyWGppUTZ1dnlzK2RUME04aGhqU0VC?=
 =?utf-8?B?d3F3Ry9iQVlaTnhrRFZrRzloem93K0l3V01YRnkrc0thSmV5L1ZsdmltRHlv?=
 =?utf-8?B?YWhWd3Y3SjlPbDRJaktOTjNzeGQwSy9XcEtjUTF1VmtVVjE4eXNjeVdKVU51?=
 =?utf-8?B?Mm9kWGRLSHNnRHFFdUduWkpYaG1HalZHYSttSjNqaFNIM0NyRnBPM01SSk9r?=
 =?utf-8?B?cjZkS0RoYldSbmdiak1NSjRkSFc4YVhIQlkvOStGb2pFVmo3cW9ucnlwcEQz?=
 =?utf-8?B?cFhkcDBMWDN6RUNnQTY4dFlxUnJEOUNXQXVKSXpQQlMrQXhBSHcrdzFyWFdP?=
 =?utf-8?B?WU1xb2tLd2dPQ3QzVklqb0VCOHJzUkgyaTY4dFpnSzVoSFlRTkpSaHV1Zjdr?=
 =?utf-8?B?aXFDYkI4ZDdsTHRuQkJUczRmZHkycG12TjVQWDZEVkY1bXdUWlYzcGRPMXk2?=
 =?utf-8?B?aXFNL2wwcThOcThYWC9IY0RXSE8xU0tpT0V0eHJrTzZDQ0xJamFOMFNnVERJ?=
 =?utf-8?B?UnZJckV0Z0ZtcWZrcCtITnZXejFyLzZhTTZ0SlFBaHo5NzVXUHBUUk1pS1VZ?=
 =?utf-8?B?YjVLRFlxS3Vxc2N5d2FNVjUwWTFmZldHeTZtQmQyYUY0cEM3Mm1hT2FMQkRW?=
 =?utf-8?B?RVIvYkhvUVBYOEVKdVBtQllkOG5SSWFwTmxHS3dWMjJSY0RCM1ZlY0FRRjdq?=
 =?utf-8?B?UzVRWW42TlBRZDhUUGI0c3J2OTlxNlphT050elhWb1Y5YTQxSzVXTU9QdGUy?=
 =?utf-8?B?SHNjY1N5Z0gvelBwRDQyTXJKMmozSlI0MUErODc4cFlvTmVFYll3NVU3ZGd5?=
 =?utf-8?B?TjVMUlVuVDY2b2ZhS1IzZUwxUWkyTDZabGlUWDl3cTZ2R1B0Z211Wm9vdkJ4?=
 =?utf-8?B?ZGNselMxbjViQ0hSSmkvbkF3VklEc3JDbmpRUmJ1c2FjMFFYRERzTGh0T0xv?=
 =?utf-8?B?cjBFbU9mR0tIRjFhYS8wVE1QTG5EUmpPVFk2cWh5a2V4djJSQlBWeFRDL1Yz?=
 =?utf-8?B?RXVrUWRlcUFuTE4rcUwyK3BoaEZpVWhpSzVMUXJxMFR0YWxBQXgrTWR6cWRy?=
 =?utf-8?B?MHhhSDhxVjEybC9ubHZnRndybTRwRGE2elV1ZWJWUjVUa1pKQjhjMzk5a0Qx?=
 =?utf-8?B?M2hGNkY2QlQvT3ZwY3ZGekdLeXAyTUdVMkc3eWlHV2UwZWd6MWpKU0YwVzcv?=
 =?utf-8?B?Mjd5WWRkc3pyN2VqSGZuajJkRmpsRVpheHA5RFdVY0cvOXR6blpRbFhBZzFO?=
 =?utf-8?B?MU1vQk5sMmJCajVKWFBzUnRTRXZZSW5QNzYzV2xLRDdvdDZUeUdrYU5GMGpy?=
 =?utf-8?B?ZWo0UC84akZ1TDcyMmNkMW14QTRaYUMwbjBocEhlU2hmdHJFakpiR2dmaTF0?=
 =?utf-8?B?clExU3VVc3ZWenFTV2l2UENud1ZYL3RZM3EwSHZuOTM2RjRmcGZqNlFXaE1o?=
 =?utf-8?Q?Q9E/Qid+7bpvJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnZRRzVFY3hGRXJqT2I3THZVSWZoYVZvMUdDRVZ2bDR4N3F3U2tNNGRnS2k3?=
 =?utf-8?B?c2NjblVlM0tHanVpUUxHSENJZzNrMUVQVzZNWDBLR3U3cUFJcFNHdElYMDJ6?=
 =?utf-8?B?RTM0SFd6VGlGdHdVSXRNWWk2dWkreHlvR05KMXBJdGcwaUJtTHM0MFMrNlhW?=
 =?utf-8?B?SkkrOUl2bXQrSU9VcVArTkNXVWRIaDRIRElGNEtJN3BJUlNzcWh1WmlCK3FP?=
 =?utf-8?B?cklTZGhpL2MwQXJjMGZCOXAxMmppdnBTL2ZCMm42Zjc2aWc1clhiZktGWkZM?=
 =?utf-8?B?Qm1zdTlHQlFhVVY0NlcvL0p2MGVCd2Vpb000TXAvNzlqWHljbnZ5R1dwYUVR?=
 =?utf-8?B?VnM2UmxTMHpwLzVGcXpjTmlzaXVPWEEyRjl1dk1nTUdlWGtQYzVTOGlXZTBP?=
 =?utf-8?B?Uit2QTRYeFM3Wm1UbkRXUnNiTnhBWjBvWEJqTGlmdmd2c3JoRExDZzRmUVZv?=
 =?utf-8?B?ZzhwdExkVEMyQkdrc3lrRXBJeHluZ0E2cElhc1I3QTB2dTVaeXc2Z21sYUEx?=
 =?utf-8?B?T1dKZi9KOFhWNnUzY3hLendEbVUyeWp0MlNhSTBKY01sOHhxcjZyeWxCakpq?=
 =?utf-8?B?QjRLVU5KMTVTcVg4TnZyTDVqVnVzN2VXOUhvS1ozeE1QM3Q4WGN0NTZTZ0Rp?=
 =?utf-8?B?dFczWFRPeXREZzBWanFxb1c3WFRtMnoxdDNwOHpWclorS1dLYS9mR0Ryekpy?=
 =?utf-8?B?NXkvQUpGeTk0dmJQWk13T25UOVZiUnRQOFp3NnlrNGRJV295R3B0cy9ERjcy?=
 =?utf-8?B?cXBQMXVpQXNYZ201WTRwV09KaXd6Q3c3SW41aHpiQ0Z2VWpJMEJqQTQxVm9H?=
 =?utf-8?B?Q29tZ0o3Skg4Rlo1bmtCN1ZSdmttSkRqK0l2R3k5ZVAvdFNjRHdxTjdWVUZ5?=
 =?utf-8?B?MDJnVDVCbm9ZTSt6c2E5ZW5sTkF1dVJOaU41bzAxc3B0NWZVVzQybkRsVkxS?=
 =?utf-8?B?MkdwcVAwb3FBbzVMcm45Vy92alBWYjNDcnFINll2NkN2eVlFbkxTdGdSU0t0?=
 =?utf-8?B?YjRoRy9WSGk3bHdHZmVLK0VZTjZTVW54NGV3enVSeWh4SEtDK2RJNmhzdUJt?=
 =?utf-8?B?ZVFTbmVncVAwN0E4RVhaNlhNaTNwZWVTd1VtSXhLZEZUc3lqVGozVi9FZThj?=
 =?utf-8?B?S0xrd1l0WEZqeVlSV0lISUF6ZzhSeGtTM1FFUFpGMk8rTm5lUjdPTFY5VFpC?=
 =?utf-8?B?eWptQUwvbTRXN2xDeVB4ZVZhRjMvR0lGVFVTQjdnL3RSV2gyZXl3d1hIdkpK?=
 =?utf-8?B?bllBNGxwMXg0VHlEWTZaUDdaNUdyNzYxazdDZVIyRUhlZHpKSDd5Z3pZeU1i?=
 =?utf-8?B?cnIzdUM0SkxlcFRjSmFMM0lZdTNKZVk5QlhxNkhtckRaYTBvTHBaamZORytU?=
 =?utf-8?B?K0dMK3R5cWJPcXQyUjlCVVpla1VCWVBkWittdjVLSmVKajhrZTJCRU1sVUVM?=
 =?utf-8?B?MVdtZ1hyd2Jjc3d1bXZPclFaNUxsSURpUTBvVFdTUjJhczJsZzBIUThISDN5?=
 =?utf-8?B?aVhhV2E1NHgvNzRNdmUzWlJQVDhRcG15YmNvZG9nMzBEM0NYNTZDcWxlZUdq?=
 =?utf-8?B?eC94Y2IrbFYvQXYzNjZ6RTZ1QmhMNkxJN3c5L3RYdHB5bkxwVERxdWtXRTFt?=
 =?utf-8?B?ZXk1eUxwYjZXYjhKdENNS2lnV0d0all4bTFLV01sS09oZXBuVndLYWllR2FT?=
 =?utf-8?B?cnJHa2J4STQ5c1NGL0Jld3ExNllDV1FYUkF4eXNnd0M2Mll1czFXMkZjdkdL?=
 =?utf-8?B?OGozRG5jNEpsZ1l4MnltRmNLdFZ3QWRMaXhYRmQrQjJlTTF5c2hhY1FnUHAz?=
 =?utf-8?B?SThQK3pqdFdzZWhJUmlMQnJRL0YwM2NjZndJaW01bjFyeERkRVExSk5wQVk5?=
 =?utf-8?B?MzNLY0toMDRQa3MxcklFM0VLUVJzaFU3R1Foakt1MzJ4RExXa3VELzdydys2?=
 =?utf-8?B?b2NQMUphdXVWMGF4akhxSFErUGZjVWFoTzJPdFVUcFpscnVaOXRBeWFxNlhu?=
 =?utf-8?B?WU9RQ00vVXhrUzl1cjRyNFcyY2Z3U3BscmIxZHVkYUxNSDlteEZOc0ZWY0d1?=
 =?utf-8?B?aXd4a3hqNUc5amxiYU9OeHpnOW5qVCs0YWJuVDdyWjR4R2lkTVoxNUpmTzVF?=
 =?utf-8?B?ank3QzNrd3Y2WHNKRENRODJ4MzZINVh2Wms1enJMYXh5OWtmMVdHeTNPMTdk?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8daf9bc1-3b52-4178-554e-08dd46e4240a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 19:26:22.9140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ubd2BJS/S8Uw8jt7LHwiBo97DL7YUzeG9o8tzMkQ+GI8fn7dzvvGg77fJY96yohDQNa49QIdheDaSS6/FgnWTYHGqHOy/SucWvIXHDM+2aQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
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

On Thu, Feb 06, 2025 at 10:01:13AM -0800, Matt Roper wrote:
> On Thu, Feb 06, 2025 at 09:06:32AM -0800, Matt Atwood wrote:
> > On Wed, Feb 05, 2025 at 03:30:55PM -0800, Matt Roper wrote:
> > > On Tue, Feb 04, 2025 at 09:53:02AM -0800, Matt Atwood wrote:
> > > > There have been several changes to pciids upstream that need to be
> > > > sync'd into igt.
> > > > 
> > > > Sync with the following kernel commits:
> > > > f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> > > > ranges")
> > > > e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> > > > fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> > > > 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> > > 
> > > The updates below look correct (they match the kernel header), but the
> > > commit message here is confusing.  IGT updates to this file generally
> > > specify which actual kernel commit you're synchronizing against; none of
> > > the four listed above match the content you've copied here because there
> > > are additional changes not present in those.
> > Because there are now several out of sync next branches, saying as
> > of this commit idea was not working. Hence this approach.
> 
> You should generally be syncing with drm-next after things land there.
> So which drm-next commit are you syncing with for this commit?
They hadnt been in a drm-next commit yet. At the time it was just after
a next cut, at this point we can probably just wait for them to land.

MattA
> 
> 
> Matt
> 
> > 
> > MattA
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > > ---
> > > >  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
> > > >  1 file changed, 47 insertions(+), 15 deletions(-)
> > > > 
> > > > diff --git a/lib/pciids.h b/lib/pciids.h
> > > > index 23f349f65..4736ea525 100644
> > > > --- a/lib/pciids.h
> > > > +++ b/lib/pciids.h
> > > > @@ -717,37 +717,66 @@
> > > >  	MACRO__(0xA7AB, ## __VA_ARGS__)
> > > >  
> > > >  /* DG2 */
> > > > -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > > -	MACRO__(0x5690, ## __VA_ARGS__), \
> > > > -	MACRO__(0x5691, ## __VA_ARGS__), \
> > > > -	MACRO__(0x5692, ## __VA_ARGS__), \
> > > > +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
> > > >  	MACRO__(0x56A0, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56A1, ## __VA_ARGS__), \
> > > > -	MACRO__(0x56A2, ## __VA_ARGS__), \
> > > > +	MACRO__(0x56A2, ## __VA_ARGS__)
> > > > +
> > > > +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
> > > >  	MACRO__(0x56BE, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56BF, ## __VA_ARGS__)
> > > >  
> > > > -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > > -	MACRO__(0x5693, ## __VA_ARGS__), \
> > > > -	MACRO__(0x5694, ## __VA_ARGS__), \
> > > > -	MACRO__(0x5695, ## __VA_ARGS__), \
> > > > +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> > > > +	MACRO__(0x5690, ## __VA_ARGS__), \
> > > > +	MACRO__(0x5691, ## __VA_ARGS__), \
> > > > +	MACRO__(0x5692, ## __VA_ARGS__)
> > > > +
> > > > +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > +	INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > > +	INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > +
> > > > +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
> > > >  	MACRO__(0x56A5, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56A6, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56B0, ## __VA_ARGS__), \
> > > > -	MACRO__(0x56B1, ## __VA_ARGS__), \
> > > > +	MACRO__(0x56B1, ## __VA_ARGS__)
> > > > +
> > > > +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
> > > >  	MACRO__(0x56BA, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56BB, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56BC, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56BD, ## __VA_ARGS__)
> > > >  
> > > > -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > > -	MACRO__(0x5696, ## __VA_ARGS__), \
> > > > -	MACRO__(0x5697, ## __VA_ARGS__), \
> > > > +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> > > > +	MACRO__(0x5693, ## __VA_ARGS__), \
> > > > +	MACRO__(0x5694, ## __VA_ARGS__), \
> > > > +	MACRO__(0x5695, ## __VA_ARGS__)
> > > > +
> > > > +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > +	INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > > +	INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > +
> > > > +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
> > > >  	MACRO__(0x56A3, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56A4, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56B2, ## __VA_ARGS__), \
> > > >  	MACRO__(0x56B3, ## __VA_ARGS__)
> > > >  
> > > > +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> > > > +	MACRO__(0x5696, ## __VA_ARGS__), \
> > > > +	MACRO__(0x5697, ## __VA_ARGS__)
> > > > +
> > > > +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > +	INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> > > > +
> > > > +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> > > > +	INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > +	INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > > +	INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> > > > +
> > > >  #define INTEL_DG2_IDS(MACRO__, ...) \
> > > >  	INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
> > > >  	INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> > > > @@ -782,9 +811,12 @@
> > > >  	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
> > > >  
> > > >  /* MTL */
> > > > -#define INTEL_MTL_IDS(MACRO__, ...) \
> > > > +#define INTEL_MTL_U_IDS(MACRO__, ...) \
> > > >  	MACRO__(0x7D40, ## __VA_ARGS__), \
> > > > -	MACRO__(0x7D45, ## __VA_ARGS__), \
> > > > +	MACRO__(0x7D45, ## __VA_ARGS__)
> > > > +
> > > > +#define INTEL_MTL_IDS(MACRO__, ...) \
> > > > +	INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
> > > >  	MACRO__(0x7D55, ## __VA_ARGS__), \
> > > >  	MACRO__(0x7D60, ## __VA_ARGS__), \
> > > >  	MACRO__(0x7DD5, ## __VA_ARGS__)
> > > > -- 
> > > > 2.45.0
> > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
