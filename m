Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4727CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 09:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F5110E6BA;
	Wed,  1 Oct 2025 09:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQqu1ksI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D1310E6BA
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759309318; x=1790845318;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vCDthY+Uqt1xHi/x1dA7pXZft+tDUdJkTlt/saRzav8=;
 b=mQqu1ksI0m5f+uH7xkiQNSrybQxnhzrgkH5HDXutCj7DMC0ipGZq4eua
 6Ro0cE2qtASxRWnwy99FLECB/oZuQFt45tWpcNI+5OC8u7mTA73rN975H
 T4nRSlpjXtpELcPdGAP973PwFsRlorSMWQbTYR5g2/Crl/UB5CVhZnMJx
 cB9y/He4rEAH02xqisfdN7ZR33WrJQljl/dn5BF9tbX37LL+1Pcmn4Qwo
 QnMMCRCUBqa0TP6OydKWTm+GCyjazixyGkqEEXRd2SQFZXXTmi4pehAPc
 qT742gwoqs/JJ4QmxSdLSXWgVpCQhkSZorzCXC3pE2TsKGk1A1vXkTLKr Q==;
X-CSE-ConnectionGUID: FvSs6wnJQMmeuNWwjw6xqg==
X-CSE-MsgGUID: 4Ds9D6xMT2eOkXcNZYUgzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="71828200"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="71828200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:01:57 -0700
X-CSE-ConnectionGUID: 6ywQht5bS2yeOwcesuEccA==
X-CSE-MsgGUID: ae5poyNlSKeRrtLQ5g0Zig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="179506477"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 02:01:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 02:01:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 02:01:54 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 02:01:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr5GYuUCGO/ExOg1jwT2R9m7WubAdEe5aLr0PQLePMftD+D67mVsUo5qEH6F3cg9hTYawK8cvBmzOggQrgGDA85UNrbeKJ1nJHP/0uTrlBRpX5V1XLcfJ2YQBwlu670SUgBsIrpnyykpV1EEDwtcphIERUxwP/Q/BQCYIJ7Qvx/JK4X+N9LeOINjX+hAEYO3enQdAHhC76DjCgyuZgBvAaGWj6IpmLBnvd+9+ijH5ezx6NFPxdjXMJHdV+fXcUM1craN7qkWlpW4NmVjfZp/06XeMIxpvyA2XZWO5KTYtT/xLQqvvJ9DkITTQ+6PlTA3UoftOxXMcY/2P3EvupdeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LfqiEw9hP1DlAZ3NLSmWOAqAhr0Md3TRomOkPW4ONs=;
 b=N8ySzfwRwYrPqlq3WUe8Firdya2PE6fQCn2THwwViYO2zgRMJ17Q4U8y6iAK3tyAMJoOjz7+xUUgPAlllLkgFnh6J/Txbdb5ekx9ZpE4e5fQx71NAaYrsfizl4F/Nz3YwmS0r+oOXxSZa6k8iyMd2JG4oJbhoHzAbvxFf9StiUc79vdqfOEACo8RRk89yaW05t5HHbRME8G00RHXMjUXPni/wX8BmIiHH98/bLjsuZDePODRthqQC2x9ROoh8frStX1QIvcUP+gM+Xr31tGovNeg7Mo1YApOTTCtlaoQQ9vckOxpGATl+SHJcuOiVU3u7NjIRdukZ9tbonzTQ0KjDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 09:01:51 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 09:01:50 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2] tests/kms_vrr: Skip DRRS-related tests on LNL
 and newer platforms
Thread-Topic: [PATCH i-g-t v2] tests/kms_vrr: Skip DRRS-related tests on LNL
 and newer platforms
Thread-Index: AQHcLxKo6Ae/2uNxmE62XUh1EVNdV7StBa1Q
Date: Wed, 1 Oct 2025 09:01:50 +0000
Message-ID: <DM4PR11MB63129DEC337DF5019E82F51D90E6A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250924093226.3899875-1-ramanaidu.naladala@intel.com>
 <20250926182305.3939296-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250926182305.3939296-1-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|BL1PR11MB5223:EE_
x-ms-office365-filtering-correlation-id: 5c879dfe-1188-43c4-9444-08de00c928d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?eI0QS4vFUAGvHD5koXIHONCyBF+PxrEmYaX7kYepazeUefsyzMdNeytlXXyO?=
 =?us-ascii?Q?cuEXbMCJEzto90Rr22y53K0v+892bl1jt+y/QPT4omkSX6E/5Ndx9RDKnBIm?=
 =?us-ascii?Q?M3HWRiurwCHqZNAtLvibhBt6D5Fko/nRLLr6pfvTGzgu89UUTZRLlORdvzBb?=
 =?us-ascii?Q?J3Z7yEJCmKkzO5cgNAKFdTtiSoZdgiBAYFsjbsMWP9COoMGC5WtH9Y0fV6Qm?=
 =?us-ascii?Q?gBhqAPYIrthK8aVUTqZBmCfAb/taEdjBr3RIP0ABKCbIrYrj2UFrXdvOEcZx?=
 =?us-ascii?Q?kGUcLPBMcmbmKmwEOi0KwrRpcT25Cn47/PFUgbujGDFPInWYSW/lWKSmOWH4?=
 =?us-ascii?Q?YCfZAKwPm2IWECBm6g5y8xMyrzZhk2pe5uO6BsLW/EILHFEFKNUgx4P3w1so?=
 =?us-ascii?Q?IO+AQU5wyrfZC/zQmyOvyNCpMTSFpddly3sw6o6S4onhZpCGu+US668dW1jp?=
 =?us-ascii?Q?VKt1klf37yfm0DX1MsjjvhBWZTmk4ldT2gYI+FZgG2j1tl0ObY3rrWTjZ3TG?=
 =?us-ascii?Q?/vq+xkFyF3P2G97mpX5Za/SN7rqiKn12kxcDcVpOs3LbbFooynD/r+oxVNCd?=
 =?us-ascii?Q?wZZwyHp4cPim1OSsmAHcp11L9r5EEDJAPGhwi7bNDJL713Hc0lxTP2hwuuxs?=
 =?us-ascii?Q?ltWXtpnCOcliqnJfBhw+jbYy4kBaYxvSAWmh7QFJP6i3F5V2mnu66799IW8i?=
 =?us-ascii?Q?I6cXyV5WzVBX+lBQ4RRCIc6daTwnzu4386Vxq7na5dxEhj44BBN4ap+8Tsfu?=
 =?us-ascii?Q?9JM7+RuJzqc79pd/2KN0vEMBKYVASD5BaUfRvuQHQ6d/oKpnxac1EBRF+sZA?=
 =?us-ascii?Q?lsBWSRwb88LZgSJwbn4/pz231z5skWd8uAXGrOf3ZSFSHBZTStcCmmqC67UD?=
 =?us-ascii?Q?00s4+Ty0/93ersAHx4G8nXQdqc+87D6P/jDw3iquMjTxO3pH1Gt41BoBVlGO?=
 =?us-ascii?Q?l6alshijB1MSYSa3FPiAEcfPwHdiCXUCrFVpW60SNky59xsS7t6roylHpyag?=
 =?us-ascii?Q?4EH3ORRVF5iMPa/0Sfkz2/yl+/6PptK3FKSPxJLxWnQKLumeGNXox7/dYGf4?=
 =?us-ascii?Q?kvzRJMyPR4FLBwYCqTvqZav5Fstb/DWOu9OOB5fyuHGEqFEGZFQWxOEG/bwd?=
 =?us-ascii?Q?lCCT/VN+l+kvQ9kN9zuhRDM+m3s41F05/Iau/VGqL65054mfVyChB4+SpbyH?=
 =?us-ascii?Q?RyAPjP3Kq0Yv6k90T+AiA+OtxCVCbiXAvE3gAx/u1ewPTKRJXPE1VihMKCfZ?=
 =?us-ascii?Q?lDoScEOuR3aV/rcaFvLjfO3Fia5kvqyiDRB9aTpsLHlsD2PpJTCBMRXSgvAD?=
 =?us-ascii?Q?xTuN21MG5Hy/7E9tMaOhuNP1+80lev005y92iQuPxIS6h0g2xMxfKLuDesqw?=
 =?us-ascii?Q?2hiknXkCkZYFb0yjAWdKcIB7ppgt3ldWfl/YO8LJhPlVbElMZrIVuQBSQs7N?=
 =?us-ascii?Q?IF+gaKkmc54Sq/7g24rvgZL1kspSfxB38hTCU5RcYQc9mSh+5EkSLRcvYmDX?=
 =?us-ascii?Q?KZjPH2NCyFGC1nNG63Cepjpb2repbg4/u9GX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3SKlIRFoVjMFrrc1iCsjwgOA9pvGWZrplfcfLFhlJVwJpbNK/0dc9Fupxm2U?=
 =?us-ascii?Q?cdZXNZPkApwK4S1nGu8QPk59Mj0HLwZGdcOILGDsq4GKi5G4PtKULyhuAFXX?=
 =?us-ascii?Q?AWV7iwp0u11lwhFfiQ5gMYojVxC4JF6/DpRpyAY3RZa8eslHMIMxff5IqkOS?=
 =?us-ascii?Q?IjNZqYTf0rpMTW9yI2A+ScZgLXiiJdq1p4ig39nKkmiUxepe5sYuf5e9OfmQ?=
 =?us-ascii?Q?zqLkMvNEIENKYnXov9FPYJJUZKjuODi4YnXjYO4ao7mAuJtPH6SI/ujHcUt1?=
 =?us-ascii?Q?0ZIA3vnMZ0wMfhjwA5CKWZBMCmxo4giokpAA5Le51VacloXqQ4OzWap7r9pg?=
 =?us-ascii?Q?WBWMwxks3CVM2vKvUdUZkoDz3cqHHdI7ukbgzmZKGOOENt4X/fDp3M/SRLQz?=
 =?us-ascii?Q?w47mkq2uazUvGhepNYEBvTSZq72yQrtTbyjUOH42mvlBam83UIsJAIDKztHl?=
 =?us-ascii?Q?KwAOIRwNkQOYvEJMWCmEo85gJk6HJXP9f+8QR6TS2/fe9e8MMz2zmS8W0AVq?=
 =?us-ascii?Q?s53tuoj7bFMwmHIbBzHXHPdfZqoVdQ+YDp3FGN5tqtraoxZWB2Sdvx8EihCU?=
 =?us-ascii?Q?d52QUs6OdQM7Roh/OIENANDm0hKkT/stwqFnAn9WJOEk4z0I5NQpdxEKDxAu?=
 =?us-ascii?Q?3K5u87eJbY1z5kcGkuWsIbLkD6u1pTFGjaHmmVpg4A0iO2vM9ziZ3sBHGTDW?=
 =?us-ascii?Q?q+xWOxjky3d4+njirB2I3YqDaGImymQvNj3nClLW3rZTz+kVYBrO2bevf6ey?=
 =?us-ascii?Q?ihX/Z5YszRwelw+gE+8YxCH7WmQaymmZgN8u2kKEX55BiGK24nPnCPsHovSh?=
 =?us-ascii?Q?V2rlhe0XaitcNcPje6OAaqAauxAAUhGh++uixCRsg3UazAX62stJIKElLkxe?=
 =?us-ascii?Q?tIhn1sRvwge0CGLzhnBhMignmk26vFbyqXxR5aXpV/gn1Ufm/eQjJX21dFgm?=
 =?us-ascii?Q?WoxF2FrGN9LtyP+x5r5bkRScgB5R1uWjBK00thwEaXWfRPPi9FPyCUq5GpqA?=
 =?us-ascii?Q?xkx4zzk4S+VP9lISJhvOXNmu64sk2GZfX3kvDgTSNifKKte/8/HwsDAL/frf?=
 =?us-ascii?Q?7/2q3RosnzeMePBazV6XgB3dICgAYa4zcmBCJQEmkK+4OmkoXLub2JV6uUR+?=
 =?us-ascii?Q?3njbdrC+Lij6yY+3TevlF5pl++5cPVFuHDKUZcRhhw9QrYwKuy6vdejMw+mI?=
 =?us-ascii?Q?4xD3dA78Xxr0ROLzKpB6dMwndANEs7xrhEX5d26DzzrvzDiTKxdSrh0sJhaP?=
 =?us-ascii?Q?ok7HDdmIFRF9WjQkzrw09aeXLN0lLoSNa6w0CORCbqO0gfiodOwQ/3fnZFf4?=
 =?us-ascii?Q?EEz7r1HBOVrv+9DF6plAeT/sfHVlSkcfqiQrcjW2Ymo3h2sG4CoVsx1GHwQ0?=
 =?us-ascii?Q?mxtl19P2doHpcbOa5KFcFAhPXSm3Wi1K0RRp0VP4sIKIpmls+k8H/Ano9hYA?=
 =?us-ascii?Q?PQdGXVsQ0R95kVIX5q+iraOEkXtA6CZ4HsL3eAVUcRcFo/fGYtOSBzKTKr44?=
 =?us-ascii?Q?+mavxBvjxQtqZixrL0KH4R2FFdRkuHoU5w4Nd0mgd6d4isjH29emNIMeHe9E?=
 =?us-ascii?Q?ueR1dmS7lWu5bslRC9c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c879dfe-1188-43c4-9444-08de00c928d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 09:01:50.6121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dc1c9bfQjEsry6CoTMkzxrl/Gw/fmT4ayWS1dHDJRasEK5fpt0BViMYHkTQVcxEEjOhHO3yMGddkVVS9dXwc/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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

Please add v2: details=20
With this small change Patch LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Friday, September 26, 2025 11:53 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_vrr: Skip DRRS-related tests on LNL a=
nd
> newer platforms
>=20
> To prevent false failures and maintain test relevance, seamless VRR and D=
RRS
> test cases are skipped. This ensures the test suite aligns with current h=
ardware
> capabilities and avoids unnecessary execution on platforms where DRRS is =
no
> longer supported.
>=20
> Bspec: 68917
> HSD: 14016007525
> Link: https://lore.kernel.org/intel-gfx/20250912135926.18910-1-
> ville.syrjala@linux.intel.com/
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 233143770..ee0f057d5
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1016,7 +1016,7 @@ static bool config_constraint(data_t *data,
> igt_output_t *output, uint32_t flags
>  		return false;
>  	}
>=20
> -	if (flags & TEST_SEAMLESS_DRRS)
> +	if (flags & TEST_LINK_OFF)
>  		goto out;
>=20
>  	/* For Negative tests, panel should be non-vrr. */ @@ -1030,6 +1030,12
> @@ static bool config_constraint(data_t *data, igt_output_t *output, uint=
32_t
> flags
>  		return false;
>  	}
>=20
> +	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
> +	    (intel_display_ver(data->drm_fd) >=3D 14)) {
> +		igt_info("DRRS is not supported on LNL and newer platforms\n");
> +		return false;
> +	}
> +
>  out:
>  	if (!output_constraint(data, output, flags))
>  		return false;
> --
> 2.43.0

