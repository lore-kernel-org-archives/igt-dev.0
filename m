Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6343FC369D5
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 23:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D9510E15E;
	Thu, 24 Apr 2025 23:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doaNUuxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977E710E15E
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 23:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745536282; x=1777072282;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=QTCkPr/rbV92/YjJEgyl4aduNO7BuATIOM7AN9LXTA0=;
 b=doaNUuxvGy79QRY5Sd+x21FOE+S6rMls+q6o45TeeJI1fOSnUkId00AS
 bXhQRX8Q1Ohx09rmhD0iBShwATuN+zFnv1SfZw6U5Vrsi5m6xR86D3EOy
 XvvbBp+hkNpAuOTjtQmrTPeWbs1KdIKtrlkFKrxdOg2e/s+L7W+v3yVSk
 Xh3RnPLqKV+zziH5sn2Jch/30csxMWiGIM7q4ZkcnG8Te2F4uUXQsdcqj
 /mbCFEhOcZ6XLKD4SVtiH+uXi0oiHlhxXYocPWNAQzNtw9oMyVlBdnavr
 YTPLL52zRsvSGBCc4mYDmmq2ONAhJs+aJC6Td07vGtJsXuRa41RWNH+C7 w==;
X-CSE-ConnectionGUID: iTAQk/QWT1CVQCU37NNr+g==
X-CSE-MsgGUID: RkO+7ZnmRqSfZ97KsmgVbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57390038"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="57390038"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 16:11:21 -0700
X-CSE-ConnectionGUID: JbSFyCh3QpmZMUxQHqOkVg==
X-CSE-MsgGUID: iHxylZqGTde9PneI7Wg8OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="132488672"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 16:11:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 16:11:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 16:11:21 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 16:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b99RpGwmBOWl1DptyNgww0J/jFSis63146/VeOxkbtBcm5zSfTryd9vmYDtZtaTNPKRXMkpr/hjUjg0g0HNN7hKDu1TeEE65uRJgj+TaBuMb4fhqWDq5fV56ypGfZQYY9reW656jgdE0MBibLUFyOn8dWrnPh0aZtu+u90UgMEtI0JHOXYqi1kjQJ311UbZYShbzQGB/5SE1bZnjKZ4BkVPBdzN3miJY3IdgowR0vVbd6rHWsK8jrgmLuXQCgWR0clm59w+yKhrh2d51P92kAZILZoB62+87u6soJcUZy3YXN3kmKTKZY/KXMzeqATWRRy7vF6d3o1izBS35MxZ30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJD6uzFIuIWDZvLX7fg2UOof1S54WL/prb9niKdMOEg=;
 b=AFAYIQmgzjf6ujBE/Z7iXtf9CdkH7KNbA9AADWrn96/hSEV46gbpx5maSdQzw6AkdiG3zRHjp9qbs+0+pcXLvCpecCMeQOd3WsJMJq1+q/yjZ9aUEODpkYskSw/TTHQHexZz5lhWFxHt/h2U2owFY4wpXlbdk/ErBjQidmaB4qraz5Ycge938bvercUlIxJaXSj17GpZwtZsmZ9232UGEzzKfId/9hkNuKfv51uoPaIsAI4UNEY51E3/hboGhydoEXbrYkPeigHAF0QK5AM4imDGUXNeFOTYNmJbDIZQ0ZFzIjENf+EzWnKfNdY+ocvb5cLgdwdQydc3shd4S8USAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Thu, 24 Apr
 2025 23:11:02 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 23:11:02 +0000
Date: Thu, 24 Apr 2025 16:10:56 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] tests/intel/xe_eu_stall: Add tests to run blocking
 and non-blocking read twice
Message-ID: <aArFAE4mgwgRJDj5@intel.com>
References: <eef990ac70dd804c500c31d801e7329a364cd6fd.1745376823.git.harish.chegondi@intel.com>
 <87a58623sp.wl-ashutosh.dixit@intel.com>
 <aAljdg7bjcW9Fbbl@intel.com>
 <875xiu5v3a.wl-ashutosh.dixit@intel.com>
 <20250424102122.fp555xr6zvrfwvvi@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250424102122.fp555xr6zvrfwvvi@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MW4PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:303:87::26) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 1531dbec-9949-4529-4e58-08dd83854877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnpzdUdHTnlnRW1yYmZLVlhDRk5MelFEREZVZDl1T0hPSkFQUmNITzBnWWhv?=
 =?utf-8?B?MTBkNXRjR2NkelpWWEtxSFpOTzczMGVZbEhqdGwzaE5nYWRZNC93TTE2MWlO?=
 =?utf-8?B?MDJpQ2k0dEhRc0k0MGhNWGtVcDFvTmluYjlTVmpRUmRJcVI5SjVhMWhYNndJ?=
 =?utf-8?B?cGc1NFc3K09GbnNpcWhEL0lVcmsrd0t3TzNwS3Iyd3JVMUttU3ZVT0pQb0ti?=
 =?utf-8?B?UFpoTmFkS0M2QmYxSDFzcWozV1BuYkk0ZHRtTUdVTUwxaVQrSWRpaENOMzMr?=
 =?utf-8?B?dHpLaEFJYXlKQkNGcEJXN0YvNTVOUmgzVEVYMXphd0xjS052a3I1STlubWZr?=
 =?utf-8?B?Ym9vL1ltb3VqWXVrcG9tUXlxc2VrUjY2OHNPd2dIdWtXSXNsTFJTZGpjMDlG?=
 =?utf-8?B?bTQ3cGdEbHVxZEI0STdLZURIRTdLb1ZhN3FrVitkSHF1d2FBeFRwRjZ6d1c1?=
 =?utf-8?B?TEtrQVJyQzJ2TWI4NDZTa1VkSGttdlVFZzJtVWkrL3d6UlQ3bFRJQ2t1Rk0z?=
 =?utf-8?B?STBkK1JMeERyUGFRSUM4SDVJSlZrcVJTWFNtQ0srcWszSGdxWmkrc2ZtbThG?=
 =?utf-8?B?UlJ0ZUtweWp0cm8rSC84cUtrMWJOTWwwMDdrSWdmaE5OTGZUUmk2elhYZGl1?=
 =?utf-8?B?MVhvKzVuUkVvc0p4OUxvYktpQUFjcWpMaE9DWWd0elhpUzVKUmNoeFFaYUZF?=
 =?utf-8?B?NFhQem0xa1cwR0ZyYTluck4zcVNNQmVraEswYWFqeXI4bmRsaGZiVmIrYTZa?=
 =?utf-8?B?Qy90WnEvZGk3b0VkVnYwTE9UdStzMERmVU9OYkxJR0VVNlpDd2daZkErZGJD?=
 =?utf-8?B?dWs0bVJydzhKZE14WU85SG5sOFdITFF1NXNMcnVwVlpaVzYvS0VpLzBiRnhZ?=
 =?utf-8?B?a2c5YmVoTnZEREVYTUcyRXNEejd6b0tUSW1XS1VOMVpGSkkvbW9wMnlXU1E2?=
 =?utf-8?B?VzdTd2szb2RQcGhUNmNzZCt5Qk1IeStWTEhnTzhCVStVS080TmFqMzZqOHRq?=
 =?utf-8?B?aXpUajdmUDBBNkc4RDBoU3pHL0llZWg5SWc4enpaQmhIUjBuRncwbzlwSGNu?=
 =?utf-8?B?bFBBeXBpWUF1YkZCcFhjS3FCNHROZ2phM0lHdUFPSzNZS1N2Q2FMMHlyVklY?=
 =?utf-8?B?YUtHYzVZZHZjUWloakZRcmw2NHRTZWsxSldZaDFHZmNnUEg3QWhQb2xnNXhl?=
 =?utf-8?B?ajlmMXFJUGFnYjh4bURDZ2hGbk56UDhjQkhBUUlMNTFqUCs2SGNvbzZGVVVh?=
 =?utf-8?B?M3FJSjhPTVRWcTdTVlc3V3lnTDRJcTBtc25KZFpDTjIweHB0TjI0Q29jWUcz?=
 =?utf-8?B?aEpVZ1E4cjN0WkI4MW8vYVZKU1BicDY2YU56UmRqQVlMNmF4Mm9yWTdaYk03?=
 =?utf-8?B?K2FtNkMwb2UxM0JTbnNPVmNlRFlvVy84SkFicXN2cnQrTzErVmczVmtWQnhX?=
 =?utf-8?B?Wk85SGJDRUpsUCtRM2FRaXdhU3NIaU44S3RWMHcyd1RMYUswaDF4OWs1bkpN?=
 =?utf-8?B?Z3pzc3pPN3RMdFkvRnRseXBIREhzZEI5VytUTkRhQlBmN3lPT05LbFhwVmhm?=
 =?utf-8?B?ZldJcDhZTERTeWVpUGFWcVRvYUt5MzdsMktPRzFsVzFpZlFKUEg2ZGQ3czFV?=
 =?utf-8?B?T2ZmUEhuWG5Ob0syKzBhT2plZ09TcUI5c0xSbWlqcFdnTmE0S0lEaFhHanlh?=
 =?utf-8?B?WE0xbnVkL3BhVVI0R20wSHptcFBhbkd3ZG1Ja0FudDhCL1pKcndkZktkeTFp?=
 =?utf-8?B?SEpJK0QvSGhvRTZrWGswczk2SExRTmY1cENQNVFsZVJ4L3prak9VZHMzTzZp?=
 =?utf-8?B?K2JXZUxOdkpyY2x3b2x5bk5JRDdWTXpqYW1HSnNCNkIyT0EvWWpPUWdRVXlS?=
 =?utf-8?B?cXhWSGdUVmxTRGxKZkJOa3NyYzFjYVp0QThZeUY3bnFFb1hwSDBQZTVxS0V0?=
 =?utf-8?Q?V32EaeliynY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZ4NEZWTzcxY0RLZkVmYkJDVHhydmozTGxnT3RJNWVzRitxWkRFTHJKZnRo?=
 =?utf-8?B?NDdtS1c5TzdRVysydVlZRExaQXdZRWJBZGRLb3g3WHhEd09iV2FUZlp5N293?=
 =?utf-8?B?aHk5bThlZzhFRDUxTk9XN2tUaU9XVjNmMUlLb0IwbTVUdDN4dnlBdlVZUHVC?=
 =?utf-8?B?SmFVbDZoVUQ5dUxoRlNFQVBWakJCa2wxSFQwRFVUVjhnbkNwQm92UUk2MVFC?=
 =?utf-8?B?eEE5eFRHeTZDRDZKeEtmazNXMlRPbU5qTThtTS9UdFFrNW9pZmZNV2RITHlp?=
 =?utf-8?B?QVRleUlpNC9IVXIwcGwyUVE2czkzZXZoY2dGTjZvdDAydS9lQWJqN1NKOHlx?=
 =?utf-8?B?QmNQeE93RnRLOFBPNEd1WTZjQS96b1Y5UkVsdEtSbTVCWlZNQ2trb0hJczMv?=
 =?utf-8?B?andCRmNQVkpTRDgxei83OEZTZ2d5b3RxNjJTT1VmZkMwRFJyV0J0SUgyYVhM?=
 =?utf-8?B?dDh5STJXeTlSd3BOQTlNWW5RTi9uRVcyaDdrUlMxZ2VmYXU3RlIzWVFOMW5Y?=
 =?utf-8?B?cW9pOGxFZkQ4V0JRc3BQSDhYV0d6NW5BSFNRV1JWK3FZRGVjbks0ZWdYR2pO?=
 =?utf-8?B?L3phM0t4bnIyOGEyTDhHTFNMTERrR0RlblFUdFpzWTVHL0V1Z0ZGM210Z0Rm?=
 =?utf-8?B?R3JwdkFpYms0U05sS0MxKzVzeVhqcHRvdHRIOVpoYnF3dEZUdUVMd25iRkNG?=
 =?utf-8?B?UnljaUxjbEZoc3U4dkF1RTEzWTVqZHlCTC8wMjhadWQva01hTXpqVmRNS2xt?=
 =?utf-8?B?ZjFLbVkwbzZ5cjFEaTFOUXpBWU1heGlGLzh5SE1kWmhRQVdvQ0x5amd3VTlz?=
 =?utf-8?B?ZmJDY0RkV21Jc09TWUIzVW1HUkNOZUsxMzdjandodElJQ21RY2MyQnRkaWJq?=
 =?utf-8?B?VGFSU2t1R1VnN3Z5T25pUzE4MWt0YWtpNjFyS1B3cFNEamQ3VW5xMGl0NnBv?=
 =?utf-8?B?VDVJVGVIVVI5SlJCMC8zbzZUdE1UQ1JVUUNJRkxWSHpSejhjajRyMWkrZkQ0?=
 =?utf-8?B?UDdjUlVsdGxLL3hqdjRGYjB1UzQrc0plemxMdm92SURyVUZVZXdWS2NZYnBi?=
 =?utf-8?B?dVBsQXVoZVA1VDRWSjJNOEdkenRjY0o4bHhuMlFmQWRVMXlNTlp5ekN3TVdR?=
 =?utf-8?B?SmJEWWwvYnNmekx5YS9vM29qb1JZRFUzMTk1cjJRamorUGMrZ040V1BGSkZZ?=
 =?utf-8?B?Q1o0aEtiTmRJQ2F5ODVBVmd1cVpTczZYSkdLRFh1aXNWdU9JU0Y0MHdpNGQx?=
 =?utf-8?B?V3dlU1NVdlhPaDA5dFg2emhtd0tVUFhVbWpzTGIyaDk2KzVremxDbktTRFp1?=
 =?utf-8?B?UXpHTmcxcVZ3OFc2Rjc0d3R6MTJnbkRZK0ZFNWR1bVZNOUJKVElkc3lFRENI?=
 =?utf-8?B?OTY2eUYwQ3hWejZtSGtOYjhkOGF3K3dVMGtNK0lVR1FmcDU1dElScks0WTBj?=
 =?utf-8?B?V3lyd0svWS9vc21DR3EzaUFjWUF1QkN6SmFPUGZHd1RpUXpjdDJOZVhGVkdK?=
 =?utf-8?B?NDAwZTVCcU50Q3NPbGpiakhRODYrajVFQ0UveHBvQlVqYXJpS1lhcFRyYS83?=
 =?utf-8?B?TFFRUmxzdzg3NXJ0K0orenBlZEdNUUhQQlZjU1dSMWphVWlwU2ZpMGZGSHhI?=
 =?utf-8?B?MFZYSUF2c3hoTmZTU3JEOGxNSFBlWVBrL3FDYmVZWjJ1WXRTcWRtYTEwOCtP?=
 =?utf-8?B?S3l6WjJ6eG1pekJSazI5V2FZc0oySnJmbi92VmU1TWZzaGRaMHZxdzN5elNr?=
 =?utf-8?B?MStobFhjN1ozb3ZxUWp2QXlWM01GNnF0UDF3ckFtWEVnY1FGZFVuNUkwR3Rk?=
 =?utf-8?B?dy9nNzZJVWpJYmNnR0cyYitrUGRDNWRmVDBGSmVoZDArS00wMSthakV5dGhL?=
 =?utf-8?B?VVNOV0c3L1VHaXVKT0Fod08wUHFZS2EzbFBFS2NjL1JieVE1NWYrdCsvNWNH?=
 =?utf-8?B?d1c1TThDVWxOS2Jhcng0SHR1a3NNaWVMRWd0K1I1clBpd21jMDJrUlBodzdq?=
 =?utf-8?B?Tmg1d0lIeTlLUUhHNjJTUE5CQ0lkYmN6ZFZZWlI1OWVFdlhORmdmZVp2Z0hV?=
 =?utf-8?B?UG9BbWNRd3ZmaTQ2Qlc0YTc4a1E0a3ByTkxiRkxtUzdlR2RUWmVNTUo0T0Rj?=
 =?utf-8?B?R3ZUQWNpaWRMVnlnZ01WWktnbjFzOEtHUmpuazBlM0dINDRYOEpEOWxjUUI0?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1531dbec-9949-4529-4e58-08dd83854877
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 23:11:02.7633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04mQuAY7fmUCtY4x9Z1zB2McfqR3R2sOP/iVll3Lr8JAVD/H8Un7WVpJr3if/2tRCSHR9AljHw5Cx52eZXKp1FpxpDq20hdPtN+iN/fFrJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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

On Thu, Apr 24, 2025 at 12:21:22PM +0200, Kamil Konieczny wrote:
Hi Kamil,
> Hi Dixit,,
> On 2025-04-23 at 16:14:33 -0700, Dixit, Ashutosh wrote:
> > On Wed, 23 Apr 2025 15:02:30 -0700, Harish Chegondi wrote:
> > >
> > > On Wed, Apr 23, 2025 at 10:20:06AM -0700, Dixit, Ashutosh wrote:
> > > > On Tue, 22 Apr 2025 19:57:34 -0700, Harish Chegondi wrote:
> > > > >
> > > > > Add tests that enable EU stall sampling, read all the EU stall data and
> > > > > disable EU stall sampling, two times back to back. Add tests for both
> > > > > blocking and non-blocking reads. Also, add a check for the presence of
> > > > > /proc/sys/dev/xe/observation_paranoid file which is required for the
> > > > > unprivileged-access test.
> 
> imho that second change should go in separate patch.
I will separate the second change into a separate patch.
> 
> > > > >
> > > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > > ---
> > > > >  tests/intel/xe_eu_stall.c | 44 ++++++++++++++++++++++++++++++---------
> > > > >  1 file changed, 34 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> > > > > index da9bd7843..15d4589c6 100644
> > > > > --- a/tests/intel/xe_eu_stall.c
> > > > > +++ b/tests/intel/xe_eu_stall.c
> > > > > @@ -14,9 +14,15 @@
> > > > >   * SUBTEST: non-blocking-read
> > > > >   * Description: Verify non-blocking read of EU stall data during a workload run
> > > > >   *
> > > > > + * SUBTEST: non-blocking-read-twice
> > > > > + * Description: Run non-blocking read test twice with disable and enable between the runs
> > > > > + *
> > > > >   * SUBTEST: blocking-read
> > > > >   * Description: Verify blocking read of EU stall data during a workload run
> > > > >   *
> > > > > + * SUBTEST: blocking-read-twice
> > > > > + * Description: Run blocking read test twice with disable and enable between the runs
> > > > > + *
> > > >
> > > > Not sure about the "read-twice" name, i.e. not sure if that name clearly
> > > > communicates the purpose of these new tests. The purpose to me seems that
> > > > reads can be done after a disable and enable, correct?
> > > >
> > > > Maybe "blocking-enable-disable" and "non-blocking-enable-disable" are
> > > > better names?
> > > Yes I will change the names. How about non-blocking-read-after-re-enable
> > > and blocking-read-after-re-enable ? This would convey that the test
> > > would enable two times and a read after the second enable ?
> > 
> > "read" is sort of obvious, e.g. OA uses "blocking" and "non-blocking" as
> > the names, without "read". So, in the interest of keeping the names short,
> > I would just name them "non-blocking-re-enable" and
> > "blocking-re-enable". But anyway, the final choice of the names is yours,
> > the patch already has a R-b :)
> > 
> 
> I agree here, please keep names short and informative (which is hard...).
Will do.
> 
> > > >
> > > > Otherwise this is:
> > > >
> > > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > >
> > > > Let me know if you are going to change the names. Thanks.
> > > >
> > > > >   * SUBTEST: unprivileged-access
> > > > >   * Description: Verify unprivileged open of a EU stall data stream fd
> > > > >   *
> > > > > @@ -33,6 +39,7 @@
> > > > >  #include <fcntl.h>
> > > > >  #include <poll.h>
> > > > >  #include <sys/ioctl.h>
> > > > > +#include <sys/stat.h>
> > > > >  #include <sys/wait.h>
> > > > >
> > > > >  #include "igt.h"
> > > > > @@ -460,13 +467,13 @@ static void print_eu_stall_data(uint32_t devid, uint8_t *buf, size_t size)
> > > > >   * while the parent process reads the stall counters data, disables EU stall
> > > > >   * counters once the workload completes execution.
> > > > >   */
> > > > > -static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > > > > +static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int iter)
> > > > >  {
> > > > > -	uint32_t num_samples = 0, num_drops = 0;
> > > > > +	uint32_t num_samples, num_drops;
> > > > >	struct igt_helper_process work_load = {};
> > > > >	struct sigaction sa = { 0 };
> > > > >	int ret, flags, stream_fd;
> > > > > -	uint64_t total_size = 0;
> > > > > +	uint64_t total_size;
> > > > >	uint8_t *buf;
> > > > >
> > > > >	uint64_t properties[] = {
> > > > > @@ -520,7 +527,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > > > >		flags = O_CLOEXEC;
> > > > >
> > > > >	set_fd_flags(stream_fd, flags);
> > > > > -
> > > > > +enable:
> > > > >	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
> > > > >
> > > > >	sa.sa_handler = sighandler;
> > > > > @@ -540,6 +547,9 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > > > >			_exit(run_gpgpu_fill(drm_fd, devid));
> > > > >		}
> > > > >	}
> > > > > +	total_size = 0;
> > > > > +	num_samples = 0;
> > > > > +	num_drops = 0;
> > > > >	/* Parent process reads the EU stall counters data */
> > > > >	do {
> > > > >		if (!blocking_read) {
> > > > > @@ -574,14 +584,16 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
> > > > >	igt_info("Number of samples: %u\n", num_samples);
> > > > >	igt_info("Number of drops reported: %u\n", num_drops);
> > > > >
> > > > > +	ret = wait_child(&work_load);
> > > > > +	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
> > > > > +	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> > > > > +
> > > > >	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
> > > > > +	if (--iter)
> > > > > +		goto enable;
> > > > >
> > > > >	close(stream_fd);
> > > > >	free(buf);
> > > > > -
> > > > > -	ret = wait_child(&work_load);
> > > > > -	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
> > > > > -	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> > > > >  }
> > > > >
> > > > >  static int opt_handler(int opt, int opt_index, void *data)
> > > > > @@ -634,6 +646,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> > > > >  {
> > > > >	int drm_fd;
> > > > >	uint32_t devid;
> > > > > +	struct stat sb;
> > > > >	bool blocking_read = true;
> > > > >
> > > > >	igt_fixture {
> > > > > @@ -642,6 +655,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> > > > >		devid = intel_get_drm_devid(drm_fd);
> > > > >		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
> > > > >		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
> > > > > +		igt_require(!stat(OBSERVATION_PARANOID, &sb));
> 
> This looks like an unrelated fix for a separate patch?
> It is also better to use
> 	igt_require_f(condition, "description\n");
Will change this.
> 
> > > > >		if (output_file) {
> > > > >			output = fopen(output_file, "w");
> > > > >			igt_require(output);
> > > > > @@ -650,12 +664,22 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
> > > > >
> > > > >	igt_describe("Verify non-blocking read of EU stall data during a workload run");
> > > > >	igt_subtest("non-blocking-read") {
> > > > > -		test_eustall(drm_fd, devid, !blocking_read);
> > > > > +		test_eustall(drm_fd, devid, !blocking_read, 1);
> > > > > +	}
> > > > > +
> > > > > +	igt_describe("Run non-blocking read test twice with disable and enable between the runs");
> > > > > +	igt_subtest("non-blocking-read-twice") {
> > > > > +		test_eustall(drm_fd, devid, !blocking_read, 2);
> 
> Why not just call it twice here?
> 	test_eustall(drm_fd, devid, !blocking_read);
> 	test_eustall(drm_fd, devid, !blocking_read);
With two calls to test_eustall(), it would open and close a new EU stall stream for each call.
The intention behind this test is to use the same EU stall stream but
disable and enable again between the two reads.
> 
> > > > >	}
> > > > >
> > > > >	igt_describe("Verify blocking read of EU stall data during a workload run");
> > > > >	igt_subtest("blocking-read") {
> > > > > -		test_eustall(drm_fd, devid, blocking_read);
> > > > > +		test_eustall(drm_fd, devid, blocking_read, 1);
> > > > > +	}
> > > > > +
> > > > > +	igt_describe("Run blocking read test twice with disable and enable between the runs");
> > > > > +	igt_subtest("blocking-read-twice") {
> > > > > +		test_eustall(drm_fd, devid, blocking_read, 2);
> 
> Same here.
> 
> Regards,
> Kamil

Thank You
Harish.
> 
> > > > >	}
> > > > >
> > > > >	igt_describe("Verify that unprivileged open of a EU stall data fd fails");
> > > > > --
> > > > > 2.48.1
> > > > >
