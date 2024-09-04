Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725E8CA0ED3
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 06:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E9610E67B;
	Wed,  4 Sep 2024 06:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOPKNART";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AB510E67B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 06:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725432504; x=1756968504;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RE8bm6L1GjVyCM9kOxeDZmcL/YIYGNYoueJs6MM0d0g=;
 b=fOPKNARTTPFOjwBEt9pOcXYvLzd+AIdoJZRwiupIDQKdrH74KqTy39J2
 b8eBsUz00IkcnwMwItCS8hzoUf+ea3VAH2XP4VuQVu3DT/lOypZxw6oc1
 Kh/K7XaHuzjAS3tM3/hVkjQqXGJUjNzkK5F+Rl3upPQejzVJWpXgcY7OX
 7ec9jF99ipmEKzXGFeVTivnqr6scZeLSlv0Yr1VKbarJxvd5++lkOr6S8
 GLmeLu1hBP3x2Nam6o3yGzeg33C1BCm8vechvxSzmp/7S6a1KuvINSZx3
 vqUwui/+Wq+1vV6nqhm8da7WxzcEf2w4r98RVw2/Cyst+t4kMFT8JeqUr w==;
X-CSE-ConnectionGUID: ebO+bmrmS++t+BD4IRdt/w==
X-CSE-MsgGUID: 2S1cI1/GQo6+m0jvYqujbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23873632"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="23873632"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 23:47:43 -0700
X-CSE-ConnectionGUID: V9mTP9SGQpOgXQ91uYv0/A==
X-CSE-MsgGUID: /IWjMqBrTBG19NwBQeoFsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="69797722"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 23:47:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 23:47:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 23:47:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 23:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCOVqpGLAV+MQxF8nRwl9p0n0dchuEcWELuiMjULK7EhuN0qDwVdsalBYRM0VaTiLj8fzyWQrrt7VIkr75kaVtY2mGMJXYBxZVl7Kxq7azJYovzz5IyoVglsGkwilLzcFO0ZGf+DOWAGv9uE3R14Dn8ec5WuuX/MMvFQgFddOTxRt5KFDmLWIRcs3yScK3sTpdxBW+FgnZ63xU/Kurj/BQzXoKXyNrMblGOqTH1mkstbm6dU9sjjgkh1BkyOu3ibHeGqVcOOYQKPQmsWjDxOSQXKb8lRpZryHKSXjdtevoZK8ATeOB3qUYyZWCqOoVTI/dwlih2nkv+qVnc8b6vzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE8bm6L1GjVyCM9kOxeDZmcL/YIYGNYoueJs6MM0d0g=;
 b=I0r4OQkCH6c6/owsuK+QQske52F6I3wrH8z9esx+Y7WmEFf3MY/Qlgx1wu+24qOy9nrsVe6F7NBBcvXGry62Z4kXNgz/RIZ89+L/cfmDlnT56ZQnysQ30HqhhemOtIdDoP2gIerdGj+uATkSOXvBSFtLNMrP2UIsflCCJnS0aV/6tB/i+phloembVUeDoMbntEVBbgVtPdV7EY2Z4cAbWajHx84NbXn1feKlyG5f7xPdediKZqTdHES4aQznNtONk1mS5BKCdXbuSMSdnqJrp6BK5++4n34CXEnUiMCUxOwseysrXOtZFjBXXBnG9S/jJfimDFgu1H+SJ2UFR5JypQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 06:47:40 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:47:40 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Emil Velikov <emil.l.velikov@gmail.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Thread-Topic: [PATCH] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Thread-Index: AQHa7HmNOHyC0Moaw0+57cY6Mi7ZNbIzjLaAgBJQ0VCAADwggIABONuA
Date: Wed, 4 Sep 2024 06:47:40 +0000
Message-ID: <DM4PR11MB5293A8CA3B997E064E1F8ADB9D9C2@DM4PR11MB5293.namprd11.prod.outlook.com>
References: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
 <20240822164627.byk7ffdpjwpwb5tw@kamilkon-DESK.igk.intel.com>
 <DM4PR11MB529380A7C3015E03F8D1B59C9D932@DM4PR11MB5293.namprd11.prod.outlook.com>
 <20240903120335.2yz3ix6rezxn7x53@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240903120335.2yz3ix6rezxn7x53@kamilkon-DESK.igk.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_|SJ1PR11MB6299:EE_
x-ms-office365-filtering-correlation-id: e251f3da-41f9-4647-8e96-08dcccad787e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SjBmaUp3SmJDcEJzbVhsMWllTzJTUDJtUWdJaktXWEhEaThJMzUrM3pmZG5H?=
 =?utf-8?B?b0dLU3hzSERMRmRjeDAzVlN0M3ZIZUpsTWdHazB0MC9YcjFoY1ZUcmU4azcy?=
 =?utf-8?B?YWVhSWVEcmNhWTVZako3ZVVRSERwSTNxVkZXMmxPYUIyZk9mSlFNTm1sRzRk?=
 =?utf-8?B?N28ybEdBVXNMZzJmcjRmYVV3R1h0SS9VSFB2bFpJVTZ6NGxhS0IxVmhlWFZI?=
 =?utf-8?B?amsxZlRLSVJDZHFvTDhTTS9YR2tlcEFUYU4zVlNOTHJNQk51U3dBeDRrL2xr?=
 =?utf-8?B?WFRHYjI2K2NNS3dIZCtML0o2dTBuTGRTK0pzUXdkL0pxVFMzRVJXWWFIVGZ2?=
 =?utf-8?B?S3EvcTRGSVVLd216NzhmNFpaOW01WjlSb0hYOGpNcThPSFRCdCtHZnN4b1J0?=
 =?utf-8?B?ZVR4N3lxajZZNjhqWFJjRzh1UHUxWHVqbEZLMzd4eWFXd2w5OGJQWlNBRU93?=
 =?utf-8?B?RjlzNmlvK3o1NmYrMUF6SUtFVmdUa3p6WkZ0WU85c0Zidng4Ykh4QlAxMlhJ?=
 =?utf-8?B?Z255VU1MSThLejJKSzN2Qlc3d3lnaWRSelBBaTl6Y0FwRU9OaWFVbXpVMU1S?=
 =?utf-8?B?cUVXaGR3NFgwUnU1R09CMkZKeDFhbXN3V2Z4N1N6a2hiWWcyY0xxSE9ibWVR?=
 =?utf-8?B?UUFXczJWbXBvTUpyNjhBYlkrRWJhdmgwK0djVXU0UXR0djRBUTFibENYYzhQ?=
 =?utf-8?B?ZkljYm81SVVnV1hZMjRjb2JIVnIxeUhpNE8wZ05mNUFTZE85SXhCbHVmUjM3?=
 =?utf-8?B?K0gyYkY0K3JSeFczQ3U4SERxemR4U00rQjdKcDd6TytER21GSEQ3b1lCdG4z?=
 =?utf-8?B?WjFrN2V4ZG4wSUxlOVpIMGthY0JRVTduWkdhVUpJQ2V0UFZoYmJaVWRsa0ZE?=
 =?utf-8?B?aFNNSFRXMW13Uk9YaXQwWDdpbm0rNkhJMXBUN0FJU0pLK253UXNlZFlMYmNk?=
 =?utf-8?B?THlIcm81Njh4SXZHQTlKSjRITnQwVWVPMzBmenk0TlFnU2V3WVFVdFlCazRo?=
 =?utf-8?B?a2xKK3JEQjR0MmFYNXhrUk91OWNSRk9iZ3I4VnNOSitkdzJwelFkZk96OWJ2?=
 =?utf-8?B?UXI5S2Z3OEg3dEtRUnR2VHRQQUJJalRsdVVLVjd3eWxFVkFsRldCVU45K2E0?=
 =?utf-8?B?dGNUMVBSbnZEMVEyc3FFZUNsNDJ2UmV1ZDE0VFczZEhBMmtEMHBQQ0czWG9y?=
 =?utf-8?B?eEtjWHgyWVlyRVgwc204bW84RThBalJuWUhndHpnTDlYczVMRGsrTFNZd0E3?=
 =?utf-8?B?TmlkRmxMdHM4Q0J1c1k4eitDNmg3NGdLbHpUTm8vbG9IRDErYXZMN3ZhYzRo?=
 =?utf-8?B?TWZ1UE9nMEtKN3NmTkcvNFo4NHhGSWNHSFo1UDY3bXN5MkZ4cUpZaThDZy8w?=
 =?utf-8?B?UFZ2QmxnaFVrY2UvM3A0TncxSEVuZjJXOVVpSS9tVUJyK28zQUJ3VW9FR05T?=
 =?utf-8?B?SUhEL1E5cnMxRTNrOEVDVDliWEFvampOcUtaSzNDOFdiV2lQUy9rdWFtZHND?=
 =?utf-8?B?WWJuQ3Rpai9mS1pBVVowQ0pkV3ZPUGh2dDF4MGlKd291dWpxSmZOM0RvYUhq?=
 =?utf-8?B?QjB6dU1FV1hEdVdTR3JuNWRzcGtsUVJzWHpiTG9jTG9nZHhVSElRUkFmWlVD?=
 =?utf-8?B?aVV3aUd1NHJJTG1HaFVGZGczWDgrZHQ1bStmb0RhQXJERlRZTjFCcVpHYWVT?=
 =?utf-8?B?QUFJbjJlMGpxYUJDN2pXVE9wRmpUNlB2dlVwMTNEdkhweDl3bDZlL05TNXhL?=
 =?utf-8?B?NFptOER2OTdPc1hMTXNMMGQyZGNqNTBuWGdYYVZIMTVES3JlRUMveVhnZ3Vy?=
 =?utf-8?B?ZldEcDFxdi9yT2VVU2xWUGhKK0ppTkhIYjBxU0dzSTFXRzhuT3hvTlBxbDR5?=
 =?utf-8?B?SVJCNHdTYk1NVFBiTCtQTThMajg2N2R0bjZhRmhkVHVnc3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHB2b2VkbHZlQmVydDlwMVZLb0FsVlhtUTNWK0VXNTllYzlVdTQ5dlViVk45?=
 =?utf-8?B?TTNVdU9TYk5jaGxlU2JZRUQyM1gzeU91WnNETE9iZ1BUcnpobHViMWVDZ0px?=
 =?utf-8?B?R0RGT05uSkEzSzdFU0Z2REMwOUtEeFlaRFlSM2N3Z1hvaWwxOFY3MFM5QzUr?=
 =?utf-8?B?NHcyYzdiWTdIcHVHbWp4dW5PZUkwODVDUTdLOGlrUlkya2E0MUpWa3FFeUM3?=
 =?utf-8?B?dmEzT203cXRkeERnY09UK0drZExpK0hjOEpiam9PTnlHRzJtUjdHcmVaTUZz?=
 =?utf-8?B?b2dHRUkrTUJWTVBseHkxMU9CSVhVdlZjZnJqdTduWWJpbHliVTFzcGpGbU8r?=
 =?utf-8?B?a0M3Q2pRRmFNTUpMS1VQNDFiNFRmR0F2Ri83TXppYktwUzNEV0pldFdJR2t5?=
 =?utf-8?B?ZXBvRXdHVzgvdXhsZnlMTFRqMnhhNzVzKzQvOGhUVEVkVm00dFhhYjNzQ1FM?=
 =?utf-8?B?U2FlTlEzbm1JU0EycnV0VUVsdnJ5dm5mVEVJbEtTeFdYWEVrT0ZMTGJLVHB0?=
 =?utf-8?B?T096OHlybFE3MWh4MnFaSnUrRUpxVkdEQ3NnOEw2TWZleThYeXlYYjcyNGJO?=
 =?utf-8?B?eVB1dGx2b0E2NUp0V1BIeWxHUlRucDY0KzhYb1pFYUNVeVNQRytQT05DV2VQ?=
 =?utf-8?B?MVgyOEY1WlFHSnkzOVFoVjFxWFBaNlhXazlvSm9sWjNacG9jaWFacWpKaGZy?=
 =?utf-8?B?ZEpGUC9DZS93eEI4RFpVaElBRFBrZUJNTzBvcFdORzZXbmE5K0ZqNTJ3K0V0?=
 =?utf-8?B?ZEcxWUJtNHRSVzh4ZWl1c2JyN005aEExK0VSa1BiT3c4d2Q4V0JZdHEwYnJu?=
 =?utf-8?B?ZENnTjFsODFDWVZqTUxLeHp5NTNUcWs0ZUVqMnFSNWFDN2QzUXkyT2Q3SnJm?=
 =?utf-8?B?cTJRYzFMTXl5SkY5N0FqQ1h5N2JlNFAyV21VUVpJTWtKaXZzektsSXFVYkMy?=
 =?utf-8?B?R2pqU1BFYW56WUpNeHBDaldwMGhqT3Y0WVdudGZWUXZJTDZpZzNCbjdjZU9H?=
 =?utf-8?B?and5SVR3alJKemZvaUZaakVWZUc2dVNadlpFckdPSk82ZWw1VWYrSmJyYUJ6?=
 =?utf-8?B?cXFNZ0Zuem5wR3Y5V1J0RFRtTFZnazNNM0o0d0ovM3ZkVWZSRXVWMkloN1Ex?=
 =?utf-8?B?eDJlc21lbEcyZTJnK0ZPTmhiTHRBZ3VNcHJBc2lRTnBYZDVRUDh5em9kQmNO?=
 =?utf-8?B?NGd1dTFWdk54UGgySlFjQXE0V3BXbCtrdm1ndVRCdzdUd25lUE9yY1hZd29V?=
 =?utf-8?B?ZEF0MlZWc29XUXh2K2R2SFZrRW1iQnljUDB3UnRYNmVFRG9jQjdKb2J0VFow?=
 =?utf-8?B?UGlENjBJbTRQYXJSTFJ0M1l3UTdXQ1U1QUhCVlE0NGY0MWpZMmdYdWRzd2Vz?=
 =?utf-8?B?UEJpZWhkVmZiWlVhaHd5MW9OUFVqbHBCa0E2ZktiRU9tYlgxSlovcEk4WlNU?=
 =?utf-8?B?NFVmNlJlL0FiUTdVNkhJc2d4eHR2YnAwN3c1OUtPZHE5d3ZQc0k1b2JiWk1p?=
 =?utf-8?B?NGNPRWN5UlVzZEJCZGZWSWJzcGFzajFXb082NlJmSUZxWWhhWUE1eGE0bjAv?=
 =?utf-8?B?K0xOV1BkdUd0N1lRTUpoWjlpWlVVUU1SdWtUWGRya2JBNXd1OTIyMnlPc1lk?=
 =?utf-8?B?VFliSFhJcnJydVAwMDZCOTJlSXY5Q1p2TlFYcWRzMjVHZkFIWTUrMHllbEJs?=
 =?utf-8?B?dm94M0F3SmJjUElqcG9YOE1GNzFaczdFNmpFaUl0SUkrN21tOWI2U1V2T1o2?=
 =?utf-8?B?UVJBcHNiQmlqc29HUllJOWZ5RVBla2dKZ2M1Nm90b2VBeDZWazlmenJ3M3BZ?=
 =?utf-8?B?UlZVbzhua2hrZ2RiMXkzRWc3U2tTeCtuVktJbFlEcWYzcWNwZnJjdFZ5MmRP?=
 =?utf-8?B?cXhyNGRhRDNqNkFGdUswRSt4R2dlNjYvT092a0tqanl1YnJ4S01odUhudUJp?=
 =?utf-8?B?alp4NUNMYWpRek9kcG4xank1OVlVZ0VGTjk3cWE1ZVJXalIvc3hsWEZwM0ht?=
 =?utf-8?B?c0xmVUlhemEzcThnbkJ0TVhYb2Z5WmhrZ2RTMC9INjlXYzJDUzVERlB4NmNz?=
 =?utf-8?B?VDdZRjZKSUFHN2krUVdkU29hZ3RqcTJVZ1NXZE1KU2hTRm5XZ3Zwd3lLSnVp?=
 =?utf-8?Q?0Gs5qeiiqfKbuUvAmYnJMeE0Q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e251f3da-41f9-4647-8e96-08dcccad787e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 06:47:40.2418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CxbeENPqmSlXUSDzhelWavBUFOAPa8j8jGTnxgWS65NAqHkKli7XphGgGKrndfJ8nNhePz09XflSxOZiaB+YkpfS5Yr6V2l63FDIP7/85Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2FtaWwgS29uaWVjem55
IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0
ZW1iZXIgMywgMjAyNCA1OjM0IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogQm9tbXUsIEtyaXNobmFpYWggPGtyaXNobmFpYWguYm9tbXVAaW50ZWwuY29tPjsg
RW1pbCBWZWxpa292DQo+IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+OyBHaGltaXJheSwgSGlt
YWwgUHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSB0ZXN0cy9jb3JlX3NldG1hc3RlcjogSGFuZGxlIHRoZSB0ZXN0IGV2ZW4g
aWYgY2FyZHMgYXJlDQo+IG5vbi1jb250aW51b3VzDQo+IA0KPiBIaSBCb21tdSwsDQo+IE9uIDIw
MjQtMDktMDMgYXQgMDg6MzI6MDAgKzAwMDAsIEJvbW11LCBLcmlzaG5haWFoIHdyb3RlOg0KPiA+
DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBLYW1p
bCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiBTZW50
OiBUaHVyc2RheSwgQXVndXN0IDIyLCAyMDI0IDEwOjE2IFBNDQo+ID4gPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IENjOiBCb21tdSwgS3Jpc2huYWlhaCA8a3Jpc2hu
YWlhaC5ib21tdUBpbnRlbC5jb20+OyBFbWlsIFZlbGlrb3YNCj4gPiA+IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+OyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+ID4gPiA8aGltYWwucHJhc2Fk
LmdoaW1pcmF5QGludGVsLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRlc3RzL2Nv
cmVfc2V0bWFzdGVyOiBIYW5kbGUgdGhlIHRlc3QgZXZlbiBpZg0KPiA+ID4gY2FyZHMgYXJlIG5v
bi1jb250aW51b3VzDQo+ID4gPg0KPiA+ID4gSGkgQm9tbXUsDQo+ID4gPiBPbiAyMDI0LTA4LTEy
IGF0IDEwOjU0OjQzICswNTMwLCBCb21tdSBLcmlzaG5haWFoIHdyb3RlOg0KPiA+ID4gPiBBbHRo
b3VnaCBtb3N0IG9mIHVzZXJzcGFjZSBhc3N1bWVzIGRybSBjYXJkcyB0byBiZSBwb3B1bGF0ZWQN
Cj4gPiA+ID4gY29udGlub3VzbHksDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gUmVtb3ZlIGJsYW5r
IGxpbmUuDQo+ID4gSSB3aWxsIHJlbW92ZQ0KPiA+ID4NCj4gPiA+ID4gdGhpcyBhc3N1bXB0aW9u
IG1heSBub3QgYmUgYWx3YXlzIHRydWUuIEFmdGVyIGhvdCB1bnBsdWdpbmcgYW5kDQo+ID4gPiA+
IHJlcGx1Z2luZyBvZiBjYXJkDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gUmVtb3ZlIGJsYW5rLg0K
PiA+IEkgd2lsbCByZW1vdmUNCj4gPiA+DQo+ID4gPiA+IHRoZSBjYXJkIG1heSBiZSBub24tY29u
dGlub3VzLiAgVG8gYWRkcmVzcyBzdWNoIHNjZW5hcmlvcyB3aGVyZQ0KPiA+ID4gPiB0aGUgY2Fy
ZHMgY2FuIGJlIG5vbi1jb250aW5vdXMNCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBSZW1vdmUgYmxh
bmsuDQo+ID4gSSB3aWxsIHJlbW92ZQ0KPiA+ID4NCj4gPiA+ID4gbW9kaWZ5IHRoZSB0d2Vha19w
ZXJtIGZ1bmN0aW9uIHRvIGxvb3AgYWxsIHBvc3NpYmxlDQo+ID4gPiA+IGNhcmRudW1iZXJzKGNh
cmQwLWNhcmQyNTUpIHRvIGNvbmZpcm0gYXJlIHRoZXkgcG9wdWxhdGVkIG9yIG5vdC4NCj4gPiA+
IC0tLS0tXg0KPiA+ID4gcy9jYXJkbnVtYmVycy9jYXJkIG51bWJlcnMvDQo+ID4gSSB3aWxsIGNo
YW5nZXMNCj4gPiA+DQo+ID4gPiBpbWhvIHRlc3QgaXMgY2hlY2tpbmcgb25seSBmaXJzdCBjYXJk
IHNvIGxvb3BpbmcgYWxsIGlzIG5vdCBvcHRpbWFsLg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
UHJvYmxlbSBEZXNjcmlwdGlvbjoNCj4gPiA+ID4gVGhlIHRlc3QgZmFpbHMgYWZ0ZXIgcnVubmlu
ZyB0aGUgYGNvcmVfaG90dW5wbHVnQGhvdCpgIHN1YnRlc3QsDQo+ID4gPiA+IHdoZXJlDQo+ID4g
PiA+IGNhcmQwIGlzIG1pc3NpbmcuDQo+ID4gSGVyZSBjYXJkMCBpcyBwb3B1bGF0ZWQgYXMgY2Fy
ZDENCj4gPiA+DQo+ID4gPiBpbWhvIHRoaXMgY291bGQgYmUgZGlzY3Vzc2VkIGlmIHRoYXQgaXMg
b2sgb3IgZHJpdmVyIGVycm9yLCBpbWhvDQo+ID4gPiB2YWxpZCBjYXNlIHdvdWxkIGJlIHRvIGhh
dmUgbXVsdGktY2FyZCBhbmQgdW5wbHVnaW5nIGZpcnN0Lg0KPiA+ID4NCj4gPiA+ID4gVGhpcyBs
ZWFkcyB0byBhIGZhaWx1cmUgaW4gdGhlIHN1YnNlcXVlbnQgYG1hc3Rlci1kcm9wLXNldC11c2Vy
YCB0ZXN0Lg0KPiA+ID4gPg0KPiA+ID4gPiBDb21tYW5kIHNlcXVlbmNlIGZvciByZXByb2R1Y2lu
ZyB0aGUgaXNzdWU6DQo+ID4gPiA+IC0gQ2hlY2sgYXZhaWxhYmxlIGNhcmRzOiBgbHMgL2Rldi9k
cmkvYA0KPiA+ID4gPiAJLSBPdXRwdXQ6IGJ5LXBhdGggIGNhcmQwICByZW5kZXJEMTI4DQo+ID4g
PiA+IC0gUnVuIHRoZSB0ZXN0OiBgIyAuL2NvcmVfaG90dW5wbHVnIC0tciBob3RyZWJpbmQtbGF0
ZWNsb3NlYA0KPiA+ID4gPiAtIENoZWNrIGFnYWluOiDigJhscyAvZGV2L2RyaS/igJkNCj4gPiA+
ID4gCS0gT3V0cHV0IGFmdGVyIGZhaWx1cmU6IGJ5LXBhdGggIGNhcmQxICByZW5kZXJEMTI5DQo+
ID4gPg0KPiA+ID4gcy9mYWlsdXJlL2NvcmVfaG90dW5wbHVnIGZhaWx1cmUvDQo+ID4gSSB3aWxs
IGNoYW5nZQ0KPiA+ID4NCj4gPiA+ID4gLSBSdW4gdGhlIHRlc3Q6IGAjIC4vY29yZV9zZXRtYXN0
ZXIgLS1yIG1hc3Rlci1kcm9wLXNldC11c2VyYA0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGZhaWx1
cmVzIG9uIGJvdGggWEUgYW5kIGk5MTUgZm9yIGFib3ZlIHNlcXVlbmNlLg0KPiA+ID4gPg0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBCb21tdSBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGlu
dGVsLmNvbT4NCj4gPiA+ID4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwu
Y29tPg0KPiA+ID4gPiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hp
bWlyYXlAaW50ZWwuY29tPg0KPiA+ID4gPiBDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25p
ZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIHRlc3RzL2NvcmVf
c2V0bWFzdGVyLmMgfCA1ICsrKy0tDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdGVz
dHMvY29yZV9zZXRtYXN0ZXIuYyBiL3Rlc3RzL2NvcmVfc2V0bWFzdGVyLmMgaW5kZXgNCj4gPiA+
ID4gOWMyMDgzZjY2Li5hMjc1OGUyZjIgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL3Rlc3RzL2NvcmVf
c2V0bWFzdGVyLmMNCj4gPiA+ID4gKysrIGIvdGVzdHMvY29yZV9zZXRtYXN0ZXIuYw0KPiA+ID4g
PiBAQCAtMTE2LDkgKzExNiwxMCBAQCBzdGF0aWMgdW5zaWduZWQgdHdlYWtfcGVybSh1aW50OF90
DQo+ID4gPiA+ICpzYXZlZF9wZXJtLA0KPiA+ID4gdW5zaWduZWQgbWF4X3Blcm0sIGJvb2wgc2F2
ZSkNCj4gPiA+ID4gIAlmb3IgKGkgPSAwOyBpIDwgbWF4X3Blcm07IGkrKykgew0KPiA+ID4gPiAg
CQlzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCksICIvZGV2L2RyaS9jYXJkJXUiLCBpKTsNCj4g
PiA+ID4NCj4gPiA+ID4gLQkJLyogRXhpc3RpbmcgdXNlcnNwYWNlIGFzc3VtZXMgdGhlcmUncyBu
byBnYXBzLCBkbyB0aGUgc2FtZS4gKi8NCj4gPiA+ID4gKwkJLyogVXNlcnNwYWNlIGNhbm5vdCBh
bHdheXMgaGF2ZSBjb250aW51b3VzIGNhcmQwLi4uTiBkdWUgdG8NCj4gPiA+ID4gKwkJICogZHlu
YW1pYyB1bmxvYWRpbmcgb3IgcmVtb3ZhbCBvZiBjYXJkcyAqLw0KPiA+ID4gPiAgCQlpZiAoc3Rh
dChwYXRoLCAmc3QpICE9IDApDQo+ID4gPiA+IC0JCQlicmVhazsNCj4gPiA+ID4gKwkJCWNvbnRp
bnVlOw0KPiA+ID4NCj4gPiA+IGltaG8gdGhpcyBpcyBvayBidXQgeW91IHNob3VsZCBhbHNvIGJy
ZWFrIGFmdGVyIGZpcnN0IHNhdmUvcmVzdG9yZQ0KPiA+ID4ganVzdCBiZWZvcmUgZW5kIG9mIGZv
ciBsb29wLCBzbyBubyBuZWVkIGZvciBzZXR0aW5nIGFsbCBwZXJtcyB3aGVuIHlvdSB3aWxsDQo+
IHRlc3Qgb25seSBmaXJzdCBvbmUuDQo+ID4gPg0KPiA+ID4gQWxzbyBpbWhvIHlvdSBzaG91bGQg
ZmlsbCBpbmZvIGluIHNhdmVkX3Blcm0gYWJvdXQgd2hpY2ggY2FyZCB3YXMNCj4gPiA+IGZvdW5k
IGFuZCB1c2UgaXQgaW5zdGVhZCBvZiBjYWxsaW5nIF9fZHJtX29wZW5fZHJpdmVyKCkuDQo+ID4g
Pg0KPiA+DQo+ID4ga2JvbW11QGtib21tdS1kZXNrOn4veGVfcHVibGljL2lndC1ncHUtdG9vbHMk
IGdpdCBkaWZmIGRpZmYgLS1naXQNCj4gPiBhL3Rlc3RzL2NvcmVfc2V0bWFzdGVyLmMgYi90ZXN0
cy9jb3JlX3NldG1hc3Rlci5jIGluZGV4DQo+ID4gYTI3NThlMmYyLi5iMGJmNGE1ZDMgMTAwNjQ0
DQo+ID4gLS0tIGEvdGVzdHMvY29yZV9zZXRtYXN0ZXIuYw0KPiA+ICsrKyBiL3Rlc3RzL2NvcmVf
c2V0bWFzdGVyLmMNCj4gPiBAQCAtMTM4LDYgKzEzOCw5IEBAIHN0YXRpYyB1bnNpZ25lZCB0d2Vh
a19wZXJtKHVpbnQ4X3QgKnNhdmVkX3Blcm0sDQo+IHVuc2lnbmVkIG1heF9wZXJtLCBib29sIHNh
dmUpDQo+ID4gICAgICAgICAgICAgICAgICAqIGZhaWx1cmUgbWF5IGJlIGlycmVsZXZhbnQuDQo+
ID4gICAgICAgICAgICAgICAgICAqLw0KPiA+ICAgICAgICAgICAgICAgICBjaG1vZChwYXRoLCBz
dC5zdF9tb2RlKTsNCj4gDQo+IEp1c3Qgbm90aWNlZCBhIHByb2JsZW0gaGVyZSwgcmV0dXJuIGNv
ZGUgZm9yIGNobW9kKCkgaXMgbm90IGNoZWNrZWQuLi4NCg0Kcm9vdEBrYm9tbXUtZGVzazovaG9t
ZS9rYm9tbXUveGVfcHVibGljL2lndC1ncHUtdG9vbHMjIGdpdCBkaWZmDQpkaWZmIC0tZ2l0IGEv
dGVzdHMvY29yZV9zZXRtYXN0ZXIuYyBiL3Rlc3RzL2NvcmVfc2V0bWFzdGVyLmMNCmluZGV4IGEy
NzU4ZTJmMi4uM2U1MDZiNWJmIDEwMDY0NA0KLS0tIGEvdGVzdHMvY29yZV9zZXRtYXN0ZXIuYw0K
KysrIGIvdGVzdHMvY29yZV9zZXRtYXN0ZXIuYw0KQEAgLTEwNywxMyArMTA3LDE1IEBAIHN0YXRp
YyB2b2lkIGNoZWNrX2Ryb3Bfc2V0KHZvaWQpDQogICAgICAgIGRybV9jbG9zZV9kcml2ZXIobWFz
dGVyKTsNCiB9DQoNCi1zdGF0aWMgdW5zaWduZWQgdHdlYWtfcGVybSh1aW50OF90ICpzYXZlZF9w
ZXJtLCB1bnNpZ25lZCBtYXhfcGVybSwgYm9vbCBzYXZlKQ0KK3N0YXRpYyBpbnQgdHdlYWtfcGVy
bSh1aW50OF90ICpzYXZlZF9wZXJtLCB1bnNpZ25lZCBtYXhfcGVybSwgYm9vbCBzYXZlKQ0KIHsN
CiAgICAgICAgY2hhciBwYXRoWzI1Nl07DQogICAgICAgIHN0cnVjdCBzdGF0IHN0Ow0KLSAgICAg
ICB1bnNpZ25lZCBpOw0KKyAgICAgICBpbnQgaTsNCg0KICAgICAgICBmb3IgKGkgPSAwOyBpIDwg
bWF4X3Blcm07IGkrKykgew0KKyAgICAgICAgICAgICAgIGludCByZXQ7DQorDQogICAgICAgICAg
ICAgICAgc25wcmludGYocGF0aCwgc2l6ZW9mKHBhdGgpLCAiL2Rldi9kcmkvY2FyZCV1IiwgaSk7
DQoNCiAgICAgICAgICAgICAgICAvKiBVc2Vyc3BhY2UgY2Fubm90IGFsd2F5cyBoYXZlIGNvbnRp
bnVvdXMgY2FyZDAuLi5OIGR1ZSB0bw0KQEAgLTEzNyw3ICsxMzksMTIgQEAgc3RhdGljIHVuc2ln
bmVkIHR3ZWFrX3Blcm0odWludDhfdCAqc2F2ZWRfcGVybSwgdW5zaWduZWQgbWF4X3Blcm0sIGJv
b2wgc2F2ZSkNCiAgICAgICAgICAgICAgICAgKiAtIF9fZHJtX29wZW5fZHJpdmVyKCkgY2FuIG9w
ZW4gYW5vdGhlciBkZXZpY2UsIGFrYSB0aGUNCiAgICAgICAgICAgICAgICAgKiBmYWlsdXJlIG1h
eSBiZSBpcnJlbGV2YW50Lg0KICAgICAgICAgICAgICAgICAqLw0KLSAgICAgICAgICAgICAgIGNo
bW9kKHBhdGgsIHN0LnN0X21vZGUpOw0KKyAgICAgICAgICAgICAgIHJldCA9IGNobW9kKHBhdGgs
IHN0LnN0X21vZGUpOw0KKyAgICAgICAgICAgICAgIGlmIChyZXQpDQorICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KKw0KKyAgICAgICAgICAgICAgIGlmIChzYXZlKQ0KKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIGk7DQogICAgICAgIH0NCiAgICAgICAgcmV0dXJuIGk7
DQogfQ0KQEAgLTE2Miw3ICsxNjksNyBAQCBpZ3RfbWFpbg0KDQogICAgICAgIGlndF9zdWJ0ZXN0
X2dyb3VwIHsNCiAgICAgICAgICAgICAgICB1aW50OF90IHNhdmVkX3Blcm1bMjU1XTsNCi0gICAg
ICAgICAgICAgICB1bnNpZ25lZCBudW07DQorICAgICAgICAgICAgICAgaW50IG51bTsNCg0KICAg
ICAgICAgICAgICAgIC8qIFVwb24gZHJvcHBpbmcgcm9vdCB3ZSBlbmQgdXAgYXMgcmFuZG9tIHVz
ZXIsIHdoaWNoDQogICAgICAgICAgICAgICAgICogYSkgaXMgbm90IGluIHRoZSB2aWRlbyBncm91
cCwgYW5kDQpyb290QGtib21tdS1kZXNrOi9ob21lL2tib21tdS94ZV9wdWJsaWMvaWd0LWdwdS10
b29scyMNCg0KdGhpcyBjaGFuZ2VzIHlvdXIgZXhjZXB0aW5nIGZvciBjaG1vZCByZXR1cm4gDQo+
IA0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgaWYgKHNhdmUpDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIGk7DQo+IA0KPiBJdCBzaG91bGQgYWxzbyBhcHBseSBmb3IgcmVz
dG9yaW5nLCBub3Qgb25seSBzZXR0aW5nLg0KPiBJbWhvIGFsc28gc2F2ZSBhbiBpbmRleCBhdCB3
aGljaCB5b3UgZm91bmQgYSBjYXJkIGZvciB0ZXN0aW5nIHNvIHlvdSBjb3VsZA0KPiByZXN0b3Jl
IGl0IGxhdGVyIGFuZCBhbHNvIHVzZSBpdCBmb3Igb3BlbmluZyBmb3IgdGVzdGluZy4NCg0KZm9y
IHJlc3RvcmluZyBpdCBpcyBub3QgcmVxdWlyZWQgSSBiZWxpZXZlIGJlY2F1c2Ugd2UgYXJlIHBh
c3NpbmcgdGhlIG51bWJlciBvZiBjYXJkcyB3aGljaCB3ZSBnb3QgZHVyaW5nIHRoZSBzYXZlKGku
ZSBJIHZhbHVlIGluIGZvciBsb29wIGluIHR3ZWFrX3Blcm0pDQoNClJlZ2FyZHMsDQpLcmlzaG5h
Lg0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gICAgICAgICB9DQo+ID4gICAgICAg
ICByZXR1cm4gaTsNCj4gPiAgfQ0KPiA+IGtib21tdUBrYm9tbXUtZGVzazp+L3hlX3B1YmxpYy9p
Z3QtZ3B1LXRvb2xzJA0KPiA+DQo+ID4gdGhpcyBpcyB0aGUgY2hhbmdlcyB5b3VyIGV4Y2VwdGlu
ZyByaWdodCA/DQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IEtyaXNobmEuDQo+ID4NCj4gPiA+IFJl
Z2FyZHMsDQo+ID4gPiBLYW1pbA0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gIAkJaWYgKHNhdmUp
IHsNCj4gPiA+ID4gIAkJCS8qIFNhdmUgYW5kIHRvZ2dsZSAqLw0KPiA+ID4gPiAtLQ0KPiA+ID4g
PiAyLjI1LjENCj4gPiA+ID4NCg==
