Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5794E78D44
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FA810E33B;
	Mon,  9 Feb 2026 08:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAX68wsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E03310E33B
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770626070; x=1802162070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jJ69/NaSaMeXvKnMnOds+Z7Ti1lMYpcVBFWWpxC/UB0=;
 b=jAX68wslrsXLPw0lqahApgPdogC5Ctt0lyeW4YOVTNkCdU34rG8sTzdJ
 xlA9WYh9DfeHETqpjzA/q8msBoC9XvIqwf7qW702ajxuP1lxrL29fkx/z
 i394sUEANzR07jaktdSQR2H05vGVIu5EX1djaIlMEbuervH5fK37LJDeT
 DjUvArlIM9CQ4mlF+ly0tfYaqqBOIkt1NDbmD2aX5fHgwz3bFIxROebt0
 cJ5CsTnn0c9j4REsDUYMJsVmsHROrOC5wpuj2kaLiRdjZlxdj9WVRWXz9
 AdUpA7omQ3DaOCN/MfMhAU8Hk1Zawk2dodbh3yssX455yGaClOPY7RRIn w==;
X-CSE-ConnectionGUID: 8fstOW0YSPyW1b/sleo5ig==
X-CSE-MsgGUID: gq6kO7nqR36Yo3+3hxW4vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="75582792"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="75582792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:34:29 -0800
X-CSE-ConnectionGUID: 5mOUphSXRaO8bstZDagesw==
X-CSE-MsgGUID: 2E8WQRd+Ql+wziVUCCFrCQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:34:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:34:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 00:34:27 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:34:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG1CxSMPZh+oYKesRx0+jPDb1gfIyRQ1zWFBGWOc4ztNt3MoLz0zyceT/SHN0CVt5DY4O1U+PDCG/ClvvHTuGgewXDHPajw5J583Hok4yoMlZLGrcEnvdQK9iuTFPQ6cqKXPGdTcsxsQhI3V2v5raoPMFg6711tLUTeku6TqPVbRfPMxtUXcYUXLHyUBvijf46XLWMryLfXFsfGzuJlPqw949+Dzstu8J3ZSbhhpi+dtj/3qzYviaFNdkJvRMnD7h1uHPnC4FpHJHKTNFLHktKa7Q5TXHV3ejcqXzQQeyXY/pwqM3YxuL4zj45zEnJdDbxyl1r147yyZJO9YfyfkSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJ69/NaSaMeXvKnMnOds+Z7Ti1lMYpcVBFWWpxC/UB0=;
 b=xRIk+05UJ+A4XrVoqRmOZJB/NBwZj1s9WSV/zKiAgbsQ9RQ9ePHFYTKLKLvnIbDQrDaUJgK+hCahHsYuenzyVooO+QewErTYrpz+FMwcu1OHZVKQqw5foF/IkpQ1/S48gYpaooSXMksHTd7YT8vJ5XzGLXkxbOTYJwadURULGsXWwKl8bioVAGFzzORrg4/8OP4Ik7fujj2DuYSFsc/jdk2UsRNIaqSkRFm7jgy7k6XNgx5rNm1o30JTzRF7Lj5B7ivZhIEk8o7gTtoJ8m1YXJSHDM8cypNhuj0Z8nDZqjpJX0FBcuNUodhe1AenX0CKUzVZyQ3NQCIs99gcWA31Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV3PR11MB8744.namprd11.prod.outlook.com
 (2603:10b6:408:215::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 08:34:20 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 08:34:20 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "S, Sowmiya"
 <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v8 0/9] Add writeback changes for intel-supported
 formats
Thread-Topic: [PATCH i-g-t v8 0/9] Add writeback changes for intel-supported
 formats
Thread-Index: AQHclfdoRs7gPAHw4EmEiZEu3tdtj7V6DE4AgAAFUXA=
Date: Mon, 9 Feb 2026 08:34:20 +0000
Message-ID: <DM3PPF208195D8DC7E8F714D7B83D39BA4CE365A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
 <edac5f23-8a49-4594-adeb-367ace502dbf@intel.com>
In-Reply-To: <edac5f23-8a49-4594-adeb-367ace502dbf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV3PR11MB8744:EE_
x-ms-office365-filtering-correlation-id: 3c13efd8-f81c-4c35-b8cc-08de67b60565
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VzhNcU5FUFNldjFXcGl3dzZMMUFIQzQ1bFBndngzZmtaNGRqcWtwZUpjRWkz?=
 =?utf-8?B?VitpVzllb3FnZVowNTF5eklKYmtiVnlJNFZoaU9rRXlRVVp4dGdUSENJSU1m?=
 =?utf-8?B?ekUycFliWmFSTC9kdVN5TUJUU1JhZmhqZFJyMEx6ODVkQnplVi9KUmJKOExC?=
 =?utf-8?B?bnFXUTEzNUtVNnlnQ0p6OEk0bFBLMm5iYmE5Q1pyK0ZKT0tuem1pSjFkWUti?=
 =?utf-8?B?Vy9pRXAwTVlFRERHZ1NtT003c3Y2dnpNQ3l5d2NCcWJGV01oMEduSUVqT0VF?=
 =?utf-8?B?em9vRmIyMlFsWnFXY2ZSYVlvRXEzaGx0TmR0VytsRk15RnJNYkE1RnMyV3Rr?=
 =?utf-8?B?cys0NjhjSDEzb3FOZ2NUWU04ZE1FYmsyem5LVEpuYWg1OTJES3NLZFRmUmZr?=
 =?utf-8?B?Y0JNNjNqcWRRem9vRnVCNk5RU3VaaHVCS01SaGJKaWh1N3BXSU9pZ3ZiTlZF?=
 =?utf-8?B?azZ2YWVsYklyZ0NGQlFLeGxJU0VSMVFCSXozZmlMdHpEUFkwWHFBaUd0Q05x?=
 =?utf-8?B?Uy8vb05xQUQyODFEc2gvcS9yT1J5M3FXdGs2SlpCRG02eGs5OGFST1p4RFF1?=
 =?utf-8?B?eHU4bmN2OUZaRmFycDNjVFFKZ2hXcGpKdWprQzlsYnFJMkVNUU8vOWFCMnZD?=
 =?utf-8?B?SnZDaXpHTGJ2QzQ0MDQ3b2pxWFRrNFRWdEFSRXkvS1paQldOMDNnN2ZDUWs3?=
 =?utf-8?B?YmhwRFNBenZVcXNxdk1pRWk2Y0tZaVVGbUFsMkxKellNd3Q4UDg5bUFkOWNv?=
 =?utf-8?B?WUVGL1VrbWZTdkF3aXptdG1sTFYwdGRWUG5DOTV4ZENROWtZb3NMNFM5SmpX?=
 =?utf-8?B?SDJCQWI4cWVVNXB0SFQ1YzhKbnRNY05jYWFnejYrWTlKT2c2TTNsU2l1VE1N?=
 =?utf-8?B?cHBsNGwydGxMK2phNS9qYXZkWGlPVjZpRy9NK3Bpa0RIL0lkT2lpZ0N5VEFW?=
 =?utf-8?B?WTZZMUZhYnNOb01KLytKQ0FLZnZGUXIrY3UrYUVHNCt3WVRSSUFyY1hVT2Zr?=
 =?utf-8?B?dGVxaWtGeVVLZWNwa2FWaHFLQnNqbTNzNWk3V1NkcmRHbUlYZjl5d1c1QkFz?=
 =?utf-8?B?UjQzd0pOcFhkRk51eU9tSnpUWmF5endCU2ZqNWtCZ29oM1preVByQW5leUFV?=
 =?utf-8?B?L252b1ZFcWNSdU03QngxZFBsVzBOaXdHdTVyRUVHenZMRDJKcGs0Z0o1RFJ0?=
 =?utf-8?B?TjM4ZnN3S25HUzh4ZjltV0diMEhDcXd3cUFud3I4T20vVHNzUE9hbGFnMEVU?=
 =?utf-8?B?SEYwSnM2eGxvNi9GQmN4NWpuUEdJbU5NVFoxcjFVVnYzbklMZncxTXBvQ0tG?=
 =?utf-8?B?QkJBa05zMkxjSlBTcy9BdnhjQXNkOHdIRGVVbiszMjhUbmFIQkp2TFNUU3pm?=
 =?utf-8?B?RkpXeXgwTi9DQldWUnhIS0U0UUZLWVQ3ckFhYUFwWHpNZ2EyRmNUZDc5MmFp?=
 =?utf-8?B?L2o5MEV3UTdocnUxa3ROV0ZWZ3ZwbEJkUFpYcFRGQWV1SXI2MW1kQnBSYTBp?=
 =?utf-8?B?TDk3SmhiUUkwVXQzT2MydjZGOUNob29BYmJUdTF1d3hHdnlKcDlRV0hET2hJ?=
 =?utf-8?B?TXhzNHdaN1NrUTk1WGNaZ2h1KzV2cGdwZ1h5OW5mbVZLYXRXZHg4cjZkK3lC?=
 =?utf-8?B?WEZMMkx6QThZcEFIUnpjc2hsRjlWZmxUSW5hNktNaGNvVVltZXdDd1NyTFlS?=
 =?utf-8?B?SFNZUy9oUUhOMDZ6Z2tLR1RBckZhc1Y2VnBHaVlCWXBQYnhIRTFCbWsyL0tI?=
 =?utf-8?B?SGRMMFlPc3ZYSTJhb01mdjVFK20xZFR4ajkyN2J6ZldJcDQ0SjJBY3AwY256?=
 =?utf-8?B?d09vZHlpRXlOQjNtMVAzSit3eGFEQWkvSXVJT3NDeDlMdVdBNXgxTG1oLzJZ?=
 =?utf-8?B?VUpBN25YQW1QeHpZNjNBTVRPWC9hTFNQcUtPL0NBNWtFV0ZNNmxrN1BwOVVO?=
 =?utf-8?B?S1R5azBGcS9xcm8zTXNhWGd0aFFDL3lxSmdIOG1jUVovMVJ5bGxjUjVlVW03?=
 =?utf-8?B?dTVSYVIzR3E2SHZXZUREcnNwNHNnRDdBMGlYU1hKTGtwLzdaRnVPc2VnMFpG?=
 =?utf-8?B?dm9yb053bEpqbVVlalpjVGRBdlZtblNGNFpvOVY2eTYwNHlQcjg0YXdzK3ZX?=
 =?utf-8?B?ZEtGRkJWTUowZkRMVUFRWGtBV2hTQ1lTRkU2YTJHVEtnZnhMQ0M2MklXSTlR?=
 =?utf-8?Q?qNaGgYuCKqJTVAju/Oob1KE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3lNUExSUEdqZ1B4S1M2L216WUJDSHA5cEp1cG93bUNwOHoxRkhsQlVHaVY2?=
 =?utf-8?B?YldReUU2SXNMb0crNFhTeWRXOTRFS3RybXdUVFlaNmo4WGhYRlI1dkw4L3Uw?=
 =?utf-8?B?aW5jeXdtbGRLTU5qSWZnSjBEUThiTS9aTyt3dTROeXFtOU1LMFJrMy9BbHZG?=
 =?utf-8?B?bDI2dFlpMHhvZGg0L21NVHJYZmVRakg5WUdvbkFaR0xJcTlIT2p1MVMrZkVC?=
 =?utf-8?B?SlMrYmJXS1hnTnk1dnBCYWZ2Z2g0clBZS2krbXQ0ZlQ4ZmpZeGZVdksyZlY0?=
 =?utf-8?B?cW1FdzFIZkt1dzJHbEdaOFNQSVlYVTVmSGptSWpZbnNRVll3SXRRRCs5ZnM4?=
 =?utf-8?B?TTFIUk1sNUlJQk1mbzJGbFVQSjBnb20wZDZ1VHI1R3V1QUZvUk44Y2gwb2NQ?=
 =?utf-8?B?emh1T3M1U3VPYUdqdnVCV3dyRGVPbGVCOXg4eW0zaHNPeU1DYVlaZ3ZUMDB2?=
 =?utf-8?B?eXk4QnVFN0t0WDA2MDhlUUY3U3RSeXVWVmlJL1NtR2lBWGJvR1RpN3I2TWc1?=
 =?utf-8?B?QkpCVjU3Q1ZwYW9xYVFBcmlyRXRNbVpsZVpKWmVTcmY0ajVSbXpsRFpFMkxt?=
 =?utf-8?B?OUEvbnppbmJPZHhxMWRKVVBZcW1NN2FsYVVvVjRJSlFWWXhVWHNDdmFBYUU0?=
 =?utf-8?B?ODlsMkZJU1Q2UTBPWEFJOXE3MSs3aG9aN2U0K0YvY25XZFM3WEZKcmhCZXdR?=
 =?utf-8?B?b3BNVFM1T3hSdlZBQXlGTmRFUVZ6VFNzUG85TUlDWXpRaTdzck53WktyZEts?=
 =?utf-8?B?RnFyWWJiRFVGNGRIY2RTNE1YeGhTWDZWSmpsVjVLYUo5aFJYWjBMUzUwVDVh?=
 =?utf-8?B?dzM5VVFCZW9STnIvcjNFODZ1Z1dVMFE4NzlNaEM0WW9lbG5MaGdsaVRuL1ZK?=
 =?utf-8?B?dzY3dWZaSEVrM3VwelZIVmFXbVFoR0FhMUd1ek9EL2RrRnhUUFA2M2t6MVlN?=
 =?utf-8?B?V0dmQ2hlSnlwQklVcGM4MDFWeFJIZ3NGNGFWR0V6ZDdOT3ZwZ1NxYmVZbDFR?=
 =?utf-8?B?R015VlNKcGhYV1E2dlBCRmxEMFZJMjVQRkdwcTFLYjdoNmIrWFhjcDhzdzVt?=
 =?utf-8?B?YWpzazJvdkNYYVM4WTZ3NGNacGpIOUFqd0dPTFJqVEV5ZU1nbndGZzBVcWN2?=
 =?utf-8?B?VUt6b1RkdERjSmIwaGtRVDhnNVJ5a2ZVb1BhYUhoRXNHYUNXTm5tRUxYZmJo?=
 =?utf-8?B?bUpVM0VBWUNxVHpTNHNpS0JpNDV0TXhRUXNyOVhsTGl1a0ZLbFJob08xeHBT?=
 =?utf-8?B?U2laKys5Y2hCS2krRHVzamx1cFRMcnhpbkN6NVVRdHBreWpSaWNKK2Q0NDV5?=
 =?utf-8?B?cGtoY3Iyb0daR1RjbWpub1BaQ2tOZnJQMVl4Nm15cFpkTVBZdHA5VU8wODla?=
 =?utf-8?B?aFZ6ZkhwWDZMcHZLTFV4SytvbHIwdi8za0ErWHIxaTZWU3ZzZzAyMzdqaCtq?=
 =?utf-8?B?YVQ5YUo0c1lqSnZuQzM0NFhLRWE3TnVNb2VyNVdINEZZekx5ZlBNWG84WS92?=
 =?utf-8?B?ODRMNlVKNG5NWWRPZ1BnMkN0MFFUcGFnVFk0V0Jxb2dXM21lYzRNa0pXZ1pQ?=
 =?utf-8?B?MXd5dWM4K3BWcnM1Tk9CVEVjVXJvT3RGNVhWQktvUWFhaUJNZlJhQnhGSURz?=
 =?utf-8?B?T1U3WituUEhURk5PeHltbEpQNk9Odk1uMk1HbVpHcTQ1UjhjV1JId1A0dGk0?=
 =?utf-8?B?UEMvTllROEVPQzZPUTRTOG9kSU12UWx2bU9CWlVUNzF0amkrR1l2Z2R4QkxZ?=
 =?utf-8?B?MGZwQ0dUbVFDcmFwclFubTRNRWxaUzJOaWQvck5BaElzQkhBNU0vNXhpYzls?=
 =?utf-8?B?eEdZNzZtckwvRTAzd1R6UVY2b0Rna1JxRWtHS1ZhSmp6ekdraHJqUkpyK2s2?=
 =?utf-8?B?NWYrNEVpczZnVlVzRDVlLzAycnQ4VXQvWVo4bDJZWE1YNkhkQ2Y1dkp4RUFk?=
 =?utf-8?B?ZDRRUVVXdXQ4ZWs3RnJpUG1KdDRpYVlMZzNKSkc1M2lJK08wb0Vvc0pJSDNv?=
 =?utf-8?B?bkN3N1c1TXE2UnJ6aXc4RlR0S0Y0allVbnc1VnR4T1RFMTFFOHBSTDE2U25V?=
 =?utf-8?B?NUgwcWZmL2k4cU5zdVowR3RJTlZCdDFoMDB2UmJmcGtmcHlSUkR6UHBOU1Vw?=
 =?utf-8?B?eVl1SWFDSFBaZkJUTDRpYVdGb1FZd0VXUCtkbjB2R3U4R3JWdWwwMGlaT1RM?=
 =?utf-8?B?K2NEVllPRVk5eWErUnU1RG1lWm9MK0tiN3R4WU55VzdBNUxxMDFTMHNTbURn?=
 =?utf-8?B?MmhkMTNpUDh0ME8wcHV3aHl2SmFqbFZ4Q0hFdU8vRzUxcFJKWVNGMURvTHg2?=
 =?utf-8?B?S3VEMjJneFlFM2NDSHh6Nm1ma0ZtTmJGaDN0T016VEV4YjdjdU5HQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c13efd8-f81c-4c35-b8cc-08de67b60565
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 08:34:20.5201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HPBxf4nGVKZpbiY9oRiIO6pp/AGolOd0bmLoPnVx58tTAmxKTTLPHjfT64x4JlsLbGH2QC3yAQo/cQDSl4h5QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8744
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IHY4IDAvOV0gQWRkIHdyaXRlYmFjayBjaGFuZ2Vz
IGZvciBpbnRlbC1zdXBwb3J0ZWQNCj4gZm9ybWF0cw0KPiANCj4gSGkgU293bWl5YSwNCj4gDQo+
IENvdWxkIHlvdSBwbGVhc2UgYWRkIGEgcGF0Y2ggaW4gdGhpcyBzZXJpZXMgdG8gdW5ibG9ja2xp
c3Qga21zX3dyaXRlYmFjayBvbiBDSSwNCj4gc28gdGhhdCB3ZSBnZXQgdGhlIHJlc3VsdHMgZm9y
IHRoaXMgc3VidGVzdCBiZWZvcmUgbWVyZ2luZyB0aGlzIHNlcmllcy4NCj4gDQoNCkN1cnJlbnRs
eSBhbGwgdGVzdHMgd2lsbCBza2lwIHNpbmNlIG91ciBrZXJuZWwgc3RpbGwgZG9lcyBub3QgaGF2
ZSBzdXBwb3J0DQoNClJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCj4gVGhhbmtzIGFuZCBSZWdh
cmRzLA0KPiBLYXJ0aGlrLkIuUw0KPiANCj4gT24gMi80LzIwMjYgMTA6NDggUE0sIFNvd21peWEg
UyB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIHZhbGlkYXRpb24gZm9yIHdyaXRl
YmFjayBmdW5jdGlvbmFsaXR5IGFjcm9zcw0KPiA+IG5ld2x5IHN1cHBvcnRlZCBmb3JtYXRzIHNw
ZWNpZmljIHRvIEludGVsIHBsYXRmb3Jtcy4NCj4gPiBleGlzdGluZyBmdW5jdGlvbnMgd2l0aCBs
aW1pdGVkIGZvcm1hdCBzdXBwb3J0IHdlcmUgcmV0YWluZWQgZm9yDQo+ID4gY29tcGF0aWJpbGl0
eS4gQWZ0ZXIgdmFsaWRhdGluZyBuZXcgZm9ybWF0cyBpbnRyb2R1Y2VkIGJ5IHRoZQ0KPiA+IHBs
YXRmb3JtLCBhZGRpdGlvbmFsIGZvcm1hdCBzdXBwb3J0IHdhcyBhZGRlZCB0byB0aGUgd3JpdGVi
YWNrIHRlc3QNCj4gPiBzdWl0ZS4gU3VidGVzdHMgbGV2ZXJhZ2luZyBjb21tb24gZnJhbWVidWZm
ZXIgY3JlYXRpb24gbG9naWMgd2VyZQ0KPiA+IGNvbnNvbGlkYXRlZCBhbmQgZHluYW1pYyBzdWJ0
ZXN0IGdlbmVyYXRpb24gd2FzIGltcGxlbWVudGVkIHRvDQo+ID4gZWZmaWNpZW50bHkgaGFuZGxl
IGZvcm1hdC1zcGVjaWZpYyB2YXJpYXRpb25zLg0KPiA+IEFkZCBuZWdhdGl2ZSB0ZXN0IGNhc2Vz
IHRvIHZhbGlkYXRlIGZvcm1hdCBhbmQgbW9kZS5SZWZhY3RvcmVkDQo+ID4gZXhpc3RpbmcgdGVz
dCBjYXNlcyB0byBpbXByb3ZlIGVmZmljaWVuY3kuQWRkIGhlbHBlciBmdW5jdGlvbiB0byBnZXQN
Cj4gPiB0aGUgZGVmYXVsdCBmb3JtYXQuDQo+ID4NCj4gPiAgIGxpYi9pZ3RfZmIuYyAgICAgICAg
ICB8ICAzOSArKysrKysrLQ0KPiA+ICAgbGliL2lndF9mYi5oICAgICAgICAgIHwgICAxICsNCj4g
PiAgIHRlc3RzL2ttc193cml0ZWJhY2suYyB8IDIxMSArKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTYyIGluc2VydGlvbnMo
KyksIDg5IGRlbGV0aW9ucygtKQ0KPiA+DQo=
