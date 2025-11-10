Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0DBCCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 14:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7FB10E3F7;
	Mon, 10 Nov 2025 14:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAVbsm3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D2B10E3F7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762786073; x=1794322073;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NoC7IbZmqgm0hBD1Na52zdyG471pxnGUTBj1vdAnoYE=;
 b=UAVbsm3fT4CgnQQhhxERdtzzsIPBY+DcfApkZAi/2nTx3IyZKAmSkacB
 DEgBBsOTItz3PvuOafzSD9YVloJOhdD1TfCI2H818kyXb1eptQltxSD5h
 cEZyxcXNGwAiwwy8h9WN5s9EQyAMcRQxLnpfQmdrv6JtmklhJ1d5PzPlw
 kDnga+/iW23KQCs6Qwnp7g12o1u5UkMSRhU+4hEZuy2F0EurO85zq6iz1
 qN6FMqBCwMb7ZA6Zh1qaEjfeuC0CuIltDLevSsAvbCapOjsN1kVpiXCD9
 0fPWXjt/nYWP/EKkgRFOi9UEcTeYYSR7X2SPFSCnJwd6PBR+LzXF12jna Q==;
X-CSE-ConnectionGUID: N2pSjVgwSje2Qo0GkZCpcw==
X-CSE-MsgGUID: QbyxNLN5QZm0mUgCmg/KBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64717862"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64717862"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 06:47:52 -0800
X-CSE-ConnectionGUID: 2bKkcb6iTNOk0+s2xfAHkQ==
X-CSE-MsgGUID: qiYmjIUyT4ObOeHbiHa9Sg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 06:47:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:47:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 06:47:51 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:47:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHWLB/GkffNRAOBt06XvNvgE3ZHx9BJpzKcML7hUVX0cHncrMMSNvUhomd+Koj491OXUVQ7iybE6hpD+PVBVasuwU0aAgMaFqxLiYkW0xKB/q/49L1p0JXI24fDjFHSy/c0oakMq0vCXNDyauakzBOaY5hhwT+vNZbkZIskWac2Zj4X4AdkbKLh8fWZxYrsbHKElIzaCrFApjFDUyLQb929j8jiEVvv6Z79HE2Z7ZbwWoNBWdiSq4gwhhQnJfi3vnjKzs/lzsboauOVQmkN3joS8ugIIsMobSIeW62q8AHvGkIKGweCoaNCAPebaLvORClIKJvsxVv8vCQC1rKta0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0PSGUhDOTAkTWLcfdphd6ZLf1xCpEsmbWR38LLXbxo=;
 b=l2LMRtQzI8rskisysDYY4UN6MpreM666lCxaxY6N/OM1VwgloGz5KVJSDNSUFBxxp5G3T3WErnJFLJD5lXxCc1w8kaf44kiwV/SgYW6iHEO3jMtqhHIXimRRqh2SBjPZlim82YNohS6B40KyRHkiJoJzZTJJZA85jtSzCLk4R1q8HoFTe8et6fiEnDIAcFzskOAadbp7/+0mTJ0614W/Ke1aQKSXi16i2jgF+KdKd2ZvslCqe18VxnEB6XJ4rhq4ljhQWUH5/tMXNv3DPj+uv4Z4aluKiH0peomzfpjUPNWVK8/XGthtAsa9+UKdEJP88Bg5ZOdPQZCwObKsi+ZN4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ5PPF8F93806F5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::845) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 14:47:49 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 14:47:49 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
Subject: RE: [PATCH v2 i-g-t] tests/intel: Adjust test documentation
Thread-Topic: [PATCH v2 i-g-t] tests/intel: Adjust test documentation
Thread-Index: AQHcUkK+/dHX0A8gcU69/3viLpBcbrTr99aAgAAFbZA=
Date: Mon, 10 Nov 2025 14:47:49 +0000
Message-ID: <CH3PR11MB8434AEA453933A638BCDDC6B8DCEA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251110130614.28345-1-himanshu.girotra@intel.com>
 <IA3PR11MB901378843FD0F706347BBA1E85CEA@IA3PR11MB9013.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB901378843FD0F706347BBA1E85CEA@IA3PR11MB9013.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ5PPF8F93806F5:EE_
x-ms-office365-filtering-correlation-id: 7b65b2fb-01a0-49f6-d19c-08de20681e77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?64Qgsj541SWeiybEwzo6dueEomcdq/iyNlw7q9EFKWcxKA6euPH7q9cJqU6F?=
 =?us-ascii?Q?qD7RHiv8641G6gZBTJeSUGTJYPhTI/tfcLmNKBFHFIMXIOCNQvmIruNduq66?=
 =?us-ascii?Q?+zLJ7FNhN7VnNBGFwojuOMHAERH5lbpjR5sM3PaIuqgzUYIPE9POwIFAqB2Y?=
 =?us-ascii?Q?848XClWWFVl3QQLfhiv/5CcSh+2YoX7SzwmE2UY/ipDha9n/UgxtPYti2vIS?=
 =?us-ascii?Q?ob5FG09snlAO3ftzw3S0kQYDuQ9zmo4OMl12LyTx5fPBMwX9n2LgF9MVphBX?=
 =?us-ascii?Q?BsZcM9H1Z7dD2RRKORwHOX199W/WMRiHXktDtGqnmRLweEIlsuIQzbEJExBJ?=
 =?us-ascii?Q?5jTAMGE2HieXEwbLBsmXKv7UeFOwK+eUEPQmdSgVXVpQRPzLHMtHnszpWQfc?=
 =?us-ascii?Q?nOiaepBhlg2WT4/uBTP6IPivX/GgEFrxGCDiGubBZZFGfG4aao7+4NO1DJU5?=
 =?us-ascii?Q?tvqx2JaGj8bkm+h5tdyhevGwKjvICQohLh45P5ASOiokfq/kzpt6y7LwgPE/?=
 =?us-ascii?Q?ZQ1jahVRECoOJEaAk0HSe2DvFEtUlSpaT7eyqqPPeeUNYBiy2WM0E5sHWI54?=
 =?us-ascii?Q?ib/X/DiOQ6WXq4e3zwE+M460Cu+J8frbUrzpesCY/aQwITOWih3Wv4XqPBmP?=
 =?us-ascii?Q?4NhBVjChX6FxSTEmaymhcRZBUyLjUY8Fz48sC+gNyrEyoMjwG79MFPpAxlk2?=
 =?us-ascii?Q?5PyzxFrEd/Hc4p/MDx0Pqtcr8jVnBdLkVPq2RSZ8voGIUi2IgQy58TMAiIHB?=
 =?us-ascii?Q?Boem8dSmI8cHUKtLJJduje++beLjgAFvc2wHDPpGofAx3eJ9LmPUdSgV3cN5?=
 =?us-ascii?Q?nelVa64hcpZHUouq73xyE9W/I7ie7HcTTlF5wL4Uhvxgj/qTXJOxrHyJmZcT?=
 =?us-ascii?Q?0HpqKdBX4jVw7K0Q+oyZUcAoFYmW0wsXPaGkgwlwiTL77B3sTFUi/Nyfaudd?=
 =?us-ascii?Q?tNNfQRwtW+DgNwxxU/rW8oOTje7+b8jNJ4Y+7yvMKtJuLCZM1ppYUkC+STZM?=
 =?us-ascii?Q?491TYmsFr7tenDfK2T3Pxl9mp8JRNG97ANrQUtKRf+iwUzfznGDIaIIGvNCB?=
 =?us-ascii?Q?uze/qnNjbSc7xOd/PFtrj20Qp4+SFKXUkwJd99OtTtYlKpsAG/rJYhPF177B?=
 =?us-ascii?Q?vFAfRNCjjUCYaY6TIVhAkhKb/xySGZtcRdjmjLS4g+clf/lDkZyYe2iQxzVV?=
 =?us-ascii?Q?Nv3A3cpGctsVjOeLUWxUgrVPYYTAFtgNBU0MwK512+MvKHGBPWWe34ctAB16?=
 =?us-ascii?Q?eXN35Pmnw/qlRjojzVXgQqVH5Dyn/3R16VL7TMPH05yop7iQbwm4SJMKO1cx?=
 =?us-ascii?Q?SWA7b5C+LOSCV3gL5eLQcnJFipPzBAVl8dEJd6QAkluV5ZWd0hamUplML0la?=
 =?us-ascii?Q?Yd/KjqIz5DS2YtaMwYm8QaVTsD9mwMVgXcxVpj3kdM+JIjuTohlWJeNpo0s4?=
 =?us-ascii?Q?5NJPCHpXi62O2O9ZSnH6KDSQybkVVmzL/OFrKJSj9Idf+9F2gfyAOoDZW1Mk?=
 =?us-ascii?Q?KBS91DS+N15xJgzbCtglFaPUH/qKZlL4UOCn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?22FOpYNOZlfFFm4zqPjqPITsvVLntum0DTl73GTjO0UqFtdUE6QNdTsiIBAZ?=
 =?us-ascii?Q?hu80hQQBl+KBep60Vsa39wRPQUvN1DQjRqEIOJQMY8bsXbesd1SB6dSD+FbV?=
 =?us-ascii?Q?FPQrzs/pDDK4HItcYYo/y9C5I3/wEdBZEIc/g06LwQwzRQj2p1VsHP0kI1Kw?=
 =?us-ascii?Q?4981bh5VIQIbj/hvGiY10LYIHbxK6PeqSC51uBReLo0MwaYBB176GxmpC9Vc?=
 =?us-ascii?Q?mGIAIEf53ik14rBp3ONHdJ4+DTXb1tQLFEcurUG4tXNdfH02l3HAusXxzx8T?=
 =?us-ascii?Q?AQp/kD1X8T1qJUB6UyG2mOprzOg6iyMaGoaDCU4cKykJvgpcZ9Y+ZwTHO0kJ?=
 =?us-ascii?Q?Sv1dK0wE1XkskAiWEQC+HhzN8MPDavcL/luqolq+Ya7VfmaTRkMuxNlxd8iB?=
 =?us-ascii?Q?dyyM0Vd+sJSBKQkTsdZWdzHX5D114LwjxDrB2kKctVbg7j/W9M7MSIJ+GsPI?=
 =?us-ascii?Q?syfxigaU5+PWzMNaN5fyiaTISoO8P8Tx0vd7OCaANRnnMzWl0fFFxMpom8My?=
 =?us-ascii?Q?uqW5oeFq+hPE4MrvkUX2IjxsDCnWME7EkTnFUWnU0RmbUObcQxZct7LKle0s?=
 =?us-ascii?Q?kyI/DSgpQ9GBQw4wKK0xwn0gVLz+Q1ELcPhOjUa6f8xgdglGnL6EUU7dgRCK?=
 =?us-ascii?Q?7Uwui8OX+1X18IYq6nv9VdcdSuGbLPx1Mhu8HG7oj9vw8KWzKBXsC1zJOcv2?=
 =?us-ascii?Q?4Mj5vwkZDt26tJqdppZ/8niRelTUA9esELYvNOpAn5fcXNUEeizQTnEz+SCs?=
 =?us-ascii?Q?wuRmALMHxC2sBojLUY6yRkUqt2Rmx8nzY4wTT3R5JdnbrcVH4B8eHVf5i8Sr?=
 =?us-ascii?Q?69h83NGf93IBaP/Pzulp8dRbTMFeJGj3AJJZYL+U7i6ou5A0SJoujCm2SYeM?=
 =?us-ascii?Q?Kp7yfHTlxMIrGaAV44jFAsgO/51pOlUL648A41jww3LN002vABd/kd50Hdx9?=
 =?us-ascii?Q?2eML+ASHIoscqgNs98N00hqUDaYkNGXsvHcx4FD4M65tbUgN/Tg9ImDiBGJ9?=
 =?us-ascii?Q?WQBffMzu3uv6ez3NGuUw7VmweS8hleF3NP22PQVqPfe4e37MwOTDMnjVWZcW?=
 =?us-ascii?Q?RxxWtFTP5zyFXjRKNHSfpyAmlgImG3LAPX9j/+wfM+tYL7dvR8iLNSsbGQR0?=
 =?us-ascii?Q?vkrMhUkSNQCSLCMdx4IBUf3loGHvBhnLP1IosYBT/Fw3sQJJq7X/Dkw5CmJW?=
 =?us-ascii?Q?CFhqPoeDYO8soUQW58zwSdKx8D+VetWaz8/7YUZH9sEToBNhVzBlvbSLm288?=
 =?us-ascii?Q?kSR9LycuepNA617IRPjIRhAVwyyK2qOpQoZi4WxK1iGinsyng9/RzkyEzyRy?=
 =?us-ascii?Q?LzFpL4ZlZ4mZVBjgsZItYHEi+yz+T+ZtuzkCUfiTL8DE+W0NrSeq/ardkJwI?=
 =?us-ascii?Q?wtGcCqejRdx4MMxHpMKl9lBbtLaD1avYGo+oboTK/DJkeRIQb+DCHxkjiA+u?=
 =?us-ascii?Q?daouuLbUp+MCFhFJnkUkHauiKl6bK0PxvPNzZDpPPjJ89pRkYAdcNQDKNy1A?=
 =?us-ascii?Q?Va5EaRyodXSyyNW9HK1I5oIrER9ftEMTXO65eSrjVY5Wxy8vuHUSwEBwLY2R?=
 =?us-ascii?Q?1mHFVqvo3l2Z1l0zuh6tm62G/5oVJiHLz3FqM6dBbTZxAgJxk+ZfOvWxvlze?=
 =?us-ascii?Q?I8yCFhajx97mRrcpAmmxhRgdj37cJvFiLoViGC3KzCp1pvM3Fgq6TIZ74wZb?=
 =?us-ascii?Q?/mPI6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b65b2fb-01a0-49f6-d19c-08de20681e77
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 14:47:49.2483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eqBGD+ebJJWeW+8gou/497RlzLxG/8kLEmJ5l9JJwvdmEZHveVIzLE/S4Ov/hefh+l1PzO2OpfetNDXbPGi7Bv46dJDTOao3ur6QEmi4TUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8F93806F5
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
> From: Gandi, Ramadevi <ramadevi.gandi@intel.com>
> Sent: 10 November 2025 07:58 PM
> To: Girotra, Himanshu <himanshu.girotra@intel.com>; igt-
> dev@lists.freedesktop.org; Konieczny, Kamil <kamil.konieczny@intel.com>;
> Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Tahvanainen, Jari
> <jari.tahvanainen@intel.com>
> Subject: RE: [PATCH v2 i-g-t] tests/intel: Adjust test documentation
>=20
> LGTM.
> Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>
>=20
> > -----Original Message-----
> > From: Girotra, Himanshu <himanshu.girotra@intel.com>
> > Sent: Monday, November 10, 2025 6:36 PM
> > To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>; Konieczny, Kamil
> > <kamil.konieczny@intel.com>; Dandamudi, Priyanka
> > <priyanka.dandamudi@intel.com>; Tahvanainen, Jari
> > <jari.tahvanainen@intel.com>
> > Subject: [PATCH v2 i-g-t] tests/intel: Adjust test documentation
> >
> > From: Himanshu Girotra <himanshu.girotra@intel.com>
> >
> > Change mega feature and sub-category for multigpu subtests and some
> > other legacy tests so that it can be fetched under correct Feature Buck=
et.
> >
> > v2 Remove subcategory entries when possible, as they duplicate the
> > information already captured in mega-feature entries (Priyanka).
> >
> > Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> > ---
> >  tests/intel/xe_create.c          |  2 +-
> >  tests/intel/xe_eudebug.c         |  2 ++
> >  tests/intel/xe_exec_basic.c      |  6 ++---
> >  tests/intel/xe_peer2peer.c       |  4 ++--
> >  tests/intel/xe_query.c           | 38 ++++++++++++++------------------
> >  tests/intel/xe_sysfs_defaults.c  |  2 +-
> > tests/intel/xe_sysfs_scheduler.c |  2
> > +-
> >  7 files changed, 27 insertions(+), 29 deletions(-)
> >
> > diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c index
> > e8b8bb025..d7fe9d626 100644
> > --- a/tests/intel/xe_create.c
> > +++ b/tests/intel/xe_create.c
> > @@ -383,7 +383,7 @@ static void create_execqueues(int fd, enum
> > exec_queue_destroy ed,
> >   *              buffer sizes.
> >   *
> >   * SUBTEST: multigpu-create-massive-size
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Functionality: ioctl
> >   * Test category: functionality test
> >   * Feature: multigpu
> > diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> > 59aca526e..9d1280528 100644
> > --- a/tests/intel/xe_eudebug.c
> > +++ b/tests/intel/xe_eudebug.c
> > @@ -932,11 +932,13 @@ static void test_read_event(int fd)
> >   *	partial unbind, unbind and unbind all operations.
> >   *
> >   * SUBTEST: multigpu-basic-client
> > + * Mega feature: MultiGPU
> >   * Functionality: attach multiGPU
> >   * Description:
> >   *	Attach the debugger to process which opens and closes xe drm client
> > on all Xe devices.
> >   *
> >   * SUBTEST: multigpu-basic-client-many
> > + * Mega feature: MultiGPU
> >   * Functionality: attach multiGPU
> >   * Description:
> >   *	Simultaneously attach many debuggers to many processes on all Xe
> > devices.
> > diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> > index f652ab6b2..616fd262c 100644
> > --- a/tests/intel/xe_exec_basic.c
> > +++ b/tests/intel/xe_exec_basic.c
> > @@ -58,16 +58,16 @@
> >   *
> >   * SUBTEST: multigpu-once-%s
> >   * Description: Run %arg[1] test only once on multiGPU
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-many-execqueues-many-vm-%s
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Run %arg[1] test on many exec_queues and many VMs on
> > multiGPU
> >   * Test category: stress test
> >   *
> >   * SUBTEST: multigpu-no-exec-%s
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Run no-exec %arg[1] test on multiGPU
> >   * Test category: functionality test
> >   *
> > diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
> > index 70374e56d..92cb6a65f 100644
> > --- a/tests/intel/xe_peer2peer.c
> > +++ b/tests/intel/xe_peer2peer.c
> > @@ -18,8 +18,8 @@
> >  /**
> >   * TEST: xe_peer2peer
> >   * Category: Core
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> > + * Sub-category: MultiGPU tests
> >   * Functionality: dma buf copy
> >   * Description: Peer2peer dma buf copy tests
> >   * Test category: xe
> > diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c index
> > 2de88fac9..928daaf58 100644
> > --- a/tests/intel/xe_query.c
> > +++ b/tests/intel/xe_query.c
> > @@ -184,7 +184,7 @@ const char *get_topo_name(int value)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-engines
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Display engine classes available for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -211,7 +211,7 @@ test_query_engines(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-mem-usage
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Display memory information for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -275,7 +275,7 @@ test_query_mem_regions(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-gt-list
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Display information about GT components for all Xe
> devices.
> >   * Test category: functionality test
> >   */
> > @@ -350,7 +350,7 @@ test_query_gt_list(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-topology
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Display topology information of GT for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -414,7 +414,7 @@ test_query_gt_topology(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-topology-l3-bank-mask
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Check the value of the l3 bank mask for all Xe devices=
.
> >   * Test category: functionality test
> >   */
> > @@ -486,7 +486,7 @@ test_query_gt_topology_l3_bank_mask(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-config
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Display config information for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -543,7 +543,7 @@ test_query_config(int fd)
> >   * Test category: functionality test
> >   *
> >   * SUBTEST: multigpu-query-hwconfig
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Display hardware configuration for all Xe devices.
> >   * Test category: functionality test
> >   */
> > @@ -582,7 +582,7 @@ test_query_hwconfig(int fd)
> >   * Test category: negative test
> >   *
> >   * SUBTEST: multigpu-query-invalid-query
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Check query with invalid arguments for all Xe devices.
> >   * Test category: negative test
> >   */
> > @@ -605,7 +605,7 @@ test_query_invalid_query(int fd)
> >   * Test category: negative test
> >   *
> >   * SUBTEST: multigpu-query-invalid-size
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Check query with invalid size for all Xe devices.
> >   * Test category: negative test
> >   */
> > @@ -628,7 +628,7 @@ test_query_invalid_size(int fd)
> >   * Test category: negative test
> >   *
> >   * SUBTEST: multigpu-query-invalid-extension
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Description: Check query with invalid extension for all Xe devices.
> >   * Test category: negative test
> >   */
> > @@ -793,8 +793,7 @@ __engine_cycles(int fd, struct
> > drm_xe_engine_class_instance *hwe)
> >   * SUBTEST: multigpu-query-cs-cycles
> >   * Description: Query CPU-GPU timestamp correlation for all Xe devices=
.
> >   * Category: Core
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   */
> >  static void test_query_engine_cycles(int fd)  { @@ -815,8 +814,7 @@
> > static void test_query_engine_cycles(int fd)
> >   * SUBTEST: multigpu-query-invalid-cs-cycles
> >   * Description: Check query with invalid arguments for all Xe devices.
> >   * Category: Core
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   */
> >  static void test_engine_cycles_invalid(int fd)  { @@ -929,8 +927,7 @@
> > test_query_uc_fw_version(int fd, uint32_t uc_type)
> >   *
> >   * SUBTEST: multigpu-query-uc-fw-version-guc
> >   * Description: Display GuC firmware submission version for all Xe dev=
ices.
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Test category: functionality test
> >   */
> >  static void
> > @@ -946,8 +943,7 @@ test_query_uc_fw_version_guc(int fd)
> >   *
> >   * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
> >   * Description: Check query with invalid arguments for all Xe devices.
> > - * Mega feature: General Core features
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Test category: functionality test
> >   */
> >  static void
> > @@ -996,7 +992,7 @@ test_query_uc_fw_version_invalid_mbz(int fd)
> >   *
> >   * SUBTEST: multigpu-query-uc-fw-version-huc
> >   * Description: Display HuC firmware version for all Xe devices.
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   * Test category: functionality test
> >   */
> >  static void
> > @@ -1011,7 +1007,7 @@ test_query_uc_fw_version_huc(int fd)
> >   *
> >   * SUBTEST: multigpu-query-oa-units
> >   * Description: Display fields for OA unit query for all GPU devices
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   */
> >  static void test_query_oa_units(int fd)  { @@ -1063,7 +1059,7 @@
> > static void test_query_oa_units(int fd)
> >   *
> >   * SUBTEST: multigpu-query-pxp-status
> >   * Description: Display fields for PXP unit query for all Xe devices
> > - * Sub-category: MultiGPU
> > + * Mega feature: MultiGPU
> >   */
> >  static void test_query_pxp_status(int fd)  { diff --git
> > a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
> > index
> > 393e56651..f21ae94e6 100644
> > --- a/tests/intel/xe_sysfs_defaults.c
> > +++ b/tests/intel/xe_sysfs_defaults.c
> > @@ -7,7 +7,7 @@
> >   * TEST: xe sysfs defaults
> >   * Description: check if the sysfs engine .defaults node has all value=
s.
> >   * Category: Core
> > - * Mega feature: SysMan
> > + * Mega feature: General Core features
> >   * Sub-category: SysMan tests
> >   * Functionality: sysman defaults
> >   * Test category: functionality test
> > diff --git a/tests/intel/xe_sysfs_scheduler.c
> > b/tests/intel/xe_sysfs_scheduler.c
> > index faafabd29..90d4ab8fd 100644
> > --- a/tests/intel/xe_sysfs_scheduler.c
> > +++ b/tests/intel/xe_sysfs_scheduler.c
> > @@ -6,7 +6,7 @@
> >  /**
> >   * TEST: xe sysfs scheduler
> >   * Category: Core
> > - * Mega feature: SysMan
> > + * Mega feature: General Core features
> >   * Sub-category: SysMan tests
> >   * Functionality: scheduler control interface
> >   *
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > --
> > 2.50.1


