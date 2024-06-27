Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC6CC2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 06:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8671910E0F2;
	Thu, 27 Jun 2024 06:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncRsmsIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A0710E186
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 06:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719471296; x=1751007296;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LOCZyX8aEWmGqB8nYiF6hLG2HPdqYH3Q7TGORjZe9HE=;
 b=ncRsmsIAEUq+mCuZJzJriz1JPZLFchWPJGq+SkEw4Zvfj0SPA/ZVhwkO
 1AaMTvabhRZjSQRfeUosen2CUjFPA/NeYscawxMQOYjI8omdsujnjBRqd
 BKjfIUpSS+t0Y37jBqCOJWNWQb0G0PuFIHeBovbPT9kjD/8l8OMy+Lgq7
 ZpMMGIrR0x574HTgA5r/MTAy7gGRa5AdbzmcahakoD4VpeRPpSZ539QOW
 UJZV1FBsvUd5Q6Umzcx4wg8NWQVsk00BrSfO25r4NmVU+yW6dxdd5MZ/f
 F3ASEmhp6f/mUMCMa0S5Oo5IT1k0nRX7EkzDZJhNjKsVoMfBB/5mD/1at Q==;
X-CSE-ConnectionGUID: LCE8xq53Rl2ldVhXP9k4uw==
X-CSE-MsgGUID: OTGqadO4Qe2blxrNA7gKhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19466743"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="19466743"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 23:54:55 -0700
X-CSE-ConnectionGUID: T30TNeCLTI+B18AyAy2V7Q==
X-CSE-MsgGUID: FW4cs+yyQm6Rw1LN48QmRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="48874847"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 23:54:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:54:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 23:54:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 23:54:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhNHSHVj9tqpoUEQ8wrYn3zjlUYxHVSOToG2FDL/JbnDQIXdnARdXELbhu4zTH1pQcBDdsGIkX4vB+NWla82h1WTCikgUPtFPLvZhL4iLmZZ2pKB1jEs8oVMJIswhBSWBpGsF9bgu/T9urJqCFl5qSWvTMYP5rVoEF7FPLtaVKB+1GTK0rgfxd6D+TYzSF/fNiZUUH8ToF+f4dHhvzQzw+iVr9IT5uID1qxsgOwCJRHt7UAcZURO3aZJdVmdCUp5YcS9SaC76Z81wSHxGzwtb1qpJHwx/itZ3MiFuKeAtzyiJ3xOkCATC3EJdD9otB55idg2ld7uR4yQcbD4dchDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1XxHEGc4N7yRMvztQJBLiqzBCG4Xid9331jWDovRUg=;
 b=DieEJ7pBFnDVccbVpQoYm6JyBWbURRdWTnRiktfFbWWikDeZvWqt6YXBtIMecrpq7K1oBeRwHGhMcJbloGle2E5vLnjyOsMBGEonh+qpkaKL4ngXId7Wly/5dPR6NxaW+BCU9caqR6y16B8l8pmQbH/SfMLKtq+9bUIAk2guG9HHUjG7HhIqnxkYaotlcCQon8HbmN7Hn5f4M5GtsugJAsibptuG4VbhULBFgGbMEFWCFCNo3FoMwwbS3MthA2OTKt8UYw+QTb/y97A/Gqw8bujVbMbZcqGf4Gj4ifPLUwuMYpkFWYRBHuM4R+nTV7h9nZH6guuzgiTPAijyJhL05g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA1PR11MB7272.namprd11.prod.outlook.com (2603:10b6:208:428::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 06:54:52 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:54:52 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [i-g-t V6 4/8] lib/igt_kms: Force joiner support in bigjoiner
 checks
Thread-Topic: [i-g-t V6 4/8] lib/igt_kms: Force joiner support in bigjoiner
 checks
Thread-Index: AQHawVnvw2rqe5SwrUWp8psd9u2p4LHbOvPQ
Date: Thu, 27 Jun 2024 06:54:52 +0000
Message-ID: <DM4PR11MB6312AFA40247DA889BE092E190D72@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
 <20240618082248.4070611-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20240618082248.4070611-5-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA1PR11MB7272:EE_
x-ms-office365-filtering-correlation-id: cb22a4e5-1c1d-438b-e911-08dc96760bd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?OeVSU3uf5CdDtJA2q/RuTAMAvWdU0HDbQxME5MAiMjBqfzT0X8TzKdcFFlke?=
 =?us-ascii?Q?hLNCQDaTuK0jaK9+T34gtrxk4doDwM69CG2TV30F3LOoLRpsGSq2Xgjm3KES?=
 =?us-ascii?Q?ZbJoiFTz1lBgKbqFpMZouYLCJg/llt3hi7Ztxy4na/wWIBrEl6kz8H1FuAQD?=
 =?us-ascii?Q?qbFhOYxwEeQRyC9TE0qH41Pyt9W9o6s6VQgMknXLdaDMZmkodB+Z8xMwJ/hx?=
 =?us-ascii?Q?Xv/mD3Pg4lIKLFYAuiiiYR5XLtAxfgwcO8ogXeVD1cHg73Fx1SaChaRZiyM4?=
 =?us-ascii?Q?TqvxssM2E4VMjeOoccMozRrqILEGRm66Upn/JtE8ipIe38UwFJ4i1u3TPP2N?=
 =?us-ascii?Q?62EBUFlg5a004CtUtyrPgbg2pf7aEjNGGQ4JBzV7tM1Kq/W68jowo+yFA4u+?=
 =?us-ascii?Q?5j51hw2QtlHkE5texauwh19H39vl6fscPNkpv/JsqJGkJEm5Zyz05n0MknzH?=
 =?us-ascii?Q?MS34jdKr4p0tzDvsq1wtOn7GivY/I2TR/Y7gqjEZ6OJ7uerwzpjabZaUB/yf?=
 =?us-ascii?Q?4mJ6Qk7ASM1GsckY7t6SW/ZxEXtXTTkOnsIELCQZTwYLtCS3U7ivNusqAuJ+?=
 =?us-ascii?Q?8xDQxcjV3HZiNLpYxZO7hoorWLxRxdmxFBsURQ4KHJCALkEsEpn3dPPgv5Cd?=
 =?us-ascii?Q?oR26zzLJjamBIYCq4hTpT0zCAh8WwzmHVLaEU1qmal0yqSJKEqVPgfphKd9p?=
 =?us-ascii?Q?C97jkbRbpNOYn2lD0IB41eEAp03OYGlDHJwe1p0zn/eb3WeNKNb3cZriy7fK?=
 =?us-ascii?Q?3dG/2qoHb7YA89WY+elDo4Q5W4hYCzhM0PHphvEkP2IHuNKO8HsDg/T5G76f?=
 =?us-ascii?Q?Pg4EhN1D0EK/K9pmGA2S7ti3fmUpgJYNCG7R6nMbBnxIRK5dVe+jFw4bhEMh?=
 =?us-ascii?Q?VO8FWiDwJ8YYYTjGBAxNxZSAACqFxNAOWfovB6Vd1W675+xZR3nEZkMxU9Dr?=
 =?us-ascii?Q?RYGNqCcRoPGYIoMFAuHF5lTmXByZ+22nr7Prr3dOv2spZoImTWwW67sTjUkP?=
 =?us-ascii?Q?UQsdsGbJOTW3rQq/ZDzGueOmwJsQmpBkLTFrA0n+Snpj9Q+QqfU5ip/FdeWu?=
 =?us-ascii?Q?gpB7K2nwzlny87gW/qWkTozaqdnVlBInvqE5zX+gt8vdmZhqTIz6kW1WnJ/x?=
 =?us-ascii?Q?z2IAhG3yo6iFdpSh6xl65PBLYxhlfZc2akhZ4sh1N1G2I/13We4wy2Z3UM7o?=
 =?us-ascii?Q?l0VDprT6inWrDA4KPtZ1oWVeIcz3+qFo3FasbTJgc0azFD9TcX0cdXopD+y6?=
 =?us-ascii?Q?XoreMiAmAkbPgHX8imgwe9hgCMxqSINM5X7whhs4buR0FY9eA0cyD4F8bmL0?=
 =?us-ascii?Q?bnWqcQ3R0eNin3Z2nLlKZppl5ZM2sMnJSyRyCxhJt4w8yU1HFPBqN/h8aYTh?=
 =?us-ascii?Q?LzT3nybzxEU2JelsDHgt+5H0+8XYFdifkscw3ZFfmOy7DsBfGA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zUXP/v018yc4yJ5f/DVo7h1OO50VUA3Xp17wzzwBFZ+eJX9XoE+z3Emv07pA?=
 =?us-ascii?Q?+RBSREYqYeowEuw7/D2BF0mGnhQMww2TJ6vWDUlMGBCHQpN1BnfOVAlxW3+M?=
 =?us-ascii?Q?xLbiSCUvsN90HF8a9H+6VDWWHcqQSZzAMvxVCBRwcNTO63NkcpkV/QmEMk/g?=
 =?us-ascii?Q?nukiODm4Gcaiu9t/cHw0LnDJz9EqcoQyAWTuzkqUsiQAwdFd/guMAU1+dvqz?=
 =?us-ascii?Q?/lfDqJoE9kEYi12+7U3SYZpqrodMjJ/DL3ARdiQks/jiJAG+edFJjkSRmpON?=
 =?us-ascii?Q?jD+Q9RhXs41KtUC6hpIbBAq6cbb+kN9nC87bz5j3bQMuSrtxegooVCzufOq7?=
 =?us-ascii?Q?dZpzM2xOlFsMq2Q9AKBQbOXMq7e3kadaWRYY5wWC21nDda8EFGTiTBE760rl?=
 =?us-ascii?Q?hmv2wQxxvNc73GxovEWp+uHwLq7I3cQS7iw/ye9lLFpb3XodnX/vR+V5ZYBz?=
 =?us-ascii?Q?+0DBJz6N19dgaReRodlOtnZgTk/SbDz+qQ6NyTdq5EXJ4E4zU1E1I/yXGfC+?=
 =?us-ascii?Q?5+VzcADC+rRI+vOMWNW/UucAGxMEB+hAeaSmQK2sTkQw5w94yeuBCH9q2NHH?=
 =?us-ascii?Q?OTVKGRIckR5HIh2sKKz5RI4yzfhlUPl7qE6UcAII7oeN1z0yciYaRKUoRYYX?=
 =?us-ascii?Q?UV1DKvoMMIrMQeycq4VPyxCKuwXVzPhEv96hTBTkASg1GcjL4v9bbt2FWyPM?=
 =?us-ascii?Q?BblGlGoAKDzCC1XPGBvk9ApoQa4P07vXPVsP9bcFOm5tXeabMvwjVNamWrxL?=
 =?us-ascii?Q?7/PTZhCEg46imJIGxQ4VPAMeQ7rUGaqnhDcRn4fJaCun8zu9NwSo3dyFTQr7?=
 =?us-ascii?Q?mGrTZKURiP2+cE3/5xLe4cT5/4t2VGI0u3CQ4OqBuueWwImmBk7b/vb++lf/?=
 =?us-ascii?Q?EI8NPNiPbBsXnNsKCaF6T+O+Kx+6GZmwCewqqqoHD6s8BA+sRCKVDbEMU6hI?=
 =?us-ascii?Q?Q2wqrrU2j/QBTCMBJTvBnWZ/Ib8ukLk74eKw7rooaF5WRijPhyj+pYcBgnpQ?=
 =?us-ascii?Q?G+n5kSnH7nHHVi/LrJIzgSvugpHZtwkyrQJomkNwK4IeozTYIxQZt9pVO/O2?=
 =?us-ascii?Q?sWk3FTwlnK+u7rTAO03rQCmpfM5nYgS2AkDSFT+qaIIW/JTmFtVvyAFm9f4D?=
 =?us-ascii?Q?O2OgatHoA8cfVnAep8m6LOs3nQcVW6R4+X/0kTn13XBabjP7N/DTVYlSvGrF?=
 =?us-ascii?Q?89Jk6MRQHpiEBGFy1eSflAw1EXoLsDlbYZIzwuRLh7zZw2BZjNYC7T7xqVL1?=
 =?us-ascii?Q?IMVYmkFgIg3DVReFqXMAKW5ZY0XSvp0IZ4Xx2/W5DNSZhPk0O06wJcrfpAc3?=
 =?us-ascii?Q?crKQkkIIH/rH9MWGBzoV31WaKtAxtVZs/wdiwImq3mQkSVempz7cLLCyL+0G?=
 =?us-ascii?Q?U6qD4mzoKRb66tS0h5vt90WRSEvrrMpT6SB7XKcORyr/x7sPnJGSfOFYfhkm?=
 =?us-ascii?Q?gQKRedK3WyDl2IGUHN0aQFbHdpcu6Twn2mWfWWsSrG1P9hwR5VDgklWuL27R?=
 =?us-ascii?Q?Wh7gYXI62+hBguZjkX1x1chqNZUrGNv0/vuwstMBfLESIx1G6qKNCJwXVofO?=
 =?us-ascii?Q?26X3CwW/DgQo4TLnHnk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb22a4e5-1c1d-438b-e911-08dc96760bd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 06:54:52.8212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OTlMIrQ5r8zKYo1UQzd4B/UO4iTncJJOlhTtzy1k8S04cPEh5sSljGSs0203Rdm/D7vn1FfGxeIOIG9xF6hSlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7272
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Tuesday, June 18, 2024 1:53 PM
> To: igt-dev@lists.freedesktop.org; B, Jeevan <jeevan.b@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: [i-g-t V6 4/8] lib/igt_kms: Force joiner support in bigjoiner ch=
ecks
>=20
> As we recently introduced the option (through debugfs) to force the bigjo=
iner,
> needs to extend the support in bigjoiner checks to handle the force joine=
r.
>=20
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 9fdfadde1..d565e79ce 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6415,6 +6415,7 @@ bool igt_check_bigjoiner_support(igt_display_t
> *display)
>  		enum pipe idx;
>  		drmModeModeInfo *mode;
>  		igt_output_t *output;
> +		bool force_joiner;
>  	} pipes[IGT_MAX_PIPES];
>  	int max_dotclock;
>=20
> @@ -6433,6 +6434,7 @@ bool igt_check_bigjoiner_support(igt_display_t
> *display)
>  		pipes[pipes_in_use].idx =3D output->pending_pipe;
>  		pipes[pipes_in_use].mode =3D igt_output_get_mode(output);
>  		pipes[pipes_in_use].output =3D output;
> +		pipes[pipes_in_use].force_joiner =3D
> +igt_check_force_joiner_status(display->drm_fd, output->name);
>  		pipes_in_use++;
>  	}
>=20
> @@ -6444,21 +6446,22 @@ bool igt_check_bigjoiner_support(igt_display_t
> *display)
>  	max_dotclock =3D igt_get_max_dotclock(display->drm_fd);
>=20
>  	/*
> -	 * if mode resolution > 5K (or) mode.clock > max dot-clock, then ignore
> +	 * if force joiner (or) mode resolution > 5K (or) mode.clock > max dot-
> clock,
> +	 * then ignore
>  	 *  - if the consecutive pipe is not available
>  	 *  - last crtc in single/multi-connector config
>  	 *  - consecutive crtcs in multi-connector config
>  	 *
>  	 * in multi-connector config ignore if
> -	 *  - previous crtc (mode resolution > 5K or mode.clock > max dot-clock=
)
> and
> +	 *  - previous crtc (force joiner or mode resolution > 5K or
> +mode.clock > max dot-clock) and
>  	 *  - current & previous crtcs are consecutive
>  	 */
>  	for (i =3D 0; i < pipes_in_use; i++) {
> -		if (igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
> -			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
> +		if (pipes[i].force_joiner || igt_bigjoiner_possible(pipes[i].mode,
> max_dotclock)) {
> +			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force
> joiner: %s\n",
>  				 kmstest_pipe_name(pipes[i].idx),
>  				 igt_output_name(pipes[i].output),
> -				 max_dotclock);
> +				 max_dotclock, pipes[i].force_joiner ? "Yes" :
> "No");
>  			kmstest_dump_mode(pipes[i].mode);
>=20
>  			if (pipes[i].idx >=3D (total_pipes - 1)) { @@ -6481,11
> +6484,11 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  			}
>  		}
>=20
> -		if ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode,
> max_dotclock)) {
> -			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
> +		if ((i > 0) && (pipes[i - 1].force_joiner ||
> igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock))) {
> +			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force
> joiner: %s\n",
>  				 kmstest_pipe_name(pipes[i - 1].idx),
>  				 igt_output_name(pipes[i - 1].output),
> -				 max_dotclock);
> +				 max_dotclock, pipes[i - 1].force_joiner ? "Yes" :
> "No");
>  			kmstest_dump_mode(pipes[i - 1].mode);
>=20
>  			if (!display->pipes[pipes[i - 1].idx + 1].enabled) {
> --
> 2.43.2

