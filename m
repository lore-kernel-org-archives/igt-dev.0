Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E3BCA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 09:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF47D10E419;
	Wed,  7 Oct 2026 09:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzOIR4dR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022E510E419
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791365920; x=1822901920;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QWyM0dkQ0VfPnePWAMMdb4ja6GFRbHqgClQWdEuD3as=;
 b=TzOIR4dRPc57yrUnUT/NobD/0qkdYJivI28/hLW37dBZ3K3MMJSLNAIf
 7iDB5/CAafpzQi/6cA2iqCFOuYhU5TPaT6M4efm3Jh6W5P7haaKzogf9h
 LNOxFN8339G+CWdCc6mUhwCRb+trx/cVv1SCNRco7N6yvIqOLRz8Va/ox
 PnCgi0VRnghXuLKhq/uBZWH9Iwt2CBBvGSlCcWeIljyHC17haAPYmTd6t
 qJE6T2aLU1ZgrpGUkcfaUxjQiXFoAKG7VosKR//NAixd9bxSllB4ALz+g
 MV9C/Rqc0psLAHBx7iZshlYXAboE+mOW637e5fTytFcbdRhX093RiAXgN Q==;
X-CSE-ConnectionGUID: KhcS7DOJQjS1aq6U4dbvAA==
X-CSE-MsgGUID: JMwesadsRTir+tFxP2xWgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="6396"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="6396"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 02:38:39 -0700
X-CSE-ConnectionGUID: xRoau3fAQlewqYAnny9naA==
X-CSE-MsgGUID: 8iDMDyPtQ6uT2Swi8N1BIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="315424580"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 02:38:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 02:38:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 02:38:39 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 02:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKs0cCvew3XQnk5t0dpnu977W/W0/xqQVU8adVZomyYPcT/89VWxnAEDOi6njihSUjep2apqNsfd3sdW7AfUwMfPGluk7mfz32Yh6dIhX9hExJeudBiw2kX32opSI/Cg1UDzw1KCLf0rTCMSRsWEU+IsSCpP3j0qmTUslnDC3caHmg8fPSugKIb+IID2TlTNK+v3tX7uUuJfcWsFpNS9UwzsBpKKG+5CFwl7dVEWFqxdye+KBHw4sJhfdKu1lZdymPeUJ+0yKbjFS76s7Y8rQgHi9LabsnbcCh33kU++VTFtv/iSSOsq0LxJ3iiueGwJeOZuj5d+4JqfWep7bs8dRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSyVaLLBwEbG63pQrXyLf6Rnn4wiJjFZ6QLPjjvCB04=;
 b=rhUInm0JqLVkInnMiYIckyotlJ6EVfZqGSwwqHWoIiCP1JfmGcB1PXU1EQ6Cc8tDuaggUWtFKz5WNjl25nRcq83KBcx/jA5c44jw9FDmn1wOwiGV/0tKxF1PRA0GFUZHa5LVAPUUkaoEqItSCeTCrQwjv4DfA3L0LCXcLnzsSsGc5NKMLQji8mXi/w+pjkIPNUyM5wtTJxWCkCOy7FNYd9CtDXb+lNgva5zf5U/sSzdymnSWgR4P1pDeS5nJHiOLFhfm3BacoL4QvIJeV1h04ruOH/HThDXxF+C+YaSSzPNZ5CSQBO93LM3eP3zVzm3M6B+uXC5xHQG5VxJ9G1Mxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA3PR11MB890013.namprd11.prod.outlook.com (2603:10b6:806:592::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 09:38:35 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 09:38:35 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>
Subject: RE: [PATCH] lib/igt_os: Fix igt_require_memory error messages
Thread-Topic: [PATCH] lib/igt_os: Fix igt_require_memory error messages
Thread-Index: AQHdVdOnrqMUFRwiEESEaR6VshkvP7bx02cw
Date: Wed, 7 Oct 2026 09:38:35 +0000
Message-ID: <CH3PR11MB84346360BCF20D3FB7368EA38D942@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261006204430.100929-1-jonathan.cavitt@intel.com>
In-Reply-To: <20261006204430.100929-1-jonathan.cavitt@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA3PR11MB890013:EE_
x-ms-office365-filtering-correlation-id: 2b32c6e8-c757-4df1-4e82-08df2456c20e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: stpUQf0djqlSrk5UZZ0eZ66IGOCWlH5emRbVrh5rCRsAlErCg4xJBolbum71EV2Gna5PY9NqYCWLegmSU5Hk2CaTksun8y9/AXl7tn01+iPgb+9xhZ+nmGXcZU/DaU+JO+qd5NrxT4DxhFq07hPABIEW/eenGn5uCk22ddRoP5FNhw1LiLLn7l/L0oGbExs1qNI6O7cIwBYbX4NTS1fkSXo5eYXuhoyR60Du5s4cgCk8+5l2IUzyCX0Vp9vYZki3p9UURuhz343bWRzkAEPeeA4iPFm4Zex18Hilr7WgD21g8a3/Oy2e/pqAcNsHZM1ckkgEe4aU71pdv1COK+waYKJuPniCk40SfSAYG8HiKtklzrc3NoSRV2HW+bQeNCu/W3KiM262M2cbolZYq5MeQ+LBxVghkWrZTWTQOMGeyVz4r9ieOSPfM641e71x3ZuzxDafhXTnFqxmW1ZCZlQz+F6UDGd1ulidTHlKERys5BAxko6o5mYS4EjND367GzBQtnhSMfIUPj3TH1grfJp/ON2+eQF7Grs+Fg4iBR9mD+FPp562xaATbs0W3lIc5ZTCC1zYd6WXdwDyjoKbK1t1Xzq5ZkjPWNP+MmKaJlLGGvD283fFwrzMP69Dlg8lzSa6elzcrpjx+EN3nEuBXUIopy/EWMumq9VXyA/jPr7SNiGB5TUwH9FWnPNDedyUrFs1A8BjmcN+b8O9Va+QngetgJJqnqknN3PkCOjHu6EJTLc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Nf8NurkHXOKJpDvsvPhHDYvUg8AgRFsX+Fm7/SVP6wCsbRJ+RZPPtlWHgeGJ?=
 =?us-ascii?Q?w6mx7tEOWGU9DProwB1evxnM3cjvKZqI+UAG0ik0+qGcWwNslmhXhkfBaOmG?=
 =?us-ascii?Q?seHtPnP511TpuM3IubKwUQgEkeIH9Lc8L9CAPltf+bE4ZDvPKIU2h59Ah8RO?=
 =?us-ascii?Q?QFyhW2K2Y+Ok7/7smgTur0I1HdYYsYFIauNDEMK8tQYqukz0ceaWRh5p3eoI?=
 =?us-ascii?Q?MGxkTAe49ZGXXijpJsYTcDuw+/3IF3+2wY+/8b+w0ZTUjeo6Bph6RO+R3F47?=
 =?us-ascii?Q?iiW28RAAKQuAsI5iwv97Gb3ttQcHQ/10xPk0zRepaiFdfJY9JHrNDDs5k9Xd?=
 =?us-ascii?Q?uLdGA2gPjbzq2LK+sNRMoFEEjbmYpf+l7pYvF/73jtXBezjqt2XXr/KQ7x/j?=
 =?us-ascii?Q?cc02l/83V3zNlw3XHpH9kuYAJGWIbXIBNLBYtbU2eOYGiOY26gaOLNN0f4NB?=
 =?us-ascii?Q?fjkdykfduxp42oEy4jH5ZuoU18ebDSQFPhyIXML0Gcj/9B60GdYKH2XwRbKs?=
 =?us-ascii?Q?NKDn7BGgL1zVSpS6tkSUBLjcWqg31Y+THIn7qdwpRqvUYFOIwBvzAiw9REPs?=
 =?us-ascii?Q?cm1axOaE9IhWpL11U7OhlZAqlcuVXHRr/51+STOyHgK0LCi/OW8f4S5zhZ8q?=
 =?us-ascii?Q?xKLdha94hwbgNrmsK8UuWJ6MQlVMUNp8hakccFwew2GWo6dXFEcAm+xb88Iq?=
 =?us-ascii?Q?rMOK7aa7CbFqM2pWpFGzqZQA5L0H/WHUk7qeb3vzl3bqD4jcrtjcC8zyA9bh?=
 =?us-ascii?Q?UeQwQ3bP5XlnRIVnvT8DAsXEf34ZHwNkVocXPsD0bLoIc+RLEzC/B7v1sSwa?=
 =?us-ascii?Q?jj1sPDyjVQQz+rE71LtA4EVqsBaUHWdJC0pEPXh5YG7RCcaH5QSjC8tjkG97?=
 =?us-ascii?Q?u0wewpPQZ7klo0iiLMSe4f2qar0cFV8VQikSf4kjTaAYgj2Bj99JSBtAxQ2N?=
 =?us-ascii?Q?HzMwm4DbLW9H2Wa+SXgdCg4C155rs4Q63e1hkQ6jm6sBW3jZfc8XGBKuaOgB?=
 =?us-ascii?Q?zllqloOxdJdpt+pCSMTI0VVlVXXNCUKW5vaBABz1YF+s3fRh/NZxKkrs1hQ1?=
 =?us-ascii?Q?e/aEHYpbTFe6CFjyh8sXNHOFAm82cn9Jw3DlQTLCnOOQ4xMVSZLUUIiVVoFw?=
 =?us-ascii?Q?rTFKo0ftQKfcHtKAI7/8uUC3VPB6LVSchokQvzLvajQ1UPVqAIwAfXobcXQG?=
 =?us-ascii?Q?aKs249IGB9LaaJ1TZPzMP11Ty3tFM1gLoKX8zgfQECKXEuEwPVi4Vt5fJbPd?=
 =?us-ascii?Q?yexC5q9QUTuBbPe74K8+kB17FoyAFNQLBWKz3O5287Etq8avfk0grRcHaAnm?=
 =?us-ascii?Q?77y4QKf4J7mELbVPUIPbOZelKK92DK8EBVTlG1sBuvNPd8LZ0CycdUgxOGZx?=
 =?us-ascii?Q?VezInqZkGZF6EUOyHFk91jG4LpKD1Cwx7S3ZoRQml3Khp872rM6Xcn+/Vek6?=
 =?us-ascii?Q?mIfz4V4UcM4Pl2kJfU7wXbrX9oYuVppuDvw5HyTqfOYOksjFUMemkBAX095G?=
 =?us-ascii?Q?OuDTZP3XuAaBiDgn/7IyHLc4j2p1MTL6AKISQ8t98Qb38F2QtJGVyjrDR1+S?=
 =?us-ascii?Q?hlXhp3xKWVHD6yrHyt1p/5/o1VP1XnDrx/00/yBscMHIaGz772giPTeyfNlJ?=
 =?us-ascii?Q?4NFH/euCilEsPdSr9SQVf62L8Fk4qRRHo1HCJgGcpeanXJvb1pedL45r1yKu?=
 =?us-ascii?Q?oJyhdAN7LSGLHroChohA56nJHdg5Xfs2JQtBUcvDD853SbR07AAxmZsS9KhP?=
 =?us-ascii?Q?qn2O0wNOXO12MrOSdhJ7kxR5YEgerCs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: d1SiEg4dAktMku1OMmEUQoCkhHrj+dTrIOi/gMKmn5uQO6tZOpeYhXJc/eRKe+nPUdk0+b/7PueaXqeJxBozGt3tbweri7/kVxYpsHYQHFUB3WAnz3F1yiuxKX3BOHbCUjx+W65JnmSQpXoPjnenXLy6h2iM6mN1tkoVHFeDgofVnVVrIaf+pvxJT1uf4a/E+YI3McxFvhfZLtWIDPizkQVn0RUfB+QQudKOTFGeCcW6lh1EpKW2lutwnBcUCMLydOoIXkz77iwPjMUltalHfT2CzG3vZz5NaD7P6y5juRbwOQLA/tZIebjXXlroYLVvFowwQep6UYOMyPcD27r45A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b32c6e8-c757-4df1-4e82-08df2456c20e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 09:38:35.0953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHt6M5HvwrbSUNO79EIZONv1U7yzWPbU5k4ethEMKWmt/bFiLCeGL0QRGSp0cOaeoOrZK7XmwJZUcbxnv9NOcK52LvZNiK3R3g4yPSc0yfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB890013
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jonath=
an
> Cavitt
> Sent: 07 October 2026 02:14
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Zuo, Alex
> <alex.zuo@intel.com>
> Subject: [PATCH] lib/igt_os: Fix igt_require_memory error messages
>=20
> Info grabbed via igt_sysfs_get does not have a newline attached to the en=
d,
> meaning portions of the igt_warn messages produced in igt_require_memory =
are
> printed to the same line as each other.  Clean that up.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  lib/igt_os.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_os.c b/lib/igt_os.c index 0fa10ee750..bbc432d721 100=
644
> --- a/lib/igt_os.c
> +++ b/lib/igt_os.c
> @@ -434,14 +434,14 @@ void igt_require_memory(uint64_t count, uint64_t
> size, unsigned mode)
>=20
>  		info =3D igt_sysfs_get(dir, "meminfo");
>  		if (info) {
> -			igt_warn("Insufficient free memory;
> /proc/meminfo:\n%s",
> +			igt_warn("Insufficient free memory;
> /proc/meminfo:\n%s\n",
>  				 info);
>  			free(info);
>  		}
>=20
>  		info =3D igt_sysfs_get(dir, "slabinfo");
>  		if (info) {
> -			igt_warn("Insufficient free memory;
> /proc/slabinfo:\n%s",
> +			igt_warn("Insufficient free memory;
> /proc/slabinfo:\n%s\n",
>  				 info);.
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  			free(info);
>  		}
> --
> 2.43.0

