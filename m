Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5DDC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 08:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0E10E608;
	Tue, 25 Jun 2024 08:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8VUF3Wf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AC710E5F3
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719305098; x=1750841098;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=D6ay/wrAeilwZ0rM7WypkJXZs5Ir9/QW2Mo6MvQynqk=;
 b=R8VUF3Wf97nbHE7Zb/uHpvLw0KHgUZ0rFCFe7gpFebHYz+HTjE2O5o1F
 k4G/Erh3cxBZ3FZeKxZnR0+CryOAhGwQlcKUS3V0Lm1iJ509bMUzY1nia
 NRwJrSKGevYXxY3rVjaae8fBh7rnrsK8BaQOD6QWryXzd6+v20+TKuxCZ
 p3kZ92G5bN3D4wZyL/R7gEeiZcjlbtZdQNOcnylFfqV9qIeHQRsCuZTdK
 ArLNDeJ47TBFiwbbMObHxPOEvgKXCuQO/VV8rZo8XE+vcLeU1XQnw9uAn
 QGwwRQlNyaf5L3dxtL15J22R5MkR2Pd4SBRwjYfOqPjO7Roi8K5xU+XfN A==;
X-CSE-ConnectionGUID: d9wcn+m0Qgm639hJK7bqMQ==
X-CSE-MsgGUID: mKWekgj3TfG0T3qhMIzOkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26896927"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="26896927"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 01:44:58 -0700
X-CSE-ConnectionGUID: EWDc++gPQNmIoKjSDyYKOw==
X-CSE-MsgGUID: US0AG2iHQiKPRG5r9yoqHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="48542863"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 01:44:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 01:44:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 01:44:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 01:44:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 01:44:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B93//OO+nFc8AAXkaFR9ZB7W3HNFwZaFzSKj5qXgWjzXhOfT1rOBYoejD16YzZQqIQFYTd0W+yIe0BsnWZFyVS9BPhzuy5Lj/62JY4L3Y0s4Y2yHWGfoijRexT+hSEbTW2yA4kCPFBcvfOOOKJw/PyPM76yqt3UKD2yUzGLmntBOxi099tv5iASJYsIRaN4AjLpw7BIpZ5cQVkoYxGDFQ+HVZMpKMP15d1xIQQiS5oUEgtQUNEsoy5b3puPLanSx8PLfSD7MAOqwo45gi2snSLMLUETVFk2BaKPrg0q5dOM6J7g64QoZAuYJ3IkzAh+9W1ByPFL6vDXhrolJTvE8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6ay/wrAeilwZ0rM7WypkJXZs5Ir9/QW2Mo6MvQynqk=;
 b=TevuFInL8DIClHhYy4UigX7LIMUDgrP9wWaB2LwxQtXGnH1OYP4SdGaq3h/M+R6ERz5Bi2vkkOKNLWhJNXclEMWQjGMPxiZtE+NSvaSMcrVpMXx7EYiWvEgcmUNbnoKi3ZdH3/dnYbXuY30iWUPfu8IjO3idNv0dtZTgV8J968n2AvTyghcJStrNE4V1+V2lPtpGlff3h3/Sru7GpqIuI1eOF16aaiGTwq7FFzdrBOuP0Y5dTat8BN1mMM5q474k6ka8rqAWXVqpkyT0JMZvEyA9KuAR1/d6SNjD4k13pk/pNb4WRBWrFVfjm/sNjG61netFvBKqdDMDI2WLUGsJxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH3PR11MB7674.namprd11.prod.outlook.com (2603:10b6:610:12b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Tue, 25 Jun 2024 08:44:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 08:44:55 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Thread-Index: AQHaxmFc1pVSBilYSEu9c9mR/ID9mrHYKyMA
Date: Tue, 25 Jun 2024 08:44:55 +0000
Message-ID: <a1092375975ae350c1bb97b3af09589bf1f16cf2.camel@intel.com>
References: <20240624181533.1600552-1-jeevan.b@intel.com>
 <20240624181533.1600552-2-jeevan.b@intel.com>
In-Reply-To: <20240624181533.1600552-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH3PR11MB7674:EE_
x-ms-office365-filtering-correlation-id: cfbb042e-326c-492b-7451-08dc94f31674
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|366013|1800799021|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?ZUljOGFWWWlRMVJPemdoZzVVdmFaVlJCTTI4bUV5N1hHK1dDL2pTYmJoaURK?=
 =?utf-8?B?anZCRXZ3RGQ3NjJ3TmUwNll4bmFZcG5iSnh5bXI0SXFxdm5pTmxHVmxaVkZl?=
 =?utf-8?B?aG9Hd0dLcXNadDNhZVhYSnJ0RVd5ZjNTTmx0bjVtdTkvWnVKTjc3b3FTYkxW?=
 =?utf-8?B?MGk1SjVSbnpFcEJ5ZVRpVlFxMldzT2VraURXbXcyTVM0TWxpSlM1OXpYeHVy?=
 =?utf-8?B?Y1kwaE5YR1R2elF0Tm1SS1RMWjgybElIQUtNNCtOWEcyNVVPakVDZEdKWTlh?=
 =?utf-8?B?TDdKOEhETkNSVDVNSFp2N3JIS3JWU0dndHZXdElBbVFUYjQrV05aWDlQQXpy?=
 =?utf-8?B?bStXZ1pMaXJ3NTVZUGZyNXRqKytuWTR6Y3lFUmRoaGRwL0hQOElYSDVoVHB5?=
 =?utf-8?B?WmcreUhoaFJFclVhbHFWK0p5TnpKejJNZFFXQS9LMVUyOUg3bCtBMkF4bUFV?=
 =?utf-8?B?TXQyaHNOVUVkUTZVeXdIbS9Mang3YVlhR0g0TkxKdThLbzFDYjd5VEJvWmRx?=
 =?utf-8?B?RjYwcmhLaXQ3MHNHcjhoQlFIWSt1eWw3LzhibStvMmdBbTVGUkVnNEVwWDVl?=
 =?utf-8?B?cUtFM2ZiQ2E0bDc2Z3hUckdqK2t1TExnNnVQajVkS3YxUDhadmRpQ1JVZTU1?=
 =?utf-8?B?M1VmMSs2WldTVC81cU1MN1BmcGMycm1WanFjL0w3MER0cU9icm5scDZmMnNP?=
 =?utf-8?B?QlVtZ01GelVHd2x3bTdJVm1MNlljMTRNTUVtaFNSTXJjOVUzWGNCd0xWcmVK?=
 =?utf-8?B?dm54MDVUK1F2TDhXVVFHZjRZN0o2RE83c25XbjhWRTFFa3h6N09Ndjh1RWZO?=
 =?utf-8?B?aHE1b2E5VmdTbXhlVUNZWkJ3S2JGeHdIai9RYzdneWpIMHBGYXdFN090MlRF?=
 =?utf-8?B?dWg5Zjd2V2JCY085V1k1bkhVTUlmRXlhZTMyQ1FXZkw3Rm1FK0JocDdTUi8w?=
 =?utf-8?B?OWVBLzBLWmFqWnhSNlVZdXlPSEVRMFFtcWdwUy9PL1JORVJnZ0lsUElXb1A4?=
 =?utf-8?B?SDJGMkZDcWNCOHk0c0tBRmNuM0I1eHJFL3hJQlNUM1BhaDAyYmFkR00vekMz?=
 =?utf-8?B?U3E4U2tMRkFDeUhIUVlZT21lN1E3RUVTWlBTc29WRHFoQXJXdnFOZzJROGRD?=
 =?utf-8?B?UE4waC9JM2hRVTkzVHBtcWI1eHZjdElpWEtaOWFST2JnUmkzc1BncDFDNk9E?=
 =?utf-8?B?eGJ6UUZST2cydFRTM2ZQR1ovbDdOMXNLTUdFN2NEc3ZFTGdZK2xzWmxvOGJ0?=
 =?utf-8?B?b2lMVlhVY2xaN0IvSUhQOForM3lTc01PM1dLRVdIVjVOTC9xTE9TZmRjc1dj?=
 =?utf-8?B?UlEvSjQyS2k4cTRMTnhJZGRETVYzMDNHRUlpeG9NNVdOdzJ0VlBtcXIwZ0th?=
 =?utf-8?B?bGc2UDRYMUxISjZGeUh2dHBkc1VQb1Qzcnk4ZDRnNXB4UWhkUzl0b084cWJ6?=
 =?utf-8?B?SXZFRVEzVGdIb2l6NlYzZ3JSL0s2eGNBMml2Nk5XYWNCMDZCalNWVUs2dE5J?=
 =?utf-8?B?QWhYOEVJUm94Y2llbDllNEFUNEVHc28ybHk2RS85VGY0QVRZNFNGWld4S2c3?=
 =?utf-8?B?N29uRC9xcmhXZ3plUGQ5MWt6SHBpKzBVUXpQV3MvUnpqYkt3eDFQOTlRTkVr?=
 =?utf-8?B?NUVmVVYyVW9wU2ZmT0xSTXNaa0QzbjQ2Zk5XMlNVaXhKVDhFZ3dNZTRvYVl4?=
 =?utf-8?B?WDFBMjF3VmlqRGVmUkRxOE5aK1M3ZFk2cHVSZ2w5UXZnbE9lSm5adXYwKzFM?=
 =?utf-8?B?b1FidTRNTEZobXNWb08yb05XMkliS2FETmQvSS9OWmdZOFpneWczbWVzdy9D?=
 =?utf-8?Q?676dtpNXnIUL+Lfb0JxgSEHev02U3fCQfoyYk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXlySlZ2ak1VQjc3eXdZZzZRbnNocm4vanR5Rk1WVDluTldtZThiOHVlcVhy?=
 =?utf-8?B?c3RKZWZIVjdScWRVOU1BajFHbjRtTklneWxOQ2NucHM4cXY4WFR2Q210UEdE?=
 =?utf-8?B?L3JBekRDWm5mZ0JsbEYvMTQ5TzJ2NVJrd0ZjR1Y4WDNoT3E5R0RRZE5BRUhL?=
 =?utf-8?B?aGRPTFA3RXc0ZUpuZnpQNFVDV1hXQ0RPTnNsam1zVTRKUGlhaHdBZVJ3VERq?=
 =?utf-8?B?T1VJWU9wWXNxK280V3o1Qk1hUGFsQzBKL0xNS3g3bXNMZTNXNEQ5bndsWmhx?=
 =?utf-8?B?TVArVlM4M1B5WDdEemhPTkk2cW1lVjZTbS9tZHEwZmtSYXptVzNybGVFaHdQ?=
 =?utf-8?B?c0J1WkFsS2UvME1qcmtuTjROUUorTUtNdTFrNWM5S25KZmZOUTUyUTRLcjBX?=
 =?utf-8?B?SERET3hzZTAvMmZMSDhNOWNSRExyYTRSdHRIOWhEcmw5emFmaTY2MXMxaTFy?=
 =?utf-8?B?N21qR0JIQ3BERVlrNnRkK0pzbDA2ckI3d2lWNWgvaEh5cnhUYUZLa3Y3d2li?=
 =?utf-8?B?V1JmVTdyeEFpTXEwbUFuRGVhMmYxbklzWU04SHdud2ZOeTBZZkRxMGZTYk10?=
 =?utf-8?B?Wm9QRC9wV0lFTUYyQWdnMFBqcGJVQ2t5c1hQOHA3MjlmTjJqYXpOZnhxRUFn?=
 =?utf-8?B?N3NXTG14cytTcHVkZFd4dWNQSjlGWE11S1lhdFc5ci9Hbzk0OEdxZGgySW1I?=
 =?utf-8?B?ZWlxVzY1eEF6dW5uZURwTmMwa1NYS0kyNDM5ZlV2VG1DZ1ppRUpWZEYzdEJx?=
 =?utf-8?B?Q0lEVE1ybVZUMFhhVkxPTmRRaWcya1o3MXlFWHlmczlGS1RhdDR2Z2RyVS9p?=
 =?utf-8?B?U1Nlc21jRlUzUUNxVzBqVW1jOVBTR3RUUzRqdFB3RkdhbTdrSUdIcVU3OGpZ?=
 =?utf-8?B?RG51K2xYQ2FwWnlibmpJVnFjRjVMc1JKZ2dFK09CS1ZXaU1QVHpZQ0FDcnFQ?=
 =?utf-8?B?L0tVaDEwUmxVbkhZZU5UdjNnZlRoMUROKzFmeVNvS2ZRZVlSM2g5RHVGdHh3?=
 =?utf-8?B?ZzJSN2NvZStrcWFYVnBQaC9Ib1g5WEpPT3ZObTBBdVB0RllWdHdKTUtTeHFM?=
 =?utf-8?B?NWFhQVdnM29OdEtPaG9IaElpMkdWQmYvRW9nMi80akNUQTUxRldyb3JiY2Rx?=
 =?utf-8?B?MWlPbWdpVlZUZEE0QkxvanA0QkNkdzhLcnJIUjJMNWloQ1hmeTdIV3U0eTZF?=
 =?utf-8?B?SnJBeEdXck8rdWE1SXhzRmFRTzNhMG5JbzdIalRuSkl4MU5OWFl6S2U1MzBi?=
 =?utf-8?B?aW1WN1A2TVFZa1JVSXFVWFQ1OEVsUE1uN3FBQXkvK1hmcFdpdVpuZGVpdjBm?=
 =?utf-8?B?Q3dyUjhIUzJKQVluNFR4RjZJc3o1YmxHV2Q5VUw2K0lNYWkrMGkrK3BnaHR2?=
 =?utf-8?B?M1Z3b25OVVRZQThuRzRWZmpReFVNWUZVQU85V1NDUGhyVktVM0xzMFZXVVRC?=
 =?utf-8?B?a0gvUzFMdFNYTjM3b2p5K3F6RFJxdkxxK0pNQkhPVUlETW56SG1xT0JNUTlJ?=
 =?utf-8?B?dmZyRHlRaFBBWURRVkYzNG1TbStJYjRlOWQ3VGNUM05vaWlKYS85MXpXVHRj?=
 =?utf-8?B?NEQ0UmlhS0thb09uVVpkb2tjcnN5UGh5UStySEFrTmtyZWkrRGtBWG1sNEJ5?=
 =?utf-8?B?QXJkc0Z3aVl6cDN6R25CZFZYUzhSNFpZNXVYUXdNZ0R1SmFYaldEQjhkM3Rt?=
 =?utf-8?B?alZ6YWJ6ZXhvK2xxZHB3dGd2UVFkdUxheGIwdmNKcjZBSHZ4d2NudnoxS2VY?=
 =?utf-8?B?YlJPSjlNNEtIM0N3NUZvSWxWayszSTdBbHZsU0xsbEE5ZGh2eXR4KzVlM011?=
 =?utf-8?B?MGpJdzJ4RDNFNGkyUVNBb1NQM1E4ZEtpSHErSklUVm1DRGtwTHpVdktQU2g0?=
 =?utf-8?B?L3laZmpGZkQ2THcxRTdTd1pBTmd4R3JESlhPdFJVam1FbFhBamxkbGRhQkx2?=
 =?utf-8?B?cEM0Y290MTZ0ZVF6bHYwVHJxY3RtZFpMZzFGbG5BcjFpRm9JWWpCM1JKOHNm?=
 =?utf-8?B?NGFXejd4ZmVhOURBRlNVMC9NcEZnZ2hKMFR5N0FSWlZyUzFBdVpZcElUNSt0?=
 =?utf-8?B?U2g4TzF4VHhLdy96dFRTaVBjTkpud1N6QlgxTUMxVFVqNnpZaFZuVWtRdW5q?=
 =?utf-8?B?d3c5eGNBTnJZMUIwMldaaGZTVlMxbU9jU28yUHFVL2FneERiQUxDVFFTL0Iv?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93EEB78EB410A840A33F444E489413D6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbb042e-326c-492b-7451-08dc94f31674
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 08:44:55.3965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sxcKiNFao/RYhQETHwCpK/IZiKQTaGfz7GLuUxAzk+zkQWwyt21Zkz+KWQ0Kex3qde7tyJtlw6qQ9x4W6DAWu8Dah1phjdPcahfiac1sL+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7674
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

T24gTW9uLCAyMDI0LTA2LTI0IGF0IDIzOjQ1ICswNTMwLCBKZWV2YW4gQiB3cm90ZToKPiBBZGRl
ZCBoZWxwZXIgZnVuY3Rpb25zIHRvIGNoZWNrIHNpbmsgc3VwcG9ydCBmb3IgZWFybHkgdHJhbnNw
b3J0IGFuZAo+IGNoZWNrIGVhcmx5IHRyYW5zcG9ydCBhY3RpdmUgY2hlY2suCgpSZXZpZXdlZC1i
eTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+Cgo+IAo+IHYyOiBB
ZGQgZWFybHkgdHJhc3BvcnQgZm9yIFBSIGFuZCBQU1IyLgo+IHYzOiBGaXggY2hlY2sgc3RyaW5n
cy4KPiB2NDogQWRkIGRlc2NyaXB0aW9uIHRvIGxpYnJhcnkgZnVuY3Rpb24gYW5kIGNvcnJlY3Rz
dHJpbmcgbG9naWMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmVldmFuIEIgPGplZXZhbi5iQGludGVs
LmNvbT4KPiAtLS0KPiDCoGxpYi9pZ3RfcHNyLmMgfCAxOSArKysrKysrKysrKysrKysrKysrCj4g
wqBsaWIvaWd0X3Bzci5oIHzCoCAzICsrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jCj4g
aW5kZXggNjAwOGI3M2E2Li5kYzg1MDQyYjIgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9wc3IuYwo+
ICsrKyBiL2xpYi9pZ3RfcHNyLmMKPiBAQCAtNTMsNiArNTMsMTkgQEAgYm9vbCBzZWxlY3RpdmVf
ZmV0Y2hfY2hlY2soaW50IGRlYnVnZnNfZmQsCj4gaWd0X291dHB1dF90ICpvdXRwdXQpCj4gwqDC
oMKgwqDCoMKgwqDCoHJldHVybiBzdHJzdHIoYnVmLCAiUFNSMiBzZWxlY3RpdmUgZmV0Y2g6IGVu
YWJsZWQiKTsKPiDCoH0KPiDCoAo+ICsvKgo+ICsgKiBDaGVja3MgaWYgRWFybHkgVHJhbnNwb3J0
IGlzIGVuYWJsZWQgaW4gUFNSIHN0YXR1cyBieSByZWFkaW5nIHRoZQo+IGRlYnVnZnMuCj4gKyAq
Lwo+ICtib29sIGVhcmx5X3RyYW5zcG9ydF9jaGVjayhpbnQgZGVidWdmc19mZCkKPiArewo+ICvC
oMKgwqDCoMKgwqDCoGNoYXIgYnVmW1BTUl9TVEFUVVNfTUFYX0xFTl07Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoGlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRlYnVnZnNfZmQsICJpOTE1X2VkcF9wc3Jf
c3RhdHVzIiwKPiBidWYsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2l6ZW9mKGJ1ZikpOwo+ICsKPiArwqDCoMKgwqDCoMKg
wqByZXR1cm4gc3Ryc3RyKGJ1ZiwgImVuYWJsZWQgKEVhcmx5IFRyYW5zcG9ydCkiKTsKPiArfQo+
ICsKPiDCoHN0YXRpYyBib29sIHBzcl9hY3RpdmVfY2hlY2soaW50IGRlYnVnZnNfZmQsIGVudW0g
cHNyX21vZGUgbW9kZSwKPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkKPiDCoHsKPiDCoMKgwqDCoMKg
wqDCoMKgY2hhciBkZWJ1Z2ZzX2ZpbGVbMTI4XSA9IHswfTsKPiBAQCAtMjQ3LDEwICsyNjAsMTYg
QEAgYm9vbCBwc3Jfc2lua19zdXBwb3J0KGludCBkZXZpY2UsIGludAo+IGRlYnVnZnNfZmQsIGVu
dW0gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnN0cihidWYsICJTaW5rIHN1cHBvcnQ6IHllcyBbMHgwNF0i
KSB8fAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChzdHJz
dHIobGluZSwgIlBTUiA9IHllcyIpICYmCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKHN0cnN0cihsaW5lLCAiWzB4MDNdIikgfHwgc3Ryc3RyKGxpbmUsCj4g
IlsweDA0XSIpKSk7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBQU1JfTU9ERV8yX0VUOgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gc3Ryc3RyKGJ1ZiwgIlNpbmsgc3VwcG9y
dDogeWVzIFsweDA0XSIpIHx8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAoc3Ryc3RyKGxpbmUsICJQU1IgPSB5ZXMiKSAmJgo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnN0cihsaW5lLCAiWzB4MDRdIikpOwo+
IMKgwqDCoMKgwqDCoMKgwqBjYXNlIFBSX01PREU6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gc3Ryc3RyKGxpbmUsICJQYW5lbCBSZXBsYXkgPSB5ZXMsIFBhbmVsIFJl
cGxheQo+IFNlbGVjdGl2ZSBVcGRhdGUgPSBubyIpOwo+IMKgwqDCoMKgwqDCoMKgwqBjYXNlIFBS
X01PREVfU0VMX0ZFVENIOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IHN0cnN0cihsaW5lLCAiUGFuZWwgUmVwbGF5ID0geWVzLCBQYW5lbCBSZXBsYXkKPiBTZWxlY3Rp
dmUgVXBkYXRlID0geWVzIik7Cj4gK8KgwqDCoMKgwqDCoMKgY2FzZSBQUl9NT0RFX1NFTF9GRVRD
SF9FVDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHN0cnN0cihsaW5l
LCAiUGFuZWwgUmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUgPQo+IHllcyAoRWFybHkgVHJhbnNwb3J0
KSIpOwo+IMKgwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWd0X2Fzc2VydF9mKGZhbHNlLCAiSW52YWxpZCBwc3IgbW9kZVxuIik7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZmFsc2U7Cj4gZGlmZiAtLWdpdCBh
L2xpYi9pZ3RfcHNyLmggYi9saWIvaWd0X3Bzci5oCj4gaW5kZXggZTg1OTVmZDhjLi5hN2ViZDA3
MzkgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9wc3IuaAo+ICsrKyBiL2xpYi9pZ3RfcHNyLmgKPiBA
QCAtMzUsOCArMzUsMTAgQEAgZW51bSBwc3JfbW9kZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoFBTUl9N
T0RFXzEsCj4gwqDCoMKgwqDCoMKgwqDCoFBTUl9NT0RFXzIsCj4gwqDCoMKgwqDCoMKgwqDCoFBT
Ul9NT0RFXzJfU0VMX0ZFVENILAo+ICvCoMKgwqDCoMKgwqDCoFBTUl9NT0RFXzJfRVQsCj4gwqDC
oMKgwqDCoMKgwqDCoFBSX01PREUsCj4gwqDCoMKgwqDCoMKgwqDCoFBSX01PREVfU0VMX0ZFVENI
LAo+ICvCoMKgwqDCoMKgwqDCoFBSX01PREVfU0VMX0ZFVENIX0VULAo+IMKgwqDCoMKgwqDCoMKg
wqBQU1JfRElTQUJMRUQsCj4gwqB9Owo+IMKgCj4gQEAgLTQ3LDYgKzQ5LDcgQEAgZW51bSBmYmNf
bW9kZSB7Cj4gwqAKPiDCoGJvb2wgcHNyX2Rpc2FibGVkX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkKTsK
PiDCoGJvb2wgc2VsZWN0aXZlX2ZldGNoX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBpZ3Rfb3V0cHV0
X3QgKm91dHB1dCk7Cj4gK2Jvb2wgZWFybHlfdHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2Zk
KTsKPiDCoGJvb2wgcHNyX3dhaXRfZW50cnkoaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUg
bW9kZSwgaWd0X291dHB1dF90Cj4gKm91dHB1dCk7Cj4gwqBib29sIHBzcl93YWl0X3VwZGF0ZShp
bnQgZGVidWdmc19mZCwgZW51bSBwc3JfbW9kZSBtb2RlLAo+IGlndF9vdXRwdXRfdCAqb3V0cHV0
KTsKPiDCoGJvb2wgcHNyX2xvbmdfd2FpdF91cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVudW0gcHNy
X21vZGUgbW9kZSwKPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCk7Cgo=
