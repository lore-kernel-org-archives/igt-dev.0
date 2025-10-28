Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7378ECCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 12:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B77B10E3B6;
	Tue, 28 Oct 2025 12:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGpE6L4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA3010E3AE
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761653054; x=1793189054;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qxNxd8afszovnwWHmNTKFpdP3mheTH052Co1e8m5480=;
 b=dGpE6L4Tcw6zTgVjK5T1qBuwYMFJRgMh1qYmOYNO2cwxLjBgaqd3bP1d
 K7NnPFXLEn7YB+ySP3NzH3tQB7TN05a0ubjR4tmX/8IAUDXIiVsHA4cVg
 9fqRMhgTXxmpzmM2yG4EyRCOA82sLbkudjdDioo2Zkmmd8357qOFiCSiS
 ODF2o3GgR+FcjRDCgrOkGXseVnSUr0RcwnlkOm69icDO4pepya9Z1kZQR
 xtYLJDDfoKbA+wx+koFB8MpU/fvm3sdorgYZR6snR/Q68s9oYFMZE6wIh
 VwLDdfgzpcRkqtTRKbuOSEoZNn3smOpkidhOAndOPPd94MIDaITXsg4XY g==;
X-CSE-ConnectionGUID: /PyQePPrRF20zqFrad38yg==
X-CSE-MsgGUID: DUGr27ynRbimKkR43nIxFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67393192"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="67393192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:04:13 -0700
X-CSE-ConnectionGUID: TZtsgvDFR7OxRfwbleQ8lg==
X-CSE-MsgGUID: p2TyW3WnRIaUzUSPB5vtXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190519647"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:04:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 05:04:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 05:04:13 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 05:04:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmpoikoNb0V42xSxmZTZI6gHm5gou2R1BQdq7tPVKmuEioF5Yo+scNYJ2gVyhyugjguf1G4m4yG1tZprLRO8DaSEsTmYpFwcU6sKENYe03U1RB5n7RRRzdDDwoASEL/YdEny2gD2/qdgg0ljAMj3IzrK10NG2zVlnpQfPhFBE/e118OgJbwlrJIkr+H2GhRzIICMoutRXbkwKUL2Mejh7k0YaxdGQGpwqkQFZDxeXiijf9LC0ieC40lHKC0xlILRksVIO+iQCBe7SudLituQZ7r+muG7kvRYOfX+tmVzxefFW6W6HuvH1wA2yKfNv/i9IQ9fkr4n190iFHV948PT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ky3Vsd02pDrjHy05g0jLb1HDZZQfNaxHp7iVwCuauQ=;
 b=B2sgtZ4cyB4QABBsgw59xNpmn09xeSi06X2Luxas6z0O9bHnoViGfguDki7YhET/QBOHHLXX0B6YSR5eiiJh3yOnCWR1GeK9RUIMPmRgH0r3ROVBYOGAJdNL6oZ13gRFSffMSGOLUWAkGTzWfXZ9++u2ZaZiP3wpo/sGqwAXRGKatj6L9736DEVWLBhjlPxRwZ+Db5t9eXznFc6yVflZ3892Wv6JK2GXgw3usnKIyl6eSPfwRwzIhq2HwZpvU5TzhALK1xLaJR/jMIpKFQNiMT++Z5DPwPPP9mOIgY9nCqgHAxg0qMe6YGPF15fHri+O2ptx6hyBFPPKMN6N9kMf1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by DS0PR11MB7970.namprd11.prod.outlook.com (2603:10b6:8:121::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 12:04:10 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 12:04:10 +0000
Message-ID: <9556c7af-8b2e-4cd3-a575-1fbb44fd6c6f@intel.com>
Date: Tue, 28 Oct 2025 17:34:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/1] lib/pciids: Add NVL-S and split out BMG-G21
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>, Jani Nikula <jani.nikula@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0169.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::13) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|DS0PR11MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: a004502d-64bd-46d9-cf82-08de161a1a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWxUSjFSbGw0UkpTWVBYeXFiemJDdzUrdTNkUUluOGZPd2ZVMWliZWQva1B6?=
 =?utf-8?B?TTdLUHIxZUVrWncwVVhsakl2bjl2SE5hOTNKWHZ6enhsdmQ5VEYrNGh5VFZ3?=
 =?utf-8?B?T0U5dFV5MU9VUVUza01jamRDNVVBYm90SWFoYy9QSjRGS2dyTUsrOUEyUVVv?=
 =?utf-8?B?bHd1ZnBOQ0p6N3ZoN0pnRE5ZWjdoZmlETEh3a21laUZzWVVNWERPWjZPYlZs?=
 =?utf-8?B?Q1p6OE44Mm9sakZZVzZIWlVUL3Jlc1EzVGtpclprV3dBRzJFbmYvb1lBT09K?=
 =?utf-8?B?Q1ZxMjVLZFNUNWdvcWIzODRyRkZjZWU4amFwL1lZandjSFgwYkFyckFUelpl?=
 =?utf-8?B?S0NwRjlaNlp4TDVSbS9INkV1eHQzL1NWYWxPOUlPb1lybVdxSm9qUXp4N2JT?=
 =?utf-8?B?SzUrWVZvTm13Und2T291d1VuVVBUUXpXQURwSUV3Y0QyZFI3emd4WWQ0ZEtY?=
 =?utf-8?B?UGt0UUlKcDE2dDN3N0F2RWxOb0VzSyt5QXJnd3BFamRFZE5BbUZjU2d1emh5?=
 =?utf-8?B?Qnl2L1FOTEcydEY0dTQwazJTdndqMk1lY3FTUDRMMGdkTm1rd0FTWDNObnUw?=
 =?utf-8?B?NGpxN1dOd3hUT080Zk1ySkRJNHZieVlmUklaV3doQ25kanJwcFVoekF2OE1y?=
 =?utf-8?B?VGtkbGhJVGNxQ1dpc08wOG1sNk9vV3l1VUJkeVUySk11dy9OWVlML3dVZEZC?=
 =?utf-8?B?Y2N4T2o0U2xIL2ZudkI4Wmo2dFlhMVBOY0YvYWhZdnVMRFBxUkRtSlNzWDd6?=
 =?utf-8?B?M0w4VlBOdnhhd2ozSER4UnR2MGd0dUo3QTNPdE1lRnRHWGtxTERxNHUyOHZu?=
 =?utf-8?B?MHFRQzNzN1htalltUUR4YTA2QSt3L0tqbFV6L0VYL1NHVzFkeTRtNjZzckNa?=
 =?utf-8?B?YnZhclVWbWorOG16Yk9iMmg3VlBkN2xIWjFmVngva2xsLzIrTEJGclNreU8y?=
 =?utf-8?B?T2twdUtJM1o2clhqdCtUdGNDd0RZc2RXN0tIbG83aVNpYzZOU3JhU1dQdmI1?=
 =?utf-8?B?L25JNmZ4eThwOTZKZWVXelFKSStaaTI1Nko2dmdlVmJTVVd5SXRrQ1pFSnVD?=
 =?utf-8?B?VG4wb1N2TjlERk03RUdaSWhLYlVYd1JhN2JseVFaZ0R1MjlkRXdXN3htODU3?=
 =?utf-8?B?RzkvQUxDT1ozT1hvUm0xWnhQK0JPdVFpOGROUm40WWkxLzdpRmp5T1NVYXo4?=
 =?utf-8?B?MTNPOFZrSTlKa0RFQTBSNmllOU1tcWNOaEJRV0VmWjI1UmlnZVd2b0JiWEZ1?=
 =?utf-8?B?QjVVaXBJSGNITmtwT0RlQW1zd2o0TkE3OHplMTB0Ty9YQlFTOElGQjlxSzJS?=
 =?utf-8?B?cGFBbHl6V2ZObUN0TGRGZ2tiSFhBTWhyK1hqTXM1ZEtSQ3Q1ZXBVN0Fzenhn?=
 =?utf-8?B?TjdaR0lYNUF3eUV0eWhVVXYyNHVuTHUybzhzazRrc0NMZ0dkZDVOdG4xb21u?=
 =?utf-8?B?QzV1Q011d1ZjQ1hkOXpVSHlYeGo3d1hNN09yc0FGb3ZrRVl3MmErNDhZa2pZ?=
 =?utf-8?B?a3cwTEViYTQvNWJkM1Z4TlpaRWdHN1BJUGE0RU5oQndvQ2cvSmorVCt4RStz?=
 =?utf-8?B?Umg2dnM3S3dLRXpubjhaR2N1d0RZUnNvOWxoa1JLaWMyYXJBSUVuU2Fsbzhl?=
 =?utf-8?B?TTJzcXZ3aHZaaFozOHlIVVlMMlNjS09VL0M1cjRHK1p1UjJWYXBJNmJoemVr?=
 =?utf-8?B?Z1lFcCtHRndEOHh5WmxLR3p4NzhhWTJONHlMZHRIYVdJckJNaE94MCt4WXZp?=
 =?utf-8?B?K3dNZG5KVE5MaDVjK29wdEUzelYzaHN2bHhGSnAzRkh4dnI3TmxubmZ3S0l6?=
 =?utf-8?B?TjRzdHM3TTdBbHJ0UHptNHJCRlQvR0Z5cVFNaVloT2J1bE5ncU5ZS0c4dXp0?=
 =?utf-8?B?Zkp1eWxwcGNQdjJhc2liZ0hBU1piYXd0eVdtcXpjb2VuY2xnak9QQzIzZnFi?=
 =?utf-8?B?R2JSUVkrOEVYT0VNK1hTS1VxTEJrM0IxS1FObEprVS82dGlQNGRXNFkvbkdI?=
 =?utf-8?B?V2EvRFJNRG93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmNSTkFGL3ZvL0JGMWVna0FTbW1GYjVWdUdwT0p0VjA0cy9FTk05bm5iNnVi?=
 =?utf-8?B?T1hvMTlyblBmclJaN1N5WnQxTkswZm4wSlJZaHU2TnlLcmMxV21VSmg5TUZY?=
 =?utf-8?B?WEtYTmlHN3l0VGxPaEN0UDFHVjhvU1EwMEpWWkZSOC9MYlJqTEgyb2E5RzZK?=
 =?utf-8?B?dEtYN2phWG9heGhmcUdiRUJVdHVRTXdKN1pGS2R5ZTJzMmViNGZMWUJTVmQ3?=
 =?utf-8?B?QkN2QSt5LzNLM0t6ZCs0VXhvS29Gc09KODJLQXJ5cmdzeU9xUVpzamRLK0pH?=
 =?utf-8?B?c0lWMDd1RWNFMjBXRFI3SkhpUGFuazdObkJZTldaZTJydm1kS1NUbG96RUpW?=
 =?utf-8?B?NC8vZVhzS0YyVVp2QmxOdkZERmpwNFdVaC90OUlmNVREcW9OMWlKY2VRM2l2?=
 =?utf-8?B?MWFHbjJxeTVLR2VmUGp0MU9LYVMyU1JOaERPREhYcEMzRzJRdHdDNHFvamps?=
 =?utf-8?B?V09RUUQxcGYrZVJMZkFqZWwxUDVlVmRBeVNOVDU1MzkxdzJEaS9LMmlkdjk0?=
 =?utf-8?B?MEwxSXhoVmFNWHRHRXYyNk91TmkrREdHYzR1TmU4MjYzMlNUNmFOd1htZzRH?=
 =?utf-8?B?SStpWlZMOERCcGVZcTQvSlFENkFkQTB0ckpSOWVoL1NtenJWdWV3WnFXZ0oy?=
 =?utf-8?B?SUVNVWZnbDRTOWRvQjd3R2JsNlplOFFxdVRSa1RObTdjNVF4V1J4RW92ZlFB?=
 =?utf-8?B?K1J5bFJocDdWdldvMzErMS9takNUSFliNWpuTmdUUU9FWWFHNElYZG5leWND?=
 =?utf-8?B?RTdsSVFhYXFJN3VSUnBwR3BKWEFzeUhqZWhseUJONmFmbUI3a1ROZnMyTDFj?=
 =?utf-8?B?Z00wOHd1dGZTUFU4NUd4NWxEMDFzOFlQR0FoVFBpL1hJcHRERFg1YnZGeklS?=
 =?utf-8?B?SzdORlVzbjNUTG9nZlRvTzE1cU4waGE3MzluU1ZFZisvRjRZNFRnQzROSXp4?=
 =?utf-8?B?cE93bzBxSmlOeGw1Y2RUQjdlVjNSb0dHL1hQbTlXbE10NFNDZGUvWlhXaGo4?=
 =?utf-8?B?a28vcnlWZzE0b29YL0ZibkVra1JMRTVHOTBnK0w5QlBGSVNiSWdiRkJrVXhP?=
 =?utf-8?B?NHExeVJ5RWpxOURXOHpSbzhmZWFlZkFFZ1Z3d2xtNFpzdHdEa3hqQjRlcW9C?=
 =?utf-8?B?YjlObTNIZk4zSnJrbFY1WFZVbmlTdWVuK3V5dGw3alZJTEtYTS9KdnZTTWVs?=
 =?utf-8?B?Q2h4S1luaE01bnQ1SVNqQWNpZzR4UWVIY1diQkI4SzBIQ3F5bUVTeGtWenVh?=
 =?utf-8?B?VUY4Y1RVWVRiQlg2dnluRTBRRHpvb0FvWU5YWHV1ZnNFK0ViTGRMS0dVM3l2?=
 =?utf-8?B?NkowbHplMElHOSs1S05RNEhXTEtVd0FKWXkrZ3k3cVcyNlZjZC9EWjA0a3k1?=
 =?utf-8?B?NTBqSnFaVm9sUi8zcHlFSWY3OFV5TUU3TU9OVzJPbDlXa1BIOE1WZGI0RnRx?=
 =?utf-8?B?MENYd2FKbzl3dGFwK1gwdHdEcVdhV1BLZjd4Z3NXcFRQT2lYd3REQnhMby9W?=
 =?utf-8?B?N2l2VGJBMURJS29BODI5Wk5uV2ZsVy9OK2dxSjdFS0lVcXlmaXc4V3VxcDU0?=
 =?utf-8?B?NUZKbGZpNjlMeG9nbUszelZvVFkyR1BvZFhGbXZUMmVOcVVGeUh2WlA2Z3dQ?=
 =?utf-8?B?cHQ5ZTZydzNwMlBiRlBjcDMzSndmc0NLNWMzUlo3TjRiZWRFUm8wdzVFZnAr?=
 =?utf-8?B?MTcybXJjUVBzb1NoYTNJNDFYbzhYbXRBODBBcDZEOTBGMGxpaDV2dHljR2RZ?=
 =?utf-8?B?Nzk5bzQwMlNodHEyak9IL3RaYzBycU9oOE9HeEVZdTdNVXFpZVN2K2NSeXRa?=
 =?utf-8?B?dWJLcXZWYm5lSkxwTnMrcWtEQThtaWJ1VDYxRWV5YVA4KzdnOU1UMFRlNkxK?=
 =?utf-8?B?b205NStma1RxdHB3MjNZQVVpTEgxYzFCRUlvNGdKS3JKby9vUWZBWHZlbWJj?=
 =?utf-8?B?UTRPdjlQWTNQWXQ4L2JZWXlCVThtRFMraGF1eDNveHZJN3BZZ0JkVi81eG9B?=
 =?utf-8?B?UHZMaktlMnJwcHRoVERjYnRGeEZPTktQZ1AwclltTnhESFJYWHVjQjBEV2Fy?=
 =?utf-8?B?VVViSVd4M05FbFJmZit1TkNnOHd2MUZkS04rQlIvcFJiK1VhSFRESkZESzY1?=
 =?utf-8?B?akZwQTdzZ2UwRmE3L3dLZFg1YXBXa0trQWhOVHBwYWJNUEF2V2phRG5RMjNU?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a004502d-64bd-46d9-cf82-08de161a1a3f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:04:10.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3ebm+Wh7eREsqn+Sg93i4ZFIUiQJ8QEq9wfPQA0GxDH+zMRRQLowYpPngDl/yWbctCphOUvjldujDrC0nL2uuqjjZ0oal2rZrcFmtH26+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7970
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


On 10/28/2025 16:12, Kamil Konieczny wrote:
> Sync with drm-next kernel commit c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
> Link: https://lore.kernel.org/r/20251016-xe3p-v3-11-3dd173a3097a@intel.com
>
> This adds NovaLake-S PCI ids, and with it there are two more PCI
> ids commits, one for splitting BMG-G21 out of BMG for workarounds
> and the other adds a kernel macro.
>
> 78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
> Link: https://lore.kernel.org/r/20251013200944.2499947-40-matthew.d.roper@intel.com
>
> edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
> Link: https://lore.kernel.org/r/20250808-intel-pci-device-v1-1-ce3545d86502@intel.com
>
> v2: squashed into one commit (Lucas)
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/pciids.h | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 76f8d26f9..9f095a99d 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -26,6 +26,11 @@
>   #define __PCIIDS_H__
>   
>   #ifdef __KERNEL__
> +#define INTEL_PCI_DEVICE(_id, _info) { \
> +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
> +	.driver_data = (kernel_ulong_t)(_info), \
> +}
> +
>   #define INTEL_VGA_DEVICE(_id, _info) { \
>   	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
>   	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
> @@ -844,7 +849,7 @@
>   	MACRO__(0x64B0, ## __VA_ARGS__)
>   
>   /* BMG */
> -#define INTEL_BMG_IDS(MACRO__, ...) \
> +#define INTEL_BMG_G21_IDS(MACRO__, ...) \
>   	MACRO__(0xE202, ## __VA_ARGS__), \
>   	MACRO__(0xE209, ## __VA_ARGS__), \
>   	MACRO__(0xE20B, ## __VA_ARGS__), \
> @@ -853,7 +858,10 @@
>   	MACRO__(0xE210, ## __VA_ARGS__), \
>   	MACRO__(0xE211, ## __VA_ARGS__), \
>   	MACRO__(0xE212, ## __VA_ARGS__), \
> -	MACRO__(0xE216, ## __VA_ARGS__), \
> +	MACRO__(0xE216, ## __VA_ARGS__)
> +
> +#define INTEL_BMG_IDS(MACRO__, ...) \

Um, I'm not sure. I think what Lucas meant was to ask why separate out 
BMG_IDS and BMG_G21_IDS. Regarding NVL-S, I think they can be in a 
different commit. Comments, Lucas?

-shekhar

> +	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
>   	MACRO__(0xE220, ## __VA_ARGS__), \
>   	MACRO__(0xE221, ## __VA_ARGS__), \
>   	MACRO__(0xE222, ## __VA_ARGS__), \
> @@ -876,4 +884,13 @@
>   	MACRO__(0xFD80, ## __VA_ARGS__), \
>   	MACRO__(0xFD81, ## __VA_ARGS__)
>   
> +/* NVL-S */
> +#define INTEL_NVLS_IDS(MACRO__, ...) \
> +	MACRO__(0xD740, ## __VA_ARGS__), \
> +	MACRO__(0xD741, ## __VA_ARGS__), \
> +	MACRO__(0xD742, ## __VA_ARGS__), \
> +	MACRO__(0xD743, ## __VA_ARGS__), \
> +	MACRO__(0xD744, ## __VA_ARGS__), \
> +	MACRO__(0xD745, ## __VA_ARGS__)
> +
>   #endif /* __PCIIDS_H__ */
