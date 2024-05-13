Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC42C25B78
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 16:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D201810E854;
	Mon, 13 May 2024 16:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQvs7pmF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9E910E854
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715618893; x=1747154893;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Re5Z1ryTny6/ElqAKPjLEKQdrhyKbAvnh3enuDAJSBo=;
 b=HQvs7pmFTpK7c0vZlR+WezPLIKSvMm20V6VDY71cDY4lia/1+S1Jnmal
 waCVDIRh8WAhxnlSRLph3h+5LnESVRhRB9hNKSZ+aGgKCdIsqvmmKcpcz
 2wq/Y9/hL5urQEmr9eCIwuu7rZwjposNRbw8CvJXdKRdevw3UkwKutWmn
 c+XivZx7+kBrjhgNGLWyE81l7zPGv2F7hMCnaZJWpg8MspoFI/n8eXvHv
 HlNHgkKuqJSzmddSuJ/NluDvooshK7Xnr2jzJJb9RSe5BNjnWYme8XQ8c
 qgM/dvQHdILu2h2wdUxpaOczLXf4bcrmyLbh2jPV/TMdJidKuhROz66gT w==;
X-CSE-ConnectionGUID: hCpeON55QsKMVcHJ+nhBcA==
X-CSE-MsgGUID: VGwQ1Bh6SrK0KlcanspUSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11724237"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11724237"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:48:12 -0700
X-CSE-ConnectionGUID: +EnqpcgxRRWgJ9V2jbMfDg==
X-CSE-MsgGUID: YNOP+IzeTfmgbW3YkbkPfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="35267082"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 09:48:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 09:48:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 09:48:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 09:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WF/A/F3ko/S57jAD6k0DMBmN2o/3IK/fm7A0RpnhWO+rUWN8gQTZ+FccRJx3hBrywvxdwC8enlUH84WluCkmnphMGTldfvu8f1vIv+o9cjpumLCpIVshpBUp2r+KWv0pjTF/3glvO+QFuw6UGCT1eCf1l9pZbi1Zc/oHSepeoYLdOMBPrzAy//d5J87QDZityBGg/OEOQG3A5+pvn/OYZxAtm7cAQ7G5ZZYe6hEforLjVH2wb3qJM0ivP3VY9taHl/rwhdRdK23cSN5YqUaPtZFwQmri/YDJShsmcNk8weq9QgW4GabqCZg7VUXLM4Y5obRnN3fcvz1kzTgAs4uOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udNv+isM4NTHE5OpUZCHGN2ft6sVK+qXTIMGupRJWCk=;
 b=lfcnFdqV/YCu85iNK7PPjafaIyGDZ3rSpd9PELZeP7h1KgWUvnk5mSt6jvouTBCCdufQ7mhcB2F6BbKFPqsqGLCxZ+7w63l7bpPXMgw0ddcwjibikm+iep6JG7RBlJ/8IlVZIV8hCyuewFzx+ifSaJ7kPNrRBcsEgC5jPcp+4AibIeFdL4yZWUUiT1M+gE8KKcwmsD4iUPSVJaaq6geXXSioSxbtid4QR03v9snr2Ihfvmnm5Y0TvCUDZFhk55DUXdwWRYJn9H+eIBZ+AlQEDD6rKiHFxDxyYC8N6Bs3sna0EN8HTmJDXEdCDiT66OdwP8CBToAVVJdL3DOyz62cpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 16:48:09 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 16:48:09 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
CC: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH i-g-t 1/3] tests/intel/xe_pm: Rename and clarify
 mocs_suspend_resume
Thread-Topic: [PATCH i-g-t 1/3] tests/intel/xe_pm: Rename and clarify
 mocs_suspend_resume
Thread-Index: AQHapVH+w2JzHx9k20GWh32wqhc2kLGVX9HQ
Date: Mon, 13 May 2024 16:48:09 +0000
Message-ID: <CH0PR11MB544415E83CBD7730621407EDE5E22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
In-Reply-To: <20240513162435.952578-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM6PR11MB4756:EE_
x-ms-office365-filtering-correlation-id: ba33302b-a5ca-49ca-52fa-08dc736c7879
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?JmcEuTXLxk8MKDKZsea1Nd6BWLALZlN/LAVinmh3bnywRyykQrAUxYTHCPiS?=
 =?us-ascii?Q?CkjGk6o5ilAIpZ9JqKCqf0ghKQZse4ddSHpEp2UGblzfE/QxVgcUSIajvMSv?=
 =?us-ascii?Q?i0BFwKzCIE+6ebSI7J+6sjZ1fEnFPQgZUj+dAeeUbHYXgmFCptvBGNkEcTE/?=
 =?us-ascii?Q?fYcWO0Fr7i0bW/XKPkCYfCqTpMLN8XlifUAKdUBEWyFGFpXNPEW/2BchqYoa?=
 =?us-ascii?Q?2EbQ5EGsCI91mMAhQr20MWJESXY1pY1xrgg9gKggCMLbBl3x0ejA1O56QXro?=
 =?us-ascii?Q?/bt9eklLwN60Z7MqTpRpOMJii8DocP+rc9TkOX72dnRNuh4tDvTrQkFBUoc9?=
 =?us-ascii?Q?kHbe4vV2ckg0lvpFT+nFLhBuWrDsOIAdYvmIYSaGcouzz6dUmm1RV+Wc3a6e?=
 =?us-ascii?Q?0no/qWtqHiw9BNylijnd1gvSDYhVBvRy2KjH4R2rAGmZWSDNHg5o7npaKIYe?=
 =?us-ascii?Q?Z5pOJOqicEO/goc3L2LGpTJWmQawRNOLtSotXqA/zd5XcrTKkL9qJam8LjGC?=
 =?us-ascii?Q?LEirJcKlgMtvRZWulM7hVujQyjE16boy37B3RzMAWkuNCBi2xeE2LcxZXrOE?=
 =?us-ascii?Q?yeM9J/pipIuWGxwl/E4dPhQQ9Zrh9GI/KjuKjfIaJ4gDq8OVOaM4fHX1Ry5a?=
 =?us-ascii?Q?09jHLUx8aGPmjfrXotU0ciqZTxyUIh69+MU1t04UM339dZVImy0UopMl8/1s?=
 =?us-ascii?Q?V+6FBEW8VBl+fttzthMeg8h4+L4OUXRsOM/MCMmoOQPlqCJrZGedY1mLlq9i?=
 =?us-ascii?Q?oVGRH3iDz+A9PXa6ZjyUGiM3xZLy4ZlE5zbM+4wCLwU9lkJmfkmP6Hy5YePf?=
 =?us-ascii?Q?xdr99l74/JLZZMCFL+M4ycomNocjvdT1vYftwrVY37ZyzJd1vrIBZWgtovaO?=
 =?us-ascii?Q?7mDR879WXkmog0N15tWLZBxwPbQmdhhLAhc75eLKRvLHXkiROqmZJ+MWVdLs?=
 =?us-ascii?Q?OXcOd1PBwPVm71KuXgIeBAo1jPcjjJP3XWtwPwgWzZUY7ykegt5CumxqrW50?=
 =?us-ascii?Q?SkLuh7ucMdKFoZ3rPOTkuOD13IJL4R5lBqEnYBymdFNqyaGtQ4V9dUMMeDRR?=
 =?us-ascii?Q?3V8X3JedUX1o+y+dyoPFWkn2fTQCd7qEBLrxa3VH6ugnpKtW45bztwhsSkuJ?=
 =?us-ascii?Q?1VpSvHhqx+2jwejzzL+/+KdLf8naPJpJ4SPzYacFINxrludHwP51ipJva9sd?=
 =?us-ascii?Q?iC1SzVPX11keKJRHCKDTdX/Hx5gcGa5GDcW+laz8WljtweKd2TwNBwNxhnuv?=
 =?us-ascii?Q?ZHHC18+UPp7N6s8rZaBeWtRxP6oN44Nqck7m2IDduJBhQ2a+rkwKckWYF85M?=
 =?us-ascii?Q?XgBIeXmmea6STCrMptbAgGzoxRi8pwfv9kd/0LoqHhm7HA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?knyiRFN18G0zgpASI74atEqVEgMSrhmcrCHE1UH2wOCNUUHg/rfFqP3E8sOt?=
 =?us-ascii?Q?QmAmABtMBJUELA52oLI7RlChsK8BA8A+otTKVmfCgqaVVKP9aOw1VXK9HV1u?=
 =?us-ascii?Q?dYN3H5wgWDAiDasqeGAXNvAqJDOmUiPUrLaQMNb1tXbplpbLpDy7ckJhGamM?=
 =?us-ascii?Q?bvummwlegeaOGin4mZGQ84b8T0LE8hmP2pZ3i1u6IXWzyNKD6gdiYkP4kJhd?=
 =?us-ascii?Q?y7zbQZggrEUX0jFdTkGiZX061+YKfxBHpYxFlnDFkrnDWapPnF/IzcSHiy3P?=
 =?us-ascii?Q?oJ/EnrunbomyThHeGRv7Wl38tKeajerwaYgiCYhhoLtEzTUQ3zUQfCf1KXgo?=
 =?us-ascii?Q?J9r5J9NB30n6kbUyiRt1XN+31mZqw7Q+MqOw+hIKMyD2LoWRmsYuNhDKkacQ?=
 =?us-ascii?Q?uvCSJQJQ2DdY0TuD4eUZZ8tR46y+u/lxYIKdZXb2FJLDDRlr/g0a06rrxLg3?=
 =?us-ascii?Q?NAK+mc6EZf/IxRC1a5Cvl1D9pYnpBtYOgG4aTX5oIDr8PtsAt1ygi4uThXB4?=
 =?us-ascii?Q?vhw6Zw93eEAxs1kDIg6u/ob5kPgzRKkfPhk4ZN+l3PrUjTtkGnkbS9yIDhxw?=
 =?us-ascii?Q?ex6q5fjWpYljYd3uP/de4RB/p1yZUEPevZUwwrvVVD4RdcSSSr2oQYHEjRCW?=
 =?us-ascii?Q?rjqUaHi9WgGmKP9cqcsoqSiN3aDB+n3kHL6E6nXi4HKL5hiT8PGXLqV0C1BT?=
 =?us-ascii?Q?mgVSYA2yjzAmgux75iiCR8YR/bP8/il6nLpqZ1qM0c+bzdtAqltwuEUXllE1?=
 =?us-ascii?Q?C+Zo4uCC0qt7ZbnfHlq+MTTkgH6rp0UR8ou44IPLaIwoEeu7fbKTMprU9FRc?=
 =?us-ascii?Q?Y0k6o3TbyDFVUFSW3qpijHjzRLadnTibAky/KJ1C2do66Hd4FDtP6EFYtQuc?=
 =?us-ascii?Q?E9N79aoiHNZcw+MRUNr9UFsNxY9CSL5Fa+zS/56If64LKmwa3rbEUiXBR5jj?=
 =?us-ascii?Q?PPmUMSwSvTCajL2TBYXrpji4YAvG6/4/s1Cs5t+7K/rt7JBhCLjKFqrd/YW6?=
 =?us-ascii?Q?HJ26OLWB9+yPz7L5iBIrafiKztkb2p8HCf3z3++G8aRfnKxnMBAjTDhtD1Zw?=
 =?us-ascii?Q?JEB23DFZwZf1vlikNP2OjCEqa98nd6ojUfyMGW1SAPHikPPInvG7F0cPsJm3?=
 =?us-ascii?Q?AliIUv3B/dks1Pf3UL5eh9BzxZNts8E4tjvMHkfrAu9Pj/e4nIenWJjFhr8P?=
 =?us-ascii?Q?IpLGLFLHLaFSY33ABuEa+k0/ZGFYp0FgS8J/nyQJViHRJdTsd4csVWNpWlta?=
 =?us-ascii?Q?75+DI5BfZ3P7ErxXmSErDFWNDoHFMwEUMaR/sYgLpVnNibs6TUD50ZEcNAe6?=
 =?us-ascii?Q?zaVHo3u/Lh9C1SXbPpB6gWOl7cpDUdNILUmv+9CcSD0JPT4qXuGiAw2gnqLK?=
 =?us-ascii?Q?1wUSL/vGaoRCCHmattg/Op8SBiQCtsm8FAYdypN77Zs0a61rEP+kF+LW+plj?=
 =?us-ascii?Q?gSdaXfqYyrl9Qp3WCgmQVkDxEHPbCnPKWMxFR9czzLlxu+dl7Po9dFs2vsJ8?=
 =?us-ascii?Q?cB3mdBUJmjmczOLIbYVqkL3QVm/rTGSdvCoIlyoBzLGUfdJgS3tUVGODt4UX?=
 =?us-ascii?Q?tt4zpub6i2THU1kk12F31QfeSxEEG9iKX9BAcCNA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba33302b-a5ca-49ca-52fa-08dc736c7879
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 16:48:09.4497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dSOaHdM4aeoFL6ilzqLEFt9L+bujhp1NLUsjSzF49/LGI6YozgrzcvxP6Ded5VhgiWc7BmuX2vpW6Itk2xgd8twxpcy1aTdmlTfA6XX0atY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Monday, May 13, 2024 9:25 AM
To: igt-dev@lists.freedesktop.org
Cc: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Nilawar, Badal <badal=
.nilawar@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_pm: Rename and clarify mocs_suspe=
nd_resume
>=20
> mocs_suspend_resume is not really suspending/resuming the CPU. It's just
> checking rpm (GPU) goes back to suspended status after dropping the
> forcewake.
>=20
> Also drop the additional argument and just use the same "s_state",
> passing NO_SUSPEND in this case, like it's done in other tests in xe_pm.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_pm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index e81a75d88..1215b5c2a 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -617,14 +617,14 @@ static void test_mmap(device_t device, uint32_t pla=
cement, uint32_t flags)
>  }
> =20
>  /**
> - * SUBTEST: mocs_suspend_resume
> + * SUBTEST: mocs-rpm
>   * Description:
>   *     Validate mocs register contents over suspend resume
>   *
>   * Functionality: mocs
>   * Run type: FULL
>   */
> -static void test_mocs_suspend_resume(device_t device, bool runtime_sr, e=
num igt_suspend_state state)
> +static void test_mocs_suspend_resume(device_t device, int s_state)
>  {
>  	int gt;
> =20
> @@ -639,16 +639,16 @@ static void test_mocs_suspend_resume(device_t devic=
e, bool runtime_sr, enum igt_
>  		igt_debugfs_dump(device.fd_xe, path);
>  		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
> =20
> -		if (runtime_sr) {
> +		if (s_state =3D=3D NO_SUSPEND) {
>  			fw_handle =3D igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONL=
Y);
>  			igt_assert(fw_handle >=3D 0);
>  			igt_assert(igt_get_runtime_pm_status() =3D=3D IGT_RUNTIME_PM_STATUS_A=
CTIVE);
> =20
> -			/* Runtime suspend  */
> +			/* Make sure runtime pm goes back to suspended status after closing f=
orcewake_all */
>  			close(fw_handle);
>  			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>  		} else {
> -			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
> +			igt_system_suspend_autoresume(s_state, SUSPEND_TEST_NONE);
>  		}
>  		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>  		igt_debugfs_dump(device.fd_xe, path);
> @@ -758,7 +758,7 @@ igt_main
>  		}
> =20
>  		igt_subtest_f("%s-mocs", s->name)
> -			test_mocs_suspend_resume(device, 0, s->state);
> +			test_mocs_suspend_resume(device, s->state);
>  	}
> =20
>  	for (const struct d_state *d =3D d_states; d->name; d++) {
> @@ -824,8 +824,8 @@ igt_main
>  			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>  		}
> =20
> -		igt_subtest("mocs_suspend_resume")
> -			test_mocs_suspend_resume(device, 1, 0);
> +		igt_subtest("mocs-rpm")
> +			test_mocs_suspend_resume(device, NO_SUSPEND);
>  	}
> =20
>  	igt_fixture {
> --=20
> 2.43.0
>=20
>=20
