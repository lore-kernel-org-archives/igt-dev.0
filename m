Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD0ECCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 11:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1618310E9BB;
	Thu, 16 Oct 2025 11:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzUR5MiC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C191210E9BB;
 Thu, 16 Oct 2025 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760614666; x=1792150666;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IN+ISKsORnPeKd/+0kyPoIzHKry+6BLhhACIFM5WKcg=;
 b=RzUR5MiCPIC6iEQG02kPVKOWe1t+3+zDlcJhGRk1bmnvhScNal4C5oCu
 hHr/HT7NlLwsznuig94QL5eD5eaacEGfyPFahflFEdsRm5aFcrUm+jDxV
 6uhx4eBfmkPsMEddYPqWfcfuzJ+GGcv1G2ZqFgZdGFn/xVgTgo+6in0XL
 /sEnkHsUu5YJK4+pIJApnXw4N2QYIZD0IxuKyvDB5ZJ6z3BWsvoOK+vXW
 ElfGvbjZ0MGkFv3XLgEkrvqT88g85JDJ/87BdAHBrokftJkzhr2S+Eprn
 lulosGitsDl+4NuS2iQ6F3sJNn+0JiAvHf86mU/nCwZ8d3MSGTYpoimSx g==;
X-CSE-ConnectionGUID: FLNwwc5HT1aoSRFs71tM1w==
X-CSE-MsgGUID: SvLj7d5MSe62Js/pLu4NYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66634899"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66634899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:37:45 -0700
X-CSE-ConnectionGUID: uIlzcre/TX2Jv3cj/J4Xlg==
X-CSE-MsgGUID: x7cXmHgtTw+nclW2F+t8sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181563594"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:37:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 04:37:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 04:37:44 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.30)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 04:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7Gmx4TkFestH1NNq3Y58BE/vlK8ETG037y6ze/K9wIoDNCYEoiYrksJqNv4/NS5w78Oc9tDE1QvZsXU6X8CrXqnizThl/VmftqMX2yLBoyItK+pQ+OpD7ei5ga8XogUcSB4+l1+OOSf2h7Hf4Jh+1tQpOI9bE3PSeq6BaZw+ouqtAdKPrE5SdnkSsK5i4qpCUtQzRUsMOWYPzgbiUfs/ixjV5viGKtasH0BcNzGKEGNlTmYG3oDUoOyTZCkOFSzKQR82Qoh9vtN8VHH9MaCS80jBibVYhl1UDP8zBZ75I74Rw2YYlPTJvXa/PnYKecgRJHToySZhFl4eWs1v+iSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN+ISKsORnPeKd/+0kyPoIzHKry+6BLhhACIFM5WKcg=;
 b=bpRhDQPsb6xwINz+DRXmCbY9MHAK1km8/kbp/R0HJ2WENLA/cywZsNNY1kJDbN0wb2ZR3x7m7svv+b1qUq5ZMk20lNUrzUXr6+XuS9SXGdy3y6Xn+4ug1h5RXnjYwFTuRaF7+bWv8fAHmzYXGhyx1BxXndV/DLq3hZfkTim/VCvgUjieo/Lr3nxXPwaOBEP/oQSgL9Z2+W53IjH6/KEkVNbKVNfJBMSypoeAsOMcqBLm/8TLOVjXZJp4zKeLtvPmM0QE7BKk3m6JrqJns+mhhME/B9cz5qz6+9q8/HwuKwYYkXmAVq4NXZDb5PF1aFtZYngjQ2Hz8Y3NqjveQ7foiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by IA1PR11MB7385.namprd11.prod.outlook.com (2603:10b6:208:423::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 11:37:41 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%5]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 11:37:41 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2dlbV9l?=
 =?utf-8?B?aW86IFJlc29sdmUgdGltaW5nIGlzc3VlcyBpbiBzdHJlc3Mgc3VidGVzdHMg?=
 =?utf-8?Q?(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvZ2VtX2Vpbzog?=
 =?utf-8?Q?Resolve_timing_issues_in_stress_subtests_(rev3)?=
Thread-Index: AQHcPoDtO6yOu1GETkehwnOG5hk+TrTEnWGQ
Date: Thu, 16 Oct 2025 11:37:40 +0000
Message-ID: <CH0PR11MB54913C0CBF6A430797E3C38FEFE9A@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20251015124419.66460-8-janusz.krzysztofik@linux.intel.com>
 <176060654705.21516.9677119278424745975@97596180aaec>
 <10737269.nUPlyArG6x@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <10737269.nUPlyArG6x@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|IA1PR11MB7385:EE_
x-ms-office365-filtering-correlation-id: 0606a426-8689-4c47-c20a-08de0ca86a3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?L0FBcWpaNVo2VzJyR1V0dHVXQVRBUk9UOXNUMGZ0Qk5sakJlZEorTnRJRWVT?=
 =?utf-8?B?eUVMQ0ZPTDBMcThvUFA0R3JkYzE0ZUI3L0NkeUV6RkRaYVJOMnZ4OGNTVWVx?=
 =?utf-8?B?ZGY0dVluSUNIM0pyNXJwdDZ3aEZGek9hYVp1Tk0zeTJlZHRiSlhrMGpaSGVQ?=
 =?utf-8?B?VmdsMFBNazZCUEFIenpHdWphOUl2alpPTTJxQzhWZUtleDVLMDdMK045dk1O?=
 =?utf-8?B?d05iSHBXSlpKQnU0anRvVmQxSzdPN29WM0xoTkZFbmcyOXFENGR2YWQwSkJ0?=
 =?utf-8?B?cGNrY1FnWUIrRElBSzVkQnBXVTU2SXprRmtJRUJiRjljZ2d4TFdXWFk5UUI5?=
 =?utf-8?B?QU13OG1YWU42eUpLMlBRU3RsalJwUjZXVHFRTmtPOFhBRjFrSUlGK25ha2l6?=
 =?utf-8?B?OTBJZTdVVWJ3dG12VmIwK0FRNkE5ZFJZUmx3MGxOZnczNVhEZ0x0aDdNOU1U?=
 =?utf-8?B?aFZZcFBGa0lqWFJTZXdPTEJoMjRTb2NxZEI3Sjcxb2NRM1BkWUVIMEg3Ylly?=
 =?utf-8?B?MGI1cGVrRXZxaVBiOW9xUURWdVZ4dUVlNG56REJ0WUQxakorOW82Y1grYWtC?=
 =?utf-8?B?MHRvc0pPTFh0QjVZMS96TUt2ZTZ3eVV1NlgvbE42akVoQW5icUZjOGlud1U2?=
 =?utf-8?B?NXpuQVBmK09IZGZTY2NVU1o5bXBycUFTRVZqSllZbW8rUUJvNk4rVllVQUp1?=
 =?utf-8?B?eUx6Nk1POVBVUmsyYmFDcFN5c1FUQXJTWVhpWDkrOWhUbkZiZ0t3VldZOHo3?=
 =?utf-8?B?Ui92dGJHTEtBS2hXNld5dk4vSGhjRVR2bG1ScE9INUZlbExSaWpzc0NJL2k0?=
 =?utf-8?B?eDJJNi9HM2FqaWF3MjZCMzgrNHc4aVlwNmZlRUs3Y1VtQkZBb3d3NkRqdElO?=
 =?utf-8?B?YWVYUnBuUWJwdE5CcVl5S3lNZlpuVjA0YUxOOEQrZ0h3aFB5eGVZZlprRVB5?=
 =?utf-8?B?MTVubzc5OGoxUHpxbXYyUUxoeUNxZ2hlWXl1UG5LVWVXT3hGNkVpN2ZMcGc0?=
 =?utf-8?B?WktJbTY1cTI3V0phL1NOeDFyLzBMNXlwTnl6SWtxNThwOExIekhJZ3gxL1Zj?=
 =?utf-8?B?bTRreFp4UXE3V2NVdUxCMmNvNkZPbW1GMnlBd3YzRG1rNGdNaFRhYlhBb0Rt?=
 =?utf-8?B?TFpnZ2FkNmxOMzJLNExUNzg1S1NIQitnaGxJY3cvd0l3VGxEaG9lOVNNQkxQ?=
 =?utf-8?B?WmN3MU1DK1JKTWJVQTRZWVUxVU1zdzVCRjRwL3ZibEpFUnEwZ3BDUHZsNlVz?=
 =?utf-8?B?ZW9RRW9Jd3FxZHVPcG1udzVOOHdBVWlnNFJNejdSQ0R2WjJENW1MemdOd0Mz?=
 =?utf-8?B?bmlBRjRHNFBBdmpra1p6MGVPSHhOSGhrL09YRnY2ZkV4TmFZMW1Jd1VRK3hQ?=
 =?utf-8?B?WXFXdVhGUFBGQWpEcC8vNXlDQi8zRVd3SjI5c0h2QlFZOXF3T0VyOWlIM1Ur?=
 =?utf-8?B?R2ViZnhmejd4aDJvTDBoeGZjdU1XNXZmdjQyamJSb3lYU0lYUGlWQTA0cXBO?=
 =?utf-8?B?WjZGVU96czJFUVNtdHZub0tUZVlMTmdtODFOVkp2b0RqT3l1L1QvSDE0bjB1?=
 =?utf-8?B?by9IcHpvVWlLR1hNY3A3V292cENhTXdiaUZXS2xtTzlTaXgwRll2Tml6K2VJ?=
 =?utf-8?B?eHN4V2ZrWEQwL0NBMTFZQTY1QVVyWnNKSzBaL3B0RGc0YXIzUEdtZ0FUT0hp?=
 =?utf-8?B?akdaNnY1VnAyQ1VOc010ZW9VYWRobjBDRlVqVkFIdEhlRmxiWnZ6c0k2aGlT?=
 =?utf-8?B?dnZJRVJNR0ZNVG1DZ0RFY0hWQlQ5ejcvWFN2RU1vbjM5TEJYRnpnMU0yRWI5?=
 =?utf-8?B?dldVM3FCNXhRK1RJQlppWEhad2hBT21qVHRIeFd1UmM2c2lUa2t3NW9yRHVB?=
 =?utf-8?B?MkVFWmVHeXJjR0tNU2VrSFJWVVA4L3FtbFc4RzJiNGd2ZjBOaUg1MWZqTFAw?=
 =?utf-8?B?RnYvNDdsVnRmR2pvOHhFcmlrSjQ5allvREZib01vRElvSWNBSHViSjd3YXNI?=
 =?utf-8?B?REF4OGg4dGp3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFMvMEdYNjBMYnEwRW9EbFc0TFByeE8rTi9lWUJVcUNQUUZZajkwbmg0RlJ2?=
 =?utf-8?B?VWlrRW9JWE5XOERtSjRxYTdwbHJwZDRsa0xpeVlPdEtVaU92bVdzc3hhMGxF?=
 =?utf-8?B?aFl3MTFPTWpUNW9PQTFIc2ZnbWEram5NT0hjRExXd0M1bHYzMFpvVXh5cTE5?=
 =?utf-8?B?d05peHE2UUdvOGJDL1pXb2ZkMXR5VEI3YUZ3d3dyYzFrK1ZnSVkyWHV1V0FB?=
 =?utf-8?B?dU51VG94ZFJ1Y1BDMStYTDVrVktKWkN4eUNPREZrZ21qNllJazlaZVNGV1R5?=
 =?utf-8?B?TFN4QTUzbmhDUmJqUDllYnIwUHJ2eFhacWVmVDkrRndlbjI3THBrdFVBZU15?=
 =?utf-8?B?UmI0MXlQY1BPeTdXSFpmVGQ1NncwU2tJdkEyRW8yM0VrZW9PdHE2UjJSNUZN?=
 =?utf-8?B?S1FlNVZ3N20rdHZGRW16dGFNaWliZ2QyZEdHY2xYcHdWRjVMYnVzWEdYSVhB?=
 =?utf-8?B?TW9Ba2ZPR2tPZGp1WGcyNHBva0NyRFF0Y1UrcnVOWUJhZ1hGVlpZbHJhT0Yy?=
 =?utf-8?B?R2hTTTRpRklYczVWRjFNa2FzNE1Qa2JlZ1dZbzBacTlaTnQxSFM0OEZvdGZk?=
 =?utf-8?B?bU5ZQjlUVTFxOFkrV0ZCWnE2SkdndmtHUk5OZ29VandWanp1ZjdBZ2tOSFRX?=
 =?utf-8?B?QkNoTjI2Y1NRc3VrWnhCbTFpelA4eWhad1ZUVDh0eitqaEZpT3UxbEJ1aWx1?=
 =?utf-8?B?UDE5VTQrTkxid3g0Q0dPaXZFUzhObGFDdFo4dmlBTFU5Yk1lMHdXdHN6WlRu?=
 =?utf-8?B?V1NBT3ZLSDljWjM2WGtyV1lubVpKY0JKYXF2UFlxM2JVQUJVUWZvdm43YzFq?=
 =?utf-8?B?c2RLcXdJK2JWd3NVV1NzNnIvUlNwODByNVZRa1h3S0NBczdQdUs2cVFtNEtQ?=
 =?utf-8?B?ZHN0WWlsWU1PRmRFMGVWYkx2UXk2TzZsTzFwK1dLeFczQVozcWRvbys4RmpW?=
 =?utf-8?B?cHZHWTE5Q05WQjlKM1hQenl6Q21QMCtOYWlNRUgvTnVHeU9TVHlRVGd6Wk9u?=
 =?utf-8?B?WWMwRFdjY1BkSS9OS1FDM0REd2ZsS1RsVWNVdnVkTlIzM0lxWmw3Vi9NNnhz?=
 =?utf-8?B?SUdXK2M3T1QwL05KVnB0Y3B6NGRxV2V4KzBmRXByRG9BdWIwVXJXUDRkLzFv?=
 =?utf-8?B?M28wTFJuNHdGTUtCemR1bVJxWWdFOC9mM3gxam0zZzNscWtFTGk5VlJNS1Jw?=
 =?utf-8?B?Vjg1KzhpTkVzaEk3K0V0ZU9MbTJyRUFqcGg2bGtEWWVlQzlCV2NGVTNnS2pC?=
 =?utf-8?B?Yk1nKy9YYjBqMHVpR0VmVUNGR25HUkVDR3M4ajJ0WjdvOUNVVklEamVTUGVI?=
 =?utf-8?B?NlBCTEVVZ1dWczYrcFJJS0o2RjhWSzFQaTd2WDRscWFaQXlWVDNsbGt2Q2oy?=
 =?utf-8?B?ejRBRTNRTEJQLzNxYndqYzY2aWN0aUxGWGZpVFBZRjBISi9jdVhObkoza2Iw?=
 =?utf-8?B?b0VESU1NTFZNSExoUDlMaG4vQ3pBaFFVSit5LytSb05DV1ZCcjNpRWxKbzlz?=
 =?utf-8?B?bWJwaSt5aENVcENQeVpDZ2VieVcvUzFlblNwdmdrMGZ2VVROZDVCUCs2NDJw?=
 =?utf-8?B?RmRKbFhSWUNpZ0RyU21BVEtmS3hhS1JaMUZwbzRnaGlqRzdwckxqWmZUYmFl?=
 =?utf-8?B?RDdYN2l2dEJHTzFzMTQvYXpIdkJlbWdubTJ6eEhTLzkraHVZdHlyeEhSQXgr?=
 =?utf-8?B?ZDBhTWpPZUNlT3BCYjVCOUFLczRlUWoxTTU0V09mWWtINWlXbWMzVW1YUkI3?=
 =?utf-8?B?dndxVFBuOHBtdTBXQlMrWjg3aldueUl3c3pIZExIR0gvSzJWY0FEb1BZZXVj?=
 =?utf-8?B?b01wcHZmdjFZekZ5bFcwL0kxajNyUUdodTdkRWQ5dUhGclNRcGMwU1ZzbW1S?=
 =?utf-8?B?SVphNDhqNVZTSU5pRGptTGlKUHdNQW0renBiY2dibHBUTmNLNGZRNzdZNFVn?=
 =?utf-8?B?NExrSGZjdkYwbWJuajV5S1o5OTZMejByL3pFak0zRjJmb1h4RHZaeGFkWm9G?=
 =?utf-8?B?d01SSVJCTjBkR0NDTW1rTVZCb1RWTHJJRzZ0NWtEaEtPM1Qwbm04R1RyYWZ2?=
 =?utf-8?B?d3VTL0lIcDdEUnBET0hvZStPWmkzWTVoQURkNVhNTmR3NnJLWEZaZ0RlZDYr?=
 =?utf-8?Q?qXtPl19t8lA7N7oi/QjT5dGFT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0606a426-8689-4c47-c20a-08de0ca86a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 11:37:40.9626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0c81t3d8MAwUDBWNsWCfIzHXmZJ34gNmT8UTtbd4sPkaS6DZQ8Bzna1RXfK/9jPcX9FTGSfm4LGhuG7Mp8AeaEoggcnaqXLoE4E0tXN5/wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7385
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU1NTMxLw0K
aTkxNS5DSS5GVUxMIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClJhdmFsaS4NCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKYW51c3ogS3J6eXN6
dG9maWsNClNlbnQ6IDE2IE9jdG9iZXIgMjAyNSAxNToxMA0KVG86IEk5MTUtY2ktaW5mcmFAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1
YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy9nZW1fZWlvOiBS
ZXNvbHZlIHRpbWluZyBpc3N1ZXMgaW4gc3RyZXNzIHN1YnRlc3RzIChyZXYzKQ0KDQpIaSBJOTE1
LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywNCg0KT24gVGh1cnNkYXksIDE2IE9jdG9i
ZXIgMjAyNSAxMToyMjoyNyBDRVNUIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFp
bHMgPT0NCj4gDQo+IFNlcmllczogdGVzdHMvZ2VtX2VpbzogUmVzb2x2ZSB0aW1pbmcgaXNzdWVz
IGluIHN0cmVzcyBzdWJ0ZXN0cyAocmV2MykNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1NTUzMS8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9
PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIENJX0RSTV8xNzM2
OV9mdWxsIC0+IElHVFBXXzEzOTA5X2Z1bGwgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiAN
Cj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcg
d2l0aCBJR1RQV18xMzkwOV9mdWxsIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlmaWVk
IG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBo
YXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4gSUdU
UFdfMTM5MDlfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJh
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRo
aXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGlu
IENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEzOTA5L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lwYXRp
bmcgaG9zdHMgKDExIC0+IDExKQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
DQo+ICAgTm8gY2hhbmdlcyBpbiBwYXJ0aWNpcGF0aW5nIGhvc3RzDQo+IA0KPiBQb3NzaWJsZSBu
ZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVu
a25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xMzkw
OV9mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSBy
ZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGdlbV93b3JrYXJvdW5kc0BzdXNwZW5kLXJl
c3VtZS1mZDoNCj4gICAgIC0gc2hhcmQtcmtsOiAgICAgICAgICBbUEFTU11bMV0gLT4gW0FCT1JU
XVsyXQ0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
Q0lfRFJNXzE3MzY5L3NoYXJkLXJrbC0yL2lndEBnZW1fd29ya2Fyb3VuZHNAc3VzcGVuZC1yZXN1
bWUtZmQuaHRtbA0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVFBXXzEzOTA5L3NoYXJkLXJrbC00L2lndEBnDQo+IGVtX3dvcmthcm91bmRz
QHN1c3BlbmQtcmVzdW1lLWZkLmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX2F0b21pY190cmFuc2l0
aW9uQHBsYW5lLWFsbC1tb2Rlc2V0LXRyYW5zaXRpb246DQo+ICAgICAtIHNoYXJkLXJrbDogICAg
ICAgICAgW1BBU1NdWzNdIC0+IFtGQUlMXVs0XSArMSBvdGhlciB0ZXN0IGZhaWwNCj4gICAgWzNd
OiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNzM2OS9z
aGFyZC1ya2wtOC9pZ3RAa21zX2F0b21pY190cmFuc2l0aW9uQHBsYW5lLWFsbC1tb2Rlc2V0LXRy
YW5zaXRpb24uaHRtbA0KPiAgICBbNF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzEzOTA5L3NoYXJkLXJrbC04L2lndEBrDQo+IG1zX2F0b21pY190
cmFuc2l0aW9uQHBsYW5lLWFsbC1tb2Rlc2V0LXRyYW5zaXRpb24uaHRtbA0KPiANCj4gICAqIGln
dEBrbXNfZmxpcEBmbGlwLXZzLXN1c3BlbmRAYi1oZG1pLWExOg0KPiAgICAgLSBzaGFyZC1ya2w6
ICAgICAgICAgIE5PVFJVTiAtPiBbQUJPUlRdWzVdDQo+ICAgIFs1XTogDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTM5MDkvc2hhcmQtcmtsLTQvaWd0
QGsNCj4gbXNfZmxpcEBmbGlwLXZzLXN1c3BlbmRAYi1oZG1pLWExLmh0bWwNCg0KTm9uZSBvZiB0
aGUgYWJvdmUgZmFpbGVkIHRlc3RzLCBvbmx5IGdlbV9laW8sIGlzIHRvdWNoZWQgYnkgdGhlIGNo
YW5nZSB1bmRlciB0aGlzIHByZS1tZXJnZSB0ZXN0aW5nLCB0aGVuIG5vbmUgb2YgdGhlIGFib3Zl
IHBvdGVudGlhbCByZWdyZXNzaW9ucyBpcyByZWxhdGVkLiAgUGxlYXNlIHVwZGF0ZSBmaWx0ZXJz
IGFuZCByZS1yZXBvcnQuDQoNClRoYW5rcywNCkphbnVzeg0KDQo+IA0KPiAgIA0KPiAjIyMjIFdh
cm5pbmdzICMjIyMNCj4gDQo+ICAgKiBpZ3RAa21zX2ZsaXBAZmxpcC12cy1zdXNwZW5kOg0KPiAg
ICAgLSBzaGFyZC1ya2w6ICAgICAgICAgIFtTS0lQXVs2XSAoW2k5MTUjMTQ1NDRdIC8gW2k5MTUj
MzYzN10pIC0+IFtBQk9SVF1bN10NCj4gICAgWzZdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNzM2OS9zaGFyZC1ya2wtNi9pZ3RAa21zX2ZsaXBAZmxp
cC12cy1zdXNwZW5kLmh0bWwNCj4gICAgWzddOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMzkwOS9zaGFyZC1ya2wtNC9pZ3RAaw0KPiBtc19mbGlw
QGZsaXAtdnMtc3VzcGVuZC5odG1sDQo+IA0KPiAgIA0KPiBOZXcgdGVzdHMNCj4gLS0tLS0tLS0t
DQouLi4NCg0KDQo=
