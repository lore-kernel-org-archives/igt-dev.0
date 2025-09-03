Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83176CA1011
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 14:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C95110E0EB;
	Wed,  3 Sep 2025 14:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HwXx4aFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8868010E0EB
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 14:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756908346; x=1788444346;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RfAa8M8CERg/H6u47p9Aq8noDFW1IBB8swQ6/vXTSzs=;
 b=HwXx4aFkKTPwXpB3OFFc11KKSQ70qysy5iirztUpi/pVpgZ0SFGmrjiE
 k17NaySBEhcuOirvmHZACMnbRX2CcwrFLZutUEbS8ucNV0wx7d1JFN0Yh
 Gvg7vgj+BgoyQSrsFqzov7N0dm2lwO6v4lBU4l3DdTEZvq/pQn91Ifkyl
 vET4XOBasV/hK3iyqsDmEPEahHbPNJrY7759Xdz1GppDRrkkKONTS4j3V
 qA4Aqp6sja1WKdS3vK5dvVj0jlIjnoc0apBolRyITligJX+tZvmQC2W2O
 5FUt8bxsN9awUREfzatg2FdtsPZJTGhxYY/MGqYI2k0NXMUKSwMmT+Emf Q==;
X-CSE-ConnectionGUID: cFu2NtkoRtmDE6zKLV4Img==
X-CSE-MsgGUID: mvgTSDZsSda9uqP+XH+/gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59367987"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="59367987"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:05:45 -0700
X-CSE-ConnectionGUID: im12M+GjTHKcsoDm1y9Q8A==
X-CSE-MsgGUID: YeKdUesyT0uUw+7BScBH0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="175957218"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 07:05:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:05:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 07:05:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 07:05:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yerc0Lp9D/8YC3SEsKXJUK1ICpU2Rqu0DK7LDt5RdAcofiEYEXgIl75sH08mF9x8LKmSLvRr7uFHVy2RNnHiRReKny75Hb6Wy0ceBdNgX5v6RsJ/mJVO7hl5EzRqddfc9c9jmYIMCl9ydNTfl/HVJWDOV3VSOP72Zf93QqFZhQQNzYJWn/J6qkPjnw5ge7dlOD5AplGYpIL2MTkJ6dYqgqu30hCWD8m1alBPywWaJFnsOTC4g4qmRgfeSiS4px/Y1yAzFlYVmQqcaOxYSiEQUZyk33jptOPlySmLnAczHiv4sIDS0h/SV2h7TObP3KjiVtQmyvAmbjwlWgSwjjdL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDo8RiJVoT6LMw8NSX24Fku2KxqF54dFeogB0n3uVRY=;
 b=sWteNbzFvDONLA/QuN04gI2lZJsf8j+SIH8bvEBbcL4u128QowukgNYGuchWwss9APOIShbPSwlv47VSD/I9LC767Wmcr4fKOyn4IH86QkMdk0mZNvkYWxhdAUWXjc4QrNI688u2DBPV6o3NUC7MXDHKeMAetHoFZ3lH/2TgrJbjNBQx4tVC+k+6zWgzXSNflA/i2yULCi4M4OTJqkYfzXifWDo33h/o0iIGF5Cd5F7JNZzJZkoAKFE99nlVHMMB1AdS+aELT4mlrzd6/4ToC4GWR1I26UMFxcyNZDsxxZEbGXjdz7IIupwkfCnJMPBpaPVVIQDbuPYFzmqjMIEC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB4808.namprd11.prod.outlook.com (2603:10b6:510:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 14:05:42 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 14:05:41 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [v2 i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC
 modulo 4 restriction for ADL-P+
Thread-Topic: [v2 i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC
 modulo 4 restriction for ADL-P+
Thread-Index: AQHcHKcEoHrhmskVr0ijetpx3pPNL7SBIDaAgABc+BA=
Date: Wed, 3 Sep 2025 14:05:41 +0000
Message-ID: <CH0PR11MB54443433A248ABC2968E7E49E501A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250903075924.282801-1-uma.shankar@intel.com>
 <3670bbf1433ee54b2917cad874f379fdb113970a.camel@intel.com>
In-Reply-To: <3670bbf1433ee54b2917cad874f379fdb113970a.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB4808:EE_
x-ms-office365-filtering-correlation-id: 8bf81fd6-81d0-4697-f976-08ddeaf2f7e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?0pMlYxuHbk6IfEtLDZNYsAvaRlbRRxhgzJwR6IQSdmmg2biKCCSwVv29st?=
 =?iso-8859-1?Q?RMUQfZD8PjQ9iymX3HfvhbT+JRha5po6Nf9NhSL7VHqhNy62IOYXOTsv3a?=
 =?iso-8859-1?Q?nPsBqVcPjNNmGIZLdZUkQDXYeCCNePYETqd6IqDGY5zbO2l0dMKzG+R5gp?=
 =?iso-8859-1?Q?QIGOJsWEHWC2A39ztFo7W8Uv2vMCaizAoeWRctn+QlCpWGdnI8pADH9GET?=
 =?iso-8859-1?Q?4LNEuPWTJWY4gRg/4G2E6YjLnwZAToRr8Pn6aEEGt470jns63H2VNSuuxS?=
 =?iso-8859-1?Q?sTUVxeFxnW7PTzXz/GCPWx+pAo4i5CmQcJ/FeUV9IpWDQca1TzDCTAV2kh?=
 =?iso-8859-1?Q?l24IyBjYNKhnspsw5VCFu3Yh7wMtjsvPbs/jKUzfE2VmThJMy86JU8lDiJ?=
 =?iso-8859-1?Q?cKiSXcyEMudr8Zt3gaGR3q9NFMm2qIviPEzC0JJIt6g1c8kzXk/fntYflP?=
 =?iso-8859-1?Q?fj8ZDSNNtszDnm7CDUvjen6P11tWwVrOlcSVfnV1aFD8Trc9xSzgutOj7G?=
 =?iso-8859-1?Q?+rk0QIXLlmD10gAm1zWQ9ZImXjo4TFV4YGF6kFvcb2K7CV9R1idiDduUCa?=
 =?iso-8859-1?Q?FbckBss/J/9H8cB9clyuY2FsVa7meAxJmtMJpknvgIa4S6vLcazOcOUnfI?=
 =?iso-8859-1?Q?QFx3mDTCwPNtnjtvTFS2Oo16zBZ5YQDXVdt+gFaVHKl3k7T42rcv+HUeCL?=
 =?iso-8859-1?Q?GNhNvFZbS51B67d9HfKv5oYzD/eicyR89E2ZEF+kkJDxKFy938rcw6Ppuf?=
 =?iso-8859-1?Q?dko/OCapHFDZrmyQLcumVWxOhNRD5CQ40vNIXygMbXgJO29U8d5dRe/W42?=
 =?iso-8859-1?Q?J4JywY10k+olZGpFSOlqE8wYw9N1ZmSB96qlmuvoYw97QmNAb3NCtyaLDf?=
 =?iso-8859-1?Q?haVMZ5FYfnlmCpfEuRuuIt03wuhyF6ogHwED+akZAXVIK+ZNlWl8wcg4p0?=
 =?iso-8859-1?Q?dgQsvgD2w0owgkxspvt5sHGJrMKqwY5TFVebrzXlBSBa+7yLWHxypZHVDn?=
 =?iso-8859-1?Q?ghJy6Xd+xYtQLqJHHMjFeH7PnCfFbow3kfA4rwlTD/mvnyw9H/EtihnoFs?=
 =?iso-8859-1?Q?MOuiSpV+bauHyP6IfWthfRLEiKWjMcIpdgEc2YHNlvdj4y5uDXWlLWyBIs?=
 =?iso-8859-1?Q?/OH8VQRrsNi3+ockxT3B9FAfVYyQLCRsveU9g6G58R8nWxQqg7GNjdEegO?=
 =?iso-8859-1?Q?fX0+PINzOrUdGdu8ZZCrwzANw8mMOtEqtFz+jTpdf3SdeBCThWLI2WQdRb?=
 =?iso-8859-1?Q?IdoioJE7vjKmKPeSbqJRsSxk5RrQRcS/ASVDhKyzuWrlSpmRXg71fO9Unn?=
 =?iso-8859-1?Q?8eQIQS3TkIBUkCae07zWLtoL3BHp3QiG68EeVRFU+7obD/RBS5hYyMWfRB?=
 =?iso-8859-1?Q?sRwYtZRyGnC/sd+ZKlQn0pLmAwIboYK/0EJUAXfFIm5835PJH/otCCEQtb?=
 =?iso-8859-1?Q?JqgcLsPPQw0z64n2DfSnFaVx8ehkSCSUblg7Bhnx1ACOcLvOXwKklrD+uC?=
 =?iso-8859-1?Q?A+N4xVNlR0aYH5LocJx0D6d9tZXvBP+T2DUEi1oQ8RLg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UHEmbxflaaD+Yh4hzG/WhJqPedOj2ebJAxi05kWtL6zdhgMrMb6bpx+Vol?=
 =?iso-8859-1?Q?VyhUaGXs2FNDiWM0YAfWqCxGSsQvFPC57EXP5DXf7qzIUKRoHAz6jF9T/X?=
 =?iso-8859-1?Q?WdTm3m6bGT+9+j62QldvcaTDRYa27jDGApdqSTtPjjiwb5Lna/V7liVAVl?=
 =?iso-8859-1?Q?tv7NpfZlhyOjvax/+2DCnPWxaZbJlaA/iVo16fK42WVOk5zHDXVDixD9VV?=
 =?iso-8859-1?Q?K0ZeQZ7fBAyAka2i4kiqvjM92Riqg9f62gFTWtVy3AA7sS13KQPJqe8BiA?=
 =?iso-8859-1?Q?Ypab3fucBzcdapz0XmcN1+GmhC94Iwkzp6uOeI4IqLP5BUmfNmftcyfLVf?=
 =?iso-8859-1?Q?lLGOgqok6fejdeJ+MClVELFTf1Ps3ZFux7q/BOGS71qtu7h7FcwNxb4UkL?=
 =?iso-8859-1?Q?bGJgBQQI8Z6lrkuAUq4TopS7ua80+pGeM41wbn9JZE4iG5G5Ki0p8wsxMv?=
 =?iso-8859-1?Q?BFXppHkzXN9IlfBS0LbYcVIEyCb47xe2eX/TtbGH9jlZz+1GCl5dsEvwm7?=
 =?iso-8859-1?Q?XDjnxV7QQcyynXyGkWFRl1pDvPA/+DZXUs3peZjPh4lomjUIxIu2JNf43S?=
 =?iso-8859-1?Q?fmMmN5EhXRXkeM4N0bXJnhEIsrAFWrcIpnErMp6QLFsOw2Y1T5PmCIvBL2?=
 =?iso-8859-1?Q?wOSwRujEimM4DD8bNi3YMEEG4Q7KyQosh9cWfUIZSFFAQcS5kDQ/32CWJl?=
 =?iso-8859-1?Q?5zVt+oYdWMkFxmBr5EnYZ+YPqmXKcnVHxBOCMg1MQSBwW4Vqgj41OLfgyK?=
 =?iso-8859-1?Q?zzxxdhuV7SsFOubb6it/Wo4TuZch0Tev/f/53LRTXENK243uLoOqupshRH?=
 =?iso-8859-1?Q?+y1zuKOlVv6gOyAon+KI3CiyAT9CqaAzFMPmfQ6ro2YSTtNZbw1JzYsSGn?=
 =?iso-8859-1?Q?9+N9rgt1hSn9/7C9yV4VvjlNc7OooDf/GxktAResgcT4MM7Rje/z4lXwuG?=
 =?iso-8859-1?Q?OC9NcjDHBGtcGEf1j8AjaAvqppyYoD0UaGEJs2Ehk91FIz1nB5teCLNxKL?=
 =?iso-8859-1?Q?QDKR5RdSPBLYh09YC7PPszU1IfW3rvu5PIZuQprRAR/3qZOMGVFrBIU7Wn?=
 =?iso-8859-1?Q?cEkNjPk4MUq1sTRYQU5pKHP/dzW5WtcQxAVHxg8K7oG8/dq+F7Lg3Cki3s?=
 =?iso-8859-1?Q?FUe0vPaWDI8/Jz64TfPEtlh8uhz/E9QOowKyevs8rwiThekFCaZKDKjcW0?=
 =?iso-8859-1?Q?CAQz2CRT9kXKBt599FOU0eqOJAoHgbsYakMedeMI/Rm0MyzKsbfjpwwIC/?=
 =?iso-8859-1?Q?ojvhTh1TFNTqBi2jbGe+L2lmrCpXQNOOg5Ubs6OSUqSBYnGj5X+t0sA3wf?=
 =?iso-8859-1?Q?jfzXoTidkmI27bGauhqmZbHYX6YyPZGohzX+m1rCu2odXk/boRZIsDx79n?=
 =?iso-8859-1?Q?MyHSmDGftH7oymqEvIYYCpHL0zm/MKZdzbOP8ooAa4cvBNzy0hPtClbY/f?=
 =?iso-8859-1?Q?3Zzqrfn3W8PbmA0sIJUrjhxMXUv0RiqzSgV7gqe9D2l6Sxfq3rs92lldCS?=
 =?iso-8859-1?Q?uiWCZWpVA8Cd0fTxtSrD3FgzZLQG9pAqw/hrYjJ//tk+jVE8qjW1cRB9vy?=
 =?iso-8859-1?Q?+JzvegSsCnZ6xwkznLcCV9YUgJX1iT7lcYUNT4YhQJ4feSI9N37lSW9f6h?=
 =?iso-8859-1?Q?xzmIxEYh+nTxXjCRI575x2agnxGrZ1OgzFQ9cT02l+C2jyy17bmR2VKpIz?=
 =?iso-8859-1?Q?hNznyXfupWO+3yqE9+UgutP4k3CxpUZqxIzXENDP?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf81fd6-81d0-4697-f976-08ddeaf2f7e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:05:41.7913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUhqTRVDMxwb5yoMtXHX3lpVPOq/klY8raQ6CDN44u02WeZj/4WZZSwY6XJ2C9bJYY8McAHSjKnjr/DMFvysUzHq7E8NcNzWvCVm98zIWkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4808
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

-----Original Message-----
From: Govindapillai, Vinod <vinod.govindapillai@intel.com>=20
Sent: Wednesday, September 3, 2025 1:29 AM
To: Shankar, Uma <uma.shankar@intel.com>; igt-dev@lists.freedesktop.org
Cc: B S, Karthik <karthik.b.s@intel.com>; Cavitt, Jonathan <jonathan.cavitt=
@intel.com>
Subject: Re: [v2 i-g-t] tests/intel/kms_frontbuffer_tracking: Remove FBC mo=
dulo 4 restriction for ADL-P+
>=20
> On Wed, 2025-09-03 at 13:29 +0530, Uma Shankar wrote:
> > FBC restriction where FBC is disabled for non-modulo 4 plane size
> > (including plane size + yoffset) is fixed from ADL onwards in h/w.
>=20
> ADL-P as per prev comment?

Alternatively, since the above sentence is just a repeat of something said
in the below paragraph, we could just remove it from the commit message
entirely.

Regardless of which of the two options is chosen, once either option has
been applied:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> >=20
> > WA:22010751166 does not apply past display version 12.=A0 Or, in
> > other words, the FBC restriction where FBC is disabled for
> > non-modulo 4 plane sizes (including plane size + yoffset) is fixed
> > from display version 13 and onwards. Relax the restriction for the same=
.
> >=20
> > v2: Updated comments for clarity (Jonathan Cavitt)
> >=20
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> > =A0tests/intel/kms_frontbuffer_tracking.c | 6 +++---
> > =A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> With that checked,
>=20
> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>=20
> >=20
> > diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_f=
rontbuffer_tracking.c
> > index 061e996cc..a29da1d43 100644
> > --- a/tests/intel/kms_frontbuffer_tracking.c
> > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > @@ -3496,8 +3496,8 @@ static void scaledprimary_subtest(const struct te=
st_mode *t)
> > =A0	do_assertions(DONT_ASSERT_CRC);
> > =A0
> > =A0	/*
> > -	 * On gen >=3D 9 HW, FBC is not enabled on a plane with a Y offset
> > -	 * that isn't divisible by 4, because it causes FIFO underruns.
> > +	 * For display versions 9 through 12, FBC is not enabled on a plane w=
ith
> > +	 * a Y offset that isn't divisible by 4, because it causes FIFO under=
runs.
> > =A0	 *
> > =A0	 * Check that FBC is disabled.
> > =A0	 */
> > @@ -3505,7 +3505,7 @@ static void scaledprimary_subtest(const struct te=
st_mode *t)
> > =A0			=A0=A0=A0 reg->x + reg->w / 4, (reg->y + src_y_upscale) | 3);
> > =A0	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
> > =A0	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
> > -	do_assertions(DONT_ASSERT_CRC | (gen >=3D 9 ? ASSERT_FBC_DISABLED : 0=
));
> > +	do_assertions(DONT_ASSERT_CRC | ((gen >=3D 9 && gen <=3D 12) ? ASSERT=
_FBC_DISABLED : 0));
> > =A0
> > =A0	/* Back to the good and old blue fb. */
> > =A0	igt_plane_set_fb(reg->plane, old_fb);
>=20
>=20
