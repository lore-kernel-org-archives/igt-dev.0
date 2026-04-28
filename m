Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B41FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 07:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188E010E078;
	Tue, 28 Apr 2026 07:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ca3D3dBF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF13210E078
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777361413; x=1808897413;
 h=from:to:subject:date:message-id:references:in-reply-to:
 reply-to:content-transfer-encoding:mime-version;
 bh=qrg2bOYUxEcjWGdjwauU8IALmdR7qRDl0+np5znquh0=;
 b=Ca3D3dBF/LQtp/hC2FlViNqIyUJA5bM/jaU+acaoZ6plKSTiD+yT+n/W
 L2rz1Oco1Yi68qCZOEtsoCQ34TcslA7hadh9voEJZNhrl8vvjjmiKpWWG
 nZ5TUMMP9VKOcpjLTDIlduJ4eY5heJbAceILw4ne05xiTqFiEVzpD2UA2
 QPKsyVoYUV1d6QHfbghIo0EwnUYPX3A06k4ULLe4+P/u3HX9/ZZjS0jTU
 qMV5oHuoNPIADbm5iHYK+Q/jcHO5UKlrW7agFSt9UMTOqpXYSeCfQ5Q98
 gkHcwGc9eaBQOXAKr6pIqGj1cvw1DZ/Fj3136aJjZ5qxTK34oA3y0fx16 A==;
X-CSE-ConnectionGUID: Nh5j7ddmQmmMpPIgNiwmkg==
X-CSE-MsgGUID: IM9+/0rIQImZ6VQTirpmCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89721449"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="89721449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:30:12 -0700
X-CSE-ConnectionGUID: BkEpv0lPRYm/Vpyyagcy1g==
X-CSE-MsgGUID: 6aKMU/KBT96sfDqvRe/4jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="232870334"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 00:30:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 00:30:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 00:30:11 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 00:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfpbSdH9EwMFR62cvNAarf0o0TVB1c2cIaz5u8vArAlmtw9o6jWLMY2valPCc5v0oGh2MIQWuT9yd23ZNows4RQ+QuwvC++u3Y53SyDjPk/sXJdpoOtMgCb8DsHSkgn7WZhg9B8+oZk136/MTN0d2vHmPma5R2XCSqUbyHk0TtnJ8fCEDxtBgd5jYlsqnZMyeY3jpDLjtt+eI35NSuKdoqoOmJupxOknU4yUSoujZjcMIV06GI/5T02jgWCBLu01Z3QCbas5BUCvMTloFT5GOBAbBgjlen+SVIanO/OIXlBlaUt/D9lTWynACDwfZkUE5DYAzgoDSSK9SGhz4ruYDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utq8cVDsLpCPoPKIasMl3oMCcQIpt6RQK51Ys1Cd8bs=;
 b=A3YJEaKrA6AspLBCkMCvjSwidxMDgsC5tAIJuDwjXFm3WqoVXL09hZkFp+Az3dKocW5f37wy8iPz1bTp+KIPrNs+7c9BK6+iyMhGqJ0Dl4AXH+C7HsIZHom29gxTS6q5cAFeEaf+i/CB9J7ZVZ6yFgvy2U12/42p3B5F4tIKe7l3hWxapXvsimJdVQcXnydQZYHP7YqWjsXAbDP2le/ZARabXukUHU0ewt3pgsa81HDGPiHUqze8XRUy19wsFzBEU7YTvPKwAyoexe4o3WgL1CkgGftZ1cHC4LPSjGqwaHeNfiV/9nYXHCKYnPBhaG9eDE/6td/JGBd8JjwBFxGXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16)
 by SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 07:30:02 +0000
Received: from DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::24e5:f906:d4cc:95d9]) by DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::24e5:f906:d4cc:95d9%4]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 07:30:02 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [v2] tests/kms_vrr: add support for full range refresh rate
 testing
Thread-Topic: [v2] tests/kms_vrr: add support for full range refresh rate
 testing
Thread-Index: AQHc1tciXTIpvLwE0kmJ7Ek5LzBMY7X0DmCAgAACSnA=
Date: Tue, 28 Apr 2026 07:30:02 +0000
Message-ID: <DS0PR11MB7578B79F7AF7D825FC932AC9A3372@DS0PR11MB7578.namprd11.prod.outlook.com>
References: <20260427120955.3537070-1-shawn.c.lee@intel.com>
 <20260428061202.3557766-1-shawn.c.lee@intel.com>
 <42aedef3087af5f28e192e26248ed841568d8159@intel.com>
In-Reply-To: <42aedef3087af5f28e192e26248ed841568d8159@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7578:EE_|SA1PR11MB8254:EE_
x-ms-office365-filtering-correlation-id: 2e87cbd4-14ac-49bb-1978-08dea4f7f61c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: L85IRpK92F9529fEtUSNH4vHIF6OSDeBkt3DSSjcygHE7PFtBW71aCQuTPxy5bsNsYPcWZH2dq+qMNwTCJnLOvhaYv0lGkECoPfyyS+L+T/lnJPogjV81KHdC8nSmjDCatmQ0ptnsPUQ1YdiuRso5O0SVyaYvHQZdCtbqFMveSL1ki4qxgkZztkssBNNChRyhLAnF+R4NNMew7WnofiPeGVNThpADa6P6jzAcYDmPDOa66klr9Lg1ZnAXe03daFzWjiP/L3ZGeAw8HvI/t9iu6K+IoLYE1aAWbFS98IKYgvxPYiNql87mv+qR4/2Jk+ToPxuRV0zUA/wa927JE8/yQi+1A6idKemQwPLj86AJbplg0tVLxDsCrkpXJagt1S4b3sK8T6pkkXpWYdNty8W8S75SHdAGSujQu61jnfxpcK7qLmzYpVkJGUgt5flPArN5IJJN6+cb0iYABP73EZjUq0hjAdRGPIbuZcpq0IGus54/ROuI9zwRXWxb6UuLE2623ULkoeoiu77iNnEP2PhbITM1niD43Wlytgswb/RkxuRrpcSAFPMZnl5Ydm2N/D8I1vgx1/JPoBQzTwPZnppNZQyJw17tISEAWhNdx25+8TYjIz7TpOt1bliyaRME2HaosNWyrD1y6eEvkV70b9KCz0SRp8MdtHFOgWxAcPTmwu8GpFhEQ6faxO9GPY5qY0/SN8PddBabdx0UZzkFE5mnp7IpxsRRBN2bkkEHJXlbn9D0nJVcuBO2FzCVfm4Di0L/oXjf7ccIkgPhHA8xcyBuJogy2oVtBufWF3MPh9r8pg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7578.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pLSVxaWXnNz/gZBSuC6q9lT5ntMWdHVfw3wf6h8hXEz11Ohvm24zUhsLiedc?=
 =?us-ascii?Q?wyT48kkcRwHjfhrCt1axRNeuFl1hNjst7X6gz5xVfmpMq762pg30VLSRGTiz?=
 =?us-ascii?Q?EN41M5Qm6Og3Zi9Zb7MIcoXCTi9QDYVlevfdqj597VpMLk+cZ3tz++yApGZz?=
 =?us-ascii?Q?ih2/h2WJlw0dZK41Hekmj/tXztdzEu+Rtp3pEBcEN4NFLJjKfpSxAaszYm4l?=
 =?us-ascii?Q?Yo+2Hb41a+1eGZl7gXhWYV+tl/GRAZEPAwO+Fo8M6cuxwGFBdkwK8OoyLajs?=
 =?us-ascii?Q?8UX4GBYhReTYsQ93vW223Gmjxlno4s+7XJb9vXKk3Ia0kKf3q3OHQgHCOEPv?=
 =?us-ascii?Q?+stu5ZtlRT4iYRd7iY81TedLbXAEgOa20TpXEwrp4Vf/oeQ3DIp13sv6d9UI?=
 =?us-ascii?Q?XGIk3SZGvC96N3syvPXsRkZWU2pjpNYg92IXdN+5VLegSv8uBKCIRYUR3gZF?=
 =?us-ascii?Q?utiLD1+hGuvCUWPctP5nFJ9arbeN8lXuLU7HLuDnEA+7aG+j/ycgsS/BjHmr?=
 =?us-ascii?Q?2yf/JO3QcIKNhjnz5ZHGwx3ki7rH5W5DIp+4dEVlD9UKQ4KgGciE/d6JDRiQ?=
 =?us-ascii?Q?BIRamV1vwRU+Xw9lo7yrhZAPlq8APmvjvruAP8Og5FD4cv56e6aeH0H13lYs?=
 =?us-ascii?Q?5/Ry9MTGVRYX5pyGxbsnvYhcEdl0g7iRBqaVPrDXGIsVYebs09XN2vDsaX+X?=
 =?us-ascii?Q?JPL/3JBtZJC+95/bK99nKL+OVN178ywnwobcf6LOW11apLfeEC7EZNypNZ4f?=
 =?us-ascii?Q?vYJCeUvKc1so0Gy5Krgo2lKdlTZQUgKnWlVeKx47LgEbVpiEcZTsZi2XAXE0?=
 =?us-ascii?Q?R5wPz6Ppt3sHKoJDfQ1fZFbAOoDSmOQsf06PykYbT+wXRH3w1SVpm8o5KJrA?=
 =?us-ascii?Q?6tHq0JTvqnhRn3u1awWnJhAKXpdCqSe9udEWHT7aSG9TxtVOmnpu3EP4urBV?=
 =?us-ascii?Q?umhkydn1T4qWbfr4j6yqLkToLkozbtGpHMKvnO+Px5uMcXpqZiXsoGXw063t?=
 =?us-ascii?Q?Jycp7/R89XBL5srL3pmIVdS6vkIZquJVc54fvbMCGSg7LIYpQmnbNhbTCFWh?=
 =?us-ascii?Q?dIumeINc9jyvQ85PZbxU7apzPHvD3Nd6/MzKy3jJ9IaUuFbgoAGlLiZEoQdE?=
 =?us-ascii?Q?AjNqPT/TQZTtvUKCAG9Jfur9oqF6fRJYLVZth5onyO341S667xvBmqUW4r6y?=
 =?us-ascii?Q?013j4XYstBlWWWVbqK5FjWoreiEWDMUG2AN3zpZmjqQM9ejI7W0U/1xvPzFH?=
 =?us-ascii?Q?b7Z1LB3XE3tzkPdbMh6i+NYf75QJhr4wi9Jn6KS//QM81lTGrzXBsaew6Vs5?=
 =?us-ascii?Q?Wl8jekSqdLNr+yekiqrTm8grvPR5484lDD+saUNgeHxxg0uH7PMrWJwsUc4m?=
 =?us-ascii?Q?G6kfOqZKEZ4tx9JcelCkGMUjPRi49IB/GcwNHwzaAhcl1E++A5NQORIl9RWR?=
 =?us-ascii?Q?sf1cBAiSAL3dk/3DxLaEzbPKBuDm8lnMkehghAHAQrPp0WEyPAcc0gc3cAGo?=
 =?us-ascii?Q?uLiNt65PIDz/MfBaqt9NmRukfHIO+t+Y+vd8BUGR77KG8UdIxIDveKwQbFeO?=
 =?us-ascii?Q?c6ivhRi+fim5nh/qxlaqFbNlBjHK0ydCTAM4aHdeKwKfnnmWnQm0+dNX13T8?=
 =?us-ascii?Q?Sg+c0Gm+3oc5bTk2hinvSGGgHkCtRFjvbiyyeGWb7J0z2VwDZwa1AQLjZttp?=
 =?us-ascii?Q?Yh8lcaEdjfozC9noibnaFFGEzplE4wya7/mUWV+GE2GuD22k4fMshtn09Jv6?=
 =?us-ascii?Q?NHNa1CUD4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tbOTjVAacXXsBrUI+MBGTtdGy+loebL1ykfQdiVzExpqFiXtuveJs9SWlgVl1PkSrv6lk1ipWrXKe/gPAGsw1cySZwQkeP2XEaXW4W1U/UzUdjef4Se6ANRR7fBzSh77lZryOETCy/6e5sUjUVLS1AfUAVmRdmhDig53dhs7Jbdi1BoxR5UgblYlbVrfQQ2fJm4aa9wORwaenGapabbs2t9NkiCoAJp6fsCemBzqlBPXxOSnC/7aFhJ6xG3s2ZiDhRGpID/K0PiBfW6RlL1419YgIi4PJc/KBvf/P8I5Rv82xcN4xz6G/LvTmI/Pnu22AfKgwVwpXVT89sfBNQJFrA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7578.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e87cbd4-14ac-49bb-1978-08dea4f7f61c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 07:30:02.6039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rIehAACX7zvaYlzXMssQ+lfH1S6DKm5U1IEzRyz5ciagm0talF3sMqV9ETSOrcFJWUSxV1xClLAj5t8vH7IgtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
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
Reply-To: "20260428061202.3557766-1-shawn.c.lee@intel.com"
 <20260428061202.3557766-1-shawn.c.lee@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, 28 Apr 2026, Jani Nikula <jani.nikula@intel.com> wrote:
>On Tue, 28 Apr 2026, Lee Shawn C <shawn.c.lee@intel.com> wrote:
>> Currently, kms_vrr tests fixed step increments within the VRR range.
>> To better validate hardware stability and potential issues across the=20
>> entire spectrum, this patch adds a 'full-range' testing mode.
>>
>> When the full-range flag is enabled, the test will:
>> 1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
>> 2. For standard testing, maintain the existing behavior of incrementing
>>    from minimum to maximum using the defined step size.
>>
>> v2: Fix build failure by adding documentation for the new subtest.
>>
>> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
>> ---
>>  tests/kms_vrr.c | 32 ++++++++++++++++++++++++++------
>>  1 file changed, 26 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index=20
>> 6043d40f1d74..b8a8c6aa79ed 100644
>> --- a/tests/kms_vrr.c
>> +++ b/tests/kms_vrr.c
>> @@ -66,6 +66,9 @@
>>   * Description: Test to create a Virtual Mode in VRR range and switch t=
o it
>>   * 		without a full modeset.
>>   *
>> + * SUBTEST: seamless-rr-switch-virtual-full
>> + * Description: Vrr seamless refresh rate switch for virtual modes=20
>> + using full range
>> + *
>>   * SUBTEST: lobf
>>   * Description: Test to validate link-off between active frames in non-=
psr
>>   *              operation
>> @@ -93,9 +96,10 @@ enum {
>>  	TEST_FLIPLINE =3D 1 << 3,
>>  	TEST_SEAMLESS_VRR =3D 1 << 4,
>>  	TEST_SEAMLESS_DRRS =3D 1 << 5,
>> -	TEST_SEAMLESS_VIRTUAL_RR =3D 1 << 6,
>> -	TEST_FASTSET =3D 1 << 7,
>> -	TEST_MAXMIN =3D 1 << 8,
>> +	TEST_SEAMLESS_VIRTUAL_RR_FAST =3D 1 << 6,
>> +	TEST_SEAMLESS_VIRTUAL_RR_FULL =3D 1 << 7,
>> +	TEST_FASTSET =3D 1 << 8,
>> +	TEST_MAXMIN =3D 1 << 9,
>>  	TEST_LINK_OFF =3D 1 << 10,
>>  	TEST_NEGATIVE =3D 1 << 11,
>>  	TEST_FORCE_RR =3D 1 << 12,
>> @@ -754,10 +758,12 @@ test_seamless_virtual_rr_basic(data_t *data, igt_c=
rtc_t *crtc,
>>  			       igt_output_t *output, uint32_t flags)  {
>>  	uint32_t result;
>> -	unsigned int vrefresh;
>> +	int vrefresh;
>>  	uint64_t rate[] =3D {0};
>>  	uint32_t step_size;
>> +	int start, end, step;
>>  	drmModeModeInfo virtual_mode;
>> +	bool full_vrr_range =3D !!(flags & TEST_SEAMLESS_VIRTUAL_RR_FULL);
>
>Nitpick, that !! is a thing of the past, and completely unnecessary with s=
tdbool.
>
>BR,
>Jani.
>

I will remove !! in patch v3. Thanks!

Best regards,
Shawn

>> =20
>>  	igt_info("Use HIGH_RR Mode as default\n");
>>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>> @@ -795,7 +801,17 @@ test_seamless_virtual_rr_basic(data_t *data, igt_cr=
tc_t *crtc,
>>  		   (((data->range.max + data->range.min) / 2) + step_size) :
>>  		   data->range.min + step_size;
>> =20
>> -	for ( ; vrefresh < data->range.max; vrefresh +=3D step_size) {
>> +	if (full_vrr_range) {
>> +		start =3D data->range.max;
>> +		end =3D data->range.min;
>> +		step =3D -1;
>> +	} else {
>> +		start =3D data->range.min;
>> +		end =3D data->range.max;
>> +		step =3D step_size;
>> +	}
>> +
>> +	for (vrefresh =3D start; (step > 0) ? (vrefresh <=3D end) : (vrefresh =
>=3D=20
>> +end); vrefresh +=3D step) {
>>  		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
>> =20
>>  		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n",=20
>> vrefresh); @@ -1103,7 +1119,11 @@ int igt_main_args("drs:", long_opts,=20
>> help_str, opt_handler, &data)
>> =20
>>  		igt_describe("Test to switch to any custom virtual mode in VRR range =
without modeset.");
>>  		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>> -			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VI=
RTUAL_RR);
>> +			run_vrr_test(&data, test_seamless_virtual_rr_basic,=20
>> +TEST_SEAMLESS_VIRTUAL_RR_FAST);
>> +
>> +		igt_describe("Test to switch to all virtual modes in VRR range withou=
t modeset.");
>> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-full")
>> +			run_vrr_test(&data, test_seamless_virtual_rr_basic,=20
>> +TEST_SEAMLESS_VIRTUAL_RR_FULL);
>> =20
>>  		igt_describe("Test to validate the link-off between active frames in =
"
>>  			     "non-PSR operation.");
>
>--
>Jani Nikula, Intel
