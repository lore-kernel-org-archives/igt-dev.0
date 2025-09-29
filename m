Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CA4CAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 04:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B6010E214;
	Mon, 29 Sep 2025 04:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zg9u5SKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFDB10E214
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 04:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759120858; x=1790656858;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=9uBStfvv1CTgzhUtwU2AF4RCflFcqsfKOw69elKJgFE=;
 b=Zg9u5SKavhqREKqWFOvmnMWnxHtLAW/778qIC/d1C0oHfJZNsOP6uDBa
 NipF8OKsYUs8HVsCA3Yis7KjXxNLPFMlnB0WP3sgbNmGkRYLwF+Xhs/RY
 B8gVmN9uDIfhP+AsQqi0C2Q4543Lm/z5oJeldUa6RauuMqNdrvAyYtLSf
 qp//KZLLupGq8hTstDfksDPb2+1EC+RwHglW5OOqbg6E/As2EInGLCzDn
 CKqkFHzQOi+zl8Cso+MCec7RfbnID7JZH/BuvXzTqQPM2MEMS1vsOwgfn
 AQ9mV1IhfwVRmCvkGnyref8G/DFPprUN4MmVm7H/5iF9nFEIz5cnYQDfu A==;
X-CSE-ConnectionGUID: 4b1JblBcSuuRGDVzkOTVjg==
X-CSE-MsgGUID: CgqRgfWgRzipXgofuim8fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="71603617"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="71603617"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 21:40:58 -0700
X-CSE-ConnectionGUID: CNTfKwA4R4SL6TqxIU5mHA==
X-CSE-MsgGUID: xJ0SFSs/Qk2gmV2nS5NUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; d="scan'208";a="178516052"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 21:40:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 28 Sep 2025 21:40:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 28 Sep 2025 21:40:56 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 28 Sep 2025 21:40:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/qsoyVXlwdL0MkQk7DkmxCRT027yLHr5ybd+F+7Sa2IY5SGPQMPKYi9oSH37swn2BfVlFS4BYR+y1SQ+Y6VZYmF22Wam6X5L2u+hxlPtIZ51vfn0h9b7hQ3bX18A4kd56VfKbYOEqQLGXw9Y60KF1EI0OytxZZp0WQdAtpjZYR6gX4XGz/GAJSgHZNuyJjI7MeHJcSLwge5Iendtc704y0iNYAbBStoJwXwbXnKEaeqx8f3w39SAFCyT/tjEu1K4m+eY6ygw3juU591fr9Txt9L2E/n/3VulxBFdG9+z5uPOp2sny2Iv0+xUc6P/E0moShNrOBe5cJ3PvyTLRO6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uBStfvv1CTgzhUtwU2AF4RCflFcqsfKOw69elKJgFE=;
 b=LLF+IYDeihyZpnq0TBnixZJfCAj26d9BGSFmwBQNtkqx4sS4fk6nzcYUxMjiEwgoiC4/n+UZRYzI0sFb1udlz60y3QykVl/Vaf/gqUh8oaJjVe+W6lcaTLe3dcmcE1Qh4Gu5tGNUHjHCckPLyibu4Anl8Iiw+mfxtb/2Xss8QaVY3jnxm+E4VJEwvKfxrnWZMgzziZJRYGTVNggpl5VT6EzfNRts5dzojlG/CUcvRm8TPLVzgxh0s03xuW+nDXmPZwr/Y6+/Ym52GFcKD5PmH/VneItK1mMNjp7swTLsSYygWwiPkFnICK92JxOekDf/04mBsptZogUU6d8iMoRvaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SN7PR11MB8066.namprd11.prod.outlook.com (2603:10b6:806:2df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 04:40:54 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 04:40:54 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v3] lib/igt_psr: Use 10x timeouts in simulation
 environment
Thread-Topic: [PATCH i-g-t v3] lib/igt_psr: Use 10x timeouts in simulation
 environment
Thread-Index: AQHcLqJ3LQCbDpSHYEOflVW3KRDIaLSlZRKAgAQ0IoA=
Date: Mon, 29 Sep 2025 04:40:54 +0000
Message-ID: <3edac0aa5308c4f61f9f7e1fbc61ee96e6168639.camel@intel.com>
References: <20250926045950.3929343-1-jouni.hogander@intel.com>
 <20250926122915.cl22kxj3gyqssnyq@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250926122915.cl22kxj3gyqssnyq@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SN7PR11MB8066:EE_
x-ms-office365-filtering-correlation-id: ce05f804-0d18-4afb-29e5-08ddff12602c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eUFxWVJoUmxUbFN5TEtKeFE4YVh3bVhtSGlaMk9jNnJYYWpqb3lQREdEb2lZ?=
 =?utf-8?B?QjkrajRwNW5CVnFmbCtUQmQvclZSTXgwclRXLzFFUHhKa1AvSTNmRFRJY2FO?=
 =?utf-8?B?L1lXQjAxd3pXWUd5S2NCVDR2MVBJTThNUVZOVUZHbGM2cHYzZURxS1BzWVNC?=
 =?utf-8?B?aWFsZG03dFozRWdpNnl2TFF6dnhFQ2lORzBkY1p1ZENacjNrWGlROHV2SmFz?=
 =?utf-8?B?eHdZQ1cxMnhzblR2MkdnSU1OdTlMOUFCa0VkYk5sOWVuZkFiNDFtY3J6bzdj?=
 =?utf-8?B?SkwybkhPTEgrQSthaG8zL1NtbDY1a3NjeE50TklWMzJpUDdIQXJGSlBpRTli?=
 =?utf-8?B?ckkxM1hHOHpDNU10UG5DaEFlS095Y1hOMXQxRlYxbGtDanovQmpkK1ZLZ0Z3?=
 =?utf-8?B?LzVwTmsxYkZCTEJseng0TDQrajRBQjZvZnJHRjZNMlo0TGd2Z2pneEd5cjF6?=
 =?utf-8?B?V1RKdkQ0UTJQaVZKRnF0eVplUTZPRWo1Ym84NzE2U0hxc1BGbjloaEdpQWNC?=
 =?utf-8?B?NGxTSUwreWZPNGFTTDJBWjZWY3d6bFlmcTVFc3RRVHBjUThnVTdOYmhyRjlQ?=
 =?utf-8?B?ZCtEakQvWFY3VkFmZU9makdCOEJUc25sd2VEckdvSFBBV3AyTEpMc2ZiV2do?=
 =?utf-8?B?M2hXeDNBQWZEb1dybnpTclZXOTNKcnI0Y3hKanAvZUszY254NmxGKzQ1enRV?=
 =?utf-8?B?aVdTZ3I2Ulh4YmZXZ0hMOWVzeEpRZUJJQ0JSQXFSdDF3aUZ3U2dpTVFaWHZs?=
 =?utf-8?B?bUxXdHJybklNZ3daOW5GMHNIcklnakIxRE1Ya3JpcWpNajN5MHRGeVlicndY?=
 =?utf-8?B?V3FENm05MkI3VkJMcWZFcFhsU3dyMXFNS0RBRVhlME1NOGpTcjdUR3JQa0o0?=
 =?utf-8?B?OCtiWnduTHZybHc5bUx5aXJtaFcyQkxPL21CZGxmVjNXaUt4VEZpSEdPVzdy?=
 =?utf-8?B?bDErcXpFK0tFMFZFS0E0djlmRWorNnlhWWJTYWk5L2lSek1RcmtqMElQOHI3?=
 =?utf-8?B?bnRYRkZwMkdZdEhMdHJzdDhwYkpxZGx5dnlOTDR2cmlqOWowWkJxa2NwbS8z?=
 =?utf-8?B?Wll0a20yTGUwWElwZE51MU94Z1owT1dUczMyQU5FZlY3TWxkRFJEVzByRVRB?=
 =?utf-8?B?eVJoRVhUcnV5bmIvNE5BbktyYWtwUXNVOUY3RmdDQmxKMnJEOGZVOVlDZTZp?=
 =?utf-8?B?OFFETUFCU1JWOHorOUlmdXlldEx1WnpDbUJmRENjNnJscXJtM3ZjTGFhRVNK?=
 =?utf-8?B?cDZwNEtEWGNzOWRIazdmRmR6dUgxbVliZDBaZC8ybXJ6OU5YWllNQkh5TzBs?=
 =?utf-8?B?SmhYdW05WU9aV2hTaldFbVZHd0pqSWgvQmV0SlhnSHlSRFFNSWhBcUJ1cUtK?=
 =?utf-8?B?dWdGVHU1M3RPUGRjZkZJZ2djRVhRdnNqZ0JYOEVZQ25wdE1CMTFaUlRJdytx?=
 =?utf-8?B?bkxIOTYzNU9qUUUyaTF3RDhZbWkzQnVNZUFMaDBsd1NTVEZrK0diSktsbDVY?=
 =?utf-8?B?L3lNdXo4TGRBOFlhbjRVWklvcGExekdJeDdHN08yRE5ta084QzQvTVlNZmps?=
 =?utf-8?B?enA4a2JUUkY0ZzFOV3dFL2VCaHNGN3JrQ2RmT1JMdWx0OGo4dU9URUMybGxp?=
 =?utf-8?B?dHdRS3pqaTJIbEtBQjhTT1gyTkt0NkI5RWF1SzhVa0EvMFdFY0dIcGcvN2JB?=
 =?utf-8?B?K2d0OGloKzJEQkFHc3VIeklFTGxZL1VHaklCZmNtNktjdWZLSlhEdTRUYU5O?=
 =?utf-8?B?K3gvYVJCQlhDZHk0a0l3SHh2bmN6RTczZzRLWGdpdU9la1FraHlqYnJrSlly?=
 =?utf-8?B?ZGdtbnkrR3NVWGNvWlpTRTJPRHorVFJhdkhsZFh6VXc2bTdMb2NybStFNndH?=
 =?utf-8?B?R3VRYmlJL1A2WlNUUDVaQUtzeTkrc2JoTHhlTVY2VFp5dEJ4S1VzdXFCdTdH?=
 =?utf-8?B?VjFTeGJXUHNJUnRGY1gyVXRYZGQ2N3Y2WVZvenZKZXcybmxTUGhWeFI1UFVo?=
 =?utf-8?B?dTg2ZEVrM09tNXNpZ1Z1RS9RR3pjM3gvWmhkMVo2WU1pVTdNbkJWYldwODVJ?=
 =?utf-8?Q?ZJOqZ3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkY0WVNFbEFWWDFwYkNiYmZTeEYybGZEZlQ0aFk3M0YxSDZaSjdrTFVyd1o5?=
 =?utf-8?B?bEpxYTF5dlFuSjk5Z0VDM1EzVUErSDNMTHVES25qeEV1WExIaTFKS0cvRGZj?=
 =?utf-8?B?MGVmRTc5alAyUU9UWkVHckFqNjdpNGtJdXJqS0haVngyY3dLSXlPdi9DU1Ni?=
 =?utf-8?B?OTZrcDl4ek1MYUxhRm5qSzE2dkhDSC82dDVlcGxDRTVRaEhmWGZJRFZlN1Y1?=
 =?utf-8?B?TjVNK3czSW1aa1hvWHhoN2FCV1ZUK0dlY3dNR21XUGdTZit1Y0dJMnNKemoy?=
 =?utf-8?B?VzRncmJSWW9wS2RPQ25TUStacFl6NGJKbnhvcXV5ODhCR0hLRTBmRlRqTDh2?=
 =?utf-8?B?cFlCVXI5VTE0UG51amxLbVJyRko3K040WjRuYWRNeTBIRTJjZWJ6b0t6bk5W?=
 =?utf-8?B?OXNkZlVjR2puaW9QaWZzankxUkFpMmw4UXl2ZHdYZnpMUkhZeERXR01ySmJO?=
 =?utf-8?B?NWIrMFZReGFPMjVQSE5ISkMwMWdzOEdHUHZqVVU3a09iTUZRTHF0dW1YUVBi?=
 =?utf-8?B?TDRYZVM1bmR3aTVLbU9Hb09WTjEzbzFhUzVoakhzMUZDS3cyWTBGUStFbkE2?=
 =?utf-8?B?eXdDeGxuYXgyZVFOUjF5bWErMTI4eVJpY1l6cjlZU2dGZEV3RVZmWDZaTVJa?=
 =?utf-8?B?ZW0zdlgyUWNGUUxQS0dSc1Q3eE1CRmFIZjhXVVRES3ZMSmtrT2E4Znh4eG40?=
 =?utf-8?B?TDg5WExZeXJWanBVT1M2dytZNVZacmVibFBMMFJDT1c4SGxMaXFicnJ1TkRJ?=
 =?utf-8?B?WklNU2NBYmhaRXdVZXBHU2M0RU14dUhvT2s2VnhMV2dBbUp4N1oxZVJvYVJP?=
 =?utf-8?B?cS9OWmVxV0RNSGdESm40UmQ1S1BjZHJDTXV2aFJUOTVLa1B6RXFoOVpIWGc2?=
 =?utf-8?B?RmhVMmlYeWZPZFU4NGp3SmZLa0dNTlJ6Wml6YVpGSndDTGxKTDhlQk1YVVVh?=
 =?utf-8?B?ZWVBb1NTY2hURklQNHhxaWp5U1R5VHJUQkgwS1Qxckc1ZzJYUnI5aDh3U3Ji?=
 =?utf-8?B?bW95aWQ0Uy9MM0l6SWNIdUxTUCtCSyszSGhYRlRVUk42S2ZKVkhGTloxSThn?=
 =?utf-8?B?cWtiUWJKWGN6ZFZHNDNoY3FBMlh1a0ZSczhYRzhkeG94eHFLaGFwNUp1UkZq?=
 =?utf-8?B?TUJhOGVIbDV5Z0NEaTBxT1NBeE1SeHc4UzNPUVdnUGsxRU42YWV2UENyQkdC?=
 =?utf-8?B?MU5RQkJmOWJPWFR1a0FvaEdVaGdROE9ZYjQzeHV4Q2NaZWh5Q2JTcVJYTi9i?=
 =?utf-8?B?Y2w3OFp6c01ZZXRTVmk5c1dDVitCU2hKNFQ2SUtZU3VrbnpsanNYZWdIRGdq?=
 =?utf-8?B?ZTlJTERVTHc4QXUzZXNrdlNYVVRIRzBvdGRHOHA0YUM5eHRrVlBuZHB2dWFr?=
 =?utf-8?B?SU5YbWpoUVZNcnVhWDZkUTFCK2Y4MUF4eVg3RUdVajZxT0RNc2Q3VlNITmx6?=
 =?utf-8?B?eHhxQVRrb3UxZlh5amphR1o2ZkVwbGR1NmZhcXJoN2FYSThVbUdpOXFxRndj?=
 =?utf-8?B?QURySlVvN2hqTTFSQWZvTjFqcUovdnFPNGxINnh4NGkyY1RwVUtWdDdORkw1?=
 =?utf-8?B?VFd3bWxDNmt2d2FqZURFbWkwT0g5bnFFSDdURmNIbVNsVG01UEtwM3ZFY0xG?=
 =?utf-8?B?bXVqcHJPNW5XL0R0aTkwTjl4L29iRmVWVzdBYkRkekdyRG9BVHV2ZEpoSUNP?=
 =?utf-8?B?Nit4ZU9kR3UwcWd4WWUxOHFLc2tYNHJONWNYczVlengvSVZPUW1HcWMxaGFP?=
 =?utf-8?B?RGR3Q1hZbE9wUjNzaVJVdHBPdmJCTlhxK0FZNHJJZG1nSzY4a1dBNU5uU1gw?=
 =?utf-8?B?ZHVXQ3o1UUpJOXNUQUY2cEdFcW0yVnc3TEhlR0dzcjNWaWZuZ2cxa214bEJN?=
 =?utf-8?B?WkdSaUd3bld5bzJoVHRjQUMzNEhCSnVYZVJqYmpHREs2dlNHSktaTTNjV21Z?=
 =?utf-8?B?Sms2SlFvMVdoY3g2VmY4T0w1RDljdGV3U1BWakpGczhCN2tOaFVkeTV0UEh5?=
 =?utf-8?B?clBPTDZGUEhmNzM4dTl4czN0ZE9xTzF6WW9mNExMUVczNzdYSit6WEttakRR?=
 =?utf-8?B?L1lKNEpwcVJrOHJPMUJmQndzaTd6R1ZNRW9Oak91YnlQdHVMQVJYZFFpTC9i?=
 =?utf-8?B?aG9uUkVkVDhQZVZZR0Z1YWxMNkNyTTF0VnVVY0tKeGtjenF1T0VCZDRWOEhQ?=
 =?utf-8?B?RUlIKzNsNXFEUWhKMHlWUVQ0QXJaeGFUTjFLMFRFMzRLZjhBSjhObThmOHdV?=
 =?utf-8?B?OHRNZ1Vickw1ZFBYTWUwSjk0QXJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B31C734B83AA349A4678502E37BAB7B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce05f804-0d18-4afb-29e5-08ddff12602c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 04:40:54.3906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +16rr0r+80Jiiz4nkRmlHLybL9OxgyXy3p/1YobptjrHf5acbQpskn4W3tFSCP+WoXhUd/e3aO6tsjGLiM6+7ugBtoponJaK85ZgfPH52YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8066
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

T24gRnJpLCAyMDI1LTA5LTI2IGF0IDE0OjI5ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEpvdW5pLA0KPiBPbiAyMDI1LTA5LTI2IGF0IDA3OjU5OjUwICswMzAwLCBKb3VuaSBI
w7ZnYW5kZXIgd3JvdGU6DQo+ID4gUFNSIHRlc3RzIGFyZSB0aW1lb3V0aW5nIGluIHNpbXVsYXRp
b24gZW52aXJvbm1lbnQuIFVzZSAxMCBhcyBhDQo+ID4gbXVsdGlwbGllcg0KPiA+IGZvciB0aW1l
b3V0cyBpbiBzaW11bGF0aW9uIGVudmlyb25tZW50Lg0KPiA+IA0KPiA+IHYzOiBhZGQgbWlzc2lu
ZyBjaGFuZ2UNCj4gPiB2MjogZml4IG9wZXJhdG9yIHByZWNlZGVuY2UgcHJvYmxlbQ0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+IMKgbGliL2lndF9wc3IuYyB8IDEyICsrKysrKystLS0tLQ0KPiA+
IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMNCj4gPiBpbmRl
eCBkNWI0MTk4YzMuLjdlNTBjM2RjNiAxMDA2NDQNCj4gPiAtLS0gYS9saWIvaWd0X3Bzci5jDQo+
ID4gKysrIGIvbGliL2lndF9wc3IuYw0KPiA+IEBAIC0xMzYsMTIgKzEzNiwxNCBAQCBzdGF0aWMg
Ym9vbCBwc3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLA0KPiA+IGVudW0gcHNyX21vZGUg
bW9kZSwgaWd0X291dHB1dF90ICpvDQo+ID4gwqAJcmV0dXJuIGFjdGl2ZTsNCj4gPiDCoH0NCj4g
PiDCoA0KPiA+ICsjZGVmaW5lIFBTUl9USU1FT1VUKHRpbWVvdXQpCSgoaWd0X3J1bl9pbl9zaW11
bGF0aW9uKCkgPyAxMCA6DQo+ID4gMSkgKiAodGltZW91dCkpDQo+IA0KPiBOb3cgaXQgaXMgY29y
cmVjdCwNCj4gDQo+IFJldmlld2VkLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pu
eUBsaW51eC5pbnRlbC5jb20+DQoNClRoYW5rIHlvdSBLYW1pbCBmb3IgY2hlY2tpbmcgbXkgcGF0
Y2guIFRoaXMgaXMgbm93IHB1c2hlZCB0byBtYXN0ZXIuDQoNCkJSLA0KDQpKb3VuaSBIw7ZnYW5k
ZXINCg0KPiANCj4gPiArDQo+ID4gwqAvKg0KPiA+IMKgICogRm9yIFBTUjEsIHdlIHdhaXQgdW50
aWwgUFNSIGlzIGFjdGl2ZS4gV2Ugd2FpdCB1bnRpbCBERUVQX1NMRUVQDQo+ID4gZm9yIFBTUjIu
DQo+ID4gwqAgKi8NCj4gPiDCoGJvb2wgcHNyX3dhaXRfZW50cnkoaW50IGRlYnVnZnNfZmQsIGVu
dW0gcHNyX21vZGUgbW9kZSwNCj4gPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gPiDCoHsNCj4g
PiAtCXJldHVybiBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsIG1vZGUsDQo+
ID4gb3V0cHV0KSwgNTAwLCAyMCk7DQo+ID4gKwlyZXR1cm4gaWd0X3dhaXQocHNyX2FjdGl2ZV9j
aGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLA0KPiA+IG91dHB1dCksIFBTUl9USU1FT1VUKDUwMCksIDIw
KTsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+IMKgYm9vbCBwc3Jfd2FpdF91cGRhdGUoaW50IGRlYnVn
ZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwNCj4gPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4g
PiBAQCAtMTUzLDkgKzE1NSw5IEBAIGJvb2wgcHNyX3dhaXRfdXBkYXRlKGludCBkZWJ1Z2ZzX2Zk
LCBlbnVtDQo+ID4gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90ICpvdXRwdXQpDQo+ID4gwqAJ
ICovDQo+ID4gwqAJaWYgKG91dHB1dCAhPSBOVUxMICYmDQo+ID4gwqAJwqDCoMKgIG91dHB1dC0+
Y29uZmlnLmNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0NCj4gPiBEUk1fTU9ERV9DT05ORUNU
T1JfRGlzcGxheVBvcnQpDQo+ID4gLQkJcmV0dXJuIGlndF93YWl0KHBzcl9hY3RpdmVfY2hlY2so
ZGVidWdmc19mZCwgbW9kZSwNCj4gPiBvdXRwdXQpLCA0MCwgMSk7DQo+ID4gKwkJcmV0dXJuIGln
dF93YWl0KHBzcl9hY3RpdmVfY2hlY2soZGVidWdmc19mZCwgbW9kZSwNCj4gPiBvdXRwdXQpLCBQ
U1JfVElNRU9VVCg0MCksIDEpOw0KPiA+IMKgCWVsc2UNCj4gPiAtCQlyZXR1cm4gaWd0X3dhaXQo
IXBzcl9hY3RpdmVfY2hlY2soZGVidWdmc19mZCwNCj4gPiBtb2RlLCBvdXRwdXQpLCA0MCwgMSk7
DQo+ID4gKwkJcmV0dXJuIGlndF93YWl0KCFwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsDQo+
ID4gbW9kZSwgb3V0cHV0KSwgUFNSX1RJTUVPVVQoNDApLCAxKTsNCj4gPiDCoH0NCj4gPiDCoA0K
PiA+IMKgYm9vbCBwc3JfbG9uZ193YWl0X3VwZGF0ZShpbnQgZGVidWdmc19mZCwgZW51bSBwc3Jf
bW9kZSBtb2RlLA0KPiA+IGlndF9vdXRwdXRfdCAqb3V0cHV0KQ0KPiA+IEBAIC0xNjcsOSArMTY5
LDkgQEAgYm9vbCBwc3JfbG9uZ193YWl0X3VwZGF0ZShpbnQgZGVidWdmc19mZCwgZW51bQ0KPiA+
IHBzcl9tb2RlIG1vZGUsIGlndF9vdXRwdXRfdCAqb3V0cA0KPiA+IMKgCSAqLw0KPiA+IMKgCWlm
IChvdXRwdXQgIT0gTlVMTCAmJg0KPiA+IMKgCcKgwqDCoCBvdXRwdXQtPmNvbmZpZy5jb25uZWN0
b3ItPmNvbm5lY3Rvcl90eXBlID09DQo+ID4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0
KQ0KPiA+IC0JCXJldHVybiBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsIG1v
ZGUsDQo+ID4gb3V0cHV0KSwgNTAwLCAxKTsNCj4gPiArCQlyZXR1cm4gaWd0X3dhaXQocHNyX2Fj
dGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLA0KPiA+IG91dHB1dCksIFBTUl9USU1FT1VUKDUw
MCksIDEpOw0KPiA+IMKgCWVsc2UNCj4gPiAtCQlyZXR1cm4gaWd0X3dhaXQoIXBzcl9hY3RpdmVf
Y2hlY2soZGVidWdmc19mZCwNCj4gPiBtb2RlLCBvdXRwdXQpLCA1MDAsIDEpOw0KPiA+ICsJCXJl
dHVybiBpZ3Rfd2FpdCghcHNyX2FjdGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLA0KPiA+IG1vZGUsIG91
dHB1dCksIFBTUl9USU1FT1VUKDUwMCksIDEpOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gwqBzdGF0
aWMgc3NpemVfdCBwc3Jfd3JpdGUoaW50IGRlYnVnZnNfZmQsIGNvbnN0IGNoYXIgKmJ1ZiwNCj4g
PiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCg0K
