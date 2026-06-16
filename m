Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA53CD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 02:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B7010E48A;
	Tue, 16 Jun 2026 02:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvLW/bxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F68E10E48A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 02:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781578302; x=1813114302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=QkyEdF7jWGdi4nQLM0YQ2ryXGQ4QW74oU5MfoxnxfjI=;
 b=bvLW/bxgzsDGKvnJyrk2Q2AyYC0NbEeGMeEz1RdXIkRfNQ2yGlk+6PlV
 qUePs438jmqQ0Ce2cB/xWQaNaSmfpp/q/uvof7bQqIIr3WM4rpK+CGJVe
 fe8avA7ZsN5ncBoF5ojZjbmcFdiytNMiGfnLezRyE5GwXAq3evWBUcgEC
 RGblpFzVFFdDx1cy4KpzYHsvtGZ9TJ48WkdESB/MUxCY6pSYJrU0pLX7o
 4Fxm1NepAvfJwkzlx4PAFgiSBOG9YS+fuvmuEXgt/SpZQX1jQhG08T7d6
 ps2VHN2nVhYnkzBr6rUeVQycd4VGLirR+EptOihtj740JQ3l3TGhxBKq3 g==;
X-CSE-ConnectionGUID: S8TnhQpnRC+VOjUsVjRcqQ==
X-CSE-MsgGUID: jm8AuegAR22axcCBePAI4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82230842"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208,217";a="82230842"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 19:51:41 -0700
X-CSE-ConnectionGUID: svKtgptwRmalZ0JCQ+f8sA==
X-CSE-MsgGUID: 2ktrOobzRYuD769bkGwRjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
 d="scan'208,217";a="252761058"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 19:51:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 19:51:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 19:51:40 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 19:51:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hza8TvYF/Q8Xcl2cse0MboXza5Ogcu3pPOURJXm8VJPmGhPYe1JEjDH6Jsd4S7sLmIYoK265ViUnI+64pC8+h+OxsBSZMh5BQ0/sloR9KgJrhpXmAo6uZqX3YyUgyF5zJCMP1W/gzCLrs6dvx0WBUIds1nBJkg33WP1FRzxUH1MYXX9rcVQVYhHkSx74mia7+k+DFedfJLiXCGlkG+nDG54ISVfBehbmomBMuWHBrkhWdXmzUN4O1gmFhUtym49sL+fhavDgZp4cbGSE3fUwqIds3njwFMPajH9CgPdlqNO8cHulXh2ocmIAazydkz2Ah2IFQFGnNEMkwPZ6wvx8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkyEdF7jWGdi4nQLM0YQ2ryXGQ4QW74oU5MfoxnxfjI=;
 b=zMGikI7oiWPkGcMjnSJCCPbzUzsWXK81Y8Smq4pulpsCe3lzbTxIl/hksXIR49uPWBBi34/JZjDeE+IY+XHIx9Bm4TaZEgdpefpuRMxn3Zq3a3tqdyjEYUk++GY54rrZJiQ803HgksbgUwBfKKteW4oEKXRV1mNN4pundts+Wotcj3ogLEUFwx8uyzwI/zWESO86vHGxf86wijXWt5RDCRvM1JKnAQV7tIQULdo7e+zAMnenDxJ2wCkDeGmVTziLaFCwFBGpmRenj+Z56kv3WXvDbLJhh6XjUYPhZBTlZmkXXM7O/evFlt6PaB7hmKK9xgQXKKPD7bArwyocDLCpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20)
 by DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 02:51:37 +0000
Received: from SN7PR11MB6827.namprd11.prod.outlook.com
 ([fe80::5f17:f25c:383a:a5e8]) by SN7PR11MB6827.namprd11.prod.outlook.com
 ([fe80::5f17:f25c:383a:a5e8%7]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 02:51:37 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2ttc19waXBl?=
 =?utf-8?B?X2NyY19iYXNpYzogYWRkIG1zdCBzdXNwZW5kLXJlc3VtZSB0ZXN0IChyZXY3?=
 =?utf-8?Q?)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMva21zX3BpcGVfY3Jj?=
 =?utf-8?Q?=5Fbasic:_add_mst_suspend-resume_test_(rev7)?=
Thread-Index: AQHc8YwmsRbDZeZBQkK54EfL9GbPlLZAkikD
Date: Tue, 16 Jun 2026 02:51:37 +0000
Message-ID: <SN7PR11MB68273FA90466A7976C2D6F92DAE52@SN7PR11MB6827.namprd11.prod.outlook.com>
References: <20260601055545.1982351-1-kunal1.joshi@intel.com>
 <178029370217.28824.17384439981063325200@6beec6c84f66>
In-Reply-To: <178029370217.28824.17384439981063325200@6beec6c84f66>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6827:EE_|DM4PR11MB6551:EE_
x-ms-office365-filtering-correlation-id: 55d90a5f-9376-4ffb-16a8-08decb522f79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|5023799004|18002099003|56012099006|11063799006|8096899003|13003099007|38070700021|22082099003;
x-microsoft-antispam-message-info: W1zlqVkX2pt63ShycYPTiGxoAy9GWlleBcZn6lxaYxyzlPhjNT01JaBenSVbnmqFma2VfFN2F34VXX38BIh2PSxzlITZlsiWJRckEWaAK7n/NhlLFZ78Xw2ZVS/uHkIVDq3ZpYU/ieFPE+Z3NjW0+BJlnhxN9NR1Ocdtwk67ffv9WFgmaVz/aMSzqe0hA/kzYZHDx2z1wA5c9WcYjYiVdd3RMC4nifrwe0kp27nRmFg5H+Jn1w055fPvCH+urULKMz7SroZVO++fkXozkHug8jzC802CreJ68gtekDNn0NooR4h6Ji0Jm6lPaT1Dfz++NXNIZ5IIB/v0ZRflF5LzXnTLJ/bxfP7bYX9ENOhYx5Ik4uII5InQy3Ou372r1xSmHbHjemHyp8bp3JMuuExx4xGX9iOQsTmrugT5nrXL/JycYfsiO0dR8SknBfZlXk2WrvZ4EPkhvgnTzyVaQOaQI0FVHKFUsIlzgGjlpEH6VlW72En+7Xg1/wmJ1effVuja0LwlxAxoMNsu9qBT02K1CuVpRbnth7i/w4Cy/wKMq5f40SyOVt6HiV05/IK1TF6UAIqQ8+0ygmk1VGiXklryToxCneZsBAUiANIWo+5i7V7ucWXnciKnULp4VeYz5CWiUcQF9xNLqXgUJzYt9FV7CdYlc/JFiKvvPg3MNGvLh2VlwE5bmKM9YxSX0JqD48ndk9gavXFtbqaJoWW7zFoiCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6827.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(5023799004)(18002099003)(56012099006)(11063799006)(8096899003)(13003099007)(38070700021)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlZPS1U2aDZWSFNXQVd5MUFNa1RUYWMrOGQxMGJLUkpoMjhTQlU0Qm1xUHBw?=
 =?utf-8?B?N1N0ZGZTY0JwNkVod3BybkFuS3BPL2NZWFkyZEJPeHZsN0Jia1g0QjlkbHlt?=
 =?utf-8?B?TnZ4U3RxWUNnTmJLWHdZaEQzRUkwNC94UFZmQjdmMnNkNlFMeFpMTmxNbi9o?=
 =?utf-8?B?elU4SWlYdVlDTnhEaEtaMHlCUzZIVFBGbWZOT2hsNzVOWmFNRW9DVUdUaUxq?=
 =?utf-8?B?SnFUbEYyaDJGQmFETlBCd2MzRWtFdHlvdkZ6NFcvY2dzVURKR2E2ZEtIM0ow?=
 =?utf-8?B?bEc2S3VsMnhFMDZ6RFlGVGY0VWJFMDdEdWZGYzlqVFhreDBwMDIxMDdOMHdt?=
 =?utf-8?B?WkpDUGFUZjBQVnBLbzhNTW94TTdyMGcveFZmanA4K1BLQVJ6bURXcTh6eDhR?=
 =?utf-8?B?Ynl2THZtV3VpcmQxZzFoMXBPNGN1MmxWVDhNM3Z4MXlnUE5iemJWbHNkKy9w?=
 =?utf-8?B?SVBsSktzYk53Mlc1VDRzYWsrUW9JMnJiOUZrVlpuS2x6VGFuY085UGhVMVBs?=
 =?utf-8?B?NzdiSWtlRkRFeHZUOUJZYWpRWDJCaTR3MDVlQ2Ziamc0MzdPZXhaRXlhVWJx?=
 =?utf-8?B?YVZwZmExYkJhL3UyQ1pOSzd1NnVJTmZzWmxnSXBLUUdsWjZxQ0RtdkZtQ1hF?=
 =?utf-8?B?WWNmbFBKRmJjUDlJNkFMYWhBNExGb1dMdm8wVEx0TGQ4L1QxQlI1SDd3TmI3?=
 =?utf-8?B?cjExcy9FenhDUHdQd2pPM3JvQW5JV3NaWlFOdDVEY0xkZmhjSThHdVZ1TEJ4?=
 =?utf-8?B?QzRrL0cyK1RwQTl3TUZiaDMzR3lhenY2aHhxREsrMk1JK2JOQW8yak03NGha?=
 =?utf-8?B?RDdsb1JXcnFjSWJ4TmxoS0gxNDRsRkFyOHo3Zk1zU0lXa3VoV3kweVg3VTBv?=
 =?utf-8?B?bm5xTDlIMCtWODdzaUc5eDQ1OEhFZ0dKUEVLbUtySXJHZGMrR3htTFRrQ0h4?=
 =?utf-8?B?TGVic2pGNTdyRmdjSmlzMm1sMlYvT2JmNktzSnVTOUdpV0hTa05XN3BJY0pE?=
 =?utf-8?B?amlxYTBDWVRmTVZsOGQxcE5OcGw3MDJ3bkp4dUhEVTM4WklsU3FscUd5TDlI?=
 =?utf-8?B?TUMyYWxaRkc2MTRuQmFwSHErU3hXUWkvZ1h1cC9LZTFJaU9CMzVKMnVPV2ZS?=
 =?utf-8?B?dGU1aWdhSjhLUHNmMXhDWWtwK3gvVkU5cHM1MGc2Y0w4WlZEK3ozanZLRFY1?=
 =?utf-8?B?ZGs5Znlleko2Y1RZWk1sMkViWi95TTg4ZjV5SjY4SFd2cU5kNEZ1ZFQ3KzJp?=
 =?utf-8?B?MTRWdzlZZTF0OTZ5a3g4dEJwaUFOcjFxb1BSaC9xNW1pVnQ0OExCYVcxcXll?=
 =?utf-8?B?WEx1SjNRUlI3V0lHMFE5K2VuZnZrWXZwcnFhZjVCVWZNSGVpT1dUaWlUeGtE?=
 =?utf-8?B?ZXUycUJ2MnpHbktqblh3VWx1c3FRWnppRnVoaC92TnhKUDlYVHpmbUF6Ni9F?=
 =?utf-8?B?cFpnRTAvU0NGOHVGaEF4Ny9mNktNc0hiZzFTRFd1UGtvckd1SytPVW9UUmMr?=
 =?utf-8?B?ejVVak9GZnVvY0VwR3IzQXpUNjl0L2pzUTZ2MzNSS3l3K2lmVExlWTlFS1lY?=
 =?utf-8?B?OVYzNXFacHlYelVualFUMlZ4WlN4dmFOZEM2dnNRbVJPUFpBWllvWEJxZnUw?=
 =?utf-8?B?R3ZwcjhNZmtrMWIvdm05SW93ZG91V0EwRXlSejdWV0xXbmE4ckQxV0Q3bEoz?=
 =?utf-8?B?MjdILzlRYXJ1OFpHZHJ2NmI3RnpYdHd3RkE4Y3lIMTNQVmNWWFhCMENFUFlV?=
 =?utf-8?B?ODZsbUc2NjlNdWxzbmF0ckJ2L244YitEbkhML2NlNXJSMldkWEtNcld6UkRv?=
 =?utf-8?B?SmFneUVGdU5zb0FnaDZIZFJpb0MyNUpZWEF1eDJlWjJpaDVSNW9mMjJBdlBh?=
 =?utf-8?B?WUhkMTV3eVdhNHlBTmR5MGo0ZFJ2Nis2bnBFNGVISUJLWlh4ZnQvVER3S2hI?=
 =?utf-8?B?L1F0MjgrSWwrT1gyU3NOY09VanVOZElHMVFtYS9mdk9CTmQ0QzJpTGNWbHRx?=
 =?utf-8?B?Ullld2Q5eW52TjVxb3ZSR0VzVTJ1eFNYZG5CQnBuMUJWMGsxSldCcjU2amlX?=
 =?utf-8?B?WVZqODFEMndvZGJ0MGdOMVk4TUJFVDQyYkpmNEMrU0wxRE40eTE3bVFKdmhJ?=
 =?utf-8?B?K05HVjZuYVJwd2pvVTRpbEZmUStCaG1tbGpQL3Rvc0xxb3VpQ1FJWll2ajFr?=
 =?utf-8?B?TXlOeW5Cb1NlbHRHbGUyUEoxQXowejZNR2Z3UmpGMXhNOS9nQk0rc2V2SXl4?=
 =?utf-8?B?UldORXI2a01OTVhvN25YSjFDelA4dDhGc0lnL29YTTF5UWN3aGVveURkakww?=
 =?utf-8?Q?dh+HhuiqxzJwn16iLZ?=
Content-Type: multipart/alternative;
 boundary="_000_SN7PR11MB68273FA90466A7976C2D6F92DAE52SN7PR11MB6827namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: STUPHRbXAeZ65P2hZ6KJbq3rSA59KE0x555z/vF1nt8CprCLy2nPemndJt/WPUortspGQdrpnJMxvikzc+tYeZX8htP3pLAGDLHxjubCHXnMcPFT0WB9wxTPHeyQ95YZYguJDrxQnQcnzPNjvf7nSaVIaselsv+vplFqnedYA5Jjyo9HcHuUmLMJQZJEybhFKiurA2PuCZyJWeIaWnAI9UvzMU9z1TucHmVxvld+sIuQqcnD78N9cYbnHeCmCeXeg95HF+EBcfR2fzeHBLmN/Q1tzAe+6mTJUQ78ryk/CZa+g3mBicUcmmuFZk48MuyZZNmBSisSsy38thKH6lVVaw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6827.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d90a5f-9376-4ffb-16a8-08decb522f79
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 02:51:37.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9SqbQSTDucQcNjJcywWnPNtokKAudKFFZsSAlugHfvHYJjBjnQFc93AKBJPpf6hi7krDypA6NJSYHerlx407VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6551
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

--_000_SN7PR11MB68273FA90466A7976C2D6F92DAE52SN7PR11MB6827namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkZhaWx1cmVzIHJlcG9ydGVkIGFyZSB1bnJlbGF0ZWQgdG8gdGhpcyBzZXJpZXMu
DQoNClRoYW5rcyBhbmQgUmVnYXJkcw0KS3VuYWwgSm9zaGkNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQpGcm9tOiBQYXRjaHdvcmsgPHBhdGNod29ya0BlbWVyaWwuZnJlZWRlc2t0
b3Aub3JnPg0KU2VudDogTW9uZGF5LCBKdW5lIDEsIDIwMjYgMTE6MzEgQU0NClRvOiBKb3NoaSwg
S3VuYWwxIDxrdW5hbDEuam9zaGlAaW50ZWwuY29tPg0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnIDxpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NClN1YmplY3Q6IOKclyBY
ZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2ttc19waXBlX2NyY19iYXNpYzogYWRkIG1zdCBz
dXNwZW5kLXJlc3VtZSB0ZXN0IChyZXY3KQ0KDQpQYXRjaCBEZXRhaWxzDQpTZXJpZXM6DQp0ZXN0
cy9rbXNfcGlwZV9jcmNfYmFzaWM6IGFkZCBtc3Qgc3VzcGVuZC1yZXN1bWUgdGVzdCAocmV2NykN
ClVSTDoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU4MDkxLw0K
U3RhdGU6DQpmYWlsdXJlDQpEZXRhaWxzOg0KaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvaW50ZWwteGUvSUdUUFdfMTUyNzUvaW5kZXguaHRtbA0KQ0kgQnVnIExvZyAtIGNoYW5nZXMg
ZnJvbSBYRUlHVF84OTQzX0JBVCAtPiBYRUlHVFBXXzE1Mjc1X0JBVA0KU3VtbWFyeQ0KDQpGQUlM
VVJFDQoNClNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIFhFSUdUUFdfMTUyNzVf
QkFUIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KdmVyaWZpZWQgbWFudWFsbHkuDQoNCklmIHlvdSB0
aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hh
bmdlcw0KaW50cm9kdWNlZCBpbiBYRUlHVFBXXzE1Mjc1X0JBVCwgcGxlYXNlIG5vdGlmeSB5b3Vy
IGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cg
dGhlbQ0KdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVj
ZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQoNClBhcnRpY2lwYXRpbmcgaG9zdHMgKDEzIC0+IDEp
DQoNCkVSUk9SOiBJdCBhcHBlYXJzIGFzIGlmIHRoZSBjaGFuZ2VzIG1hZGUgaW4gWEVJR1RQV18x
NTI3NV9CQVQgcHJldmVudGVkIHRvbyBtYW55IG1hY2hpbmVzIGZyb20gYm9vdGluZy4NCg0KTWlz
c2luZyAoMTIpOiBiYXQtYm1nLTEgYmF0LWxubC0yIGJhdC1sbmwtMSBiYXQtcHRsLTIgYmF0LXB0
bC12bSBiYXQtYm1nLXZtIGJhdC1hdHNtLTIgYmF0LWJtZy0zIGJhdC13Y2wtMSBiYXQtd2NsLTIg
YmF0LWJtZy0yIGJhdC1hZGxwLTcNCg0KQ2hhbmdlcw0KDQpObyBjaGFuZ2VzIGZvdW5kDQoNCkJ1
aWxkIGNoYW5nZXMNCg0KICAqICAgSUdUOiBJR1RfODk0MyAtPiBJR1RQV18xNTI3NQ0KICAqICAg
TGludXg6IHhlLTUxNTUtMTU4ZGUwMWM3MThlZDlkZDdjYjEyM2QwZGY1OWE2MDc3YmUyNjU3OSAt
PiB4ZS01MTY4LWY0YmE5MzJhYmI0NDIyYTYzYzcyYTI3MmIwMzg2Zjc0NWNlOWExMTkNCg0KSUdU
UFdfMTUyNzU6IDE1Mjc1DQpJR1RfODk0MzogODk0Mw0KeGUtNTE1NS0xNThkZTAxYzcxOGVkOWRk
N2NiMTIzZDBkZjU5YTYwNzdiZTI2NTc5OiAxNThkZTAxYzcxOGVkOWRkN2NiMTIzZDBkZjU5YTYw
NzdiZTI2NTc5DQp4ZS01MTY4LWY0YmE5MzJhYmI0NDIyYTYzYzcyYTI3MmIwMzg2Zjc0NWNlOWEx
MTk6IGY0YmE5MzJhYmI0NDIyYTYzYzcyYTI3MmIwMzg2Zjc0NWNlOWExMTkNCg==

--_000_SN7PR11MB68273FA90466A7976C2D6F92DAE52SN7PR11MB6827namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpIZWxsbyw8L2Rpdj4NCjxkaXYgY2xhc3M9ImVs
ZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZv
bnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsg
Zm9udC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxk
aXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRv
c19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpGYWls
dXJlcyByZXBvcnRlZCBhcmUgdW5yZWxhdGVkIHRvIHRoaXMgc2VyaWVzLjwvZGl2Pg0KPGRpdiBj
bGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0Vt
YmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwv
ZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0
b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVs
dmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDExcHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7
Ij4NClRoYW5rcyBhbmQgUmVnYXJkczwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2Yi
IHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNG
b250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEx
cHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkt1bmFsIEpvc2hpPC9kaXY+DQo8aHIgc3R5bGU9
ImRpc3BsYXk6IGlubGluZS1ibG9jazsgd2lkdGg6IDk4JTsiPg0KPGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTog
MTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGI+RnJvbTo8L2I+Jm5ic3A7UGF0Y2h3b3Jr
ICZsdDtwYXRjaHdvcmtAZW1lcmlsLmZyZWVkZXNrdG9wLm9yZyZndDs8YnI+DQo8Yj5TZW50Ojwv
Yj4mbmJzcDtNb25kYXksIEp1bmUgMSwgMjAyNiAxMTozMSBBTTxicj4NCjxiPlRvOjwvYj4mbmJz
cDtKb3NoaSwgS3VuYWwxICZsdDtrdW5hbDEuam9zaGlAaW50ZWwuY29tJmd0Ozxicj4NCjxiPkNj
OjwvYj4mbmJzcDtpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyAmbHQ7aWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDo8L2I+Jm5ic3A74pyXIFhlLkNJ
LkJBVDogZmFpbHVyZSBmb3IgdGVzdHMva21zX3BpcGVfY3JjX2Jhc2ljOiBhZGQgbXN0IHN1c3Bl
bmQtcmVzdW1lIHRlc3QgKHJldjcpDQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdj48Yj5QYXRjaCBEZXRhaWxz
PC9iPjwvZGl2Pg0KPHRhYmxlPg0KPHRib2R5Pg0KPHRyPg0KPHRkPg0KPGRpdj48Yj5TZXJpZXM6
PC9iPjwvZGl2Pg0KPC90ZD4NCjx0ZD4NCjxkaXY+dGVzdHMva21zX3BpcGVfY3JjX2Jhc2ljOiBh
ZGQgbXN0IHN1c3BlbmQtcmVzdW1lIHRlc3QgKHJldjcpPC9kaXY+DQo8L3RkPg0KPC90cj4NCjx0
cj4NCjx0ZD4NCjxkaXY+PGI+VVJMOjwvYj48L2Rpdj4NCjwvdGQ+DQo8dGQ+DQo8ZGl2PjxhIGhy
ZWY9Imh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU4MDkxLyIgaWQ9
Ik9XQTNlY2MzMTBmLWM2OTAtZmQ2YS1mMjUwLTcyOGMyNTYwN2I4OSIgY2xhc3M9Ik9XQUF1dG9M
aW5rIiBkYXRhLWF1dGg9Ik5vdEFwcGxpY2FibGUiPmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvMTU4MDkxLzwvYT48L2Rpdj4NCjwvdGQ+DQo8L3RyPg0KPHRyPg0KPHRk
Pg0KPGRpdj48Yj5TdGF0ZTo8L2I+PC9kaXY+DQo8L3RkPg0KPHRkPg0KPGRpdj5mYWlsdXJlPC9k
aXY+DQo8L3RkPg0KPC90cj4NCjx0cj4NCjx0ZD4NCjxkaXY+PGI+RGV0YWlsczo8L2I+PC9kaXY+
DQo8L3RkPg0KPHRkPg0KPGRpdj48YSBocmVmPSJodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9pbnRlbC14ZS9JR1RQV18xNTI3NS9pbmRleC5odG1sIiBpZD0iT1dBYjQwOTU3MTAtNjg2
ZC02MDdmLTlhM2EtMTIzMWFjODZhNTM5IiBjbGFzcz0iT1dBQXV0b0xpbmsiIGRhdGEtYXV0aD0i
Tm90QXBwbGljYWJsZSI+aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUv
SUdUUFdfMTUyNzUvaW5kZXguaHRtbDwvYT48L2Rpdj4NCjwvdGQ+DQo8L3RyPg0KPC90Ym9keT4N
CjwvdGFibGU+DQo8aDE+Q0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBYRUlHVF84OTQzX0JBVCAt
Jmd0OyBYRUlHVFBXXzE1Mjc1X0JBVDwvaDE+DQo8aDI+U3VtbWFyeTwvaDI+DQo8cCBzdHlsZT0i
bWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07Ij48Yj5GQUlMVVJFPC9iPjwvcD4N
CjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0b206IDFlbTsiPlNlcmlvdXMg
dW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIFhFSUdUUFdfMTUyNzVfQkFUIGFic29sdXRlbHkg
bmVlZCB0byBiZTxicj4NCnZlcmlmaWVkIG1hbnVhbGx5LjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4t
dG9wOiAxZW07IG1hcmdpbi1ib3R0b206IDFlbTsiPklmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQg
Y2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlczxicj4NCmludHJvZHVj
ZWQgaW4gWEVJR1RQV18xNTI3NV9CQVQsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkx
NS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW08YnI+DQp0byBk
b2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBv
c2l0aXZlcyBpbiBDSS48L3A+DQo8aDI+UGFydGljaXBhdGluZyBob3N0cyAoMTMgLSZndDsgMSk8
L2gyPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6IDFlbTsgbWFyZ2luLWJvdHRvbTogMWVtOyI+RVJS
T1I6IEl0IGFwcGVhcnMgYXMgaWYgdGhlIGNoYW5nZXMgbWFkZSBpbiBYRUlHVFBXXzE1Mjc1X0JB
VCBwcmV2ZW50ZWQgdG9vIG1hbnkgbWFjaGluZXMgZnJvbSBib290aW5nLjwvcD4NCjxwIHN0eWxl
PSJtYXJnaW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0b206IDFlbTsiPk1pc3NpbmcgKDEyKTogYmF0
LWJtZy0xIGJhdC1sbmwtMiBiYXQtbG5sLTEgYmF0LXB0bC0yIGJhdC1wdGwtdm0gYmF0LWJtZy12
bSBiYXQtYXRzbS0yIGJhdC1ibWctMyBiYXQtd2NsLTEgYmF0LXdjbC0yIGJhdC1ibWctMiBiYXQt
YWRscC03PC9wPg0KPGgyPkNoYW5nZXM8L2gyPg0KPHAgc3R5bGU9Im1hcmdpbi10b3A6IDFlbTsg
bWFyZ2luLWJvdHRvbTogMWVtOyI+Tm8gY2hhbmdlcyBmb3VuZDwvcD4NCjxoMj5CdWlsZCBjaGFu
Z2VzPC9oMj4NCjx1bD4NCjxsaT5JR1Q6IElHVF84OTQzIC0mZ3Q7IElHVFBXXzE1Mjc1PC9saT48
bGk+TGludXg6IHhlLTUxNTUtMTU4ZGUwMWM3MThlZDlkZDdjYjEyM2QwZGY1OWE2MDc3YmUyNjU3
OSAtJmd0OyB4ZS01MTY4LWY0YmE5MzJhYmI0NDIyYTYzYzcyYTI3MmIwMzg2Zjc0NWNlOWExMTk8
L2xpPjwvdWw+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07
Ij5JR1RQV18xNTI3NTogMTUyNzU8YnI+DQpJR1RfODk0MzogODk0Mzxicj4NCnhlLTUxNTUtMTU4
ZGUwMWM3MThlZDlkZDdjYjEyM2QwZGY1OWE2MDc3YmUyNjU3OTogMTU4ZGUwMWM3MThlZDlkZDdj
YjEyM2QwZGY1OWE2MDc3YmUyNjU3OTxicj4NCnhlLTUxNjgtZjRiYTkzMmFiYjQ0MjJhNjNjNzJh
MjcyYjAzODZmNzQ1Y2U5YTExOTogZjRiYTkzMmFiYjQ0MjJhNjNjNzJhMjcyYjAzODZmNzQ1Y2U5
YTExOTwvcD4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_SN7PR11MB68273FA90466A7976C2D6F92DAE52SN7PR11MB6827namp_--
