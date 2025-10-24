Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC39CCD1A5
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 07:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C1210E9F3;
	Fri, 24 Oct 2025 07:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXLrxx5E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC38910E9F3
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 07:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761292434; x=1792828434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UygSQKFcFPqZt3k7PiREyEXa6ofcAmvFqxGhdZw3s2U=;
 b=NXLrxx5EeMIITV1kjLwK8WUiz/3oAn1Lh0/5cLj44WYy80oLzHG8vet9
 IXLFNRiTH1DfqMcVmgjohLcMsQxp2eRNyEtBbbClaHZBvcnhkBbv9niQG
 gKo6LQxoX8qDur734IkIWq1IrcCC1oq2zHETfxWmzlZddwHIN3qg9XO8e
 f2RS07arlOSbirxMccxxE1E4XdbWqkRoRVnG1YWJOEEIBlgVGK79W+MCn
 rE+WhPgyM3Ck4oKZ7CZDMqP0zeJ8by4S6wFd2WxWFKeThHWBzxP3TH9UL
 CFFIoS+qjvb5hRiXu5yKflQzaYFVKG0VwkinnewBxuKZgaowXP136uypV A==;
X-CSE-ConnectionGUID: QdsJkDThQrKrBA0/9pZvSQ==
X-CSE-MsgGUID: oTNnOwqWSAGmDbi3eZojXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51049461"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="51049461"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 00:53:54 -0700
X-CSE-ConnectionGUID: N20BsSIbT6iwviDfnzOKBQ==
X-CSE-MsgGUID: NZYC0b+VQ7CcwKSmZF+1Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184084620"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 00:53:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:53:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 00:53:53 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:53:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhUhjvI78s6tuhnu2g1/DFT1EB5yqvTuMbuunkUwdKn954P7MLPt28DDVapcdH0Vj2qzJku4SdCv3RLaHjq/2RdzEIYzMJcII5ZWbw3FBkjUf0H8BHYVf8m+hUQW5XXR0ZZSSo8VjLiu6fzWKMEtWIbb4DUhtr+leDh1Ltad3J9KrRtI94Atsrig8YDAL8BY/yJGtvaHkJS8F4aJ0+bkrG4w5maHmBGNkjTGH0z+9zWUiRmloF/M4u6UJrk37timr2O4JJZfPRmSYPC0HK30jtDiJA1wM0cWm1bS5+RwxeCIX/xS6EGSkxLKRM1tgBpcMHyheop92iR+ERabSbz+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UygSQKFcFPqZt3k7PiREyEXa6ofcAmvFqxGhdZw3s2U=;
 b=Nzt/Ci6oQfC4ClCiGVrllAhEhyx0celqs4Yk2VOzxgUwmSQbgZAOuRyrGCud2pp+n+zXJrGmUIA5O65CpIgS/l5Ioakj6Y9tnXmamX01s7dSen2lzPLbi1sC/pNqsgznnurXODi4+VN7iROrmxMrJ5bldN/XmgKZEWftIbdHStwLtu3No7gsqmhtBkgkUo8pzt2ZPvcL23iSSdB0FWxfzNDHVur0h+m7u22Y4SW9pDaXy/lg9ZtPJCqvSvH7BM9cb88Cejh92iBSA5XIu7UUI6A3YClV5zWQOjZKbIcWbj3PDR6yMYYn1wX0J617jxsD6KPV3rwjlEzXhSc2nwi5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH8PR11MB8014.namprd11.prod.outlook.com (2603:10b6:510:23a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 07:53:51 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 07:53:51 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH v5 i-g-t 5/5] benchmarks/intel_latency: Add
 xe_bo_create_destroy test
Thread-Topic: [PATCH v5 i-g-t 5/5] benchmarks/intel_latency: Add
 xe_bo_create_destroy test
Thread-Index: AQHcRJbHbHo0wIWI4U+rp8bRbDuW2LTQ7NAg
Date: Fri, 24 Oct 2025 07:53:51 +0000
Message-ID: <CH3PR11MB8434BC353A7A5059C8B915B18DF1A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
 <20251024033118.15674-7-gajendra.uttamchand@intel.com>
 <20251024033118.15674-12-gajendra.uttamchand@intel.com>
In-Reply-To: <20251024033118.15674-12-gajendra.uttamchand@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH8PR11MB8014:EE_
x-ms-office365-filtering-correlation-id: 1274395f-c04b-4962-b1cd-08de12d278ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dHFYNnpITFh2NEg3SWVTMnlGOTY3NGx0Q3daaDlkYUNNVGRDS0hQRmNXUXlS?=
 =?utf-8?B?UjVld1lOZ2VBV3lPOExHR3ZrMkh1ajUyTnVlRkJ3WDBLRGFWcjIvK0lDaThj?=
 =?utf-8?B?bjZ6T0FsOWRsenIxVEJ2SDhPa25oaGkxRXVlUDFpcVdpWnVrVHU2OXJwVDRt?=
 =?utf-8?B?QjlGTmFSUDhuU2xEWjVCendtNzNUV1VCVE0zcVdlUTVTT0ExY3F2b0tyWFUx?=
 =?utf-8?B?UFFWaGszVXRBbE1LZzdDWmM0aWdUTnlIQk9nYXVCTCtwbjFJQ3RzREFvM1Iy?=
 =?utf-8?B?Y1VsQW11Q01SWGIyc3FjdjlSWHNuWGY5OTljZ2IrZXNyZmFTOXhDOWpBQi9V?=
 =?utf-8?B?NGc2YlZCK1h0ckZxa2orMVBQMy9sbE1JNkVLNnFMN3QyN3VqMzhjdTB4em0v?=
 =?utf-8?B?NlF6NlRUUnRxbFEzTzlxS1paUnJsdWZ3UndETnlwUG9yUUdRL1ltd3FFNUJp?=
 =?utf-8?B?aXJYRGJhRi9JM29ZRkxicFh1Nk1yRjVtZlY4cWswSCtIMkZhNWt5UDZtQXA3?=
 =?utf-8?B?MCtOdEhPcG9QZGIzaGIySFpjMzBEWTVwcXZSa3crTzJhZmFmQTUrbnFQeElG?=
 =?utf-8?B?ZXBkZ0FaRmxxSUpPcUN1NE9taW5abmhTTGhjOWJ2S3pkQWlaTFhYTmNuRlNy?=
 =?utf-8?B?YXpZU1BGbjhhSXhzSWh6VW5jSWJRVnlrQnZDcEM0ZUo0NkRnVFBjSDFaaTNL?=
 =?utf-8?B?ZzNzbitZdVhldExpWk95ZDdiK2k1NHJVSEZUVGFER3YxQVZ1cWVXekgxdDFX?=
 =?utf-8?B?eS9PeTF4YVo3ZmNRcHFvekhSbm1ZeEQwdUp3bVFVMy93NTdvR29NUUxTWmpK?=
 =?utf-8?B?aHVKUmlrUzk3UEg0Q1ArS3dUWFFqOFc5Q2ZrMzA0TEhxQjJVekl4VzB3Y3Uw?=
 =?utf-8?B?YkNmcE1oUktjditFcDdPYXBodC9HaFg2cDRtb1M0V3lieEJKS21QTlBXcTlq?=
 =?utf-8?B?bEs3VXgzVWxBTjBoM2tha01FWm5rQlYyVGsxNmx0KzkxblV4dUFLVmM2d3VP?=
 =?utf-8?B?SmY3OEJSVW51NVpBb2hOTk9DOUtDZ0xPS2I0ZEJNMUZnUkxoK3ZVUEtXQ3l5?=
 =?utf-8?B?QWhZRzVCYlMvSzRKZFdPNXRSNFhoVEsxbGU3VGEzS1NweHZYTjNlOTBVVitB?=
 =?utf-8?B?UFRlQ2o2Y2J4bGNLWlNlQWt6T3NXclVYYXk2UmphM0tUekR1RklLL3FkVFdk?=
 =?utf-8?B?WlRQbTYxL2dqaGkxdnJpRlZ3MzZVbTgzTncxMWhzWE5GeUljYjNvdU1tOWVt?=
 =?utf-8?B?bWVEQVVmeHNnMnhkZzdaYmhwdHlleVpHYm1PUTVGeC9wWHBEOEh3UDd5N0Zx?=
 =?utf-8?B?c2NNWnZKZXFoT2RHUit6dmg3U1Bqc25peGFNQU1UbEp0TDVKdnRoZXVQNGJX?=
 =?utf-8?B?Ulo3NDBVOU1ENW43Qll6bThYK2FTTjl2RjVQL0NyTEYwMHN4NDhaN0pScnNY?=
 =?utf-8?B?TWxvK1ovS2gvMDB4N2hzbTJDenZ2VlZBb0hWKy9mb3poQklXcUp2MHoyRVhV?=
 =?utf-8?B?d1U2ZHBFaFVSZDhSMC9SZ2NrbWlPVTRsSkNFSXJxWkg5ODBISG1UQ0pMVDRN?=
 =?utf-8?B?SlpkaENyaEthOTFOQksxQkRrRFhqS3U0NktnbWVEVVh3ODlyOTlZT09DQS95?=
 =?utf-8?B?b0ZRNWFKWStnY1pEQ0pCemlEZ0sxT2tuRDJrYzhoNXpTbFVUQmFNcks0aExC?=
 =?utf-8?B?VTVlV2szUnp5aTFKMnRtQi9tRE94U2RWVFg5V0xvSWwzZmxpZi94S2FpTmJr?=
 =?utf-8?B?ZTBWcUJxUHBQaGk2RzdkYTJYMk50eW9kcitpZjMrVkpXazQxUnlTOWtBQzhB?=
 =?utf-8?B?SkVYb1g3N2s3L3hCOG5zaFhaZkNSUkRkOFcrdWJiT0drTXdUSHpIR25KUHEx?=
 =?utf-8?B?SUlmcHJmM2hmd2pGR0N6RU5RaDBaNG5QVzdqc2Urd3FnNUlSclhYc2tzL0dQ?=
 =?utf-8?B?c0k4UHUvZkp1NzRRVFExd0hjT1JtZDAzL08zWHh3T2YvYnF0WGwxMGU3akpL?=
 =?utf-8?B?ZDN3TW8zMmNxRTNOY2xaZVMzeDJpcklkRFB6Z21uek1HUXhyM3UrR20wM2d2?=
 =?utf-8?Q?uWq8+x?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0gzNEVsTFZTWUN6WTBudnMvQ2FvOTRzY1VhN1NsVTRLT3NCN0Q4akh2LzNv?=
 =?utf-8?B?L3BmNVVTWk50T0hoUlJabWI4UXA5RUhVWVhzREJqZEZNeVR5Ri9rWFljUzZu?=
 =?utf-8?B?QjFRYkcyLy9NcytUdGtGNWVXaTcyQmIwanh2dFlBbTQ3QW9KUkM3VTNtaWZ6?=
 =?utf-8?B?Y1EwL2hzSndrbEFQNlY3OWNxblFUV0tMOHAralFVMTRYNlFmWUZjMFp2NTFU?=
 =?utf-8?B?bEt5VlcvenBpNGI3WmZQT2VlSmJWTms5RUx6bWc5ekZWZExvQWt2eUlHV3hx?=
 =?utf-8?B?eDZCTi9iRktxU2VUU1grVStwMFhuL0hMamZKL3hDbGtVOHhPaElFZUxKVWRl?=
 =?utf-8?B?SjliQ29Qd3FGa3pLc1NkQWEyMlVsOTFidldYQWo0b3IyWENxYmwvUVFoOWc5?=
 =?utf-8?B?bHRCL3dwc1ByUGNFT3FQcHI5c3l0WFR5U1ViTk45MlhJdnVYU1FCNytiYmt3?=
 =?utf-8?B?SVkwTVNyNFhONEJtSTYrRktubXErdmVpOEhoRGN5bkdOR0R3T0dMWm0va2Nn?=
 =?utf-8?B?UEsrVTFUWU1nbXRnKzl2d3luaWJjTlNCZWdEYXNhRm8vV3BzSVNMWFpTbmx1?=
 =?utf-8?B?RWlCOGJ0NlBxRkQ2S1JlMHlYZzV5TnBUZXhLUVg1YjZtU0RQU2Q5NGlXV1d0?=
 =?utf-8?B?MzZQRnhTQUpUS3BvYjU0MVJGeVJLMWFZWHh1Nng2MXpwVjk4aFBWYit2eW9v?=
 =?utf-8?B?eGhYRzR1clBmQndVN0RDQy9QUjQzTkcrbUVlc3NGMU1kaitEcFBoN2h5dzVu?=
 =?utf-8?B?cWlwaGRaRWh3WkluazRiQnRqaFNWUUQybmx5NDMzbFptUEZXb2syNnBVOTZp?=
 =?utf-8?B?djJ6NlZJcGErSDBuZHhGZmNXQllIamtVTWxjNldJNWI4alZMU3hPcGhYdmc3?=
 =?utf-8?B?MEFjVFNOWklZUnc0bFFHbm1USnJndkdoU1BBbUNqMWtoVloxNzZOVEZuUGlz?=
 =?utf-8?B?N3BDVGM1UktSdEp3Q2xXWEVCSUl0NXRTZHVLU1FGQVpQWW9WcENTVHczSTRX?=
 =?utf-8?B?eTJmQ1VPT3E4WmZqOVVkU0t5Q3JSNkhidDFqa1lxN2hucWtkcXBpOVEzVnMz?=
 =?utf-8?B?cUdDYTBITVlDcVFwbVduRVhqVTI1TVE5cHdPMmx3cUV4Mi91UmVuMGV3N1FE?=
 =?utf-8?B?cTZSbGVFNGVucVYyV3VLR01MZnhteEU0VlduQXJicmZHUGlEeHM2ZXFBWHV6?=
 =?utf-8?B?NHJRWVczZ2w5a2FNQWFGOGxFVEkxS3NnNUdpeFNWRjJSOXlEQ0dOMWU1R2kw?=
 =?utf-8?B?Njd2K3RNUzdwRzl4U0c1TWx2WWExTVNPNjcrMGljTmp0TFhnUmdweDFSb0RO?=
 =?utf-8?B?b1ZKYTMyT1JDQm00T2R3MVBNY25uTUtHUXlFekVLSk9IVHlLUDc3S3BYVXpG?=
 =?utf-8?B?ckRwMzB6UWZ6SnI1Q3QzTzBMWmk2WEVIVnlHL3dvVGJySkxHaytPYjdyZ2RG?=
 =?utf-8?B?VXFWaFpMQWJHRjFCNkkzWFN2b1YwcFVoSSs1WTNKMXBtSFIweTRubVh0Q1dD?=
 =?utf-8?B?U2VTRFhma1RKL2ZsNEg0dkJ1bzZ6TFcwaDdPL0gzbm5kZ2J5bVJZUm9TMTI0?=
 =?utf-8?B?azRKYlRPemFjZ2NMVXZwejg3aHExdTc3U08vSnB5ZWhBbUdFVkJCNGdaNnlT?=
 =?utf-8?B?UCtWZWx3NjF6VW5pR0lITzZjOWRlWDdXTzNuNmtzdFRzY25tcEpjZ0puU2ZR?=
 =?utf-8?B?S2NmQnQxQ01lb2ZqMDMyTlJVSytQQVpLVlVZdDNiWWo4aXNsWlV3MU13di9W?=
 =?utf-8?B?NzJ3ZVpDR3dLM3VXWStDcnN3bVdXMFZjcEc5TEZJclJ2SVBaSWV0azNLRnpL?=
 =?utf-8?B?ZGt3dWZHMDhGaWNKbmlMYjJSMVBTc0UvUVlsVjhJWEVwMlhpNm5GRmp2TTJ3?=
 =?utf-8?B?d0xvNDVWaFlnRWZpTU9mMytPTDBwMkdJVWEzWW5TbEFpY2lwV1dRbnVWS0hL?=
 =?utf-8?B?OXZTcFp6aXg4YVpxZ1lTOFpvd2MzQi9XMHdEdURkM1QrZ083bVhuV0FpVlRq?=
 =?utf-8?B?U09tbU93MkRwOW8zWkZMbXFHQUIzWGVtT3p4Q0RTdVhiL3dXSWFpV1Q3YXlh?=
 =?utf-8?B?QUdVQ3BhMjdoSUFuZTBiYkRDK0lleGl6R3Z6NW9wTVc3RTBOM1dvRS9MTUZP?=
 =?utf-8?B?b3MydndhSS9NdzRFQ3N3anI3MHAvOFAwdWtHVzVoUU5uaEk5ZjY0b0VHSmJZ?=
 =?utf-8?B?amc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1274395f-c04b-4962-b1cd-08de12d278ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 07:53:51.5613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTZZ/ysOCcq4NofvhE1l8UhmNjwIs7phT6cerMEsUYUph9RdE7LeBRELFTyVAd53JWFwAg952WB1BX7BP8vMxPg3eK3vs6hr7ssdA750ggM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8014
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXR0YW1jaGFuZCwgR2Fq
ZW5kcmEgPGdhamVuZHJhLnV0dGFtY2hhbmRAaW50ZWwuY29tPg0KPiBTZW50OiAyNCBPY3RvYmVy
IDIwMjUgMDk6MDEgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPjsgRGFuZGFtdWRp
LCBQcml5YW5rYQ0KPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IFV0dGFtY2hhbmQs
IEdhamVuZHJhDQo+IDxnYWplbmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIHY1IGktZy10IDUvNV0gYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5OiBBZGQNCj4geGVf
Ym9fY3JlYXRlX2Rlc3Ryb3kgdGVzdA0KPiANCj4gQWRkIGJ1ZmZlciBvYmplY3QgbGlmZWN5Y2xl
IGxhdGVuY3kgdGVzdCBmb3IgdGhlIFhFIGRyaXZlci4NCj4gTWVhc3VyZXMgYWxsb2NhdGlvbiBh
bmQgZGVhbGxvY2F0aW9uIHRpbWluZyBmb3IgYnVmZmVyIG9iamVjdHMgYWNyb3NzDQo+IGRpZmZl
cmVudCBzaXplcyBhbmQgdXNhZ2UgcGF0dGVybnMuDQo+IA0KPiBEZWZhdWx0czogYnVmZmVyIHNp
emVzIGZyb20gNEtCIHRvIDhNQiwgMTMgcmVwZXRpdGlvbnMsIDEwMDAgaXRlcmF0aW9ucyBwZXIN
Cj4gcmVwZXRpdGlvbiwgMiBzZWNvbmRzIHBlciBzYW1wbGUsIHNpbmdsZSBDUFUuDQo+IFBhcmFs
bGVsaXNtIGlzIGNvbmZpZ3VyYWJsZSB2aWEgY29tbWFuZC1saW5lIG9wdGlvbnMuDQo+IA0KPiBJ
bXBvcnRhbnQgZm9yIGFwcGxpY2F0aW9ucyB3aXRoIGR5bmFtaWMgYnVmZmVyIG1hbmFnZW1lbnQg
YW5kIGhlbHBzDQo+IGlkZW50aWZ5IG1lbW9yeSBhbGxvY2F0aW9uIGJvdHRsZW5lY2tzIGluIGdy
YXBoaWNzIHdvcmtsb2Fkcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEdhamVuZHJhIFV0dGFtY2hh
bmQgPGdhamVuZHJhLnV0dGFtY2hhbmRAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGJlbmNobWFya3Mv
aW50ZWxfbGF0ZW5jeS9tZXNvbi5idWlsZCAgICAgICAgICB8ICAgMSArDQo+ICAuLi4vaW50ZWxf
bGF0ZW5jeS94ZV9ib19jcmVhdGVfZGVzdHJveS5jICAgICAgfCAxMjUgKysrKysrKysrKysrKysr
KysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyNiBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX2JvX2NyZWF0ZV9kZXN0cm95LmMN
Cj4gDQo+IGRpZmYgLS1naXQgYS9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kvbWVzb24uYnVpbGQN
Cj4gYi9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kvbWVzb24uYnVpbGQNCj4gaW5kZXggZmQ1MjIy
YTRhLi5lYzZmZDEzNTcgMTAwNjQ0DQo+IC0tLSBhL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS9t
ZXNvbi5idWlsZA0KPiArKysgYi9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kvbWVzb24uYnVpbGQN
Cj4gQEAgLTUsNiArNSw3IEBAIHhlX2xhdGVuY3lfcHJvZ3MgPSBbDQo+ICAJJ3hlX2V4ZWNxdWV1
ZScsDQo+ICAJJ3hlX3ZtX2JpbmQnLA0KPiAgCSd4ZV92bV9jcmVhdGVfZGVzdHJveScsDQo+ICsJ
J3hlX2JvX2NyZWF0ZV9kZXN0cm95JywNCj4gIF0NCj4gDQo+ICBsYXRlbmN5ZGlyID0gam9pbl9w
YXRocyhsaWJleGVjZGlyLCAnYmVuY2htYXJrcycsICdpbnRlbF9sYXRlbmN5JykgZGlmZiAtLWdp
dA0KPiBhL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS94ZV9ib19jcmVhdGVfZGVzdHJveS5jDQo+
IGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L3hlX2JvX2NyZWF0ZV9kZXN0cm95LmMNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwLi5kYzdkN2ExMGQNCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9iZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVfYm9fY3JlYXRlX2Rl
c3Ryb3kuYw0KPiBAQCAtMCwwICsxLDEyNSBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9u
DQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgImlndC5oIg0KPiArI2luY2x1ZGUgImlndF9zeW5j
b2JqLmgiDQo+ICsjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9x
dWVyeS5oIg0KPiArDQo+ICsjZGVmaW5lIE9CSkVDVF9TSVpFICgxIDw8IDIzKQ0KPiArDQo+ICtz
dGF0aWMgZG91YmxlDQo+ICtlbGFwc2VkKGNvbnN0IHN0cnVjdCB0aW1lc3BlYyAqc3RhcnQsIGNv
bnN0IHN0cnVjdCB0aW1lc3BlYyAqZW5kKSB7DQo+ICsJcmV0dXJuIChlbmQtPnR2X3NlYyAtIHN0
YXJ0LT50dl9zZWMpICsgMWUtOSAqIChlbmQtPnR2X25zZWMgLQ0KPiArc3RhcnQtPnR2X25zZWMp
OyB9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHRlc3RfYm9fY3JlYXRlKGludCBmZCwgdWludDMyX3Qg
dm0sIGludCBzaXplKSB7DQo+ICsJdWludDMyX3QgYm87DQo+ICsJdWludDY0X3QgYm9fc2l6ZSA9
IHhlX2JiX3NpemUoZmQsIHNpemUpOw0KPiArDQo+ICsJYm8gPSB4ZV9ib19jcmVhdGUoZmQsIDAs
IGJvX3NpemUsIHZyYW1faWZfcG9zc2libGUoZmQsIDApLA0KPiArDQo+IERSTV9YRV9HRU1fQ1JF
QVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNKTsNCj4gKwlnZW1fY2xvc2UoZmQsIGJvKTsNCj4g
K30NCj4gKw0KPiAraW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQ0KPiArew0KPiArCWlu
dCBmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiArCWludCBzaXplID0gMDsNCj4g
KwlpbnQgYnVzeSA9IDA7DQpXaGF0IGlzIHRoZSBuZWVkIG9mIGJ1c3kgaW4gdGhpcyBjYXNlPw0K
PiArCWludCByZXBzID0gMTM7DQo+ICsJaW50IG5jcHVzID0gMTsNCj4gKwlpbnQgYywgbiwgczsN
Cj4gKwl1aW50MzJfdCB2bTsNCj4gKw0KPiArCXdoaWxlICgoYyA9IGdldG9wdChhcmdjLCBhcmd2
LCAiczpyOmYiKSkgIT0gLTEpIHsNCj4gKwkJc3dpdGNoIChjKSB7DQo+ICsJCWNhc2UgJ3MnOg0K
PiArCQkJc2l6ZSA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2Ug
J3InOg0KPiArCQkJcmVwcyA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWlmIChyZXBzIDwgMSkNCj4g
KwkJCQlyZXBzID0gMTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ2YnOg0KPiArCQkJ
bmNwdXMgPSBzeXNjb25mKF9TQ19OUFJPQ0VTU09SU19PTkxOKTsNCj4gKwkJCWJyZWFrOw0KPiAr
DQo+ICsJCWRlZmF1bHQ6DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KPiArCWlm
IChzaXplID09IDApIHsNCj4gKwkJZm9yIChzID0gNDA5NjsgcyA8PSAgT0JKRUNUX1NJWkU7IHMg
PDw9IDEpIHsNCj4gKwkJCWlndF9zdGF0c190IHN0YXRzOw0KPiArDQo+ICsJCQlpZ3Rfc3RhdHNf
aW5pdF93aXRoX3NpemUoJnN0YXRzLCByZXBzKTsNCj4gKw0KPiArCQkJZm9yIChuID0gMDsgbiA8
IHJlcHM7IG4rKykgew0KPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiArCQkJ
CXVpbnQ2NF90IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCXZtID0geGVfdm1fY3JlYXRlKGZkLCAw
LCAwKTsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAmc3RhcnQp
Ow0KPiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0gMDsgYyA8IDEwMDA7IGMrKykNCj4gKwkJ
CQkJCXRlc3RfYm9fY3JlYXRlKGZkLCB2bSwgcyk7DQo+ICsNCj4gKwkJCQkJY291bnQgKz0gYzsN
Cj4gKwkJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsDQo+ICZlbmQpOw0KPiArCQkJ
CX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9zZWMgPCAyKTsNCj4gKw0KPiArCQkJCXhl
X3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gKwkJCQlpZ3Rfc3RhdHNfcHVzaF9mbG9hdCgmc3RhdHMs
IGNvdW50IC8NCj4gZWxhcHNlZCgmc3RhcnQsICZlbmQpKTsNCj4gKwkJCX0NCj4gKwkJCXByaW50
ZigiJWZcbiIsIGlndF9zdGF0c19nZXRfdHJpbWVhbigmc3RhdHMpKTsNCj4gKwkJCWlndF9zdGF0
c19maW5pKCZzdGF0cyk7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQlkb3VibGUgKnNoYXJl
ZDsNCj4gKw0KPiArCQlzaGFyZWQgPSBtbWFwKDAsIDQwOTYsIFBST1RfV1JJVEUsIE1BUF9TSEFS
RUQgfA0KPiBNQVBfQU5PTiwgLTEsIDApOw0KPiArDQo+ICsJCXZtID0geGVfdm1fY3JlYXRlKGZk
LCAwLCAwKTsNCldoeSBpcyBpdCB0aGF0IHZtIGlzIGdldHRpbmcgY3JlYXRlZCBvbmx5IG9uY2Ug
aGVyZSB3aGVyZSBhcyBpbiBpZiBjYXNlIGl0cyBjcmVhdGVkIGZvciBldmVyeSByZXBldGl0aW9u
Pw0KPiArDQo+ICsJCWZvciAobiA9IDA7IG4gPCByZXBzOyBuKyspIHsNCj4gKwkJCW1lbXNldChz
aGFyZWQsIDAsIDQwOTYpOw0KPiArDQo+ICsJCQlpZ3RfZm9yayhjaGlsZCwgbmNwdXMpIHsNCj4g
KwkJCQlzdHJ1Y3QgdGltZXNwZWMgc3RhcnQsIGVuZDsNCj4gKwkJCQl1aW50NjRfdCBjb3VudCA9
IDA7DQo+ICsNCj4gKwkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywgJnN0YXJ0KTsN
Cj4gKwkJCQlkbyB7DQo+ICsJCQkJCWZvciAoYyA9IDA7IGMgPCAxMDAwOyBjKyspDQo+ICsJCQkJ
CQl0ZXN0X2JvX2NyZWF0ZShmZCwgYnVzeSwgc2l6ZSk7DQpXaHkgaXMgdGhhdCBidXN5IHVzZWQg
aW4gdGhpcyBjYXNlPw0KPiArDQo+ICsJCQkJCWNvdW50ICs9IGM7DQo+ICsJCQkJCWNsb2NrX2dl
dHRpbWUoQ0xPQ0tfTU9OT1RPTklDLA0KPiAmZW5kKTsNCj4gKwkJCQl9IHdoaWxlIChlbmQudHZf
c2VjIC0gc3RhcnQudHZfc2VjIDwgMik7DQo+ICsNCj4gKwkJCQlzaGFyZWRbY2hpbGRdID0gY291
bnQgLyBlbGFwc2VkKCZzdGFydCwNCj4gJmVuZCk7DQo+ICsJCQl9DQo+ICsJCQlpZ3Rfd2FpdGNo
aWxkcmVuKCk7DQo+ICsNCj4gKwkJCWZvciAoaW50IGNoaWxkID0gMDsgY2hpbGQgPCBuY3B1czsg
Y2hpbGQrKykNCj4gKwkJCQlzaGFyZWRbbmNwdXNdICs9IHNoYXJlZFtjaGlsZF07DQo+ICsNCj4g
KwkJCXByaW50ZigiJTcuM2ZcbiIsIHNoYXJlZFtuY3B1c10pOw0KPiArCQl9DQo+ICsJCXhlX3Zt
X2Rlc3Ryb3koZmQsIHZtKTsNCj4gKwkJbXVubWFwKHNoYXJlZCwgNDA5Nik7DQo+ICsJfQ0KPiAr
DQo+ICsJY2xvc2UoZmQpOw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiAtLQ0KPiAyLjQzLjANCg0K
