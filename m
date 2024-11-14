Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01877D6DDD7
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 06:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F7710E3A2;
	Fri, 15 Nov 2024 06:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8YFRlwo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E21410E3A4
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 06:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731652963; x=1763188963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tLImXrjhHkz58Aw7kgII0WE2RTZ4t0jh2mpNYnJYLwQ=;
 b=h8YFRlwoH2KSUSq17j49PqoFElrFhcuInEj4EsMrKHRd+f9E9lZEUUi3
 xx+vJU7Hu2a9tIl7dvs/v+Z7949xQzoB7awPNUntxiux3J1dTd0SYVDOh
 LPyPUcTtyc3Z5A9WTSjHII3zEnIvaSXZoZpcvu9PufLLPf0exyMdUrFFX
 /e8sAKt65hJ8+N4i/bzFDaJwQphrLlf5pt3p6f8HWqu+4F8eP3jcCX0dz
 ysmhUR92X4Mq/aO5kdpQ8U4BYUNxJA/qFE6xty+B50af7A4dHRIQjx/l0
 kOCjpKLSWKIqZnzRbr6HzpPrADUxLurrO3hwKzBKvLfyillLCU8XU1DI1 Q==;
X-CSE-ConnectionGUID: j58r+dvMQ+CR2UEG4roGkg==
X-CSE-MsgGUID: 7iwEcVkOQYSoiSig0S04Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31582338"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31582338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 14:00:17 -0800
X-CSE-ConnectionGUID: PuQ3Ek2gRYKJ34tRxkAVTA==
X-CSE-MsgGUID: jLxhvktsTK+LjyKKrbvGzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="92771318"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 14:00:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 14:00:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 14:00:15 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 14:00:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhoZ31nGC4aJXSIgx/LM6r3x6SesBQrxnBqhEptL1noHpK0lVgOj2E0LXrJm966EMSFEJU4njSK7sgcWMva+N0qhAYCuU/UC+Xj1PXJvkZpkeLLShPf7Ef6uJ/zGmyFJ4OropfX1nUiJIRXtlfp1cZJTLAWkEMn9NHytQaDmm8vH43i08bkUVj3SEDx1I+AplwuOo/abBbieAARMOHUjRFD2XmmyCDc3tuTBasO1dE2NJl8ybfbcFC69EzrJ3lstU64jR3qsdyZyqUpY1Wyn/OPVQORe/m44FX5SxWI+ClZ5kvJCgtbS2Z5i+vhOm//PFViI2t53DtsF9Pev6VYRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTWZDg2RUj40CR5F6duYKiPxBBaIq8ybElqe7rS67WU=;
 b=BTzkgK5txyhK9Aye4RdjbVASzDtGKMNlUoAepcynrpyJR9F8bsRKKZ9XMu6p+Lb2Ji0tJSFij7JXUiYNkU0ioSAoDcnZvuhMecyfGwQyl6dsjXu5KdrKrZdV/lHR2w3QPeEHBdmFOFIkLiA4adNV/aKPx1N+BlqW5jzjsxg9IgUNM1UAwjIgsy0QHA13C8NuyXP6/VPZ2vnnsuN0RFLDGx4aKCPK/YLWNCPWRtmjZ1bNNj92dYsbhC6ZD2CAm83yDiIO+vlvFJGnNY/GFCWeHUg0TY8t8Mzrqi8+0GKGSMnxb6bY5IH4npzc2wNJs0DbJnzByrLd+V3Q3mWcSiTS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6074.namprd11.prod.outlook.com (2603:10b6:208:3d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 22:00:08 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 22:00:08 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Maslak, Jan" <jan.maslak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "Maslak, Jan"
 <jan.maslak@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] tests/xe_eudebug_online: update thread count handling
 in query_attention_bitmask_size()
Thread-Topic: [PATCH 2/2] tests/xe_eudebug_online: update thread count
 handling in query_attention_bitmask_size()
Thread-Index: AQHbNrJwrIv4CrClzk68IMrAgUlD3rK3TxOg
Date: Thu, 14 Nov 2024 22:00:08 +0000
Message-ID: <CH0PR11MB5444648043D98A231D7187DAE55B2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241114162843.1210570-1-jan.maslak@intel.com>
 <20241114162843.1210570-3-jan.maslak@intel.com>
In-Reply-To: <20241114162843.1210570-3-jan.maslak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6074:EE_
x-ms-office365-filtering-correlation-id: c4709f45-9ad9-44ac-6835-08dd04f7b477
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kOkqX7hMD7r1sTrHiLtv57TATiPGzNMI6jzcEU58Md3DGpZkroPbJhK1V0s+?=
 =?us-ascii?Q?WG0fl9rNeM5whWMmsHAbPG/OjQTNrL8x+KiaBY2lVruXG3oEt8YPNC9IyEVL?=
 =?us-ascii?Q?Gxnb7n0n3CinNbiVRLOC/Je1P7+qjlgc4IrUvlQFhslz27BZCX/A72HD4nem?=
 =?us-ascii?Q?P2aYLpNT7jv2bu/fww3ZTj/Flp61GICqKdjJt8bn1NCfgCuAxkhYeC6Emn4v?=
 =?us-ascii?Q?ubDYHCyxEHjeGOVc8LUXgbO9BH0pjNU3Pxw84uJP3nzof5rz9adZMGb04CXs?=
 =?us-ascii?Q?uKPlyahGHL/L+UqrZPWRYb2b76DX2pE3mIu9biGZG+8mPA6PHXnUu4MYhRIg?=
 =?us-ascii?Q?FrtwF5jgw+mgRgCDAWq2e77ikJzYnPI4nzGJlEo30lOirvp8WX8j4TJ4zmfL?=
 =?us-ascii?Q?S1RNX1GPKjqEUxJ/QzUMv0UPyvxeSpuGeRlxfMJg8KgVeAkA7chmwAwUJIiM?=
 =?us-ascii?Q?qPqLeZMoH4zKcDYQEdx/vPFyN8emGdPFeme6V4E7ZBv1Nf+thy8U/Z3+W5YJ?=
 =?us-ascii?Q?nDzzd+u5kLjZSHIJz58RRpXMsonFAFMNE7JQMguNh1G1GeefEzkdfjovPEYY?=
 =?us-ascii?Q?dOSAeLx7RBzVOiGGyETVtVP3NN/skFQyhwg8PksmEqO3uUR2VBKMxL7anDbE?=
 =?us-ascii?Q?ASm4znEslG4nTysjTuwq0YxZXIi5ssoU8yXmweOKjDPpjWKbmkxje7MDvlw5?=
 =?us-ascii?Q?c1nmnX3yp3fh4BTfEVAWYVZC4xMEE5VTx50XpBc9UOqLB0g3feDXBHb6A8SQ?=
 =?us-ascii?Q?/5xOAOTaLTBWw36ugtlpHk27xpPhvfHe9oJRBx11X0Z6k3FqBYY77qGbmaYH?=
 =?us-ascii?Q?UgRbkv78w+S/GO9ywDWggkE9fbUSAuSwp/IjzMVa5clUV9uXqCCsRyv6WoUa?=
 =?us-ascii?Q?tWS8Lu/K7e1ckgudQWqCEANOo8tToWDyS90xu3RXvHmzP+xhzbzkXP1zT2JU?=
 =?us-ascii?Q?He9J+ixB78hGq5JEY9VfM9iSwx1x+evSbzYPJZo5vX0WePcXG18uZ4f/+4m4?=
 =?us-ascii?Q?AfUuzv8y37kCAvtzujHoXcMqXEhIiGvRLyzmlS6EXrubuWG7bH21QVWnSf9H?=
 =?us-ascii?Q?yg7PdbGDhocrk29vqX++4PEKCkC+10baK3i2XM0yhtyb0CorT4VF4Hj7IQbG?=
 =?us-ascii?Q?RcjUNQmaKSfWfG43bex75mm2w6TIHgAsxinB26nOWVimqMeCaGULemI32QlV?=
 =?us-ascii?Q?dvhOu+BcpuV1lYRCW+T/AATFjPp0Q2LFHKvJjVU/e+7zbA1xFwRQYi17dNs1?=
 =?us-ascii?Q?54zbFf/wyGocBh3ynzRYkDKjoYHUojJMskVZOBs5uj2dtSQ61/peYVvMYhsy?=
 =?us-ascii?Q?6s8v3nq3IdiIO+pbA5pIT1Ck1PkQ2yVuYUiutr+NJ4IRgJ2RhoONdmbV4vIP?=
 =?us-ascii?Q?7UIYKBA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kEnGQ582DLPdzhL2nxdC6kAx4oEEt84/CR/o5FktChwo6KrN0iFIBapoo8Te?=
 =?us-ascii?Q?wX13vMZLvZmTjAQD378xX4hwqLvPkfNkGfUIptdQuJzORJRF72VARKEjgA4F?=
 =?us-ascii?Q?56LnfaDK2N7WbenCaldpJXytwGBmcrCGU90yqc5h2mPb8IAeRvx4AwW6eBC0?=
 =?us-ascii?Q?0OexoCj4/tfOcSestI7otYyy4zlUIawgBAMxGKxNmd41jIHz+vciIPBDRg2g?=
 =?us-ascii?Q?ZPWbADTUaemTivGe02pfPPX7Wls1uqoNTGGkGZMhKgnsD5MiTs2MNJy67Uxx?=
 =?us-ascii?Q?j/g7KcOihSQBw4IG7TEwv3OXmzCsofNu6GB6GmPfsoC5bSm9exZYmceN5wbK?=
 =?us-ascii?Q?UCyxVFSVpIRML5LXXgH9d7GL+vu+a5NatFCJ/1+ZnrUon16jR00ZYWnU9NdM?=
 =?us-ascii?Q?SSW8JyFxYJ51P26hqTZCLtKAEtUXqX7ohjJiJx7RNWikKLoO0TQQJ1AX7Jg/?=
 =?us-ascii?Q?RbmLwRe0PgoNKJ5iM7zMTzSlt+aXaqgwXjfo+P9UJONK+unVdpTURIYuMg4a?=
 =?us-ascii?Q?hbYybg/RCJBKFCQB3toI7Wp0HI1pQ1YGGhloX8zeYk8aqtzw8ySIxTk3B4DD?=
 =?us-ascii?Q?GInwkqDgh0Zq8m6u/SvkgzrdISdpNbfdej42ebbSDAkjhiqPrbf/JUt4w79H?=
 =?us-ascii?Q?7gq9PG1PDOIfc4PVF0COrIQu3cRDx5itgH6Jw85+8xaXnn69TsOYizbfwwHJ?=
 =?us-ascii?Q?7zqzrrLlkPw2sW4FfGl5R5vZww2989YRfniZzUzkvudxapHEzrsK0suKbDbQ?=
 =?us-ascii?Q?481kCX5Gu85zxPc+vRlsOmAOdsl+8Y5n3BIum/mebT5Ujxn5D95DjJU1W0FG?=
 =?us-ascii?Q?uxejkR2dmzZhvUMczY4W7UusBVz99UYUk4vK9blFpgVrFkQcPZ0XG8EB/sUf?=
 =?us-ascii?Q?gwYiJ+w9qQH6Fj7Kif6NHraRXH85OvL0dKmyWna8O2y1u1h+K/+AQ2a0F3qL?=
 =?us-ascii?Q?SQyejr3MkJM3s6UGWYancAsCwZykBaAmJ9RMPHMrho6aVQLzOg0+GzVYoPsP?=
 =?us-ascii?Q?hnWQkn7nYf87UfVBSVaUkFrB6n3jqM8j7e4q5M01z4HAAI93JhGtCpyFetJp?=
 =?us-ascii?Q?OgXv4+rtbFVyVuT0N9I5uuqbTTHE0w3noqmmYb7atXS/LSZloMB3Y93xIteh?=
 =?us-ascii?Q?FQmcmUva3dZrYkYcPeNabERQ3KaOXzKJclXdywszVQ5ATwdj2IfXndBPZ+EK?=
 =?us-ascii?Q?n/YyatIiTEVqH6Eq1dxZ/mwa+SDhJN1VB8rm0dOtAYvQRjePn1M4ODeeRR8D?=
 =?us-ascii?Q?7SbmHRDz3bLbl1/rnZfWtUsNAu6RF9oKckw+5mH/s+JlkXBLTFONsLNUeMEM?=
 =?us-ascii?Q?fM1ZL2EPaC/jjumox1uQJJpfmed1aI2k7K3uJUaHE3SkMd4FuGOqs3utnbBj?=
 =?us-ascii?Q?Z4SgMvLYtXGhByoS1rPL4rduAQWyBRcQj3LRDkoWwN9OQWyM5DLFgqaO1jNf?=
 =?us-ascii?Q?NhITEARBDgk0qkfPdhq6rVtN+oTfysCaBzVJn3gQ121CBFUaqVWXp853Zwzo?=
 =?us-ascii?Q?VJUQXWkfYJ9RqBnNX2rL2Tt4ACl31Cy+eOzKESQNEWlJCfSImGOQLgx1/isv?=
 =?us-ascii?Q?gpw4TH4zNA2a8K89uRfb62WADH3RwLX6LS97EwFIxIsCBkFYRSzi9+a9P0ij?=
 =?us-ascii?Q?4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4709f45-9ad9-44ac-6835-08dd04f7b477
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 22:00:08.7234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yx2EfG3pTCxhV6QQrJErgY0IKSRmIVdKaez9bnlBMHI7Wn0uSncjarz1wYnRAU8trhADJuqsJJJ4BkOItreXOfpDn6fJPMQHp5Cd3893VMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6074
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Maslak, =
Jan
Sent: Thursday, November 14, 2024 8:29 AM
To: igt-dev@lists.freedesktop.org
Cc: Grzegorzek, Dominik <dominik.grzegorzek@intel.com>; Maslak, Jan <jan.ma=
slak@intel.com>
Subject: [PATCH 2/2] tests/xe_eudebug_online: update thread count handling =
in query_attention_bitmask_size()
>=20
> ---

This patch seems to be missing a commit message.  The commit message doesn'=
t need
to be particularly complicated, as long as it explains what the patch does =
and why it's
necessary.  Though the specifics of what needs to go here depend on your de=
cisions with
regards to the notes I gave for the prior patch, so I can't exactly give an=
 example here.

>  tests/intel/xe_eudebug_online.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index 0ef0d8093..514c59f8a 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1118,7 +1118,9 @@ static bool intel_gen_has_lockstep_eus(int fd)
> =20
>  static int query_attention_bitmask_size(int fd, int gt)
>  {
> -	const unsigned int threads =3D 8;
> +	uint32_t thread_count_len;
> +	uint32_t* thread_count_ptr;
> +	uint32_t thread_count;
>  	struct drm_xe_query_topology_mask *c_dss =3D NULL, *g_dss =3D NULL, *eu=
_per_dss =3D NULL;
>  	struct drm_xe_query_topology_mask *topology;
>  	struct drm_xe_device_query query =3D {
> @@ -1130,6 +1132,10 @@ static int query_attention_bitmask_size(int fd, in=
t gt)
>  	int pos =3D 0, eus;
>  	uint8_t *any_dss;
> =20
> +	thread_count_ptr =3D xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_TH=
READS_PER_EU, &thread_count_len);

My notes for here depend on how the prior patch is changed.

If you decide to commit fully to the suggested changes in the prior patch,
then instead of looking up the full value here, you'd want to grab the
xe_device using xe_device_get, read the value from the hwconfig attribute,
then free the xe_device using xe_device_free at the end of the test.

On the other hand, if the prior patch remains relatively unchanged, then at=
 the
very least this function may need to be broken up into multiple lines, as i=
t
presently exceeds the soft cap of 100 characters per line.

Something like this should barely skirt under the limit:
"""
	thread_count_ptr =3D xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREA=
DS_PER_EU,
						             &thread_count_len);
"""
Though, the white space may need to be fixed when copying over to
the IGT suite proper.

-Jonathan Cavitt

> +	igt_assert(thread_count_ptr);
> +	thread_count =3D *thread_count_ptr;
> +
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>  	igt_assert_neq(query.size, 0);
> =20
> @@ -1178,8 +1184,9 @@ static int query_attention_bitmask_size(int fd, int=
 gt)
> =20
>  	free(any_dss);
>  	free(topology);
> +	free(thread_count_ptr);
> =20
> -	return eus * threads / 8;
> +	return eus * DIV_ROUND_UP(thread_count, 8);
>  }
> =20
>  static struct drm_xe_eudebug_event_exec_queue *
> --=20
> 2.34.1
>=20
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wy=
dzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-=
316 | Kapital zakladowy 200.000 PLN.
> Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu us=
tawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w tra=
nsakcjach handlowych.
>=20
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresa=
ta i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej =
wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jaki=
ekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the=
 sole use of the intended recipient(s). If you are not the intended recipie=
nt, please contact the sender and delete all copies; any review or distribu=
tion by others is strictly prohibited.
>=20
>=20
