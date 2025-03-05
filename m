Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAEDC282D9
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 10:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A04D10E73A;
	Wed,  5 Mar 2025 10:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRYG0gPt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB0A10E73A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741170752; x=1772706752;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Jb7/xb3Nw/ZLEkauB0dGHJxCt36f12AduoLnYrCFNHQ=;
 b=lRYG0gPtXKcM7vRbzgZoudPCFZeVE+JUheu1c6a47JsVEIxXhKzF68dW
 puwrrtb2tmVyRv1gN9Y9+1u/zWzb9nNF14m9DJ4qjizf4IHMBrLLAN4Z0
 Y0AdkHhjKBNqksCh/WtHuJue7KGPZtFeEbRSXVbkuEV7vBbBVll8vGFpG
 XwCzUIghjuNMNJ73LAK86LpOStjtOlHpCOw4A6mCqsuY4/FOX1Kl5aF7/
 Y40HxEu5sSEEq3pQgJT2DqlV2AjflVn/Q0bFj5HsQP01YrdE0EGdybAz5
 bdOh+LyJXrC512BOzmmwRQsM/iFPfJUYu2Pxrs/1d8KXplsZPjV+eN+K5 Q==;
X-CSE-ConnectionGUID: sGl2WXx6QZq7lFEWsbJagQ==
X-CSE-MsgGUID: ULn4Y++GTjeoNkimyU72tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41378049"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="41378049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:32:32 -0800
X-CSE-ConnectionGUID: Ut+PYa3jRpScZxAkJc657A==
X-CSE-MsgGUID: 7JWZyYIFSDKXAXg584JIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="118660870"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:31:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 02:31:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 02:31:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 02:31:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZvOC4lMsMnh6cER34R7Pw3rmv0CbWcLA1g5BDy1cGNEDBTm5TtA8e0UER7u37RPM4U4dPchpRxXTkkSl4/dF+JWlouW0thbeyQsfKNluW2hGqqJIRSLrWRtmHREijrAUgu0GDTf4vbNXqMxYamGeyLWjXzMGg8cMqBqdYAnZpdknkKXoCctZ0S2IR0k28U3BWvfGGequFM4sIdNyGJP8zk6BkWskZmXFggX188AS7p8pC4Z23i29/ojBcLsVXgxn+7iERoj6xjPPMC4eTe7XUNvPCM3lDsnXkW3Zec2+4bJKXGeeUDHqgvj9UmB7aXr0jHwP8L2jdWDVuiXutYWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb7/xb3Nw/ZLEkauB0dGHJxCt36f12AduoLnYrCFNHQ=;
 b=U6Yzo8GGoD4QiGwDxilGIK/s3mHtJboEHP8siRoA8b3Rh3D+PkoTHH1hOtzqlkv+TRoDppJ5xfbr7FcrN9n2P0YD0F4SRqOpFdHvDfuQcesDZZcU1wuN69h6JGfQSna4RLRALjBUfzaOV6tj+cZ46CaiYuJsmuDpdsMwlbFpn15mn81NExTUir4hAvpNIgXy7G6rnwR1DC1cN2upyqfAJMXJNhuoxGSntpGpt37vHdSXw+WkdiatYQ5pfKFAT6O7YdDHuf+igDzg8V+x+gH+fkoV/LsjLZYJUz45yeOUwMg8E1w9T9AJEmlpNEu0foLceFTY5Xo0JRT9NY8jns8d2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 10:31:08 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:31:08 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Saarinen, Jani" <jani.saarinen@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t 0/2] FBC dirty rect tests
Thread-Topic: [PATCH i-g-t 0/2] FBC dirty rect tests
Thread-Index: AQHbjbmN6T9uyWPGzk6hK/xDnO6p6rNkV/QA
Date: Wed, 5 Mar 2025 10:31:08 +0000
Message-ID: <6a25f811b61505047a8cd5ec8f10f6427d7952a2.camel@intel.com>
References: <20250305102855.137224-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250305102855.137224-1-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CO1PR11MB4980:EE_
x-ms-office365-filtering-correlation-id: adfaef01-ef1f-4a77-58b0-08dd5bd0d79d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WWt3dGJESDM3OXUvVkVBRWJxMVlycEpxSURIRWpuL3JJZkk3SVcxREdrRVQy?=
 =?utf-8?B?SVgwY1ArZDBFYWc1RFBTeitoellYMmVsMXRsR1k3Y29NSi9KaTVjSkZGdldL?=
 =?utf-8?B?WUpIZysxMTFlREpoQzFKVkNhTUdGVWNtYTJwL3RIc01MSDhkeDJualg5dm82?=
 =?utf-8?B?eWxCVXpqZndYeVVRYWIzTFM4V0xHWEYxK3h0MEJYK3ZPb2dSa20yUHQxZUZ6?=
 =?utf-8?B?NVg1bkNLdVNHTlR2WVJvY3F3UmIwRURDVG9XN3Y5M3dydm5WT1ZSVXlXQVJY?=
 =?utf-8?B?ODJRVkYzN1BxUG1GU0VTTFJUNTBZQnhma2d5ekN0NFQwSmxLOXNFZG9TNk1R?=
 =?utf-8?B?UklGQ2hJS00zS2pVSk91eG5wVGFlSURxZEoxN01XckhNSnZOOWcvNFdtS2t4?=
 =?utf-8?B?U1NncXY2N3Z6OWtyVjRNeGs3dDJWZTM3ZEQ4d0ZEaGdMY2lpcmI5dHF5WThK?=
 =?utf-8?B?TWh3UnJ1eGtzRG1wakEvekxYcmdiNUFtcE9WMXZ1T2VEb1V6NlBReENuK3o0?=
 =?utf-8?B?ZFBzSHVGV3VKQjYva1hjcDQ2emZHNTlkTFlac0ZsWGl6YXNNbnpOcE5jK3Nv?=
 =?utf-8?B?QkJkWUVWMEI2VVFxODhqek5nQUtVMitDSHFSWXZDMlE3U2FPU3VsR1RpSExw?=
 =?utf-8?B?bHpOK1MvTE9IWkN5bms2ZFdZMmhKengxeldIR1ZyejhKUTVFY0hHVnhzRHpt?=
 =?utf-8?B?aTRlTjVoOFBJVE9neHJkY3puZjkrOVNpVitzZ2I0WWVMalBhYWp6MkgvaXU2?=
 =?utf-8?B?T1dxZkZTOHJPdjFjbUhrYnN1c011ZWdOZ2RtaHBIdU1mRFBGZ3huaDY2S2ZO?=
 =?utf-8?B?VmdGK3Q3MmtBL0gzNHVZODJBS01MK0pxSjVmQi9GMGlxQmNlU3Q5c1I4KzNJ?=
 =?utf-8?B?cUZtSHQrNXc5OUVxaXQxNHV3UUlmd29kME1waEh1QXIrYkhqbFFJbjVSTVV2?=
 =?utf-8?B?dDFZbUVGMjBTUWJQbUZlVDhxRElPRExTNjJUVGRqNDM1TVA3dmkyWGJ0Z2E0?=
 =?utf-8?B?a2xLTTg1ditqWHdJejVmblVOdk1WZnRBWTB3TVZNMWJlRG1wZ0NobUR0cVFm?=
 =?utf-8?B?ZHdpTUY3ZDNVVzdiSG9QSXcva2ZoNitLU3E5Y09ianFqY1MxZTRLaW1mNk1C?=
 =?utf-8?B?WEdzWm1Vby9TK0NSUnlCVVM0cjBjMlMvdGx2bVFRcW1aOTNQeHd5R1c2UERp?=
 =?utf-8?B?KzJYeElLN0V3TVZaRmw5NUhlNjdoNEtoaHBNYTdMbU9USVFEdklOYUNya1JQ?=
 =?utf-8?B?eUpMRFNEMjV3UlppMUl5aWYwUTl1Q24xZjRCRkpia2J2b01hSWkzL2lZTC9j?=
 =?utf-8?B?OHZiOEtxbk1FVVN0NWhYenJvRnY3bDBMM04rWEtPZUUrWE5sN3Bvb3l3YUNo?=
 =?utf-8?B?SzRaOFpJSnlKYkpJZnYrQUwzK05aOXVVNTU2MU9DWHlpSGMwRFRTWEsvUFp3?=
 =?utf-8?B?UStXY1M5cFJiSGoweUVoTGladkZ3UHZmRHBqclBFU0pqZExYdDRDeHNDQTBL?=
 =?utf-8?B?elpmVHRtSi9TQVBuMEg5alh3WFBINVV0UmpLZGpjRTdXRkkvYk9WYjNOcVcv?=
 =?utf-8?B?UytwWHduQ1dHS3BSdUR4S3dhSlFXczUrY0RJTkVhSklvMXhtVWVMUjk4SVVD?=
 =?utf-8?B?UVF5cmlLOWN4cUdFY1gxRU5GOUgyNEE4TW54MFNUK29pbjdzdWVmRyt6Znpk?=
 =?utf-8?B?VGRVdkRNL0c2ZDhqUU9QUVdiamlYL2dUNHphVWZpWTdxT2pHVjJqOGRRS1c0?=
 =?utf-8?B?NmRKTndoMFI5ZU5tbmp2K25nRVJqTlJQbEl1d3hxckVhbnF0dmthTDl4V3VW?=
 =?utf-8?B?QlpuNG01QTRqRysvMHVIS0FNOFhPOEdxSHRsNmZlNE9DTTkxWXYvOWd1UXJB?=
 =?utf-8?B?ck9EZVJuMVpYL3FJWkdIaTFUNjlJUlZMY05YQlkzVGlUMC8wQzFYRDg1Si85?=
 =?utf-8?Q?vSOwRQDPEZJ538JolYZkYDtETRDwOTdj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnJidkZNRWpyRXNhaG5ReHdMWithTFB6OXlMd2I3R0VycEtySzM1L2NJMnN3?=
 =?utf-8?B?WEN3L3ZFTXBiSTA2QXRnTDE1QkhXeXVmTzJ0SUtTQmJZSVFqUGdKV1VnMXNo?=
 =?utf-8?B?QU1jYm9Hbms5a0FqNHluUWVycUpJa05WWTRLV3c2K1A1Y1lVVVlzSlFtMlZU?=
 =?utf-8?B?L1dMZnJLcHhzOW5zZENBRjFaSURWekt6bk9mUC9jd0c3WUx1L0tYeUd1Z0pL?=
 =?utf-8?B?SVIzNEhPRjVUcFpqZXRRamNrTWRxaUVMWmJHTmJPcmkrYlZ2cHpWS3Jhamov?=
 =?utf-8?B?YkpBS1pReW1HVExoRGRGS0VuRGhXeGpZRFc2dk1Pa2hSZXU1ekRiQTRERFFs?=
 =?utf-8?B?QWxiazhndlcrZFpLV2ZRc0M4ZTAwYWRtNU1kZFcwRjE4YWhINlJ0eU9ueHEv?=
 =?utf-8?B?RDg4cWhtOWdtSjQxRU1nT3V5NHZOOEkwSEFNWE1SQzFxVUhOMUl1RGhXUkRE?=
 =?utf-8?B?eG1qd0t1Z2ZrUWVFMkVUbUZmVUw3YnRoelRrSXJJbTh6d2NnTlJnU0tqVUVQ?=
 =?utf-8?B?aHRRVlF1SmpPUVVqUlRuWmFlT1pXU3lpc2lJTmhFOHU3ZmFaVkdiTVdEYXhy?=
 =?utf-8?B?T3VOOHRaWHJhRjlON2Zyakh0dG5La01lZ1V1YklRRUJ6cjV1OFBXbUt5WTNC?=
 =?utf-8?B?OWFNbVRjbGdrSVlWd2dlODJ4a1ZjRnM1MXo3eDFDQXFDR2FiR1BWaDRIbUhp?=
 =?utf-8?B?QUZMamdkRDJEaENVOWxvVlUyTmhML2ZzTWhKaHdJeGxRU3hVa3lGNllKS0Yv?=
 =?utf-8?B?TzIwb2V6Mi9aSE1idFlaWm1mTERIL0dkSWN6bStrRnNQWWRUTkxLdHdlczEy?=
 =?utf-8?B?OHJsRzI0Vmd5elJYYUs4aEV1S1MvTDlJWEhyRG1iZ0dvMEZoNkVTM3JWVXFV?=
 =?utf-8?B?dXJaZGFCdXVKRllJQkkwUnRQUlZZeDZYc1BIWlBoczZsblpXdDlhVDFtOHFD?=
 =?utf-8?B?eHE2cnBFVGF6MkpwNEZOT2NTZk9GcXVpMnQzZVNCUkNJcDlYMndCY2lkSUtL?=
 =?utf-8?B?Y2JnbHlpby94UmRFT2hTeVpXb2Y1MTEvTDI0aW5UY0t0ZEp4QWxxZmNZRS9l?=
 =?utf-8?B?Q2FZbkhkNmNTS0FkTnlVRWEzekJieGNwTWh2TTV6Yk9Dd3haTU1kTmgrMjBx?=
 =?utf-8?B?eXdHelFVUi9lbHlvVC8yWm9Zako3MXdHdEJCMHhjaU9YRHdTZk5ycnV0T0o5?=
 =?utf-8?B?ODVVMyt3b0I0emtvZlRmVGZyOXFnc3V3OHYyNFBUMDJPM2E2U2tWbFA0VFNO?=
 =?utf-8?B?WXN5TjlCa3VCZys0czBoN0tqWTRjYjJKbkVMU2ZoU3F2NTB4MnZtS09scUww?=
 =?utf-8?B?T1JFS3JkR1BmUGt4RHd3MmZiTDkxU21ud1g0OWFuTWhZd2ZickdhTHVud2Vm?=
 =?utf-8?B?UnVkMlliVmNsLzVoSGxZa0EwMXVnRlNrQXdxc0NBaUFidEN4N05TOUpvenZv?=
 =?utf-8?B?SG0rK1F2dEVrSjZJQTZEN1lwSUdEdGRJaXF5VW0rZ09QM210bXdBcXkrdXNi?=
 =?utf-8?B?aWcybHpVUVNnc3BmNDg3TEFKUWNtNXRodnNhenBwMkk5NFdxcXBLNnI2TkZ6?=
 =?utf-8?B?RWt6K1o2c3psWDZ3enlxbTIrQkxpUThZME52OTZKYm8wWWFTRCtFcGpxbWV5?=
 =?utf-8?B?elVoSTFVYkVweGNvZzQ2Y3M2cHk5WCs3SS9kK1JBSVpRVTAvY2FWTmY3Tk12?=
 =?utf-8?B?Y2E4bzhJajViQWFVRUhiaStTNjQ2YXhiU1JVR1VwRzBkTG9FaVhFcFp3Uzhx?=
 =?utf-8?B?eVd5VXJtQ2RJQmZpTGNxanhBUHdVamVPblJ2dEx0ejA5SmpTVEdIY1pOM1My?=
 =?utf-8?B?MWhTV2dUQks2RE9POC9mTjNjNFI3NkMzVXZjdDZwenh1TklaUzZzZnZudjJN?=
 =?utf-8?B?cjZYRkR1VkluZHJFOVByWFByZUMwOEF5K1p0NkZPSjhta3JZZDBTMHV2WVJK?=
 =?utf-8?B?Wm5Od2EzdnFmb0VGRi8rZ0E5emdGa0I3Mks0Mk1rd2tSVzhQZ0FMR1Rhb3ho?=
 =?utf-8?B?eTVVVU95UG8yQ1ZnZ3hCek5yNE5RcmJ1UmJEUHROaGhUcjh4emVycVBRcHNM?=
 =?utf-8?B?Z0t5SUY0aExTUWNLbFZieVVwakkycWZvNCt5TnhkcjZJaXcvV2FVOFFuSWVa?=
 =?utf-8?B?dTNOaUN4bXFYVzRUbzhBWGw1NklTb3NpQWZ1MGpqUG5zRnF3aWRtUkdHLzNU?=
 =?utf-8?Q?AFfkmnSsuTs8nVpg9aJldj8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BF8C19960618744BADFC97A4D97B2C9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adfaef01-ef1f-4a77-58b0-08dd5bd0d79d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 10:31:08.4949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EjayvC3z3P+qNwloMsDiyBZS2Hlp3y5GMmCDOFAJ0KXeCrSusMJjPd2dpCHtQlfjEtmdxMc0J7AF0TvXwACemM+ZSfWoe9tzDA4jAedz8LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
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

U29ycnkuLiBwbGVhc2UgaWdub3JlIHRoaXMhIEFjY2lkZW50YWxseSBzZW50IGEgd3JvbmcgZm9s
ZGVyIQ0KDQpCUg0KVmlub2QNCg0KT24gV2VkLCAyMDI1LTAzLTA1IGF0IDEyOjI4ICswMjAwLCBW
aW5vZCBHb3ZpbmRhcGlsbGFpIHdyb3RlOg0KPiBGQkMgZGlydHkgcmVjdCB0ZXN0cy4NCj4gDQo+
IExpc3Qgb2YgdGVzdHMgdXNlZCB0byBjaGVjayBmYmMgZGlydHkgcmVjdCBmZWF0dXJlDQo+IA0K
PiBTYW50aG9zaCBSZWRkeSBHdWRkYXRpICgxKToNCj4gwqAgdGVzdHMvaW50ZWwva21zX2RpcnR5
X2ZiYzogQWRkIGttc19kaXJ0eV9mYmMgdGVzdCBmb3IgRElSVFlGQiBpb2N0bA0KPiDCoMKgwqAg
d2l0aCBmYmMNCj4gDQo+IFZpbm9kIEdvdmluZGFwaWxsYWkgKDEpOg0KPiDCoCBSRkMgRkJDIGRp
cnR5IHJlY3QgdGVzdHMNCj4gDQo+IMKgdGVzdHMvaW50ZWwva21zX2ZiY19kaXJ0eV9yZWN0LmMg
fCA2NTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoHRlc3RzL21lc29uLmJ1
aWxkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPiDCoDIgZmlsZXMg
Y2hhbmdlZCwgNjUzIGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMv
aW50ZWwva21zX2ZiY19kaXJ0eV9yZWN0LmMNCj4gDQoNCg==
