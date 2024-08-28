Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A587C5474A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 05:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD8410E4A6;
	Wed, 28 Aug 2024 05:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ll7YTtAf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B7210E4A7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 05:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724824313; x=1756360313;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zENxHNowPsbgOD7xm8FHpdHMeO2ANlk87tpM8Gf3RtQ=;
 b=ll7YTtAfMJ8hg7VXq1IdFJvbNLwAvKk8O00lmY8+6jNktxC7L8BQPxmm
 9dG/QpO3LSMnPSGW/ACffF2LqFUpXNvr8OhaEWzC8b00rYpoluSkrM4Am
 SN5d5PWEhIxbI8FeV+7xCpwoVMgt8EwQ2Kbs1xiGu4WHmfVbmHFGlkaMj
 VDA+ua7PQGYLFqaqdb1bZfGMu+GyeG9ns0NJIp189xPCfjg6ifVv5JoPU
 EXDlKWaDeQAWbWuS2ipzbvZv73JP+DDdi0lBL1Dp7ECG5sGyksX27XIVi
 5TSjQZ0nHy1Zp8GPs2xfs1Gf7peQnJK0WLliwdMs5ZVe5BOxFkqUZTu3K w==;
X-CSE-ConnectionGUID: zGibOmxcSuGM6v1Y154DFg==
X-CSE-MsgGUID: NLUJwzGcSXi30LNxx6VGag==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="34741014"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="34741014"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 22:51:53 -0700
X-CSE-ConnectionGUID: DYn2Qz0gSrOypSMBqRX2Pw==
X-CSE-MsgGUID: DR1Sok5DQmKjOFjjJy4P4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="62834668"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 22:51:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 22:51:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 22:51:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 22:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFYUw9t20nNOn120VxjUcCb1dvkI41EAxYRzEEYm+w57jhOkKiCtkq65Pzq9uR919+0u4UrgvMQqRaMPVzRyWDnjIG7PF1sfgIDtVFSXIm3axJ2Bf0Ih6rykUpE3VVlae1D4WfplqTnd+qbCeM5oHUUnWuR2ARrrE7pAlIj+fMTGVz/4/RqyB3IEpXU/GM+jAMXCRqEytRZgYWlcuNQOBus6ABeY59G95VwL+fN2eRuT9FxUayqAWVfhe0SoCvWS5V6lMZVmrnr0G74/rMKbMEzBQEJcJewWyGhVnDukCO7CC86qMmbrttNYdv5tt64ggpeUtQ1Gv/1oSKtk7jzA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRhcvoWHcbSKtJJnJcuTbi/2OoE5P7Ufs5YVDsPz1mI=;
 b=KdycMel6UOF2kNTMwSxIbwILOfyLzCue7+vfOQXLZQuTJieB7Cz3IWknz5eEMd/1FevYrHk+qw2FTQmC6+h1UjD5rgURg7RDhvnoLGiEAbuhKpxJWFsflHCP+p4q3Zj2BybP5qYYroIoqgqlBufDHoHOxHvwrWLJUe5vPCIP67Q2UoCSQcqyZH7Rp7ZrEceTyz3ga6zx2B+CgcKoYl4CwxYhDw/sxlyzK7+n5C+YzI5VDMb38RLV8WqHUThoFKbQQkZ/hyZsRbAEu5Ha3NUfQXMSJ3rt7f/jIW8rP2u39QWqoqT1ArzruL5TEzJjJY/x9n5Kazdvafe9F5JgBGCLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CY8PR11MB6962.namprd11.prod.outlook.com (2603:10b6:930:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 05:51:50 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 05:51:50 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t v5 4/4] tests/intel/kms_pm_dc: Add polling for
 deep-pkgc
Thread-Topic: [PATCH i-g-t v5 4/4] tests/intel/kms_pm_dc: Add polling for
 deep-pkgc
Thread-Index: AQHa+H5rDDA0pybbbUekHK4/bVe5FbI8KuzQ
Date: Wed, 28 Aug 2024 05:51:50 +0000
Message-ID: <SN7PR11MB675036F9CA2C00F649F99568E3952@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
 <20240827124018.1373304-5-ramanaidu.naladala@intel.com>
In-Reply-To: <20240827124018.1373304-5-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CY8PR11MB6962:EE_
x-ms-office365-filtering-correlation-id: 9d6bfd01-5d16-4be9-a0f9-08dcc72582cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?uwVTRHL8NAuEKzPM8ypNE/EsytYgFB/vKeW9GFQhV8s62LW/DuPDzzwlDLPm?=
 =?us-ascii?Q?yzVdgUixIviWd7+LLDd1RdWrISKRqxgy0wbczo1XtUE+PcIDdIvms0ITqHBy?=
 =?us-ascii?Q?mNBE1tHiQHbBr1vo1qjTq3FIgdSjFmII+rEkgavgD+IojCqxeONF0fACF+nN?=
 =?us-ascii?Q?LecZgdbXoWa1k1koGbzz8LzY6WokU0g59BGl5H9RGREsirGmjps3xSAw2S48?=
 =?us-ascii?Q?edYlo9Wz7G+3z6doZX98ZkCJnfHSSKi08Qc+6yzbHbcHdJfqrpt7Wff6Zny8?=
 =?us-ascii?Q?bVrMX9J51ZRbyOHEF3Wu8oYjLTJBzMy+v+ZqyO429RNWV9IiHl1CYHpJl+hi?=
 =?us-ascii?Q?ApvxMiqJsR6GbsZlwwMAqxn2fzpkPVGzNaclTyg7WZPm+MNUxkTeYTWr7da6?=
 =?us-ascii?Q?MqlPj4MROfx0hQJtI13SwMkerSDsjnsulVQXJR29oV6LA8emdiF8/Omt84hd?=
 =?us-ascii?Q?YVZQbF+r1RI35m7pem7h6ekl28a7zSubjS5h/iIa4Tg3rgQB4RWhfiDNT5tk?=
 =?us-ascii?Q?pGg6mXS6Xl9AY381Dwn035j4o3RECmXwK+CYyEXoWKZtBt9KeuNmM5CZGO6X?=
 =?us-ascii?Q?LCFf54zxnZTmXt3sJsitgpYlWlmY5IE/Yds6Cd7JYUkxMuhJ2/qI54vcTe40?=
 =?us-ascii?Q?XmNkvTYg70I82ilp+GkleAUiSrc1AvJWZo3iFwMvTjYMbmmtF8B1wSjfnNac?=
 =?us-ascii?Q?axFfC+pnT1VFbDMEpWUd+J7RItUk2Kt8TlakuQqb+cB6XkW7TiC7Wb/Dm0tS?=
 =?us-ascii?Q?ciAEQgPHpzGTjZmsH5A7bnZ8Hfuj0bq+wGqDDVOhWFL0SI35hgNvxbj32TND?=
 =?us-ascii?Q?Bj5rZSrzN3fxAdZsDxZn+sAspXOleNm2ulcZagi8Us2Bqox7zYe+FkCyYCF0?=
 =?us-ascii?Q?9N5B8zuHDeOoNVqoam6RnX2hGSdDXVLGJu1ufDW2Hssm9HBfvlWd7ZnunpI4?=
 =?us-ascii?Q?i2St0xm+HkCuJ1j4JbmFrSvbDNxmhanCjd8c5cx1Y3v3f+kXhZxh1j39Ze8Y?=
 =?us-ascii?Q?5EHRDZgoiNDflsmOuWOlv4BC/HrO1Xf0+JQw/utyq6QsUxeQVehaK34Tih1u?=
 =?us-ascii?Q?zW1013SYt/7UQWLssQM6PW3rEF2Nus5Z1Q58D35AdyVlHpx75ejZwSlB64C+?=
 =?us-ascii?Q?7eU+AuKoTtSXd0d8viUDwiMbVOFZQm9703mfrUKyZyiMaVEvAQtsUfmK+2WH?=
 =?us-ascii?Q?8kZxliYLaHcdemZkj/6ZBIbT6zmpX1N0yDThNX/546f2dlZxzGZlylEY1y3e?=
 =?us-ascii?Q?YSTEY6cKqWnaMLrcIWcxC5IJzFmxN4G1zbcdU+9pt8nb1GT9dAYanHcRNZgM?=
 =?us-ascii?Q?72UixLZ/df3hvWiQbDLFbwUik8QpGJNZbjYKGil64wIz5jkDcBtdMB3ipeCL?=
 =?us-ascii?Q?XM9BZsg7dtpYaGnBx27JaTjzvS0VO52Iuja1Kyo/2gmUT/ICbA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3xXyMfQYUFsaEkTSnPdNOSRxF+UU4Pml7aGLDWh6c+AuJslXCyrG876/g4E/?=
 =?us-ascii?Q?9J8yysOKDr8zc5kzz+w4VK+eHh9d5VcqeGyiv9vEa9KIcetDDNRnwfVgTFIi?=
 =?us-ascii?Q?HTkJ6TxtmHKINOyDR8NkCD7aastMw5kEnNnU39z5J+HA7QQNWKY12IBE83p8?=
 =?us-ascii?Q?9h0zNsPYNadkkz+OpvjtoKRd7htb//5MXdLkLPXpd87qsDNaJ0k2FNCjE7jl?=
 =?us-ascii?Q?YiHfdGM74qSYBJZ9vaGXgY/nHDx2bYiP7HlAyeUvbL3W7tExmRfu7DY+eqKO?=
 =?us-ascii?Q?a2YSoF3Cd+L98ShSFf/vmNMnyd2QYJUjfKA3B7Mi4N4ckzTNXc9AVOed9YvU?=
 =?us-ascii?Q?WI8jwKT4p7IrJU5Js783EeA887XkRwOlCLo/X2Q6WC4O1IPsWJIkEFbJYxKw?=
 =?us-ascii?Q?tc7xT4xO5IpYYZwfge7xyY+lYbkPn1PXebH+W3oZKnp8JzPRGHdW96mLiWEY?=
 =?us-ascii?Q?Z7mV+qXA7ObzWS+yz0CWOn0T/nDehJnWtnxNNzEquwrwkm4GIouv0HfVBuoS?=
 =?us-ascii?Q?+fpb50KcqINVJsN85+Nx663diZcAz/WkFZgEV7Ck5OZPBBgXO4+opvfrr4c7?=
 =?us-ascii?Q?4hiLt3pehoTcl7fEQo59kdR+db7HpmpyvKNVWjq6ypgEI6eSLCVm0DCKLevS?=
 =?us-ascii?Q?DnzAfEYfIM7ZK01Z2o6D+g0pWMwmDXOpvIzlxn/7iXqB0RtNVvdugsBgaiUY?=
 =?us-ascii?Q?1RP7O/fi2x5MkAbiQnyrgPNM+jxUDXjzZTljOATbLgGckNCOO9Sel3OHF9WE?=
 =?us-ascii?Q?HlEXUIOsujz/k+DAO9Hevp20f5RxrGPWRhmcDN4yOCWZPI8n2frPl9awxFmw?=
 =?us-ascii?Q?5SEbh+2KsaotDad96uka5sSTBMyYrfyfgGWmiJmbaUEeU8V4mNHu6CYzCJh1?=
 =?us-ascii?Q?0xx0CWORITYJxX9HwkVzRn/2rzZgJGqDYBqzmNkmQJclMwreNxXDx5SHxfJ/?=
 =?us-ascii?Q?HfmpnMezOmwsF9z+pBGvuvK+HzUi3ujOZi06SBI8mDPlcT8x3rbMyIDGU1UD?=
 =?us-ascii?Q?gP2Y2PN822FvY5lizxRezbAjUsfaoCmu3C+Si4CNK8jmtlSNz83cjb4w70bq?=
 =?us-ascii?Q?xj+HIsbGE6uxhm2DHin5zyXfJ40ekRt8Pa7bPbB+g6upGIAQwmEJe/ObjpZB?=
 =?us-ascii?Q?sZY46mjrapo+39pummmiB9VSRsHdD8RnKS1sx+appkp20xr6iT+0g2diN+++?=
 =?us-ascii?Q?L9aDwzLP6OS7snMpciOKZsUh81qIk9v/+aY3PuPg2kfnUm4ClNLJfuEwr9qE?=
 =?us-ascii?Q?TOcQFOtNWMDWt7ot2uppqS7DRZGQvPYDmu7MV/RbZuHzxo8x0Qf0rMOBcdyy?=
 =?us-ascii?Q?mMk3oU140EE992wiJRbF6c4scNAYnE8USFTc+K9pDYV2fJgTidZsRA8z8EQG?=
 =?us-ascii?Q?goAxsQSprJBL6pKW50WDs6z/mDlGtmEU/FcJdZdxwEH8iHa84ghSfid+uYtX?=
 =?us-ascii?Q?T1mw7TVcqJD8iOVnesHj3fpruBRAHJCx+y+9EwHvDvX3fVj+9+p1jk5hCLct?=
 =?us-ascii?Q?nMma4286iklwgIAnzwVxjW2VNQemk8jQQA3QaCDGKWGClF1ik5P37uKVbLhw?=
 =?us-ascii?Q?yvFrT2ft9MucOqfWc/MhUfQlWxySS1qu9JfBhdkH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6bfd01-5d16-4be9-a0f9-08dcc72582cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 05:51:50.1555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2zuCz+PeEid3QW0JXTFvtuV6KlMZQwYntBQq15maQ4/iE02wkA6oIldeHWWegpuDuEeqseNm9Q3+OZQY/gYwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6962
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Tuesday, August 27, 2024 6:10 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v5 4/4] tests/intel/kms_pm_dc: Add polling for deep=
-pkgc
>=20
> It should be enhance the test_deep_pkgc_state function to include the
> following changes:

The above statement makes no sense=20
Reword it to Include the following changes to enahance test_deep_pkgc_state=
():

Rest LGTM,

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> - Add an interval variable to control the delay between checks.
> - Add a wait for vblank to sync the frame time before reading
>   the package C-state counter.
> - Introduce a half-frame delay to ensure the flip occurs when
>   the frame is active.
> - Modify the loop to use igt_wait for better handling of the
>   package C-state counter read.
> - Remove redundant usleep call to streamline the delay handling.
>=20
> v2: Address and correct review comments (Suraj, Jeevan)
> v3: Update commit subject/message.  (Kamil)
> v4: Update commit subject/message and added comments. (Suraj)
> v5: Update commit subject/message. (Suraj)
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> a69876fc7..b378cacbc 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -641,22 +641,25 @@ static void test_deep_pkgc_state(data_t *data)
>  	setup_videoplayback(data);
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
> -	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> -
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
> +	/* Wait for the vblank to sync the frame time */
> +	igt_wait_for_vblank_count(data->drm_fd, data-
> >display.pipes[pipe].crtc_offset, 1);
> +	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> +	/* Add a half-frame delay to ensure the flip occurs when the frame is
> active. */
> +	usleep(delay * 0.5);
>=20
>  	while (time(NULL) - start < duration) {
>  		flip =3D !flip;
>  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data-
> >fb_rgr);
>  		igt_display_commit(&data->display);
>=20
> -		cur_val =3D read_pkgc_counter(data->debugfs_root_fd);
> +		igt_wait((cur_val =3D read_pkgc_counter(data-
> >debugfs_root_fd)) > pre_val,
> +						      (delay * 2), (5 * MSEC));
>  		if (cur_val > pre_val) {
>  			pkgc_flag =3D true;
>  			break;
>  		}
> -		usleep(delay);
>  	}
>=20
>  	cleanup_dc3co_fbs(data);
> --
> 2.43.0

