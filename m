Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC00CAC592
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 09:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1292110E970;
	Fri, 19 Sep 2025 09:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bf24CNM0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0149E10E970
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758272930; x=1789808930;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dFF9C++JSCW+y5pXuNZf5cn3aUx7XHJQeeJfGnWsLUM=;
 b=bf24CNM0Mz7WbM/NqN+22038suQ7NzUmiBhkyynJ0Qp1UhFb/BTHxY92
 6esEyrLsgajxiwC5O3XQ1HepF40Gf0WGETLZSnewIEy3YQ999mp3AjiC2
 i1B5IjLyCKreK1tkVCp2J94ED/a/qJ0hOID0KN+qTe3XHcPnMpzJlBmjw
 H+q3U2Lu4dm5qStRnJkX4mILnLwYCHl4mdY/WyYIF6dOUfhTJfqVJXQco
 tYqWad3r4vYek2Xtds0+Vm++w1FABx8p1c7/n40I511ihp66DiVG1amD7
 42arUP7CigIkCANi8cnmOsguqK6lSC0yfREof8jHcgEiMtzC+NftGxpKM Q==;
X-CSE-ConnectionGUID: R0nWJthqSseO7AlquqEQJw==
X-CSE-MsgGUID: tcwmyQSQSFmB3Y6fQ7aV6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60505410"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="60505410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 02:08:50 -0700
X-CSE-ConnectionGUID: z+SfC0ClSTiWSW+Oe1xoKg==
X-CSE-MsgGUID: mBPcYatuSJqkS/+cfL2YcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; d="scan'208";a="175337623"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 02:08:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 02:08:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 02:08:49 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 02:08:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wESo8criJ9Tm3MQHemGQ/qyXcrV/SszTnBYebkHti6FnhrMMCN30qgO/La6xkBV5htQOLsqLHcduCWF9D/bY/lyk1XVYZPOzHocRSIMhjXfrMXdRq9JseKR7OkjcaHPmhK8hzZ9JMj8V41MR+ImjOfVwwusb95v5iPF2cU96PxMmGIkoMKJATTQLL4qwNB55Z+HP2InHwoR7GIzsetHcOrGxJUCCdLK8xJmVvLmT7xX8ZPvTQmCktInv1Fdr3gavkyUeWeaE8UjI9+TGguXmW9rNJ2Ka1vdt3NZTAG733zn88ZVdlQC12YouiXAkcEKxlo1UixuCh+w1wzV2Rz2JFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFF9C++JSCW+y5pXuNZf5cn3aUx7XHJQeeJfGnWsLUM=;
 b=RFaK+lGhRIHKlSN2ZABZiZ5h/kpZP3qbexgyOTDqvVwysdR3AsD/L/qlLc0L4Lh/kmokqAYdyxM2Q1u4UccmWsvmY9uVISMrZWcGLhv8zDGOILYc7CxbrUEv49X/vTsAyGeG7swKgsDDff940b3ewa1/5zssTlNTVRn1d/zmCOLivcpIvNg2u6OLKD10KQWHMpCY63OKBrWYDlP54lM3dWVu7iyPUZ1sVHYzfJSW+mbChLcSvAB2HA8zzw+THq/vVwfs5td72XjXnS4xjmLoeNeKxf7Psuci8LPX8gZ1luKihz1QUSleZa/XhznJ7+NjZuLH2JesEIpHBxedwrr4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 09:08:46 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 09:08:46 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH v8 1/1] tests/intel/xe_exec_system_allocator: Add
 pat-index-madvise
Thread-Topic: [PATCH v8 1/1] tests/intel/xe_exec_system_allocator: Add
 pat-index-madvise
Thread-Index: AQHcJ/dJk4991v2+GkG+e8x+d1ZN/LSXxeoAgAEzHICAAT9SEA==
Date: Fri, 19 Sep 2025 09:08:46 +0000
Message-ID: <BL1PR11MB5525A54298FF3758D401088F8411A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250917171941.3025392-1-nishit.sharma@intel.com>
 <20250917171941.3025392-2-nishit.sharma@intel.com>
 <85ecs4kgup.wl-ashutosh.dixit@intel.com>
 <20250918135941.ojqfvsey656e7oxs@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250918135941.ojqfvsey656e7oxs@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7641:EE_
x-ms-office365-filtering-correlation-id: ff8e0495-6a84-4e3d-d40f-08ddf75c2388
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OHNxd3BBK3l6eFo3Nk51QUZYdnF2WVhab3JRRVhHL3N2dVA5VXd1NDFncnJ4?=
 =?utf-8?B?ZHNEbDdweHVZQ3o1aDlFMmQ0d05GTjYxUk4xbTErQ3R1bTR5MCtWdHVBajhx?=
 =?utf-8?B?RzhXeTRxeFlDcUM3OHdnZlFZRVQzR1Q2a1BFMTRSUUp2RnZrUUdQazh4R3Z2?=
 =?utf-8?B?cyszWUdURjVtUlZZWGI5NnVQbjRvTXo3TnlrTjRkUHA3czNaRXVrWkNzeWFm?=
 =?utf-8?B?NGxmV2piWFNseTJ6NW5lYXJzNGZWWjhqMytoVWdua1U2bi9jdHZydStReDlm?=
 =?utf-8?B?SGJ0cXRDU2U2enptbnluazRPVXV3M0o4WXJBczM2bXBSb1dBUWhZU3U2OXAx?=
 =?utf-8?B?K1c4Z1hXUThSTXFFL0NUQ0U1V0VGZ1FPd3ZOVTJTSiswR2wyeHowdWl2cmxN?=
 =?utf-8?B?QXZOOTJ0THlXMTIwRDFJK2E5YytWbHNVbE9nN1dKTWpFcDYyZlZzSGt2ZEl3?=
 =?utf-8?B?RVpFaDBFMFJOWkNrenpoWDRyeDBTNUxycVFpTzhNcjIrTWRFZTVCU0ZyWGo0?=
 =?utf-8?B?R1hOSE5tZUJRbTVRSytqUm5zZVViejcrVVROYUJMNGFmQlRnOWJ5K2IxZThv?=
 =?utf-8?B?eG4xTmpPbEdOM3p6Z2Z5TU1iVEVwNVJyQmkzaXJHdkVBZmlJdDEreUtSK00r?=
 =?utf-8?B?SkVGeVFjY1hWWWREZ1h6TkVhRTFubUxlb1ByYUNnMXNPM1ZmSUcveDFmd3JE?=
 =?utf-8?B?RC9sOG9XcGgveVF0WVhBZGV2Tm0wV3pnZnhZWkNsQm5rZ0E0cGRLNUx3Rnli?=
 =?utf-8?B?d0tFSUw4Qzh3eEVuK2g4ZS9XRkZOTTY2a2g5Y05VTjBCbHdaSk9YRGFQNkNC?=
 =?utf-8?B?SGIxTUthL1AvQjMxZjFnK2VSUUgxZ1RNaHppdG1seGF2S0lRaVM1SVd6aWts?=
 =?utf-8?B?aWcwS0dWTGhWaFVEV3ArQllzSGc4MVNxZzVXZ1R5RkMxQmtBdVFMSEZEcFhF?=
 =?utf-8?B?VFp2NUJSN2piZ3VGZ3UwQm9qTU95amtWVWRmTWxiSU42MVN4Y3dVWFltS0RL?=
 =?utf-8?B?T0FHbGFEWURObmZodG1WM2lzZDJmQUJKWFR1Zzhpd3d5N2x4OGMzcTlxaFpj?=
 =?utf-8?B?SkRmSWp6V25iWVV6bENMaDFQNmJrVmgwNWh5MGNQNjdEWjFuVVZkMXVsMzhp?=
 =?utf-8?B?MjhrRWRxeVFiRUdBQk9sSzVRdFBCSjhjN09TYW04UDkyRFpybnpXZlpjb1U4?=
 =?utf-8?B?dklGSFNNUVZId0RoZ0dIRE9NV3Z6dzZacWt5aW9xRm1Wb0tEMGRHK2k4RGNo?=
 =?utf-8?B?c3V0eTk5ZUpKbkVBcTRsTzhSU1RIbGc3ZFZRTGFhbCtFc1REZlNVcTFwdkdP?=
 =?utf-8?B?Q3BEWG5iQUJEUjNPbXhzZkVHbVZWMlRiMzVTRG1CaGQzY1pOSmlMeUZPcG9W?=
 =?utf-8?B?dGd6T295Yy93ckJzUStmUjdCNkFTMzdJb2txYUFnNS9xWlVmN2NDOFlEVmwr?=
 =?utf-8?B?T2phV3cyV0hhMndHYUo3TWg2V2dSbUNlZjFRZGhEakYxeUZZcEFnRlJPaGFK?=
 =?utf-8?B?Mk81aW9sUDZtcmJSMEJWNjhwQTZyanAyV1I1OExOMmpqTzY1UXcyaVA4ektH?=
 =?utf-8?B?WkZybWkyTW1VWWFWM0d5T0dzbmV2ZjlaRFRsbDZSSFpKQThLWGJtZXFtS0I4?=
 =?utf-8?B?UlJOTHJSdHhqbDd0Y2xTSlZDL1A4amdpTGVhY2lKODBQUkhoNHdxdEdnVXc0?=
 =?utf-8?B?bTVseDNTbis0YnUzOERDSFZudms0ejV2K3I3Q2txQ1JCdi81VStEbWc4Nlcz?=
 =?utf-8?B?QldvcWRsMFltUnVBeTVXN3I0bmE5L3B0cmJ6dk1LdWFDRGZnS3FickpMYlND?=
 =?utf-8?B?NFFLYWRrbWx6eVBYRHpNQlllU2tKZStwa0gwaXBnMURqdndUbDNzcnQ2eHpO?=
 =?utf-8?B?QlFKbFg0bWs5RitLemg3eHo2V0lWTFJOY3pFcWk2NnJJTjlrSXpXWUFURXg4?=
 =?utf-8?Q?VxXwppJUBcsjxKcJci2f/KFspIkJCrbT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjY5MXJQTEhHZlU1ejlKMWlYMVRsOUdTRG55bjRIY1hpeDhZNUpYVDEvVVM3?=
 =?utf-8?B?dXdxQjJ0bHdTcm0yd1hTSGRIaTF1SjNKbG8rSUZxdGlXTjJnb0FaTmFRQkt4?=
 =?utf-8?B?UC9sOVBUV3hDVHZTdDNMajRzU2JGbVBCNEpuVld5ZVBQamVnekZnYUVYNDhT?=
 =?utf-8?B?anhaYmsrMWxuNTJWYzkxelV2ZDRUZUplK3czV3FRa1lrbmphOW1adk9aUkNp?=
 =?utf-8?B?VHlIWlZjQkpVMisvTFdMRk8xQzRKNVZpV1d2Z3RGYU1aOVVBa0cvbC96Vm5o?=
 =?utf-8?B?OHR6UkVQK3BVQllNQ0JtTnl5aS9DdEZwZWtZNzYrYjRlYVlnNjFlaTNCUjRl?=
 =?utf-8?B?c0FFYzVPVEVpck10OGp6a1dsYkxmeHloQ0NsUUdiWU1rc0xucjUvODl5VmM0?=
 =?utf-8?B?bzZ2WE9qNlFlejJSTEZ2YzZmYXJzZE8yM1gwYUd4a1IwV3RkeDlvV2pMbWJz?=
 =?utf-8?B?cHQrRFp1M0p2aG9pQzE3dnlSYkxWN2NXMTczYkNBRXlranB6T0FRQlExRlM5?=
 =?utf-8?B?WVhOcEUrb0FYaTVRMlJvKzdZQmFuR1l3Y1VPYVE2UWtBNkJOeTRYOXN6MVhn?=
 =?utf-8?B?VGZxZVJFdTFtL0FlbVBSTVhSQmJEK3dkS2x1SmcydUtVNG5laW5HVmpxQjQ3?=
 =?utf-8?B?WEkyK00yUjRTd1AxUGlSWVJBYjhxQ21HaFVvUEp0OHdMU2F6ak9wYjhQelhl?=
 =?utf-8?B?UTdweEZKQ1FPcXYwbFZsS2hNYkNUdjNNNmJucTBwWmNjZ0l5Z2RQckFYNGh1?=
 =?utf-8?B?ZTVXdGNscVViYWN0eEJ1SjAwZlBQL0h3OHNBSFVFNFcxK1ZvVXphaVZvUTBS?=
 =?utf-8?B?UDNWUGNQMTVzSDNMRHFUelU5Qmx3cGJ1UnJqbXJJRDJFOHdXLzMxV0JDT09I?=
 =?utf-8?B?RlBzTXZwK0xGSFBIWS9xeVBFSllWWGJvOUwxVllEbXhRT0tTQlh6ekQzKzM2?=
 =?utf-8?B?M0FXNisvQ21KYkJvbDRlaFQxYmtqUjJPOTZ2bndXVWRHRnFNcmU5UGdPdU9v?=
 =?utf-8?B?cWt5VjlCV3VHM0FNYTZXczBIWnYyOG5WTkltUEdaRmxMYmpSVmZ1UzVMdjYv?=
 =?utf-8?B?ODhyaHFONnZRQTEwTDY1dCtMaTIrZGh6TTZCNWd0Nm1WYm00c2dPakpLc001?=
 =?utf-8?B?clBVdUpPbTV4dzBvcjh3bVJUUC9IVmt3MkhZRk9xWjZMN3NZTS9OVVRCcXFX?=
 =?utf-8?B?Yzc1S3Z4VWNnakI1MG9xODJ2YVdiVkh3U2FUNSs3bEpJYzkvK1dQcGxmNDZ2?=
 =?utf-8?B?Y1B2YnNNSDNSazFicjd0eHF1SEtjRVkybE5LTVpNbkx3SVNVRU5SYkc1dFNl?=
 =?utf-8?B?a2c2ZTdINUQ2SU9sVFF1eXJ6UU9LK3Jud25UclNocDVFQzNpNVpFNW8xNEFB?=
 =?utf-8?B?WlVmcTJNem43eVkvdmVZZDUzQ3ZxQ3V0VVlxZ05RTjRwNWtQYVc1RWJJN0Iz?=
 =?utf-8?B?Qko2T21JOTY5TUoxUTZPeU5xVTZwUGM3aVoxS21oOFVWZGt5eE53WWNTQ2hX?=
 =?utf-8?B?dFNHamRTQVJNY1hPWnR1ckpnY0ZjREcreThETk1MajA1ejN5b3FRc2dWZklM?=
 =?utf-8?B?cXNQTmJYVVljYnpRL3QreU91MnZKWXBSUXhXakZ1WWxNampJbmtWMEtaaVRM?=
 =?utf-8?B?cFpmTy9NNnQyU2hSYXhqTjJRMi9FRkc4cmdxVWo0NW4ydElidkhyQmg0RGFL?=
 =?utf-8?B?NDVwQWVudXlYSXQwWjlOSHl6TDFyZlBvdkJWMC9WYW1GS0VPVVJ5eG1URDRT?=
 =?utf-8?B?cy9pd2oyaFJRNkVHZW1BMWJGWUNPNElhZlI3VHU2QXQ5bDVmSEFLdDV1b0hD?=
 =?utf-8?B?Vkc2QUgraFJrTllPR1RPUXc0QUE1aXcvYjN5a2ltSHRzSDJHSkhiWGlFcktq?=
 =?utf-8?B?MWwxUWxRYnhlbS9KVXc0ZXdKb0U5V0RVVm5MQTljc1QzL25RNEhTTzRHQkxU?=
 =?utf-8?B?K1ZpUFNrSjlmbUhoL1U5T1pkLzVUNjJIOEl1Q0RURWFuMHEyd2ZUcENQejlC?=
 =?utf-8?B?THVlYTZkY1d4TFN3ZFJTQTBKa290dlE2czJTNG9vcUNCY25rQzBaTzlzMGFo?=
 =?utf-8?B?dGZOVHVyak1iM2xQWVhEeUIvK0RrMmdxMEx1VlIwMjlERVlUMmZiOTVyRkRk?=
 =?utf-8?B?V3JTRFVlV1E1N2xXZUlSOUxIQTUrUC84bHF4Mlc4TUNnek1kaGVQQy80MDh4?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8e0495-6a84-4e3d-d40f-08ddf75c2388
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 09:08:46.0953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /TrNPUrE2YWczcjme61WvN2o/v/WrCjJwnIUZz4SLFkOPIUiCMZcAQzhxJu47fIQ4HFxDs0PUqJ6CpBkKpYMG8N+zr8gWwZWvDhnCGiNcB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2Vw
dGVtYmVyIDE4LCAyMDI1IDc6MzAgUE0NCj4gVG86IERpeGl0LCBBc2h1dG9zaCA8YXNodXRvc2gu
ZGl4aXRAaW50ZWwuY29tPg0KPiBDYzogU2hhcm1hLCBOaXNoaXQgPG5pc2hpdC5zaGFybWFAaW50
ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IEd1cnJhbSwgUHJhdmFs
aWthIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT47IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQN
Cj4gPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+OyBLb25pZWN6bnksIEthbWlsDQo+
IDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDEv
MV0gdGVzdHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yOiBBZGQgcGF0LQ0KPiBpbmRl
eC1tYWR2aXNlDQo+IA0KPiBIaSBEaXhpdCwsDQo+IE9uIDIwMjUtMDktMTcgYXQgMTI6NDA6MzAg
LTA3MDAsIERpeGl0LCBBc2h1dG9zaCB3cm90ZToNCj4gPiBPbiBXZWQsIDE3IFNlcCAyMDI1IDEw
OjE5OjQxIC0wNzAwLCA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4NCj4g
PiA+ICsJZm9yIChjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqcyA9IGludGVsX2dldF9wYXRfaWR4X2Z1
bmN0aW9uczsgcy0+bmFtZTsgcysrKQ0KPiB7DQo+ID4gPiArCQlpZ3Rfc3VidGVzdF9mKCJwYXQt
aW5kZXgtJXMiLCBzLT5uYW1lKSB7DQo+ID4gPiArCQkJaWYgKChzdHJzdHIocy0+bmFtZSwgIm1h
ZHZpc2UtcGF0LWlkeC13dC0iKSB8fA0KPiA+ID4gKwkJCSAgICAgc3Ryc3RyKHMtPm5hbWUsICJt
YWR2aXNlLXBhdC1pZHgtdWMtY29tcC0iKSkgJiYNCj4gPiA+ICsJCQkgICAgICF4ZV9oYXNfdnJh
bShmZCkpIHsNCj4gPiA+ICsJCQkJaWd0X3NraXAoIlNraXBwaW5nIGNvbXByZXNzaW9uLXJlbGF0
ZWQgUEFUDQo+IGluZGV4XG4iKTsNCj4gPiA+ICsJCQl9DQo+ID4gPiArCQkJeGVfZm9yX2VhY2hf
ZW5naW5lKGZkLCBod2UpDQo+ID4gPiArCQkJCXRlc3RfZXhlYyhmZCwgaHdlLCAxLCAxLCBTWl80
TSwgMCwgMCwgTlVMTCwNCj4gTlVMTCwgcy0+ZmxhZ3MsDQo+ID4gPiArcy0+Zm4pOw0KPiA+DQo+
ID4gSSB0aGluayBpdCBpcyBhbHNvIHBvc3NpYmxlIHRvIGFkZCBhICdpZ3RfcmVxdWlyZSh4ZV9o
YXNfdnJhbShmZCkpJyBpbg0KPiA+IGludGVsX2dldF9wYXRfaWR4X3d0KCkgYW5kIGludGVsX2dl
dF9wYXRfaWR4X3VjX2NvbXAoKS4gQnV0IGFueXdheSwNCj4gPiBpdCdzIG9rIGFzIGlzIHRvbywg
c28gdGhpcyBpczoNCj4gPg0KPiA+IEFja2VkLWJ5OiBBc2h1dG9zaCBEaXhpdCA8YXNodXRvc2gu
ZGl4aXRAaW50ZWwuY29tPg0KPiA+DQo+IA0KPiBZb3UgYXJlIHJpZ2h0LCB0aGVyZSBhcmUgb3Ro
ZXIgZmFpbHMgb24gLXVjLSwgZGVzcGl0ZSBDSS5YZS5GdWxsIHNob3dpbmcgZ3JlZW4sIGluDQo+
IG1haWwgYm9keSB0aGVyZSBpcyBuZXcgdGVzdCBmYWlsIG9uIExOTDoNCj4gDQo+ICoge2lndEB4
ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3JAcGF0LWluZGV4LW1hZHZpc2UtcGF0LWlkeC11Yy1tdWx0
aS12bWF9DQo+IChORVcpOg0KPiAtIHNoYXJkLWxubDogICAgICAgICAgTk9UUlVOIC0+IFtGQUlM
XVsxXQ0KPiBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lH
VFBXXzEzNzc0L3NoYXJkLWxubC0NCj4gNC9pZ3RAeGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yQHBh
dC1pbmRleC1tYWR2aXNlLXBhdC1pZHgtdWMtbXVsdGktDQo+IHZtYS5odG1sDQo+IA0KSGkgS2Ft
aWwsDQoNCnd0LCB1Yy1jb21wIGFyZSBjb21wcmVzc2lvbiByZWxhdGVkIHRlc3QgY2FzZXMgdGhh
dOKAmXMgd2h5IHRob3NlIG5lZWQgdG8gYmUgc2tpcHBlZCBmb3IgSUdQVSdzDQp1Yy1tdWx0aS12
bWEgaXMgcGFzc2luZyBhbmQgYWxzbyBsb2NhbGx5IGFsc28gSSB2ZXJpZmllZCANCg0KZ3RhQERV
VDQwODZMTkw6fi90ZXN0X2ludGVybmFsJCBzdWRvIC4vYnVpbGQvdGVzdHMveGVfZXhlY19zeXN0
ZW1fYWxsb2NhdG9yIC0tciAgcGF0LWluZGV4LW1hZHZpc2UtcGF0LWlkeC11Yy0qDQpJR1QtVmVy
c2lvbjogMi4xLWc5OGY3Yjg5YjIgKHg4Nl82NCkgKExpbnV4OiA2LjE3LjAtcmMzLW1hZHZpc2Ur
IHg4Nl82NCkNClVzaW5nIElHVF9TUkFORE9NPTE3NTgyNzI4NzQgZm9yIHJhbmRvbWlzYXRpb24N
Ck9wZW5lZCBkZXZpY2U6IC9kZXYvZHJpL2NhcmQwDQpTdGFydGluZyBzdWJ0ZXN0OiBwYXQtaW5k
ZXgtbWFkdmlzZS1wYXQtaWR4LXVjLXNpbmdsZS12bWENClN1YnRlc3QgcGF0LWluZGV4LW1hZHZp
c2UtcGF0LWlkeC11Yy1zaW5nbGUtdm1hOiBTVUNDRVNTICgwLjA1MHMpDQpTdGFydGluZyBzdWJ0
ZXN0OiBwYXQtaW5kZXgtbWFkdmlzZS1wYXQtaWR4LXVjLW11bHRpLXZtYQ0KU3VidGVzdCBwYXQt
aW5kZXgtbWFkdmlzZS1wYXQtaWR4LXVjLW11bHRpLXZtYTogU1VDQ0VTUyAoMC4wMjZzKQ0KDQpo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMzc1My9zaGFy
ZHMtYWxsLmh0bWw/dGVzdGZpbHRlcj1wYXQtaW5kZXgtbWFkdmlzZS1wYXQtaWR4LXVjLW0NCg0K
c28gd2UgY2FuIGlnbm9yZSB0aGlzIGZhaWx1cmUNCj4gTmlzaGl0IHBsZWFzZSBleHRlbmQgdGhp
cyBza2lwIGFjY29yZGluZyB0byBBc2h1dG9zaCBzdWdnZXN0aW9uLCBhbmQgdXNlDQo+IGlndF9y
ZXF1aXJlKCk6DQo+IAkJCWlmIChzdHJzdHIocy0+bmFtZSwgIm1hZHZpc2UtcGF0LWlkeC13dC0i
KSB8fA0KPiAJCQkgICAgc3Ryc3RyKHMtPm5hbWUsICJtYWR2aXNlLXBhdC1pZHgtdWMtIikpDQo+
IAkJCQlpZ3RfcmVxdWlyZSh4ZV9oYXNfdnJhbShmZCkpOw0KPiANCj4gUmVnYXJkcywNCj4gS2Ft
aWwNCj4gDQo+ID4gPgkJfQ0KPiA+ID4JfQ0KPiA+ID4NCj4gPiA+IC0tDQo+ID4gPiAyLjQzLjAN
Cj4gPiA+DQo=
