Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5262BCAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 07:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0583310E860;
	Thu, 25 Sep 2025 07:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlPGfEH8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CF610E860
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758786155; x=1790322155;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lADQ258Rv3XGWpVkUHWiOu4jECnvemuUStfGBSO3Lqg=;
 b=YlPGfEH86NBShwxFresJ7l/9vDdWgpxOgWzS7uP5DGeuAeht1nIvHghM
 R3KkByUcsulBVZSlr3MH6QnOn8n8j5whfNHQwYZJvlr/+toyMtDRwyu8j
 b5z1dzUIRHyANmfNYW3l/bAE4kqwcH+HvyCMQ27p8C7mRquk/CC3lEFX6
 TCL6LFgMXHN5F6RDb97nM/8VoHYeARf5sgJv3GlOFTOKGZocVAuYV9+11
 QyqopMMg0sJrHmH61N1AgFkajf7dNq0ZWKNXRtoR3PKxH2fV+8CEqfxAo
 s1DjPhooglpCyD7kasa1IFRPKlP3dTwllHnYtiSVBfYodXWajhMGoA/YM Q==;
X-CSE-ConnectionGUID: XmQn+uCJRKWKTgky1jUmQw==
X-CSE-MsgGUID: QmxhDGCVRAqLY4gRdgmyJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60987934"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="60987934"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 00:42:34 -0700
X-CSE-ConnectionGUID: XXZWCX9KTPWb4rccT27Y2A==
X-CSE-MsgGUID: jwzz3WPdQoGDHzlb+9YFZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="182418828"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 00:42:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 00:42:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 00:42:32 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 00:42:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSfNoKHxyrQ86IOPOUPXXsA6i1fMnlMb2tnOjc1zBPdYIJOKIswsNnvFWWobQ5PpQJlN6qLznnsv8hDO1eJInlFvfyhLpbSR1Co6KNjDKcSZkuRObcl0cRip5xO1yAi7K/nTiZOHX/PJkyrDcCYlav/pL4f6XMHJY3qpvxGeNMSMqHYsqFvkwu/AexbYmxu0hcyxL8aSL/rU0ZenOdkrex+RD0Jycqmorhtj8GNHf7za2asEz9lSl1p/B93iYro3ciPEUniei1Tes2AjUMqlx+jKdCiiY8GLbEs6+niDQMdG9jx2DK0fYWk8WkI4/IoeBJYPTcdiwE702pcmAH2ygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2oOJj/5Lg72/rvzgtmkAse0Fsq/odHPuqK9CobyRa0=;
 b=OwFIgMWtzfo81ldS+8ijtJd785BRwUm1EBqnPxr3ewGIoQDA2OUJslEL6eHc44UB50yGKDXfN0mjzS1RXvGUz2SHdoiCZESunLwH6cVqobpsM5MLT1wXb3m+xlYChDVYiWWEw0Q4ZDFXkr1V80BCSWe8OmR0ynS6CzlOFy8tWjqlcLWsWvqBT8uPvjPotyA+TVxyMesDH4kQh3CQt84IT9uQ/AXxs+pWlJe9lTMwU/nU3CspFJADDSngHI3mrpnW/jnkTGmdX0fUUvzepNhYdjLTqhE3Jxm5dRIA8qtp413qBpPBX2WDPyIwGbJD+MbUQ4iIT4Hfv1FuVMESO15drw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.21; Thu, 25 Sep
 2025 07:42:25 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 07:42:25 +0000
Date: Thu, 25 Sep 2025 07:42:13 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ewelina Musial
 <ewelina.musial@intel.com>, Karol Krol <karol.krol@intel.com>, Petri Latvala
 <adrinael@adrinael.net>, Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v7 1/2] runner: Abort if dmesg is flooded
Message-ID: <a3f3b62yflwamvezb3zetpfgmaggmkltlunft5u4ijjv7luloq@ct5xwephsvsm>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250924195453.92680-1-kamil.konieczny@linux.intel.com>
 <20250924195453.92680-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250924195453.92680-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: LO4P123CA0442.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::15) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: e3217c21-f9d7-446d-40b7-08ddfc0711e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU0vd283U1lFQ3l6ZEIrbCtmK0FuYUlSaTlHRU1uQXlOeVR3WlJvalJYd25S?=
 =?utf-8?B?UWNhcmQwS0RiRCsvSG01Y3hUSGMwdnNVVWV0aThpQlpTQ2VoUFVUWnNyZlA2?=
 =?utf-8?B?NzMrOHJkbTFPNE5jNWsyaW9vODdlYlFiUG5RYm5VNnFoVUhtQ1l2NldLNlBX?=
 =?utf-8?B?b3UyU1YzcWNZZXNnWFJHeVludkUyK0h1bytiVCtEYzZrSGgza281OWgrb3lj?=
 =?utf-8?B?ay9CYjVrMkwyUHZxL0pmcFdjZ3lKQkU0dHREYitiUy9nZzRmcUpMNEpCL2Q2?=
 =?utf-8?B?TkhHaGpwTFVzSWJBUkNOS2Jmb0dwOEpvdS9MZURlWjV1QXZhdnpkQ0hoQUpj?=
 =?utf-8?B?Szg1cldLNnRCWU5pNTREVzg1anlXV2tsQUpoeVN0eFlUSlRQZXU2VWpqVWxi?=
 =?utf-8?B?NUdKbzVILzRXZW9DT3NoSk54dzdEbWdWUG14RmZ5cmZsT0VONk12eXF0YnhK?=
 =?utf-8?B?dHhWRDRrWXZJOXhDNXVJK0V0b29kdEJUbFhhSi9hbTNjWWx6NUl0WVNYNUdn?=
 =?utf-8?B?dGFzLzgvQVhlYkVRSzlyZXo2Q3VlRkQ3ckpUdS9PWTZaZWVmcVlnTmRNVHNE?=
 =?utf-8?B?S3FLNkM4dytEMWpsWVlFeTZQdjEzR2ZBK3NsUExGUm9hcytKVkZHckpRYlRH?=
 =?utf-8?B?aFJkR21lRkFGMkVGd0ZZRnBkcnJVMllnTllFVW5yUHgyREtDU1p0THRhWVF0?=
 =?utf-8?B?UHh1MHp0MEFzZzJvblVTZXV0RUQwcWUxb1N0L0VDY3VJN2E3YllTcHc0c1dC?=
 =?utf-8?B?ZHBZWEE3MUVEWUpwNktuMm1tQXdicUZpNVRxQzJYWVJxdjIyRGN2dk9ZUXAw?=
 =?utf-8?B?YzVWb0t6cE5qcW0vRmNXclMyRlhaVFpKMVhqb3BsUXpnQkFXbVlvdUFmU3hj?=
 =?utf-8?B?NjBoNzhWcDJKQjdWdDZXbWRzRzRxcG5SQ3FUQm80cGx5UThlZjRJMHAyczRV?=
 =?utf-8?B?aVRUZzI4eHhaY2tHOG16MndxclhRbGhiMlAvWGZTNFo2dW5jTHNaTXBNRUMr?=
 =?utf-8?B?K1BTYjRVaXlKRXlrYW5VTGExTG5YMUZjUDJjc3lidDBDN0dXbFc0Z25XWmJW?=
 =?utf-8?B?ZXhWcVhXRkkvMjdRdE52bTQxdGl3Vm9SMXUvWlJvcStxQzBZQy9Pb1daWGE5?=
 =?utf-8?B?N01tZGdKWlBuNWgwMEtGOWxMYTgxMnQ5WGZxVmw0ZGROSE10cUJUWWZHS0VV?=
 =?utf-8?B?NHdPWUF4dkJnRlQwZ3FBcVlQV2NIVFJlNUJyYzkrR2V3S1BXMnB4L1pyeWh2?=
 =?utf-8?B?ZGlFR3R1aWR0Ym1XZVFLUEVWeW9YZjNPc1B5Y3VkOHQ4eHBjZXlDVWtJRDFP?=
 =?utf-8?B?QVVmMXFDU0JsckMzd2NnMUFjUUZTNngvb0twd1VnbXVDQ0dRSDNHZEYwdG11?=
 =?utf-8?B?cEY1Tm1kclBqUUx4ZmNhOFRyN2NDcklNbk9Ic3BqVGF3dUloNlkzRXhOSE9D?=
 =?utf-8?B?aG8vRjV4U2pOZFVHa0FpUnBIQitzeVlIeHU3K09jNThVeTJmVXJjYi9QQzlj?=
 =?utf-8?B?NGgrRDc4L2puT2VYemJBRWpTT1hjY3diNzJ2M2szWjluZUZ0Z0JtQTIrVFBE?=
 =?utf-8?B?bFcwSFBrUnR0bkZMZlJWb0laWGJIelFlaDhwMVZMdWNMWmRWTzgxQ3FQK1ZT?=
 =?utf-8?B?SHpuZFFMVVlZdGJTanpLakdsSnNmV1Z1UENVcHl0cmdhVnVYRWdsZnZXa3Ra?=
 =?utf-8?B?Y1YvK3BMV2g4ZC9uMzFYVm1VZTdTbEEvRFY3UnJSaXZBQXRYQ2FIaUQrZVdT?=
 =?utf-8?B?emJoTEdOUHNVMnpIbkt5QjVIYkh1d3hkN1ZZTUcyVVpyaUgzZ2VQMm1oTmVX?=
 =?utf-8?B?Z3VxZjdEMElMOUpvdmMzdTBkYnViZjdpU0pML2pWbnR6Rm9qdFJiNk1Dc1li?=
 =?utf-8?B?TDJOU0tWdFRYMWhackhLckUzZWVoblZBeWNTMU9DWE9VdWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm5YOHVZN21FMEVTMkwwa2Uxa0dLSHZxSTBtd2g3MzBUNTZwTlFjb244Umwz?=
 =?utf-8?B?anV6c0NVaEMwT0pobFZlSGZURkYyL1ZheENna0RSU0NjdG9qWUxkYWZDdDNI?=
 =?utf-8?B?ZnBkdFNoR0ZVRTlUaEk0cXlkVzFuelY5dkNMdHJXRllkK1pDWXR2OENNRHpY?=
 =?utf-8?B?TEZNSHNxTHBFQk1RaHNhTk1mNnhybjdJQVVrQjR3czcrY1NqZmVseE1lK29Q?=
 =?utf-8?B?bkFPTURhRnk1QWtCT0R1RlpXTEMrZmxFeFVrR1hBbEVCT0llSCtnYkowdUM1?=
 =?utf-8?B?VkhHdi9IUXNTWmlZZXlJLzNpOXFPZVdJNm9CeUt6bWxFaTRtNDZsNnF2bjFp?=
 =?utf-8?B?TmFUeHNxcnhoVlhXblVhemVJVW93WGJKcDV4VnhTaFpEY1VVb0dpTkF3Mk1H?=
 =?utf-8?B?bHpYWXVlc0VKU3hIc1dSdllGRlNjT3pucTFUMGdlMVgxODZZc3ZsQ0lUVHpI?=
 =?utf-8?B?dDRDZ0Z4RU5RRGFRV05jSkVTMmR3dTFOYXpDYURmZGp6UHZwQmU4bUZrVVh6?=
 =?utf-8?B?VGdzYlk2Y29pMkd1MUNRVjVNT0J6R1pRNGlKM04vVFpsbkpWMTV1WFNIVnpF?=
 =?utf-8?B?SXh2ZkVIeFF2Mmphb0tmdXJlTysva2dqc1dqZHBpS3ptRVphVHE3RGJKdTZz?=
 =?utf-8?B?WTJwd09saFh5ZWVHdTMxVGJzRUF3UHJkWVRrWWJVNG8rRWI2NnVPY1ZNNXJp?=
 =?utf-8?B?bzc2K1Y5eXZNNXNEejFBNHRZbE5ZTlVNcHpIMU9mSEVHaHh1RTYyb05ScnZu?=
 =?utf-8?B?U29EbFRpMDZQc2I1U09KZUxvdUdNTGRScHVzZC9kUEpuN3ZJeDNJRG5ZS2t6?=
 =?utf-8?B?bGVkdkdqZzNubE9EdWg2bEV0VVZwMFBsYWJwdTAwaWdiSjNleVdWNEdUcTFP?=
 =?utf-8?B?bFUyOWVDdUprdUZzbHJkQitxWmVYalJiY0t4eGt6OC9hZ0ZZbFZiWXd6ZTdy?=
 =?utf-8?B?elM0bk5yMHB4ZTh2dUV4b0xKTHBPKzlMQkk2M21vSlF5SGdRZ0xFVDlaVTNs?=
 =?utf-8?B?UXZKVGw2TW9EN3RYZlJpNWlZa1FiRVk3WDRGbS9UTDJGQVNrZjQydDZPQUxK?=
 =?utf-8?B?Rmg2bWNwZmd4RllMZ0hhaDdaSjlqY2ZEZVBCYzRCUk43WklIR0plZ2czMDFw?=
 =?utf-8?B?TFpkRlhrODB0MmsrNndXRGowMUhIN3RVZ2VEMXBjcnRGcU12UmQxUlZsalBu?=
 =?utf-8?B?RUlJQS9tMXpWRVdxSC90M2NkeFVxemRzd3lOck5JRVdUWnZFeUJyV2NLWWJB?=
 =?utf-8?B?ZE8wQ2dWUGZEWlY0cVcwSjdWZXBEckFlY2tkVnl5SHJ5MHNMaVRRQUgvNmVF?=
 =?utf-8?B?QVEzN2tSR2ZIb1BDOHJjdE5MSjlEVFJqM1pMNUNiVHZHbFNxTnJCUFFZYXBD?=
 =?utf-8?B?QTBLZmMrR0VYNjRUUjVQZ1E2MW9MbUVEZ1UrOWFpcDVEM1BSZTM3VE9zYWE4?=
 =?utf-8?B?NVJSYnFXNjBML1J5U2loOWZONVZFQnh3bStNa2R5c3p1VEd0R0dtZVBlU2x5?=
 =?utf-8?B?R0Nid0s3WDN5MmF2QlVPbmtFaStjcS8yT0ZHaXZrRVFGd3RGYzhVaUJ0eThQ?=
 =?utf-8?B?T2NYL0lvKytEbFlRSlhhTW9acU9NMDRpTDBJN20xSHp0S1dZdWFRMUVjWVJm?=
 =?utf-8?B?QWRRVHh3ZDBWVDVlSE5pbGlWbmd3ZmtRRE4rTVMvcTJpTktPYk5BdU1mVGVn?=
 =?utf-8?B?d3Q0WUw4NFpUTkZTM3BaUFU4eTZFenVtV0l4cFo5NkhpWmFnRWo0Q2VvQWdD?=
 =?utf-8?B?M1ZJY3VlUEh6M2pXS0dOaGY3Nm40VWlYWm9zYjFGcDBwenBCVS9wRlYzb0Q3?=
 =?utf-8?B?NWFEeDAwMjFuZzhnaXBjdzNpWldsaFZ1VEJqcUJRVkN1ZUNrYUhMQSsxVHdr?=
 =?utf-8?B?Qk0xcm1BSjFKOXBsSDFUNzhmc0NQSHh3QW9DMk5rSDRYVnk5bmJxUjZiOHdY?=
 =?utf-8?B?bDJlZGNESlBKU0Yza2tIMjNzaFV2UlIvUWw2OTJTeThWQ0c4cytYekFvcEQ3?=
 =?utf-8?B?ekFua3FYaElIRmMvajMvRnVxbSsyclF6N3JRa3crN0l1bjhGOVlXSUtCMGFv?=
 =?utf-8?B?QTROQ29RMCtXUWtPWStJQ2lSY0kvSkFleUcvNHpTU3RFTndpMzdMNkNLdDA0?=
 =?utf-8?B?TjBDSks4cDB4RFZFQ2xkTG00TmJ3S05jbXRhNVJ0OFprRzRWTCtNMDMwTmY5?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3217c21-f9d7-446d-40b7-08ddfc0711e2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 07:42:25.3651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnhrKZ8tmyIVKZ2Bp3HTb2cjeExd02RSs/TwZjfDbx9FBofrcHaHaOSuU5v6Fp7XgCGBh2UHLMe4yARyrRqtVAtHOAeYqy9C7+foE5NcjqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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

Hi Kamil,

[...]
> +static double measure_dmesg_bytes_per_sec(int wrfd)
> +{
> +	struct timespec time_beg, time_now, nsec_sleep;
> +	unsigned long long dmsg_read, rnow;
> +	double time;
> +	int kmsgfd;
> +
> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
> +		errf("Warning: Cannot open /dev/kmsg\n");
> +
> +		return -1.0;
> +	}
> +
> +	lseek(kmsgfd, 0, SEEK_END);
> +	nsec_sleep.tv_sec = 0;
> +	nsec_sleep.tv_nsec = 10ULL * 1000ULL * 1000ULL; /* 10^7 nanoseconds = 10^-2 sec */
> +	runner_gettime(&time_beg);
> +	time = 0.0;
> +	dmsg_read = 0.0;
> +	while (1) {
> +		rnow = dump_dmesg(kmsgfd, wrfd, 64 * 4096); /* 64KB max */
> +		if (rnow > 0)
> +			dmsg_read += rnow;
I think you could just skip the `if` here. Adding 0 to dmsg_read
should not change its value.

> +
> +		runner_gettime(&time_now);
> +		time = igt_time_elapsed(&time_beg, &time_now);
> +		if (time <= 0.0) {
> +			errf("Warning: Time underflow\n");
> +			return -1.0;
> +		}
> +
> +		if (time >= 0.1)
> +			break;
> +
> +		if (rnow == 0)
> +			nanosleep(&nsec_sleep, NULL);
> +	}
> +
> +	runner_gettime(&time_now);
> +	time = igt_time_elapsed(&time_beg, &time_now);
The while loop matches one dmesg measurement with one time
measurement, so adding another time measurement will always
lower the ratio. Did you intend to do this? If you are worried
about time underflows, then you could check igt_time_elapsed()
return value directly. Unless, this is all planned, then
disregard this comment :)

> +	if (time <= 0.0) {
> +		errf("Warning: Time underflow\n");
> +
> +		return -1.0;
> +	}
> +
> +	return (double)dmsg_read / time;
> +}
> +
> +/* Returns: true if ratio lower or equal than maxratio */
I observed a number of sytles used for commenting function
returns in this file, so a cleanup might be due in the near
future. However, this is not a topic for this patch.

[...]
> -				errf("%s", disk);
> -			}
> +	if (settings->disk_usage_limit && disk_usage > settings->disk_usage_limit) {
> +		char disk[1024];
> +
> +		snprintf(disk, sizeof(disk), "igt_runner: disk limit exceeded %zu > %zu\n", disk_usage, settings->disk_usage_limit);
This line is a bit long, could you break it?

> +		if (settings->log_level >= LOG_LEVEL_NORMAL) {
> +			outf("%s", disk);
> +			fflush(stdout);
> +		} else if (killed) {
> +			errf("%s", disk);
> +		}
> +
> +		if (!aborting && settings->dmsg_ratio_limit >= 0 &&
> +		    !check_dmesg_ratio(settings->dmsg_ratio_limit, settings->log_level,
> +				       settings->sync, outputs[_F_DMESG])) {
> +			asprintf(abortreason, "Dmesg ratio exceeded after test ends.");
> +			aborting = true;
>  		}
>  	}
>  
> @@ -1814,7 +1908,7 @@ static int execute_next_entry(struct execute_state *state,
>  		goto out_pipe;
>  	}
>  
> -	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
> +	if ((kmsgfd = open_kmsg_rdonly()) < 0) {
This is not related to the topic of this patch, so mention it in
the commit message explicitly.

>  		errf("Warning: Cannot open /dev/kmsg\n");
>  	} else {
>  		/* TODO: Checking of abort conditions in pre-execute dmesg */
> @@ -2560,6 +2654,11 @@ bool execute(struct execute_state *state,
>  		}
>  	}
>  
> +	if (settings->dmsg_ratio_limit >= 0 &&
> +	    settings->log_level >= LOG_LEVEL_NORMAL)
> +		outf("Using dmesg ratio limit %zdKB/s\n",
> +		     settings->dmsg_ratio_limit / 1024);
> +
>  	for (; state->next < job_list->size;
>  	     state->next++) {
>  		char *reason = NULL;
> @@ -2651,6 +2750,8 @@ bool execute(struct execute_state *state,
>  			break;
>  		}
>  
> +		check_dmesg_ratio(settings->dmsg_ratio_limit, settings->log_level, settings->sync, 0);
Could you explain a bit more why you call this without checking the return value?
> +
>  		if (result > 0) {
>  			double time_left = state->time_left;
>  
> diff --git a/runner/settings.c b/runner/settings.c
> index 3ccf71870..7b0f8ad51 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -21,6 +21,7 @@
>  enum {
>  	OPT_ABORT_ON_ERROR,
>  	OPT_DISK_USAGE_LIMIT,
> +	OPT_DMSG_RATIO_LIMIT,
>  	OPT_TEST_LIST,
>  	OPT_IGNORE_MISSING,
>  	OPT_PIGLIT_DMESG,
> @@ -90,6 +91,8 @@ static const char settings_filename[] = "metadata.txt";
>  static const char env_filename[] = "environment.txt";
>  static const char hooks_filename[] = "hooks.txt";
>  
> +static const ssize_t default_opt_dmsg_ratio_limit = -1;
> +
>  static bool set_log_level(struct settings* settings, const char *level)
>  {
>  	typeof(*log_levels) *it;
> @@ -185,7 +188,7 @@ static size_t char_to_multiplier(char c)
>  	return 0;
>  }
>  
> -static bool parse_usage_limit(struct settings *settings, const char *optarg)
You are making this function more univeresal, am I correct?
Then this should probably be a separate patch before this one.

> +static bool parse_ulong(size_t *dest, const char *optarg)
>  {
>  	size_t value;
>  	char *endptr = NULL;
> @@ -193,6 +196,9 @@ static bool parse_usage_limit(struct settings *settings, const char *optarg)
>  	if (!optarg)
>  		return false;
>  
> +	if (!dest)
> +		return false;
> +
>  	value = strtoul(optarg, &endptr, 10);
>  
>  	if (*endptr) {
> @@ -204,7 +210,33 @@ static bool parse_usage_limit(struct settings *settings, const char *optarg)
>  		value *= multiplier;
>  	}
>  
> -	settings->disk_usage_limit = value;
> +	*dest = value;
> +	return true;
> +}
> +
> +static bool parse_slong(ssize_t *dest, const char *optarg)
Here too - you introduced a new function, which deserves to be a part of a separate patch.

[...]
-- 
Best Regards,
Krzysztof
