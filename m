Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD5ED339AA
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 18:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BEC10EB78;
	Fri,  5 Dec 2025 18:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zgcf7U25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE76B10EB78
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764958037; x=1796494037;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nibz14KWJJvATEz4/Q5PeTusrm+s/cEJhH2yoZuXyyw=;
 b=Zgcf7U25gN+iUWtiRWvnMA91YNntDtFgQHKFXCZqXuZBF4SGRHgNR42r
 OU/QwmbmhbZxrSQfmxmBRPsisNFANQKBcNv1gR5jBLcrXOMSqjK6kUzpP
 fVB5aDd8OhQynrx1M3ZcppAvutLyJVxjYIxm29CF82vKhHCuwIhnNM7cq
 P8mO/E58lGUtbF1pZIiAF/woujIR2AzhUC0Lwd9XLRuqyyagdqAzw8HKz
 6nKNCkwnCWHZg+yiANs3/zz1QOpNYSoCnmpoLNN7LzC3edvOw8CWiriQI
 fTokj21G8hf25pyd5AxXPZ3l1XfOnHOBUUoz0AZNCSuFn9rGd8yI/nvTg A==;
X-CSE-ConnectionGUID: C8GG8Qg5TvufrSa4pXlTZQ==
X-CSE-MsgGUID: Nz4HKo14RnW/WJT/T9/OoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66892512"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66892512"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:07:16 -0800
X-CSE-ConnectionGUID: IfFDaq0wSHOEOXGrcEDXdQ==
X-CSE-MsgGUID: LLt6ERThQFGEWXjo44lhuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194656136"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:07:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:07:12 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:07:12 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:07:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AA+ALWMdywauARSuzje3IyPdaIIopX++QX++H+TIXzQqS7xlc1t8UnmZb+wqzmkxFhNOJkazEifxZQdvc8fB1Jz3ka734Ci+3yOJAgxXxOqLakLeFkBPl+sRL8I/yHFk4KdEF+7/1LqkAfbYCqlr+0kgCUctqBDGKUEisaAlYs2GtpYOCeSHdASXfMu2FKNibdrgbjrVWTvWnj1uRxsNktp1oBO5r4ovM28CQMtcUCPn2d7n65qn8awRNTNCoueBsNGkhq/o9oVzqIoh9Z+ZC7/E8W25fhbCsl+o48os7vVf3aXI5PAxGmHa7ixI989zaXJNd6bPV+OTW/6nYcEufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nibz14KWJJvATEz4/Q5PeTusrm+s/cEJhH2yoZuXyyw=;
 b=y7keyD7yZi83COwn5gD1N1WeBuB2FTqNmT2SENYFFYrKS9jidzO9lmsHKCp2eXeJWBi3yYocWpfHxDffRkPaApeym/GRo4M3RK7mJ7PxlhtLHLbZTreCFScF5+Z9ttsIJjFK/xIt31gUtRVg+T9zoYDpvIxtDKqyNzGh9ii7NrkXYllROQsgfAGaCEU3hVhfCvjJlpJUheID5xS7f98YeOByWxIvUc2EuxToz6rnZckZk9PW/QT6WXqxobsvKOyhSXTr8xXZ+2Wp7ODDbL6H0sEu43gdRQcNMK+PrzPQ+2gSRfAwBc9sRjfUPGXLDa+7sOMW7ZmQPUzzl+cH4FaZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BL4PR11MB8798.namprd11.prod.outlook.com (2603:10b6:208:5a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:07:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 18:07:08 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 01/19] drm-uapi/xe: Sync with Multi-Queue uapi
Thread-Topic: [PATCH v2 01/19] drm-uapi/xe: Sync with Multi-Queue uapi
Thread-Index: AQHcWpr8bqcjGLSikkauisj/PseKy7UR8LAAgAAbeYCAAWKQgA==
Date: Fri, 5 Dec 2025 18:07:08 +0000
Message-ID: <03e02df978dfd3365142c47b00509f9d3a1d3b21.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-22-niranjana.vishwanathapura@intel.com>
 <a82e101a4dc3c5760195ce3b851c0fb82e24c3bd.camel@intel.com>
 <aTH13bX0hd9pvGZe@nvishwa1-desk>
In-Reply-To: <aTH13bX0hd9pvGZe@nvishwa1-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BL4PR11MB8798:EE_
x-ms-office365-filtering-correlation-id: 92491d5f-bcea-4f9f-1931-08de34291b3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?THE5ZXN6UUd5NkFBaG04SzNWTmkvM2taanBYSnpkb3UvRTQ2UmpuNFA2Mnd1?=
 =?utf-8?B?bm9va0xmK2s1RW5FVXU5S0FUSWk3RTZaRmVuL2RkeGxpZUFrbDVTQ1M5bGpG?=
 =?utf-8?B?dDBvUDNTc2NldVlhcmF5QnpmUzA0Mmg0anJTVGxtclk3bFhQOUV5WGdDNWRq?=
 =?utf-8?B?UW1uaVg3WW5qelF0ZEQ5Rk5OU3Y2VjNnampjL3VMZzEvK0pMWjNaWXE5cE9P?=
 =?utf-8?B?R2Z5TXdVVy85QmVYeGMxdWtxb3ZRVE1JREFUYTF3eVd1N2F0WXRNdnBWbTRj?=
 =?utf-8?B?ejR3Nko5L2hBeUxucDRPOXpkWTQ2LzhuVk1FSEVNY0U2M1BTZ1Z0Z29kWHF5?=
 =?utf-8?B?citlMWdFU2pram9MeUlwRHZHc09QMDRoTU1BQlNpalFEbnVEN1JlNHVHekZP?=
 =?utf-8?B?NVJMM3BRdGNBMGZPRUtJUjUyT0FTT2QweStTRjBIZ3VSNXlKaXlzWDVONSsz?=
 =?utf-8?B?Tk9QQkQ0V3dDZlBzdlo5SktlYVVYTkFjS2xjNzYzNDJUUHpvQ3FHS0loVlpP?=
 =?utf-8?B?RHlBZVppTHliOUpTUURDeWMrVWFRNzU2dGJoUWVsY0hhMHRHemRFRHlWd2xi?=
 =?utf-8?B?NUxhS2xPQnVJaWxHL3JEY0dsN0VTUGthRjk3RVNqYlFtVHVTZzZaNnhqVHZn?=
 =?utf-8?B?L29WNFMvU2ZjR1E1M1NpMUVCVGhQS0NNMWxpL3pSQ3k5bWpyTmU2S3JERXVL?=
 =?utf-8?B?Wmhyc1BjaGN5azRSbURPWDlCajBhdVYzQ3JURG1HaXdDQmN3L0IzWVo4NVYy?=
 =?utf-8?B?OTFDdFNRRysxcDYwcUpIUGdnVjgycjBnSDVHRjUydjZaRUN0clZuWXVjZWRH?=
 =?utf-8?B?aVlUVDIrTElmam1zbm5GMGhGWGNJWmpzdVhERE1kMWF1aTFFL2tUNnI3ZzAz?=
 =?utf-8?B?aVRoRStJb0hHSU5pSzM5b3NyRU50WTlOblNmamZBSHNMaW1SQlVDaWpmU2tn?=
 =?utf-8?B?VXVaTzk3TGlUeGxZZmEvc080TTB0MlQrTFhuMy9XVjI3cDg5eGJpUnZ6VWQ2?=
 =?utf-8?B?ekYvQldMS2l1bkE1UW1qMXVTbis1eDFUaTFXcW5SNk03b0R3dnJOc0RqKzJV?=
 =?utf-8?B?Y1JqaC9sNENvSlNxNFdCSWJWWTVIMy8wZlNTSlhzd1FwZys1YXFRTnJ1SnU4?=
 =?utf-8?B?YnZJeTZ2LzdUMnc3T2xDWXVCUXNQTnlqN2s4ZXJHeVNNZDFVanVkUytVeDFk?=
 =?utf-8?B?Y0U2bFlJd1hpdGZwR25tZWpOeUNoejNBMTl0cndIa1FBd3RMU0xXRjlzS2Qy?=
 =?utf-8?B?dFFQWS9YaVhzOFl2bStEQ3lyZlhVTEJHRE56aHdqOXgvSDlXV3dEdmVZS0Yw?=
 =?utf-8?B?Q3UyaXVsaFdEdG12eC80cDI3SzU3MmVzYlhRb1YrS29JTy8wUVQxNEV2V205?=
 =?utf-8?B?RXhNNTg3T0c3OS8waVhNZ1IyYUsyZUo3ZE10N0FnR0pvU1BBZmhwL0k3U0E0?=
 =?utf-8?B?NEhqMkJYSFJSY1NrMjRtRWc0TmFvaEpheGY5cVBrNnJRK3g4Yzh0dXIyRGkr?=
 =?utf-8?B?YUZ2VVVvU05GQ1Mwb2phYXlTNVYrNmVxcldIcGJMc1NFOGluOVJIY05Jbmdx?=
 =?utf-8?B?UTFTMVhUcjRGSWNxT1hDR09raUEvRjZBb3RaQlRPRVJXTmxEL204UCtzNGk0?=
 =?utf-8?B?Y2U4bS9PeEJCRk5aWGtyRWR4cFNzTEJOcFhTRzhlbnRBclB6SkVKWCttUk9h?=
 =?utf-8?B?NVVQVzlvcGd4UWNnVTlaUFJCaENqdWIvWkI2ckhuWkgyWURuWjgwMm1KRVkv?=
 =?utf-8?B?SXJJZkFRd21pT3kvRFNWUFhFbjUrdmRRS3lvVkdWTmNaUjRiUTErKzd2UWwz?=
 =?utf-8?B?SEt2dnlSNVIyVk5kWTNoUkdKOWx4YWt2N2hlQ01MOG90NEtuWnVGN3k0Mmpm?=
 =?utf-8?B?QXJRbWdyd2p0a1pOQTE1eXBnRWZIekxEaGlLU3pmVmFWUEFCRDg1WkVOMnd5?=
 =?utf-8?B?SGNHaXZyTENqNzhlcWE0TnQ2R3lsSXVuQkJYZlRvQ2xqdnF5VFRIWnFGSzVQ?=
 =?utf-8?B?MFh3YW5hMk9ZaXpSY01pYktkN3hFREdTUllINTFtVWR0T0tMRURkRHlMbng0?=
 =?utf-8?Q?eIX/GN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnA1bGEyczJyT3VMMmd0ajlJRkRJUFFrM0traHJmMTZiaGJJVFZ2bmNKKzhC?=
 =?utf-8?B?UnNUOU1wRkNiamx6MDJ1RHV5TGZJZFIxbm5mZDZ5RWllbmlYbUlkeVZ1OStP?=
 =?utf-8?B?MGJ0V3ZvaEIrZVdIR2kzMExOaGdScDVUS2RrV1gvVHI4bEJrTVMvQk1EdDN3?=
 =?utf-8?B?WXlhdGJ5MzZQVUZEeVQxekZ3UGxYNWFlQ3pXT2QveXc3WXFTbDNWVWN6M0o3?=
 =?utf-8?B?SC9VQXBua1VXaTJleWVSdDdZK1NkYmJRbFd1cjliMUJTdFZ5b2N5RGt1TzZi?=
 =?utf-8?B?bThhUHdBRWxxUldqOVYvOGlJWFBabC80K2piczdUUWlxMUtRNlF4RjB4Mkp2?=
 =?utf-8?B?UmdVbUdJUDZzODlPbFZjZW9EUllPWUp2R1BxWjBmWmg1c3ZWNVhYVXlSRXJx?=
 =?utf-8?B?WHExM0pvL3NmZU90RmZ4NlhhRnJoendJbVdTMFdOempaSEdTb3hlbHNCeVE2?=
 =?utf-8?B?YzBBZFpISDVWZk1XQ0EzSW56a2txdGN6RU1SOFQ3RHNVQ0UzZ3RqWElFZ1hl?=
 =?utf-8?B?WDg0U1V2RWpoa0JtbzZKNDVLZ2YxdTZHTmxDR3RmRVZxaWREUmJXUitPcWY5?=
 =?utf-8?B?UlJoVG1OMjVIZ2lkaE9WdFl5WWVMeHJQcS9XWkl2N3FSZnNKbVRPZCtjc1ps?=
 =?utf-8?B?YVd6Y09QeEdwR0t2KzZGck4vdExCOVVNTWsxR2c3YnVIODFuVitxSEtvNENC?=
 =?utf-8?B?Ty9lR0N2TU01am5tR09zVnpzL3BmSlp6L2dTeDdPSDJJaTVYTnkrbHNhdTc4?=
 =?utf-8?B?cEYrbnlXK2d0UENwK0pPcUZWM0R1YzFVcjdvUzNRZ2NQTlZJeHBaZlFoaVY4?=
 =?utf-8?B?dzNXTFhBaEE2eDR3Ym5GNjNTLzQ1UTNDSE00bnIyRlhUYlRrRDk1dytHZUN4?=
 =?utf-8?B?RHVDbUd5TVBTelJtYkdpUjVBdzBibG4yekNxU25HUllzU2RPcktoQzljZEtX?=
 =?utf-8?B?cEZlUVMvRUppdHExeGpNZCsxOHFoZE9tUjlPaEtxZmZ6SFp4WEJzK0dpZEx5?=
 =?utf-8?B?eGxNZ2VlRitsM29lcHl5cnMrK01wSVVBUUU2ajZIZGtmU3ZSejRJbS9OUER4?=
 =?utf-8?B?TS9hOHI3ZWpHTVJZM2VVQjZjN0I5SjlRUENJVWI3RjJ6QzV6bUI3aHV4Qkpr?=
 =?utf-8?B?T2FDOERjVlZLcndad24wL2N3d0hEUE41MVVHN2U5NzFqUWp3YjlTeUVSZHlB?=
 =?utf-8?B?UUlJNlZpMDVnVGpRSis5V0g0YzQ3L1lyRGVIeXlTNjM4azQzbTRZeHdlcERk?=
 =?utf-8?B?aEcyQWFkdVNuNUl0dEFiQ09RMXRnWHJNdERsajdGa3RzRFY4TDVHUTJDRC9v?=
 =?utf-8?B?b3VJT25UL0VtY2Z2bHlwdlBnZWcxSmU1RW1vZlRSdzJETlVVTXJOOUZnbWZD?=
 =?utf-8?B?T3JjdU00VHM1NmFSTVdUN0E3czVTU2hMbm9tN0xXaTRQTVlKRmtNNkVXRS9Q?=
 =?utf-8?B?ejAzRVNvZGE3UmxVNVIzSUZOMkt4WWd0ZlNPVmEvYTlac2lDQlhHaFdYcit2?=
 =?utf-8?B?UU5KRUlidThlWWtEalEzUWNqZTVzaEFuc1ZFOEhSM3RVVFpYZkpUSWdVNmtx?=
 =?utf-8?B?K0kvYmZBZmZFS2NWbFdTdS9MMUtqKzhTRzJQaTZkL1FCYlQ5RmV5c1VNcFVv?=
 =?utf-8?B?bmxGTnlOamc4d1Nrckw4Z0FEMGRhNGdtRG1RM093OS84dmJlT1lvWlBCRTRh?=
 =?utf-8?B?N3NDSWpQRXQwdzB5RnNhMnk4K2IyVW4zbkVENHVubk5kS2RXRnM4TElkQWdr?=
 =?utf-8?B?SGZzMVlSRDgrU210MS9LWlF4aFdqT1JFYldPYk5jbkFlQ2tIZzJNUStpT1F3?=
 =?utf-8?B?Z2lFUTdrWE9MeGQ3NTlpN0VqMEJjb1NKWEdCT0JKOS91T0o2SXpMWmFwaHdl?=
 =?utf-8?B?MDcvQU5KTE01T3FIVWpDS1Btb0pkcEJrWkpUR1hKTDFtK1VPU3FVSThtRmZx?=
 =?utf-8?B?dGtqVWlhWjFEa1F3TkpIcXNycEFKQ0xNYys5b2JGTFBicXdrUVFxb00vU1Fp?=
 =?utf-8?B?cUZlQytIRWlqOFhOYmt2YTFqaXBiYURJRlM5MnAwT2dDNHpUaFFMZlFHZDhC?=
 =?utf-8?B?bEFHcGtDT2ZydnZrZDg0NTN4YnExak9wVksvdG1VSlI0STVQRXp1YmptbzNL?=
 =?utf-8?B?aHJkYlp3YmZIYVNoWktMR2NVZWhyMlQ0bFY1T0dBQnNVNS9ldU1GMmk4bkZI?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <411C4C764DB2A545BD36304CDE3727AB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92491d5f-bcea-4f9f-1931-08de34291b3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 18:07:08.7991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCdKPnlvKssTxWcYYdQRNKWB5Y9uh8Er1JMXvtACmZmxJBqnNGwdYDqQoo2UHf9hK9TxOm4fB9LmPEyFs+r1XTHNw4FFDft3DoM+qFi6tHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8798
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

T24gVGh1LCAyMDI1LTEyLTA0IGF0IDEyOjU4IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBPbiBUaHUsIERlYyAwNCwgMjAyNSBhdCAxMToxOTo0N0FNIC0wODAwLCBT
dW1tZXJzLCBTdHVhcnQgd3JvdGU6DQo+ID4gT24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0w
ODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIHdyb3RlOg0KPiA+ID4gU3luYyBrZXJuZWwg
aGVhZGVyIHRvIGdldCBNdWx0aS1RdWV1ZSB1YXBpIGRlZmluaXRpb25zLg0KPiA+ID4gDQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhDQo+ID4gPiA8bmlyYW5q
YW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgaW5jbHVk
ZS9kcm0tdWFwaS94ZV9kcm0uaCB8IDQwDQo+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykN
Cj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmggYi9p
bmNsdWRlL2RybS0NCj4gPiA+IHVhcGkveGVfZHJtLmgNCj4gPiA+IGluZGV4IDg5YWI1NDkzNS4u
ZDFjYjA4ZGM3IDEwMDY0NA0KPiA+ID4gLS0tIGEvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaA0K
PiA+ID4gKysrIGIvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaA0KPiA+ID4gQEAgLTEwNiw2ICsx
MDYsNyBAQCBleHRlcm4gIkMiIHsNCj4gPiA+IMKgI2RlZmluZSBEUk1fWEVfT0JTRVJWQVRJT07C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4MGINCj4gPiA+IMKgI2RlZmluZSBEUk1fWEVfTUFE
VklTRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDBjDQo+ID4gPiDCoCNkZWZp
bmUgRFJNX1hFX1ZNX1FVRVJZX01FTV9SQU5HRV9BVFRSU8KgwqDCoMKgwqDCoMKgwqAweDBkDQo+
ID4gPiArI2RlZmluZSBEUk1fWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFnCoDB4MGUNCj4gPiA+
IMKgDQo+ID4gPiDCoC8qIE11c3QgYmUga2VwdCBjb21wYWN0IC0tIG5vIGhvbGVzICovDQo+ID4g
PiDCoA0KPiA+ID4gQEAgLTEyMyw2ICsxMjQsNyBAQCBleHRlcm4gIkMiIHsNCj4gPiA+IMKgI2Rl
ZmluZQ0KPiA+ID4gRFJNX0lPQ1RMX1hFX09CU0VSVkFUSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgRFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsNCj4gPiA+IERSTV9YRV9PQlNFUlZB
VElPTiwgc3RydWN0IGRybV94ZV9vYnNlcnZhdGlvbl9wYXJhbSkNCj4gPiA+IMKgI2RlZmluZQ0K
PiA+ID4gRFJNX0lPQ1RMX1hFX01BRFZJU0XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoERSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArDQo+ID4gPiBEUk1fWEVfTUFEVklTRSwg
c3RydWN0IGRybV94ZV9tYWR2aXNlKQ0KPiA+ID4gwqAjZGVmaW5lDQo+ID4gPiBEUk1fSU9DVExf
WEVfVk1fUVVFUllfTUVNX1JBTkdFX0FUVFJTwqDCoERSTV9JT1dSKERSTV9DT01NQU5EX0JBU0UN
Cj4gPiA+ICsNCj4gPiA+IERSTV9YRV9WTV9RVUVSWV9NRU1fUkFOR0VfQVRUUlMsIHN0cnVjdA0K
PiA+ID4gZHJtX3hlX3ZtX3F1ZXJ5X21lbV9yYW5nZV9hdHRyKQ0KPiA+ID4gKyNkZWZpbmUNCj4g
PiA+IERSTV9JT0NUTF9YRV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWcKgwqDCoERSTV9JT1coRFJN
X0NPTU1BTkRfQkFTRSArDQo+ID4gPiBEUk1fWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFksIHN0
cnVjdA0KPiA+ID4gZHJtX3hlX2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5KQ0KPiA+ID4gwqANCj4g
PiA+IMKgLyoqDQo+ID4gPiDCoCAqIERPQzogWGUgSU9DVEwgRXh0ZW5zaW9ucw0KPiA+ID4gQEAg
LTEyMzMsNiArMTIzNSwxOCBAQCBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmQgew0KPiA+ID4gwqAgKsKg
wqDCoCBHaXZlbiB0aGF0IGdvaW5nIGludG8gYSBwb3dlci1zYXZpbmcgc3RhdGUga2lsbHMgUFhQ
IEhXRFJNDQo+ID4gPiBzZXNzaW9ucywNCj4gPiA+IMKgICrCoMKgwqAgcnVudGltZSBQTSB3aWxs
IGJlIGJsb2NrZWQgd2hpbGUgcXVldWVzIG9mIHRoaXMgdHlwZSBhcmUNCj4gPiA+IGFsaXZlLg0K
PiA+ID4gwqAgKsKgwqDCoCBBbGwgUFhQIHF1ZXVlcyB3aWxsIGJlIGtpbGxlZCBpZiBhIFBYUCBp
bnZhbGlkYXRpb24gZXZlbnQNCj4gPiA+IG9jY3Vycy4NCj4gPiA+ICsgKsKgIC0gJURSTV9YRV9F
WEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9NVUxUSV9HUk9VUCAtIENyZWF0ZSBhDQo+ID4gPiBtdWx0
aS0NCj4gPiA+IHF1ZXVlIGdyb3VwDQo+ID4gPiArICrCoMKgwqAgb3IgYWRkIHNlY29uZGFyeSBx
dWV1ZXMgdG8gYSBtdWx0aS1xdWV1ZSBncm91cC4NCj4gPiA+ICsgKsKgwqDCoCBJZiB0aGUgZXh0
ZW5zaW9uJ3MgJ3ZhbHVlJyBmaWVsZCBoYXMNCj4gPiA+ICVEUk1fWEVfTVVMVElfR1JPVVBfQ1JF
QVRFIGZsYWcgc2V0LA0KPiA+ID4gKyAqwqDCoMKgIHRoZW4gYSBuZXcgbXVsdGktcXVldWUgZ3Jv
dXAgaXMgY3JlYXRlZCB3aXRoIHRoaXMgcXVldWUgYXMNCj4gPiA+IHRoZQ0KPiA+ID4gcHJpbWFy
eSBxdWV1ZQ0KPiA+ID4gKyAqwqDCoMKgIChRMCkuIE90aGVyd2lzZSwgdGhlIHF1ZXVlIGdldHMg
YWRkZWQgdG8gdGhlIG11bHRpLXF1ZXVlDQo+ID4gPiBncm91cA0KPiA+ID4gd2hvc2UgcHJpbWFy
eQ0KPiA+ID4gKyAqwqDCoMKgIHF1ZXVlIGlkIGlzIHNwZWNpZmllZCBpbiB0aGUgJ3ZhbHVlJyBm
aWVsZC4NCj4gPiANCj4gPiBNaXNzaW5nIGRvY3VtZW50YXRpb24sIGFsdGhvdWdoIGNvbXBhcmVk
IHRvIHRoZSBvbmVzIGJlbG93IHRoaXMgaXMNCj4gPiBtdWNoDQo+ID4gbGVzcyBpbnRlcmVzdGlu
ZzoNCj4gPiANCj4gPiArICrCoMKgwqAgQWxsIHRoZSBvdGhlciBub24tcmVsZXZhbnQgYml0cyBv
ZiBleHRlbnNpb24ncyAndmFsdWUnIGZpZWxkDQo+ID4gd2hpbGUgYWRkaW5nIHRoZQ0KPiA+ICsg
KsKgwqDCoCBwcmltYXJ5IG9yIHRoZSBzZWNvbmRhcnkgcXVldWVzIG9mIHRoZSBncm91cCBtdXN0
IGJlIHNldCB0bw0KPiA+IDAuDQo+ID4gDQo+ID4gPiArICrCoMKgwqAgSWYgdGhlIGV4dGVuc2lv
bidzICd2YWx1ZScgZmllbGQgaGFzDQo+ID4gPiAlRFJNX1hFX01VTFRJX0dST1VQX0tFRVBfQUNU
SVZFIGZsYWcNCj4gPiA+ICsgKsKgwqDCoCBzZXQsIHRoZW4gdGhlIG11bHRpLXF1ZXVlIGdyb3Vw
IGlzIGtlcHQgYWN0aXZlIGFmdGVyIHRoZQ0KPiA+ID4gcHJpbWFyeSBxdWV1ZSBpcw0KPiA+ID4g
KyAqwqDCoMKgIGRlc3Ryb3llZC4NCj4gPiA+ICsgKg0KPiA+ID4gKyAqwqAgLSAlRFJNX1hFX0VY
RUNfUVVFVUVfU0VUX1BST1BFUlRZX01VTFRJX1FVRVVFX1BSSU9SSVRZIC0gU2V0DQo+ID4gPiB0
aGUNCj4gPiA+IHF1ZXVlDQo+ID4gPiArICrCoMKgwqAgcHJpb3JpdHkgd2l0aGluIHRoZSBtdWx0
aS1xdWV1ZSBncm91cC4NCj4gPiANCj4gPiBJIHNlZSBhIGxpdHRsZSBtb3JlIGRldGFpbCBpbiB0
aGUga2VybmVsIHBhdGNoIGhlcmU6DQo+ID4gDQo+ID4gKyAqwqDCoMKgIHByaW9yaXR5IHdpdGhp
biB0aGUgbXVsdGktcXVldWUgZ3JvdXAuIEN1cnJlbnQgdmFsaWQNCj4gPiBwcmlvcml0eQ0KPiA+
IHZhbHVlcyBhcmUgMOKAkzINCj4gPiArICrCoMKgwqAgKGRlZmF1bHQgaXMgMSksIHdpdGggaGln
aGVyIHZhbHVlcyBpbmRpY2F0aW5nIGhpZ2hlcg0KPiA+IHByaW9yaXR5Lg0KPiA+IA0KPiA+IFdo
eSBub3QgaW5jbHVkZSB0aGlzIGRvY3VtZW50YXRpb24gaGVyZT8NCj4gPiANCj4gDQo+IFRoZSB1
cGRhdGVzIHRvIHVhcGkgZG9jdW1lbnRhdGlvbiBvbiBrZXJuZWwgc2lkZSB3YXMgZG9uZSBhcyBw
YXJ0IG9mDQo+IHJldmlldyBjb21tZW50IGZpeCwgd2hpY2ggSSBmb3Jnb3QgdG8gaW1wb3J0IGl0
IGhlcmUuIFdpbGwgaW1wb3J0DQo+IHRoZW0uIEkgYXBwbGllcyB0byBiZWxvdyBjb21tZW50cyBh
bHNvLg0KDQpNYWtlcyBzZW5zZSBhbmQgc291bmRzIGdyZWF0LiBUaGFua3MhDQoNCi1TdHVhcnQN
Cg0KPiANCj4gTmlyYW5qYW5hDQo+IA0KPiA+ID4gwqAgKg0KPiA+ID4gwqAgKiBUaGUgZXhhbXBs
ZSBiZWxvdyBzaG93cyBob3cgdG8gdXNlIEBkcm1feGVfZXhlY19xdWV1ZV9jcmVhdGUNCj4gPiA+
IHRvDQo+ID4gPiBjcmVhdGUNCj4gPiA+IMKgICogYSBzaW1wbGUgZXhlY19xdWV1ZSAobm8gcGFy
YWxsZWwgc3VibWlzc2lvbikgb2YgY2xhc3MNCj4gPiA+IEBAIC0xMjczLDYgKzEyODcsMTAgQEAg
c3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX2NyZWF0ZSB7DQo+ID4gPiDCoCNkZWZpbmXCoMKgIERS
TV9YRV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9QUklPUklUWcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAwDQo+ID4gPiDCoCNkZWZpbmXCoMKgIERSTV9YRV9FWEVDX1FVRVVFX1NFVF9QUk9Q
RVJUWV9USU1FU0xJQ0XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDENCj4gPiA+IMKgI2RlZmlu
ZcKgwqAgRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZX1BYUF9UWVBFwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoDINCj4gPiA+ICsjZGVmaW5lwqDCoCBEUk1fWEVfRVhFQ19RVUVVRV9T
RVRfUFJPUEVSVFlfTVVMVElfR1JPVVDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMw0KPiA+ID4gKyNk
ZWZpbmXCoMKgwqDCoA0KPiA+ID4gRFJNX1hFX01VTFRJX0dST1VQX0NSRUFURcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMXVsbA0KPiA+ID4gPDwg
NjMpDQo+ID4gPiArI2RlZmluZcKgwqDCoMKgDQo+ID4gPiBEUk1fWEVfTVVMVElfR1JPVVBfS0VF
UF9BQ1RJVkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMXVsbA0K
PiA+ID4gPDwgNjIpDQo+ID4gPiArI2RlZmluZcKgwqAgRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BS
T1BFUlRZX01VTFRJX1FVRVVFX1BSSU9SSVRZwqDCoDQNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAv
KiogQGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsDQo+
ID4gPiBpZg0KPiA+ID4gYW55ICovDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgX191NjQgZXh0ZW5z
aW9uczsNCj4gPiA+IMKgDQo+ID4gPiBAQCAtMjI1NCw2ICsyMjcyLDI4IEBAIHN0cnVjdCBkcm1f
eGVfdm1fcXVlcnlfbWVtX3JhbmdlX2F0dHIgew0KPiA+ID4gwqANCj4gPiA+IMKgfTsNCj4gPiA+
IMKgDQo+ID4gPiArLyoqDQo+ID4gPiArICogc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX3NldF9w
cm9wZXJ0eSAtIGV4ZWMgcXVldWUgc2V0DQo+ID4gPiBwcm9wZXJ0eQ0KPiA+ID4gKyAqDQo+ID4g
PiArICogU2V0cyBleGVjdXRpb24gcXVldWUgcHJvcGVydGllcyBkeW5hbWljYWxseS4NCj4gPiAN
Cj4gPiBXaHkgbm90IGluY2x1ZGUgdGhlIGJpdCBhYm91dCB0aGUgbXVsdGkgcXVldWUgcHJvcGVy
dHkgYmVpbmcgdGhlDQo+ID4gb25seQ0KPiA+IG9uZSBoZXJlPw0KPiA+IA0KPiA+ICsvKioNCj4g
PiArICogc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eSAtIGV4ZWMgcXVldWUg
c2V0IHByb3BlcnR5DQo+ID4gKyAqDQo+ID4gKyAqIFNldHMgZXhlY3V0aW9uIHF1ZXVlIHByb3Bl
cnRpZXMgZHluYW1pY2FsbHkuDQo+ID4gKyAqIEN1cnJlbnRseSBvbmx5DQo+ID4gJURSTV9YRV9F
WEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9NVUxUSV9RVUVVRV9QUklPUklUWQ0KPiA+ICsgKiBwcm9w
ZXJ0eSBjYW4gYmUgZHluYW1pY2FsbHkgc2V0Lg0KPiA+ICsgKi8NCj4gPiANCj4gPiBBbnl3YXkg
dGhlc2UgYXJlbid0IGZ1bmN0aW9uLiBGcm9tIG15IHBlcnNwZWN0aXZlIGl0J3MgbW9yZSBuaWNl
IHRvDQo+ID4gaGF2ZSB0byBhbGlnbiB3aXRoIHRoZSBrZXJuZWwuIEFuIElHVCBkZXZlbG9wZXIg
KGFuZCBVTUQgZGV2KSBjYW4NCj4gPiBhbmQNCj4gPiBzaG91bGQgbG9vayBhdCB0aGUgZG9jdW1l
bnRhdGlvbiBpbiB0aGUga2VybmVsIGl0c2VsZiBhbnl3YXkuIEZvcg0KPiA+IGNvbnNpc3RlbmN5
IHRob3VnaCBpdCB3b3VsZCBiZSBuaWNlIHRvIGtlZXAgdGhpcyB0aGUgc2FtZS4NCj4gPiANCj4g
PiBSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4N
Cj4gPiANCj4gPiBUaGFua3MsDQo+ID4gU3R1YXJ0DQo+ID4gDQo+ID4gDQo+ID4gPiArICovDQo+
ID4gPiArc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eSB7DQo+ID4gPiArwqDC
oMKgwqDCoMKgwqAvKiogQGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lv
biBzdHJ1Y3QsDQo+ID4gPiBpZg0KPiA+ID4gYW55ICovDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBf
X3U2NCBleHRlbnNpb25zOw0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyoqIEBleGVj
X3F1ZXVlX2lkOiBFeGVjIHF1ZXVlIElEICovDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBfX3UzMiBl
eGVjX3F1ZXVlX2lkOw0KPiA+ID4gKw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyoqIEBwcm9wZXJ0
eTogcHJvcGVydHkgdG8gc2V0ICovDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBfX3UzMiBwcm9wZXJ0
eTsNCj4gPiA+ICsNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoC8qKiBAdmFsdWU6IHByb3BlcnR5IHZh
bHVlICovDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBfX3U2NCB2YWx1ZTsNCj4gPiA+ICsNCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoC8qKiBAcmVzZXJ2ZWQ6IFJlc2VydmVkICovDQo+ID4gPiArwqDCoMKg
wqDCoMKgwqBfX3U2NCByZXNlcnZlZFsyXTsNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gwqAj
aWYgZGVmaW5lZChfX2NwbHVzcGx1cykNCj4gPiA+IMKgfQ0KPiA+ID4gwqAjZW5kaWYNCj4gPiAN
Cg0K
