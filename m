Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A2AC5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 06:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A426D10E36F;
	Tue, 18 Aug 2026 06:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dd5M+3kQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB5010E4E3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 06:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787034048; x=1818570048;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7LX8lJN9IYkairRe22nl/0kR/zKyvgETfvlmqDkEDp0=;
 b=dd5M+3kQjZphhXruUWGevskH5gQkGbutvF5Sq898kqqHutEssApKWUb/
 +PQlECk0KXPqBug+l2UOl873bJV6C353HM0BAe3LVp9dF0LGYBODWUPxS
 HByVNGJ472GV09H80Azh4yf1AcIYJCxNf2t4gtFCmB0ZVCtnN9TXgdFqm
 OmmJQGNfzByXyewPHNBuyOoqzH5gJymsHtDcxbWB28JO5dbEyXJxZVi7/
 ruZPKBdtS6wvT2xpJVxmBh84otsLn8KyX3xe8BgsgVwAchPiZ5dWjOssl
 yfsR0kjMr7yaBrzpfqYGd74fZuw7L5AXftgJVuzmbtqqd74k5hCLtgaEl g==;
X-CSE-ConnectionGUID: at1rvRuFRL63OMTxGsC4Rw==
X-CSE-MsgGUID: I/o2K52ORZi7k3A5IWNFFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98669311"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98669311"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:20:48 -0700
X-CSE-ConnectionGUID: 0sNVvNx4SGSboDpOMh0QVQ==
X-CSE-MsgGUID: lrf0zqwdQbSR2z85NmqQGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="303361636"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 23:20:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 23:20:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 23:20:47 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 23:20:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfDxpvqMYxSFpOnphhEwhmiWw88r+Cn+kgbh1pSEiHcrX97d+NLqBIM01h3t2GfoD0GqvVHx8Uc8ldLMjUn/FYhBLR41V0rUmKPwqTmBdsvKFL3wz9MaRCNbdfxwzGMtXYx8cO4kMtrLKChuR6rdXuizCElVlRYDQsLCU8mPeLBGvw3ewEBhSKSw2uwsdIDlyBDzadB9dfHgRVK1PIBJXwZbIL8l4LsgHoCDCP+DHZTKMypxapsWq3Xb7TZPBqhYqZohF/uPfHOiaVyxqjMqBWsTPdpb+uSTnnRiyUMuLd+Ac3Aeh0DznqQYjmnW1oRFHWKZOJNuVKBKLCcviSosqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ts7Aq3u5tDqMl8adFJWQHeJVaGBvw3ayumMq+ECgILo=;
 b=x2lgjc+9y1nLz6VXjx9zG210UEXkp3jaIVIjbj6bUeMrgDzLoLlbNmS7UPBDkcP3DZjX4ZbfoY6OdgS8OQlym+5DJLIabwEz2Ac0fRWMc/UO/3I9qQydWc3NU3tv1sE/Pkw/MDkQN0pwTmNAn2IKieo3dB+UrSfpnhzaAHbaZtwWFFDQN//E9a7yWJM9HFgIPhrszSWvBQFmwJ9fSSmeCC4Ko0pRbGZHXOjpjVwMxsV7Z9nXGDUDkStxWr4E4fwRbjHvA7Ld11mV5OsW9P288Uy2sHULvUV9Ryy+6ENE9nLDD14Ot4G1HUpUYQEtfN5N09ovOmuvcTUX5uHcokih7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 06:20:39 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 06:20:39 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Gupta, Varun"
 <varun.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_prefetch_fault: refactor test to
 accept shader function pointer
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_prefetch_fault: refactor test
 to accept shader function pointer
Thread-Index: AQHdLtJJPfQkN0NEG0Ov5JiyxJr0PbajUzCggAACeJA=
Date: Tue, 18 Aug 2026 06:20:39 +0000
Message-ID: <CH3PR11MB843432058246939149A593818DA62@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260818052716.156973-1-varun.gupta@intel.com>
 <20260818052716.156973-2-varun.gupta@intel.com>
 <CH3PR11MB843416DECAF595448C4167438DA62@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB843416DECAF595448C4167438DA62@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MN2PR11MB4758:EE_
x-ms-office365-filtering-correlation-id: efec5913-bdf9-440b-35b3-08defcf0d32f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|23010399003|376014|6133799003|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info: IZhasab+fYGqEhwwGi84bKf39HgUYiVykouvlHZ7FTg/zF5gQl1TACpcsNTyJp2Pwt4RZL7MwZgDF3r3hQWgaiaYsG08k9DXabywn7lSUemMiySa64zR0MbfWgHKO0xV2AF6EMwEc/YXhN2PqmeQkYRDqb7qQYGgVcn3903XN8bv+SHLvyjbnS8NtJ9zAvlZ1c4GU0S6U6donZv1tVlP01F9vmvdq+sZC8OWNdo6baj+kPYOom+fV4G6ZnqsatUG+qsLF+qFrz0X6xs+3beVrneD1jmaKlgaimuL2dqBFNm9hibQ6rbf4xespdHSIZTIYWDiPXGE+Ds1wt5H5BYrQ2vxUznXGAsm3ZMGCf3OwBZsNTUZ/T5+YBd21McsTb4p71CV4vPwatgbzSpDlkA1IIKlu+EHdxwgaJhZF1e4KhPPbm5/QZWH4g5uSTcJryG6VGDl9hMP1j9E/V0UGQpe9lnq2u1CpL53Ik0XQ/KTejPpsCOy73yYEWhaPxyTcyPUEovv3XMNj8Gew8lDiQ/jcmvF2cgOFAgsW3LgcIUY4iSb4hqJ9gDDsZ2G6oMlrIR+gWbV2gBRIughSsMadrzbQFMlV/pavdbWmuPNlETgeqQ+LncqimT38A01zORvFYJmIBSeYCgRPI1QlGIIoF1kYnWhDviRslmuSbBj1f8RJrdoa04hlH3lFUg1eYDRRwwMF4IVlJ0w347Q8SL0m3jRfHHsNiH+boUQiH2sGlrd8yI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(376014)(6133799003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?coy6I902tv8+tVrLWj2Ko674Z1ucnYGNuNMmvvOQF0fO15+A6NJI/eqx1FYe?=
 =?us-ascii?Q?gIUpS+94Mm1CMaBeppSxoLDIA3KAFd5fcZnAxVoIuyavd0YwXXQm3Hu5QJfR?=
 =?us-ascii?Q?/5OmGkA0aPu18UlRUeNNTYHGmlWP3PFqamzctO+U6fegNL9TsZ4NvZEvKKO8?=
 =?us-ascii?Q?Yp5xtXaSZsyvAh2guTRm2bkYS+7hOfDFrfowshV6yGXkFBDWc1nRroh7L1qu?=
 =?us-ascii?Q?LjwRlIazwxqk9myYHZM9RHdU822HEHphCA9bJwRY1Hy4jhvtceiE3aEx9uVy?=
 =?us-ascii?Q?MDgsfRMEx6w9YxUGnosVUIWPiOFily3OKLdmOeCnYi3n+cS0NK4XqNDIt6vy?=
 =?us-ascii?Q?N/sfx8QAS1zcEWjEOJROdnJ2uZDv4fiV5+DJxAQyC2ObCQ/w3cbEEgFdfqF2?=
 =?us-ascii?Q?5cxaMYQpiuFc/x02iC7KJA6ddws2amdXTZeq8X7fGzXTabolKixekmDZJmtJ?=
 =?us-ascii?Q?/Qe1GmdXha7KoHsOzH1zbDkHYKFYcBJ6D+UYT7/eSA2YxwhhSwkvLHnpFOKL?=
 =?us-ascii?Q?WSmDRUq2KegX5ZSXhqfYMBBmR5a21zoYv2Dqr8Iz1OK7lIkIvK6hkpm3YB0/?=
 =?us-ascii?Q?i3MDhYu4Xkw69HS+2NEAO1f4oUTguq5Yy8JNsNDj/SeDpRmq4Y6UAwja100q?=
 =?us-ascii?Q?q53WHjsfHRz0jgDtO0806ikfcoSYb8EAMwWdTHv/7N7LgkgDhwTu2IAU7lZl?=
 =?us-ascii?Q?E4DjrPd2xzGNBO6yWm1Zw5vP9qwwTrHDoBKWLJ2da4b//UgVlX4+P+Aafo18?=
 =?us-ascii?Q?YzvZfB5ltcjoPba4fmSqtZI632hRyB8waEnbZq7Zw3zF1gwflHCKrKAEwamJ?=
 =?us-ascii?Q?JV3iDst3uzNqv481pN+g9pgOc5UudskpV3L/x0MDYeSmK8Zt2v3E+s3P1ErN?=
 =?us-ascii?Q?UVcdhBI1KABBiSpwNyyfbcge72J/kpmCBJF0C+QcpkPJnLpLZ4xas4D/u8sy?=
 =?us-ascii?Q?Yaxfpn2+uzksUdOx4uGDKTNMWc+eOsxqyR6NiVs0tEAm1aemNiObgut6P3B6?=
 =?us-ascii?Q?SAfhFL6Bt5wpwhciFC2WqifbcIcoCaEh3nENB00HrMKloj70wT2dvhIdcX+b?=
 =?us-ascii?Q?oKMt1xcxOqEjD9QfAL08LGPDaZTb4hhOhEqs2yJlyp8eVaHEVLeDLyyokxtv?=
 =?us-ascii?Q?uiNklb51gSVTUr/gMe+29Hvej4FoQDEcOddXKjUrP2grNPBgOp07xABsTIIH?=
 =?us-ascii?Q?RnfwoM2GNGPoMOUpFzKdce8z8H56coH7oxjCE2xt3eShNbMO82oEgEY7S8ID?=
 =?us-ascii?Q?CE2xj1nCLUZFBZoH9t1/X3204KtzTtmrDsa3bkqZ4NR2mHEytbS9sdpRXB+4?=
 =?us-ascii?Q?eCH3t2f0PT0Hf7Goo9Vx2EHN70ENiegTU8B7xtFQb7+C0q1GGNEkJp3lgOoy?=
 =?us-ascii?Q?KEnib+iooIiIPgCRS6zIu+eNmh7yVi/R39GPOLmgfCK0em0mkLRaNQWfgCtH?=
 =?us-ascii?Q?uQ9eKF3B+6VUfMBg1chjZCyMbmBMPGFXuDqvWCY0qDVYGCsSc+sPAPh6TQZD?=
 =?us-ascii?Q?ONocXLKcP6crwf84jDS54RxTRzqV90UYHE8xQwK3ry1KfKcHNPe8EBYT1U7+?=
 =?us-ascii?Q?5FV34G6y8y/jEIRwv+AqgKj0QnAsWrmbdNxiEltl/IwmJp3i2CV3HWSBqJy/?=
 =?us-ascii?Q?Wmkd3Xen8It5jZmBk213DJq5Btut4RrY8P0h2FEgU/i3TvIMgh97chQeuOvG?=
 =?us-ascii?Q?MCmY2EcjKz3tuHN+iWontt+37xVM3J2PEmbS2vOYbv1Ump4S+ElY9HA9Vc7T?=
 =?us-ascii?Q?PC9cP4EcH+R7dqvnNZq0Fjc3iiFXCa283OEpEs96ynk/WXvUkEgprab9YFcP?=
x-ms-exchange-antispam-messagedata-1: 94WIN9lR1XsotA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LsLGEFCm6hajcJYkJ6cAKgh2OiFElX35mySBeb1GxCIw/rbJ2sM6s7Gflg8VbKdrQ8N0R7acQ8i/F8DLX4Gdu6UaDVO6MFLzF+12w+gLipnb1x0LT4x8QSCCOMvtRWla3nBPdrk0YjnmtK3SZG0h6hgNJo4jNaAuPNV40gLgfT3sDxdigdA2IqaANIiokoiwuK9c1kXSFhYfcPmODEKebfWborJHBNnHo2n1Xr7MVY0lyZLErsnk2OjE4Aoi/ucWH/5Ju4pb2M7a4/5p78bS6lVjxgG+Y0sPWV/PsnqQxgbzQoAFFG23dZzL7pBjuVQyl9dQrv9UxIgyC67PfKXH3A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efec5913-bdf9-440b-35b3-08defcf0d32f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 06:20:39.8223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zLmjvlkuOi3lC7pMpTa/s/HhlKy+Zk8YvWjV6rR5xfg+A9+WSKyF2sVl2snA8iGYnvj3Ni3mZ2rPQHBi5ZkvB5HFcqXDqFE4X3s6bbphU7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Dandamudi, Priyanka
> Sent: 18 August 2026 11:42 AM
> To: Gupta, Varun <varun.gupta@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_prefetch_fault: refactor te=
st to
> accept shader function pointer
>=20
>=20
>=20
> > -----Original Message-----
> > From: Gupta, Varun <varun.gupta@intel.com>
> > Sent: 18 August 2026 10:57 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > Subject: [PATCH i-g-t 1/2] tests/intel/xe_prefetch_fault: refactor
> > test to accept shader function pointer
> >
> > Parameterize test_prefetch_fault() to accept a shader getter function
> > pointer instead of hardcoding get_prefetch_shader(). This enables
> > reuse of the same test logic with different shader configurations
> > (e.g., L2 prefetch fault shaders) without duplicating the test function=
.
> >
> > No functional change for existing subtests.
> >
> > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > ---
> >  tests/intel/xe_prefetch_fault.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/tests/intel/xe_prefetch_fault.c
> > b/tests/intel/xe_prefetch_fault.c index d3b5aff47..e86cd68d9 100644
> > --- a/tests/intel/xe_prefetch_fault.c
> > +++ b/tests/intel/xe_prefetch_fault.c
> > @@ -117,9 +117,11 @@ static struct intel_bb
> > *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
> >  	return ibb;
> >  }
> >
> > +typedef struct gpgpu_shader *(*get_shader_fn)(int fd);
> > +
> >  static struct gpgpu_shader *get_prefetch_shader(int fd)  {
> > -	static struct gpgpu_shader *shader;
> > +	struct gpgpu_shader *shader;
> >
> >  	shader =3D gpgpu_shader_create(fd);
> >  	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd,
> > PREFETCH_ADDR)); @@ -130,14 +132,17 @@ static struct gpgpu_shader
> > *get_prefetch_shader(int fd)
> >
> >  /**
> >   * SUBTEST: prefetch-fault
> > - * Description: Validate prefetch fault and hit-under-miss behavior
> > + * Description: Validate L1 prefetch fault and hit-under-miss behavior=
 with
> > + *		L1 cached, L2 cached cache policy (fault source: LSC)
> >   * Run type: FULL
> >   *
> >   * SUBTEST: prefetch-fault-svm
> > - * Description: Validate prefetch fault and hit-under-miss behavior
> > in SVM mode
> > + * Description: Validate L1 prefetch fault and hit-under-miss behavior=
 in
> SVM
> > + *		mode with L1 cached, L2 cached cache policy (fault source:
> > LSC)
> >   * Run type: FULL
> >   */
> > -static void test_prefetch_fault(int fd, struct
> > drm_xe_engine_class_instance *hwe, bool svm)
> > +static void test_prefetch_fault(int fd, struct
> > +drm_xe_engine_class_instance
> > *hwe,
> > +				bool svm, get_shader_fn get_shader)
> >  {
> >  	uint64_t bb_offset =3D BB_OFFSET;
> >  	/*
> > @@ -191,7 +196,7 @@ static void test_prefetch_fault(int fd, struct
> > drm_xe_engine_class_instance *hwe
> >  	ibb =3D xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset,
> > bb_size);
> >  	intel_bb_set_lr_mode(ibb, true);
> >
> > -	shader =3D get_prefetch_shader(fd);
> > +	shader =3D get_shader(fd);
> >  	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
> >  	gpgpu_shader_destroy(shader);
> >  	intel_bb_sync(ibb);
> > @@ -225,7 +230,7 @@ static void test_prefetch_fault(int fd, struct
> > drm_xe_engine_class_instance *hwe
> >  	ibb =3D xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset2,
> > bb_size);
> >  	intel_bb_set_lr_mode(ibb, true);
> >
> > -	shader =3D get_prefetch_shader(fd);
> > +	shader =3D get_shader(fd);
> >  	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
> >  	gpgpu_shader_destroy(shader);
> >  	intel_bb_sync(ibb);
> > @@ -271,7 +276,8 @@ int igt_main()
> >  			    hwe->engine_class =3D=3D
> > DRM_XE_ENGINE_CLASS_COMPUTE) {
> >  				igt_dynamic_f("%s%d",
> > xe_engine_class_string(hwe->engine_class),
> >  					      hwe->engine_instance)
> > -					test_prefetch_fault(fd, hwe, false);
> > +					test_prefetch_fault(fd, hwe, false,
> > +
> > get_prefetch_shader);
> >  			}
> >  		}
> >  	}
> > @@ -284,7 +290,8 @@ int igt_main()
> >  			    hwe->engine_class =3D=3D
> > DRM_XE_ENGINE_CLASS_COMPUTE) {
> >  				igt_dynamic_f("%s%d",
> > xe_engine_class_string(hwe->engine_class),
> >  					      hwe->engine_instance)
> > -					test_prefetch_fault(fd, hwe, true);
> > +					test_prefetch_fault(fd, hwe, true,
> > +
> > get_prefetch_shader);
> >  			}
> LGTM,
> Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >  		}
Build failed, can you check once.
> >  	}
> > --
> > 2.43.0

