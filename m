Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E081C27C44
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 06:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B127710E0DA;
	Fri, 31 May 2024 06:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+QrojpZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEB211B8D0
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 06:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717138459; x=1748674459;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=YwBiRnofNAmp9gVaaLZAPyINSy/ILo3hWGeDWYW/Hqw=;
 b=k+QrojpZOiRjDSlAswWjrnAzKM5/lRk9NyXp/aqevooTWvM+3JtIk5Wz
 PrivB/Blk79XkI0l1gR09EnS2wwY7CvKMqR91xuCgcyZc+VZeaFRtczHu
 y86GYj8OE9lyWwwUW/wyaYDQMdcNdDLwlVJmXuRrFumOfBIyR7KSuGKsE
 1Qq3GJfAnRflsavwTaY6MMso8kKSlfB0RhdD5fXHPexGp8Wn5E7PEZCpX
 J5187zSUiG4l8RZpfWXn76ceuVNuSHSXM6WE3j+yAQK1Gmno5RjH5XJFl
 1c4PazHPDMJ3MvrBwOj801bSeHDTlq5boLzt59lZtSKnnpRXK9qRhVW5M w==;
X-CSE-ConnectionGUID: lLZP0DG/TEuugeJS0umKRw==
X-CSE-MsgGUID: EhjzUH6VTP6lpskFywwpVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13507453"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13507453"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:54:18 -0700
X-CSE-ConnectionGUID: /JnG4F9FRICLUxXeAzoHZw==
X-CSE-MsgGUID: STbrnavURQKUMhmg6c99fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="73549852"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 23:54:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 23:54:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 23:54:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 23:54:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 23:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbMuE5bvHFhrfVZZBXri7otJkohpJrgaAuOVjy7rfaHYiQ3wV1z790fWvZl0w6+A94JqElCp81t9/XGz64PPiMMUMZe1DRihkKlmsI8NTf8IpKWLajt5wLjGJ5zamZJDe2VrLgyd+y7rygZloIZkJdQZQHxKpHaravAIyDRY1Qf3mD6TVr/YCr/nojKzOUlpI3GMVNRxNyvckF4SURuRNt6bSzUQZmtRtWRzHj3C9Ebkxrl26aqzH1LLNR9G2MgiA/7BvXDBsLKBsUTKPj+DKNrK5xFQ6/RJbJTOYNVCZhue1sQ5XOPLLATKO1gBR/df/4YlJipEy6KmcaMJ1/mVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwBiRnofNAmp9gVaaLZAPyINSy/ILo3hWGeDWYW/Hqw=;
 b=IUuYRLg39mLK+S5wCrbo3AtKSC5e3shhmo3owDRVpE/65Sd3aRPKsr0XcAJRPKBo2GOHq+Z73OKxh9CTKvStsnyByLzo/32MqamD67r0MoBNmlNzxXQ4tvx6++0WXHozrWC+cAxVg7hL4t4I22TlSZlfCUAx/SjWmSr7YtF/dtJD2udSu8euyNa3nuJYQiABVDE0Kv6TS+40Xm/y70E5CjFxHh0YCL17fj+Z4nFJ7RaeHqbXEDhjtPp+6k9bJhSYKMu1qzBm9Gfa+KoZqUF4fBFRDucgcGfUs5xiXYJ2rZQsWLDA393HbA99PRcdtRLaXVg123i116irgDe6o3lVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB8060.namprd11.prod.outlook.com (2603:10b6:510:24f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.21; Fri, 31 May 2024 06:54:09 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 06:54:09 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: Added library functions for early
 trasport
Thread-Index: AQHaqpkSSpbh/uZ5bEWttL9B8znebLGw+XeA
Date: Fri, 31 May 2024 06:54:09 +0000
Message-ID: <d50b621397a98418b7dae45fb1552e4ec415338d.camel@intel.com>
References: <20240520094620.3713972-1-jeevan.b@intel.com>
 <20240520094620.3713972-2-jeevan.b@intel.com>
In-Reply-To: <20240520094620.3713972-2-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB8060:EE_
x-ms-office365-filtering-correlation-id: 2836c3e0-bd08-414a-445c-08dc813e78ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?S1VFc3pmdHdrQ1o4MFo2c2tuZVoyN2xrdEJlOHNCMGV6YUE5bVhONm4zYnMz?=
 =?utf-8?B?c1VUNDhzeFBZem5td3JzU2pWOVdMWG5HVjRYMnJmODJ0L1ByRzBib2pRVlc5?=
 =?utf-8?B?cTRZcVIzNHFycmZxK0RJYXdXbElVRkNJYUptNUg4S1JRQU5VZU8xb2swL2lF?=
 =?utf-8?B?UlFuejU4d2h2M1Q0alVnaVpWcGFYQ3MrS3QwTmYzc1czT0p5N24wTnplS0p1?=
 =?utf-8?B?L1VBaUMvN2Y1UzRyVTVvYmFuT2krZ3FmbWpTSFc3SnhFUGRCZGxEeE83djVV?=
 =?utf-8?B?VStMMVhGb3BLekM1TXVaOUJIYm93bHI4eTFGRU5SRTBPaTRKSTVwOFpBZlBV?=
 =?utf-8?B?RWNZV29PR01CQ2lkL3Q5RTZRV0sxdm5WMUJXaExad0lRdWcvclB3QzZIWWJ1?=
 =?utf-8?B?RlJRdUNjRnZzbFA5V3FPLzJQWElrVnBzKzJnNkR6WXdSdUpEbjFlYXNwVzdT?=
 =?utf-8?B?eXM4alZHalQ5WkJzK2NTWkpueWx0UmlsMHg4Z3pLc1lpV0J1cEpwK0g1MVov?=
 =?utf-8?B?OGJ3YmQ5TWQ2Y3ZmK0JpRm42UXkrZ0dMdjRqbGY0TEEyNVZXUmVGQ0pqTldq?=
 =?utf-8?B?aDNnR0hZUFZ3cHd5V21kd051cnFZRlp0QzhPRE40RVhlVVhNYWNYdlFzMzhG?=
 =?utf-8?B?RElqUlhzcnR5RmpxMGdYNFVobXRuOVFFRmc1WW54WG5VdFd1WXNWTHBDMTcz?=
 =?utf-8?B?cllnSVN0cnVXT3ZoYldrT2ZPTGVOOTV0ZU0rc3VDNFBka0U0cmR2SElZN1Zu?=
 =?utf-8?B?VWtXb28zVWRVbnFTZG42YTZtTElhQm1RRGpzYzBKSkxtbUJtYlZOVUltZjhZ?=
 =?utf-8?B?MU52NmZlc2hRWmxvQkp3M0pvRGN5WjZrbGlmN0V0OHgyRmVkeVRkZlNzbXdn?=
 =?utf-8?B?UjFnVjg5Kzh6SGlQTmlxMVE4NWFaNWgra1NFYXdUYWtUNytFSU42M28vZFpi?=
 =?utf-8?B?ZUNZNWxiTUxkMHBSdFU1OUZlME03ZC9LNThSNmtweEllUHJIQ2FwNW9hUEVR?=
 =?utf-8?B?VGRYejhGWFZGdm4vSFY4QzhVbFZNb0VIR0VzZHcvMHBxRkdkbHBvZGF3SzBT?=
 =?utf-8?B?OVdERS82OEZJTHR0K3lYQXkxcWEyMGlUQ21FWWlRbHMxRmJiSERpU3gwYk5F?=
 =?utf-8?B?blh1NHpueXUzSXl2V095ZnIwU2hKRDF0aGxNQ3pkSUJ0TnMvY2dKamFwV25O?=
 =?utf-8?B?SkFpeU0wV1BEbWJXclZtNFBjN3ZLZXA4WHpxR2p2U1RQYnBxaEZBYXFxaWZa?=
 =?utf-8?B?TnRSWENQTlBRc05objAvRVVVSFBjOERMOFc4cWV3NXNheWx6d1JvazVyM2RS?=
 =?utf-8?B?Y3RPZkJHcDkrRVlUWEovdnJtSnBvRmxCZU5rZiswWWNOeDNTSWxEdmxWWmVC?=
 =?utf-8?B?Qi9xWVAxR3hOakNCenVvd2g2MHFac2dPQTJGOVpHYnZFYjlURm91Zk50SWE0?=
 =?utf-8?B?Y1NMczhmQlgxdUIyREdtamZ2Q05HUHRkUWxURUxYUXhtTHdLSzlWWDdvS2cz?=
 =?utf-8?B?Unp1TFNSbUlnZ2F1TkZpbE4yT0hEK1FNemx6N0NDZ2RIUnRwMGhtQ3VjcVFO?=
 =?utf-8?B?Q2h1UmxFdnVha2tDZlZjaHlzZmtvQklUOCtkVlNjajZnUGFlYXJsd2Rib0hu?=
 =?utf-8?B?c2dJTkgyZ2dKM0g3WjFwMTBSQ3NEZDllbzBmdVNTSFdLUUNoTmF3dFV2WlhQ?=
 =?utf-8?B?RnQ5YzJKblMwa2FkWGJ2bkxLNjJlUSsvQzNGL1Q3c3lOaWFWd3NSQlBRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SW8xNTlOSHVnL2UzZGhFL2hzTWkyWWhTY2h4aStrK0l5RmYzMkhvNkk2dGhs?=
 =?utf-8?B?ZG9FYXdaQjRtaXpTZy9kYWxtNVpQTFFERlFpMGdabjRPaGtkcXNvcCsrdDk1?=
 =?utf-8?B?dVVXODZSS2c4NC9vZWQwQVhQdmIxU1hMYVQySFZLRi9SWWRyRi82LzhzT2NE?=
 =?utf-8?B?N2ozU2JYemRNUWUzZzdNOThUakp0aXl0S09ldXl4Q1V3R3BBRGNHdVhpUkJa?=
 =?utf-8?B?OGRDR0hDbDFSb3RnY1VlL3UwQ3JCUytjN2QrN1UxdFRLRmJPRThCMCtOeHEx?=
 =?utf-8?B?REpodUhnQldMWVY5TG9wUjByWXBhU0xnMG9ZNkJQVmZCZy8xTUZ4bUpKMlpW?=
 =?utf-8?B?aG1obVpKWEJIQWVsNXl4a0FSSnM0YUo2UGkreFAyRlVsNzB6OXQ5eEdQREYw?=
 =?utf-8?B?b1FORUxoTitwbjlmWmM1bUJobGtYTXdyZDVlbkJCTFVOYlBwR3RyTVZTZ25V?=
 =?utf-8?B?bDJRU2kvNzhqZDg4aDFWdmVOVENXQjVWcU8zaGdXcHBuU1p1S0FLOGI4NWdv?=
 =?utf-8?B?bzFJL0xselhseXVoTThyeVR3S3Zrcm5WdVcrOStQOU9mOWo1Q21LSVJLNGdO?=
 =?utf-8?B?WEpBa3A0dlNkSkRYV1IwVXd5bVVxeVNxQ21aQktDc3Azbjcrcy9JOElyemxF?=
 =?utf-8?B?Z2g5U21tY3ZUTmVNKzJ6MDh0YjJWSXdPWlRlYlYxK3RKWVFpUzJ3UTk1VXJu?=
 =?utf-8?B?Ri8wa0hUTDk0QTVTVkUwZ1huQ21OYzFaa2RyQnF6bjRCNTQwaHkwWTVmVzlE?=
 =?utf-8?B?SFRYMzNUYStabkY5dnVqZDlOYjdNQ1hvVlZJRk5LSU5vSVFxZEtBY0FLZGxL?=
 =?utf-8?B?aHFkWmh0VG9NZjN2UC96L1RTVzdnM09zbTBGSkdNazJVM3dDaTJwVUUxdFEx?=
 =?utf-8?B?SnVLN3FuSCt0SlovWUYvOXY3eENyVzA5MXB6YTBWU3dUdGFMVjkvb1puOCs1?=
 =?utf-8?B?T2tLODVJYXlsUE4xU1kyZ0JuKy9MYzNFYVErZ0gzd00rV2o5WU1WU1h0UVEr?=
 =?utf-8?B?MWFzQkZHZ2VyeTlCVTlidEdqcTZKVTg4MDh1bjJyWEU2Zi9oQVpIQmdiYVBH?=
 =?utf-8?B?RGhjRGlVeEtFMEhJVEk1Y0xYM25raytlSFl2bjA1YmVtaUJJVnJZWHRBK1pq?=
 =?utf-8?B?TzZ0aG91MHJ6Z3A5SzNCYWRCcmtoQWJIWEkyM3NsTkFBbFhPZEhhb0NqSWp5?=
 =?utf-8?B?WUhJd3VyN09YaURXN2Qxb2kwZEd6WTAyaGRxQjJoT0FXVllhSWpVUFBCNy9k?=
 =?utf-8?B?NmJsWmlGMWtlcVoyaGloWnpkdGNKTzlBSHA4R0ltNzIwOEUyTFBERGpLWlAv?=
 =?utf-8?B?SERsOFQ1eVFIZUtFQjNtZjdPanFrOEpCeVhmbjZZRndQRWVYell4MldnSnJr?=
 =?utf-8?B?clBhZUJyTGdqYUdrZ3V5K2NkU2ZweFArR3hqaHp1MkhUaVdtWjNKMTZuRGJ1?=
 =?utf-8?B?dUVGY3h0bW5zM0ZZdHVGZmhxMnVjUkVaYks4WjFyWXQ3a1R4ZTA2L3lySzRS?=
 =?utf-8?B?QTJoNjBxK1NzUWxXdXdRRzdZRzhlN3hONjhzYk1MVUs0WlJFQUNjSGdiSDY1?=
 =?utf-8?B?YWIzYis1ODVuQ1l5bkNWVmNISG9TdG1yK1psUS9MeUQzNXdyelJ6WnV6dDlQ?=
 =?utf-8?B?aTJPalppSytFLzBFTWpaTXpndXh6Vm9FeWsxY0pseFlCVXRNckxpbmxOY2VW?=
 =?utf-8?B?aSs2ZmVPc25oM01lWmVnM2NXazA5WC9hL1NSQWVRWjVIaGtKcHFTLzQ4dmVj?=
 =?utf-8?B?RERPQWF3dFJ1Mk1ldkUyaHB1dVZielBsZjJWZ296djUvOEM4SGVLcjRoWktY?=
 =?utf-8?B?NUR3UHlqSDZDQUhNTlR0M0pKb0JXbVhDM0ozL1YwL0ZtM252azZ0emhzcmNo?=
 =?utf-8?B?RHA1YllZWTdCWk1XazZVYU0xUFlFS3hFWDRyaUNSZXcrMjVGazZHZm9iU3Bs?=
 =?utf-8?B?c1d6MDgyNTBUb1BKT2poZHdNOGJSR25JZFVkVW1FWEJIQlB2WHhhOEpRU0ZG?=
 =?utf-8?B?L0MyZFNDa2MzMGZVVzErZmgzcU9YenlnM0VDT0lablJTb0tWT1NKdlRJU0k5?=
 =?utf-8?B?OFZYekVyYTFjOEplR2M2RlIwOTlHeXRGVVNSb0ZJdjcwTDR1MDZVVE9OY2I2?=
 =?utf-8?B?OXkzcWtPSDJXZGoycHRkYzV1L1ZuT1pLOXd4L0dNSlRMdXR6T244c0Z1a0hV?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71F618F1452D4648BC3EC7C69229C18F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2836c3e0-bd08-414a-445c-08dc813e78ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 06:54:09.3055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QT7BqLdP+a5Plop218XxeEe7PjliX4sAZdlm/Ow74vSXAZjnS2i3Oz4wGHTvrDfDdl08QBPRFnudR6wi9xYf+L8baNGs6L/Qi8zx9BE3wsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8060
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

T24gTW9uLCAyMDI0LTA1LTIwIGF0IDE1OjE2ICswNTMwLCBKZWV2YW4gQiB3cm90ZToNCj4gQWRk
ZWQgaGVscGVyIGZ1bmN0aW9ucyB0byBjaGVjayBzaW5rIHN1cHBvcnQgZm9yIGVhcmx5IHRyYW5z
cG9ydCBhbmQNCj4gY2hlY2sgZWFybHkgdHJhbnNwb3J0IGFjdGl2ZSBjaGVjay4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGxp
Yi9pZ3RfcHNyLmMgfCAxMyArKysrKysrKysrKysrDQo+IMKgbGliL2lndF9wc3IuaCB8wqAgMiAr
Kw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jDQo+IGluZGV4IDYwMDhiNzNhNi4uOGRj
NmI5Yjc4IDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X3Bzci5jDQo+ICsrKyBiL2xpYi9pZ3RfcHNy
LmMNCj4gQEAgLTUzLDYgKzUzLDE2IEBAIGJvb2wgc2VsZWN0aXZlX2ZldGNoX2NoZWNrKGludCBk
ZWJ1Z2ZzX2ZkLA0KPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiBzdHJzdHIoYnVmLCAiUFNSMiBzZWxlY3RpdmUgZmV0Y2g6IGVuYWJsZWQiKTsNCj4gwqB9
DQo+IMKgDQo+ICtib29sIHBzcjJfZWFybHlfdHJhbnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2Zk
KQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqBjaGFyIGJ1ZltQU1JfU1RBVFVTX01BWF9MRU5dOw0K
PiArDQo+ICvCoMKgwqDCoMKgwqDCoGlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRlYnVnZnNfZmQs
ICJpOTE1X2VkcF9wc3Jfc3RhdHVzIiwNCj4gYnVmLA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzaXplb2YoYnVmKSk7DQo+
ICsNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHN0cnN0cihidWYsICJQU1IyIEVhcmx5IFRyYW5z
cG9ydDogZW5hYmxlZCIpOw0KDQpDdXJyZW50IHBsYW4gaXMgdG8gaGF2ZQ0KKGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC81OTYwODQvP3Nlcmllcz0xMzQxODEmcmV2PTEp
Og0KDQpQU1IgbW9kZTogUGFuZWwgUmVwbGF5IFNlbGVjdGl2ZSBVcGRhdGUgZW5hYmxlZCAoRWFy
bHkgVHJhbnNwb3J0KQ0KDQphbmQNCg0KUFNSIG1vZGU6IFBTUjIgKEVhcmx5IFRyYW5zcG9ydCkN
Cg0KPiArfQ0KPiArDQo+IMKgc3RhUFNSIG1vZGU6IHRpYyBib29sIHBzcl9hY3RpdmVfY2hlY2so
aW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUNCj4gbW9kZSwgaWd0X291dHB1dF90ICpvdXRw
dXQpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgY2hhciBkZWJ1Z2ZzX2ZpbGVbMTI4XSA9IHsw
fTsNCj4gQEAgLTI0OSw2ICsyNTksOSBAQCBib29sIHBzcl9zaW5rX3N1cHBvcnQoaW50IGRldmlj
ZSwgaW50IGRlYnVnZnNfZmQsDQo+IGVudW0gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dA0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoc3Ryc3RyKGxpbmUs
ICJbMHgwM10iKSB8fCBzdHJzdHIobGluZSwNCj4gIlsweDA0XSIpKSk7DQo+IMKgwqDCoMKgwqDC
oMKgwqBjYXNlIFBSX01PREU6DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIHN0cnN0cihsaW5lLCAiUGFuZWwgUmVwbGF5ID0geWVzLCBQYW5lbCBSZXBsYXkNCj4gU2Vs
ZWN0aXZlIFVwZGF0ZSA9IG5vIik7DQo+ICvCoMKgwqDCoMKgwqDCoGNhc2UgRVRfTU9ERToNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBzdHJzdHIoYnVmLCAiU2luayBz
dXBwb3J0OiB5ZXMgWzB4MDRdIikgfHwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoc3Ryc3RyKGxpbmUsICJQU1IgPSB5ZXMiKSAmJg0K
PiBzdHJzdHIobGluZSwgIkVhcmx5IFRyYW5zcG9ydCA9IHllcyIpKTsNCg0KRWFybHkgdHJhbnNw
b3J0IGlzIG5vdCBvbmx5IGZvciBQU1IsIGJ1dCBQYW5lbCBSZXBsYXkgYXMgd2VsbC4NCg0KQlIs
DQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IMKgwqDCoMKgwqDCoMKgwqBjYXNlIFBSX01PREVfU0VM
X0ZFVENIOg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBzdHJzdHIo
bGluZSwgIlBhbmVsIFJlcGxheSA9IHllcywgUGFuZWwgUmVwbGF5DQo+IFNlbGVjdGl2ZSBVcGRh
dGUgPSB5ZXMiKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGRlZmF1bHQ6DQo+IGRpZmYgLS1naXQgYS9s
aWIvaWd0X3Bzci5oIGIvbGliL2lndF9wc3IuaA0KPiBpbmRleCBlODU5NWZkOGMuLjIzZjRkZDM1
YiAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9wc3IuaA0KPiArKysgYi9saWIvaWd0X3Bzci5oDQo+
IEBAIC0zNyw2ICszNyw3IEBAIGVudW0gcHNyX21vZGUgew0KPiDCoMKgwqDCoMKgwqDCoMKgUFNS
X01PREVfMl9TRUxfRkVUQ0gsDQo+IMKgwqDCoMKgwqDCoMKgwqBQUl9NT0RFLA0KPiDCoMKgwqDC
oMKgwqDCoMKgUFJfTU9ERV9TRUxfRkVUQ0gsDQo+ICvCoMKgwqDCoMKgwqDCoEVUX01PREUsDQo+
IMKgwqDCoMKgwqDCoMKgwqBQU1JfRElTQUJMRUQsDQo+IMKgfTsNCj4gwqANCj4gQEAgLTQ3LDYg
KzQ4LDcgQEAgZW51bSBmYmNfbW9kZSB7DQo+IMKgDQo+IMKgYm9vbCBwc3JfZGlzYWJsZWRfY2hl
Y2soaW50IGRlYnVnZnNfZmQpOw0KPiDCoGJvb2wgc2VsZWN0aXZlX2ZldGNoX2NoZWNrKGludCBk
ZWJ1Z2ZzX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCk7DQo+ICtib29sIHBzcjJfZWFybHlfdHJh
bnNwb3J0X2NoZWNrKGludCBkZWJ1Z2ZzX2ZkKTsNCj4gwqBib29sIHBzcl93YWl0X2VudHJ5KGlu
dCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9tb2RlIG1vZGUsIGlndF9vdXRwdXRfdA0KPiAqb3V0cHV0
KTsNCj4gwqBib29sIHBzcl93YWl0X3VwZGF0ZShpbnQgZGVidWdmc19mZCwgZW51bSBwc3JfbW9k
ZSBtb2RlLA0KPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCk7DQo+IMKgYm9vbCBwc3JfbG9uZ193YWl0
X3VwZGF0ZShpbnQgZGVidWdmc19mZCwgZW51bSBwc3JfbW9kZSBtb2RlLA0KPiBpZ3Rfb3V0cHV0
X3QgKm91dHB1dCk7DQoNCg==
