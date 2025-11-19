Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87E4CF2583
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 06:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5567910E572;
	Wed, 19 Nov 2025 06:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY2Ar5kB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF22510E224;
 Wed, 19 Nov 2025 06:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763532757; x=1795068757;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=fvBHPIe7Z/ccJlJVR6q37XYWBJX5pdjndkiLH9UUAtA=;
 b=BY2Ar5kBEXhyq1OlZjBzuI+/mo4VNZHocfPj+Cr9nb0tERi2DpZQDlmQ
 VvY/3SvAQbfQ7a2FI7Dy2ONhyNWCPgdvM/elgu4Nvj/HOtuT4ef8iSuBJ
 rUpOin+m3QrZNQz3quyjzGkzS9z9ArjioapIMAIML6YViNs7ayOJusVLe
 rIAMx2FGHTL6i+VSVTxyEMvRjz8pFZiK+IDplKs6M8fItSvq3FvgO4JdL
 fYq2Y+A8nzaJ9PXf0jEyCIXXK5oCAgPd3SGC01SpERvLT8mivSrii2xcc
 G7EI0lq5iy/sLsD09VlkJoq6ZtXQRK0jg7n4wPHy+W25gPVN+Kaf06pQ1 g==;
X-CSE-ConnectionGUID: E7rpu/EjTM2FU02V3IFOqA==
X-CSE-MsgGUID: zvkDcEkyQviZVWP2VYnYTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64571859"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208,217";a="64571859"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 22:12:37 -0800
X-CSE-ConnectionGUID: fmSx64dZR2Kvt+x2iCTDcg==
X-CSE-MsgGUID: n4YZN86zQBatiIR51fzhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
 d="scan'208,217";a="190991194"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 22:12:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 22:12:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 22:12:36 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 22:12:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHfFsh+froZOStRAcDayL8GM/i6ugZisegqAZrmz4y65bhVHzFUNMYOe998YvJV+bgHQMlpKtIqnhi3BI1OKVyDLc4g3QSG5zOYSiwrJAfGRkE6DajEu9F+gtgyfNAnUZW3749ynyrSf1IuTY2d73+hPE/wtGZ9ghhkNIE5RAHpQFBjPqtDwEyPLvpMVnpaiBtFiSzFbNbqHO0J0PkK4PlCA4NxJd/Hl+0xFq+Or4v9ruW4QR0aLtUmY9TsAqYkfy7QzLi1Bo7D5ivEiCHrEH8S6v7V6IAnVSzRmsQMl0mpPi1rkxZqcPbVgBhSo9rK4Mp78Nlogl+6922ynhq4/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvBHPIe7Z/ccJlJVR6q37XYWBJX5pdjndkiLH9UUAtA=;
 b=Z3pp7HqtLymO5Y+uiJw3t5B8wvMJXdnfv0otfveyeS6gGAbP7NCSOYBtZ5XPWGqHrBPaBctIsHjHbLixEq0+qS79+LWqk8YpnKW//vs09C/tuoLqoru99k6THIVPwqk39kUvBQB4Uj+BHxm3DzBq7RuFBx/TZkbUYfVe3NYheJ580bhJyfQKjZg+8KpOIMGeDWu80J1e6uV+iECM8OBx9ub5bcFLSWonxKuqU5W8w3f+58gRExXKEDGNfC4MQ6ZBYnaEiomIUvU6VA6QbfxT84G5jjyjHUqQ7aqIk+n5KXiU0MAEhIV1ydM7Gsft2kgjCCIxQOdSBip3WJh+zYC1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by PH0PR11MB7469.namprd11.prod.outlook.com (2603:10b6:510:286::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 06:12:34 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:12:34 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgUkZDOiB0b29scy9n?=
 =?utf-8?B?cHV0b3A6IEFkZCBHUFUgZnJlcXVlbmNpZXMgdG8gdGhlIGNsaWVudCBoZWFk?=
 =?utf-8?Q?ers_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBSRkM6IHRvb2xzL2dwdXRv?=
 =?utf-8?B?cDogQWRkIEdQVSBmcmVxdWVuY2llcyB0byB0aGUgY2xpZW50IGhlYWRlcnMg?=
 =?utf-8?Q?(rev3)?=
Thread-Index: AQHcWFs/a/s3Zq0voEechEG7j7ATZ7T5hXmm
Date: Wed, 19 Nov 2025 06:12:33 +0000
Message-ID: <CH0PR11MB5427A68DB2FD1337F3CB11C498D7A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20251118055043.660759-1-s.sebinraj@intel.com>
 <176345016833.3615.16980920067934768740@a3b018990fe9>
In-Reply-To: <176345016833.3615.16980920067934768740@a3b018990fe9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|PH0PR11MB7469:EE_
x-ms-office365-filtering-correlation-id: adf2d30c-fce6-420f-5dd1-08de2732a139
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: =?utf-8?B?aXN2ZWwvRk5WUmpPeVJIVUVnYkNSSEpyN1hNSlVxTjBGd3BEYjF4K254NXNm?=
 =?utf-8?B?Skd2YWZVRVdNZ09GdVQ2UVVJUERCenVrUkJIQTc0SVFhZzRGaDNnYXI4V0dk?=
 =?utf-8?B?SE1KS2dxcVdnMlI1N29kRGpaa3FOUTFROHFUbTZmREU2cnJGZGVDbzdIMmhH?=
 =?utf-8?B?QThFazdTUEc5QjM4L2E4VmlucHdNeGpYVkxFSGdqdVYzNDhtZSs5L1FHN3Nx?=
 =?utf-8?B?UXR3bjVYMmtwNzY2MG9oTkIzZjdKdnZRSGlyUnRqeVd3Mi9aano3ME9rR2lE?=
 =?utf-8?B?MkRHZUdka3FPTSt3aGp5UHNLVTZRV0RMcTNEM2tSN0F0bkN0RGVkdGNjaTFC?=
 =?utf-8?B?TCtXUnBQMkhJU1R5Vk5uOWt4OEZaSFVZRWZrTFlhN2Jud09JVENHZysrQ0NO?=
 =?utf-8?B?eStER3dCVjhQMzIxS0V4WW96czhBbEhoWEErQ1pRYjJpU3Y1VnFzT3YvOW9n?=
 =?utf-8?B?S0pZbXJoSWhwMTBnUXdmSG9PTjNGanljbEpGUmZVL3h6VnJBWjJ3OGNZdDNi?=
 =?utf-8?B?MWg0UjhDTjlnMm5MT3NNZUZENUMrc1lsU0JQSjVTODdjSHFaMGI4U2pSZTkz?=
 =?utf-8?B?N0V5UDFmaUZaUUY2YkR0TUlUTlBIc3lCY1ZFUWtsSmRsNDVlY2VYbGlMaXFB?=
 =?utf-8?B?Um8xRWU4MWV1d0ZQNjJMdEVPNUFRdEtsUk01UjNpY3ZQM0ZlemZOU0ZsNkp3?=
 =?utf-8?B?ZExuR1IzVzZ4THNQRkY0MHFoakRMTUpTZDRnLzNPTU16OGJEWktkWklZQTBB?=
 =?utf-8?B?M245eTlFRWJoeTlGZGZaTWFCTTdaOUowdWlxOURnbW9qQ3RKdGhYYVZnYitM?=
 =?utf-8?B?NHFCKzBBcm1FMklFOGxudElLamQ3UmhYa0duYVU5NG9WQTcrb0pQMmpWU3Vq?=
 =?utf-8?B?K2xVZFdZak52OHR1S0Q5NXZXQWFLTGhLSVRxZFE4WHExOXJmUGJrTjZPVXFO?=
 =?utf-8?B?QnBLM0w1SFFrTVVFSWhvSldtRnIxNk5NZ1NMMm1FSytERGRJTnd2VGtqWnl1?=
 =?utf-8?B?K2pkSXZrc1VRYVRyU29SUGRYeFd2VUxDWGNUbHNTVUlCeGhXcDlGQnhqcXRs?=
 =?utf-8?B?Z0Jzc1h4aFo3SjJPUkYxY1E2RTg2Z2xZcGRsb1IwQWxEV0cvMVFYR2k1d3Zo?=
 =?utf-8?B?Qnh5b29KVFhQbGtMa05qc1V6TWJBZjYxbkRUcGl2ZFpZNHFUenFINXNXQVdN?=
 =?utf-8?B?MGozdTdKSHFMQ3M3Y1YwWUFiYktBbkRYd2JuZnJZekN6ZXd4d2tHZFA2Y1c0?=
 =?utf-8?B?a3FnMkV0Sy9Ec0FhZWdkZHpmSG9lOHJ3bzExNklPTFNXWTlhcTgweTg4b3ZD?=
 =?utf-8?B?bEg3MXdkVzN1cEhoanNOUEY2V1ZkWDhqdnllL3F1R2k1NkRFNXlOZUxjZHhY?=
 =?utf-8?B?Sm5wZFlFUnlScU95SnJ1QnRKd1dmdnVLWVdYUHlxWVhUK3hFdVVGT0NvZ3F3?=
 =?utf-8?B?enRZcWl5VTdnMVVYRGloeFVnSFYxK1A0U21ocmhvNTVCM0FhYzlha1MvMzQ0?=
 =?utf-8?B?SE1tWlZucnFpd1hyVnVjNHZuTzlxaWtIYXVTemtyRERZWURxV0pPUkJ2YTlW?=
 =?utf-8?B?UTdERzZ3QUZzbWZtZFplQzVkK3pSNG10TE1jUkQzaHpUb3ZRSE90VEI4R1dE?=
 =?utf-8?B?WGVMcWY2V1p2YUNVWHkreHZTQXFoRWV6M1FjcDA0d1FBb3FpRkM4aDFLWVVO?=
 =?utf-8?B?NHhQaWRia2FBVnZUanloYWxxWDlMVHFjMnFsbHkvNm1SQjYwc01QYTFKVVFw?=
 =?utf-8?B?czFKeXBjRVNPWDR1Z2JYNTB5WTVGNEhUOHJ6b0lpYXBUdFhZZFFnNzZPYTE2?=
 =?utf-8?B?aWpWZGFMb01sUkpiVCtlRW1hUDhaV3ZzSE0zeGhqQVc4M0duRGhnbHE1Z2Zh?=
 =?utf-8?B?Y1dGZHpNbXNRZ2crdCtveE1yRnlvUjJQMXg5eFlrZEhYdTJVSGF1OWdjTzZ1?=
 =?utf-8?B?TGthQlI5d1dtS284Z3RsSEtGTGNjWlR4aXdMYXV2eEFkNXM1NGFCQm5TQ052?=
 =?utf-8?B?VW5yaDRzWlV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFJrSExic2hyd3Z3T0hvMWwwanJiTVNuaHE0UDJyKzJCNWZET1hJUVVTVVMx?=
 =?utf-8?B?UWRzb2x3ck4yZkZqLzBmaVptQVQ2SG9Yejd2citCQjd6TlZQQUtDL0ZQZHZv?=
 =?utf-8?B?djB0WStpWE9US3Q3bVhDNk05NUVBN2JoT0hIWnRFL1ZDSlMzNnZ3aTBxa2VG?=
 =?utf-8?B?eUVpZmRDM3d2N0lHb0ZIRGhkeXhJWTBrTmV5U3dUVTI2ZlM2ZmgwcUpwWkJw?=
 =?utf-8?B?U21RTUF0d3FySDhiWEg5aUxsVzJKZloyZzdyWXEwQ0VCMVJFVkM2MW13YW12?=
 =?utf-8?B?RVNXRVJkWk50ZjhjUzRnYzhQOVo2MTFXSmR4MGVkbUMxQzVVRVd3RFlHRFFY?=
 =?utf-8?B?M2EzVGkrZE9sdmFnSHUwSjNDK2M0dklVWHo0d0xXTHZlVStwbUd0NkNQeFN6?=
 =?utf-8?B?WDF4VkVOUFk5S3pGVVREeGtaQzBiM2J3aWY0MFNFVk9qdEdNWlJYOHNpYjhE?=
 =?utf-8?B?UzN3MEJXQWpLb2ZhdjY3b2lCcE5YSmZMWWRvYmZnYjBYY05KNFpXM09WVlUw?=
 =?utf-8?B?Zm1zTHpNRjNDTGpTcWtQVDNQejdLNkVQSk1TaS9WdVhEQ0MrcytXbVZyWkpw?=
 =?utf-8?B?eGp2SUp1dWhDSWdmVDZmS0JNR210M29EbEZZY0FNdEpRNTVBUjM0cGpFWk1I?=
 =?utf-8?B?WEhxM1ZPc09abEVpNnh6RXRMenJrckpZczFtVnk1dVl5MEk0cHdBcTBEc3Vw?=
 =?utf-8?B?dVRKbGlld01UWGV1d2xJQUN4NGhrSExWTXFpbC93ZXdRSVk2cEErTlIyMkF0?=
 =?utf-8?B?clA0UmZEeWlpR0d0aVBaVjUrdDBxT084eW1heWpKYWNFd2Q2RUdKM0crRGU4?=
 =?utf-8?B?V2hvZnpLSFZxcHFSMWhOaVVPb25VeFZLRlpRelh3bjNGblZTZjd0WVlIUWkw?=
 =?utf-8?B?NVlYYUVGeGl3TWpJRWQrVDBmQ3B2KzhUZk1lY1F0V0JaQlZPTll4VGlpL3Z4?=
 =?utf-8?B?Z1pkQkVSRWFHTTRpN2U0Q0JHOUhrV01TQkRGb3VmWTFJWDZZdGljeXVWWjJn?=
 =?utf-8?B?REY4dDE1WlBZcTZLODBQSGhRSGQyYUk3R1hWYS9GZVM0Y2ZxLzhKZzRaQ3M5?=
 =?utf-8?B?V3RWUGJmREpPNXBzazduei9ZMmNPSmV1RjltS3hFckQyTnpxYnhJTUZKK1lB?=
 =?utf-8?B?MUNHUGFpK2UrMlpzUjAvY2tsaXZVdGRsWHFJWklWTjBJcklNTm1xczJocG52?=
 =?utf-8?B?eEhlUGdTNkhnTWlVaVBXVlp6R09lSXNyQUxiZGhJazZNMG5uMXZ1Vi9welNG?=
 =?utf-8?B?cEhpTXo1cEdYVlBVNVVKSzVDTW5scVlDRVJxcVZYckoyTGlPcU45Y3NwZDFx?=
 =?utf-8?B?VlFUWWhRMnhSUGVCZkxBSy91bzBNRVl6NjVubDhoazB2ZEJXb1FrVGgyK1Jx?=
 =?utf-8?B?am8rYUlhRU5aZ1dOR1k4a3RKMTBXU0crMFFYdUpCSUR1M0haTFFVYW42Y2p5?=
 =?utf-8?B?MXR1N2l0eDVOa3FjNjJ4d3JXdk5kYUw4S2Q3UENZd2FLYWJCUUQvR3FuUXA3?=
 =?utf-8?B?bGYvQVFzV3A3dndNSW9oZnJJTUh3bUp0OGc1eGFRV2dFVnFYTGx6eVNRUVdy?=
 =?utf-8?B?Y1dEMEJSVkFYdHJkaytnUVVhMGs3S3ByV1RHUG9adnlvZWU0MnFVY2I2WkVY?=
 =?utf-8?B?a1N0RWxtRWxOSUM1WVNIMDZMK0lnelBWcmtiZHBXT2hwM0xxeU9uZVR5bGxX?=
 =?utf-8?B?aFdSckU0cE5QclV0YkdJT240dnZ3QmFWcXRTdmUzS0V5YnNTd1RwT0ZqVDd4?=
 =?utf-8?B?Tm1Odjg1ZEQxbVd2VGJYK3RGcGxBU0FlcFBEcHhYZ0dtV2hPMVNUQktlMGhR?=
 =?utf-8?B?VEpXT3BudUd0aHBNRkhVMnRoQjRvR1dOM0VtdWFIbG84YjAxeXhpZFVEeGFv?=
 =?utf-8?B?d1R0TTVUQnlNK0RoMWMvNWNaYnZpMUNaaHZQYlFEREJ0K05KVzJRMHV5endz?=
 =?utf-8?B?NGhWaHROcXdxbGxTSmhQb2F1UHpQZlhsY1NPZndPY25qTHFxcS8wVmtsQjk2?=
 =?utf-8?B?K0E3Wk9TOVhlUldtb2ZHZGJCNjd1YWhrNnNsYk50QjYzdnBjSU51MzFxU2NL?=
 =?utf-8?B?eUlsa2F3RXBHQ3FtTENOTFp5MUdnSXdBS3lmQW9ZNDdwK2sxekxnWDVJS2tk?=
 =?utf-8?Q?byHusQ3BooLyOlbvVh05REsxl?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427A68DB2FD1337F3CB11C498D7ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf2d30c-fce6-420f-5dd1-08de2732a139
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 06:12:33.9346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Ubu7plnwEhYUymVlb6imWtk/W9EaZqmzOyBgANr5RRS8iMNU8Ni74/yqiCKu2VO//6HQ+GpxQje1JD9Tjd5Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7469
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

--_000_CH0PR11MB5427A68DB2FD1337F3CB11C498D7ACH0PR11MB5427namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IFBhdGNod29yayA8
cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmc+DQpTZW50OiBUdWVzZGF5LCBOb3ZlbWJl
ciAxOCwgMjAyNSAxMjo0NiBQTQ0KVG86IFNlYmlucmFqLCBTIDxzLnNlYmlucmFqQGludGVsLmNv
bT4NCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8aWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+DQpTdWJqZWN0OiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1cmUgZm9yIFJGQzog
dG9vbHMvZ3B1dG9wOiBBZGQgR1BVIGZyZXF1ZW5jaWVzIHRvIHRoZSBjbGllbnQgaGVhZGVycyAo
cmV2MykNCg0KUGF0Y2ggRGV0YWlscw0KU2VyaWVzOg0KUkZDOiB0b29scy9ncHV0b3A6IEFkZCBH
UFUgZnJlcXVlbmNpZXMgdG8gdGhlIGNsaWVudCBoZWFkZXJzIChyZXYzKQ0KVVJMOg0KaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTY2MDIvDQpTdGF0ZToNCmZhaWx1
cmUNCkRldGFpbHM6DQpodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lH
VFBXXzE0MDc0L2luZGV4Lmh0bWwNCkNJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gSUdUXzg2Mjkg
LT4gSUdUUFdfMTQwNzQNClN1bW1hcnkNCg0KRkFJTFVSRQ0KDQpTZXJpb3VzIHVua25vd24gY2hh
bmdlcyBjb21pbmcgd2l0aCBJR1RQV18xNDA3NCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCnZlcmlm
aWVkIG1hbnVhbGx5Lg0KDQpJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBu
b3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCmludHJvZHVjZWQgaW4gSUdUUFdfMTQwNzQs
IHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCnRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9k
ZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KDQpFeHRlcm5hbCBV
Ukw6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQwNzQv
aW5kZXguaHRtbA0KDQpQYXJ0aWNpcGF0aW5nIGhvc3RzICg0NSAtPiA0MykNCg0KTWlzc2luZyAo
Mik6IGZpLWNmbC04MTA5dSBmaS1zbmItMjUyMG0NCg0KUG9zc2libGUgbmV3IGlzc3Vlcw0KDQpI
ZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2Vk
IGluIElHVFBXXzE0MDc0Og0KDQpJR1QgY2hhbmdlcw0KUG9zc2libGUgcmVncmVzc2lvbnMNCg0K
ICAqICAgaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBzYW5pdHljaGVjazoNCiAgICAgKiAgIGZpLWds
ay1qNDAwNTogUEFTUzxodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lH
VF84NjI5L2ZpLWdsay1qNDAwNS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHNhbml0eWNoZWNrLmh0
bWw+IC0+IElOQ09NUExFVEU8aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9JR1RQV18xNDA3NC9maS1nbGstajQwMDUvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBzYW5pdHlj
aGVjay5odG1sPg0KDQpIaSwgSSBiZWxpZXZlIHRoaXMgcmVncmVzc2lvbiBtaWdodCBiZSBkdWUg
dG8gYSBkZXZpY2Ugbm90IHJlYWNoYWJsZSBhZnRlciBhIGNlcnRhaW4gcG9pbnQgYXMgdGhlcmUg
YXJlIG5vIGtlcm5lbC9kZXZpY2UgbG9ncyBhZnRlciB0aGlzIHBvaW50LiBBbHNvIEkgYmVsaWV2
ZSB0aGUgcGF0Y2ggZG9lc24ndCBhZmZlY3QgdGhlIHNhaWQgdGVzdCBjYXNlIGhlcmUuDQo=

--_000_CH0PR11MB5427A68DB2FD1337F3CB11C498D7ACH0PR11MB5427namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+DQo8YnI+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9k
aXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+
DQo8L2Rpdj4NCjxociBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyB3aWR0aDogOTglOyI+
DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8Yj5Gcm9t
OjwvYj4mbmJzcDtQYXRjaHdvcmsgJmx0O3BhdGNod29ya0BlbWVyaWwuZnJlZWRlc2t0b3Aub3Jn
Jmd0Ozxicj4NCjxiPlNlbnQ6PC9iPiZuYnNwO1R1ZXNkYXksIE5vdmVtYmVyIDE4LCAyMDI1IDEy
OjQ2IFBNPGJyPg0KPGI+VG86PC9iPiZuYnNwO1NlYmlucmFqLCBTICZsdDtzLnNlYmlucmFqQGlu
dGVsLmNvbSZndDs8YnI+DQo8Yj5DYzo8L2I+Jm5ic3A7aWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcgJmx0O2lndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnJmd0Ozxicj4NCjxiPlN1Ympl
Y3Q6PC9iPiZuYnNwO+KclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgUkZDOiB0b29scy9ncHV0
b3A6IEFkZCBHUFUgZnJlcXVlbmNpZXMgdG8gdGhlIGNsaWVudCBoZWFkZXJzIChyZXYzKQ0KPC9k
aXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+
DQo8L2Rpdj4NCjxkaXY+PGI+UGF0Y2ggRGV0YWlsczwvYj48L2Rpdj4NCjx0YWJsZT4NCjx0Ym9k
eT4NCjx0cj4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PjxiPlNlcmllczo8L2I+
PC9kaXY+DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+UkZDOiB0b29s
cy9ncHV0b3A6IEFkZCBHUFUgZnJlcXVlbmNpZXMgdG8gdGhlIGNsaWVudCBoZWFkZXJzIChyZXYz
KTwvZGl2Pg0KPC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0K
PGRpdj48Yj5VUkw6PC9iPjwvZGl2Pg0KPC90ZD4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+
DQo8ZGl2PjxhIGRhdGEtYXV0aD0iTm90QXBwbGljYWJsZSIgY2xhc3M9Ik9XQUF1dG9MaW5rIiBp
ZD0iT1dBMWIzMzRhMWItODIzMC00MTIzLWYyOGEtN2FlZjQ0NTEzMGFjIiBocmVmPSJodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1NjYwMi8iPmh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU2NjAyLzwvYT48L2Rpdj4NCjwvdGQ+DQo8L3Ry
Pg0KPHRyPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+PGI+U3RhdGU6PC9iPjwv
ZGl2Pg0KPC90ZD4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PmZhaWx1cmU8L2Rp
dj4NCjwvdGQ+DQo8L3RyPg0KPHRyPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+
PGI+RGV0YWlsczo8L2I+PC9kaXY+DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4N
CjxkaXY+PGEgZGF0YS1hdXRoPSJOb3RBcHBsaWNhYmxlIiBjbGFzcz0iT1dBQXV0b0xpbmsiIGlk
PSJPV0E1NDgzMTkyZS1iYTFjLTIwZDktZDljYy05Yjk0NmY5ODg4ZjciIGhyZWY9Imh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTQwNzQvaW5kZXguaHRtbCI+
aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDA3NC9pbmRl
eC5odG1sPC9hPjwvZGl2Pg0KPC90ZD4NCjwvdHI+DQo8L3Rib2R5Pg0KPC90YWJsZT4NCjxoMT5D
SSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF84NjI5IC0mZ3Q7IElHVFBXXzE0MDc0PC9oMT4N
CjxoMj5TdW1tYXJ5PC9oMj4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0
b206IDFlbTsiPjxiPkZBSUxVUkU8L2I+PC9wPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6IDFlbTsg
bWFyZ2luLWJvdHRvbTogMWVtOyI+U2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGgg
SUdUUFdfMTQwNzQgYWJzb2x1dGVseSBuZWVkIHRvIGJlPGJyPg0KdmVyaWZpZWQgbWFudWFsbHku
PC9wPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6IDFlbTsgbWFyZ2luLWJvdHRvbTogMWVtOyI+SWYg
eW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRo
ZSBjaGFuZ2VzPGJyPg0KaW50cm9kdWNlZCBpbiBJR1RQV18xNDA3NCwgcGxlYXNlIG5vdGlmeSB5
b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxs
b3cgdGhlbTxicj4NCnRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2ls
bCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4tdG9w
OiAxZW07IG1hcmdpbi1ib3R0b206IDFlbTsiPkV4dGVybmFsIFVSTDogaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDA3NC9pbmRleC5odG1sPC9wPg0KPGgy
PlBhcnRpY2lwYXRpbmcgaG9zdHMgKDQ1IC0mZ3Q7IDQzKTwvaDI+DQo8cCBzdHlsZT0ibWFyZ2lu
LXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07Ij5NaXNzaW5nICgyKTogZmktY2ZsLTgxMDl1
IGZpLXNuYi0yNTIwbTwvcD4NCjxoMj5Qb3NzaWJsZSBuZXcgaXNzdWVzPC9oMj4NCjxwIHN0eWxl
PSJtYXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0b206IDFlbTsiPkhlcmUgYXJlIHRoZSB1bmtu
b3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTQwNzQ6
PC9wPg0KPGgzPklHVCBjaGFuZ2VzPC9oMz4NCjxoND5Qb3NzaWJsZSByZWdyZXNzaW9uczwvaDQ+
DQo8dWw+DQo8bGk+aWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBzYW5pdHljaGVjazo8L2xpPjx1bD4N
CjxsaT5maS1nbGstajQwMDU6IDxhIGRhdGEtYXV0aD0iTm90QXBwbGljYWJsZSIgY2xhc3M9Ik9X
QUF1dG9MaW5rIiBpZD0iT1dBOWNiNGQ0OWItMjNkNS03NGQyLTVmMTgtYjc0NjU4YzAzYjEyIiBo
cmVmPSJodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84NjI5L2Zp
LWdsay1qNDAwNS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHNhbml0eWNoZWNrLmh0bWwiPg0KUEFT
UzwvYT4mbmJzcDstJmd0OyA8YSBkYXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiIGNsYXNzPSJPV0FB
dXRvTGluayIgaWQ9Ik9XQTQ4ZDhkZmY5LTg5YTctZTA2Zi01NDhmLWE1MTgwODIyZTEwNCIgaHJl
Zj0iaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNDA3NC9m
aS1nbGstajQwMDUvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBzYW5pdHljaGVjay5odG1sIj4NCklO
Q09NUExFVEU8L2E+PC9saT48L3VsPg0KPC91bD4NCjxoMiBjbGFzcz0iZWxlbWVudFRvUHJvb2Yi
PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0
b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtd2VpZ2h0OiBub3JtYWw7Ij5IaSwg
SSBiZWxpZXZlIHRoaXMgcmVncmVzc2lvbiBtaWdodCBiZSBkdWUgdG8gYSBkZXZpY2Ugbm90IHJl
YWNoYWJsZQ0KIGFmdGVyIGEgY2VydGFpbiBwb2ludCBhcyB0aGVyZSBhcmUgbm8ga2VybmVsL2Rl
dmljZSBsb2dzIGFmdGVyIHRoaXMgcG9pbnQuIEFsc28gSSBiZWxpZXZlIHRoZSBwYXRjaCBkb2Vz
bid0IGFmZmVjdCB0aGUgc2FpZCB0ZXN0IGNhc2UgaGVyZS48L3NwYW4+PC9oMj4NCjwvYm9keT4N
CjwvaHRtbD4NCg==

--_000_CH0PR11MB5427A68DB2FD1337F3CB11C498D7ACH0PR11MB5427namp_--
