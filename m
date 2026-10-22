Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5216E606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 06:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zjz40rMi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF75F10E0C2;
	Thu, 22 Oct 2026 06:31:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F172D10E0C2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 06:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792650614; x=1824186614;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zVlvzUOgAlTqqNiZKo8JyPx4SRlNrlNcKIZ06ySVWcc=;
 b=Zjz40rMiO0sukuAtGxTx5tvdNaghiOYczDwI/0qSl2rTC69Ib/vpSBa4
 ikm0MuodKIl8/4y6Q+XEiym3y2+sehSamU+YpqQMTKI2MZ+MomwBkoPuO
 JyHKvJrjw00v7yFNF1i/Z/T7RvN3jNxvcgq1y+XqKqbRcQM2C1L7fyKtG
 V5coX6Tz4mT0wZaUq45Y0/6v7f3Vd98w4mOawUib2Vuay2vYxZGgu+YLH
 /bBYn482wBQVQ5pcBIEEy3xyTPcIMw4z14iG5y+DqDNtIFhk4uKswqpCl
 lSubmZFVq7SE0M4QFVX+BAQm6KI9dE+Hm3v58LbjwjPoZ38ky06TyH6AU Q==;
X-CSE-ConnectionGUID: BRUPIXWwRHKyv7b6PNKr7w==
X-CSE-MsgGUID: S6b3rt1wTym4p3En5ZUyoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1390534"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1390534"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:30:13 -0700
X-CSE-ConnectionGUID: 24Q3HX3qTX+z5UnvjdpOZA==
X-CSE-MsgGUID: 76scw59WThKIsjQNV4/KVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="5094525"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:30:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:30:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 23:30:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 23:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kO73ShD7uknjscptem5yQ9SDej23oilg8k2z02PU7YwmbzJhO2i9VzaCl4L3fb7GMVQgZxH5mXNHBWshEdJ71ezAWtIt5MZjtlgwHhb5rs21QCBBhSGQ2BmgwHadkdGbpH4dtld40RkAKvl2JI1LdMiN/gugHzkDy+GdLnVzXHdmOKKxqeBEGurU9OnNVE+7OkM6y23QuWZdyR2BNchZaF0dHAkaFTcALz8wmxjR3KmvIAaRTE58gtw60kj0+ueg9dzmUrgFeKhp5hdZll+dLxyed0DHJAjyKfdERoqLBD587vabaPgGK4ZXgFzYWxH0Kbz+hw8JM5h7hj4pV7BCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jU5JGX4zOZp38kvm0drftl86LsqyWWOQ5Uqo7pEwwyg=;
 b=wsyUKFmjkxz2LfRfutgbF+7H6YFpc8RsiEu+Tm7zpOtvmsVmyJHPtfzFFXsGhrSFvN2FoEPXrKa5jFK3eCL4r5vcfWYxi5gGyv1B3qTVRqrTqVSObp4a8zKUrh7TI8Ndl4ZnwJWfECTAXUtmvCftOz4hSNpHO0Hsg6/lQ9jxwM4BGRYDD93DNNhMXgBOiNcMoSvVBY4S4l9PIVpvtJxVZR6lOWgaGwbDhDq8iiysaB/hEJ8Oj0jG2+nJbP3tV/VXOnXIE0SQx5zlXbeGmz4NgW9b25wHxWsgz9/a+sSvp1/tgRd7I1HYgWuN9W2caNBmRetUc+/cARRbE4TLn75Few==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by LV0PR11MB9790.namprd11.prod.outlook.com (2603:10b6:408:385::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.22; Thu, 22 Oct
 2026 06:30:10 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 06:30:09 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use small
 modes on simulation
Thread-Topic: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use small
 modes on simulation
Thread-Index: AQHdYKDi+qrv/vO/kE+mkNPHOZFnxrcJBFRwgAAT4oCAAAPTEA==
Date: Thu, 22 Oct 2026 06:30:09 +0000
Message-ID: <PH7PR11MB6796CCB98797B9935D696464E5652@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20261020143830.772865-1-pranay.samala@intel.com>
 <PH7PR11MB6796126D448F7B03A7EE3C03E5652@PH7PR11MB6796.namprd11.prod.outlook.com>
 <PH7PR11MB605390CE7D7CADAA8FAC45CFE7652@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB605390CE7D7CADAA8FAC45CFE7652@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: pranay.samala@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|LV0PR11MB9790:EE_
x-ms-office365-filtering-correlation-id: 9d5d9b41-fe3c-4b0b-45bb-08df3005ebc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|11063799006|4143699003|261021123027099003|261009223027099003|261021121427099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: Nx6TGeCzYN98QEXjjLB5UNowvYRsd98XAAU7tavPf7h3ybsX60kQAZOQrFTh4ow1yZXdwj7o52LvpdR7nVEARuCDG5L0MRdyEaFtYdl1hutCYe+YzGR8Tu/0Tdvqyi7fUD0TMqZtX7WDtiA3nCKInKT0G8h9g75bjSwaFVhVKZ1XBU0FVNwjidy+y7PcTQYuiDeupjhTtsDDtZPQc2sbdO2vPcTVudpDhXaTuio14lxly20EXnC2V+d4WfCbvRTakNNDwWpdYuHYL7mAJREhQEeOHLOH3w3Wfn6IXD0JlyN14m2g/46sn+ZW22jvFA8HgWzGwijOAKdIe0jrB3KvYc+IZCGC1Ln+58cnFV0EpCv+ojAu1hpJmCdNNSs5aXELE8oi4VsTV9ShVgeub0/aY62pRjDBhtAWToLLACtboMwpStDU1fXzs2bnwCXrlbJLC9ea73QmpeRBMO5oE1/aonOnvv8UR6j6lkAzDeR+/aJwrVNz+2IEaBiNqhHsVgs8MaZbzDjOYsUloH9EfQ/F2VRJ5sJqAPn5AdLq1ZtfT1t3WFo7pUvGyJPutlG1Tyo+XWre+dKugYuTwUVkKTQzHWDrPCJnXpH5zH3OsfvJCfMwKB90CdGeTbKWPTxafIJVHpOs2n6tH4kSJTgfkSauYRhX0Nr7gHrEKd1RR7FMetk1fGVqTUr2Dr87PRhsBafyPPOfaOc/4qKwRZ71+lnSGLnT5VHHd9SUGzOi8tISNvQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?cEUydCtTeGlHdU00UFp3bi9KNFd5alhUdHpmSzlGV0QwNjVlUXRoRE5y?=
 =?iso-2022-jp?B?QUVNWTR1M1Q1cmprTHZMWmJTTE54M1ZoaU9qelVSZjVUaDYyTlhoYzJB?=
 =?iso-2022-jp?B?WVFtYTk0aEt4UHRLditaYmppYjVzYmsvelBtQ25hUzlLWTU5djdPcXhh?=
 =?iso-2022-jp?B?dU9wRjFsMlJaUjJ4aVZmT3JISXVoWEtiVXRFQllENVU5K0V0VjJJeENU?=
 =?iso-2022-jp?B?bmpEUkZJTU5uaWgyQmZGVEVEaURhc3VOMXZkRERrUi94bVZVeCtsRFZo?=
 =?iso-2022-jp?B?VXFSd3VHTitITUhCVVJQbHJnTmxKWkc1MGRUblEyRWhpcXoyZkFtUXp0?=
 =?iso-2022-jp?B?b0xWWGh0R1MwZk5SL2F0MHZSRVJqMlhoWkVVZFJwSDY2bVovSmRZT3l2?=
 =?iso-2022-jp?B?K1pUTjVrY0xDNmZLU2pMcjg1eENuYWNBRHZ1Z1M4NWltcU5hRE01RThQ?=
 =?iso-2022-jp?B?eXkzNzZUK3BicWIzTFVJWjdxaU5lOUYwajhObFRQbmlUd2lOaU55ZzMz?=
 =?iso-2022-jp?B?R2YxcTE1QUF5REEzQW9KS3FWUXBkdmNPMUlHVy9UMXorWWN6TWhXTFpO?=
 =?iso-2022-jp?B?SktFQ2tnY3U0RzVtM1BxeTRjczk3NVIvNXQ3U0NUNFcvNTdRaCtrbS9p?=
 =?iso-2022-jp?B?ZU44TlN5TGFCbkc4eEk3VXpTY09ybDJjbzIzY2hUa282WUVwWXVySmJh?=
 =?iso-2022-jp?B?dVIzNlhZbHo0YjNBMjBjdXBWWlZad3J5Z0U2eWRjT0VMVndVM2ZOSXM1?=
 =?iso-2022-jp?B?TjZXSW5KeGpweU5OWWV6b0h0WEdjaWVMblc2aXZ4bmtOSFRPSVhUUk9V?=
 =?iso-2022-jp?B?WmxDeENWbWVrQnpQWVNmcFFBdytGNnhSemlNQnJLNEgvdmtvZmg1VGFG?=
 =?iso-2022-jp?B?WklOZGpXbGRvNjl2UUhYSmM5VUFPcm80Si9uZ29ZUVNQSkJZS0cyMVlN?=
 =?iso-2022-jp?B?NWJHSmNKRTV0WjZjcXB2U2xUdXZkdkFkaUs0TlRyZEZYU2podjJsZG5w?=
 =?iso-2022-jp?B?NWhiajRYOFhIYWVJbHV6cHJ2bnBocWRXT1N1aUZXVFlZbTFrRDBISzBq?=
 =?iso-2022-jp?B?djh5VXVGVis3c0NXWEladytGMWNOYXJ2cnBHQnowV3diZmcvbGI1Wit0?=
 =?iso-2022-jp?B?Z0hEQS82eWxMbTZJcndLNHFHOUo2RWY2MUNhZklvSU9lL0VlL0dtTUFL?=
 =?iso-2022-jp?B?TzRQcVVNNi81MnZOT3NuUlI5Rkp4VjJzZER0azUwbzlFZXcrL0g0dFhv?=
 =?iso-2022-jp?B?RHd5WnFaNmgvbHNvSkNHUFJyQW0raWNKbmkzeDdLckUwUHF1c21ISFJ1?=
 =?iso-2022-jp?B?SmRsUUtRQ3hzZDFoNTZoQWQyNlluSEtRdzUwWVZOY2pSeURjUG1OZlRK?=
 =?iso-2022-jp?B?eTVsMklxZDYrV0loczlTcWJDbng1QVUzeUNrKzFUd3hsSTRXOHJJRWF4?=
 =?iso-2022-jp?B?Vld4VGE0QmRqYm9KamlQbjF4M1JHVWFiVW9zN1RtK3Q1enVOTlowbUFQ?=
 =?iso-2022-jp?B?OWtyREJRbkdpQWlrOUhXdXRuYWxnZXJ6MnNNd0sxNkFkMmtDd0hRckF2?=
 =?iso-2022-jp?B?dVJ1WWdla1lkMUlWdWN6UWs0VUs5cFdQcytBNGxCV1BxanNjNndQbFBW?=
 =?iso-2022-jp?B?ZWw2SkdQNVE5TTZDS3puYnhDUkVuSHNUc3JsR3lMQjd3MGFPdGxrTjhF?=
 =?iso-2022-jp?B?Z2FJNjUyVVkrY3o5L1B3UTBKOTN0WmRxRkZxKytHemNhZWdTRE5pUVNU?=
 =?iso-2022-jp?B?aEE0VFpTMXNBenBsK1pzYkkxZGZnRDE2eXBMTlJiM3RRVHhONW5VZHk2?=
 =?iso-2022-jp?B?aGJ5NXlRM1hxQWRDa09NUTlIelpXRmM2K1J6UUV3M0hBVjRReUlyT0tn?=
 =?iso-2022-jp?B?Q2QwbzZQS0xqRk9MazJNM1lLMlFNSVpsak9YVGd4Vk9Ed2hTVDNKR1Bl?=
 =?iso-2022-jp?B?dTVlUWoxc1NZejlQSjRnc0NJbGRwdmNlYjkvekEvcEl5Yy9vVVdXMnlm?=
 =?iso-2022-jp?B?VUtEUFNHOGhjTE92cVlsYWdIajZyMDRNTUF6R2t0aUxmTGhNY2p5T256?=
 =?iso-2022-jp?B?elpBK2hhWUtaVjhVRGlaZjlMMEZpTmxlcjk1RXBUajVFS05sSnNENjI4?=
 =?iso-2022-jp?B?VElOWkJOVFMrTno2TzcwSG51TnJOV3VwSmpmRlpWS3BrVzRVVWlGdGlv?=
 =?iso-2022-jp?B?a1ArdHRUTk5VMFphUkI1WkJIM0o2WWx6YWlZRWdKZnlUZXFhdkhUZ1gy?=
 =?iso-2022-jp?B?aHFkL01hR3g2cG44b3ZCMVhIUDROMUpZM1lyeWUrQUFRMEtQZEtyek1S?=
 =?iso-2022-jp?B?Nm90YWI0cXhXOEZiODVqTW1qdHJDUEJkMjMwVnlacHBqNy9qdnR2Z2JO?=
 =?iso-2022-jp?B?YWdzcGhzeFVtSVVnWUx4OCtVUExobGhqOExMeFUvbngwT1B2dUlJOU94?=
 =?iso-2022-jp?B?MlY2T2NoMHBMMEFDVlVrcHQ5aXl6cGRNejlvQkhrODgzeURMc0orM25Y?=
 =?iso-2022-jp?B?MlBlQU1J?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: zx+1tT+A2a2d87mgd+u8nXmGtt3CUCwSRwttf7KaKHC7F6JLchv5lMpPmc8i4Y+0ful4/mgf5r/ibf+fzCbblaf64jjMrPSDpytsYWF//OR52oEQW4OzPtJ48a4jP26FM1iPgLUtouNd+p0WdwYTWxJqlpng4jWDnwjeSkkvxqMloO1POYFzKvAmpgG3W11Bzo87PBEMPLhOtK1fmaieBqzp+MNh2BHClUufnpxjAwSqLhEDxNFUE6+evpSoL1QqS7ZWR+OG0F3SP+YiKwJ4awgzsOJ69lEQ5MXVRx0xo/fXhm8tSfB5VtiGieDh/z8eSZsaedJGusoTIAhCyD37Qw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5d9b41-fe3c-4b0b-45bb-08df3005ebc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 06:30:09.8240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gVqmuqQGmVVXmH3C8b04YXrpAJ1OkkyF78qOil2GWLXvRbKQOc1IPSsBAW4e1NEKMPxYewNtOdqlRjKDoC7XQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9790
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi @Samala, Pranay,

> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: 22 October 2026 11:45
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use smal=
l
> modes on simulation
>=20
> Hi Sowmiya,
>=20
> > -----Original Message-----
> > From: S, Sowmiya <sowmiya.s@intel.com>
> > Sent: Thursday, October 22, 2026 10:37 AM
> > To: Samala, Pranay <pranay.samala@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> > <sameer.lattannavar@intel.com>; Samala, Pranay
> > <pranay.samala@intel.com>
> > Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use
> > small modes on simulation
> >
> > Hi @Pranay Samala,
> >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > Pranay Samala
> > > Sent: 20 October 2026 20:09
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> > > <sameer.lattannavar@intel.com>; Samala, Pranay
> > > <pranay.samala@intel.com>
> > > Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use
> > > small modes on simulation
> > >
> > > Due to slowness of drawing on simulation, use the connector's
> > > smallest mode and draw only one rect in draw subtests when running
> > > on
> > simulation.
> > >
> > > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> > > ---
> > >  tests/intel/kms_frontbuffer_tracking.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tests/intel/kms_frontbuffer_tracking.c
> > > b/tests/intel/kms_frontbuffer_tracking.c
> > > index 8d5afdac2..3f345f644 100644
> > > --- a/tests/intel/kms_frontbuffer_tracking.c
> > > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > > @@ -2997,7 +2997,7 @@ static bool op_disables_psr(const struct
> > > test_mode *t,
> > >   */
> > >  static void draw_subtest(const struct test_mode *t)  {
> > > -	int r;
> > > +	int r, n_rects;
> > >  	int assertions =3D 0;
> > >  	struct draw_pattern_info *pattern;
> > >  	struct modeset_params *params =3D pick_params(t); @@ -3043,7
> > > +3043,9 @@ static void draw_subtest(const struct test_mode *t)
> > >  	prepare_subtest(t, pattern);
> > >  	target =3D pick_target(t, params);
> > >
> > > -	for (r =3D 0; r < pattern->n_rects; r++) {
> > > +	n_rects =3D in_simulation ? 1 : pattern->n_rects;
> > > +
> > > +	for (r =3D 0; r < n_rects; r++) {
> > >  		igt_debug("Drawing rect %d\n", r);
> > >  		draw_rect(pattern, target, t->method, r);
> > >  		update_wanted_crc(t, &pattern->crcs[t->format][r]); @@ -
> > > 4373,8 +4375,12 @@ int igt_main_args("", long_options, help_str,
> > > opt_handler, NULL)
> > >  		if (opt.tiling =3D=3D TILING_AUTOSELECT)
> > >  			opt.tiling =3D drm.display_ver >=3D 30 ? TILING_4 :
> > > TILING_X;
> > >
> > > -		setup_environment();
> > > +		/* Full-size modes are too slow on simulation, use the
> > smallest
> > > mode.
> > > +*/
> > >  		in_simulation =3D igt_run_in_simulation();
> > > +		if (in_simulation)
> > > +			opt.small_modes =3D true;
> > scaledprimary_subtest still does the same relative thing (half-size
> > region, quarter-size region, upscale by aligning to 4), so it won't
> > fail or crash ? the ratios (1/2, 1/4) are preserved. What changes is
> > the absolute pixel dimensions and alignment edge cases being scaled: a
> > 320x240=1B$B"*=1B(B640x480 upscale exercises the scaler hardware differ=
ently than
> > a 960x270=1B$B"*=1B(B1920x1080 upscale would. If there's a scaler bug t=
hat only
> > manifests at specific large resolutions or specific odd pixel counts,
> > running this subtest against a tiny simulation mode could miss it.
>=20
> Thanks for the review.
>=20
> Agreed that a smaller mode exercises the scaler with different absolute s=
izes.
> However, scaledprimary_subtest does not check the scaled output on screen=
.
> After each scaling step it calls do_assertions(DONT_ASSERT_CRC), and the
> DONT_ASSERT_CRC flag skips the pipe CRC comparison. It only checks that t=
he
> atomic commit succeeds and that FBC/PSR end up in the expected
> enabled/disabled state. The subtest's own comment says the same: it exerc=
ises
> the scaling path but does not verify that scaling is correct.
>=20
> So, if the scaler produced a wrong image at some specific large or odd
> resolution, this subtest would not catch it at any mode size, including f=
ull size.
> Using a smaller mode on simulation therefore, does not reduce what this
> subtest actually verifies.
>=20
> The change is also limited to igt_run_in_simulation(), so silicon runs ke=
ep using
> full-size modes and draw all rects. small_modes is the existing --use-sma=
ll-
> modes option; the patch only enables it on simulation, where full-size dr=
awing
> is too slow for the test to finish. Without this patch only one draw oper=
ation
> completes on simulation; with this change, the test passes on simulation
>=20
Seems to be okay in simulation
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>

> Regards,
> Pranay
>=20
> >
> > Regards,
> > Sowmiya S.
> > > +
> > > +		setup_environment();
> > >  	}
> > >
> > >  	for (t.feature =3D 0; t.feature < FEATURE_COUNT; t.feature++) {
> > > --
> > > 2.53.0

