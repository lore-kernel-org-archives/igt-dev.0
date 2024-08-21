Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE74C52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 14:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FCC10E640;
	Wed, 21 Aug 2024 14:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYuXFPbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0997610E640
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724251624; x=1755787624;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=53M+rzzrAgCj7mUUMycuytke5S1Rx90mc+YtyXG86aE=;
 b=PYuXFPbKqVpov0bXWG/W3n6iuuwMs7BOZlpwCJ1huYaxQD2oLexjqT0N
 ma1w2OmnbPA4Dd+/JV/jzcstryjO/pmuIFUtgp2ATrMMfj2hfCzAmDFhX
 uG7p4R903zYAHNYynJRLX9TdlzNMO4prvjHslXW/2U1aQ0TxjKvl72ZRx
 75u+3LMy76T+uT3aLHLM8WFBY+jupdZ9c59Wi63qXnYSTcpBcN8BZsQuT
 qxCCPfqk9z0sQOKPy2L5bwjhDms+vK3WiGsCqsbZq09Ph4JCQiJWQpgxw
 kjLFMTtROee6yNcPlPCm+8q0NA+zCJM0QknbKsbG3SK9+8/1v7FJRYtxW w==;
X-CSE-ConnectionGUID: 9loGAcYuSNe6+WtQaXkHmg==
X-CSE-MsgGUID: +rdjDNunRlq5F7JoyoikUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33233356"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33233356"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:47:03 -0700
X-CSE-ConnectionGUID: ABpzHV4NTj2hst5S3u/ndg==
X-CSE-MsgGUID: AJrZw0S8StiBFLRxZeOruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61249133"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 07:47:04 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:47:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 07:47:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 07:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3+QtlP6A81WSHJ5t9a++0r/BbHM+kAP4uSjLxkqx0hu4C4uFHb0kdJHt8BNxFqTdjwOgYP90orvjnQYNVM822euWDZjOJS4MPDpA4F1HEzmI2U0P10bmwhYm27a8O+257MECtZtpcbYVGo4neox77vhmf+RCP/R9BpLegt+9/Q8+6qsaMxNWyCbaK00XykJkwjxNgJqpi3WqUxbNvd/gMysPPFL9J+CKsJH7+4pNicalaBaVfqWtcbG50YmzYVqDoTTZpNMaYpstIhh+ApoaMHD51cPzYGmGjVjDN8ttMMjtpYghJ5sQLIH3wGKIIKVSafq/JK1IGcBRv13aqjFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdeMKkSisqy/pTgOboIRN7Plz0pe0FsHgarA0gGVKqw=;
 b=kwws2CL/D5jbuYuY0n64gVfsXL4rep1VYxkiZkrKHRjOB6s7JXEy0rVB+erA0xSuHAxSSv9YAcxQFcm/DWw7gXPE+QdBDZsL5/ECpliVBZ2ByumPJwlPFAN2yf2Lg+80oFVnuej7pwe/PO9+PFm2B+QFt4Lrz+JF5KxWTKN9jsbjudCoJb6ylWiIHf9PE3cwx7mbH+DQ3v/TI0U+GuzXtdv+Je7QYrOXlqSWTmyEYuwGWbauNMXH3EurahCDX/7aTZ4foPpqEEIzCv1bXvZSlaAmqnx9I9V5WJzMKMzdzL8apuYgI8VQbJfMVKvEktzFB/KNsfFQFd0aO1AuT2OwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 14:46:50 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 14:46:49 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 3/5] tests/kms_content_protection: Rename
 igt_commit_style variable
Thread-Topic: [PATCH i-g-t 3/5] tests/kms_content_protection: Rename
 igt_commit_style variable
Thread-Index: AQHa8tkmsmcGK/ZnUE6vzzdJsEhqvbIxzBWw
Date: Wed, 21 Aug 2024 14:46:49 +0000
Message-ID: <DM4PR11MB631240075C24DA6F635C2C87908E2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240820081233.4092203-1-suraj.kandpal@intel.com>
 <20240820081233.4092203-4-suraj.kandpal@intel.com>
In-Reply-To: <20240820081233.4092203-4-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|LV2PR11MB6021:EE_
x-ms-office365-filtering-correlation-id: 48a8cafa-60f0-4ab0-3eaa-08dcc1f016bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?bwVG9JLpdFKL3fFZVLwyQ8ZkVErllPhQwXU1V+I1KPU6gE1YpFd4O3/8NLQd?=
 =?us-ascii?Q?cY4+ISXuvk495o2i2EUl0eCT13JwU6MGl7XzKn+eSm/zGv/NPy0HIiv8qbl5?=
 =?us-ascii?Q?Z66QQeEESQqg6ntJPWK/luSjCsFUVIngF4feau8x+RQEEf9WAjrlOWQHEkKA?=
 =?us-ascii?Q?7qvCRdwQwlUmZUWU7E5j22kI1NEsza5LmQx6bacHtm2Ghbca8JHBden7GxBp?=
 =?us-ascii?Q?Pj+l9MaCgj9/Joa5Pd2uA2g5UIcJLYLkWZqnFTJC0uqnMm1sGgc5UUVnFITi?=
 =?us-ascii?Q?uo+/LgioaIZuj/QJaTq6cmsct5yF0trqOY/tX0SHiw+vCtXE0ktVezlF2uvn?=
 =?us-ascii?Q?1aI05uWaAnRs4QR6b+jW01RFIgQoij/vZslNNPYR0Rw68nnIB99vyG+wc2kU?=
 =?us-ascii?Q?QIwpk6kA0NRheD4zIPzrngYLUGIgicv7dM67B71DOILl4XMYaA7t7LNCM095?=
 =?us-ascii?Q?aHpt+iJNnkVa9di3iLMETTzEakhVRnN+gWMFK7U6mulLEmi1tXRc20tOCNtF?=
 =?us-ascii?Q?tbFA684y3p7hbI54xY0JI9zHS1QLd5S1yUYqLMPg2gpOkKIDHTNJMqwFVUZs?=
 =?us-ascii?Q?gzgoizQl7LTocQV6V0Ha8yg0BVVtjfDuqNMh+Z4QbpolQnPWNrcbVY5QnU1Z?=
 =?us-ascii?Q?KQM65HpDVd7oRZO3qscM1DkidGiVXj7bTzNsj2pgQtkezEXUWA8qLuLry56R?=
 =?us-ascii?Q?NCesFPZlsBMOHjchXZ1XAihXm97lgI8OAEtjAJc2aA+2KBcCLOEXjLF+k7h7?=
 =?us-ascii?Q?iVjPT7Z9Fn0HqGrnobRMqHAcDHhxXzPVXiMpuYqr+vogY9vsuDIV7uRyY9S1?=
 =?us-ascii?Q?x0ZSAPbm2kLKFraR/YVnutKkaVcoLpHFPqOhO4Fmfa3+EXjEqG+X8/09N+l3?=
 =?us-ascii?Q?ToG1nRFccXw7j8elJEh0Q2zh/mNKrK3yqQCBak3MXRvWTCD3Jstaj42lFihb?=
 =?us-ascii?Q?MA1Z3Gfmnp2RmPaW96qVUzaWxxQStuIa/PVCRbmry3oHHCDIoeX6iWn27Flx?=
 =?us-ascii?Q?SqVBCHQy+auaWYttK0ipCfC0qsnIwKj/C53iLTkuJYxxFa6Y9iC+gtJEKWOZ?=
 =?us-ascii?Q?bCNu+UPrbt2t4LZqr4yRjiWT3RH4JcHtfLjRK2NUzmCcqk9p3QNqKlElJx7k?=
 =?us-ascii?Q?fjO64pv3nM3uyVXnQRfKFrpfJyQrk5tTV/0E7GX5sWYfGwOYGBhA2cE+JWnA?=
 =?us-ascii?Q?KdCxIrNLqFqpwz0ABlIJz/OtilYqGmwHgoiPEanqBgkFcbtNxTkeZlad+VfO?=
 =?us-ascii?Q?ne2ZHdIuRJA7aCjw3d/K/tCIrEDO/9jtFS87YCJxUShscj9AMSCZMKnX8wvK?=
 =?us-ascii?Q?YHNKB7ZtWuTfYMfQQ1GirndgljmxIFjahy222MiGNI3zNjgz4dZP3Qh/7DHl?=
 =?us-ascii?Q?6Dx4LDevQPgAtjAW6EcR7LNKvHBQw5tPPjqpTp3/S5fu2kdDQA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hAStTSvLartVPn5A1EmfGPbhxX0FP7CufinNjQFVK4Ezu6mCzHLs6FWvowO3?=
 =?us-ascii?Q?aPUGe5S7cir2W+DZ3We81A2Jg/KSg+VUcWhmj23rP5D8Q/s8/XaOnxdR8ouo?=
 =?us-ascii?Q?KrJlymm3G+cOQaSoB6uGdqFEV2/Yz3bFVVtE+LN/qQ/ED0Pz052/rgev9lTR?=
 =?us-ascii?Q?l4wNoSlFqtO4bhyVgOEFNr1u8lfGbSawTtonqEYgiZh8qKqf2/l4wgCrkkS5?=
 =?us-ascii?Q?lyXgpdwevxVWjyiTzi5NbXvT78nplVRsamxQD5a6hzmLbqapknK/1dkcdJX4?=
 =?us-ascii?Q?uSNgxTjAmm4O5lTVP8FZr//Ab9nlm07cxpnoGOXImtenpEAphNUCAMd2ZhGx?=
 =?us-ascii?Q?/TMBhJlyvu0WAdel7N3T+fFBQ8tm3DVEx6QwAaByWAsv0gnM3Lc8JLSwZLQ9?=
 =?us-ascii?Q?HLfZj/UIlVZrWyiuXDosJ4jvkEsHZ0Xo2xdHXyyWEIIxeKrYwyZbs5YZKEyQ?=
 =?us-ascii?Q?h1NugWbn3jNtpt1mZ1NYewC/6ApPgFWGil6b5zdEESFhLSMvXoJC0LMDhdR4?=
 =?us-ascii?Q?xAiosWXwxlybgsvuLMOtThlOZFAbxEF14rjOKb2+iDzBfFe2lCojd2tE7mmS?=
 =?us-ascii?Q?PEQHG1fIWAFUzewZKSZ3YSfN1y/Owp1/WOVdB88OGFCBBJn4uxXiYTpBUGV1?=
 =?us-ascii?Q?eFTs97jA5iSGBawgAvWA+UM9d8yEJAsaPWkPwQjJeb6Tnmp8oAGZ/5VLylqU?=
 =?us-ascii?Q?slEZNDvgaeSUm/41YFMufzQGmDtzXB/ApdNnTxdTbC4tGI+MUHQCsLe5d4OD?=
 =?us-ascii?Q?NmcE64BDq/3fP/L5PCjoekUVacrPrPFbTYnqzS8Jlau6T5/Qm1PlhXhcSARn?=
 =?us-ascii?Q?IZ6dcb2a0QjJbMTN9rR3beQehw0xC1YR5GSZteIb25+zfTnFNkIZGznFo5hw?=
 =?us-ascii?Q?J6ozKp98dcb61r4A+L7JPdXQvQ7YRfDiJ8jkk6wjMAWj7RKWfsJAQLvB3Mbb?=
 =?us-ascii?Q?PhJBO93O4Q5nIIYUWJ+SWZP3NGvUVEMbAM5AN4OQV+fyIhuD0GHuwIukBqBq?=
 =?us-ascii?Q?dOjxyLu9p3JKRED+dMtm5dKbuAsktWMklgwts3xmnSyuqoDwj2Pj/K1IR+b+?=
 =?us-ascii?Q?Y50tc9TYCwFwSvRgAbMjzerylzXFDdjXVgx9CTnku4hBz8AFR7eJ/X84cnk9?=
 =?us-ascii?Q?m+hOt935geff9lND5vIrvswn89/p1YkigMb6mw20Llxi5vaIGdUy5JyBc94F?=
 =?us-ascii?Q?iE5tAanZ35J7ArtdFYDc2ssW9+RlldVwlyHwvnPRjYHg/AOVSV/bAuZMVz3x?=
 =?us-ascii?Q?F/3gBB1n7r+CPGHm6DNuDmn2FfHNCJ72qCDD2Vn5fdDc40ODpK/0aB7HlwEl?=
 =?us-ascii?Q?nORmoAyg+V/WVnafN21Ca97LAQb0s9/cH9eYHjqk7qhjiz4ogJPCUQt8ho6U?=
 =?us-ascii?Q?RZPJvGxaxsOdRNIUD5L85jf8ZfEmTjCxz0tub0omSWf12EU5SBI2scG4Xbp1?=
 =?us-ascii?Q?3ygMWYVggnJCljYoiz1w6+f8fF0GM+abQMtDdDLb7Q7pbxiJ4KZ7bvXE/Xci?=
 =?us-ascii?Q?mMLN3s/HQXKSbkDbn2xydBOqLuExd79DiZ9MNEcXLtoB9WjT+9z+5OyOwvbd?=
 =?us-ascii?Q?ZrGPIT127dWfZAncJ90=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a8cafa-60f0-4ab0-3eaa-08dcc1f016bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 14:46:49.7417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XKmKC/4f1LhtysO2gbgvz92oqbSBlTXd5e7Dj1Kl8AatZA5ljTsx57xZy6QAuEuz9YjfVW3j9bfOQWGZKNAGMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Tuesday, August 20, 2024 1:43 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Su=
raj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 3/5] tests/kms_content_protection: Rename
> igt_commit_style variable
>=20
> Currently all igt_commit_style variables are declared using a single vari=
able
> which is not a good practice use commit_style naming instead.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_content_protection.c | 65 +++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 32 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index db6dc17b1..473686939 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -208,19 +208,19 @@ wait_for_prop_value(igt_output_t *output, uint64_t
> expected,  }
>=20
>  static void
> -commit_display_and_wait_for_flip(enum igt_commit_style s)
> +commit_display_and_wait_for_flip(enum igt_commit_style commit_style)
>  {
>  	int ret;
>  	uint32_t flag;
>=20
> -	if (s =3D=3D COMMIT_ATOMIC) {
> +	if (commit_style =3D=3D COMMIT_ATOMIC) {
>  		flag =3D DRM_MODE_PAGE_FLIP_EVENT |
> DRM_MODE_ATOMIC_ALLOW_MODESET;
>  		igt_display_commit_atomic(&data.display, flag, NULL);
>=20
>  		ret =3D wait_flip_event();
>  		igt_assert_f(!ret, "wait_flip_event failed. %d\n", ret);
>  	} else {
> -		igt_display_commit2(&data.display, s);
> +		igt_display_commit2(&data.display, commit_style);
>=20
>  		/* Wait for 50mSec */
>  		usleep(50 * 1000);
> @@ -228,7 +228,7 @@ commit_display_and_wait_for_flip(enum
> igt_commit_style s)  }
>=20
>  static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
> -			    enum igt_commit_style s)
> +			    enum igt_commit_style commit_style)
>  {
>  	igt_display_t *display =3D &data.display;
>  	drmModeModeInfo *mode;
> @@ -240,15 +240,15 @@ static void modeset_with_fb(const enum pipe pipe,
> igt_output_t *output,
>  	igt_plane_set_fb(primary, &data.red);
>  	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
>=20
> -	igt_display_commit2(display, s);
> +	igt_display_commit2(display, commit_style);
>=20
>  	igt_plane_set_fb(primary, &data.green);
>=20
>  	/* Wait for Flip completion before starting the HDCP authentication */
> -	commit_display_and_wait_for_flip(s);
> +	commit_display_and_wait_for_flip(commit_style);
>  }
>=20
> -static bool test_cp_enable(igt_output_t *output, enum igt_commit_style s=
,
> +static bool test_cp_enable(igt_output_t *output, enum igt_commit_style
> +commit_style,
>  			   int content_type, bool type_change)  {
>  	igt_display_t *display =3D &data.display; @@ -266,19 +266,19 @@ static
> bool test_cp_enable(igt_output_t *output, enum igt_commit_style s,
>  		igt_output_set_prop_value(output,
>=20
> IGT_CONNECTOR_HDCP_CONTENT_TYPE,
>  					  content_type);
> -	igt_display_commit2(display, s);
> +	igt_display_commit2(display, commit_style);
>=20
>  	ret =3D wait_for_prop_value(output, CP_ENABLED,
>  				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>  	if (ret) {
>  		igt_plane_set_fb(primary, &data.green);
> -		igt_display_commit2(display, s);
> +		igt_display_commit2(display, commit_style);
>  	}
>=20
>  	return ret;
>  }
>=20
> -static void test_cp_disable(igt_output_t *output, enum igt_commit_style =
s)
> +static void test_cp_disable(igt_output_t *output, enum igt_commit_style
> +commit_style)
>  {
>  	igt_display_t *display =3D &data.display;
>  	igt_plane_t *primary;
> @@ -293,7 +293,7 @@ static void test_cp_disable(igt_output_t *output, enu=
m
> igt_commit_style s)
>  	igt_output_set_prop_value(output,
> IGT_CONNECTOR_CONTENT_PROTECTION,
>  				  CP_UNDESIRED);
>  	igt_plane_set_fb(primary, &data.red);
> -	igt_display_commit2(display, s);
> +	igt_display_commit2(display, commit_style);
>=20
>  	/* Wait for HDCP to be disabled, before crtc off */
>  	ret =3D wait_for_prop_value(output, CP_UNDESIRED, @@ -302,8 +302,9
> @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_styl=
e s)
> }
>=20
>  static void test_cp_enable_with_retry(igt_output_t *output,
> -				      enum igt_commit_style s, int retry,
> -				      int content_type, bool expect_failure,
> +				      enum igt_commit_style commit_style,
> +				      int retry, int content_type,
> +				      bool expect_failure,
>  				      bool type_change)
>  {
>  	int retry_orig =3D retry;
> @@ -311,16 +312,16 @@ static void test_cp_enable_with_retry(igt_output_t
> *output,
>=20
>  	do {
>  		if (!type_change || retry_orig !=3D retry)
> -			test_cp_disable(output, s);
> +			test_cp_disable(output, commit_style);
>=20
> -		ret =3D test_cp_enable(output, s, content_type, type_change);
> +		ret =3D test_cp_enable(output, commit_style, content_type,
> +type_change);
>=20
>  		if (!ret && --retry)
>  			igt_debug("Retry (%d/2) ...\n", 3 - retry);
>  	} while (retry && !ret);
>=20
>  	if (!ret)
> -		test_cp_disable(output, s);
> +		test_cp_disable(output, commit_style);
>=20
>  	if (expect_failure)
>  		igt_assert_f(!ret,
> @@ -375,22 +376,22 @@ static bool write_srm_as_fw(const __u8 *srm, int
> len)
>=20
>  static void test_content_protection_on_output(igt_output_t *output,
>  					      enum pipe pipe,
> -					      enum igt_commit_style s,
> +					      enum igt_commit_style
> commit_style,
>  					      int content_type)
>  {
>  	igt_display_t *display =3D &data.display;
>  	bool ret;
>=20
> -	test_cp_enable_with_retry(output, s, 3, content_type, false,
> +	test_cp_enable_with_retry(output, commit_style, 3, content_type,
> +false,
>  				  false);
>=20
>  	if (data.cp_tests & CP_TYPE_CHANGE) {
>  		/* Type 1 -> Type 0 */
> -		test_cp_enable_with_retry(output, s, 3,
> +		test_cp_enable_with_retry(output, commit_style, 3,
>  					  HDCP_CONTENT_TYPE_0, false,
>  					  true);
>  		/* Type 0 -> Type 1 */
> -		test_cp_enable_with_retry(output, s, 3,
> +		test_cp_enable_with_retry(output, commit_style, 3,
>  					  content_type, false,
>  					  true);
>  	}
> @@ -400,14 +401,14 @@ static void
> test_content_protection_on_output(igt_output_t *output,
>  			     "mei_hdcp unload failed");
>=20
>  		/* Expected to fail */
> -		test_cp_enable_with_retry(output, s, 3,
> +		test_cp_enable_with_retry(output, commit_style, 3,
>  					  content_type, true, false);
>=20
>  		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
>  			     "mei_hdcp load failed");
>=20
>  		/* Expected to pass */
> -		test_cp_enable_with_retry(output, s, 3,
> +		test_cp_enable_with_retry(output, commit_style, 3,
>  					  content_type, false, false);
>  	}
>=20
> @@ -417,16 +418,16 @@ static void
> test_content_protection_on_output(igt_output_t *output,
>  	if (data.cp_tests & CP_DPMS) {
>  		igt_pipe_set_prop_value(display, pipe,
>  					IGT_CRTC_ACTIVE, 0);
> -		igt_display_commit2(display, s);
> +		igt_display_commit2(display, commit_style);
>=20
>  		igt_pipe_set_prop_value(display, pipe,
>  					IGT_CRTC_ACTIVE, 1);
> -		igt_display_commit2(display, s);
> +		igt_display_commit2(display, commit_style);
>=20
>  		ret =3D wait_for_prop_value(output, CP_ENABLED,
>=20
> KERNEL_AUTH_TIME_ALLOWED_MSEC);
>  		if (!ret)
> -			test_cp_enable_with_retry(output, s, 2,
> +			test_cp_enable_with_retry(output, commit_style, 2,
>  						  content_type, false,
>  						  false);
>  	}
> @@ -534,20 +535,20 @@ static bool output_hdcp_capable(igt_output_t
> *output, int content_type)  }
>=20
>  static void
> -test_fini(igt_output_t *output, enum igt_commit_style s)
> +test_fini(igt_output_t *output, enum igt_commit_style commit_style)
>  {
>  	igt_plane_t *primary;
>=20
> -	test_cp_disable(output, s);
> +	test_cp_disable(output, commit_style);
>  	primary =3D igt_output_get_plane_type(output,
>  					    DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_display_commit2(&data.display, s);
> +	igt_display_commit2(&data.display, commit_style);
>  }
>=20
>  static void
> -test_content_protection(enum igt_commit_style s, int content_type)
> +test_content_protection(enum igt_commit_style commit_style, int
> +content_type)
>  {
>  	igt_display_t *display =3D &data.display;
>  	igt_output_t *output;
> @@ -570,15 +571,15 @@ test_content_protection(enum igt_commit_style s,
> int content_type)
>  			if (!intel_pipe_output_combo_valid(display))
>  				continue;
>=20
> -			modeset_with_fb(pipe, output, s);
> +			modeset_with_fb(pipe, output, commit_style);
>=20
>  			if (!output_hdcp_capable(output, content_type))
>  				continue;
>=20
>  			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
> output->name)
> -				test_content_protection_on_output(output,
> pipe, s, content_type);
> +				test_content_protection_on_output(output,
> pipe, commit_style,
> +content_type);
>=20
> -			test_fini(output, s);
> +			test_fini(output, commit_style);
>  			/*
>  			 * Testing a output with a pipe is enough for HDCP
>  			 * testing. No ROI in testing the connector with other
> --
> 2.43.2

