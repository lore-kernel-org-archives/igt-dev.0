Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18DDC282EC
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 16:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E2610E480;
	Mon, 10 Mar 2025 16:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEqwY6BU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A5C10E47F;
 Mon, 10 Mar 2025 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741623485; x=1773159485;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RR/C2OYQffWt6Iq9yMPGlQ3n1JIefX/qOOy/Kf18AtU=;
 b=LEqwY6BUqFNuM3xxIFD2TRFZveQSP60676T9DcjQ/Baf+1DJVdBHdNSE
 PL557stGcuq08sN+ZWLRWq6vJ1WPTxSS2k1sl8SvoAQSva8TX47iSd6Wc
 nBpJfNebXlybe22jC+PXEjloM6c2GsmgTo54MGWvWm2Lyjy7VHYFk9i4L
 cpLS59edyRNnsDrhY+iEE8TXKTVkKOgnoxuOQgbALXzLKg57OuO0hVhwu
 Abwevx8BdZApcscF35lrAVEVWcbEsj8RcV6JxBOtPYMiEQKkdOzw1HRrc
 cwcfeSvuKzbkgfEjrrRgpBAyb8rmCuo/zckHDhAMB+AVZmQXIl018nI60 Q==;
X-CSE-ConnectionGUID: d6Grjio/RSamJLlYHruzhw==
X-CSE-MsgGUID: c1ZwPP1zRxWuzZfbGD6KcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42507746"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42507746"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 09:17:58 -0700
X-CSE-ConnectionGUID: AiEhVF/YRZ6v+3aI0CiXgA==
X-CSE-MsgGUID: AgJ5sRUZSkOIH2wl7xN43w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120930892"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2025 09:17:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 09:17:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 09:17:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 09:17:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qjcz3uLISq9uFzBczEwsDSGmFRuwECyTNSkFTzqSX9Jxh+snYea3ofxjl/Mj7/YV8JqRpfanvTZJWojs4xTWW2txp7929HreWPN9aPRYP1bd0VLaLcQ1kMF0WHAzQf16aS6TqikmJdcSs/I5FCLyDEla4F4q/Ee65US3FB6Lh7V8Ek6q0QkRu3iZfn9WmO7MCui3RPmqmXN86SN41xKwD/c6kEVny7diMbofARVyDr7ZvVHNriSLS63rN7qoqxSwcBJ0BAIvxsJH0PE+rAO1uoheNcDpvM0YAtOqs80j99ccgD/kg0QnmUz5v8xOwe+C1CfDbmHNlSXYksIW9pX43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR/C2OYQffWt6Iq9yMPGlQ3n1JIefX/qOOy/Kf18AtU=;
 b=P05Z0OP0C7jASHdkarebaFss+zysKVdlobyRJPLVoHOv3y22mWXudFSLv551FeQLdP8DOgROK33voWCFlimb7yygc+5kiJZIBkZ1NZ3T8bcDaibdrEyvE9Eu5EUboWtyv+Hqtc0bTBBYEv8Ac7FM8m/oRKmQAen2iv3ZDhlJL6YFpGHWT0N69bYGB5fbERsMLgy+u96HtEWf/bqio3SrYqfXH+f+1hvZMKnRkcDbAmRI0FVG391JBQKGLcgcKlYn5rSCvX6ZDI+t16WosyMClt6KnAPdBp1qHPC0C4YVXjOiRU2LSES2bXiC5VKTqSuMLlaTmylwtYZTn+KhAaRfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by MW4PR11MB8289.namprd11.prod.outlook.com (2603:10b6:303:1e8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 16:17:50 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 16:17:50 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIEludGVncmF0ZSBr?=
 =?utf-8?Q?memleak_scans_in_igt=5Frunner_(rev6)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgSW50ZWdyYXRlIGttZW1s?=
 =?utf-8?Q?eak_scans_in_igt=5Frunner_(rev6)?=
Thread-Index: AQHbj/6Th1mD4iyhsUm8u+5snQA4dLNskM3Q
Date: Mon, 10 Mar 2025 16:17:50 +0000
Message-ID: <CH0PR11MB54915E08B3FE191D63C31EF5EFD62@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <174139828756.4949.16053114640855089800@18a75f3d1eae>
 <bb67e199-1a8b-4051-a76c-8dd168793feb@linux.intel.com>
In-Reply-To: <bb67e199-1a8b-4051-a76c-8dd168793feb@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|MW4PR11MB8289:EE_
x-ms-office365-filtering-correlation-id: b7fa93be-4da2-4a13-e480-08dd5fef1a81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?QXNqcDBhREZJNmcyZm9hRG5ybkIrWEpScWFMNmJldE9tVjcrRDNoM2NWZlNw?=
 =?utf-8?B?dVEwOFptZFJxSmhFNk9SWU5WRUw1TkovYURlMElHdEN4ekUvS05MVDFRSkVw?=
 =?utf-8?B?QVcxZnJqVWtQbVNPa1o1ZDFqMjlrMkg2aHcyeVpDMmEwQytNSE82czd1eFdm?=
 =?utf-8?B?cEtka1JQMDh0cSt6cU0vdGw4M1ZscnJaU0R4b05CVCtoY2VteXhZc2pwQnBz?=
 =?utf-8?B?OUVoVmMrZndxTXdXaHliMVRBelNmaWNrcHpwZFN5NEFtNmE3SkQzU1J6TWtR?=
 =?utf-8?B?YWFDaDUySGkzb1ZuVm94eHBtVVZVYlpxUlBIYk1qamxhT1dtS3RSVWtHNWhC?=
 =?utf-8?B?ODN4M25ycU9XRFBMWkZSd3gxTGY2NGdhRDlkMG85ZXNsT3phenFGa3ZGbW1h?=
 =?utf-8?B?RFEzUllBK29pbkVVaWozOGFPT3h0T0VEd01BV0YzUmNmWUZXOVBTMDhkbko5?=
 =?utf-8?B?WW1Ha0dNUHRHMGdsZGczWUV1TUtHRVlXOG42NjRzdERMSkhHbkt2YlgrQnBo?=
 =?utf-8?B?SEJ0MDlMVld5Yy9RRjRjVHBrWm5mT3JMNUtReHE1d3V2N1cxVTFLc29vd1pM?=
 =?utf-8?B?OGlBbjVCL0cwSDc2RjkvcHRCUkRhaXVvMDYvYmFmUTFuUEZuOURyN3UzUTBZ?=
 =?utf-8?B?R1M5OWllamVxY0RsVkNSeVEvbzJiMU1obU5oZmM2amNiUkY5Q0d5YmNad0Ez?=
 =?utf-8?B?dVZZZDZ1VEt0dFpuVjRibEtIci9iMEdFRU15ZFZ3WDJKeXp3UnA0TElBTmVp?=
 =?utf-8?B?bHZmN1Ivakh3dlZxbE84ZjdoVVFzTjNramFySC9ISGlxeVhvbElNMnNET0xN?=
 =?utf-8?B?bVBlZ0dzTlRPcC9nZmI4MnVuQURwelAvVDFKbHNDOHVMZGoxNGtEKzdsUHAx?=
 =?utf-8?B?dVhQL0xvdjJuaWxocEhwelI4TVBpOWlUSEt3U2dBWU1IWjlNWEF1dWNSZFNN?=
 =?utf-8?B?TlRLeDFnVGQvUE9UaFMxNitrcFV3Umxra2twNWppNDZRTUtqeE5FWGtQeWJn?=
 =?utf-8?B?Qmw5T0NySElIMjR4cGQwb1Z5azZ2SUV1TlF3Y3h6SFNkMEZWaGpaZksyRTZz?=
 =?utf-8?B?d3Z5ZSt0b09nUytwb2FBeWFCOW5lSVkrZTFmZkZoTEdmdnBoT21wUExzdG9n?=
 =?utf-8?B?dVM2b01teUc2TG1YMERaZlovNXpKbzJNT3JySHNZTHgzekMrMmhjclFoYnNs?=
 =?utf-8?B?T1NPWUZXQkEyTk1GZ0g4dEhlQTRrbjFad3hQMzM0Y3ZVemc5Q3NCc3VHZlg1?=
 =?utf-8?B?UmpMQkFxUW5VNHgzMVd2Zmd4RWc4NGZVb0dlcWEzakRtUXdYeU8raTZhYTdJ?=
 =?utf-8?B?Rm5meTZOWEx3ai9Vb0JRd09iZHlMaUF4eFVkNUZ3TE5UNm5WTHF0aWZVV1pH?=
 =?utf-8?B?YXc0SnpZekhMRVpNTEk4WXRlZ1NaWjNad2N3L3plK3hRSTJxdDlGbkFPUjlk?=
 =?utf-8?B?akhnOWdjMUhpYVBOOUxYL2kxTkZMSVVWcjFFdG44ZVBrUm8vK1NId2tXMVJB?=
 =?utf-8?B?WFQyYlE1UGNWRDNQV2QvWXhWVTduVlFUWHkvdlpKeENTaWcvWDh5SlJ3U2g5?=
 =?utf-8?B?Yk04SWliV0g1aXRJa1M0VmNPZ1AvdDkvUkxWMEVva3FIN0ZBMEY0bnJ1bGRQ?=
 =?utf-8?B?YW16T3JxbEV3TFd1RTFwazRqUTdoUU9la1Z5QVIybm42TWVVWHNxdmxHYXl0?=
 =?utf-8?B?SU9MUGdsOTcwNW1FT2t0aURoQTd2QlF3bWVJQ1FuczZIZTF6b09zdTBraC9i?=
 =?utf-8?B?QS81ejZ0V3paTHJIWjdzVUVvVHFvM0NsLy9qSlc2a003eHlXRGt3SzRsMTJF?=
 =?utf-8?B?MGUxc3RjdlZWRWwwSk96aFVDRHV0ZHNKdi9YRjZwRENCL3hqUk1RQ1lSVkR1?=
 =?utf-8?B?RFNCSVFrbmFTZHY2QmZaQTUxR1dzV2gxeFVtTHAxYktuaEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700018)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHNZcHFhUDYwNkwxMk5kL0NzdEJpNmdqcSsyOWd4bElFeVlCbUdKN0grNVZW?=
 =?utf-8?B?cnpyMVpoMzhkbitjTDJaSlMxOVVvVHl5SEJDenVJSnBYb2RSNjU1K1ZiQXJV?=
 =?utf-8?B?emRvQ0NVVzdScUJHMXM5TEduK0h3YVlORzhKOUVGMWQrU0lTZjlGWEJBeW95?=
 =?utf-8?B?QWk4S21sRkVtQWtweWhhSE9rbXRQcmNJSUdZZ3VraSt1a2hoMG9ZaXA5enNR?=
 =?utf-8?B?cjJaRUs1T2xKMjF4LzkvcFRVbUZPTXc2cU5BM0M4K0Q2VWYzYW4wTlVCOThW?=
 =?utf-8?B?Z05JZ3A4SW5qOW1MRDc5VzUrZ2UxRkpTZHZ1ZU5RM0VxZlJJNXVpb0JTaWRp?=
 =?utf-8?B?SUhtZXFZK21TTU1NOVJYQ3lhSk9mWkh4MEZ0ZnNZcE1lMlVlQThtRkcrUTZo?=
 =?utf-8?B?d1RkZER4b0tqU3NBV2VxU2xoN0FZTUdBRW5SUWFWdDZQOUMvcjhKMGxUcENi?=
 =?utf-8?B?c2hhQzhVcVk3OGdmOXNtaG1kZVFLa1BHU0xiMitxRm5QaG5HaEF6eFpoc1lU?=
 =?utf-8?B?MFE5UnJHNi9BZlp0WmlNT2FVM0dPN1JhVkdVYlZ4SE5DSzh4NVNiYnVRVndS?=
 =?utf-8?B?WGZSVnNpa1RVc3RRQmlZckxBVzZiSFY3ZitGRHI1aGl0djg1NUUzZDR4eFlR?=
 =?utf-8?B?eHNFY3ZYcVRVUkp4VHh0enl3VG5xYUt0NzYwR3BUeThkZlBDZS9LcU51MkNr?=
 =?utf-8?B?ZWwwSTZ6Y2pYcnVKaSs0aTArUlp6bGpQRHJNalZDVzhnYzBXUy95bkJwTTQx?=
 =?utf-8?B?NmhjUloycGxWcWgwb3RMa0xBR0JzNHMxYjI0VzNOV05tUENuZHdwalJQYnRa?=
 =?utf-8?B?V01iQ0VjNVVhYmlMc202VlNKS2lLUWZ6c1pMcTN3cHI0MG8zZXJkVHdsY1FI?=
 =?utf-8?B?Vm4zRzU5MkFwOXFOOVpreWVBWXB5aDNZWmNYaE1Yb0FmaFMyMDZlYWhTNmxR?=
 =?utf-8?B?dVQ2UUJMZitxZG10THlBbjRHZ1lRb0o3dnJPTlQ0d0NaMDFVU0JJQS9HK2tj?=
 =?utf-8?B?eUNMcVQrSEJnbWtPR0dFNmpQaHlCRUdwaGsxMklqSzJzMUVqUDBlSmR6WFhO?=
 =?utf-8?B?Q2VaNDFoMnQ2NnI5WndidHdzTFhuTzU0ZnpTMXd4UXRJOW5BWmVyM3I5Zkl0?=
 =?utf-8?B?a05uWEdkM0t4ZUIySko0V3pCaUNSa2dkRTM4QmJVRkptQUpzdjdTMCtqR2Zj?=
 =?utf-8?B?OTliWWVJVjE4eVhESm0xdk96S1V3QzVTcC9aVE41b0R2VXFMU1pqS1p2WXZw?=
 =?utf-8?B?ZzRzYWFybzBFUys1THVRbktMUGVaUnprTWFSQ1ZEQVozZnloL0NNYWVxdlJQ?=
 =?utf-8?B?NXJPOW1CazZUcHJXcUtFMEt3cFBjMW5tTVREZFBNUHhXVHc1MnR3VE5GV2w2?=
 =?utf-8?B?ZGozd1BQSHB6NExVWDNFd0dXVWZiMTQ1bkRESzhoTmZRVitQdEpoTDNVZ2JU?=
 =?utf-8?B?d09Cam5iNzhKTWcyWm1XNDdwVnFKRlQrN0NIc1lsMUpuN3B2SnRXY0tuUGk2?=
 =?utf-8?B?KytLaHZ5RUZqZ01SSWdIaEovelJGMi9Sc014MVl5Nzh5eUpIb25jUmVQdGpn?=
 =?utf-8?B?RjNsU3FLWWp4OXUzZHhWR1l2SXlYeGZlU1B1Yis1WDA4VDNEaEg4d1NzMEhP?=
 =?utf-8?B?UkVMQ3VLaWFTQWRWQUFoTGdOZjcxVHhDV2FiVHlvTHdZeE1pN2M2YUJFeHgr?=
 =?utf-8?B?R0hLR1VidDZXclBIbVZySzJ4OEp4MnRBSkpnaStRck1zT2x4dmJJbm5makNk?=
 =?utf-8?B?bnp6TzB4c0s0U1VkOGlRYU9BRDc3dUdzOE5mU29yY1VRUjJsY0wrZzV2aHFv?=
 =?utf-8?B?Z1BQWnF3ZEwyTkdiQ1N6bGQyOXNwU0pQTGVZRkVidUdTWnluSG5EZVRDRTRj?=
 =?utf-8?B?SkNHMXVZSkQ2NjFwdVd3cVFNcmFvckxWRG5CRHROdTdacFhyalJ1U0huQU9n?=
 =?utf-8?B?cExhdVZ6aTNlQlZXNDhOWlloSkFFaFptdDhZL3QvNmhsWVNaekZDUmhsK0xq?=
 =?utf-8?B?YUU0VTZUZ25OSXhtYmF1V1lsdkkvNU1tNTU0ZlpzbVg4Wkowb3ZMNDY4Z2Yz?=
 =?utf-8?B?TUtIV3B6T0c3RHEyNlQvLys4Qm5HZVJlYjRMaTZpblkybUdyUnkwNUV6OVoy?=
 =?utf-8?B?eTBnelY3eC8zbUtmQmV3Uk1YSU1oODFPN1dKTkNDVGlWVDN5VVlaOFNOc1Bp?=
 =?utf-8?Q?nqPQR5EFJTnMqVXuOMr64tNLGEM0rtRZf3TmBpq7lR7R?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fa93be-4da2-4a13-e480-08dd5fef1a81
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 16:17:50.2499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bd+P/LO4Ckam6iJepVJplJP6YQgzgiJYN4LjwPPtnbhdEthPB/YzARNqMdtL9jzLzIYXyMsLmV+BDTDSW+D9bPXevjx+vf2kyxn1t+JSpvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8289
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQzOTk2LyAt
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5GVUxMIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClJh
dmFsaS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEg
PGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
ZiBQZXRlciBTZW5uYSBUc2NodWRpbg0KU2VudDogMDggTWFyY2ggMjAyNSAxMzoxOQ0KVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIEludGVn
cmF0ZSBrbWVtbGVhayBzY2FucyBpbiBpZ3RfcnVubmVyIChyZXY2KQ0KDQoNCkRlYXIgSTkxNSwN
Cg0KT24gMDguMDMuMjAyNSAwMjo0NCwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0
YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBJbnRlZ3JhdGUga21lbWxlYWsgc2NhbnMgaW4gaWd0X3J1
bm5lciAocmV2NikNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzE0Mzk5Ni8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+
IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF84MjY1X2Z1bGwgLT4gSUdUUFdfMTI3
MjZfZnVsbCANCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+
IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEyNzI2X2Z1
bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+
ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3
aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJR1RQV18xMjcyNl9mdWxsLCBwbGVh
c2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2Rl
LCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVy
bmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTI3MjYvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoMTAgLT4gMTAp
DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBObyBjaGFuZ2VzIGlu
IHBhcnRpY2lwYXRpbmcgaG9zdHMNCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQg
bWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzEyNzI2X2Z1bGw6DQo+IA0KPiAjIyMg
SUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4g
DQo+ICAgKiBpZ3RAZ2VtX21tYXBfb2Zmc2V0QG1tYXAtdW5tYXBAc21lbTA6DQo+ICAgICAtIHNo
YXJkLXNuYjogICAgICAgICAgW1BBU1NdWzFdIC0+IFtJTkNPTVBMRVRFXVsyXSArMSBvdGhlciB0
ZXN0IGluY29tcGxldGUNCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVF84MjY1L3NoYXJkLXNuYjIvaWd0QGdlbV9tbWFwX29mZnNldEBtbWFwLXVu
bWFwQHNtZW0wLmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMjcyNi9zaGFyZC1zbmI0L2lndEBnZQ0KPiBtX21tYXBfb2Zm
c2V0QG1tYXAtdW5tYXBAc21lbTAuaHRtbA0KPiANCj4gICAqIGlndEBpOTE1X3BtX3JwbUBkZWJ1
Z2ZzLXJlYWQ6DQo+ICAgICAtIHNoYXJkLXJrbDogICAgICAgICAgW1BBU1NdWzNdIC0+IFtTS0lQ
XVs0XQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUXzgyNjUvc2hhcmQtcmtsLTcvaWd0QGk5MTVfcG1fcnBtQGRlYnVnZnMtcmVhZC5odG1sDQo+
ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTI3MjYvc2hhcmQtcmtsLTQvaWd0QGkNCj4gOTE1X3BtX3JwbUBkZWJ1Z2ZzLXJlYWQuaHRt
bA0KPiANCj4gICAqIGlndEBrbXNfcGxhbmVAcGxhbmUtcGFubmluZy1ib3R0b20tcmlnaHQtc3Vz
cGVuZEBwaXBlLWE6DQo+ICAgICAtIHNoYXJkLXJrbDogICAgICAgICAgW1BBU1NdWzVdIC0+IFtJ
TkNPTVBMRVRFXVs2XSArMSBvdGhlciB0ZXN0IGluY29tcGxldGUNCj4gICAgWzVdOiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MjY1L3NoYXJkLXJrbC0zL2ln
dEBrbXNfcGxhbmVAcGxhbmUtcGFubmluZy1ib3R0b20tcmlnaHQtc3VzcGVuZEBwaXBlLWEuaHRt
bA0KPiAgICBbNl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVFBXXzEyNzI2L3NoYXJkLXJrbC01L2lndEBrDQo+IG1zX3BsYW5lQHBsYW5lLXBhbm5pbmct
Ym90dG9tLXJpZ2h0LXN1c3BlbmRAcGlwZS1hLmh0bWwNCj4gDQoNClRoZXNlIGFyZSB1bnJlbGF0
ZWQuIFBsZWFzZSByZS1ydW4uDQoNClRoYW5rIHlvdSwNCg0KUGV0ZXINCg0KWy4uLl0NCg==
