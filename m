Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24081D262A2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 21:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E6310E1C1;
	Tue, 20 Jan 2026 21:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ib/hCwoD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAFA10E1C1
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768943001; x=1800479001;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E97fOY4raaE6ewYg79/XOH7zZru9j+N/zqphW+FxYuQ=;
 b=ib/hCwoDHEgBhAKez1JGRJ5eHTSlemEsc6U3iiaPWB6QglH+8xvfvKsH
 u01i4QlNpKnhDhiJ3o53NK1lChKuuq59+irko/RSwbr8Ry1Sj0O4wSAhr
 HhtA3JZ0g7r6eFV7J59NwQafxL+jttQ2peQfkXZDk2d9tkOiY38OEjghl
 3b2xYnQK2gkKOvBCjbhFM5v+Do5hhZP3baVyBJ93AxYWvdlfxblwTnLlu
 c1Kt6hW7Mjj07ZSTszEjWf+Xjcukv8ZedHEtOJbntxbJRoP1khdx81qVv
 yZZsW9C5P3Crtd037pvaZ3AHlACfMJYgV8hXNFXIrOcBRHht2s5mFT1ze g==;
X-CSE-ConnectionGUID: RDgAwJlyS/qQtvKQFehNAw==
X-CSE-MsgGUID: zHlYX2D7Q0i6R4KHub8cNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="72752356"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="72752356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:03:21 -0800
X-CSE-ConnectionGUID: U9hQElvwQDSlnAwmjdpGKA==
X-CSE-MsgGUID: Yix4oV9PSIyjs+e1iZfIng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210729858"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:03:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:03:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 13:03:20 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:03:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2dAicZ3gEoHCGnQi3GR1TVfbfv46LM3QJ/gAtUGst7co+7/6MAs4OM67Bd+C+mNG6SdWbIpdRVbKP/D/AfTtsYGffvu0PpgcLIbPbXfNvpg2hUeytMIG6N2v8lDECMBFRm6urBbl6BuzpUNSYjcByHLOtjfUWcnSY+eMx9whmzf+WrL/RON61QISIJHoVeo6O+2edHuFIFLl2CNvqx6EODfx1HxOheGTxV6TicZ81u2SR13bfh7Zko+fWkaqR/Np2bbYxyFcMLKc6UeSGlKClt42yWEDokguIPrydN2zV0s+XoiT28S+G96JpKe9XxRTh7u+kIysZ7EIM7WxOmlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E97fOY4raaE6ewYg79/XOH7zZru9j+N/zqphW+FxYuQ=;
 b=ex7Cg9CnxJ56YgzbgNfQJRr9luF7IuPTW4Exhpl8NPK77u9Rgv5BKPOj+UpLW9cbpffE5HpMnU4yVF04mOsdWfK8fDMHq/4l8xawwNlTv8m3MU1P4AtgUOGcoZ6wNpQvr2YspQ13+y7lk69FhIPI+Pjd+2X0CANd/25HulWZ9/MkL7PIvlcPWXExtCRDJ9Vvh4wMhjMVUtVZoAC+M+oLmY5Zaog5fWklJ8jJ7736Rh3kcDOS3qASMbD4SQSpBUcZcCs6TZZwuSa/BlDNsf0TfBFSmWSLBYHMOGjOtquL2D71qiTcaaBVMCcTyLoA/kA+BkdtXYqioXqIpVmvd1P/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 21:03:18 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 21:03:18 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Thread-Topic: [PATCH v2] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Thread-Index: AQHchm5345AiEPrsJEqnslIrC6un0bVXXNAAgAQGU9CAAC6lsA==
Date: Tue, 20 Jan 2026 21:03:18 +0000
Message-ID: <DM4PR11MB54561F21FADC12AD424C227FEA89A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <aWxksBjMDVhWIm+Z@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456015CABEA7D0DEE768330EA89A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456015CABEA7D0DEE768330EA89A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB8550:EE_
x-ms-office365-filtering-correlation-id: aa35e6c2-4ee8-44ad-3128-08de58675605
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RGx6NlFaM0JnOCtONDJIU0Fzek5LdXR5U2Mxa0lyWHVjL2hPNVduRjJObFFK?=
 =?utf-8?B?R1YyTHBaY1p0VTQvY0ZGNW92cklrOW5RRFNvMlprYWxhbG93ZTJVWEowTjdl?=
 =?utf-8?B?SHZtME1CSDF0ajQwZWVOOVVleEszOTl4ckJXTk1XUFB6UHo3T0h0L1BROUsx?=
 =?utf-8?B?cWFKRC8wdG9SdWQ3d2lpV1cwbUVBQW9rL3R5UlhqeSt1SmVlWi9EcjBoeUNa?=
 =?utf-8?B?NU55ejV0WVdTSXlUU0JKUnNmVm14TFNTZXYrSUJpdWR6UzdkQ1lPSWE2K3BI?=
 =?utf-8?B?V29vS1NYd0o0NWMwVjhkcWRQM040RDB5Um12cmR5N1pHNU8rUUd3SlVpUDRy?=
 =?utf-8?B?UkFtS2JtWTBONmgydmFEeGt0ZWxYbnZ6enZhYnZReTA2S3JlYjF5TDdpVUl2?=
 =?utf-8?B?d3ppTU9rbzVxOWxvNUJpblNQY3pXcGFXdDh1d0VvaStpNnlqUTAxdDZxcCtY?=
 =?utf-8?B?SER6S2NOSjRuZW9PKzZrM0VUT2dZSHEyRzduaFlwYmFBektSZDk4SWVKSTNX?=
 =?utf-8?B?MlYrTXpGNUY5QUZFSXVpcW9JUk9sMExLZ05HT3dvVkRPSjNvV2Z3ZUZBM0wr?=
 =?utf-8?B?UGhzUjFQUGdKOWoyWVRWdm9xZDV4bzRaZDBQTUwwa3RLOFV1eGUxM0craFBL?=
 =?utf-8?B?azlVdDdaR2dOU2Z1RDM2R1pPeWNZckRkbVRlTTU2d2N6QjlZWkR0NlFQTTBt?=
 =?utf-8?B?VGNqQmxBMkFoWEtiRk4yY2ZUam1HMDJta0w2VjViUFd1VTVkc0NkcExpeDF6?=
 =?utf-8?B?TzJBaUJZM2FNMGUwRjR2cHNwWnY1UXhuM0EyTW9YMHNtM3IxZXZKTmNhN0px?=
 =?utf-8?B?RUJYUVJJWS9TNURUbjNQSCt5UHFHNFFqREZiSjdrTjV4UzgreWRwN2dYdUpM?=
 =?utf-8?B?azZaQTY0VUpTMW5ybzlJbUtnSVdFb3ZHMjg4Yk9qWDlTSEVjT2JIUG9IREhD?=
 =?utf-8?B?eUJxNWc1SWo4TklIeVFuRGZOUlNPS29JdjQyU1FOa1BnQjdlQ1l5NTlJYVZ4?=
 =?utf-8?B?ZmFPdVU5UWpqUHdpSkF2SGYzUlAwcVo1SXVzTkY4WmlHU0M5VENnL0J6clhs?=
 =?utf-8?B?Mk0zNmUxSVNlYzJWYlFpUGRtUW0zVmRpYlJUazdGNW9lL0lHYWlOMDZTbVVa?=
 =?utf-8?B?WmMzVWY3WElFQWltQS9Yem8xT1NPQUxsdHh3NWJscmdtQkl3dDBnOVhCUVVR?=
 =?utf-8?B?MlJESmZHQUVZRHN3RHc1K0xLL1A2bWNETTM2Sy9aT3M2MmlGbzBPM0JUL0Qv?=
 =?utf-8?B?V05SRnJFemh2QStoVklTdDNwSFBXMkZmQUtlKzZuSzdJTk9aalRic0dsQmQw?=
 =?utf-8?B?YUZjUno2U3RRMmFnS1NtNW1OaTh3Y1ZkK0dtWmdVeWthdnFQWm44YzZaRTUv?=
 =?utf-8?B?bVRGYStXTHVHYXB6NTlrVjBlV24reUtkVnAweEZsOXlWc1JQOHVnUEl0ZlhP?=
 =?utf-8?B?ZE81WE84K0M2dDdaK3ZiWWQyZTJEcUplOHQ0cUpZSkpOcmZvME9sZ3JaWlFV?=
 =?utf-8?B?Y1c1eE9LT3FIcEFNNjR1YWQreGM0dTZmeVQwOXJyVGpVNjhHSWlNSFNwWnht?=
 =?utf-8?B?U3RNNFNXSmJOVk5PV2hqUjJySFZWSkRhWW1nSXh1bEM4V0swU3JxcU5icXF4?=
 =?utf-8?B?M29hT1lVUFNkbVhxMEIvaG1nNytFcStyczRrTVNFVFIxY2FvaHdaeDVVdUQ3?=
 =?utf-8?B?RG1rR2pWU28yWm1OZjRFRDVGK1V6a05yOC9wZ1RtbVlkTjNTeWYyOEZWTDF3?=
 =?utf-8?B?T2hpMGhvMDV0TUVobTRqNUNiMHR0dzhJRG1pZjRMK3hZQTc2S1FPYWdwb1Vs?=
 =?utf-8?B?MG5tVlYrYXVEeXgwMFBQaUFUU1UyVTdzUWpYWEI2Z2lmdGt5RHE1Vmx3RDhi?=
 =?utf-8?B?TkpwNVpoSkRiMHB5dlpoTWZlQWZ4NDltN2xkaHF4Rkx0ZjZkV05xdEZIVFM0?=
 =?utf-8?B?b1FQODc5dEN3bDYvKzZWcUlPdm9zTHBMbFVQMkdPcXJnMm52Wm9MVDBYcm5z?=
 =?utf-8?B?dkNrSkwvZjcraUNOb1pKWWFBZE5qVDJFRW51Tm1nZmFRa2FVNkFJY0VBcllP?=
 =?utf-8?B?c3VYM25HMGVBQXhNclE2d1c3V2pZdndoZmtnZEVtYjljUFlYTmlFbEpKbS9p?=
 =?utf-8?B?QWhUM0JSVFBhL2tBZExwRmd1clpaeWw5UlpvZ0REMlgrWG94dXp2QXE3d3Q4?=
 =?utf-8?Q?dWyDe8yU2peZqh4TLUwGSQA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEVYZ05DSkRWVWpWOWtRRVp6STRLTVdwWHVjVlkwWTdaMHJBcTBrc1J2Y09R?=
 =?utf-8?B?cTlVV3FGd2xNRk9iQ1lCcFEwL1AzYkpVN0ZHdlBERGxqQ1ZJSEhpemJpWkMy?=
 =?utf-8?B?enhUOXVKYzhkQi9jMWd0OWdZUzlpcW03eWZ0U0VFNEVoVWVGL2FhaDAzbGc4?=
 =?utf-8?B?TEh0TU1KZGxSWDlBTm1EUXlxZnJnY3B3RFNZWkhnSkY1T1M3bWxVYWZXTjB4?=
 =?utf-8?B?aldwd2N2NGNVT2dvTzhuejJSbjRJY3VIaUJscS9nN1JoYTliM2o0cG9sSUxX?=
 =?utf-8?B?UCtlaHhzR0NBZWtWRkszUzR3bngxRUNDcTFKSHljS3dDemNtNlkxaTNudGk3?=
 =?utf-8?B?SXNvQ1R1TEc2MGlNNXhJd1g5MGxmckljQjdVQyt3eU5YbVEzVnQ2SmRJbFJw?=
 =?utf-8?B?QndlRndrbWVQYXhraE55TUdSUllJSUVReGlTdTV0K2dqT2hIM0ZOaFR5bEJ6?=
 =?utf-8?B?ZGsvT1NJYi92dGx6clUzZDFpNjVQbW1iSG1tUk9yZThyVGxHR2VmWCtxaXY3?=
 =?utf-8?B?eVI3bXBMaENPdlVkOTNvaVlHdjJ1blB0OFBsZkJQYXd4eW9STW51TG9YSDlI?=
 =?utf-8?B?SEFpR2x0dFVSTDduNzZtUkFvbmp1NW14TTZrM2Z2RlhVWkpraVA5ZTlNZFh5?=
 =?utf-8?B?eU42aytVRThwZ1JBYTVhQnhHL3p2ckRhRG53blgvcHlwQVl3WWVyWGxUNDNB?=
 =?utf-8?B?VUFoRk9MeHNvVHk1Z0hLUzh6ZWNrWnRmb2dmUUlHRVUwV2t3RjB3eEJ1Yjhi?=
 =?utf-8?B?V3UrQnRDc1d0RTF4VGk2M2NOVzk1ZGZNWjBnbUxIUGRDK3lHb3V2KzdzRE9W?=
 =?utf-8?B?VmFVdXlSVXhjTnJqODlMN3V0Mlc4RXdkam9XWWdDcm9NZmgyMkh2NHdISUxZ?=
 =?utf-8?B?S0pWc1Q4emE5LzNqc1RWdXRIVGlUYjgvOFJNNm5nbFZOQzBxMElaUmQ4cTZX?=
 =?utf-8?B?SlpQbmliZ3hHcEl1S2M2YkJKSEtsZTZyUTd6anRlZkZKSEdEd3pWMW1pNGl2?=
 =?utf-8?B?c2YyK0lRUTg3NjF6VlpaVmIwTXdFZWVSdjBvS3lGdzh3TGQ0NlhvSTZwVFM2?=
 =?utf-8?B?andyQjEvVUpGeHJSUUpHdFdUYm55YVNPUHJST3orUW13YllnTm5EOU9oaXZT?=
 =?utf-8?B?UEtKOTU5eGJzdW43cWpEbnY1MHJqb1dlOXdHejR3OGlsQWlORzRBZHIrRENw?=
 =?utf-8?B?ZlRUZ004TnVlblpoRWxpaHYxNXZmam1uWlFHbkJqVDAycWE3d3pReFV5RVlL?=
 =?utf-8?B?aXpCQmdNZmQvK3owdjd6M3NOd1VaaXZWMXljU2VyOFNseC9OMW03a1M0dGEy?=
 =?utf-8?B?RkN3Z3BsenpxMDRSaUdIVi9oS1pKcnpDVSsyM3RjOVUxVmlnM2wxeDVFZERv?=
 =?utf-8?B?RjRmR0NLZzlHVVJkcDBELzJIVkhlY2ZkU0o2SFd5NnhLNENPa1J6ZlpGd3BM?=
 =?utf-8?B?REV0MjFnMnNuMkh5T1RVTXRET3BLWVRkWUx3c1VlcjgwTWJCWG5IdU9IWEVM?=
 =?utf-8?B?MVJ4RHVuNDBEZGo0MlZFMFhrK05MZ0JNWDRHei9MM2Z2TnRqVytxZTZYR3NQ?=
 =?utf-8?B?SjRMcm0yTkVZZUxOQnRzREw5WC9hM2NFb0dub0lyMEpBay9SZXpxSG02cUt1?=
 =?utf-8?B?bGFJZlRvL05xVEZOaWFweU96ajgrYm05ZnJQTWo3bG9TMWdNUzRNaUI5YWFG?=
 =?utf-8?B?cG93eUc4SmREVlVmR0YzWWdCUW1JZWw1WWU2anRUS1Q1V0lTZSsrR3h5SHNl?=
 =?utf-8?B?aENEdXNCazU0a0hpeDA4Wmg1Y3NMODVwOGNaTjdJdk9TVXZSL3hCQUpHaDU3?=
 =?utf-8?B?dDdjb1hLY3ZjZmZyTXhHYkV6bmVpRm9WUS90bkpienZVdFFQbnBqb254Q1pB?=
 =?utf-8?B?d01IODhnQXdSMHg4YTArZDRLUFNmd2F1OWhYc3BLSkFQWkt6WHRhbE8xZ09r?=
 =?utf-8?B?elVaQWxwQUlydXduMU9oRU5zYlhEMFk3QWtvUVhkV2w4YWpXQlhTRzBySll0?=
 =?utf-8?B?YjBIT1hmZVh1V2hDcWJmWWlnajlqZnpLalZkVDhNTi81ZXBTZG5KVTB1Tk9a?=
 =?utf-8?B?eWswamNBWWpQeXp4ZDBRVjZXdXoxdmpkRndadEFWT21ZYWE5WWlhWklTOStK?=
 =?utf-8?B?ellIRHVSVW5IQWMxbVJoU2hNUTg4V3RSR1RHNmRCWUlmMklrek96V1J1Sk5n?=
 =?utf-8?B?YUkveXRWditUdm81dVFpRHZyK2NjSm0xZ25QZWpqcWFlRjlZYjhMQ3FQaGE2?=
 =?utf-8?B?Y1cxN1JUTDYwa3Vza0hkUER0SzBGaGlRYlF5R1lDbW16YXRxOXFVcytvZ2Fl?=
 =?utf-8?B?VUJCcnNKYkZjU3g2U2lRL3pZd1laOGRPZUYzSUZvTUtCY2FoWWluZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa35e6c2-4ee8-44ad-3128-08de58675605
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 21:03:18.1183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nzYt7ntm69pyhfg0TsDKV9yMe4ONQWVhG6RCZmyja4yxmYLn1bIN76WIZ816yeDd02xbuTLEXhAhRfXTejDK0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgMTA6MTYgQU0gU2h1aWNoZW5nIExpbiB3cm90ZToNCj4gT24g
U2F0LCBKYW4gMTcsIDIwMjYgODo0MiBQTSBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiA+IE9uIFRo
dSwgSmFuIDE1LCAyMDI2IGF0IDEwOjI5OjM4UE0gKzAwMDAsIFNodWljaGVuZyBMaW4gd3JvdGU6
DQo+ID4gPiBUaGlzIGNvbW1pdCBwZXJmb3JtcyBhIHNldCBvZiBzbWFsbCBjbGVhbnVwcyBpbiB4
ZV9sZWdhY3lfdGVzdF9tb2RlKCk6DQo+ID4gPiAxLiBSZW1vdmUgYSBkdXBsaWNhdGUgY29tbWVu
dCBmb3IgQkFUQ0hfRFdfQ09VTlQuDQo+ID4gPiAyLiBNb3ZlIExPTkdfU1BJTiBjdHhfdGlja3Mg
aW5pdGlhbGl6YXRpb24gdG8gYWZ0ZXIgdGhlIGZkIGlzIG9wZW5lZC4NCj4gPiA+IDMuIEFkZCBh
biBhc3NlcnRpb24gZm9yIENMT1NFX0ZEIHRvIHByZXZlbnQgZmQgbGVha3MuDQo+ID4gPiA0LiBV
bm1hcCBkYXRhIGJlZm9yZSByZXR1cm5pbmcgdG8gYXZvaWQgYSBWTSBsZWFrLg0KPiA+ID4gNS4g
QXMgaSBzdGFydCBmcm9tIG5fZXhlY3MsIHdoaWNoIGFsd2F5cyB3aWxsIGJlIG5vbi16ZXJvLCBi
YXNlX2FkZHIgYWx3YXlzDQo+ID4gPiAgICB3aWxsIGJlIGFzc2dpbmVkIHdpdGggYWRkci4NCj4g
PiA+DQo+ID4gPiBFeGNlcHQgZm9yIGl0ZW0gNCwgdGhlc2UgY2hhbmdlcyBzaG91bGQgaGF2ZSBu
byBmdW5jdGlvbmFsIGltcGFjdC4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hl
bmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhl
IGNsZWFudXAuIEEgYmV0dGVyIGNsZWFudXAgd291bGQgYmUgdG8gbW92ZSB0aGlzIGxvZ2ljDQo+
ID4gYmFjayBpbnRvIHhlX2V4ZWNfcmVzZXQuYyBhbmQgbW92ZSBhbnkgdGVzdHMgdGhhdCB1c2Ug
dGhpcyBsb2dpYyB0bw0KPiA+IHRoYXQgdGVzdC4gSSBvcmlnaW5hbGx5IHdyb3RlIHRoaXMgbG9n
aWMgaW4geGVfZXhlY19yZXNldC5jLCBhbmQgaXQNCj4gPiBsYXRlciBnb3QgbW92ZWQgd2l0aCBh
biBhY2sgZnJvbSBtZSDigJQgYnV0IGl0IG1ha2VzIGFic29sdXRlbHkgbm8gc2Vuc2UNCj4gPiBm
b3IgaXQgdG8gbGl2ZSBpbiBzb21lIGhlbHBlciBsaWJyYXJ5LCBlc3BlY2lhbGx5IHNpbmNlIGZs
YWdzIG5lZWQgdG8NCj4gPiBiZSBkdXBsaWNhdGVkIGFjcm9zcyBib3RoIHRoZSB0ZXN0cyBhbmQg
dGhpcyBzbyBjYWxsZWQgbGlicmFyeSBjb2RlLg0KPiA+IEl0IGFsc28gbWFrZXMgaXQgaGFyZGVy
IHRvIG1vZGlmeSBhbnkgdGVzdHMgYmVjYXVzZSB5b3Ugbm93IGhhdmUgdG8gb3Blbg0KPiB0d28g
ZmlsZXMsIG1vZGlmeWluZyBib3RoLg0KPiANCj4gVGhpcyBmdW5jdGlvbiBpcyB1c2VkIGJvdGgg
aW4geGVfZXhlY19yZXNldC5jIGFuZCB4ZV9leGVjX2NhcHR1cmUuYy4NCj4gU28sIGl0IHNlZW1z
IGl0IGhhdmUgdG8gYmUgaW4gdGhlIGxpYiBmb2xkZXIgdG8gc2hhcmUgdGhlIGNvZGUuDQo+IFdo
YXQgaXMgeW91ciBpZGVhIGFib3V0IGl0Pw0KPiBUaGFua3MuDQoNClRvIG1vdmUgdGhlIGZ1bmN0
aW9uIGJhY2sgdG8geGVfZXhlY19yZXNldC5jLCB0aGlzIGZ1bmN0aW9uIHdpbGwgYmUgY29waWVk
IHRvIA0KYm90aCB4ZV9leGVjX3Jlc2V0LmMgYW5kIHhlX2V4ZWNfY2FwdHVyZS5jLiBBbmQgYXMg
dGhlIGZsYWcgdXNlZCBpbiB4ZV9leGVjX2NhcHR1cmUuYyANCmlzIHF1aXRlIHNpbXBsZSwgdGhl
IGNvZGUgY291bGQgYmUgc2ltcGxpZmllZCBpbiB4ZV9leGVjX2NhcHR1cmUuYyANCg0KSSB3b3Vs
ZCBwcmVmZXIgY3VycmVudCBwYXRjaCBiZSBtZXJnZWQgZmlyc3QsIHRoZW4gZG8gdGhlIG1vdmUg
YW5kIHNpbXBsaWZ5IGxhdGVyLiANCkl0IHdvdWxkIGJlIGVhc2llciBmb3IgdGhlIHJldmlldy4g
DQpMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkgY29uY2VybiBhYm91dCBpdC4gDQpUaGFua3Mu
IA0KDQpTaHVpY2hlbmcNCg0KPiANCj4gU2h1aWNoZW5nDQo+IA0KPiA+DQo+ID4gSSBrbm93IHRo
aXMgaXNu4oCZdCB5b3VyIHByb2JsZW07IGdpdCBibGFtZSB3aWxsIHByb2JhYmx5IHRlbGwgbWUg
d2hvIHRvDQo+ID4gcmVlbSBoZXJlIC0gSSBob3BlIHRoZXkgYXJlIGxpc3RlbmluZy4NCj4gPg0K
PiA+IE1hdHQNCj4gPg0KPiA+ID4gLS0tDQo+ID4gPiAgbGliL3hlL3hlX2xlZ2FjeS5jIHwgMTYg
KysrKysrKysrLS0tLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9sZWdh
Y3kuYyBiL2xpYi94ZS94ZV9sZWdhY3kuYyBpbmRleA0KPiA+ID4gMDg0NDQ1MzA1Li5kY2Q3ZTIw
NzUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9saWIveGUveGVfbGVnYWN5LmMNCj4gPiA+ICsrKyBiL2xp
Yi94ZS94ZV9sZWdhY3kuYw0KPiA+ID4gQEAgLTIyLDcgKzIyLDYgQEANCj4gPiA+ICAjZGVmaW5l
IENBVF9FUlJPUgkJCSgweDEgPDwgNSkNCj4gPiA+ICAjZGVmaW5lIENMT1NFX0VYRUNfUVVFVUVT
CQkoMHgxIDw8IDIpDQo+ID4gPiAgI2RlZmluZSBDTE9TRV9GRAkJCSgweDEgPDwgMSkNCj4gPiA+
IC0vKiBCYXRjaCBidWZmZXIgZWxlbWVudCBjb3VudCwgaW4gbnVtYmVyIG9mIGR3b3Jkcyh1MzIp
ICovDQo+ID4gPiAgI2RlZmluZSBHVF9SRVNFVAkJCSgweDEgPDwgMCkNCj4gPiA+ICAjZGVmaW5l
IE1BWF9OX0VYRUNRVUVVRVMJCTE2DQo+ID4gPg0KPiA+ID4gQEAgLTY1LDkgKzY0LDYgQEAgeGVf
bGVnYWN5X3Rlc3RfbW9kZShpbnQgZmQsIHN0cnVjdA0KPiA+IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UgKmVjaSwNCj4gPiA+ICAJfSAqZGF0YTsNCj4gPiA+ICAJc3RydWN0IHhlX3NwaW5f
b3B0cyBzcGluX29wdHMgPSB7DQo+ID4gPiAgCQkucHJlZW1wdCA9IGZsYWdzICYgUFJFRU1QVCwN
Cj4gPiA+IC0jZGVmaW5lIFRIUkVFX1NFQwkoMyAqIDEwMDAwMDAwMDB1bGwpDQo+ID4gPiAtCQku
Y3R4X3RpY2tzID0gZmxhZ3MgJiBMT05HX1NQSU4gPw0KPiA+ID4gLQkJCXhlX3NwaW5fbnNlY190
b190aWNrcyhmZCwgMCwgVEhSRUVfU0VDKSA6IDAsDQo+ID4gPiAgCX07DQo+ID4gPiAgCWludCBp
LCBiOw0KPiA+ID4gIAlpbnQgZXh0cmFfZXhlY3MgPSAoZmxhZ3MgJiBMT05HX1NQSU5fUkVVU0Vf
UVVFVUUpID8NCj4gPiBuX2V4ZWNfcXVldWVzIDoNCj4gPiA+IDA7IEBAIC03Nyw4ICs3MywxNCBA
QCB4ZV9sZWdhY3lfdGVzdF9tb2RlKGludCBmZCwgc3RydWN0DQo+ID4gZHJtX3hlX2VuZ2luZV9j
bGFzc19pbnN0YW5jZSAqZWNpLA0KPiA+ID4gIAlpZiAoZmxhZ3MgJiBDT01QUkVTU0lPTikNCj4g
PiA+ICAJCWlndF9yZXF1aXJlKGludGVsX2dlbihpbnRlbF9nZXRfZHJtX2RldmlkKGZkKSkgPj0g
MjApOw0KPiA+ID4NCj4gPiA+IC0JaWYgKGZsYWdzICYgQ0xPU0VfRkQpDQo+ID4gPiArCWlmIChm
bGFncyAmIENMT1NFX0ZEKSB7DQo+ID4gPiArCQlpZ3RfYXNzZXJ0X2VxKGZkLCAtMSk7DQo+ID4g
PiAgCQlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiA+ID4gKwl9DQo+ID4gPiAr
DQo+ID4gPiArI2RlZmluZSBUSFJFRV9TRUMJKDMgKiAxMDAwMDAwMDAwdWxsKQ0KPiA+ID4gKwlp
ZiAoZmxhZ3MgJiBMT05HX1NQSU4pDQo+ID4gPiArCQlzcGluX29wdHMuY3R4X3RpY2tzID0geGVf
c3Bpbl9uc2VjX3RvX3RpY2tzKGZkLCAwLA0KPiA+IFRIUkVFX1NFQyk7DQo+ID4gPg0KPiA+ID4g
IAl2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwgMCk7DQo+ID4gPiAgCWJvX3NpemUgPSBzaXplb2Yo
KmRhdGEpICogKG5fZXhlY3MgKyBleHRyYV9leGVjcyk7IEBAIC0xNzUsNg0KPiA+ID4gKzE3Nyw3
IEBAIHhlX2xlZ2FjeV90ZXN0X21vZGUoaW50IGZkLCBzdHJ1Y3QNCj4gZHJtX3hlX2VuZ2luZV9j
bGFzc19pbnN0YW5jZSAqZWNpLA0KPiA+ID4gIAkJCWZvciAoaSA9IDA7IGkgPCBuX2V4ZWNfcXVl
dWVzOyBpKyspDQo+ID4gPiAgCQkJCXhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19xdWV1
ZXNbaV0pOw0KPiA+ID4gIAkJfQ0KPiA+ID4gKwkJbXVubWFwKGRhdGEsIGJvX3NpemUpOw0KPiA+
ID4gIAkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+ID4gPiAgCQkvKiBGSVhNRTogd2FpdCBmb3Ig
aWRsZSAqLw0KPiA+ID4gIAkJdXNsZWVwKDE1MDAwMCk7DQo+ID4gPiBAQCAtMTg3LDggKzE5MCw3
IEBAIHhlX2xlZ2FjeV90ZXN0X21vZGUoaW50IGZkLCBzdHJ1Y3QNCj4gPiBkcm1feGVfZW5naW5l
X2NsYXNzX2luc3RhbmNlICplY2ksDQo+ID4gPiAgCWlndF9hc3NlcnQoc3luY29ial93YWl0KGZk
LCAmc3luY1swXS5oYW5kbGUsIDEsIElOVDY0X01BWCwgMCwNCj4gPiA+IE5VTEwpKTsNCj4gPiA+
DQo+ID4gPiAgCWZvciAoaSA9IG5fZXhlY3M7IGkgPCBuX2V4ZWNzICsgZXh0cmFfZXhlY3M7IGkr
Kykgew0KPiA+ID4gLQkJdTY0IGJhc2VfYWRkciA9ICghdXNlX2NhcHR1cmVfbW9kZSAmJiAoZmxh
Z3MgJg0KPiA+IENBVF9FUlJPUikgJiYgIWkpDQo+ID4gPiAtCQkJPyAoYWRkciArIGJvX3NpemUg
KiAxMjgpIDogYWRkcjsNCj4gPiA+ICsJCXU2NCBiYXNlX2FkZHIgPSBhZGRyOw0KPiA+ID4gIAkJ
dTY0IGJhdGNoX29mZnNldCA9IChjaGFyICopJmRhdGFbaV0uYmF0Y2ggLSAoY2hhciAqKWRhdGE7
DQo+ID4gPiAgCQl1NjQgYmF0Y2hfYWRkciA9IGJhc2VfYWRkciArIGJhdGNoX29mZnNldDsNCj4g
PiA+ICAJCXU2NCBzZGlfb2Zmc2V0ID0gKGNoYXIgKikmZGF0YVtpXS5kYXRhIC0gKGNoYXIgKilk
YXRhOw0KPiA+ID4gLS0NCj4gPiA+IDIuMzQuMQ0KPiA+ID4NCg==
