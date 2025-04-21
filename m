Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D086C369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 12:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACE110E388;
	Mon, 21 Apr 2025 12:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S69CX2o/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8E010E387;
 Mon, 21 Apr 2025 12:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745238133; x=1776774133;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=90aBHSrPcEME0/EHUcXuQs1Z7YoVYsCfNNnxPlcTzv0=;
 b=S69CX2o/0ZvoJLoG92l3vvdYgpGu/k319YbVF3tykDd0aq3FQMrjUw4v
 W3V+qgtaX7fXbcMz3tU4FCoh8vpNmDe77G5MII9pgWLPQR9Yi42v1TzVs
 ojhy5uxsVldIvb8T8/aCYyOZOqpfoS64t+sd/3Br0UMu8e7LESKl2YEKG
 AyuQSRqFMWsU7uHoY59n+IFDqUTpt536eH5K4hJI0RTixXpZPqfTqcZ9m
 3g2g169SvfqicLLX3263Io75c3u5tpUoeBDn6+TNLUp/Fyp9iYK+nIS/a
 wSJGe5n9eUvhGs1gEtQNZHDI9wUMp1EId7PfL2kW6ZAaTTZWFYVEBrjeX g==;
X-CSE-ConnectionGUID: 5n0rNXPwRdKmA/Cltr5kKQ==
X-CSE-MsgGUID: M//avSRBSmSaxM9T1bS98w==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="34387401"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="34387401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 05:22:12 -0700
X-CSE-ConnectionGUID: orReYAaORk2F1iYffqNB6A==
X-CSE-MsgGUID: JVnxkVwMQXeMgOdtwtW+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="131457465"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 05:22:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 05:22:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 05:22:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 05:22:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir7grW3IEMxNupICTOJ6Ny7LpnKr7tv/8kGEYYDZJVMDinNIW9EeR8putoJzlC9m0QjQkBhDcJDomF9stn/srGKxd/rF3quaziWihPT+88oLUFVUFXjpel2hDnWd4Dr2yTjVv9AaTgjKsLZhgu8gNnpmk6gh9AGKEsSvP3VY/xKgc2VK36bzo05qJWesBeTopjCdrZ1mQklPjbo1xdotWXyLbRTZcd/uAo3RXfEAq+i/x5j08eP0FsUiFMbiuzgHQ51EqR4+RH5LSiWSyUNep6g3PN2Ka4VnBddaZ8GtsF+N0TV1ElsDZXf+XbEbwtotDqXpOFHZKcom3RWnWqzOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90aBHSrPcEME0/EHUcXuQs1Z7YoVYsCfNNnxPlcTzv0=;
 b=hz8TNK9m8dqgm7AfirS1Vh5QJIB+QPWSVo7OKetYVJGa5WSVB81o5PAtpTCwqNG0CpuZ4fIPkYK+x7PjI5cz9ESFeqyVNX2ZdJ7XQsF1HU4hCV1mnM4q1VUpn3h2fELd+YZIIgLaTzokQXNS0i1wj4sA+KM0L72nmscGikq+WSSkaXQ1slMRs1U4KbftsIiCHk+2JyhG0Cc1jXuQC/+yjqTJtVhmDzEqZrlqIDvFfitYf8XQlKTU7lg5YA76YTQHu+8SqgejvXivlD2QK2gbqBHdiNjNUV3Re4qTWB5A5HhmIb1X2MTKvKhtnbHVy4Mrk/wMV9SHPfOvw6o6l6dBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 12:21:55 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 12:21:54 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL3hlL3hlX2xl?=
 =?utf-8?B?Z2FjeTogTW92ZSB0ZXN0X2xlZ2FjeV9tb2RlIHRvIGxpYi8=?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIveGUveGVfbGVnYWN5?=
 =?utf-8?B?OiBNb3ZlIHRlc3RfbGVnYWN5X21vZGUgdG8gbGliLw==?=
Thread-Index: AQHbsENj2+TZMVF0DEC+drz337+Tm7Ot+ZYQ
Date: Mon, 21 Apr 2025 12:21:54 +0000
Message-ID: <CH0PR11MB549161F4AAF7F8A1E860FBD0EFB82@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250417193032.329-1-peter.senna@linux.intel.com>
 <174492616955.16326.17505699909884413079@b68e5b3b99e1>
 <e1f151be-b065-4a46-8631-a6b5ba113ec1@linux.intel.com>
In-Reply-To: <e1f151be-b065-4a46-8631-a6b5ba113ec1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH8PR11MB6901:EE_
x-ms-office365-filtering-correlation-id: 6c752897-04eb-4e5e-7aa8-08dd80cf1a82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018|13003099007; 
x-microsoft-antispam-message-info: =?utf-8?B?aVdwTDEvckkySExjeFl1VXpxV3M1ZWt6UGVEU0NvbnlNYUhLZ3dyN3g2M1Vu?=
 =?utf-8?B?bHFlQ3pLOGt2STdvR29DSWhlb2NDd3J4aHRhalRvUmNCYm9aOFB3YktyQTY1?=
 =?utf-8?B?T0RWclRnZ0QwWTdSUzVyaEp5MUVlZ0JLKzFVdXZLZ2MwTUhpTm5rMUtZL2Ja?=
 =?utf-8?B?Q0loaHUwUXNnNW45dWRSQ2oyRTk5c1VGRFE2TFR4MjVURWp4elpjZ1NjRjBN?=
 =?utf-8?B?K2ZwakYyQ1hpZGhaeWJtS1phL29xK2JIdTlsZnlzbXdqN25lS1JWcDY2MW5Y?=
 =?utf-8?B?SUlNTDd0LzlNWXhybEkyaEIyRGZVMTh5Vkl3SmhhblVvRmp1enNtVzRoZUVE?=
 =?utf-8?B?TXZaUnQ5MHJiWjI4REp5Z1o3SEViQUR6Yk0rc0k3UFE1RDZpcDhQUzRhU1RC?=
 =?utf-8?B?VGdESklIY3JLYkdyMUZXZ0VndUZ6b0Q3QUIxYTBrYmJVY3U3aHMyemdwK3Ri?=
 =?utf-8?B?SlQ3NWQ3Qk16c1VCRUE1SVcrV2Fyb3FUa1ZWWjZwOHh5QWExS05ENHZLT0hj?=
 =?utf-8?B?SlZHMEp2NUhKaXc3czFwZHQ2RjBqeExNdzNuRGwvaTVxL1kyK2RPN2ErRWRp?=
 =?utf-8?B?NW1qV0pZUEwvcXhyNWxwZjBEZ3pzQjZYeHg4QjFRUjRHbE1ENXdaZmFKK1dD?=
 =?utf-8?B?VUdIOC9sNi9nWW0wTDlwOFFiSGM2d3BVMnhIZU40TXkzQWpKVkNnajJpZ1ZN?=
 =?utf-8?B?YURiSlBWUUFpaEhzNlRpUXd2Sk1TZTZIbFp3bTc5emRLeUhWZ1ErSWxtYXlh?=
 =?utf-8?B?SGxVNmdiblN2ZzZrcnNnUzVRSE1IandzT1FkVGkxZ2FXT2FqdE1zaDFqc2Rt?=
 =?utf-8?B?ODFBWHZTS1gvS29BN3dHL3AzbjZETktqd0dqZlF1dWwxT3A5b0xLaDEvbFFp?=
 =?utf-8?B?Y1F2RmwwbDVLaFg4SXJBbEplMnBrZjgxenJRNEtqQVJtRENKRTUyTVcyMEVE?=
 =?utf-8?B?bzhxY0xBKzdWYnVNUXNqTmJYQWU3YlM1RnBnY1hiLzFnc05CSmlpTkNNTmF1?=
 =?utf-8?B?TjkvSHlnWmNtdVpXNXVmL2ZQdFJMa2lwRjBEU3BUMTZ0V3BTNWZLVklZT0tm?=
 =?utf-8?B?aTNxdDU4UUNYMFI2MXV6cHVlbnJ0TmZlS0IrMHQ4a2Q1dXBSNGFZdXppRUR3?=
 =?utf-8?B?UzM2NWlTaDdUKzlaNmRSTUkzZkNoWExzcTFKSVZ4R2lvK0xraUF0SXN1Ym10?=
 =?utf-8?B?NURlVTZieXVIV1gzOWtiRFlmTjJUa2hPTldsNGwrRW1uU3QzUlJPVzY3amR6?=
 =?utf-8?B?ZVhUN0JGYVhVQTU2cFZnUWo0SlpHTjBQaTl4L3BjazduNDV2VzI5VnZxZUZS?=
 =?utf-8?B?R1p4T0ZtdXcxMG5jcXNWYzJWOWoxZlpLcFc4d0h2djdFYkpEU21jakNubVUr?=
 =?utf-8?B?dEZDd2NRZFN5RjVMOUxwVkpVNG9ZSmhtTFZKOWNuelBPN2lWYjRkQ3p5YW82?=
 =?utf-8?B?K0R1QnFkMmVobWdkMmZIRytlWDEzaXg4alRMRHhhTWs2UEw5alVqYkVxM29F?=
 =?utf-8?B?V3dTNnNaajdZVjlhajJWdzdsTXFMcU9LUlRPMHA3YnRhdGR1N3ZwQVdNMVR0?=
 =?utf-8?B?OXgvbHVucVBIdnVFZFRkN3h1bEFXM0U3RHZsK1IwbllSRjNBbVZUTVE1a2dz?=
 =?utf-8?B?VDhsL1ExRFl6Zk9KT1RjdVkzTFVtVDRIdG53ako3bjY1cGJHMWFQYWtFVWRr?=
 =?utf-8?B?WEYyL2s3MUNsY1pVZlVwZUxBaEtXZG9zaFRXdjBobXF5dzYvYzdpemtvL05j?=
 =?utf-8?B?MkJaamxoblJmMkU5Y0g4MkVoalArVnNIcWd0OXNaR0xINlVud2R2MVR1RUd2?=
 =?utf-8?B?QUJ2RWpLbW81VGoyUUNKc05uU3ZhSlNpeTQ5U09LWUpRM2V2T0M0aVQrV0Ev?=
 =?utf-8?B?OWExVkFiTEg5aS9LaUIxa2hFQ1RoZW0zODhOakpaVWw3R0hpVEFjcWJ2MDdG?=
 =?utf-8?Q?0vKaOvHnsvI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zlc3eU1Bc0hDV1M0N0pQYVBGUk5FWHRocnRqMTN0L0ozaGEzZzV2M1RXOEZn?=
 =?utf-8?B?RzV0ZDNNa0xmMzdnOGlESGJFYzkzeURXb2ZIbFVyeUZ3cWU4VVJpUDlwZXNZ?=
 =?utf-8?B?RDhFNWljZHF4WXZTZ1lRMjc3RVZyU1pSWGxiblAyNHFMU1Z3dkUwYVRaeUtN?=
 =?utf-8?B?TXdneTFkWDZSK1gybld3aVd4MnpuTmtSWnp2SWxCemxFZ1BxRGhxMDNLWjJh?=
 =?utf-8?B?UlpTNmtTYjJGNWFtdWxtZ0o2eUtjVC9JeUhNNjZmeVhERmhZdDloK2dYVFBo?=
 =?utf-8?B?ejFreHFXTGIzSXd6NjNyazZkK2YxU0VZajV0UU1VaHpxd1NaZEVzOS9KV3FF?=
 =?utf-8?B?akNDa2FXeWRuSmtURW5FZFFxZEJZRVBkbnFhNWVQWGxucjgzOGNxaTVnSXF4?=
 =?utf-8?B?T2VBKzVYb01aQ2taa1lBa0dXVGpUa0U5T25EWHZFYWhIdUJuVzhreTRZZjZt?=
 =?utf-8?B?bjhXM3VubkZ5SndESzIzR1hWZlQ2ekdMcWlmUkhNc09RR3hERzlDWmxHMkVr?=
 =?utf-8?B?elpQa004SmRlYWdhZUxVQzNjQlpSVGx6TEIvbFZIV1F1bDZPWFhSVXFLM2lN?=
 =?utf-8?B?M1VSemxLYTZENE1OcTIyeDgrWXoyN0ZhcW50NzdzQjdkQ1V0SThOb3dXMWND?=
 =?utf-8?B?KzhLSHcwbkFCUTdBSFJtelhuK2d2VE0xZVlqcVlhcjNoeGdJbG01K0ZXelA5?=
 =?utf-8?B?MlVOUEY1L1BLVjZRb3d4SjdsT0U1ZUhqOEs0M3NKczByYUVRemQrU255R0Zz?=
 =?utf-8?B?OSsxbjEwUjRPQ0JQcG1zbllPNDArQlBZZVNUZ3FSdkNxR29Ja2t1UkRLSERw?=
 =?utf-8?B?UEcxTndrdGFRUnRQTHl0V0h0MXFYclBHcU8zL1duekJuS0NsWEVOZ3Q2UEZW?=
 =?utf-8?B?cTVzbFVMenYrSUIydTl0SngzNUxkT1pNNWdnc3M4TnV3TmRsUmhwdGVKa2Vn?=
 =?utf-8?B?bTJLWDI4bElpdmRweXM2VUhYYnlsQit1NlFjRFE0ZkJLb3ZXVnhRd2RhdDVN?=
 =?utf-8?B?aGpMQS9MZ1NrMWozc082VW56VnU0K3hYNWVSR21ZbjhWVlVEdkFZaDRLbERJ?=
 =?utf-8?B?NytmK3JhZ0NTbktIY1A4SmI0cFp4eG4xOVY0MFo3MlF6eXZpa01SQ0tJbnUr?=
 =?utf-8?B?c2k5QVcyeTQvbzNzZzJuMGJmZTdEZlRRSGRNTmNSWVBvSU9IZ3Irb3JyWVdt?=
 =?utf-8?B?eE5tb1pKUFhjaFUvWHdYeEFiODhzdHJTakZQeEpCdDV5VGtHVnJaWlFFaFAx?=
 =?utf-8?B?OHBXK0tPdlRNOUFYM2VBRzZOWXFhS0wwMDN4c3p2dlFkU3FETFV4bEdDOXZ3?=
 =?utf-8?B?YnFaTWs4OTlUWDFMT0ptL3hhUXM1M25BY1NhQVIrMGxYQzVsdEk1dktrV2N2?=
 =?utf-8?B?enArYUVyOXprR2lnV3JWTmp4ckpBaUE3dWNTemF1V0QyNEVoYU8zd3Q4ZnJn?=
 =?utf-8?B?LzZhNnFmNmZOc1VwZFQxZEg5b0N4N1VrZk4yazR6MjlzeE9GTTd4MFk5MFE5?=
 =?utf-8?B?ZEN5UjRyc0pwVUd1SEtGQWp5WFZPSElpTGtvWnI3ZzVjaHc0Vnk4UHNmMXVj?=
 =?utf-8?B?YldSYmZVZXVyRkZrc1dGeEhKMzk0UUdNWjZvRDQ1RkpWRnMveUpmNmpkcUp3?=
 =?utf-8?B?elh3UGNuOW8zTW1nT0FTemozTEdDb0p3Q0J4SElzTVBqcmhGVVdwaGhtY2VP?=
 =?utf-8?B?NWQ3TkRlZUpJK0I4dmJwdEFyMWt2a29lSXRLSURSRmxqbVRoaDVER3RMcVRz?=
 =?utf-8?B?UytkdExYN3E3UmZ2TGdVUG1HVHdiaERhY1Bmelh6cHBzQUtibW4zdml2RFl2?=
 =?utf-8?B?d1JJUTNjbkNCckRPWjhsQ0wxdHhUSjBrNHl6WkxrVEh4bUt4Y0tLK0RWMVJS?=
 =?utf-8?B?TVdvSk04TDROdk92TDZJclREdDZxc0t0SklGaHlhemFUUU9YSEJtcUkzV1pv?=
 =?utf-8?B?K044RGdTTkVHS0FGQ29vbis0eStHa2hJaVA3Y3FDcWc4RjJkbWRnZk80WXo3?=
 =?utf-8?B?Q2pNS2RnM1prcUsyeXlKM0tMZHJTcnViekJtc2hzNG9ab2tCRndOSVMzeU1Z?=
 =?utf-8?B?RHVnRWthcmFEeW1iWFFKOW81bDJKaENPV3BYNmg4ZHI5UGtOUXBUbzBjeUxq?=
 =?utf-8?Q?mcBF4tIRxD7TsEPH7+RcnI8Vu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c752897-04eb-4e5e-7aa8-08dd80cf1a82
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 12:21:54.7484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NWdWTS62M4GGl+4rZT2CVTu3iZlF8Y0gaFY2rOZrR0Y7Kjud73uvUFNoH0SiLhPDHDQ1oVvESIgwY8CMhTJU9X8X/BR7UHRlqikcUJab9iE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ3OTM5LyAt
IFJlLXJlcG9ydGVkLg0KaTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NClhlLkNJLkZ1bGwgLSBB
ZGRyZXNzZWQgZmFpbHVyZXMsIFhlIGNhbm5vdCBiZSByZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0K
UmF2YWxpLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZy
YSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxm
IE9mIFBldGVyIFNlbm5hIFRzY2h1ZGluDQpTZW50OiAxOCBBcHJpbCAyMDI1IDE0OjUyDQpUbzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIv
eGUveGVfbGVnYWN5OiBNb3ZlIHRlc3RfbGVnYWN5X21vZGUgdG8gbGliLw0KDQpEZWFyIEk5MTUs
DQoNCk9uIDQvMTcvMjAyNSAxMTo0MiBQTSwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMg
RGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBsaWIveGUveGVfbGVnYWN5OiBNb3ZlIHRlc3RfbGVn
YWN5X21vZGUgdG8gbGliLw0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvMTQ3OTM5Lw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkg
PT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gSUdUXzgzMjYgLT4gSUdUUFdfMTMw
MDQgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4g
ICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xMzAwNCBhYnNvbHV0
ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3Ug
dGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNo
YW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzEzMDA0LCBwbGVhc2Ugbm90aWZ5IHlvdXIg
YnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0
aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJl
ZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+IGh0
dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTMwMDQvaW5kZXgu
aHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoNDUgLT4gNDQpDQo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBNaXNzaW5nICAgICgxKTogZmktc25iLTI1MjBt
IA0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0K
PiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJv
ZHVjZWQgaW4gSUdUUFdfMTMwMDQ6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAj
IyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zZWxmdGVz
dEBsaXZlQHdvcmthcm91bmRzOg0KPiAgICAgLSBiYXQtcnBscC0xOiAgICAgICAgIFtQQVNTXVsx
XSAtPiBbQUJPUlRdWzJdICsxIG90aGVyIHRlc3QgYWJvcnQNCj4gICAgWzFdOiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84MzI2L2JhdC1ycGxwLTEvaWd0QGk5
MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTMwMDQvYmF0LXJwbHAtMS9p
Z3RAaTkNCj4gMTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sDQo+IA0KDQpVbnJlbGF0
ZWQgdG8gbXkgY2hhbmdlLiBQbGVhc2UgZml4IGFuZCByZS1ydW4uDQoNClRoYW5rIHlvdSwNCg0K
UGV0ZXINCg==
